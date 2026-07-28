Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB93B3C12
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262230; cv=none; b=bhGViXTrmbztRkOxnh57YphM6zBMzk+yWOC5gKdUJx07WG4/C3nC8wy9z+YVBY3fcbFoxgJmQAA/dtnWJ52ijO6yZCFBw3F0mKuFrY7HMwHz3oliB8ndq9sT2ga458urmmdKSnNDQZqm2Oa4XTe8hs0lBLX/DxUUoVLWYZ965CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262230; c=relaxed/simple;
	bh=SoZTNrUCUMJsjQyOeEB+XQ25B/C7AybQKj1Imbqx0xE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hds8zhuOJwDtYS9Y3IERAjjlX/Xz/gdYGQBiEqklKCO88aog8OUtHLZUyLTxkZg0mSh8qfhU4TzqcpRsd/Ha3YECwsd7SnvJkzdZyLB2M+1B2B+OQ/P0t59tAdlkUyhGiacqOFfQnkrn8pjMBvEUD3BHf2gyU9K2zwr0OTjMhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwlUSi5U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwlUSi5U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so135266f8f.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262227; x=1785867027; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=lwlUSi5UUvG2gtmeDtRzPIRKVFKNoBgBTraMvh+hC8WGSc1TRFd6SoMY8ufb/Q1cmw
         eSaohJOjURiM7LMbtKT97E1P8bHC7anrRFIZmjgab7YCPWrKHmov/h6afL4RgZ3mqzE2
         w7bQCmGjQb5qa5fqBaBrQnQ7UvBClBzO2dMc8D9RCvIx40M664NtVIb1HTLH/GgGm6oY
         i0/zbzrp1fd7k3+A+bDtq/BiLlEXqqNxre1PpOlg1MPjaVnRB9htbmG1lEX5U3YUBcCT
         TEJZpMA4GEgiOyVP7jG6LFaPp8SQVkhIxXU/UeDkYrZrosxGACcH5f3ie9C6HzKjOAmy
         BtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262227; x=1785867027;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=lOSZ03zdleWExgXkQto12f3Lr9LceaUefy3sEm6Qw5q4YpRhN45JHPpMDDuhpN/9oT
         WewGjpRp7LbcNaMw8xihsNdhG/4CkuQzamZImIV5UcXyQ/DEpVVD75pTAP35dxMd62cw
         dPRliWmE414gkKqFym5s8PX+o72ZHiGCcLn0AdGbForHFU89yyz7lUsuW3tegzs7gXEk
         e+wt8rp+MU4Cf9KrLUxqOo+dy+cSZ77MJVZB7ylYf8hy05YdZRcLC7HwopesnrSJ3nqm
         aIjkUKxwM8Zl9xe8wwGOl31XmePJvCRaD5blXLGtCKZT+yEAj87nTpLb2lWSwR/LW45Q
         B+2w==
X-Forwarded-Encrypted: i=1; AHgh+RovJMXVcRizjj2kDiNz/HovyjfcWuYSINKs0Pzf2RwsYPivmUlP+mwqr6l/9pXLFyQUWPg7VBdr2Q44@vger.kernel.org
X-Gm-Message-State: AOJu0YzBklspkk+93s3kkFEFSJJWWLoAdJaUz50e2jUERKu+RX7NVWlS
	JnbhNsVXVqsvrlHZ8JtOkiJuPBEfUx1oeGRbiihm7SCi+aUfio30Q2zx
X-Gm-Gg: AR+sD11ZI4RlNmXjxbS12VsZCIXuNS7NqdZ2mkNVqDfTLDxYSVtVqrZ9RQrf/fu0U0/
	eW6cfsn+1ySMWEE6zGaFskwMr3++hcLhjivFQSbOOZ81qo94CiQc1Zhoqb/FP6XC5YagHwRGYtK
	RK//bZazPZEI388vwTNyWcwj7VH8VDlodbdcBdLz45zbBOTwu4i7VhML6twnbKuAcw15amS9LIe
	J7IEyHHMNMmf/CKqAI560mEzwr+IRq97L468opO0drcaJZmhH4NQa9etDBavtYwrFDhhzVru3YG
	8MOG98LQPXJoFas+GtZOzNt7tPQ3GyOZHAUtco3WgS5EdXhS6mvS9FC6Q2NDdLzbzeYBPyoSXFQ
	aZ8b65r62B423VAmK0J27l8eP6jUV0CrCRujqX+l5RlXB7X34/5EqkNiYjm6ERyu4ITHQfhMUXF
	rCPP0UwSyyIrkK51T2Rm/xJtZaQb/SqJo=
