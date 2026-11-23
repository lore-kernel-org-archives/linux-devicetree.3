Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435159;
	b=FQuso0ExVj5h82/+GsswexjUy3xsyIYKmNN2MQnjMiOG1JYNIhhCAMFNZio+zxXG215v
	 3evIAKuoIVbp+W/M5onRRcN1gmolQ+67lavzCXTzMD/Nh6pIhkj7dhd3pVpkquwLgAd+J
	 I0OCoc/kfP8ci9pE1aM5IGwVvMP48WrjesP4zyoU6AwS0uG0+NmI86IwVjc00uFftGnh+
	 C+DOe+HeMD48dh4KPXV0uLBJvqaNF3JUdf03Zerx/DlK/NM1OnAwucrLn4pRQaHZAXLFT
	 EsXr3C6MhGoTMNbqKf+CybofB4QJ27Zp6rU/Fhuw1NfEuNSTaO84mkhfsaVCBD3vDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
	b=raYk27xyNgbPo36xWWPdoJX3faPp+XiRJNS8QBc1qq9cBhF+oYlFGS5QpzZjOdSR1Q73
	 IpXtw5KUZG9OtedGo6aRX1hPmzrPBDBVrJN28Iw2M9Bb9wAjm8BtdtwUpgQEL4n9RXXxM
	 w/MZj8g4venjZ6BfgkdUTrYuEPTRaX2LvMDkFTkYRG6exkm4V6gSjIrr27NX4WzC4bG6m
	 er+9I75nL7CVKtAOZObshd8ahMDcm+FSoP8FCByv2BuIkKQmF+u7cWVuGaOY5nKODBHEw
	 t9IWiiaRvpzPcvdyLC94HmU5t6TtrivBiyLUGtJZQ+V8c0Vy/UaHFLBXieHBo19aGcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A857606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A857606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c516a192844so157428466b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435157; x=1796039957; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=Nnv4Ewzsl0zbK9WqomGclwh/k39KgQeQgXBNc/AzfBbUyum1Jwvd/YbXnXg9n29OEj
         K9Ij0DC8CzyeIq0tVeeaApk4UfsTam5BGxnvw6s/ZKMk3jvL2FWONroxYavWmgOtsFl/
         pCH33OTHEcBp5Asq6l2vD3q6q2VMRCWAkBXRC3EjS07hdKBCdtwczs0pFbPIeKRuIxID
         xUNzibHvqo+wSbbF6Xz8MLTQWy4Q05WSCpzEyqo7+RmGC8MEsJ5zTaYWtaSTJqfEMPJ+
         ja4H8aB9k1bYTHo3T4iVJsVZEdnn8ZEPeUwM/HyD1ISEGSLI8D0lV/EVTsvmkC8x4VQw
         QwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435157; x=1796039957;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=YNNMe4gu4AaL+yCZcAh3TOrkedeAY2rGiUoC0wNYscpc8/7fdESxmKlBWBLj7MCm6E
         COd0H2XOZkTxsqEoqCG02JrXWl+cKnD3wB6AScotwCUCFrwTnuz6PTmhQDrUFrhtcrgC
         +8jhUSCYQ+q026Eb8OmALUlT7AkUFpPMg1gJ0cr1H04+ml/plYq9d6sj5AaGu0d68oik
         MWfJvPvN8H7h4cmxgZQHiQEPEBYoaUEWEKWq4oROri9cJxr0KUdD690LqNfTebuOQaff
         vMLhAup79BndXZoK2vmbfChCImxr5ZecP7XvqyKzSJ3G+sDdbxCOtBBPSSsYJCfHXi2X
         LT+A==
X-Forwarded-Encrypted: i=1; AL+hErGXad3vVeQ/3nvNqRmDKKiEug0GNob30v7o84A0mU3DkeKkRYXN+pgF/GtPDrVyKzrr9/Te89V6AnKG@vger.kernel.org
X-Gm-Message-State: APuU4Z+eQxWJiVFkst1+WPQDP+pktwrO7vwnnWSfQpCyalGl+/fzYWEr
	1AC/1Wp5ZVfuFdftpKbifQlNMK0JxZu5hrk9MWHwW3USIxPAwJ1NXsXe
X-Gm-Gg: AZFdTZdSJi+UWb5zZr4vZIQqVaG3xMW2nrJdqSn22bS4IQwK1tk7Rm1wFNLOYcV1tzi
	xa8I8bw8HDteuag50QkV7VpmvyhgK3dIvqmzbDWH5Upko52p3RRsojnhiQz2hbKEzDvGVHHLn6t
	v/G5k7KmsfOAC3OKsPnAaPE9pcpbQN4lifNrk8N/+lIOyq4VPIX92tr8TKHM7DzBEugaKJ4l8nB
	RpAU/3f+hamWme+bLUTd6lzYJvTMQdgWwhuX85AkG9KJ/169D97esA0PXnxmeMw3V8CBsY2yYcQ
	xSFMPyW7xzCHiG0a9hr4IZCwp8QZKMJDvsGCIpk2H5WEMxFoiM93askgatPCjbkuyVChNJm+zzU
	UZE1tyBEbyFxvqo6IEN+nfQmanRfNrBGwEAFPSxuEELiAND5QBG3+uck5uVrVjmXZWnR/K3VZnl
	eZtcC0uQSHxHf2aForob1jsaWzehzMiJ7mEEYDCWWn+b+8yodPIyyd32gnOfzP7jG1r1LUPUqV2
	qxAp/OPAiE8q3BmXRuAG6SNjIzKdAAvwBOZIS1cm+1OICeCjTK0og7JaivhL/V/3Z13IgBdqDYb
	NZM03HmBYE5TW2Ir9hgeZtjkyMLzH3APtqedMzvtAMbY16Cv3xDuYBsC
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id a640c23a62f3a-c513a5da8d0mr870341966b.12.1795435157410;
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68a9asm395946466b.30.2026.11.23.03.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:59:13 +0300
Message-Id: <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>, "Alexander Letuchiy"
 <asalde.le1@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
In-Reply-To: <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>

Hi Roman,

On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
> > Bootloader dependency
> > ---------------------
> > This was tested with a modified LK bootloader that is not public.
>=20
> How are other xaga users supposed to boot the kernel? You might want to
> port uniLoader instead, or if you're on an old enough security patch you
> can even replace stock LK with U-Boot. U-Boot chainloading is also
> possible.

Right now I am replacing the stock LK with a modified one that knows
how to handle mainline DTs without expecting downstream Android nodes.

In an ideal world, I would like to replace LK directly with U-Boot as
you suggested, though U-Boot chainloading or uniLoader are also valid
options. Luckily, the security patch level isn't really a concern here =E2=
=80=94
xaga is already EOL and hasn't received official firmware updates for a
while, so LK replacement works across the final stock builds. I
definitely plan to look into a proper open bootloader setup for other
users in the future.

> > Firmware behaviour
> > ------------------
> > Two things in the stock TF-A affect what the DT describes, but not the
> > DT itself:
> >=20
> >  - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
> >    The vendor kernel lifts this earlier with a SiP call, so with this
> >    series the idle states only start to be used after that time.
>=20
> It might be worth porting upstream TF-A too.

Agreed, upstreaming TF-A support for MT6895 is also something I plan to
look into eventually, which would let us drop the reliance on the stock
TF-A quirks altogether.

Best regards,
Alexander
