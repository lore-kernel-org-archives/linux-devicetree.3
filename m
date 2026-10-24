Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815326;
	b=lArYDRhbEytP+BRQnzgL/36YDqH4QFAZ+HjbA4gf5loHb7Gp9AdZgoWGlizuRvcaOGCo
	 O/0g0pwFksVeKNbBjduMe4fCPpXinJ0RGvqC5BUk35P/dqMrkX4aD1eTTpz3a9Otxh0cI
	 c/wMNc12gXJpR7M98jwc3GdZkAgd7qtx6tOKFtCwTM1vRNFFWOln8jOPX9GXn882xY+ja
	 5MXa7oP9szj7nioVvR6PnbBSo6G37epDl1WahvrJIx91QOXM6WG0+m8r0Dr0KPWCg/vV9
	 VhIEL512zQkGxm1MLKgG6J6adgtnNg/jaY8VWN1168cmDpTR8V059idhLfQe//6Z4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815326;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=TJa5U577EWGlQslkhoqw4b8GmJSFbtq6SM0aUFd8XA4=;
	b=CEoY6glvZcnRKpC/QqVkLCy0Xah0F752y0dkuS72KzXlbGTbtgJN83qoOz7np6Z356YK
	 Q6ZxSnqcNPx6bC2TJ/ywne2DyXjzNFSknjKdBsLubBaoRga0VOkL8khrrS1jDtGvk4WCZ
	 WZKCxrEHH7cJZGlaoxJmVoR7JE6VJ/gSU5e2+Wh71nWNhWd0h2RS86YombvWRWWrpOC2O
	 5I0a+m0oJ71XiLAnKgBpMur6t4yZgr1fpdNfwfzEp76+pWoXdj6AxNzAelGG9zP2y5157
	 nfJVwAc761SA0FSqiYAVZOROWKAqJVIhoQFargHh2eO8mTxdUn6K+nmAcZ3H/gTn0kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XtaHdzlT;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DC606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XtaHdzlT
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3550c917fd3so2230925eec.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815325; x=1793420125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJa5U577EWGlQslkhoqw4b8GmJSFbtq6SM0aUFd8XA4=;
        b=ueTnHPW9z4YZC0MNqxmRBFQMwTHEs5q6pce+NETOuOFp0d8PdRmzdGuDR9wSa5N+FH
         M+ITwkY6/fnhK/wPcv8MPlVYh5sIdQkTeBvsYtOsnIFchGSdEUJ+E1cOdFqiyYv5ocC2
         FyxGdTYlaAcLiM1cM7iyCBDATx/Y1Tm67wkx7gCVvpaNenLIfL6CZjBq0QWezJCc4v4+
         iJ/DuP1IXCphFwVVDIdgIjsXYePWbuYlnLW51ike5Q8daKQOX5Jy+HUGtr6qtDxSNcib
         0d8bvnJb60xycxIHrPZ+mlb+L4YdWObJQLquWF3KiHNOqcByq+BdhiAIbmvkmDoi766/
         R98A==
X-Forwarded-Encrypted: i=1; AKwUvBzCs8IDmyN5dWRXCcfraKM+zjgaNsHzgxcQ490goF/Cfmhif5F011BTcF/WlOsfMP/9RoFy9KnJRHr6@vger.kernel.org
X-Gm-Message-State: AFq9FYLYk8IYN7A2CUf61NvAnKnvOmKUp/h6kSzkmZH9oYJcdgzLm/KE
	ElUz6wGwxbWWgnTSQ9Gt2ot4IDADaYLQESAOzY4TajAkN4+4BjiBrIf6R25X2tuFeQEQ8+AmmrF
	DVXEPGqFLxDBSmyVGXUYXA0LLyLHTopNHfAlOJVrQbdFBTzpPDIIplTSX/6ng6bx5WzwuNWUznW
	YVa6afuUwevQ+xsyqRye8mTj656l8NqU6dcm7sebCsb25Bv71VoQQOPEJ3PCafpbo/Kxfw+1D4h
	f29wSOWIFRDgP3Cig==
