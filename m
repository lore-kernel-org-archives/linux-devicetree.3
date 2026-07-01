Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF24299927;
	Wed,  1 Jul 2026 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889057; cv=none; b=RvQ/XYlg3oHa0reDG9ol6uNEaxa1v8vxn2rSyitWsJSHJCg6tz2xa1hpi0l0387kZjcQUG0I+3LNiH77s3nFEH6eNacp+MuOvNwUmKWT+u3vHOtf78fL+V54I+y2osxO1+2DUEzKIXDuAgcppgkdBt9lQP04ixjxW1JwOKbtzaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889057; c=relaxed/simple;
	bh=rnV5HhhWP2HaifQNL1vvC8C3/Zy1ziB3PLME9igrVzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/IoG9n8rB31qAcTC4djHB1Tu3PbPTPgXvPNOF5fCqYCgttsjPmh4bhop/ImUJM/xIAsau8L+GJZwO0gPauUXdGWdPJ2F70TKDGdEk4DfGosFLyhcCLbC5voA1FsCYALLi/7qZBtUT363fQ/e95XmDxwkmGw0URz99GsS4f7/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eardjtRk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eardjtRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0597A1F000E9;
	Wed,  1 Jul 2026 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889056;
	bh=S/Br7n8skDAshjgKN/WmFTTuKkr1LxKAT3b5k1fkpvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eardjtRk0tVHOFgzGFet5eWB/jfl1S/rTNInUeK5BXbYMBX/2j8MFCLN4w3XLb3sW
	 MMTnLPihVbBVf2aGqidO2l1HxExbbjNprWS471p9MQpxyEddgh7EHPIhpwMkC1slxn
	 jyRZGPZJJ21xbvh1qHqnYJ+r9aeP/KOpk7EK4CrKuTHiKMU+MF5o9lNsr6dFjKeLEi
	 Hb54fqmJ16O4fQgeZKcm6Rz3A5OtXFRrGhov6KiBQgB79GN5r+djfskdHUz/lnTvum
	 RlVyBYrTLHA/Vo/qHApjH1RHRXcteS5FW5EwfQTUQ8S18FHW1NnY5CsSJdXfyqfXhq
	 sPM0Hio/kaN7w==
Date: Wed, 1 Jul 2026 08:57:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Message-ID: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
> The TNOC compatible previously only allowed the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
> AMBA bus.
> 
> Convert the compatible to a oneOf and add a standalone
> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
> standalone string carries no "arm,primecell" entry, so the device is
> created on the platform bus instead of the AMBA bus.

That's a Linux driver specific reason, so not a valid one.

Describe the hardware instead.

Also, you do not get other compatible for the same device.

Best regards,
Krzysztof

