Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04393CF69E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439683; cv=pass; b=qWusl8bskfra3oU6A3VpnwiN/hJDAHnk43IAwle6WKCLGe5ZUWC8EEhHL0d+3v9UE2XHCgelS6slzpPmI0oJAFXE87VglP/LX4Ga7XhuJCgZ3/6yujuog80TBGwhByi3rBq9JkjgABmeOZCaZ17/0qq9+YDVAtDUayMzjxGoZkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439683; c=relaxed/simple;
	bh=0MrcNmicBRchhkdmfDJ8rKh5Sk2NMVxCsAhKDXICGBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo/792iURZDfKMGbo8ulkZropt/8aL1EfVjCVkqiUYBz2D7gf+4Md40NxoR3xw9r7TVuw5HVNC2lqM48rEVsBMDiGdaHYwun1xtxoXNUjTjRsuptq61AobGGz9spQGuCHN2P9enyp3F7eokDcB+f4FsFxsjeSiup9fmlTnDOT7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnHRw1jp; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnHRw1jp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso5257360f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774439680; cv=none;
        d=google.com; s=arc-20240605;
        b=dQlnVO5Ct7x8Rcx+amH61JsEzJC+Ksg58HZpQk0mdP8+iBap6N+i6wklKtf5tt2EZU
         8rSCx+qLsItBKtfxGBWoZSZ2WmxsaGWjXuVzrXzCMA0XPxhqMyow3c3lik1RbzP85Ysv
         slfSijbm3Hy1wldq3RtLPEyJkej3Y34mzYQc0/6WoIzI7o5QZJfM5uLeyMuf6IKzDEbp
         9evkQv4wdrJpeL7s7t7/uUVcEj8HBZyJe6uRiJWQRlSD2JEY7YEVD3vnkO02Bn/qNWLe
         o7DWSWF+rP/9QHWIMQQoTn/VdBCBGYOqrxiG6uYqCIYLWVGngmvvPVCiVb+Wj//DB6kZ
         tSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        fh=qmUNetf2fMxjwtBAm8jhXHot0zVEZWEoSFn5EmoG5wg=;
        b=aDYxOwXUOa4ieZrZx0N+u10JzDTmvt5Lql9xBAQI72fj51XSFMGQ1yCZGtCFhheDHq
         bXi2YvjIc0aYFtCo3gaNT5ubAGZ52oEYLCoO/ehlYvou2lHp2AZzjDIHDnrHOGFEL4Zf
         RGzMdfIcvomBuOPsJCUrqY/x9rzkJGF8gdWAfv3ckhI0usKtERUXShyYPr1/AyoiSl7B
         yIEWiZItNR6NOJCCjgNlYbtalm3KagYe9fsTCDgZi1/KzcYmjNfkOPkUa85go8QKylcL
         Qc6IJNq2BilfcfthJZzQNc32zFH4cEJoBzfK/R5TVlCpNWRHrNQLAVtnD4zFTK3kV3mf
         O8dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439680; x=1775044480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        b=LnHRw1jpt+J9xTzRv1r1iLrPWnz5wzfWKLV4MV69ZmXAtUXYmMOw3cqkseXOQtE/ky
         QJ/cedw4xkmEZuNkoF6nLlK76x1NH3yzueuzl0Jp1kOidwMPYy+/wL9Y1a2eGIxVfbR/
         D0M+C37vPjnUyt1xTLxzZToS0UWu1PnSv9eqxEI9RDvn9hvM4M1oI68xO4vlDNKfmUMk
         W2+HbU0EAqF2w/TDD/GwjK0qKkdP5rgfO/gHOq1yTXEmP70LybTkrUG3ssF61dvVpaUL
         rIlJJWZ+pjNtpfRNGxr0PUv3iJYep0JAHQEhe6W5FNGYQR+G2T2AO0F/fDL9tM0DUwAB
         r3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439680; x=1775044480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTtiC/H6aEdIPYVK6aeTMwBZxiD7QRg2sxYnmAcsygw=;
        b=Xcyio8/E04tJAZm3y3Be6TpK5XTKpRqAKBuKeGg8MTn342qpJdMhlVzCsgF1QaYBG5
         8yLSrWne4O6diuKPvpCXuIhbaYs2QfzcTroXsbFTvqxJV/BWMs2UQ6IXG/32z9N6ajRA
         BEQMj4Ys0yxLbIAkDxrZ6Z3tKRpPwALUBF3c7aWeirEnbmTpH1iXFIhAJooBM1jo8zWb
         /7AQk2uVy9bS5Y5r62rvQ2/8g2j3Ga3W7ORpdUWRTpKTpuTzjslSO5V4/s+NN8arQyGW
         vGkOCyUcsxv0TyzFFEP0fseFYHMC6bV5KAkZrzwZvPU+jNMWP9Sb7zTM/XK9a3f3fdgQ
         QJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4oJ15QOtJb6mAM31YwqVmtBd6ctbReshK6HA2NHdWO4iHlwmUbTInUVGl0RDKFR8StxJ1FG2IssJf@vger.kernel.org
