Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4F3CB2D0
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574066; cv=pass; b=qtmVq+2B7nWgG1bTAi9fIT08R993IPcRQnfBHGj+bowIxoubGTVbImZbaeIQRs6vX0iTskAM8YosJ3iW9oCnMN27/4fF2jW47nWOhgUqGNSFbcl/dE6cbdNnBIUXM50uBTwYx6sNMZwX+pNe9wfbzeFihdHAZ2gkO1Lg8bpIw94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574066; c=relaxed/simple;
	bh=Szs4unNIrEZMIAMU2/cjkkFp75qpkEuPA04qQ41Ey0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRAdttyWbQCYS1NdpszT4CvW2+JN9syR+6fHV2R/k2htPWqjhMc2OifMnDKwUs5Vtz0+de7gIBfwZghO9HUfpN8Qvd++wfsro+xwzoWAr/zGOY3XLJgiygfGQ3k5mwnOPDxcah8YqU8Bw8EuZacMLpLinbt4WatnGIWvnZTXyWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjIj1SlU; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjIj1SlU"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c299e97dc0aso155288766b.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789574061; cv=none;
        d=google.com; s=arc-20260327;
        b=cEMTpxDOlcfnD3KYvGnFYa58GZnZKd2j6UsSQ1nzsyOMiglmqESADQckBUhZY6Ti8w
         xmeMXbyyyuKHGBeQmgh2nl9XcjVYnJPXC1661vOIkpporAkmq28ikyCQLN9obfRIxibH
         MH49jPTANt9GiNTJ+6qxlkJEWl/Hp0C9WBjHtnkw0SiBktfXqqfkUWDqWSyxteFOqdqp
         bvvXpM33vlRnYbK1jhcapte8101QsZjq1s78q0pFPtVtMaZ/ZnE9n5hlGd/wR96FQcR8
         u6dt4ayvR7J3zH5NEZPKFHe2WTMEaYRQGHpsIjJmiwFVBKPsSU+sOmsSoj9zlWKMhGVf
         zumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        fh=HAsUhts3P2YfP25Ql06LtmAjaJLXv9lNCo5M95kJXoM=;
        b=Eis62Wtmpmr05WHT0Q/yTM6mghdA2JyjoQBUKqyJdWlffXzN4AJh+6S0cK5E4S1qqi
         sozrkPaIQpQLfW+Cgp2DLRwHkfS0o8mjJxvCdj11oRPHxu8FkCNh6Wz5eB/+9sAfXgBT
         0cs17OiYOkn8v+qFJacl+zsOOy2Y6y8ETJLX9Cnkwtzq2sswR4woo3OOGQ5nfaKNnnGC
         gQhjJyO/svbWffawV53rIXIi8d4p2ycBvGhBXufMWMtYwA2iWqGnw6l9QS1uxyXjGZCI
         HlFZtvou+AnSz7GBTvBBC71NoXh0Fr2k4xEdcxXYVA2XKh7jhDnAQULapSrCccZJQlBq
         76vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574061; x=1790178861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        b=gjIj1SlU4B5/uPBKPO738WZdkJ/CcauI5dEAoEQmeNCFY2vfBaukuxAaXmpllckY7v
         AHSdA9hyISsjdVO+y+qJOVMN017oGZGG+Osu2ebmWDz8ubVtwXWeKT+cpL9hwPTXzCCe
         W7OvNYakavjzoteQj8kt5nI3lWIJ+MO0QayOCNrY/i4wbMW4H9S9aKH2QPRGEUBFaMRk
         Ew3L2dTuyAtEjRZ8oRdcvJP3s8wb532o1RNrOKcn24Dx3WhZN9b3vLqczXTgKDFBIlPj
         AHneU9QCCL5KRFqTriTpb9kg0FWdwkQabrSFo7E7qr/tPM2ypTO5/sz+WBw2US7Ot+0M
         X4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574061; x=1790178861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        b=x+S+Alg6sk53IrhrrR+a5c3WTvdWNIxCXTNvF5CrwkwcVEYLa7vtsW9CBQvFJT9J1c
         FL/0NHU24ZQg0QN0YcG/B8LZLQuAxwvY6kdHBxBugmvTQZpvVZo6D7nWqX4S4q5MMnHk
         OfUOJA4EJerN4sM1KnFCa6Ha5vaVbzxo0LxsyL6GzSsKggYiog64VlMqLLyFBwHPfxkl
         FEJsrn4aT6qcULdxjvI1VZqikhEjaF9t4e1K1mQioHQ6j9Lzu+cE0YeTuT+qkPsbpy91
         mddBUVFhAN0cktN0T1OIkuTBKdnU20+q2HwwIJ73RIPx+h1AC7Ytccgi1WoWx2Bgf902
         Wi4g==
X-Forwarded-Encrypted: i=1; AKwUvBxKegb3SFgN36ql8z33f7emp6iXD5lIDk9diUivw7a/yq31JFE8dIdN06c2JG0/TbkDM8SJkFeJddS4@vger.kernel.org
X-Gm-Message-State: AFuF++nwHPeaQfKVLPX+Tnrs/C28y2xIq8fzaKHjpsC8dFsg3lVN3efu
	GrwIG7b1whtR80hwcR+OdSI7J23EsSC/Z97il5pK3ACA/pnjigbiY0KopnZ7rF73RaNPlnIF3ul
	VLMqJ1iX7+4E1l2SexkZ4Fw3zJi1ONwA=
