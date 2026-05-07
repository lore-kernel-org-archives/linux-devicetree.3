Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2023E6DDB;
	Thu,  7 May 2026 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154048; cv=none; b=N8ELvIeJGDulVP2r8okUFOPDgqqh+4GLSQVSCjfCYbVjoOIJ2pC7SZsg9/qvgDYn1M5aIYBtR+5cLqPz0daMlm1XFgwoXs2SDA7NqnjurLgMVQJd9/K+s2CTwYDeyOm88bOqdcLEtvKtyW0BfOC2Zxi0VcLvKLaFZCmaSDowBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154048; c=relaxed/simple;
	bh=TJWUtU/B4OkyELpJbxS6if+1DPj7/by32/molYRV4fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jom5wcUMVG05euaf273AYCd5k7mpIeF/nL2ZmwDaVpwOq+/Mng+2DlfCTADbsR/YhRPL9uZ2yLh6VXQL9VW5CjcRccYJqfzlvH6TMopQqBxtZ4QGz123ymKWEBtzItJDntGthbuwquVgStFWlAkYuiqAISneYyzNFugl+p7tnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uZP5i3W2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uZP5i3W2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WLd8tadd6RgVQITSoROvnyWzRDgtw6k0fr0kVxewnoo=; b=uZP5i3W2+KimMtmYaSf/uCvKZV
	KEyBd0w83gRrX+PTidaEPIilv/qhe62UYI2lAj/K0byTUqyJbwrGo2gCcbCK4LPkVtg6wPs5ftYjX
	ozIbvqSh9uiA3fJ7f0VEp4u7jKiOczy7T+68cEov9WxUeFFsjwT+ZB3nFSwLA6tOoN8tXLo6FVRtU
	QGTTbDH6fkRLN7I/FE/0hdXG3WlkRH5cabBBT6Ik3cyVaXKP2AIYfax4nTSUkKy3LdLnNDKF2StmK
	NdX1WdSgOYlF8/0gtt7OVnSyZ7jSgNyGIsqgHIa8XFIZ0Su/0YfPFQBRuI5NDdMq9IEmEASsswJYs
	o+u0eUSQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp: Expand
 clock-names "hclk" for the third clock
Date: Thu, 07 May 2026 13:40:09 +0200
Message-ID: <6496645.8F6SAcFxjW@phil>
In-Reply-To: <20260507112948.1115003-2-damon.ding@rock-chips.com>
References:
 <20260507112948.1115003-1-damon.ding@rock-chips.com>
 <20260507112948.1115003-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Donnerstag, 7. Mai 2026, 13:29:39 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Damon Ding:
> The RK3588 eDP controller needs the video datapath clock "hclk" to work
> well. Previously, it works without explicitly adding this clock because
> the 'rockchip,vo-grf =3D <&vo1_grf>' property implicitly enables HCLK_VO1.
>
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add su=
pport for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc5..d2bc8636b626 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk

are you sure about that?

The edp uses the vo1-grf - so what enables its clock?
=46or example the hdmi controllers on rk3588 also use the vo1-grf and
explicitly handle that clock.

So who does it for the eDP?


Heiko

> =20
>    power-domains:
>      maxItems: 1
>=20




