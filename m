Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951334;
	b=D9GX34X346xqBguOeMBPv5LgDDePwsV3qnIj1v1WIxZO9fcQugWbfbVDWFr+EtyRj1wD
	 16GLNKKDC+8YJ+WInWhe+qkqQvjd1l+tW+QNJ5WJjKFXm5dWrkhl768oLWcmlu/8Bfgay
	 C5rOfqDaoVX54lCqQKNoSmDZyVi8RU4DxgPNmAFckgPe3WBefbgGBCJcWtbohdzhIOCCc
	 0AUq5+ytD5ZhDK8t3za0z2e4hdL+EVk14Sk/CIM+P9z2TgO4biPPsO8eLVPF/KAZXtW8L
	 Eb8urwb0iQxOSLssEl8vmq/HVuh5+Bxg0zyrT5/ajwzgY7lli5fNJvMyMd7Zrs2KvuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951334;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=5C49V8ApgdYuPplPWtGTSmozbjWK98d75cvgnQAdqO4=;
	b=cv5wUKfwkKrNzyBth6uNfcBbeg3aDpQ2+yuEGguifNoZgmGQDZXRDJaeIjJLek4UoOXT
	 kUmg0jbBjHqgmrFJ2ndopVXvf0XbeO8B9PTXtZW5byel00j39SDgpAWU42IHYICvAvfYl
	 zr3FtZjo68zh+Rjz56e0QUtB2vXpVc+A3VXfoWffV2N0U4RgJ137nax8zUImeC/ivnvJE
	 BcRaWRPdfdlx4vrARlmT6MeNYyvzVLRU4yWpEi5ucqJCx2ROvT+SZ8xCw49E+JnhlaPrt
	 BfiOvnD0BcjNZvxjzgPGRHcSQeAFKEvaLXergfs1XG/oPmd/hgZjI+GIByXc1nUi2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eDs3JVfZ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA9606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 18:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eDs3JVfZ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so992866a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951333; x=1793556133;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5C49V8ApgdYuPplPWtGTSmozbjWK98d75cvgnQAdqO4=;
        b=HYIkL/LO/yxqGl0gRR6B/p7E8YnXKFpJhrCz797ofSC/TbBXw6imfXHWVa4TX73cxK
         jSZXXwzgWRswX2IxKRYQEPTjbs5w4HjPMle6+G8bqp5SNxq9Sg51eA5Js4zFXc/rmGx/
         E4p+r6KoSzRm+2xOC+Cq17Lx3kYpCgvrk5NF2S8E1mMjnF5Kqz8yuSgbk3hTaChRGBw3
         UL80Y5Y5xIzhL+A595YKvyTlRsACrOnz7mqxUACTDPgC+jiU9HYxAEwX2ifLClUq4KNR
         tyKX6xVD1TzAFJu8rOIdoJEJQyauPkP0aPeHsOtNpLeIfR8m1EYgKtmpKzRzxCnw37Tw
         Rdvg==
X-Forwarded-Encrypted: i=1; AKwUvBzIffb6C/yq0mAo8/lNo9Suqnh9XJBsndh9CL/rGUOxwuUeXBTb97qXnfCKsWeMLTiCBfCGxzNbnqIB@vger.kernel.org
X-Gm-Message-State: AFq9FYIz3YJggESH5lFzTBbtV3jIE5aihyeEz5TX+dpq+JO6CwW5oWQL
	lh6So3yu1iw9vzNXUq3cpzIHKCFXLmIVgVK6L++m0mz1GFK6ltCeTuaIpnBNXMthnIdvnFTU+A0
	8cLuSkPSD6wkmyvDpd2R0N5BWN/pqvnwcrt+HL58OgwLfYTTiwPltohPSvwAvVY+jX//N5PtHwq
	MKpyPTBDUzztQ37lmoz4T8iZp8NljQQxF5D+FRX2R+ev1DYDlxBUTTJzBge+hsvuCZrHD3/kJ2N
	E2pilTnFiACwPsPJw==