X-Gm-Message-State: AOJu0YyemPTPV+8fr0rNdeP/U0qS5g1uwPFAk6KLN8YwzJ9ZMXnBoSo1
	C12DHkc9WEEsdqIDRhkynNJBzWnrYF2/3Y74FOOyeR63d5G7J39R7pzrvsT/H8+VhEM567EODtw
	oyEw7iBxvMEaVoXGiyRlp9Uug5is7y1c=
X-Gm-Gg: ATEYQzzXKerx2nW8Ian49K9pMRNtSAzNdU+J3diDzG/XYZxAd58fdaB+Vrxw/kpzEss
	VF2iEWj2kwNDftikycEhCi4bGyU1cr0vspB1z+YgPp1ByfJDs/ebDmPeSZ5HJ/LWjSHjRpGMVse
	pup9hWFi+MaYjrQj8F3HnUWvciEczo3hzEOcAiDRN/KJSywpEsNIH/ZpdGCKchXGhRsOlNxXWJw
	ffORMip1Hs4c4p1YoMIgWcHGcj00RLM66v4X0WxQWSpeI/XXZJ8z06QIuoB4WWs3Kr6e/52Nvqh
	Qk1OXN5UfeVB2ZAfPIMPldo3MMfyhTOfw90feraRTAyBuzYkoDRvEpLD0W9p/EUADWhc
X-Received: by 2002:a05:6000:144f:b0:43b:42af:75e with SMTP id
 ffacd0b85a97d-43b88a1c6e6mr4638167f8f.44.1774439680037; Wed, 25 Mar 2026
 04:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <c2c56940-e14d-44fb-9b9a-9aff70998bd7@tuxon.dev>
In-Reply-To: <c2c56940-e14d-44fb-9b9a-9aff70998bd7@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 11:54:14 +0000
X-Gm-Features: AQROBzCVUCaqQkG9OKxvNMfyAeiAVuBU-qZHdIwjDOsY515WjKNxFvBFEZYatKQ
Message-ID: <CA+V-a8tv7JG6TJY2FfQweNd04G6Vm-k8P7tYNbajqca_yZ6vrA@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: rzg3s-host: Prepare System Controller handling
 for multiple PCIe channels
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

On Wed, Mar 25, 2026 at 10:19=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
>
> Hi, Prabhakar,
>
> On 3/18/26 14:44, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Prepare the driver to handle multiple PCIe channels with distinct Syste=
m
> > Controller register sets, as required by RZ/V2H(P). The current design
> > stores a single sysc_info structure per SoC, which is insufficient for
> > multi-channel configurations.
> >
> > Introduce channel identifiers and extend struct rzg3s_pcie_soc_data to
> > hold a sysc_info array indexed per PCIe channel. Add a channel field to
> > struct rzg3s_pcie_host and select the appropriate System Controller
> > information during probe based on the channel.
> >
> > Keep existing single-channel SoCs functionally unchanged while
> > preparing the driver for RZ/V2H(P) multi-channel support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++-------=
-
> >   1 file changed, 33 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/con=
troller/pcie-rzg3s-host.c
> > index c61e011f8302..a629e861bbd0 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
> >       int irq;
> >   };
> >
> > +/**
> > + * enum rzg3s_pcie_channel_id - RZ/G3S PCIe channel IDs
> > + * @RZG3S_PCIE_CHANNEL_ID_0: PCIe channel 0
> > + * @RZG3S_PCIE_CHANNEL_ID_1: PCIe channel 1
> > + * @RZG3S_PCIE_CHANNEL_ID_MAX: Max PCIe channels
> > + */
> > +enum rzg3s_pcie_channel_id {
> > +     RZG3S_PCIE_CHANNEL_ID_0,
> > +     RZG3S_PCIE_CHANNEL_ID_1,
>
> Just saying... based on Bjorn feedback on patch 3/5 the names used here w=
ould
> have to be adjusted accordingly. Maybe controller_id? Same for the other =
patches.
>
Agreed, I will rename it.

Cheers,
Prabhakar
