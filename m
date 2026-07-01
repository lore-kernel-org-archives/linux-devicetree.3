Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ABA3546E0;
	Wed,  1 Jul 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915826; cv=none; b=OIqU/ZoU/gz8CjrK/2sfL+xH+/Cco/VUUMcyMTu/YgRr62EF0gt1FFYXP5a6taQm8D72z8qg7GmDJOtPRIrlJOSASHH5q7wBsZD/0AOWL6MJ5ZhDR0T/NLNTt+kNgiJAjVoRCFIbMFl2HHfWC7YhP2O0raGN8dEh3lcV+Y8w2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915826; c=relaxed/simple;
	bh=jcyAe/i7l2WXLwr5I64+B9bhRfdjsktmMhodAMxmk+w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=few5gBG54m3y/SMemq6EDEAoMMLJ3Mn7f9KeS7bBrS+GPv5eADi6IFqYlU7jWrjO2A7cYeqE3HyUgqskNnGR2xu6ekwCuMAavs6AdHO9OHUc0vVFjlZ6vIZ7OobTvv5PmmKqnqn/bv3VoGWfFfE8EUDDkhbjiVvE45mlJjouJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm+ezxjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm+ezxjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF011F00ACF;
	Wed,  1 Jul 2026 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915825;
	bh=yM8HcAoywZQROnbGbiMNPlQQuS/3De3vvYBkNdJ6Ssw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=dm+ezxjK6+6YX6PEsusjTDfb3QpL0aI6bc4m2j4IIuhZcA5kuFU5OmJecyRnYSudt
	 RWt8/QEs82rbWzGasUdJzfrtb0tGuMGTH7qlNqzeeVDtRdIVgPeB8s6Vf2id9P0x5c
	 YK2+LemCD/pK5dDwILNNRHzfaaL4ySljWEmvNGzLtN+xC2XqhUuAWJLCW/OMvk8ZG5
	 Ucq8jv5gUx1IeNk6dkBdwaWSx2jPISueSh/HQ3jUMsLjKaCMsuNSZkTNdkRdeoxRQ3
	 ouvVvXC9pRjlAbKM3+Wq2JohCdCuNVni31Y0PjWBiMZbOtnSpKIuO2HH3A4TIgfqhf
	 pbKgkUNtjcL8A==
Date: Wed, 01 Jul 2026 09:23:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, 
 tzimmermann@suse.de, justin.yeh@mediatek.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, mripard@kernel.org, chunkuang.hu@kernel.org, 
 maarten.lankhorst@linux.intel.com, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
 jason-jh.lin@mediatek.com, devicetree@vger.kernel.org, airlied@gmail.com, 
 simona@ffwll.ch
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-41-angelogioacchino.delregno@collabora.com>
Message-Id: <178291581931.4116323.2079243136968676585.robh@kernel.org>
Subject: Re: [PATCH 40/42] dt-bindings: display: mediatek: Introduce MT8196
 Image Resizer


On Wed, 01 Jul 2026 14:20:55 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Image Resizer "RSZ" Scaler block found
> in the MT8196 SoC and its variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mt8196-rsz.yaml | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-rsz.example.dtb: /example-0/scaler@329d0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-rsz']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-41-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

