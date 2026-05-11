Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FAD346E5E;
	Mon, 11 May 2026 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492987; cv=none; b=sK+56ahjECHMKNjeLcgOygQMz+yyXgmqUhEuD2c/gRhDZJ6+6huPKxqWrLcMJgrcvJ3+gIeg6A0g6mm5bQX1kfSCL8XtyWAm+82cA4G013YCr05YX8YxCFN4xDAabwOIyW/s9/ayRLOENRm6WYswAesDSuNQVf/cNdeWAXsDz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492987; c=relaxed/simple;
	bh=y5DSKdKa37aBlgtVU8TQCHisc72vONuDAdNEJjEkS30=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KrfE8NcpB6norVN6BCSclT4WbNAZg/LTH4fbT+QMzKPp/QF/OEUdRTsaMJgEAumaqQs9o/e6BNvOhmWOZwRFdMzw4JvgKW2+ZiTT4ZEJgCj7JJyeNjTmx06WmFu3GCqKOsDiWzR93qMdoOfoGxGSR3yEgA4QkHJM0OqdTAMcOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L97yCQn4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L97yCQn4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDEC2BCC9;
	Mon, 11 May 2026 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492986;
	bh=y5DSKdKa37aBlgtVU8TQCHisc72vONuDAdNEJjEkS30=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L97yCQn4V0sBM1wSVEzW36yrUHOpUbdkwS9k9T4P8TSIgrlSvuOP2Jx8RyN7Q8e8o
	 44dI5MJ4jCGJrE3nEmNavNvSIXmLyG95NOxHF7Ihcffb1W7G9tyyLxiEwgDu3D4nVT
	 qG9AnMr9AC6H0Nx/y6NiPwLCxoDyBFff9IK0rUwr962OEoaVT0HRjyb0iV4U4rfaoL
	 6GPWUrPdWcMS6afSUfI9yS795wvh1IIM+XZAzD++XYEDNtElvYrm514GWC0imfzqrX
	 1QH5SFpyAldi11MH5tvHYqE6OyFU/t+KQ2lMwhoFc7uTOm+YyhDEv0PUJKzLWaCLZK
	 Xs3Nlqeol/ZqA==
Date: Mon, 11 May 2026 04:49:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, devicetree@vger.kernel.org, 
 yclu4@nuvoton.com, simona@ffwll.ch, ychuang3@nuvoton.com, 
 tzimmermann@suse.de, krzk+dt@kernel.org, zhengxingda@iscas.ac.cn, 
 schung@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260511075142.54752-2-a0987203069@gmail.com>
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-2-a0987203069@gmail.com>
Message-Id: <177849298427.1066847.3849705835228409800.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize
 for DCUltra Lite variant


On Mon, 11 May 2026 15:51:41 +0800, Joey Lu wrote:
> Extend the verisilicon,dc base schema to accommodate the Nuvoton MA35D1
> DCUltra Lite (a previous generation of the DC8000 series) which has a
> different clock topology, no reset control, and a single output.
> 
> - Replace the fixed clock/reset item lists with minItems/maxItems ranges
>   so sub-schemas can enforce variant-specific constraints
> - Add a 'port' property (single-port alias) alongside the existing 'ports'
>   for single-output variants
> - Remove the mandatory 'ports' requirement from the base schema; sub-schemas
>   shall enforce their own port topology
> - Add a 'select' stanza so the validator matches any node whose compatible
>   contains a known Verisilicon DC string, including SoC-specific glue
> - Relax additionalProperties to allow unevaluatedProperties enforcement in
>   sub-schemas
> - Fix a minor whitespace issue in the port@0 description
> 
> Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1 DCUltra
> Lite display controller:
> 
> The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
> controller. It is a single-output display controller with a 32-bit
> RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
> chip identity registers, does not support the CONFIG_EX commit path,
> and uses dedicated IRQ status/enable registers at offsets 0x147C/0x1480.
> The clock topology uses two clocks (bus gate and pixel divider) and
> does not require explicit reset control from the driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94 +++++++++++++++++++
>  .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
>  2 files changed, 131 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml: allOf:0:$ref: 'http://devicetree.org/schemas/display/verisilicon,dc.yaml#' should not be valid under {'pattern': '^https?://'}
	hint: References must start with '/schemas' or be relative to current schema's path.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260511075142.54752-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