X-Gm-Gg: AYBFou3U8rIwYk3fCGgXmHiKSikRFA2a6czoswTJyjkZWSZjqjoxM4+jpQNbu2tBYpG
	7LpnKebdZGX80fuOlxfDB/3tUCJCvPYiXT3su4k8jLIdpjr9ESelwj0g116glCHyDbXXXXnzN51
	axPq12Spal18Fs/YCJwL/Nd+GIEpmMRMUSsoT5ni82U8ShUiLO+QB4x7hAJlCILEzae2Z+AaaFE
	1DGovMEguQPwt6x1nZxcZ3WAh6JDjIM2pTdmusWK5ROEhY0XNQuE2Va7C6wFUwfqD8RCOzrVvVc
	jYhe2gDSQfZksRrydNbw67inG/QKSZOC+R2kLVLU4Ps9i+uYsGDa/MLb6hQCzP1csCOjMooJ3TD
	8ax5CJ2gn9vZLDZa503MqMCmXGHNHqt5FGRnCropJH7kl2UU6pCi9b62ES9gAkNTiOTvxiIRlsn
	rMtABhzrSQ1uoHqgoiG5BpY3yuquy847JVCbU2
X-Received: by 2002:a05:7301:188e:b0:368:6f29:f26c with SMTP id 5a478bee46e88-369e83369ffmr1593095eec.4.1792815324593;
        Fri, 23 Oct 2026 21:15:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-369e8f5fc3dsm11847eec.14.2026.10.23.21.15.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 21:15:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0e757e70eso25482147b3.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792815323; x=1793420123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJa5U577EWGlQslkhoqw4b8GmJSFbtq6SM0aUFd8XA4=;
        b=XtaHdzlTLsFg7sv8WRMufy+mIB94RltncBzW/KqB4ekssiPAsELDNOfoQM6YAfVQsK
         xdsGJ4AIeZeJ2VHJBzgxCI9JwFAn0SguGF6grGZuItV4cIIAubrswBz+LoAlQpxjoNb9
         6Hi6UpylE+tgYLpjn3UjnFrGMDNMLOwwdO6pI=
X-Forwarded-Encrypted: i=1; AKwUvBzXW2AecaNOYYUWytbRD+hAT7vam4V3Hi90Md3evCdP/UDJIJTmpsNfJYxB7lcOMMSM63NicpHFsg6F@vger.kernel.org
X-Received: by 2002:a05:690c:e0d2:10b0:8b0:e238:2716 with SMTP id 00721157ae682-8b1669e4693mr5708807b3.2.1792815323038;
        Fri, 23 Oct 2026 21:15:23 -0700 (PDT)
X-Received: by 2002:a05:690c:e0d2:10b0:8b0:e238:2716 with SMTP id
 00721157ae682-8b1669e4693mr5708687b3.2.1792815322635; Fri, 23 Oct 2026
 21:15:22 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-2-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-2-7c871f1755db@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 23 Oct 2026 21:15:10 -0700
X-Gm-Features: AclHuK-gGJpSwkg-29bJjBMoh3mShMyyFMuIMm4hsVsfGjBF1BHx2Sk3mGmLrfc
Message-ID: <CAHi4H7FLByZDW2QjwFUfzm=E2Kiq_igQMZS-7smgLrLWwM0Lmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007f051c065e8e5810"

