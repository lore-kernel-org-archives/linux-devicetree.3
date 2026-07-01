Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0034107D;
	Wed,  1 Jul 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915821; cv=none; b=Bpc0ZeSlQOaBBSuuN3riSxEp5Gk9z94YmeNLts0n7XAf7bBtaGwzTVyfjqWELBoG0rYUqaa4nJsQDzpV/LwAbNH33lR/uIMKPAtdImdqUwLCfFYT+7sfNf0tin9WoaQxzd9TurPCZq5fid1vktct9y3X7u26PeMkGTu+iEmfmv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915821; c=relaxed/simple;
	bh=G21DPj6d4jyJuQ7RytvVaBtfBoiR3J0mPO/wf+30paw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UyC6JaEbU9he5DDraLC3JCQFBDZEWGas+3tDNVur2RusntKuEBuzKsY4uCvB3GpKRUVOW6IRp8g2lTRwYLSQ4l84D1NS2fNUgw8D8SIoLmi1AwZBJG4HJCaZzhasL12/Skae002fMgpVa/2rSu61d4Oxjr743LT5CgnLbVxzIEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzLT8/YB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzLT8/YB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241651F000E9;
	Wed,  1 Jul 2026 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915820;
	bh=Ao2e4oml9wyP8ZDiiFp/FwD87zl/XZ7fR7vvHotuJkc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=EzLT8/YBy4/tcL4Rg0lEVmwQyXjQbxJ/R1A2Rv2piwbsp6FOOAtl/tlWOPCYLZ6+H
	 iLNiwTVx2u5CU//oPivoXTEYzi0oK7Woa3UHg4MURm9TOb2TK0qzChygYJtdEJ+Eev
	 TaUJPYtJi03UxekA81CxgjXTqGK8l5rGtvFPBB7BIQbgkgVO+fqrxWVCjTDvMbOmm+
	 Iqts+D4oaIZgkENj8uXQxN/ki2aLO7JeWT1tYedFtFmiYBNxHxf55GXS0aEWy5VNOe
	 LbpPao9oFTkAIinQTEGFcZ9hF4mfQXk4SBqFf2XfV4kCOAf+kwQJ/g3sW8kbj2lJPt
	 y3qLXeLGaJ71A==
Date: Wed, 01 Jul 2026 09:23:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, kernel@collabora.com, 
 tzimmermann@suse.de, chunkuang.hu@kernel.org, simona@ffwll.ch, 
 linux-arm-kernel@lists.infradead.org, jason-jh.lin@mediatek.com, 
 airlied@gmail.com, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 mripard@kernel.org, devicetree@vger.kernel.org, justin.yeh@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-24-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-24-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581273.4115171.8214844308967079622.robh@kernel.org>
Subject: Re: [PATCH 23/42] dt-bindings: display: mediatek: Introduce
 Digital Video Output HW


On Wed, 01 Jul 2026 14:20:38 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Digital Video Output (DVO) IP found in
> the newer generation SoCs MT8196, MT8189 and their variants.
> 
> This is effectively a more capable block replacing the DisplayPort
> Interface (DPI/DP_INTF) one found in older SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mt8196-dvo.yaml | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 242, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'list' object has no attribute 'get'
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.example.dtb: /example-0/dvo@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-24-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

