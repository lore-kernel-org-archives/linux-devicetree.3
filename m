Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815622;
	b=M6Lbs2C2x4u7o78scdq5X1uf208TzzpHUummFWJayyJ9PxkwXzd7XYFb2/VY7lVeNsbS
	 pk3ITdJ0TZIwj6wuH2FdCDz4O98NU3LAZZfU7m9uhyCrZv8nInIKZxIJ1M96cuW7XMFYq
	 GHcwcK+lGDCLAbOjUSm5/ea8SGdThDiTCKvb7//WYg0PYSbQzibdW+nrkYrMGqru+61oj
	 20wDSueI9SWJ8xKt2JuPlkbg9gza1sI6tsGSy/9YeWe39EzsEsuXFomEY6gzorV6erGU3
	 EJcjSPhx13C1sQ4Ww8VkeD+BiokKFq1vwYDmgy2eFnOvIk1Jh6J8RdGEpmiyFr59dDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815622;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=jGQrYdri7l5Ge8lTQSKZFuRUGOdSY70OgzsQrO4cwUQ=;
	b=SD/P7Zf9MYLyEWI+AnofSsiT8zl42bNot+TpmuxgqsT916Jp0yKmBWdEqFeS1kJDu5xJ
	 SYfX2YovIUoY8KuH2bCA68BDjUFX2xoHXSz1hO4vTAB/T/8SDeFBA9H3+EiXNAUcHnBr6
	 LxTf4qeDYfSFHkyPWPvsPfaYuAW9d+MqNRfRygQboIlK96DumGgQav9ONXwDVdACOffcx
	 6Ts7T0cQZOGVkYhOIux9LQeNpnObu4hu0rx6HT1PvwZ6SQ7ep5XorQ1HGxXrgxlajS16s
	 B1QCADzyajlciO1NNCCPQJgWWser6D5Zm8lbE1M0exD8tJl4RUWghOZGQ+nkSCOYwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hPPk8RYp;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B77606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hPPk8RYp
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-679334baa1fso1596305d50.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815621; x=1793420421;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGQrYdri7l5Ge8lTQSKZFuRUGOdSY70OgzsQrO4cwUQ=;
        b=eayURg5w0OX486ybVJxHqpEM5qTXqpER6Qir4KnCfDltyA2zRaach4pQLTsRApa3gv
         NmDGOpNtuiQVQGX4OsiZq5BFketJ4HJh6CaFSncDlApCPOJq6ZWG7vaEkV+haJqpECQh
         VGduE46eF8E+SbKj7ZcvUOsaRSi8gpND/QyzN5ZuS9Xf3FxWh/Q00TrIUa+tByZiqSmg
         +YEw+E9YXet5ubec4Bd2qRgiipwOxK4O5uop7PiBZqU+TGq67hLOTUC38v/YDmVFW0Bj
         b1+BfANVlRw/tRztlhl8aMxg4FMuuNCqXbPyKYDXj/4x6vDb6GEM1SjDSSYcnN1jky71
         S1rw==
X-Forwarded-Encrypted: i=1; AKwUvBwZTdPIWqkijqyxQFg/dNdOJ2sCkWStiHteyiee3obGk/Hbv0fmxFpaALWtHNzypDGqBiMeYCEpdVpo@vger.kernel.org
X-Gm-Message-State: AFq9FYJX4z/7fqnbPMEumXShRmExxPKzmfTiqSvB2ZG7ODAsnFwYCp09
	vqTGJ/ZcvGOe6PRqOnbo1F4WaXpZuefjrPJVj5nyPxXC/aQ/lfh8VQlm11bmyjKOYSpsQKLmJ8g
	6AaMXw/cuIZiIJognoQqDHgqGeVB9OKQrSbPa2LTGaSjvSOIH+/mdXW+PnIyedH1eRC7ufn/wHV
	lsSnLso0JGTOQ4RRbAf/DrenOYwmIqIODAKt49zF3kndWMFdFA/lu1sTNADgH+cB7Bv4mCfITKh
	X8DiSsTsG201CYG1g==
X-Gm-Gg: AYBFou0Yonzl1dEHEm3aCwZFh+OW3//PRoVk6UjJx6oh58/ccF2cC9Enf7K/gNDO8ws
	Rsm/muMPRMKgam3iP0KhmkqESLXdrjtv80/UuJTp0Zt2zx5eNBOwhp+UD8JjcOMZm6yPGYXEUsV
	hM7EEUt4wiGhtUcisn5Xtyn/2KJNUk+tIhjGvkmdUDpzqH8QWt/FUlsjwJNr46xAWRj+TcfaVX4
	AKEPlbEyqfHr0ymdWbpMb5wsONx26Mkz2Rae0GtrySwfsIAxHm3bGvKwI0Q8/ssaEHhS/sp2sC/
	6zCfiBPwVB6//OhI8eQm3QaIl8+6xxT0Yek0vjHlQFnlB+6N3Q+I+ySYOItZD53SJJyhV17AsjU
	sgHx8juXIahxVQmqQwGJpCTTcxIUq68Dcj2OrxhhFP1/3yOd+byiBzjByqflhErmHHHU37CXAWq
	e7KzN+J0jf2VG0xwCIu24hhlXxEJ34oqkVyXkJ9eo=