X-Gm-Gg: AYBFou3zf+njMsrXg8vTZTi/jAnwB9Rnq71tmJD3PS5pR4zYClvT8xjp4EoOyAWDfqh
	EajVkrSCEQevallC1cblJbb7qaTl85D6GrbiTpanp2hPtTNVl/y3lehgsBg/2wqgFpvBtMpQySm
	m+K79QWnbFqCL0XYvkRFJxGsY6D6VYeqc/723d/hPLsNw2+rdKO1fTfd+JCI+Gzf31sjAmsEkVr
	1SgT8+I+qNGSXxoEUQwUKH4Tqka8CQnvSBAsAL+4KBWw77aHNcsMZrsZ+diZvXzGl82AQnAhoNe
	Likl74I8hrZAQex+fVuhQD8b4QlYxtDCeo6Ajmsp5pa5t1FytsXwYay16Qx7TYAIvjfp/IROgX1
	ODfHY2Vn7jbxYROyDb5PRcOsWFdupRVmDmJV2dpZDqWXz+1h59mO8EGOxCUX/gB9vfFQGTnQH8j
	O0s2WP8USF3W4xd4Di9USqal5QTD6hKBfMnyhoDPs=
X-Received: by 2002:a17:90b:3905:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3adeb131801mr3960678a91.54.1792951333336;
        Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebae4cabsm4846883a91.6.2026.10.25.11.02.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0bf2140b7so33502177b3.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792951332; x=1793556132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5C49V8ApgdYuPplPWtGTSmozbjWK98d75cvgnQAdqO4=;
        b=eDs3JVfZ1W0us7G08PgCN/tbgLVQMgX5VToLE3NI6UfVuDDRFlieVONu82N70algI0
         DGvdz3jSCiBd04P91MYTiSS6ICHGo1YIgUlYoyqjRaIw5dADui2xMAm9s9Tgb8zk7XpR
         09LM1FQtoAhMPLQTTPHnc5/MIH+EnOcC1t64I=
X-Forwarded-Encrypted: i=1; AKwUvBzMPDkc3vxeSqjng5AgHLoJ1OISjGVUR/fgxC+lkFaDl86gTlE68k/EB2joelzgF31818sa2jAooJVt@vger.kernel.org
X-Received: by 2002:a05:690c:a049:b0:8a8:6fac:21af with SMTP id 00721157ae682-8b166bb1b72mr32998317b3.12.1792951331490;
        Sun, 25 Oct 2026 11:02:11 -0700 (PDT)
X-Received: by 2002:a05:690c:a049:b0:8a8:6fac:21af with SMTP id
 00721157ae682-8b166bb1b72mr32998247b3.12.1792951331097; Sun, 25 Oct 2026
 11:02:11 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 25 Oct 2026 11:01:58 -0700
X-Gm-Features: AclHuK8rfjsuUuTtax2EzpPwPBT_HGupltjSO26Jb5KPBze3R8Wiep0HEr-GBOk
Message-ID: <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
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
	boundary="0000000000003eb708065eae0311"

--0000000000003eb708065eae0311
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:15=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Starting Linux from CFE does not install a PSCI
> implementation either. The working PSCI interface in newer GenXOS
> firmware belongs to a different boot stack.
>
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Set the CPUs' enable-method to
> brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
> mailbox in CPU1's cpu-release-addr property. Set CPU0's required release
> address to zero since it is already online. Keep both CPU nodes enabled
> and leave the SoC's PSCI defaults available to other boards.
>
> Also remove no-map from the secondary-boot reservation. Its overlap
> with ARM's initial page tables otherwise causes the reservation to be
> rejected, leaving CFE's holding pen unprotected.
>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 18 ++++++++++++=
+++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arc=
h/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> index a3616fb7b3a8..23145440e7bc 100644
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
> @@ -56,6 +56,22 @@ button-restart {
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
> +       /* Dummy release address since CPU0 is already online */
> +       cpu-release-addr =3D <0x00000000>;
Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example.
I guess it is better to use the same here to keep consistent, although
what value doe not really matter.

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

--0000000000003eb708065eae0311
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
tmCWNYNIduEXBVtzyVimFhr7elXjL8z3Gek0dXVrsK0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI1MTgwMjEyWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAE4yZgLwooOqcWUwQhI4p6LYMOp68CiwwKJT6
tw6vWkhE0dkiKIjmFMutj0lH5nFdDDrmAl7uspMzyD5/73IWx9uWFj4KbiB8fH6jrByixoAItQlh
jnTdCqX/vflH41be8alYbPPd3DaJA3+6nX90eM4CFnNdalx97AcGsOTC9iMgoG/vkHPYkFerAJ7g
4CheaYyIYiAUmIKCptUy9en3yTpfYAH7PImQk1LxLjBXFu99op8ewg0iAef/E9Uy29eyYib574rF
t4Xx13Zn919K7J+OI6bmZErYfUf0msUW0n4k4IjL4kYiLAnrq6NqU4H+1qDsOAmqz4+FdhdDOCPj
Yg==
--0000000000003eb708065eae0311--
