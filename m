Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818901;
	b=vzZEPRrvxFwBHvxycsWArYggY/gFW7s8T4NXaXwoQEssLUuO5MizgMD/bTUJoqyQTiMG
	 cR3uLJYfMzEB0Z1iOf1H5bQ0/tYEUsxrfzTN2zSZbdu4z86fEg0oIwBANhhmu1TcAbP9L
	 TM36KA+SNFIvf1tgybwPGSjlEoVVJQTFUgpR1iI37OaTrsXB7ZYE9iGI548JCaS98HoSz
	 REfHqWJpQOXeyGFqLpRtynaIKqZPBVfXzRlEzjeiGt7eccPecm3gAyOv3BvISvL8cL+0H
	 EK1fFV9hmrw+XDFqOw2lZPzJ3lRJJJdIIfS5cLmOj3ZrwYLjphc2GSuT6A/llFvpA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818901;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=rCpKEz43QM9VsOFhJxg1axRjyOv/MXSyF8mViE6YFTg=;
	b=UuBJRE3hOqa2gz+1Kw180qVal5ZDm4FvxPR+TOCn/D71ewXgK6XMGRUl42EbU+sFO0px
	 FWCy741E6pEt2p0U5Hr5zUyG4q2GFv94ls/QwQsSYDm0/NoVgjWYT9tNflqLjp7u2JcoO
	 unLYHBzFq95HnLSQFP4bF6uriNDMJzwGxS85/gt1KiU8DF+/29ILMDGQMuenQqPpkSCsq
	 +0TotwRbVsK2UfAr9XHabwbr35Bh5E7dIhdrNB5TWu6chKjkEV6NDjof6qKmN5JF8/a4h
	 la6WWXT+M5tafT3fYxRLrkADWizqrPylMFBHN4Pr4FaZZpN5/R2VNwtxIUXqj7c8jjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TExmswUA;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C4606A32E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TExmswUA
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so98790e0c.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818900; x=1794423700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCpKEz43QM9VsOFhJxg1axRjyOv/MXSyF8mViE6YFTg=;
        b=zXAgGP/gVsBpVCIShGFjwlK8VJO+I9QJi5OPZaiREKrRNW8po9GiquVsK6oiwwvmVP
         r2jY8d6srLdh5+DOLjSwz7FitF7UgMLHD0Ppy8p6AHWTrsgiPrM7e3d0ALvfoE0DR9FV
         +piJsfe81aDYZwmjCh3st091M8Hd1ETO5TXz5wb3lkYISbBy9+v9/j9hWz9bbQKhc5FV
         EMLa780XPyD1BX2hLYc/+Rt8so/lGyQTbJIgGDgYvQLp8P/SZSbZOlsx5svUpN8mxiYt
         z9bVOOjfxg1Fpm5qwfgYJhwYYMFzzrwfd4EmWPA+EES5lbaLj695g6HP1WN1X54LLMOo
         eMHA==
X-Forwarded-Encrypted: i=1; AKwUvByv/XLcUQn4DNDsEKwyV/UDf4WLbHSSbQmGyW0vl4B6V1tdbe2XkfPgfzXQZHU/BXrcX4mww4q2TdKj@vger.kernel.org
X-Gm-Message-State: APuU4Z/74J6ir6nGhFAGA41Gxo/TqP1ZwPnsrUGh0vyCwCbdlZ/fFmEh
	n/0M7UJiRjadw+4pQ8etlUeIAI5547uILy5DF1nU1c0/NvNi11IBpbrZm7mlSKIE+YZzfX44YIx
	2HkkxAOznU8294Hz6BtSvu0iXNcNQdVUf90Z6lqHevo/moDYOV6eBHhF4BcRqe1C3KhJ6ONRnHP
	1ORx9WYHIMWkF1t+ek2wzBHQ3WA0ujmzs+PLzTvSryFF89g5SoNGzyVYQwH3GbzUnzF9vMrvH8D
	M6xVElIC6ynnoHWLA==
X-Gm-Gg: AYBFou01JMn/t9SntdZVU5bdTW9pao39iSApus+dHu7J5OZpzQcaI9r7iK7pUdRVCTy
	m96VoDUpteTPxA+tjLsmKmdKHGHGKLqJHKR0sdXmJ4fNiWTn09eat7aNbcz11G9kmhF3tP/RdqZ
	/+k9JpcgN8WXzMcBs2rfnvh7kcw+YH2VkLBIwSuYlTib3yP3T8QPp2hY9TM0lqC8VPDt8BrI2OX
	W9jBIfe48fXBZrntVnUrg90RSUyHn3hw60uIfBMQUgpNral8MZl2XejtA3yw0e8RH/+dRW/6ID+
	cLSUdwn7aURdaUfRZGxuY+Twd3fJzJkV1Pwytqt8GU3sLN2tE54AamFmnPDIXcp0NlZYf3/zzpH
	uhO6R7E1fwjUG8J1/tW/z6F1jUXFVBm6jv0NTV7xFkeZbNTwtqu3hgyrPL9fzSvqNzMf7NNRzZF
	10gJmYgVdFUBP0whACIcizS2eur0/VpkOrpxut
X-Received: by 2002:a05:6122:4b08:b0:5ea:9be5:a854 with SMTP id 71dfb90a1353d-5ec689cc341mr8328224e0c.18.1793818900033;
        Wed, 04 Nov 2026 11:01:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-999f292f775sm40740241.11.2026.11.04.11.01.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:01:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d36c1db7so18078037b3.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793818899; x=1794423699; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCpKEz43QM9VsOFhJxg1axRjyOv/MXSyF8mViE6YFTg=;
        b=TExmswUAdxJIrkqGh06CCORtqFZ6OSTvmEvVZ9t2WmJ+HK/HGygNxHjV2Lsq6ZZhMD
         wbvXvkoomKbi7ed7jkI0F98ZVKYFCrpQMImzat1ABYAOyjPwEFeAu3NWa93E0qZ48taS
         Tl7OOjcT9iOwHPhHQ08IrwVfWUJKn2a7sVJhs=
