Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815403;
	b=ZWLwylWZMLUPNB6RiS4svbYjsXI36QaqiUFI3hD6DQ3ZSjqaZHfCq78M9qhEIb3Qr7x3
	 iBxFAQjWwjzFGdM6/6rhosPjy//1KuqAxELeD23L2kXV9k0/EJ9VC44w3Ws7iKMZAm4Gv
	 tOWPbe3gY0bnov3NDyyjYxpoitnXclWnVbS6JpdhTjeHSAWf7HE5EQ4row6IpzBj5TguT
	 0osEUIWFg8jStm22ldhvBqA0h51QB426BD0UoSORzUxRc60D+7S52G/KD/1hfI7tQty68
	 1Pz7Jj3aqWzyewB38eqLdtQEL672yhXuq5CSwSpbWm6EyCHte2LABLld1pgeIYNLIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=NxO1ArGF/ouncJjlNiC6eK7NyLkkHrtVCnIHNEm5JoM=;
	b=hlYl2anAByNRCfpWQ0vUQEK56ete+cxwSVg0WL7SfPdstXJLwOsY0hTznEtDogXNFzg1
	 WoKf8yanze7tq2NLRPU/oyY1Qoraux5zpXsRJWNd+zO4nclgu4yBfwe4HbkRvc7DQVUrV
	 TjU4d2Uhks/aBFxvlqLvjIsSoFF1fmOB7+a/2ytS2dFa2xN/NqasTh/FVFs3JlKkicz/r
	 ntDzvHFzIgPcW/imMWFJ4roA+0alMZBD4KbY6BI6aQEoLuHacWw09mzxd4K048+iz1J1A
	 k12KNf1WsxBIg4XSRait2yXnsQEnziP7B+3B7mSfVf/XvEcrbmSWLiT1DRzgCcQMH6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TGpRFMFM;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4D606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TGpRFMFM
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e5378b281aso10214155ad.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815402; x=1793420202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxO1ArGF/ouncJjlNiC6eK7NyLkkHrtVCnIHNEm5JoM=;
        b=KtKVJFcQtvexgEakI6gjJVm8kmbltEiFNe6X1fzQmvBL8RTVYiO6IniU5oQMcmFA/V
         RU3iFe7h4pi3jYDwyRy6R6nDxvRAySVq/92OiV94eM5rYfF8PoFo+RYl10YhUUtzr+FS
         mrIuPuDJC7rfZNTzLNf3DPJYvTIMyuxjFlhmu56H9kYpqy08lPnt5KydsXS8Z7I55Dc9
         SHofo3lfQPVlJBpXR1ioUAtPziLlZ2Osz5IMV+aqTPgKooegT+3S3NtwxrNvPnTtVQ/Z
         yqvPHYe/Fdm4kWFYdl+lINEZX8W3WXs8SiCJ3C0A7+MzdvH+MMNT6O4GnaU0OFNiu43L
         IlzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTaaqu+ZH+MTKSQbQ30l5PfvgzubrQdy4S/Ax7IzI3N8AALTtI9AAepEG0aAeO15M1QjL7cNcv1q9U@vger.kernel.org
X-Gm-Message-State: AFq9FYJUg/yHYjP9dM3rxYuFhDRsc8PnolpK5sNLVqiuaGHYT4L7vyzG
	+/VjYII2vNZ4LlVY7BFnBhFJv4aNRZzeklquCd0K17aUGFoWC5nA9ZG2/+o160pWnOOFZZtImTR
	sQ/3ZKVfvLqRSeWsa3nfJcBfuA6xEkf86v41henoggPD5uJ41U9OKAmnJT8Y5Ixe1Rg2/O1URfM
	wJ96+uz8YAXst1WXPpa5OdP+XJau/kjSVGlUpoi0zDXuDGRHi4t9zWe3dL0Q/BbxJkHMIZz0Q5l
	LHi/ZePAyZPA0j6pA==
X-Gm-Gg: AYBFou2RhwQP1wOjtJsY0qyt+g0CA1sPTnRF/oiPWH4UfshRxEFnw966ChljjxdZnxc
	IUoUWU8KFHeoBYcXc82iJu5HmAKYTzDp3AkaLocUJqdz4kjDtrE92iso9D0nDZBu8gYS796DVvf
	vU/jegTE//W9Rnz8PUjP3nuQa2Q3qXcOZ9moiN5XWSRdy/+4WfnD9OAV1FLEV2FMulvioRareqJ
	aJH6gMIskE56o1DtiuSJ4hgvwhuUfw9xjs/Mnh9b5RpOQDmoWXUMD2aHwLLPetYrGvAhGrm5Ipd
	XO9ZrjxToo8MirGXgk3/+wyZJCvy89IavMGypXwGBoa6SgoLkxQ+UeOsRzKuX64Fruj/gzDI1jI
	xGoJ3GDIGKD2cV/06Nvvka6Pb2a4MgPkj1HB/HACoyclYIlCYuFpVTNxVmRLX6pO8Fhi4c2XpKd
	dtL4cBTkZIvi/F/NNnxD6fgtoqkjU+k4tG7Cbz