X-Received: by 2002:a05:6000:230e:b0:47f:9720:4740 with SMTP id ffacd0b85a97d-47fb1e9f82amr4362694f8f.37.1785262226606;
        Tue, 28 Jul 2026 11:10:26 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6abd0a6sm800035f8f.10.2026.07.28.11.10.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:10:25 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260728-proficient-boobook-of-will-2cc94a@quoll>
Date: Tue, 28 Jul 2026 21:10:03 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Message-Id: <3A3A0D17-7A80-40FE-AB89-DDE8E9A7F72B@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
 <20260728-proficient-boobook-of-will-2cc94a@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Krzysztof,

Thanks for the prompt review!

> Am 28.07.2026 um 09:27 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
>>=20
>> +  resets:
>> +    items:
>> +      - description: USB phy reset
>> +      - description: HSIC phy reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: usb
>> +      - const: hsic
>=20
> You do not need these two. It's one device and DT does not represent
> internal device wirings because they are redundant (deducible from the
> compatible).

Just to make sure I understand the implications: Remove the PHY resets =
from the reset header (and driver) and have the PHY driver control them =
directly via regmap instead of going through its reset sibling? That way =
no self-consumption is necessary. At least that's the idea Sashiko put =
into my head with "Could the driver interact with its own registers =
directly?".

The PHY driver would take exclusive ownership of the resets anyhow, so I =
don't see anything in the way of just making it own the respective bits =
in the 0x80 register through the shared regmap.

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - resets
>> +  - reset-names
>> +  - syscon-reboot
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - "#reset-cells"
>> +
>> +unevaluatedProperties: false
>=20
> This was different last time and previous code was correct.

Ok, I'll keep #phy-cells and ints optional and also make it possible to =
provide only USB or HSIC ints.


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpo8HsACgkQPRO8yFRP
GiLPTA//VT+BJ+4K6QWEatqxIi67Rfy+A3mhALsMoPStAPoN8KELPVr+JoqLoFD8
lz9s0uj1PXWN1CmBArx6Hzm1N35owUoP46VLnwqrIAR0gaor+PQPHJ9In5L6E6Lm
SdUs0QfxWMV75E2IM1tTRf8MKa6SnCvEp72OAYdMgRzEd7f0vp9fV9716yb0Ej7q
ZXG85U4f/1++S5XHoPxqFxrxunsJoX4GgVEmKyeB9N3spWjS7KykKo2UYFZEctFg
RUiai7lO1I2X9DuFGkuVZcouCIcpB1eJHx7r3UOTwIG6kbTKHBjWoq32L2tjUY4B
nSkU7vMfwUA387n/zdeisN6smcf0C8uH3g8PSozuzaojYQzAr5MjbmgDue2R1LQi
wVfHBdREUJL1WHt25UgiE5EcBcrQhwxccqDuWbkXH9toxP0HUEpTn9gdB8yNdGQx
HSLsQCaqOew5/9nPEnwn0X7q7FnnBSOYv6AQ5g96xPeuNDNQ2n8f80X8iBmy3qup
tWM+cCViEhEkoLl0x+/XTO6vfljHztZCpv2Xey9PGs7HDtyJbBMTkcHdcCTFV9yo
RKzQMdJgqmIfycOlUGL+eHCI1X9SGEZc7hcENPBn666TnnWf3XrsCKZNHFBCU85e
HUylGFuzN2pdc1MzYxgwFIJhKLtsVV8pLrnR3WfCD/2F6XYb36g=
=Oh+I
-----END PGP SIGNATURE-----

--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61--