X-Gm-Gg: AYBFou0JLdulmwiT6v82OgqjDFoctZXXWLWJyD586noW9DvgKBFhnG97so5ic55WcTl
	MLUkrxOGCn39YUIz8Us/18N4P2uKr50t0LB3S9DpEfSgBjGjimpWB9q+6jYSgTM0Q+px1Zi8uk/
	s+tofmzA6mrhscaYAwFjsTYQ1Dz1TIyDDOEcVyYW8T5D6qc+MOyBMKEowSsAVBbgWGabuwFh4SS
	l0WQREBe2UJ6nuDWnhjNpYP+ozE9zX7+jAnIdu5G8gGcRarWHcf7XdDXCugmDDwV1xeZ2zryq3A
	55yvSgCd27+CzgliVCoOjh7SPQZ7l7v0kSY6dc9SSYM3FlPAON77nuWUPw==
X-Received: by 2002:a17:907:a689:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c29e533436cmr419239466b.18.1789574061173; Wed, 16 Sep 2026
 08:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123802.1561724-1-coiaprant@gmail.com> <20260915123802.1561724-8-coiaprant@gmail.com>
 <20260916145017.E901A1F00893@smtp.kernel.org>
In-Reply-To: <20260916145017.E901A1F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 16 Sep 2026 23:54:09 +0800
X-Gm-Features: AcwNN1XzWka-gBP6JzQo7V21TLELEHt1FwivFATTB3eG1OP-0RdzvQzVP33L0zA
Message-ID: <CALj3r0gt9jFM6LHPBT_Ow62etk-ij7JmYWnx3fMmRjJavf6_Pw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, 
	vkoul@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=
=A8=E4=B8=89 22:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] net: pcs: UAF in xpcs_rk_create due to lockless drvdata access
> - [Low] kconfig: unmet PM_GENERIC_DOMAINS dependency via select
> - [Low] net: pcs: integer underflow in EEE multiplier calculation
> --
>
> commit 45fa9f088b9d4ae656f2c67e864a462b4d229815
> Author: Coia Prant <coiaprant@gmail.com>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a Rockchip RK3568 platform glue driver for the Synopsys
> DesignWare XPCS controller. It creates a virtual MDIO bus to translate MD=
IO
> operations to APB3 register accesses and derives the EEE multiplier at ru=
ntime.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> > +     select GENERIC_PHY
> > +     select PM_GENERIC_DOMAINS
>
> [Severity: Low]
> Will selecting PM_GENERIC_DOMAINS without inheriting its PM dependency ca=
use
> unmet direct dependency warnings?
>
> The config PM_GENERIC_DOMAINS has a strict dependency on PM. If
> PCS_XPCS_ROCKCHIP is enabled on a platform where PM is disabled, won't th=
is
> force PM_GENERIC_DOMAINS on and trigger Kconfig warnings?

PM is already selected by ARCH_ROCKCHIP, so PM_GENERIC_DOMAINS has its
dependency satisfied on the target platform. On COMPILE_TEST the driver
is not run on hardware, so the unmet dependency does not matter.

> > +     help
> > +       Support for XPCS controller on Rockchip RK356x SoC.
> [ ... ]
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> [ ... ]
> > +     /*
> > +      * Compute the multiplier for the EEE clock so that
> > +      * clk_eee_period * (mult_fact + 1) falls within 80..120 ns.
> > +      *
> > +      * On RK3568, clk_xpcs_eee is muxed between gpll200 (200 MHz, 5 n=
s)
> > +      * and cpll125 (125 MHz, 8 ns), selected by CRU_CLKSEL_CON29 bit =
13.
> > +      * The reset value is 0 (200 MHz), but derive the value at runtim=
e to
> > +      * stay correct if the mux is changed by a board.
> > +      *
> > +      * Use a 64-bit intermediate: on 32-bit builds, 100 * 200000000
> > +      * does not fit in unsigned long. Clamp to the 4-bit
> > +      * DW_VR_MII_EEE_MULT_FACT_100NS field.
> > +      */
> > +     rate =3D clk_get_rate(pxpcs->eee_clk);
> > +     if (!rate)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid EEE clock rat=
e\n");
> > +
> > +     mult =3D DIV_ROUND_CLOSEST_ULL(100ULL * rate, NSEC_PER_SEC) - 1;
> > +     pxpcs->eee_mult_fact =3D min_t(u64, mult, 15);
>
> [Severity: Low]
> Does this calculation underflow if the EEE clock rate is very low?
>
> If the board configuration provides a clock rate under 5 MHz, the divisio=
n
> yields 0. Subtracting 1 causes an unsigned underflow to UINT64_MAX.
>
> Won't the subsequent min_t() clamping logic evaluate UINT64_MAX < 15 as f=
alse,
> incorrectly assigning the maximum multiplier of 15 instead of 0?

clk_xpcs_eee is muxed between gpll200 (200 MHz) and cpll125 (125 MHz),
so the rate can never approach the 5 MHz underflow threshold. The
existing !rate check is sufficient.

> > +     return 0;
> > +}
> [ ... ]
> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
> [ ... ]
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
>
> [Severity: High]
> Can this lockless access to the supplier's drvdata cause a use-after-free=
?
>
> If the supplier driver is concurrently unbound via sysfs, the supplier mi=
ght
> have already passed the consumer unbind checks before this device link wa=
s
> established.
>
> If the supplier then proceeds to devres cleanup and frees the pxpcs memor=
y,
> won't dereferencing pxpcs->bus access freed memory?
>
> Should the consumer hold device_lock(&pdev->dev) while validating the sup=
plier
> state and reading its drvdata to prevent this race?

The link is established before reading the drvdata, so the window you
describe does not exist: device_link_add() rejects a supplier that is
being unbound and returns NULL, and the caller defers before touching
platform_get_drvdata().

I also removed the explicit device_link_remove() calls on the failure
paths. DL_FLAG_AUTOREMOVE_CONSUMER already releases the link when the
consumer device is destroyed, which covers all probe failure cases, and
manual removal adds complexity for no benefit.
