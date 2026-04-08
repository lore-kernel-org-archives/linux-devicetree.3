Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE73D8918
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674511; cv=pass; b=lUdKQ+NpunDVGWaNLXodXgsjjiUWnYXzO6MtDknpc88/lHZupmX871VR5qAJzBsYm8fvwoA/4lLZmmdvC51XuCDyGa8pBYsfl0RxpIAptnscK11Wj7tFNqvsh6ZStnKceLT0Ej2i+QHCW7CKsFFwM4JXUpkliL/gy/HJQyUmF8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674511; c=relaxed/simple;
	bh=cbHheetpVVdSiC5nwYLY9Y4ggJ90feKOZM6q3wsD+q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiXpZcHyIHwW1UOypMTAMM/bf3mzAYtvrtmtFr4i3x73a08l6NahuciSzsikhvESpGKSKLYrKzSiu5c35p0nF1A3MU0jbKnu2drQyDDlUa/3p0aNoPHvC0AYY3UfWag13T+ndm+2BrrC1aLBc2iA1VPp/3IQEBaOsR6L/qiK3DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hg/Lqc6i; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hg/Lqc6i"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d43e09de5so30331f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 11:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775674508; cv=none;
        d=google.com; s=arc-20240605;
        b=jBTdBc56OGUU1SLGnv6crD3LoPvlZ9M+nfB4LJwr/qEMfQydCXIBZrORKSnFngyjNT
         7Kes06PjCZ5noqbPbavA4XDzIAOt5RyhijtzTLth/185ZYIPiEYOxu+OVDUadj75deAg
         hHm3KdKJIKTzvWpcK+854dhD60cunAP5rd4vbmnja+hzHfLpqKfTRLK0trClnloLcfff
         UkChYU7ZolTgnB/V4z8Cm/C9545t8cA7Q/uxzgMhi8x9CZrlGkmRxwhqB8nkkRKiqJtO
         SwLYTBEKCzAt7fjcfTuPtVkmUrUiTurk1ewjaX05YGoOKTa9HIOyyAquvb2xn9iiz3pT
         uBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        fh=Pc8ah423dcJ6IZ0wUfDzROlzaqgzOvY4JgsHV5VmuoM=;
        b=QtV4zm7ygMZ2UvGeIS50tVQZPeBiy4sL1/6K9e9iCSsMNQwIpKp6zd3vn5UdViiBxA
         21A/vxb4ngZ3q1DzpRkRrYeA1IDDqOONwABL7oeUErc+P0NOZz0H23UynejvUT0v3gDZ
         zB0WOXyoDPpvqRspV3i1Jhnxb6nlbO1GLHborrSLVPh+tkZSjf4KzSAHyoJWuoKNkJUi
         dJRyS8WlFUWO79HdHs3e34OgDUigRZ42vZQWbP8qfHkEfKjTfQwpAPvngkVehxO45Hfz
         dnf060IPQg1zunM1SPD+HHVzQaRPEo9Gd/7qqF7butyh5KqGQ6ZkWbmXQRK98WvkKYC+
         nq6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775674508; x=1776279308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        b=Hg/Lqc6itriGWQ1KXrXBxZTpSiLYNnwnaytfZF4aNNa1RUMBr7VK+mQ757rh5ix+D6
         l6bzdURA1EfuxbO6yp7GXxeziHTUfQ9EeIU49188zCsjAy4GmQuEaStQtKHAMPP3YE5i
         6yMAUmiH6MENqEy08h/qWsMwdzN3KzudjADMunuHsebkISmaVBKjH5oF/IxjOo2aayHn
         8h3HGYWFRA/Xth5QI5/cOQBFXv47TTLxN8dXUi3KrLgN0uoZaMH4mPFOleF2RueU2G7H
         wjOqvUy/v4P+4W6Yk6AyMzAL8VOzRlIHkap8+4O/UGOY4b1jVSONsEJEzjm5RD3Td1UA
         hckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775674508; x=1776279308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmQpWX/IJfLVa4peELtc8B2oG/bwkKVLP9eXsbWoqvU=;
        b=XIUv6yOUWNu/+uOIk8h3FvAYhZVbmauRyrPhfU4oPyty/dKmNrZmDJFWJxCifrPrWY
         BvwMeNBO9EnLL02n21Fhtpo/KpbNHYUG58qc/+LDlGUi523lQEpYRcO+PZCdjshhvsIi
         XKHTyMuXHTmF2ONHvk9Tp4qXKzY3Oc3bg/BcvQDpOkfY3Rk1ZY7M+JRsC8+ARLt505PM
         nQpJei3LHukDUezIKe5ELwyfoq+1QCgdLbv3Qr5VlUjkG57RvE/9ArZDqOtlHrM/z9J7
         20Y9zAeshBKjowevy6cG83v22x9zADfYfRlNth4FuCC1y0HNiitnRnfGRwTyVha4pJKK
         o+yA==
