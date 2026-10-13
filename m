Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8594EF146
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892445; cv=pass; b=TNLCn6i6A7tlVJK45N0+jCO6OrIVMpq36lRLV+u3L16deV89IRgE0FOmdm/qTSXM1sW4SmwbdfGhOPHMsIJ+9xPkBkEGCWg/VDzw/m8all2ZQsAMPsU1cUaYFpmgaR6xmfhRZOrIPvlwfHYbOJ/h1d/5cTsLog3kcsjZgDqFDhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892445; c=relaxed/simple;
	bh=8oEKiTeBHaTRi3F7yMJ7yENZE8ADE+WNsHJTSee7X4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGRqROFl3CAiEZHx6hMapz31CJ8BOZx03+C9OSOX36FUQvIF5swf41Qy6GcWPrhqNK0UD8O6OoJH3zJhKgeMBSRSk1f4T83+4fOwA4XYt72OVYzv8zAkj+pXP2vtXsnSCliXt0WQISD9c2a1lcO7/h/jQbfDu5rSunHI+ybBsCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwmVGgkK; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwmVGgkK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2790085f8f.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892442; cv=none;
        d=google.com; s=arc-20260327;
        b=ra/CaFs3ST3kiCUyh+6PyfLNr9SggfQlCAYMblFTfAiGJ1nP+RUxSfp+RcyWKci/p2
         Y2roe+wb3PZhuklfoMsKwKkauHFN+SZ/YDTuUX/XhAWy/q+W7srCdc7fdy2bcGI/vVwo
         pKm5LDc3z2ZQ62FiFGfWwUFHHVfK3hlZpwBD7dEi2lafSXTCK8X53gPJSlqqTBkzELYF
         YcsewKtYv91+haBWhN3by12O7OJfL4ig1XVwYdf9JN25cp0dHddMquDCOVXNiXkog00W
         nRgSFA/5m9rX1gSZQ34OystcuaasvVPNNuiZMn1fQBJyedkewER059jj5510Vt8swuAI
         uyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlBithpxv3+SM0u2mf9npK5R1KY9qWHzphcmNHpcqZE=;
        fh=LujM5mRTvFCwAf3tWNidrf7JJLGBU8U3v+4LBTw/4l8=;
        b=GNVUDLFbS7zCt/gPraR9kQ+Kp+N+GyYMlzZ95gsxwBsrxlYQSdZ7rxARj37Fi/iKX+
         OBHiZGne8mS5OrAV6dAwVZ99jI90jXS03ziL/W32IZspEhUUNU+R4AIycc+ac3v//M66
         YamYGbmfAPoUNBADnBZ32w/aQeHkHlqRVRrirZ/9xhVaINx5ApM2fbZ3ulGOg7bj5pEO
         H5YyBvYh+ziveyoYWwjPX/W4+eeY7NpuVhXEaIr5AxTdwYr9fRs34GYtDwxSLYiMM/Ky
         Wwlr15TmsKARhI31C7y4owOS5ImiG1uzLfgR4pMS9cnceYmxXZJxRbqYK7cOCq68e16f
         8iAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892442; x=1792497242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlBithpxv3+SM0u2mf9npK5R1KY9qWHzphcmNHpcqZE=;
        b=VwmVGgkKNUYfDldqs0SnHXUuV7IzYAeh0sLoG7CfA2q9OPbQK5+864mBxcSc8Tb8qG
         6KZIzxANjNYChwwP7jjyUPfcOICl7ZCWW/ZhSIBGp1PUMw0kKgSB5BY8AVnMXnwoV3MX
         6x909Hx69RdQJsvhWllG9qPJdRWXfF1h2pIkS8ujteNAdN2p5/lAFxASS/8UPNMVv6/2
         tE8U9FmEcXLrOpBnFbnAeQcKStQKhPGNEEZBBq9QbK5MlZQ0vRRqkU1D3jgj1bmjTrRp
         xk9t5xS2e/sdh2jIn+ueYW2kK8I5xhsOqHuNyiYI8vRMFCt7syf/NXaPqfM+clXKYEwI
         6uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892442; x=1792497242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlBithpxv3+SM0u2mf9npK5R1KY9qWHzphcmNHpcqZE=;
        b=Yog9d6TNOgRt/hD5IE67BnHDwxDYDSfEaqY/pYwn+cJXFbrQkDYOMDBZzBSvvyO4s2
         tSvar6qW7c17SLWYfeCJ6G2aTLtWy7PQLcdNi/spQ80eYsgwrbbnLbQCak/guWuSvdRa
         Lfglpihtl/nDUXpm7SUG7eHqyOZ+sVcpuRvYiR4vahcrr0940AKcY7obMf2yrshRVPsM
         IgUiI63U+Z/aRlofYBmyqBUC6hve/qIQ6i5G7BBkVnuUB9ykjxfaLI5cHDq6MU4gmm/4
         /tN6Tp7KNZmAWIMGZnHSNi/4DSi0F314gfrX06Z7pma/iErlpu+9QyEceg3e6QeKTj+2
         tzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkveWkW+S4yYb/5z0jV/ALHb45hFhcUiH3GxvU+NQOd0tWlhqL+TtC5vYmtowTAhNqXXVBn47wttxj@vger.kernel.org
