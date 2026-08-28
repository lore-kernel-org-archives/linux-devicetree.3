Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742483AD537
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909757; cv=pass; b=L0jwt3FtiuiroByhCMkmzKnr/ofnQ1PiiLKcjDXU2M0CaqSXc1jMt58sfbP5q5zyd6i0BxHbGKeIycAPGDl32VcnnxAKUzM/wiSJa0q97srQv6FXP85KPUPa9dZ464GmSTiZrf6NxL8zYmmZnCOFPOQ17KyRYUqMp2NMUMev8o8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909757; c=relaxed/simple;
	bh=j7j2ZSbXQ524pa7t9YjG5WIv3zZE05ie/WonynAPrx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7Rvge8lZKGw5DiKEGIhcmyB/LMMhAMzGEvA/QBt9NCjeitJa+bcNO31vRShE2l5/SBWkRZeQkQTA6Qy8Xfo9oRbqW44acRvR+FVFdQuaYasz64F0lMcXtDz41ItsXn4SjVUNH/e8HmHbCsfiwvSzjR7dVKHv8kmeh0SzSW2sOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhSEXyqU; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhSEXyqU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a3ec9ef8d4so116375a12.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 02:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909732; cv=none;
        d=google.com; s=arc-20260327;
        b=Pj6at9mPPX5rdXCh9Ec16JiAa3skdJIfzzzIFSa0yhyuwJp+tMVwnNBnL7qgMoSOAd
         iwmF2oEEZ8ykt7/IgB7KuFX7PWXyRNqAv+F59uzfpLIdvt4aclwgaW3tTjHI6/aLOxv1
         xllOL3TvbCB0UJhXiLSVz39HymI0Wze/Pd/EMvBKOdwblBEWKBEmU7ptJa5eIr9A6iSQ
         dnEJgsET77UKAs99YT1A8rSn9U4PaORBiEpQ2f0k3kqaGtbCVyClSANAtc0Vgjr/8Y6d
         brQw77lipbSGQyt1Nltqn14T8I31mbreX1d1kY/KWBtFdvWftQTnbnLXwEZpTg3Qa1TN
         anng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        fh=kslksMSLDYvAkIYipB1/AHbRp6/ZgTfW64HT/KBMCfU=;
        b=fGDqkUuKmgrbea+ZRyBChQrPvjrz3I3XXxBNBNayngk9TQlLmM/vxs42elHiOgEKmE
         M5Fzvu4QR/BJxsH3NaZQyL7BYTA+sUklgkY7PaezT/+p+1JUyljwXu4HDPgN+yUpNCi/
         WQUQR+d3AbazOaF3/bJRphl2QH5jg/8OCHl5uyEw7vUWAES3ExkTZSFS69svkf3lQ9bv
         dgxVY5RwhI9XuT1bE3HuY6VeswQIpyK67P+5+KzPiSetjRMuLnsjeGA2lVeq/v7Y2aE4
         qrLGLfXFp5l5IkFcDqXJyZ/+yN9zIb8FIZEhVDveH6lj7l3I7iB8fRjhzGKWfJhDiqp0
         ec9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909732; x=1788514532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=dhSEXyqUMV7I2YuFjPV2piNHlS+GIPOp6+wcDKwLl3K5Cxs3gkS1A4XIe0Ghe/aX4Q
         1g4c5S4FXAelPc/ci1crCYJ6c3ajLTcp6cg45Ct84EAfoSt7dvTNVi0KRBdnlIWBEdoq
         iApVVxqb4765QxyGTW3l0OcMV33SQtW6RqBqVnagki5el4B9ZDbpMC13jtaXx3ej/Qwc
         nhohvdDtjQSZuP3h7odffv/0yAq5lA4FHewmcXc4s9nt19Qly75P9Vjn7mdEEGCRTiYr
         wRsMjrNc5egN5c+QsG8aDEsT0yhqG5WuZVTGiRPEUOWpXubhFI6WYp5+OFmmNvK9D886
         0cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909732; x=1788514532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJFj2Mb1tcu0hhCa3Pj1XQFswEEME5NPfKvSiT9UvA=;
        b=SlUoQUlM59gC5gIaUSHKdTUe6OuBt9bhSKh0kVRUKW/MRSgyvgewerbp2i4dEbc1TT
         +3qDYva8D1kZx5ijVVpkTRLKbyRXcm0xrAJBHTHXLm+RGEUpGuz6usUDO+GWL4YFY54p
         MKIcEqdJAfC4ugtbwIGCVLd6LCNn6Yl5JCS7hHxUwuLQwYnwtf/x42dOEKuiWGbo7yXm
         LBwO23MnoXLBDmObZ9b7gJ1SMKv3PcMxZLFndKwkUnOBtTC2WPCpdWbQJE3/A6UuS/Cj
         pWikj+ybezJiNt/dtq+ThO17Dn/QsgNCS7upSP4UYSaRYjbaQLl5+KNiqe15Xe3oPHfX
         WMwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Pigvz+FKOoQPBc7eFpis0S+RVMMMl0gFXWoYkS70h7/BvrTvvekoKCgWZXj2j9hVYTd+hJO0NVeN@vger.kernel.org
X-Gm-Message-State: AFuF++m4edGt370m3t0W514k6Wx8C+8JtiuczJSZP9NAJWDvAyOERLA5
	0TMhaUgLzAzwq+cxRVIplnzk71gnv2GJrzaFjcSJZT9dYSkMfez4voO4qwts+VyU5tjaVfBfuLk
	stBlmFBN/SOCoMxPyf3Ad3O04CpOfyBc=
