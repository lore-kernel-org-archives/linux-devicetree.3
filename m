Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78834C140;
	Wed,  1 Jul 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916732; cv=none; b=DCXi2Ry/BTrCfqSJ3cGS3PwYJNPxyOAugbb86tuKiB8/0eI0dhj7E7fNZqJ1XukFmoIPJYHUHBKci5Z8oIK/vQSA6UmI7pvL83GeuJeUk6zJnRMp1Ldiwo8wZMgj2vuxmIbN7RoNtQyK8W36YfNfvrGr79d93K6ypeAaNWAxeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916732; c=relaxed/simple;
	bh=yzRKbSUVbKg2djvPtyoy9fBJPb9029uBSoNo3kArwRU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Vu6YvuHa8O6gCSi/fsh9xlexH8zietNAWiJnm6l3xFPp1p2hvCNtqyLZxFZ5IkK/3W6AHDK/GSnGMLs5PoFshxyr/LD4iLcAREh8xXYd/eyE+jTHiLio5k8Q0JZJew4fYfH6GrgWae/O859D13VqyS54CMTq49fUzG8YMFCwc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePjixhTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePjixhTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EC81F000E9;
	Wed,  1 Jul 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916731;
	bh=DoAPIKHlQF01BQdUW983/8p5nb/vO5Fh5kJQWUG/dxQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ePjixhTP3XZgrzhZdeHkU+VCPkYuzgpl2DzTg6EuV5D7zoGrCxE0H4loNSi3lbqPB
	 MNpNB+p5gzVEaG47iCyZ4SXEN3tuV4PQXnjqaJqWIoWDU+CZVLWoKOQAqOeyVREenz
	 0znKSxkVXVcTPQm9s0hgMVON/QEjwg6v+AEr+0fusTrOfe/Uxlg61jXskQP/77qw5R
	 4MD7BSMdgHs0ENBjVjyKjrkouPznJtTI3qYypogcwNTr1a+0ZAzLGizfVYHGO5NT/G
	 mKHNPd3iTm80lkGSARlqEXZSJoWXuynP0L5f9lodG2UxDokboZhdPa57EWFTKPbzU3
	 0jk3Ld++wS1Ww==
Date: Wed, 01 Jul 2026 09:38:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, 
 vkoul@kernel.org, chunfeng.yun@mediatek.com, linux-phy@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, linux-kernel@vger.kernel.org, 
 neil.armstrong@linaro.org, justin.yeh@mediatek.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
Message-Id: <178291673047.19807.6106947084460440701.robh@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs


On Wed, 01 Jul 2026 14:19:57 +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort
> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/phy/mediatek,mt8195-dp-phy.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.example.dtb: phy@1c500000 (mediatek,mt8195-dp-phy): reg: [[0, 475004928], [0, 8192]] is too long
	from schema $id: http://devicetree.org/schemas/phy/mediatek,mt8195-dp-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701122008.19509-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