--0000000000007f051c065e8e5810
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:10=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
> waiting for an interrupt. After waking, the stub reads the GPIO
> GeneralPurpose register at 0xff800568 and branches to the stored address
> in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.
>
> Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
> booted through CFE.
> Read the mailbox address from the secondary CPU's cpu-release-addr
> property. Map it as device memory, write secondary_startup_arm and
> complete the write before sending the wakeup IPI. CPU1 is already
> running, so no power or reset sequence is needed. Using the ARM entry
> also supports kernels built in Thumb-2 mode. Clear any Thumb function
> pointer tag before programming this ARM entry address.
>
> Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
> nodes select CFE bring-up explicitly. Build the BCMBCA machine
> description independently of DEBUG_BCMBCA, keeping the debug UART
> mapping conditional. The generic ARM startup code retains PSCI priority.
>
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-bcm/Makefile       |  2 +-
>  arch/arm/mach-bcm/board_bcmbca.c | 56 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index 6baedf4c6304..fcc4e0174adc 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -58,6 +58,6 @@ endif
>
>  # BCMBCA
>  ifeq ($(CONFIG_ARCH_BCMBCA),y)
> -obj-$(CONFIG_DEBUG_BCMBCA)     +=3D board_bcmbca.o
> +obj-y                          +=3D board_bcmbca.o
>  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
>  endif
> diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_b=
cmbca.c
> index b510d959870a..248b8bd77645 100644
> --- a/arch/arm/mach-bcm/board_bcmbca.c
> +++ b/arch/arm/mach-bcm/board_bcmbca.c
> @@ -1,9 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/smp.h>
> +
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> +#include <asm/smp_plat.h>
>
> +#ifdef CONFIG_DEBUG_BCMBCA
>  /* This is needed for LL-debug/earlyprintk/debug-macro.S */
>  static struct map_desc bcmbca_io_desc[] __initdata =3D {
>         {
> @@ -13,12 +19,62 @@ static struct map_desc bcmbca_io_desc[] __initdata =
=3D {
>                 .type =3D MT_DEVICE,
>         },
>  };
> +#endif
>
>  static void __init bcmbca_map_io(void)
>  {
> +#ifdef CONFIG_DEBUG_BCMBCA
>         iotable_init(bcmbca_io_desc, ARRAY_SIZE(bcmbca_io_desc));
> +#endif
>  }
>
> +#ifdef CONFIG_SMP
> +static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
> +{
> +       struct device_node *np;
> +       void __iomem *mailbox;
> +       u32 release_addr;
> +       int ret;
> +
> +       /* CFE has already powered up CPU1 and left it waiting in WFI. */
> +       if (cpu_logical_map(cpu) !=3D 1)
> +               return -EINVAL;
> +
> +       np =3D of_get_cpu_node(cpu, NULL);
> +       if (!np)
> +               return -ENODEV;
> +
> +       ret =3D of_property_read_u32(np, "cpu-release-addr", &release_add=
r);
> +       of_node_put(np);
> +       if (ret) {
> +               pr_err("CPU%u: missing or invalid cpu-release-addr proper=
ty\n", cpu);
> +               return ret;
> +       }
> +
> +       mailbox =3D ioremap(release_addr, sizeof(u32));
> +       if (!mailbox)
> +               return -ENOMEM;
> +
> +       /*
> +        * The CFE stub reads GPIO GeneralPurpose after an interrupt and
> +        * branches to it in ARM state. Clear any Thumb function pointer
> +        * tag and complete the MMIO write before sending the wakeup IPI.
> +        */
> +       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> +       dsb(sy);
> +       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> +       iounmap(mailbox);
> +
> +       return 0;
> +}
> +
> +static const struct smp_operations bcmbca_smp_ops __initconst =3D {
> +       .smp_boot_secondary =3D bcmbca_boot_secondary,
> +};
> +
> +CPU_METHOD_OF_DECLARE(bcmbca_smp, "brcm,bca-smp", &bcmbca_smp_ops);
> +#endif
> +
>  static const char * const bcmbca_dt_compat[] =3D {
>         /* TODO: Add other BCMBCA SoCs here to get debug UART support */
>         "brcm,bcm6846",
>
> --
> 2.56.0
>

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--0000000000007f051c065e8e5810
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
z3ZQpoCrl/7Hn0Esg0FnwFQWKp/lYw9RnsTOEA2nYHcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI0MDQxNTIzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEACXqBYSMNIf2CAYP66jG5CSOkBcftdzrU5zYj
FxIH6wkmu9BroTvGqup968Wno6rfyJ6Ptu4VcgV/gQOMNg6IpRemerWM93bFok/XTfMeTEpdGH0W
5jqfg3Uz2sOP66FZjP17X5fQlG+jwVUHIJJVGhyc48ZQa5axLRlXx+j+GOUHQXP9FGYmEC2whMNW
4LlubvhGb6kajQsUPiNyt9uyAwXD5V3bIPoEuwbMNW7A+9ecRAmQWd2Y1XiM7iBSx0BBZQ7ow2Q1
NA59rLpxGg8TzBBZ3xZxCAb2xvfLNv2tnKFJX0smLSQ8iEPAS/jaT/LQ6BGKxb17un9BxYC1ziYy
pA==
--0000000000007f051c065e8e5810--