X-Received: by 2002:a17:90b:5105:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3adeae71db3mr1058360a91.29.1792815402156;
        Fri, 23 Oct 2026 21:16:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebb0a2e2sm1008434a91.7.2026.10.23.21.16.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 21:16:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0d978e4faso25101327b3.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792815401; x=1793420201; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxO1ArGF/ouncJjlNiC6eK7NyLkkHrtVCnIHNEm5JoM=;
        b=TGpRFMFMvezrEXptz76Odi4QNzsKY4pyKz8ut2AV+39pkYXCCxGq5C+IYGw2RSmZju
         3/gJDX3h1uSBYrgdVn/T0Eug4LHvWFTFld8N1uFgDg7MPMIXqkKA1acOiTPuJ9KZzg/5
         deFvksOyKigAbp9u3LpvbJp5Ru7uw3hJzG9W4=
X-Forwarded-Encrypted: i=1; AKwUvByXHPFD2n6PPDgJPA7F6uiccy5sTq65sl1SYPzVRzSWa3xOdF7g8FUQ+rCrOuKAsDnz1oVlyMQd9ko2@vger.kernel.org
X-Received: by 2002:a05:690c:e1d7:20b0:8b0:e207:34b4 with SMTP id 00721157ae682-8b166b86c4bmr6719947b3.18.1792815400826;
        Fri, 23 Oct 2026 21:16:40 -0700 (PDT)
X-Received: by 2002:a05:690c:e1d7:20b0:8b0:e207:34b4 with SMTP id
 00721157ae682-8b166b86c4bmr6719867b3.18.1792815400478; Fri, 23 Oct 2026
 21:16:40 -0700 (PDT)
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
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 23 Oct 2026 21:16:28 -0700
X-Gm-Features: AclHuK9RuItz_DZ3wVK43enrFIQGul9TWQAwbLIKANHNYfy1pUzBkwXbxgy7ZtY
Message-ID: <CAHi4H7ES2GEWN+NZbCUUe9n6YvTPnDbVn42XzqyDfAybub2tbA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
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
	boundary="00000000000021e3c7065e8e5d3e"

--00000000000021e3c7065e8e5d3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:10=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Starting Linux from CFE does not install a PSCI
> implementation either. The working PSCI interface in newer GenXOS
> firmware belongs to a different boot stack.
>
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Set the CPUs' enable-method to
> brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
> mailbox in CPU1's cpu-release-addr property. Keep both CPU nodes enabled
> and leave the SoC's PSCI defaults available to other boards.
>
> Also remove no-map from the secondary-boot reservation. Its overlap
> with ARM's initial page tables otherwise causes the reservation to be
> rejected, leaving CFE's holding pen unprotected.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 16 ++++++++++++=
+++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arc=
h/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> index a3616fb7b3a8..45d4df523110 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> @@ -34,7 +34,7 @@ reserved-memory {
>                 ranges;
>
>                 secondary-boot@0 {
> -                       no-map;
> +                       /* Includes the kernel's initial page tables. */
>                         reg =3D <0x00000000 0x00008000>;
>                 };
>                 pmc3-firmware@8000 {
> @@ -56,6 +56,20 @@ button-restart {
>         };
>  };
>
> +/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
> +&{/psci} {
> +       status =3D "disabled";
> +};
> +
> +&CA7_0 {
> +       enable-method =3D "brcm,bca-smp";
> +};
> +
> +&CA7_1 {
> +       enable-method =3D "brcm,bca-smp";
> +       cpu-release-addr =3D <0xff800568>;
> +};
> +
>  &gpio0 {
>         status =3D "okay";
>  };
>
> --
> 2.56.0
>

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--00000000000021e3c7065e8e5d3e
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
mquUAu9dQtewxjHBhnp8oeUn3BuihIc6Y6BluEPXDUUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI0MDQxNjQxWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEABnlWVpIgsI5eMPTawGdB006DrFLMKLYEP540
hr72tIjbeEAqyAPU+ITWrBp8Czmz4zGLFQDusiaBhuuHOyHxtm6Gdd4PiHo5v6B0IAhWsS5J92ma
hL2QU3nX7jJgbp+JxZHAszWBlMFHM4AoXgWM1wXZ8o5tcZt+aIaBOuzZVD9ULb0ol8FxD/BbwbSn
AHyMqgV4MNGaeICAV0BCA3uT3auLFnQDQNMmeRNSG2UhQFdrMMA7CnEPLRDhMSNRvS93HLmIHIUz
aon5Fv3MTltzDum67VT3v4ew0pSS/cVheQF1c95kzsefxaqe/R/CqohumQiXXdC/j6uqL4EekDbR
og==
--00000000000021e3c7065e8e5d3e--
