Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D71350285;
	Wed,  1 Jul 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915825; cv=none; b=FCyPosH9Q3NSla7fe5HEsAY+uaCAgE7RBsALfAK0aQnrg/7Ph0ula/hzEzQUCIcPjdsWRagwCHNiJBPkzF8t77ePi0E0dnMVb9zCtdsd7oxsE3ZNJ663Y4j7ILnIUj5NnJcV4hTiLbQlkSH/QajSZyCHPUJK4LdUaV1YWnhwlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915825; c=relaxed/simple;
	bh=0tpGcZHT7ACd4SPBaLhLXekCZ6rJ9JYBya+HKjdoYQg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=a0e+A5AZTP1TEmUXdgs8IJ/A0i1s50qnJPfGCz8KpfY2DmWvGuDiZKFVRE64/DITnRxurYM4dKcciHozlUensEWfIZJj8Bb0Nu1tnoKOsg9I3HY0ZiZwJelLrG0gEIOM7J0ihbRNOw35jjsUfLcXEcO8tJuptkoyLxQo6kdPvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW81gr08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW81gr08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288F71F00AC4;
	Wed,  1 Jul 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915824;
	bh=L+MQqoMdTb10quuKjj21cquQc2SQagarqLqHoeQ9/rY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CW81gr08/6J3xgLYZqeMUjS5S8MAX27dufuEN6oZM/k/TED4PyD+vkkGZ5DmD5J1E
	 uZ49HNe3o4iDB9XKWBlELTolRsUaDMTt2jKlaHfXCFlZT/INQEHZXNozYwNlQsQZe4
	 JvKjXqzgOt0iq62BIusGQ+anmtq8f3FxDStbZNW5HbIHEIeOuqjUgZ4bgqauiZa3MD
	 9gWB9X1JR8kU37EUKr08+s4nmL363X43JW/sB2tjC3MQINmycor97RpJFo1oGicYB/
	 Zt0jNTBcVsnBh+bhF4RTtFBQTau7XUnFQlnezMZwBZDt7ryWbew0RO/wyYBoNrQkzH
	 bdtra1G8tBtPA==
Date: Wed, 01 Jul 2026 09:23:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org, 
 matthias.bgg@gmail.com, mripard@kernel.org, jason-jh.lin@mediatek.com, 
 kernel@collabora.com, devicetree@vger.kernel.org, justin.yeh@mediatek.com, 
 simona@ffwll.ch, p.zabel@pengutronix.de, tzimmermann@suse.de, 
 conor+dt@kernel.org, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-39-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-39-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581802.4116105.6915436352274822148.robh@kernel.org>
Subject: Re: [PATCH 38/42] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor


On Wed, 01 Jul 2026 14:20:53 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Two-Dimension Sharpness Processor, or
> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.example.dtb: /example-0/tdshp@321e0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-tdshp']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-39-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

