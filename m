Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADC3BF685;
	Thu,  7 May 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146847; cv=none; b=CnQ5ELebh5GFHH+f487NWQ81r4A4S2KhAMsS2JW4cdNtXhVBqoccYb10GmJe67jJHtf6DgYZLnKLmWrP6VIv6G66Gw6DpCWZVGgUlc5+Vnu+vu4gLNVr4HuQ5yehPMqVkn91nNAkFpAPiwk4L6Pd6W5hbOXGVFhkgUNhKDY1Y0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146847; c=relaxed/simple;
	bh=fE5ye7bjFVeKys4V2lVCXth4QLCgpzqQ5+afoPzNXrE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gZ0tk1OoeFSIKvdAUoO6CfgY9zJd59EnlMNsry3ciSs54g5vAOqToZkT5MvbxFhGwYonpSEXOEJxDE8nV/wTCvoNRDFTQEa3OPOvkC6m0gUA9106BKll8G3qW4gnc9JLMofX3U7SxXF7bzOy2hfRWzocw8rJpf9hjrHlW7g/NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akGIsCzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akGIsCzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9984C2BCB2;
	Thu,  7 May 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146846;
	bh=fE5ye7bjFVeKys4V2lVCXth4QLCgpzqQ5+afoPzNXrE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=akGIsCzHgCvyMJ4OmymOKUoABcC5Hko0+caBmCzbnGzKopk1ev/Xz9okwMtaVAjo+
	 RmnG3NBCjjrKqUSFi8Gt3LS1Wa9/HsgfA8AqMOVs66QKrbu18JzSvQOls/04y4B8OK
	 Fvw2UYHt6R9lOzqo5rfySjrWutdOX9ad6mRtHkl11FiFn5XLXC3cor6Gl1Wib7o8wB
	 Dfnf6qLH8cCqPubos7T2eWixIm1/ObXJ19MyX13VLBFutwRhns6MEsrye/8yfHEVJJ
	 WMSsro3dmitrs6R+8IfiZmlqBHELxmnRyLy0x79q9eCCcaFuzgV1wu9GY8a5xZKVSs
	 4ne1f1lj2F4Pw==
Date: Thu, 07 May 2026 04:40:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Message-Id: <177814684471.382497.2929713039282886067.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property


On Thu, 07 May 2026 13:37:17 +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
> 
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/qcom,scm.example.dtb: sram@14680000 (qcom,kaanapali-imem): 'minidump-config@1c' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