X-Gm-Message-State: AFq9FYKttAZjJGxeKKxZ0a2HscXFsgaeN1Adchth+p/Dbdtk6QDikr4W
	m2/27TgiDUxEYKftwey3+tfnWq8Mb4OuLT0yEiSPSveBCGtPlCGjG0Ru1ML7lMeNVAAmfRzRXMA
	wbxAETLQ2ddKDebClE5gTh2hdQwAlI2Y=
X-Gm-Gg: AYBFou2j9xVLpiWZxce8Z06k8zGNq6VO0tQyfL6V4/utHOV/Y8suP1Md7q4WGE09O8G
	Fm5yspkRoGwrdtkYk1VJ5zEMXDkQj4aoooLSdXUKMlJPILWkQI8pEt8NL+85YRFBoPZsAr1mPvK
	HqC0JbiPu7AqgPlGyo5zvkebJ2IySlPaCS83c8UiTKmovYAw0sV/ptJ5sEuLy5Led65/Qxu2nxq
	zZHIL+dyoGum6E25ULzZCYrSax2Q09kM8882oF2epaIb80itUd/jV5R0NvcLJeDMGk7ZL/y1Cht
	yZaw9qbxaR7VyYW8zfZ3lAz00xx9C7P0vRUXh/Y81MXJahAnXafIIollYXv5mdyS7sLfz+YL9IG
	a6Nwwaq/ruZHDlcY6HuB+0jlmJbgpoZoIC3Zodmzy+ZYOvWl7GKslGVndYzK6rDG2ejsO7PobEQ
	==
X-Received: by 2002:a05:6000:186f:b0:488:89ad:56b8 with SMTP id
 ffacd0b85a97d-48de2ba2231mr3749233f8f.0.1791892441488; Tue, 13 Oct 2026
 04:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134605F95A87C6335DA319C4869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134605F95A87C6335DA319C4869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Oct 2026 12:53:33 +0100
