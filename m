Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB430443E3E;
	Thu, 16 Jul 2026 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226096; cv=none; b=Nm/WkwspgxBZqbh8fm1nNxQno+SHg00EoeY6RHf3ofnKjbPGJdYVQE6jYPL19IAJtn1FC/0XDpmfQC56vpuFhkvBXCXvKeW1Dt3Q6Rpv1WWa6EuEmLy0MrjSit64o/gOZblN0WSBWgxiG8gVb1aySeifMksgWH0WSE+IU+Nw2fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226096; c=relaxed/simple;
	bh=yng+j8nRhJ3VdWTrV4gSk3ARd4UbfREA3jdQyGaWx1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CY16WverQgkx59pJCEiY8KzL2wyxA31ASuFV4sGSNcC9x3j2fdS6oUdm5fwi2praCEaKkaRXT9qTh+RlNAvkfQQIg2JKc0vyaK0XQjG4nII/eSpTwL3t9GdzIK/jOEh+HQ0ttFUNAXvzYu0mMYcefnAKCBKNHrttomspF+ttXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=E5KGQvMI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="E5KGQvMI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sTarYRorlM/Rn7cCaR7+b+Qezl3OqBStgUiS/lo6A0M=; b=E5KGQvMIP4P9mjc4QniEKE/KJE
	L4EZstBq76YnlxNHjH0Nzcd/Bvfv7K4sgAcnnxQyZ7zVvDkPNdYU+t1FhJ5eUW1w18iKN5JGgQ3TK
	NJsRrtlsb14w0O+f9kb9L2wUbSbuVh1vb13Y95nWCIOrnSFlDh8mrRMU10VUlTjQL6C3RozK4q8cz
	Q8whSV2xEAu0SWxOA6gnYaND+efwyuLPsfgSME7owvyoIrsL3/YQaiPxLYs38FhPOcHxHeobkm660
	XlXVely8/20/eOtM3ipCEjT0r4xC8LKwsu/yDXGbSeSXps0Jx7SH1zcxaQQX0l6zdN8jPqH5up7YD
	yT4iKGnA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Thu, 16 Jul 2026 20:21:15 +0200
Message-ID: <25132193.ouqheUzb2q@phil>
In-Reply-To: <20260714054653.266842-2-hrushirajg23@gmail.com>
References:
 <20260714054653.266842-1-hrushirajg23@gmail.com>
 <20260714054653.266842-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 14. Juli 2026, 07:46:52 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hrushiraj Gandhi:
> Add device tree binding documentation for the Vicharak Vaaman2,
> a single-board computer based on the Rockchip RK3588 SoC.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

In v2 [0] this got an
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please make sure to cary over such tags into later revisions.
B4 caught this, so all good for this, but please keep this
in mind for the future.


Heiko

[0] https://lore.kernel.org/all/20260628-retinal-ungreased-4c6d45e3596a@spu=
d/


> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index b023d4cc9842..b5a43fd5e546 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1311,6 +1311,11 @@ properties:
>            - const: vicharak,axon
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Vaaman2
> +        items:
> +          - const: vicharak,vaaman2
> +          - const: rockchip,rk3588
> +
>        - description: WolfVision PF5 mainboard
>          items:
>            - const: wolfvision,rk3568-pf5
>=20




