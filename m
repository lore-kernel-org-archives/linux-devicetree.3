Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E0285041
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439627; cv=pass; b=p9hrMJfwaqeTfGU7umPM43FN5PMXzY+dM2Gt94n9SH45JL8mTmisHau6FPJw2AxfR9fdwxU90nhXurGtQrrMbh+IKvWoFAAX1YUFZ27/eGtN9htZAKPDx7qb1EatgF0DzQpq61SLKb2PzT1gDxN7ToH3ZUPY/K4CrlvaWMrY7Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439627; c=relaxed/simple;
	bh=eJgALIRcyyz9LCRK5t0+rFkU1VolilECmiy0tYcoidU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGy+Ba6dZzDgMaTIqassWVlSHmduRfgS/c2Ra1QaDfazh1yWSG+LGU3c2UhOHCxvEeQto8WmqdKFq+xY/UW8a7IQF2LveddPLairG/NYqzaNhxRGj6Zg7wU/b9Akdwp0tqxZxcWwy9IHrshFjDNPdqc6OGKdoaf8qUqyU/YyM8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRxFiplJ; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRxFiplJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b611274bso3484790f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774439623; cv=none;
        d=google.com; s=arc-20240605;
        b=iAotr5VA2jKPAsE+cZR+DGMvoG5savC9VkjpM4ygh+veoxNwg1vOaDvBSeWbHHTLbq
         t83Pv07FsXWUJEwN/Xv2XMMC+vqjXRlDWsieeS2PiFR8RSciawHhRW76UfqiBxzw3rY0
         BAcvP4t9hcbBB7SxFNM5dE8OX9YCuED9GJjU7vq80c1f+4PiuRflQx7vhY21g5YzOywZ
         SZ+9891dX13d6RMmDHZcqKPaviuqfUUy7cvntD0FrsZtknlzr9TQxjlkXI3o8JQ5tKit
         suOJ1cEPT+vaY7vxn/I39c3dUc7r8Se9QNp75g86xloXddkq7179ecLgivMj7iH0sn+p
         ZtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8biPvbG5RwJtcBMJxCthG9/AkemxWKNh8NrZeWOGm0=;
        fh=+GutGsSdtIxqM7PtG2wDTOhzSR3mhlRc0E1ti1pHE3M=;
        b=BsmGGceFw+ueQz2FiJEwM+sz9f99Zn9hYngdlYxnIDG7IBnwwmfhnQYIsxADM0kUuA
         9aYcCyQQPK/mgzs7RMwEelkeAlK92oBuSNTC+7s7LYh4n1HKX584ntBx1deJ1jCyBSIb
         +ddfDRK5fe/7la5hoY22wTZnboTY6tjr2OY98bxeJw5hus4DViCio1mkxTUGRc1K1oeD
         mZcGLMbJPFOvvXbuj3sMXnpyuUB+9iYq74XTCkp8YqSEWVXjDvqR9ty5G+DK7nQEGSXF
         gVdbf+4Kr73Q3oksroA7SdxCcERgRiWgiwGfVuqx89imNrGGimGLiCoUcDkfC5JL04ST
         e5xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439623; x=1775044423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8biPvbG5RwJtcBMJxCthG9/AkemxWKNh8NrZeWOGm0=;
        b=XRxFiplJC1YhoAbxWVLrOaniqn5UtFnFz8ZGcp0hJbY31AqUev2MTKRWlRGto6bNAU
         FBF0Nd31zhdXFri+6iR+Y1uDQOcxMD3rxk2nvuslRMfEJANus+frnS23LPoHYNSZRQ9e
         A+CAFv070htPO3AHJNlwD6rhGSXX1qyivnhQ3c20jcM6ubrT/+CRmELKEuGxKE2Ow1ti
         wIy2Cpf0VMiEcXgIXCklL/T4oPAyOpfwsAMoXP4xK8MAZfSCt3CDziewuwyO8fvkQK7O
         TyRxbDBWmYHQoI7hIOeusThXvR2Ot4n+KlGr2SPgwHEs57WRYCjWS12cLbtujr3FJpRV
         +ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439623; x=1775044423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8biPvbG5RwJtcBMJxCthG9/AkemxWKNh8NrZeWOGm0=;
        b=Lktb4H1d3vwDWWUea8URvnJZKqeXOhraIqHGg9t6+DaIPLnbOrJ3E5ff6Pb5S5le2l
         LNI6/bD426ga3pFxi5QD5HgdE86dF1OifDuEU3mrBQmRwhVSE6GoYXKKKNsYNQTN3iRR
         C9wVmaSNSmg3AJqJY1s6MMLZKn1Z6P+Nfy15clNqdea/yNw37SfUD3Qkom/HdGKPFpLI
         L0eBZRiNQyWwBzRGeMx7FtfYck4qTLc44a5CaEF383CPWuuDsjTLrNVC7eEkECQlPyEx
         3f0VUV7yDM1UhqsAd1wsSsFT9tNbGQO/qQImvmDBs9y8Lb92Mnrlkj1VyuPfHbEIO5SF
         diNw==
