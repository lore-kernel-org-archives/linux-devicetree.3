Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7E34DCE4;
	Wed,  1 Jul 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915824; cv=none; b=sPPPZw49pkiX1R8wNSH8YmUiHgEmNI56ediRPsE6ReGV/3jQ/5cmxxhvKhp6KHOIyEY4+jrx8d9T0R9QE0yZNuI0RfjVtToJSbsQs8t7ThwWGOiYAgCKh+EPgRTrKHBcumuoMlnBTpsNCOX3k/Fdn9fuwH1BYTaIq8VguHgHCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915824; c=relaxed/simple;
	bh=85UJ0vPRwH+wxYXHU/pyra4uJUcxwX2zXitAdzvXT6Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CcvZyc9iD2SvRSzMn+CLtURnu8Gku2hGESW5LZQs5cFsTbFcJ3gbMWkt5JL7mtKcS82HJZZSRzyix26ij+Kfa6a276H8tksxk2y8vWgXL1xpyVv3oqVdEktKaftXIj2JDORqK2tQuGr+C8pJ6t0sB8GcSp5XWghE6leS8c8t/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxVipIBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxVipIBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABAE1F00A3A;
	Wed,  1 Jul 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915823;
	bh=2V+HjW9ElpL7ECEz75a1IxwaSKDSfgglgGt1uUHIBkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FxVipIBSl0INiw/d1Xggb98V51/4xC143q4iV9rZ0QG7aioYir5bE962k9UeD6hpA
	 RlAlKvZP2g3SjdoK0wfba3WhzkxuI468VoorxjoCcTWyXVS2QAESISITshdbGvw9lw
	 ls9Tgdnea98jtyn8BVJOpiSNXQqIiWHfJGAZg3O8tTsuqcEhhUhjs7LvESd8hZPIP7
	 rQf13gt9oO0D1lzYT10zH8eyow4pPJjoeDP2HAc7Dpuvasp4O0RwCDSGrrfaxSCJ0Q
	 mcWhuNMev9EPn1rye/U8i54imcK8BuzG6Kjcoa0/FCqDKWRB7KIZxd6CPZnHHXK4M9
	 fHMNoNsRYcLcA==
Date: Wed, 01 Jul 2026 09:23:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, 
 jason-jh.lin@mediatek.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, conor+dt@kernel.org, mripard@kernel.org, 
 kernel@collabora.com, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, simona@ffwll.ch, 
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, 
 justin.yeh@mediatek.com, linux-mediatek@lists.infradead.org, 
 krzk+dt@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-31-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-31-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581667.4115901.7713251613629751021.robh@kernel.org>
Subject: Re: [PATCH 30/42] dt-bindings: display: mediatek: Introduce MT8196
 Output Processor


On Wed, 01 Jul 2026 14:20:45 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Output Processor IP found in
> the newer Generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.example.dtb: /example-0/outproc@32970000: failed to match any schema with compatible: ['mediatek,mt8196-disp-outproc']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-31-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