X-Forwarded-Encrypted: i=1; AJvYcCUtuSdUe+LfStCQ7w1lEabllrRcnGEW72LRoDF1Il4Aj0wPE9IoKKU/gqMt254DcoMed51T/f6DPgDr@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEsedSmOUiVKPT20adwpCd0oFMZJFrcYjedwc7YE9g1QwA0Bu
	CxpIGs4GpxYtdNNlSWOJ01YoeeaORoyGd3qjxpIRJXzHq7q0M7fadjq3Ga2m6QqP7iLCQtoXtp4
	2DBNCjESS2q9NXH28O2TWep96ZqVubfY=
X-Gm-Gg: AeBDietJDuDuN5W9X59tOIGG3+ODawjyOGQs5r6O42TziWRSP/RMjY4wn6hTD2VlzZt
	mLK1Wd9eUlAWRkQM+9TvE6mlD2DFKodTDcGWvwS2hhEDpuHeJIFFuZE2Z8Lt13JpwXjee9aZE0G
	T+DuDnbK6l3HtCLJFjVv1AHE7Hbr+HtfPpG9ULBiInleCtVeJ44AJWDdnByRQGACgOYUWXIQrFl
	EKKk5B65OMb89fU7cPEoqUH6X5ms8l/Iyjnl8bVJxwIeIHx8UvlvnenUfzjmuZZHIGU1VCN1kJA
	CCW17egEUw9r9Ou/NmdYBPnP6tKocSD1QA7VVREAtm303RKzPSCKedN2SnU3VpzYu6qYOw==
X-Received: by 2002:adf:ec4c:0:b0:43d:30d1:857c with SMTP id
 ffacd0b85a97d-43d30d1859bmr20096655f8f.7.1775674507678; Wed, 08 Apr 2026
 11:55:07 -0700 (PDT)
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
Date: Wed, 8 Apr 2026 19:54:41 +0100
X-Gm-Features: AQROBzDr87Qzy0mqlZSdEAmIW08-1n_rQMiTx4fUpVUhSnbJkQMQoeSIC73X2dA
Message-ID: <CA+V-a8srS9g2WDMARDJn98K=nL9v1LiZYxqM8evsVrzR-s5ZMA@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

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
I'd like to get a clearer steer from the PCIe and DT maintainers
before investing further in either direction.

To recap the two approaches on the table:

  Option 1: A single renesas,pcie-controller-id property used to look up
            SYSC offsets in the driver.

  Option 2: Explicit per-controller DT properties carrying the SYSC
            phandle, register offset, and mask for each functionality
            (L1 allow, mode, link-master, etc.).

Both have trade-offs. Option 1 is simpler in the DT but moves hardware
knowledge into the driver, tightening the coupling. Option 2 is more
verbose but fully describes the hardware topology in the DT and avoids
a driver-internal lookup table.

Are there other approaches the maintainers would prefer that we
haven't considered?

Any guidance on the preferred direction or examples of similar solved
problems in the tree would be very appreciated.

Cheers,
Prabhakar