X-Forwarded-Encrypted: i=1; AJvYcCWMonLPIsGKkJ50GrzzSt8pQlQ53zCN1K3PSiX4wMMiUAatkfjAGElMk4/sKRmOPJeLXFQP5a2EszAH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XJ5rcDQRgwWa3k/RfMt2+tIwS0dvjv8nuSnFyus7iMqi0RLM
	hBL0yve94PcSHCkmS4XLWmsmopYvwgMiZ4cOfvWkssjzxYtgQe2zG7Bh6gGScJW5Pf5nPafoOAd
	AyEOdtQpfFM8biYTMCfrk4XykckTOeiI=
X-Gm-Gg: ATEYQzwqBO3YOvqXtQCSPL8FPwCWaBhhl23TE4rTSR/35RKUHNCVfuV1c/xZMO+cnGQ
	eYXqyCLwp4u4s4FwQMwIovBDvSO9k/3vKp1SWV6ITD5qWgz1uOsDIGms1x5X84NytVZZELROMvw
	mLkE1CRak3q+nn3m8yUxhGZPTU8IDG5df1T/oWtnJc5L/tLpui5GVSx/L5fnbKtTiMht2i1e78Q
	WjPusJ4DnyP5sQFhDy2WyPDjkOVAaJKECOS/+UMT4AvcGh5/Wi+QOlZuLNbAI6OwVmFVkd94Ys1
	tQps215CX0TKVVgvA0iVsWfqpmnrcMLYgvJa0HBiWCzOWrSUHHruH+etp0WtEc55qeQH
X-Received: by 2002:a05:6000:40d9:b0:43b:3d10:1c9c with SMTP id
 ffacd0b85a97d-43b8899d0c6mr5313668f8f.15.1774439622638; Wed, 25 Mar 2026
 04:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
In-Reply-To: <605e8d4c-09e7-4d11-acdb-7829a85eacc3@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 11:53:16 +0000
X-Gm-Features: AQROBzAziCTMLgk3ugSGb39k26P0qv1_pIzuDeJ1XiOWRgZ4yKMTAkNXEvRjNVw
Message-ID: <CA+V-a8s_Kv5WwocsKy_qBEtZ=0gzN-YbAz3pYjubf_qZVLhBew@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the review.

