Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1586339861
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429318; cv=pass; b=kOVw7gqUD/XnWgL4PJ80rdBSurWpH2al3cRWqtoa58hIkbtqz41Z+TpzlNR1fe9ORholUFFc/0UY4klZFhMiWCfl0x0wkxkrq/WlKiMDn99SdpsVxKIVbzPVpRGITkeHbZ963mgnbA3JhO9XoaV0/jsDS1JWdJQj+bb33HGUItM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429318; c=relaxed/simple;
	bh=EBlHZlU/yQb6bBWjzw7fMGP8qSSTAGTVxYB6n+3g18g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5rbRYMfbQU8VXMYo8h5gmoBuZo/o1koonEw9VodQ175/EguTtNHP47bc7cdNQ7yHhMzvKNNPJXRZOFIvNwvHM4aWoUvsiOmlTpY5zMPzxy1kg+n18mjM5oFBf57nJdDCNXmxRX361pXmpPksVjpDUz/Vw7qtl67NKIvbB6HRVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGV2txhM; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGV2txhM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2643857f8f.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 12:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780429315; cv=none;
        d=google.com; s=arc-20240605;
        b=aSYPpXm9kVrKyAo9cbA8KATWTkW4RHMlyScnFqIgrYnvd3mRNLvKPMR/om6AA7sZYQ
         mK2UDRrqT5TcXHF2mEWzaGktTGE/iEHOv9/HQoMXCUET62tiiYl2/jTOAG9ODEIXtxfD
         lyFOQfV/U5elxdQ40mkpVFNPm0e0vdXJ2wFpf04QoLjwVvGq4uU1g60gXG0nsdpGumSL
         R5TaOvepHon17YFVgrXtHgU8ctkbyqWcF42Huu53iLkWsqSHM1hG+1gcbHFWembs6/PY
         OxbcN/c8eqgZIsMqr4wyoAXZ31P2bc9wmI9rXNUzCkNlXEhETSsMnGUo053ZbkxgZFOC
         owDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        fh=l79J7GOW9D64aiQguBD2bIh6yxF68wch15q7UPhI7f8=;
        b=k9GeMo4EgkjSSoZg5c+SQSYAyPwS6EH81Eiw81JeqmCZ2/W2YCbTCe6EoTnE1xy9rl
         XgTBAqy1QzxkQ7EBbuxARpZWw4h0E+NVedU+2TJvnPqPgUgsjavYwlTrxSdMZXNqwEXK
         WzQA3Be4/HgbXIz34RYez3lKffLnNeSOrISf8aC3YajsWILQwIG+oOHbagmpMooM9+jR
         2vFci1lGbfBt8jfLpUKCkbIDeDLjqguZZkZirmJOASGLFRmIo7Uc0ByixMP8Y33lbdse
         YJeufdhBWIwUvuY5+BqZ7BnX4kxer3qKM8vvn4QWhgzIDckmg+pPJR43DnLQNIYY6p8m
         4koQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429315; x=1781034115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        b=cGV2txhMoLt57fIdn+/Nh0eqKujDeRLSChuzJd/mUtIXSsba3ameMWIW08BcR6nRIy
         1nj7HsPcP+sDSkgZFTMm/4xeKqW9Ky9MW9gkEHCHIlNthG2dUcB/PDxCBWM8WgOSb+Fb
         6c1eFowSDblf4cfx4pEK+xE7tmByy3wGGYVdGfR/gyZsLXt8lMY6yG/Hy7UPEM134Xdc
         gp4F3X0/+50gG99RrgkReoHSXVoaAz1LGhMXeQY5gv2ZLovTlUNCt5sK0wcbUVdZOU6W
         5qMqVDnpzvPY+M9zxQvZXFAI8ArwRbaKoD5HfhNCFXTRaE396atPTFc1UrQbQQFnRB1Q
         lihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429315; x=1781034115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEMh5W15s3ZL+Zo+DJX6OYmqs9feRMkS6Ofgti1mA8U=;
        b=HUvj4bEHvIhZfkX42AmbK2Bui8oncwfDkEXCLvFm1O7qEpSFVyYodOH0GbDTkKI9jp
         rr86ap4FfWMreaGNDn4vWA7tHr8gU5WjYBbTVR+PQyuBnePj8vtmRUgnD1deS1kxiTZu
         mbwiJW9q3tSgrbFMHfNhvv2PP9IUsYPxWPR+EsjrOI8MKbmettQnPQ9YADwQi06ZJpuQ
         Fr1rAKjcb61v1VJa68sbpLHPCNV3sR4SwiqgL/ckcsRFxs58rOzDUoq4a7KIT9FFypTH
         XeOLiJ4OSc0H0D4jHoM6XT61Wp4vvcDuoxvofdrLu356PxMED+RKFiNSYzWwp42qkLKV
         vRRA==
