Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEBF30648A
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935314; cv=none; b=YzQhfDWBOfEEgtud7+ZZNsipg0moYipiNdp7+Ghhay7op/xyw61Amw/PBe3Opop9gPvRCAyvlsP6kn1kFaFPcdO/KpdPa2p2Abf7c7J1HjMs+Ft2GYT8NNfueWeiqfUN8GQ4rXO+UufRNS4v2u/BcgjoI5juNDTEAp3ln6jUAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935314; c=relaxed/simple;
	bh=uYafgBDc4WEjuXohm6hvbshSIPL2XPQptSXqJkiZvW4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cijDoZ2tZcIZxXdZZ3RgAyyRDR4ik0LMp/ScMBXB3RYE8d6hnmQ49Pf4OawrnAxQmcGIWaDGi56tYueI1OuWXh+4eVvD3V8CBwGJGnMKT78xe+tAhk9EHcmDM3H40EdOK96w99ZHihfcof+VG4t690kUaT+GeIeLqgscsS2nKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBr43OrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBr43OrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD969C19425;
	Sat, 16 May 2026 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778935314;
	bh=uYafgBDc4WEjuXohm6hvbshSIPL2XPQptSXqJkiZvW4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bBr43OrKVxmHLhzjL8BPK46Q9NRIOnq4JbrF9ODqS1yZZs5bg/xePiRcXC5oZmlTb
	 0Agw0sy/cYmzOARqeAYVv+8V6Qg6ltR44889O3d83yh6yLTA63ZoSWDEsJ6/hvDQh7
	 24ZQZPP1cKGnIsReS3vaGVCvAyw36LeDauE1bkkjNr6KEc/QtDd/tjK9qFEEYXbpyF
	 1yvDAsFNTT9aZm7ztrxO5a7ylHRkf/EZVtHmf1CSPjQm+Yi16luHxJM3DwHyWP3SaW
	 qetMchGxn1aXyH2lov07umZI+kAL8sUUCvBfqavzDmQw05p0ZRFXL0RQJA7MWF9cg3
	 fpeeOGrUzZGyg==
Date: Sat, 16 May 2026 07:41:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, simona@ffwll.ch, 
 neil.armstrong@linaro.org, devicetree@vger.kernel.org, tzimmermann@suse.de, 
 mripard@kernel.org, conor+dt@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, sre@kernel.org, xsf@rock-chips.com, 
 krzk+dt@kernel.org, jesszhan0024@gmail.com, heiko@sntech.de, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com
To: Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20260515221947.299229-2-macroalpha82@gmail.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
 <20260515221947.299229-2-macroalpha82@gmail.com>
Message-Id: <177893531159.3189712.12987656927149699382.robh@kernel.org>
Subject: Re: [PATCH V2 1/6] dt-bindings: power: supply: sgm41542: document
 sgm41542


On Fri, 15 May 2026 17:19:42 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Document the SG Micro sgm41542 battery charger/boost converter.
> The parameters of input-current-limit-microamp and
> input-voltage-limit-microvolt are defined as such since they are in
> common use among multiple bindings currently.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../power/supply/sgmicro,sgm41542.yaml        | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
	 $id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542-charger.yaml
	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260515221947.299229-2-macroalpha82@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