X-Gm-Gg: AR+sD12S1q7KdQTkFFqb+kMXLR1ULXVqJrIR0PQlEJo4jC50Hyq5AmXCv960ct2+sSG
	wBetOUY103pXIoZUbY5JjwWdG+SM/S8KaOImvFVcxK/VoEfawslAu60iSVq/g+Rx+aVnasHuXq8
	xUp7ZdSGG3nB/euRG6pxL+omfxgKwrf5CNv/7uMB+8mKWJFNfpMADFHyWEjEGuuY2+6hBP84rqk
	QwZl9ORwE0lh6xtOgqqW4yMf6p9Qy0JYZJZJRNsutrAQ0enROtJ5kYV1OUd4WZz6q7Nht78i85E
	hmBVFm0qQbhS63XgSm5g3K5Pe07vgPTseIWb1SSF/sjdDQj5lN+Rzw==
X-Received: by 2002:a05:6402:541a:b0:6a1:de1:f739 with SMTP id
 4fb4d7f45d1cf-6a60d36a266mr1562286a12.2.1787909731660; Fri, 28 Aug 2026
 02:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com> <20260827-thundering-cream-saluki-dd05df@quoll>
In-Reply-To: <20260827-thundering-cream-saluki-dd05df@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 28 Aug 2026 17:35:19 +0800
X-Gm-Features: AcwNN1VURP6ewJ0HD0VNfWu9xGoJtKmMhy7y_I8d0yGNeVN7oyHoitKsjPfK980
Message-ID: <CAPwA33K+XSRPDzv9xAcoPneUsp6A9OTwakJ1VJY=zXnHiH+5Wg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review.

(from the review of 2/7)

> Please link/show the upstream DTS using simultaneously transmitter and
> receiver, where the consumer does not know with whom is it talking to.

I grepped the tree and found a device tree that has simultaneously
transmitter and receiver. In the arch/arm/boot/dts/samsung/*,
exynos4412-midas.dtsi enables csis_0, and exynos4412-galaxy-s3.dtsi, which
includes it, enables dsi_0. Both consumers are declared in exynos4.dtsi,
on the same phy node:

    dsi_0:  phys =3D <&mipi_phy 1>;
    csis_0: phys =3D <&mipi_phy 0>;

Tracing that back, the provider is
Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml and
drivers/phy/samsung/phy-exynos-mipi-video.c.
It registers several struct phy in one node, and the binding says:

      For samsung,s5pv210-mipi-video-phy compatible PHYs the second cell in=
 the
      PHY specifier identifies the PHY and its meaning is as follows::
        0 - MIPI CSIS 0,
        1 - MIPI DSIM 0,
        2 - MIPI CSIS 1,
        3 - MIPI DSIM 1.

Resuming from the cover letter in v4, I treat this phy as one tx phy and on=
e
rx phy. Maybe I can follow this pattern and introduce phy 0 and phy 1 in
rockchip,rk3588-mipi-dcphy.yaml, and add an enum for
SAMSUNG_MIPI_DCPHY_TX/RX in the driver. The binding would then say:

      Two cells select the mode and then one of the two PHYs that the
      block contains:
        0 - the transmitter, for a MIPI DSI host
        1 - the receiver, for a MIPI CSI-2 host

      A single cell is equivalent to a second cell of 0.

In this way, I don't need to add PHY_TYPE_CSI/DSI to
include/dt-bindings/phy/phy.h.
And I think this will not go against the discussion in v2, where Michael po=
inted
out that DSI and CSI are standard protocols and should not be named in
a Rockchip
specific header, and suggested introducing PHY_TYPE_CSI/DSI:

> How is that Rockchip specific? As you state above this is either MIPI
> CSI or MIPI DSI, two perfectly standard protocols.
>
> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.co=
m

> Where is any DTS using it? I did a search and no results of upstream
> posting.

The user will be rk3588-base.dtsi. It adds csi0/1, which connect back
to the existing vicap_mipi0/1 ports. It also sets #phy-cells
and the dsi consumers to the shape that comes out of this review; with v4
that would have been #phy-cells =3D <2> and PHY_TYPE_CSI/DSI.

I thought the dts should wait until the binding and driver were settled,
so I did not post it. I will add it in v5.

Thanks,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8827=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
> > A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
> > and in some PHY blocks both work at the same time. The existing
> > PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
> > the transmitter or the receiver.
>
> The consumer knows this already, no? Imagine consumer of the phy is some
> ISP receiving data over CSI for given port, thus consumer cannot
> transmit over that link.
>
> All this seems redundant.
>
> >
> > Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
> > D-PHY or C-PHY and transmitter or receiver. They do not replace
> > PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
> > selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
> > binding.
> >
> > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@co=
llabora.com
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
>
> Where is any DTS using it? I did a search and no results of upstream
> posting.
>
> > ---
> >  include/dt-bindings/phy/phy.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/ph=
y.h
> > index 979b5dfd8353..8ee3f88e6d80 100644
> > --- a/include/dt-bindings/phy/phy.h
> > +++ b/include/dt-bindings/phy/phy.h
> > @@ -24,6 +24,8 @@
> >  #define PHY_TYPE_CPHY                11
> >  #define PHY_TYPE_USXGMII     12
> >  #define PHY_TYPE_XAUI                13
> > +#define PHY_TYPE_DSI         14
> > +#define PHY_TYPE_CSI         15
>
> DSI and CSI does not look like types of PHY...
>
> Best regards,
> Krzysztof
>