X-Gm-Features: AclHuK_vgE7RX-bhU5EsKuw0wEUNHv3FisPOnuwxTo3XomXHMF6LXgDT8XOl2lo
Message-ID: <CA+V-a8u7ScDHzSmGG-7ObW4HaCRomkLGdvuy2hd5obEBvjF9LA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Oct 12, 2026 at 7:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 09 October 2026 19:41
> > Subject: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which share=
s the RZ/T2H ADC IP but differs in
> > channel count, sampling, calibration and resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable =
12-bit and 8-bit conversion
> > resolution.
> >
> > Expose the fixed sampling frequency as a read-only attribute and allow =
the conversion resolution to be
> > changed through the scale attribute.
> > Use extended scan types so the reported scan type follows the selected =
resolution, and prevent resolution
> > changes while buffered capture is active.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated Kconfig description
> > - Included array_size.h
> > - Dropped unnecessary extra line in rzt2h_adc_write_scale
> > ---
> >  drivers/iio/adc/Kconfig     |  10 +-
> >  drivers/iio/adc/rzt2h_adc.c | 201 +++++++++++++++++++++++++++++++++++-
> >  2 files changed, 205 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig index a8=
02d8ee4dd9..9a58f8b5868b 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -1587,14 +1587,18 @@ config RZN1_ADC
> >         module will be called rzn1-adc.
> >
> >  config RZT2H_ADC
> > -     tristate "Renesas RZ/T2H / RZ/N2H ADC driver"
> > +     tristate "Renesas RZ/T2H / RZ/N2H (and similar SoCs) ADC driver"
> >       depends on ARCH_RENESAS || COMPILE_TEST
> >       select IIO_ADC_HELPER
> >       select IIO_BUFFER
> >       select IIO_KFIFO_BUF
> > +     select POWER_SEQUENCING
> >       help
> > -       Say yes here to build support for the ADC found in Renesas
> > -       RZ/T2H / RZ/N2H SoCs.
> > +       Say yes here to build support for the ADC found in Renesas SoCs=
:
> > +       - RZ/N2H
> > +       - RZ/T2H
> > +       - RZ/V2H(P)
> > +       - RZ/V2N
> >
> >         To compile this driver as a module, choose M here: the
> >         module will be called rzt2h_adc.
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c =
index 0703c2025e3f..be8273f3b61d
> > 100644
<snip>
> >  static const struct rzt2h_adc_chip_info rzt2h_adc_info =3D {
> >       .chan_template =3D &rzt2h_adc_chan_template,
> >       .sst_to_freq =3D rzt2h_adc_sst_to_freq,
> > @@ -796,6 +973,7 @@ static const struct rzt2h_adc_chip_info rzt2h_adc_i=
nfo =3D {  };
> >
> >  static const struct of_device_id rzt2h_adc_match[] =3D {
> > +     { .compatible =3D "renesas,r9a09g057-adc", .data =3D &rzv2h_adc_i=
nfo },
> >       { .compatible =3D "renesas,r9a09g077-adc", .data =3D &rzt2h_adc_i=
nfo },
> >       { }
> >  };
> > @@ -804,8 +982,17 @@ MODULE_DEVICE_TABLE(of, rzt2h_adc_match);  static =
int
> > rzt2h_adc_pm_runtime_suspend(struct device *dev)  {
> >       struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D pwrseq_disable(adc->pwrseq);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_assert(adc->rstc);
>
> I guess to apply assert reset, IP needs power.
> So, you need to asset first and then power off.
>
The HW manual doesn't mention any ordering of power and reset,
although it does mention the ordering of power and clock which the
current code adheres to. For example see the below logs where register
RZT2H_ADANSA0_REG is written a value of 0x56 at the begining of the
suspend call and the same register is read back in the suspend call
after turning off the power and in the resume path the same register
is read back at the very end and we can see the value of this register
is reported as 0x0 which is expected to reset to its initial value
(full log can be seen here
https://gist.github.com/prabhakarlad/def672bbca9cc51d0398a6549bcf1b80).
Please let me know if I have misunderstood something here.

Logs:
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<=
<<<<<<<<<<<<<<<
rzv2h-evk login: root

WARNING: Poky is a reference Yocto Project distribution that should be used=
 for
testing and development purposes only. It is recommended that you create yo=
ur
own distribution for production use.

root@rzv2h-evk:~# >>>>>>>>> First Cycle <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
root@rzv2h-evk:~# cat /sys/bus/iio/devices/iio\:device0/in_voltage0_raw
[   46.125340] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_adcl=
k on
[   46.132399] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_pclk=
 on
[   46.139386] Resuming ADC
[   46.141915] rzv2h-cpg 10420000.clock-controller: deassert id:110 offset:=
0x93c
[   46.149054] Enabling ADC pwrseq
[   46.152245] ADANSA0_REG: 0x0 in resume
216
root@rzv2h-evk:~# [   46.531171] Suspending ADC
[   46.533951] ADANSA0_REG: 0x56 before power down
[   46.538732] Disabling ADC pwrseq
[   46.542095] ADANSA0_REG: 0x56 after power down
[   46.546681] rzv2h-cpg 10420000.clock-controller: assert id:110 offset:0x=
93c
[   46.553829] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_pclk=
 off
[   46.560951] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_adcl=
k off

root@rzv2h-evk:~# ->>>>>>>>> Second Cycle <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
root@rzv2h-evk:~# cat /sys/bus/iio/devices/iio\:device0/in_voltage0_raw
[   50.491213] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_adcl=
k on
[   50.498271] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_pclk=
 on
[   50.505242] Resuming ADC
[   50.507785] rzv2h-cpg 10420000.clock-controller: deassert id:110 offset:=
0x93c
[   50.514923] Enabling ADC pwrseq
[   50.518111] ADANSA0_REG: 0x0 in resume
126
root@rzv2h-evk:~# [   50.896990] Suspending ADC
[   50.899881] ADANSA0_REG: 0x56 before power down
[   50.904545] Disabling ADC pwrseq
[   50.907914] ADANSA0_REG: 0x56 after power down
[   50.912504] rzv2h-cpg 10420000.clock-controller: assert id:110 offset:0x=
93c
[   50.919642] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_pclk=
 off
[   50.926761] rzv2h-cpg 10420000.clock-controller: CLK_ON 0x640/adc_0_adcl=
k off

root@rzv2h-evk:~#
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<=
<<<<<<<<<<<<<<<

Changes made to generate the above logs:
--------------------------------------------------
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cp=
g.c
index 7ce94680c79a..eab6237dca4c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1169,7 +1169,7 @@ static int rzv2h_mod_clock_endisable(struct
clk_hw *hw, bool enable)
        u32 value;
        int error;

-       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
+       dev_err(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
                str_on_off(enable));

        if (enabled =3D=3D enable)
@@ -1324,7 +1324,7 @@ static int __rzv2h_cpg_assert(struct
reset_controller_dev *rcdev,
        u32 mon;
        int ret;

-       dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
+       dev_err(rcdev->dev, "%s id:%ld offset:0x%x\n",
                assert ? "assert" : "deassert", id, reg);

        if (!assert)
diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index be8273f3b61d..36ff6da87138 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -984,9 +984,14 @@ static int rzt2h_adc_pm_runtime_suspend(struct device =
*dev)
        struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
        int ret;

+       pr_err("Suspending ADC\n");
+
+       writew(0x56, adc->base + RZT2H_ADANSA0_REG);
+       pr_err("ADANSA0_REG: 0x%x before power down\n",
readw(adc->base + RZT2H_ADANSA0_REG));
        ret =3D pwrseq_disable(adc->pwrseq);
        if (ret)
                return ret;
+       pr_err("ADANSA0_REG: 0x%x after power down\n", readw(adc->base
+ RZT2H_ADANSA0_REG));

        ret =3D reset_control_assert(adc->rstc);
        if (ret)
@@ -1001,6 +1006,8 @@ static int rzt2h_adc_pm_runtime_resume(struct device =
*dev)
        const struct rzt2h_adc_chip_info *chip_info =3D adc->chip_info;
        int ret;

+       pr_err("Resuming ADC\n");
+
        ret =3D reset_control_deassert(adc->rstc);
        if (ret)
                return ret;
@@ -1011,6 +1018,8 @@ static int rzt2h_adc_pm_runtime_resume(struct device =
*dev)
                return ret;
        }

+       pr_err("ADANSA0_REG: 0x%x in resume\n", readw(adc->base +
RZT2H_ADANSA0_REG));
+
        if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
                return 0;

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 40760977f7de..b6886dba92a9 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/pwrseq/provider.h>
 #include <linux/regmap.h>

@@ -31,6 +32,7 @@ static int pwrseq_rzv2h_adc_enable(struct
pwrseq_device *pwrseq)
        struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);
        int ret;

+       pr_err("Enabling ADC pwrseq\n");
        ret =3D regmap_clear_bits(regmap, RZV2H_SYS_ADC_CFG,
                                RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
        if (ret)
@@ -45,6 +47,7 @@ static int pwrseq_rzv2h_adc_disable(struct
pwrseq_device *pwrseq)
 {
        struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);

+       pr_err("Disabling ADC pwrseq\n");
        return regmap_set_bits(regmap, RZV2H_SYS_ADC_CFG,
                               RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
 }
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------------------------


Cheers,
Prabhakar