X-Forwarded-Encrypted: i=1; AFNElJ929F6z4M27X7why9Ge8zgeVbWdBT9/k4iY3R/MN+5tp021iguMleREr8dtIszrg9Us2CFqnix7d0SV@vger.kernel.org
X-Gm-Message-State: AOJu0YwnqdkPfJa/xAcn0IjzkYrLBXKEv4nHEsCr5R7HRofSMh9dfugr
	69Pbzr8qaiCWEINSF4Tt5sP2XrB2Cs6aUCgbMgYOK6WQ3Qy/2UOMBdg51aGhExdiHgspbEuadZW
	ms+3H/UCO+CGdSifK+mESHD1U2NlMXws=
X-Gm-Gg: Acq92OGRZVmAmXtAhuZ7JY63ebdWwenKFQMM2zjiM6Zd5ZbaqN1lxuq0sdvSlOqChOb
	YD6VzYYIDmux6RXfvzlX3OAxgyFOYu83gJyTg99+EsofNNOeSJe2NBEfP8rYWixypsqwgTI5LG0
	Few/uNPu74B+qKb48OaEkV7PffS2RaCtuU6nfmLxw7wt8sDJwunCf7xOMtuuGus6j/I60j4QFAz
	+lRhAFLg6Xuxob7eJT7409x3klkBpI6khj8jj8dp8+rh/a1Mj9+LzdP5a1XzAsFIZ6605WVKyWt
	5ARFIvxU/Cp/0bs6UM6a0FpbyB7hBuIB2tn7piHVMb8kg+51sfsuYI2Ea1WXul48XzKLKhVE741
	yoUMBMyNEE6eU85X55zJCgj406d/bUH+Hc2o=
X-Received: by 2002:adf:e508:0:b0:45f:1bd:a04d with SMTP id
 ffacd0b85a97d-4601f4fac09mr882189f8f.7.1780429315314; Tue, 02 Jun 2026
 12:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260520164823.436992-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <86e80877-b860-4b93-a5ae-a416840eb393@tuxon.dev>
In-Reply-To: <86e80877-b860-4b93-a5ae-a416840eb393@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Jun 2026 20:41:28 +0100
X-Gm-Features: AVHnY4LH3tVnbhX2kihO8dGiFPGS7IjVgtm6CenunWIAP8asGwsAHQWQnCcdEGs
Message-ID: <CA+V-a8vR0tOXdMZcA4fi+VykwHokHQqm-s97UNKMbPAaq-3ctg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the review.

On Tue, Jun 2, 2026 at 9:00=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 5/20/26 19:48, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the RZ/V2H(P) SoC PCIe controllers to the rzg3s-host
> > driver.
> >
> > The RZ/V2H(P) SoC features two independent PCIe controllers that share
> > four physical lanes. The hardware supports two configuration modes:
> > single x4 mode where the first controller uses all four lanes, or dual
> > x2 mode where both controllers use two lanes each.
> >
> > Introduce a setup_lanes() function pointer to configure the PCIe lanes
> > based on the hardware instance. Implement rzv2h_pcie_setup_lanes() to
> > detect the configuration at boot time and program the lane mode via the
> > system controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Parsed controller-id from the "renesas,sysc" property instead of
> >    using linux,pci-domain.
> >
> > v1->v2:
> > - Updated commit message.
> > - Added locks to protect shared lane configuration state and
> >    prevent concurrent access issues during probe.
> > - Added cleanup action to release lanes on driver removal.
> > - Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
> > - Renamed num_channels to num_pcie_controllers for clarity.
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 180 ++++++++++++++++++++++=
+
> >   1 file changed, 180 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index edb49af7429a..15879b2c0bd2 100644
>
> [ ...]
>
> > +static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
> > +{
> > +     struct device_node *np =3D host->dev->of_node;
> > +     u32 num_lanes;
> > +     int ret;
> > +
> > +     ret =3D of_property_read_u32(np, "num-lanes", &num_lanes);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode
> > +      * for the first controller. Dual x2 mode is supported with 2
> > +      * lanes for both controllers.
> > +      */
> > +     if (num_lanes !=3D 4 && num_lanes !=3D 2)
> > +             return -EINVAL;
> > +
> > +     if (host->controller_id =3D=3D RZG3S_PCIE_CONTROLLER_ID_1 && num_=
lanes > 2)
> > +             return -EINVAL;
> > +
> > +     guard(spinlock)(&rzv2h_lane_lock);
> > +     if (rzv2h_num_total_lanes + num_lanes > RZV2H_PCIE_MAX_LANES)
> > +             return -EINVAL;
> > +
> > +     ret =3D rzg3s_sysc_config_func(host->sysc, RZG3S_SYSC_FUNC_ID_LIN=
K_MASTER,
> > +                                  num_lanes =3D=3D 2 ?
> > +                                  RZG3S_SYSC_LINK_MODE_DUAL_X2 :
> > +                                  RZG3S_SYSC_LINK_MODE_SINGLE_X4);
> > +     if (!ret) {
>
> I personally would prefer:
>
>         if (ret)
>                 return ret;
>
Sure, I'll update it as above and send a new version.

Cheers,
Prabhakar
