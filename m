Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A84327C18
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191162; cv=pass; b=rGQFvggPAScQosLxGs4atr+hxeT6QhULkfh1V7A5Hue5lcVsNoolr82Fyv7AV+QmTAF5uPplFcq8t+ZjC3pzauWeffx7tDThlQrWAssr5nnqGtTctHIC+mZ2A8cHTycDa/F53BJiWSKG3HDQa7cKbmTCtAPzEOxAYwguLXC6RrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191162; c=relaxed/simple;
	bh=A8+zKWqKk7YrwMcoc1LvkIW72eVnzUrlq3AoF3y+mTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiZSP+F8qHaP33hKVK4MNUcJ0zFXcHuSBwu8aIBdhBlAGBCJKcZy1cjEGkAJQNVHYfWv3TaApC8CrOLRWBFfTb4jYezlwodnHyMiTr5wz77XHzx6O8RxVmbokA5ssClElcW8pmWyfo08Tf0ba9yFqjY6ENi73RJfgnHRmpfUyzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkvvLwi6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k2gBkXHc; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkvvLwi6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k2gBkXHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779191158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
	b=RkvvLwi6oKBoYv8bKoVGvXWTJLyJQSJodNFOc/NPrZT4qguYgOhvuBPvv4WJbgG2Lxip2M
	LagDehDvzq/zvTB4kcUQCRJpHVsrKy+1dnpsAH+ErqXcofIwM+2wBT1trX119oyc8SNP8w
	B6zVBNLY+UXWF+fV/wJJx48nR/s+qqI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-t7y0RizOMnyAMkPHKYyAuQ-1; Tue, 19 May 2026 07:45:57 -0400
X-MC-Unique: t7y0RizOMnyAMkPHKYyAuQ-1
X-Mimecast-MFC-AGG-ID: t7y0RizOMnyAMkPHKYyAuQ_1779191156
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a8d72e2f0aso247149e87.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779191156; cv=none;
        d=google.com; s=arc-20240605;
        b=M5FmaH3WKotKv3X0fUwTwbjTptZQTYNRvNfZVD4Ujdz+mwfm+iEk2HoI4MmfTJekOr
         bmV1L6vwNpvH9g/lZldP+iqniz0RbYT4sv6eWr7Op8UXRkOvC2zor2nw9nZhuU7yDDE+
         ZULzvw+TqbONBZngzTpUodv4oUknUyuO7//CnjHLqu4/hZD+170+zxo2IBtV/71Yo6Sm
         JQIBA2UfQrmQowddcZGupmjV2cLKrD5Ie9UN/fZaMkPPDSbZf2IVYRqYPj1KH4P07NmP
         GxSLPG/DnHdHKShAUKoCbvIyJ4wK37XamJGI7+qBWcqwwxKIh8F935kDjOZh1RlNmN8V
         k2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
        fh=O/VqEOoQUtr/+eQaOB0YDGGRDhxzRswTe+EsWz+aW+I=;
        b=VkcHXsLnJuoYn7o78rd00Uhd8WUrzURtUftF2fRAAUZZB8FoQ/ANuoa3uUrBwiNwxK
         blJjBQfHPgfwY7uTJvbuy2LVBXZvuo7cG5sI1iLKO3xKlKeGBVyJCTEKZP+1I4oJNNkZ
         rVJAN9T83cTtPij2n/GbgJPY0eGE9tir+jLLgvrVi9eN2lXcfZPlOBTwn7Ai82LhePE+
         4XCvniWa797phNZ6WKbnfaCUFNXwX0fXDivNMDY0ThmYEX/DfdW263gdMi9FzMmePBa7
         hvrUc2VIRKpKSCFwJfFJvnjTaOQr+VklpC7ole0Xq9D9/1yXspGXSbn3++ZcpCWtCHVb
         Lvzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779191156; x=1779795956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
        b=k2gBkXHcfEQbfBka4XPZCMknDdmWT6tB2Xpf+C4IH7aHkDnkd4CZlZTWsRCLPXA9PO
         DC/TTNbQNTi0mlw9T4KoH/ebUKyQN/LOqAhgwtfDrjrfPtkuiV12j4BQ2Yx5ScD8cjb1
         aFiH0Ndj42fyV6RvLbFwmsQzB4AE1k8FQtRKAIEvqQ/6soPCqKs8gOnlqHuL1nvnnzOF
         s7RYpamUhwXIucFAIuH9cmTxuHWDH07LjMNT2FnvChkTf2qxPk8cTRSgpajgGt2/Jde2
         ivgTUA9xYRiKfVZCIi0yvMyfKJ1XaApc+cxgzisg10hZofq5gBeZbkxF6JFzqXcly2su
         /24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191156; x=1779795956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
        b=n+BdeD7ZCfDpN50iqeYNHmPjUkz8ri7RLD2JIob19vW4orMPx9W82VB99PVIDhLs+/
         FYl78Dwd3V/shEsnI8ivOY1U1l8GOEEPh5nXroEKxhfK6ALN99YH4G3F3jINEpblEImp
         s0QjeECJDj1Xr5IQsGH9NbQifLnJo25DgVy8eI984bEO68MA8NedgibjalenHaBy+Kqy
         B+CUTfCjhc2wTczFc3Iy/kXmi7uVQCuOkTwgl9sLw+Jym0/FCxEyU84gWee57GJlYOJl
         UL/LbnGvcgPnvZ9oMaZs2uYQ4aeiO/GE3nn6PMv5tgWf+atvgx7Pi6iegva/OfhJ0AX2
         WhlA==