X-Received: by 2002:a05:690e:dcd:b0:679:8ba4:e912 with SMTP id 956f58d0204a3-67a4554fbc1mr668945d50.133.1792815621030;
        Fri, 23 Oct 2026 21:20:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67a4615a30bsm11154d50.48.2026.10.23.21.20.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 21:20:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0cd41e7aaso24513357b3.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792815620; x=1793420420; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGQrYdri7l5Ge8lTQSKZFuRUGOdSY70OgzsQrO4cwUQ=;
        b=hPPk8RYpQMjYsfCFwHeF47xz5kpFvI6uuonnmkzypvvytP582PK9Xcu94u/wZ1n9+V
         E6xGeYm2CDSCzB5nOLN+0Ee8xwJzNjdCYv3RfX+OUsOOLGUd0mEQWF30SQx0EEZku4Oh
         LwWLaS9kyu/sjotoOTjYArXxXw96Bz+W8sDq4=
X-Forwarded-Encrypted: i=1; AKwUvBxf05XGzNuOluHYpdyYjtzqS8ZL3q47SotEVd6KnNAy5EUk1liJ+ra6XBrC3Wen7xr0S3D84OaGIrO2@vger.kernel.org
X-Received: by 2002:a05:690c:c18b:b0:8b0:dabe:cf3e with SMTP id 00721157ae682-8b166c3b836mr6714207b3.49.1792815620243;
        Fri, 23 Oct 2026 21:20:20 -0700 (PDT)
X-Received: by 2002:a05:690c:c18b:b0:8b0:dabe:cf3e with SMTP id
 00721157ae682-8b166c3b836mr6714107b3.49.1792815619878; Fri, 23 Oct 2026
 21:20:19 -0700 (PDT)
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
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org> <20261022141541.GA1009304-robh@kernel.org>
In-Reply-To: <20261022141541.GA1009304-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 23 Oct 2026 21:20:06 -0700
X-Gm-Features: AclHuK-jY5nZlp7VXKmAqElNTjaLuAOJrGGwfzJe2sRdomHsXRx_zZwJG5LEvdg
Message-ID: <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable method
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003594fe065e8e6a5b"

--0000000000003594fe065e8e6a5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > BCMBCA systems booted through CFE can release a secondary CPU by
> > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > sending a wakeup interrupt.
> >
> > Document brcm,bca-smp and its single-cell cpu-release-addr property.
> > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > Cortex-A7 example showing both CPU nodes.
> >
> > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Document=
ation/devicetree/bindings/arm/cpus.yaml
> > index 5be89c584026..6771b85f757b 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -255,6 +255,7 @@ properties:
> >            - amlogic,meson8b-smp
> >            - arm,realview-smp
> >            - aspeed,ast2600-smp
> > +          - brcm,bca-smp
> >            - brcm,bcm11351-cpu-method
> >            - brcm,bcm23550
> >            - brcm,bcm2836-smp
> > @@ -471,6 +472,20 @@ allOf:
> >      then:
> >        required:
> >          - secondary-boot-reg
> > +  - if:
> > +      properties:
> > +        enable-method:
> > +          const: brcm,bca-smp
> > +      required:
> > +        - enable-method
> > +    then:
> > +      properties:
> > +        cpu-release-addr:
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          description:
> > +            Physical address of the 32-bit MMIO mailbox read by CFE af=
ter
> > +            a wakeup interrupt. Required on secondary CPUs. The kernel
> > +            writes the ARM-state entry address before sending the inte=
rrupt.
>
> required:
>   - cpu-release-addr
>
> ??? But cpu0 doesn't have an address. Is there really no address or you
> just omitted because you don't really need it. Should still be there in
> the latter case IMO.
>
> Alternatively, add the enable-method value to the existing section that
> does this. Also, there might be other cases that are a 32-bit address
> and need this same constraint.
>
Cpu0 does not need release because it is the boot up CPU.  But there
is no harm to add it to be consistent.
All the BCA v7 chips only use 32 bit address for MMIO register.
Otheriwse,
Reviewed-by: William Zhang <william.zhang@broadcom.com>

> >    - if:
> >        properties:
> >          enable-method:
> > @@ -712,4 +727,25 @@ examples:
> >          cpu-release-addr =3D <0 0x20000000>;
> >        };
> >      };
> > +  - |
> > +    // Example 5 (Broadcom BCMBCA with CFE):
> > +    cpus {
> > +      #size-cells =3D <0>;
> > +      #address-cells =3D <1>;
> > +
> > +      cpu@0 {
> > +        device_type =3D "cpu";
> > +        compatible =3D "arm,cortex-a7";
> > +        reg =3D <0>;
> > +        enable-method =3D "brcm,bca-smp";
> > +      };
> > +
> > +      cpu@1 {
> > +        device_type =3D "cpu";
> > +        compatible =3D "arm,cortex-a7";
> > +        reg =3D <1>;
> > +        enable-method =3D "brcm,bca-smp";
> > +        cpu-release-addr =3D <0xff800568>;
> > +      };
> > +    };
> >  ...
> >
> > --
> > 2.56.0
> >

--0000000000003594fe065e8e6a5b
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
yE1uKKhIB+1cliMBryxLaNqQHWo1xv870+ijNmDpHAcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI0MDQyMDIwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAFASKg4I1vOxjgervq+gnt4jNFUNpmfM29PIo
cGwHQQbxZ+Pj4Ic7nnp5cwEgKGbzidc1ViqczAKYCyniOiJ9KWMZdZrmnX2cK1pW4IVZ3NDCoZD1
kiGy6vDqmqZrfRYLgULNwv0scnGg7DprQPJOc12XUUgM/zAVArazjfNWONexFiLtG7JwnZtrUah0
YVyWR/yrdj8gWwROSJGnToC4o8+5+AOcpCmBoUJ7koiC14kyvMjqVScuH+zDx886CxXfPkGWLc0F
uNXMor1GbCeqVqgVgl/y9Zu5+vujBJZ6ZEtGjk7uld4Nfou8hvw21PEiVNMUGVxom96IPmlLK9we
uQ==
--0000000000003594fe065e8e6a5b--