On Wed, Mar 25, 2026 at 10:18=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Prabhakar,
>
> On 3/18/26 14:44, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
> > driver.
> >
> > The RZ/V2H(P) SoC features two independent PCIe channels that share
> > physical lanes. The hardware supports two configuration modes: single
> > x4 mode where one controller uses all four lanes, or dual x2 mode
> > where both controllers use two lanes each.
> >
> > Introduce configure_lanes() function pointer to configure the PCIe
> > lanes based on the number of channels enabled. Implement
> > rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
> > boot time and program the lane mode via the system controller using
> > the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 142 ++++++++++++++++++++++=
+
> >   1 file changed, 142 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index a629e861bbd0..d1bf1e750d9b 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -179,6 +179,16 @@
> >   /* Timeouts experimentally determined */
> >   #define RZG3S_REQ_ISSUE_TIMEOUT_US          2500
> >
> > +/**
> > + * enum rzg3s_sysc_link_mode - PCIe link configuration modes
> > + * @RZG3S_SYSC_LINK_MODE_SINGLE_X4: Single port with x4 lanes
> > + * @RZG3S_SYSC_LINK_MODE_DUAL_X2: Dual ports with x2 lanes each
> > + */
> > +enum rzg3s_sysc_link_mode {
> > +     RZG3S_SYSC_LINK_MODE_SINGLE_X4 =3D 1,
> > +     RZG3S_SYSC_LINK_MODE_DUAL_X2 =3D 3,
> > +};
> > +
> >   /**
> >    * struct rzg3s_sysc_function - System Controller function descriptor
> >    * @offset: Register offset from the System Controller base address
> > @@ -194,12 +204,14 @@ struct rzg3s_sysc_function {
> >    * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
> > + * @RZG3S_SYSC_FUNC_ID_LINK_MASTER: Link master SYSC function ID
> >    * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
> >    */
> >   enum rzg3s_sysc_func_id {
> >       RZG3S_SYSC_FUNC_ID_RST_RSM_B,
> >       RZG3S_SYSC_FUNC_ID_L1_ALLOW,
> >       RZG3S_SYSC_FUNC_ID_MODE,
> > +     RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> >       RZG3S_SYSC_FUNC_ID_MAX,
> >   };
> >
> > @@ -261,6 +273,7 @@ struct rzg3s_pcie_host;
> >    * @config_pre_init: Optional callback for SoC-specific pre-configura=
tion
> >    * @config_post_init: Callback for SoC-specific post-configuration
> >    * @config_deinit: Callback for SoC-specific de-initialization
> > + * @setup_lanes: Callback for setting up the number of lanes
> >    * @power_resets: array with the resets that need to be de-asserted a=
fter
> >    *                power-on
> >    * @cfg_resets: array with the resets that need to be de-asserted aft=
er
> > @@ -268,17 +281,20 @@ struct rzg3s_pcie_host;
> >    * @sysc_info: System Controller info for each PCIe channel
> >    * @num_power_resets: number of power resets
> >    * @num_cfg_resets: number of configuration resets
> > + * @num_channels: number of PCIe channels
> >    */
> >   struct rzg3s_pcie_soc_data {
> >       int (*init_phy)(struct rzg3s_pcie_host *host);
> >       void (*config_pre_init)(struct rzg3s_pcie_host *host);
> >       int (*config_post_init)(struct rzg3s_pcie_host *host);
> >       int (*config_deinit)(struct rzg3s_pcie_host *host);
> > +     int (*setup_lanes)(struct rzg3s_pcie_host *host);
> >       const char * const *power_resets;
> >       const char * const *cfg_resets;
> >       struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CHANNEL_ID_MAX];
> >       u8 num_power_resets;
> >       u8 num_cfg_resets;
> > +     u8 num_channels;
> >   };
> >
> >   /**
> > @@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
> >    * @intx_irqs: INTx interrupts
> >    * @max_link_speed: maximum supported link speed
> >    * @channel_id: PCIe channel identifier, used for System Controller a=
ccess
> > + * @num_lanes: The number of lanes
> >    */
> >   struct rzg3s_pcie_host {
> >       void __iomem *axi;
> > @@ -325,6 +342,7 @@ struct rzg3s_pcie_host {
> >       int intx_irqs[PCI_NUM_INTX];
> >       int max_link_speed;
> >       enum rzg3s_pcie_channel_id channel_id;
> > +     u8 num_lanes;
> >   };
> >
> >   #define rzg3s_msi_to_host(_msi)     container_of(_msi, struct rzg3s_p=
cie_host, msi)
> > @@ -1155,6 +1173,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_p=
cie_host *host)
> >       rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> >                              field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORM=
AL));
> >
> > +     if (host->num_lanes) {
> > +             rzg3s_pcie_update_bits(host->pcie + RZG3S_PCI_CFG_PCIEC,
> > +                                    PCI_EXP_LNKCAP, PCI_EXP_LNKCAP_MLW=
,
> > +                                    FIELD_PREP(PCI_EXP_LNKCAP_MLW,
> > +                                               host->num_lanes));
> > +     }
> > +
> >       /* Disable access control to the CFGU */
> >       writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> >
> > @@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *ho=
st,
> >       return ret;
> >   }
> >
> > +static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
> > +{
> > +     struct device_node *np =3D host->dev->of_node;
> > +     u32 domain;
> > +     int ret;
> > +
> > +     if (host->data->num_channels =3D=3D 1)
> > +             return 0;
> > +
> > +     ret =3D of_property_read_u32(np, "linux,pci-domain", &domain);
>
> This introduces some limits in the systems with RZ/V2H(P) SoCs with regar=
ds to
> the usage of linux,pci-domain. I would like the PCIe maintainers take on =
this.
>
+ DT maintainers too.

> As this is necessary to index in the system controller driver specific da=
ta (as
> there are different SYSC offsets for different PCIe controllers) I see th=
e
> following alternatives, if any:
>
> 1/ add a dedicated DT property for this, e.g. renesas,pcie-controller-id
> 2/ Add dedicated DT bindings for RZ/V2H(P) SoC that would be used to spec=
ify the
>     system controller register offset and mask for different functionalit=
ies.
>
>     E.g.:
>     renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
>     renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
>     renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>     And use them in each controller DT node. E.g.:
>
>     pcie0: pcie@add1 {
>         // ...
>
>         renesas,sysc-l1-allow =3D <&sysc 0x1020 0x1>;
>         renesas,sysc-mode =3D <&sysc 0x1024 0x1>;
>         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>         // ...
>     };
>
>     pcie0: pcie@add1 {
>         // ...
>
>         renesas,sysc-l1-allow =3D <&sysc 0x1050 0x1>;
>         renesas,sysc-mode =3D <&sysc 0x1054 0x1>;
>         renesas,sysc-link-master =3D <&sysc 0x1060 0x300>;
>
>         // ...
>     };
>
The current approach is being used to align with the existing driver
design and to reuse the already available DT property, rather than
introducing a new one.

Regarding option #2, I don=E2=80=99t see this as a scalable solution. For
every new register, we would need to introduce a separate DT property,
which would quickly become unwieldy and harder to maintain.

Im ok, with option #1 or any other suggestion based on feedback of
PCIe and DT maintainers.

> 3/ as sashiko.dev mentions [1], using aliases for the PCIe nodes should a=
lso be
>     what you need here.
>
> [1]
> https://sashiko.dev/#/patchset/20260318124450.163471-1-prabhakar.mahadev-=
lad.rj%40bp.renesas.com
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (domain >=3D host->data->num_channels)
> > +             return -EINVAL;
> > +
> > +     host->channel_id =3D domain;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
> > +{
> > +     struct device_node *np =3D host->dev->of_node;
> > +     static u8 rzv2h_num_total_lanes;
> > +     u32 num_lanes;
> > +     int ret;
> > +
> > +     ret =3D of_property_read_u32(np, "num-lanes", &num_lanes);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode.
> > +      * Dual x2 mode is only supported with 2 total lanes. Validate
> > +      * the configuration to avoid conflicts with other host, if any.
> > +      */
> > +     if (num_lanes !=3D 4 && num_lanes !=3D 2)
> > +             return -EINVAL;
> > +
> > +     if (rzv2h_num_total_lanes =3D=3D 2 && num_lanes !=3D 2)
> > +             return -EINVAL;
> > +
> > +     if (rzv2h_num_total_lanes =3D=3D 4)
> > +             return -EINVAL;
> > +
> > +     rzv2h_num_total_lanes +=3D num_lanes;
>
> There is a a valid concern raised by sashiko.dev [1] with regards to
> incrementing this if later the probe fails:
>
> from [1]:
> "For example, if rzg3s_pcie_resets_prepare_and_get() returns -EPROBE_DEFE=
R,
> the static variable is never decremented. On subsequent probe retries,
> the variable will be artificially inflated, eventually causing the bounds
> check to fail and returning a permanent -EINVAL. This would also prevent
> driver unbind and rebind from working correctly."
>
The other alternative would be the below, where we wouldn't need to
use the num-lanes property but would need a comparison with the DT
compatible,

+       for_each_compatible_node(np, NULL, "renesas,r9a09g057-pcie") {
+               if (of_device_is_available(np))
+                       count++;
+       }
+       if (!count)
+               return 0;
+
+       /* If both PCIe channels are enabled configure the LINK_MASTER
in x2 lane mode.
+        * If only one channel is enabled check the port index and if
port1 is enabled
+        * configure the LINK_MASTER in x2 lane mode, otherwise keep
it in x4 lane mode.
+        */
+       if (count =3D=3D RZV2H_MAX_PCIE_PORTS ||
+           (count =3D=3D 1 && host->channel =3D=3D 1))
+               host->link_mode =3D RZV2H_PCIE_MODE_DUAL_X2;
+       else
+               host->link_mode =3D RZV2H_PCIE_MODE_SINGLE_X4;

> also:
>
> "Additionally, since the driver sets .probe_type =3D PROBE_PREFER_ASYNCHR=
ONOUS,
> could multiple PCIe controllers probing concurrently cause a data race wh=
en
> reading and modifying this static variable without locking?"
>
> > +
> > +     host->num_lanes =3D num_lanes;
> > +
> > +     return rzg3s_sysc_config_func(host->sysc,
> > +                                   RZG3S_SYSC_FUNC_ID_LINK_MASTER,
> > +                                   num_lanes =3D=3D 2 ?
> > +                                   RZG3S_SYSC_LINK_MODE_DUAL_X2 :
> > +                                   RZG3S_SYSC_LINK_MODE_SINGLE_X4);
>
> I think this one should also be configured on resume (to have the same
> configuration sequence as in probe) even though RZ/V2H(P) don't currently
> support s2ram. E.g. so something like:
>
> if (host->num_lanes) {
>         ret =3D rzg3s_sysc_config_func(host->sysc,
>                                      RZG3S_SYSC_FUNC_ID_LINK_MASTER,
>                                      host->num_lanes =3D=3D 2  ?
>                                      RZG3S_SYSC_LINK_MODE_DUAL_X2 :
>                                      RZG3S_SYSC_LINK_MODE_SINGLE_X4);
>         if (ret)
>                 goto assert_rst_rsm_b;
> }
>
> after ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, =
1);
>
Ok.

Cheers,
Prabhakar