X-Forwarded-Encrypted: i=1; AFNElJ84+lssgXmxhVnkVN9TY2tiZT+mChOt+YC5i+iwn493D3nq5Zo1Ji0B+gEFOxYZKZmTSIQ2pTrH6QnU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tFaGDzfspXeKIYys1PHwblKs77Iynnx+QtUtQTFQtGWpTvlU
	028iulWAFbxvw7EEbkO9hewy2tycwK1NbrsYcUUUcdruy4TRhNCA4fsd+eeQwdPOpQFBly9N+lc
	CNYwCpaX1+PXIG9CtZuw1D/6XKEhK4UYNb4ZajVN0wZx2TFfGG8kQ2CDeESVRJLXCwIcaH/cfgn
	C78As4+Tkee8DXHXV+81pfxZ3NW4mRQvSHGoqYbQ==
X-Gm-Gg: Acq92OEBEtGQ0iatJ/2MPyzBBw4pnEMFHaYBtjEngJqkRiCv4G50+GfxqrWoyoXGQX8
	1Q6XU51CPEuYSFF59X5psPjkER4eFC9ocTA3dGTLt87DBesLH1i9dmoydzcVbk3vBM8fQcTgK3+
	MLILBW46u9dc3OwlYa+fU8530PmfCl94zjNolLdygLJX0XOyDyUotFZBUFx6rgcNMBABJyT2/WF
	zghhw==
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id 38308e7fff4ca-39561d12c2cmr26805871fa.1.1779191156020;
        Tue, 19 May 2026 04:45:56 -0700 (PDT)
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id
 38308e7fff4ca-39561d12c2cmr26805691fa.1.1779191155534; Tue, 19 May 2026
 04:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com> <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 13:45:44 +0200
X-Gm-Features: AVHnY4IsU7fSSnNgUDdmrpcWXb8rpRp3nIWviV63aNNWwk4kg6ZdkU34h4HNbeA
Message-ID: <CALE0LRtt8w6cAoCqKt-9YCuvjbVE95NdQPq3gXqRg-jhxKO4HA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the patch.

On Mon, May 18, 2026 at 8:15=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add the usbphynop node and the usbotg pinctrl
> support for the S32G2 and S32G3 SoCs.
>
> This enables the USB controller to reference the
> generic PHY and use the required pinmux for USB OTG ops.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 53 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 53 ++++++++++++++++++-
>  2 files changed, 104 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..d096744cdb0f 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};

I'm wondering if it it would be more appropriate in the SoC-level dtsi
(s32g2.dtsi/s32g3.dtsi), similar to other Freescale boards,it doesn't
represent any board-specific hardware but a virtual NOP transceiver
used by the SoC.

> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -245,6 +252,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

The label can remain usbotg_pins but node names should use hyphens

usbotg_pins: usbotg-pins {
    usbotg-grp0 {

You can run this to catch this kind of issues:

make W=3D1 CHECK_DTBS=3Dy ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
freescale/s32g399a-rdb3.dtb


> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -304,3 +344,14 @@ &spi5 {
>         pinctrl-names =3D "default";
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       fsl,usbphy =3D <&usbphynop>;

According to the binding this option is deprecated. Could you use
"phys" instead?

> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index 979868f6d2c5..b756bcf6469d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};
> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -199,6 +206,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

ditto

> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -257,3 +297,14 @@ &i2c4 {
>         pinctrl-1 =3D <&i2c4_gpio_pins>;
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       fsl,usbphy =3D <&usbphynop>;

ditto

> +       status =3D "okay";
> +};
> --
> 2.34.1
>

