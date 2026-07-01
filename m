Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489E342515;
	Wed,  1 Jul 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915822; cv=none; b=EC3vLWSXLDl4ZBzO4I+WvHLozSPUoe3ieZXquYuzwYFBtBiPNtCjmrZuJIf5uPXj/Xc5PJJlMPwWbNNqXvgbh3qu2kWzpjw1PQizjcPPoKdeiXlzapSAM4xpcQIDVtj2q30bv2CNL1fHFI3yAasKnWAZULQaekWaDz6MtVyM6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915822; c=relaxed/simple;
	bh=JFpeuXrkah2v1NY2a44knGY5Pn5BiKkdmSQew/oKFEY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nzTeYZZkJHyXDYiQu1+LIkEaMEE6ZdhcFxN88OHE7RcIQ4tDQkFM98MKZKSLiqKMeMbGq87EJLpWm4fdUUft3ncdb1VDm1UP0dBSwCf37Buq5HuKf++9WjoPMauk35idV5ZvufzBV8zoyeP1hIOluivKYg0ZfUHr81YlZhLRZIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXu1vrz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXu1vrz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A6E1F00A3A;
	Wed,  1 Jul 2026 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915821;
	bh=vO42L4Nhds/UY8hBhbxFlSZhqARnmHdkd0khHdxgnL0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XXu1vrz/uoxgB8k+hjRFdEMGiRBbgvAfLsaS6LP4upp3R/hnCeY3vnun0hH4M2J3i
	 dnJorz84lT1WlwG30bJ+ymKpIBBPgX/THKqo1G/IGn+G0i9jD9mtPrCy5zuMBKufki
	 7Euj6/1WB1uKxhMaooav9Nwd7JeFw/b0c7dWGFFrjLVoGxj3Vr0ew492o/QC/xL6hu
	 4I1UVBHQYrXavbe+zUIgY1FNqn80aLAOicVje1RalWMjqINqGdYtNhCkZ3YnF1EmuY
	 XUPr+0MA2WRSX7kDTW1AUxs5sQ33qr5PLcZlv+eyVucyz77RCahVgDd8dxmO3IDYQP
	 xT8QJC5SUGYzQ==
Date: Wed, 01 Jul 2026 09:23:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, mripard@kernel.org, conor+dt@kernel.org, 
 justin.yeh@mediatek.com, devicetree@vger.kernel.org, 
 jason-jh.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 simona@ffwll.ch, chunkuang.hu@kernel.org, tzimmermann@suse.de, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 maarten.lankhorst@linux.intel.com, p.zabel@pengutronix.de, 
 krzk+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-27-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581411.4115410.14754664533277420399.robh@kernel.org>
Subject: Re: [PATCH 26/42] dt-bindings: display: mediatek: Introduce MT8196
 Layer Blender


On Wed, 01 Jul 2026 14:20:41 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Layer Blender IP found in the
> newer generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-blender.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.yaml: properties:compatible: [{'const': 'mediatek,mt8196-disp-blender'}] is not of type 'object', 'boolean'
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-blender.example.dtb: /example-0/blender@328e0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-blender']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-27-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

