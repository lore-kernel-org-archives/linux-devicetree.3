Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425379;
	b=vndZ5BnsDcXVSUvtUA0oDptfAzbvtSv4v1iiU6N4BxlMl/xU3RgZWz6/46Xj6zPaMSMZ
	 98rFB5zBSRm5u0EkaQKkseWQq5+okyX0M9JJW5iqA54rs9aSWJnr7/429obuwXBTEzNYA
	 vdl5ACWmBd0zuQymZ7AiIvoXqI8+jZdQr1iwo4Q8FRUq7TjGiRZygJtWjPyd6AKR9BjLb
	 zNUrnbul+2RNuGua7RB7E1nSWDgSFaoD62wKszT+vXm2l+dAaRvxzTFJVUcO5gOsx07qf
	 eqD6m1bSp8iJ29qUjF4CEFfI40Bu9w8St/QKVmcgZ3Uss2rmyEyfL9g6EfEa97Zqa6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425379;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sii7KJFd1yk89kHGO+hNFF6TpKvTxmesQxNsd0TOM9A=;
	b=BFU7IXbHmXa/+OWJrWZsRbNqN9Oqil2mzktG/FMnC92q83AcTe4Dk1uQqbv1CnnFAvXH
	 zsFaSTHpoXjhJ0mNPAJB/sBSnBftQt0XmjpYVgof5elVYNCYl/dnRKC5F9F8zxUl8rzjI
	 JG9IBF6sXnxS1AG3sQlk7ddsfCkf0fZZ0uKM6jleG+ojihjaMAoW10nAp71BdfULLXmbc
	 RwbxOR5oFXWIPt60DZyXsfot2L9kP9bH1ICZfKUVlgyezQElkQzBPAHEfsTNPKNUy+7fE
	 IwmWXy4M1fQdemKa+l4k4+qwE3I5MtlzhWCyUNqniEfYZVtFPZ+yMkJAK70Telp9Wlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JnTNGkOq;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AEC606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JnTNGkOq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794425374; x=1794684574;
	bh=sii7KJFd1yk89kHGO+hNFF6TpKvTxmesQxNsd0TOM9A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JnTNGkOq2f60wERZWGvjJvCMp/0oDPiWK5WRWjbA7otYYKKDRUa5uD7A2mk8WOymP
	 4yI7EZQJ7xmyCD0ofZ1SP3yJbrJDaslK/MeUt4P79guOq03ZHlqBS3z7e9rGjsn4WC
	 qr2PW6NwBF2TOE37mtUN4x/061TL26i3jr8kf89ULsvvHIw1shpaKAXdsQixr3Y51P
	 VB9tkWTLiIlT48sN+KkdkZPEs5+bDZ3nk1xcS3inCO2rbu/dKcsTGm1XtSbvKYCY3X
	 oLplIBTkfj0g12jtE+RNH5At8yZKNJ6UBSwIhbsIu6IoPI/ypyrm5nQr4lGcyWt4JZ
	 Iqg+QGDGAvgzQ==
Date: Wed, 11 Nov 2026 19:29:31 +0000
To: Rillian Grant <rillian.grant@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual LED flash driver
Message-ID: <2f081600-58a2-47b3-808f-b578bb07d41f@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 183375a4ed7eb3543fd73e854b6616bb40cc32ea
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rillian,

On 10/11/26 22:09, Rillian Grant wrote:
> The LM3643 is an I2C dual LED flash driver. Its two high-side current
> sources share a synchronous boost converter and each supports torch and
> flash modes with programmable current and flash timeout alongside fault
> reporting.
>=20
> It also supports connecting both sources together to supply one LED with
> current up to the boost converter's 1.5A maximum. In that case the curren=
t
> will be split between each source symmetrically and the sources will be
> enabled and disabled at the same time.
>=20
> As strobing is toggled chip-wide the driver returns -EBUSY when a sibling
> LED is active.
>=20
> Flash timeouts do not have a constant step. The driver advertises the mos=
t
> granular step and rounds down to the nearest supported value.
>=20
> Register behavior was taken from the datasheet (SNVS967A).
>=20
> Co-developed-by: Ruslan Koreev <koreev.r@gmail.com>
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>

I have tested this series on a Realme C3 phone, which uses Orient Chip=20
OCP81373 IC (register-compatible clone of the LM3643, except the device=20
ID is 0x3A instead of 0x00). I had to modify the driver to support=20
multiple chips, since there's at least one more clone IC (Awinic=20
AW3643). After applying modifications, flash and torch modes were=20
confirmed to work correctly. Once this series is merged, I will send a=20
small series to add support for the OCP81373.

Tested-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