X-Forwarded-Encrypted: i=1; AKwUvBwFAD1qaTcRmH1idL1jJ54a17VmU2TSTVZyD2ZZ4J+S5WHNMiFaiYyimWC8hkdB52FYBDpZ+nhYPOyM@vger.kernel.org
X-Received: by 2002:a05:690c:6d82:b0:8ae:e69d:913a with SMTP id 00721157ae682-8b2b65baff1mr123091767b3.1.1793818899027;
        Wed, 04 Nov 2026 11:01:39 -0800 (PST)
X-Received: by 2002:a05:690c:6d82:b0:8ae:e69d:913a with SMTP id
 00721157ae682-8b2b65baff1mr123091607b3.1.1793818898525; Wed, 04 Nov 2026
 11:01:38 -0800 (PST)
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
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
 <20261022141541.GA1009304-robh@kernel.org> <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
 <20261103213814.GB3951195-robh@kernel.org>
In-Reply-To: <20261103213814.GB3951195-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 4 Nov 2026 11:01:25 -0800
X-Gm-Features: AclHuK_t1PkesIBFFZ5rU-0ER8j9XNytwrYakRXMF1fnM5Er_BWHgdbnLrKAx0o
Message-ID: <CAHi4H7FX+BGEeVtb0EfjhYpQB5GTi2OHwjZC1+3RcR_d0kSsaA@mail.gmail.com>
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
	boundary="0000000000004b4162065f7802d5"

--0000000000004b4162065f7802d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 23, 2026 at 09:20:06PM -0700, William Zhang wrote:
> > On Thu, Oct 22, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > > > BCMBCA systems booted through CFE can release a secondary CPU by
> > > > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > > > sending a wakeup interrupt.
> > > >
> > > > Document brcm,bca-smp and its single-cell cpu-release-addr property=
.
> > > > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > > > Cortex-A7 example showing both CPU nodes.
> > > >
> > > > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++=
++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 5be89c584026..6771b85f757b 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -255,6 +255,7 @@ properties:
> > > >            - amlogic,meson8b-smp
> > > >            - arm,realview-smp
> > > >            - aspeed,ast2600-smp
> > > > +          - brcm,bca-smp
> > > >            - brcm,bcm11351-cpu-method
> > > >            - brcm,bcm23550
> > > >            - brcm,bcm2836-smp
> > > > @@ -471,6 +472,20 @@ allOf:
> > > >      then:
> > > >        required:
> > > >          - secondary-boot-reg
> > > > +  - if:
> > > > +      properties:
> > > > +        enable-method:
> > > > +          const: brcm,bca-smp
> > > > +      required:
> > > > +        - enable-method
> > > > +    then:
> > > > +      properties:
> > > > +        cpu-release-addr:
> > > > +          $ref: /schemas/types.yaml#/definitions/uint32
> > > > +          description:
> > > > +            Physical address of the 32-bit MMIO mailbox read by CF=
E after
> > > > +            a wakeup interrupt. Required on secondary CPUs. The ke=
rnel
> > > > +            writes the ARM-state entry address before sending the =
interrupt.
> > >
> > > required:
> > >   - cpu-release-addr
> > >
> > > ??? But cpu0 doesn't have an address. Is there really no address or y=
ou
> > > just omitted because you don't really need it. Should still be there =
in
> > > the latter case IMO.
> > >
> > > Alternatively, add the enable-method value to the existing section th=
at
> > > does this. Also, there might be other cases that are a 32-bit address
> > > and need this same constraint.
> > >
> > Cpu0 does not need release because it is the boot up CPU.
>
> I get that. Is that convention or h/w restriction? I seem to recall the
> arm32 kernel might require cpu0 booting, but I think other arches do
> not. What if you support power gating or hot unplug of CPU0? Then you'd
> need the address.
>
For hotplug,  I remember the address will be provided by kernel using
the kernel's cpu entry point,
not the same release address provided by the bootloader.

> >  But there
> > is no harm to add it to be consistent.
>
> If there is an release address for cpu0, then yes, you should have the
> property. If there is not and you just have to make up something to be
> consistent, then you should not have the property.
Then I think we should not add the release address for cpu0 as it is
not really applicable.

>
>
> Rob

--0000000000004b4162065f7802d5
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
oBnhpWKo7Gg24h3mkD7kISerZUESH1RZyYnMo9mCKL4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTA0MTkwMTM5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAq0XYilO9kcadjRTi3G8lTjNky5e+QgAL6k9H
b6tbbpQF0mKMJutFf42A537oBOuiqhQn2zvKUkr3Y6h2WjFFkDZMrgRtP8oAeYNx2GcHjnptu4TZ
g2LMQI1FzaZAnArd2ILZpL4mvXIJSZHXabGYNllFnkFmKy4qELN4dFNjzQA72XdD0xryMwGCzZD0
3SIaPNFimHhNSZiUo9OFam9F758jjm4ur3p4NAgutIrnxr6dl5XsT8ZO7COzUPQFv7RUqjM8XxOi
Mt9XPubX+aaLS8a3vbtl5UrV0l9ZRMOYzmG73R4EHa8azxvwqThVsgWWqr/c0h96PnrZsyWOD9ya
Kw==
--0000000000004b4162065f7802d5--
