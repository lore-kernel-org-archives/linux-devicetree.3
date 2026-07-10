Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14433349CE2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693818; cv=none; b=ZN3MzY5jVkGZOLykuPaFgns4x831ZAjOrFNdcgYuhV77kCr9jn+4OssIxOZYXtKdVBt/Xf09tpq+NGGXHIqV+cl3w3jPgkSfFuMw87QF9my2EuJX5zYssB8pEoMElrMxVsTZelmn9hEvusLap6HnR/Td+ASSrhNp1fm8ryuNfC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693818; c=relaxed/simple;
	bh=QbIprqUJhBFIuepNWkO4kN5miXRoPAViL44TdYA8PTM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmQINda2G5ATCotNPNpTKHnb/XjGF/Zbz0JL5A2+8IJ5ludNYqDiUBxOGV1YcJ8rCGqG1NkXmY4kIeiKLTcsER6qVjq6SKnEkMt5tvU5RocyPd1tqFszyxETtTAhRDuzXM4ADs6PdSBrZTs+GH8NyLzbjjF0Y2yQ2hndsmyQsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ju3LOh6k; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ju3LOh6k"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b27c7451so26044305e9.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693815; x=1784298615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI6XbHCkQw0BYyxRAEJxXVAGqyrCldWfR9mQ71QbnBw=;
        b=Ju3LOh6kmVcq3bIcXdw+8GnFA37/pfmKAUg5iJoTeB9bO+k+cqgMzoqe9yfnVrwIAb
         4G7OV/Qaiji4fhG+EsIAjnpxJSa7k5f7NLUlKU8a3/Tx+WoZq/E//Puzr/G9Znhl4o3A
         govQXcvjuPDvZ34MCJdbzYR41ekglvJGdM65Ifh+MppzbkhcuxAX6FpZ+v/vDdNbnX/b
         39H+TE3bqTpuh3yAxQTYmwuHNg+LeZ4VRDnks7oxAVdty2qoVgijogY4E3bhEtDH/rqa
         nI/2IGolKrpT8UBHPtxiofMDwJ3dh3MaPKs65aEMrtvYbgesJ+jYgzPyFQQRfm8fWGg7
         vqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693815; x=1784298615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI6XbHCkQw0BYyxRAEJxXVAGqyrCldWfR9mQ71QbnBw=;
        b=WH27CUMTZQE31nmdZc/JizdbEbND214aScDMnqwa3Vz8S1bJUHiEtmQMFloFjahtbg
         2zou02uOcz65S8jFGO3iktIg6EDWwEZqw1sB0nPtx0vzVafZy82OyHpkyyC0PdBfSrNo
         KRDCmcD1//jK4Tf/sVq/O1LVFDFGwei/CnRpZf2/VOls7tY5Soyj3fCerP4N+0G3dSIZ
         3UjUJxRAfrTDM9+0IQS05DJm+YLwMGqQAN2QSQD4W4sEA28TmKxlm4nTjL/6ujqBkJIO
         rr18ty5ThZYOtecCMgUvyI/KJ4P6zYQ+ViZt58ww2/9SsXkjDUPDhWE3UypUBB4Q7hx+
         on/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQxnJvPdwewt9w2mUAhUzACsc3UhwTr1DODwdWeWMdfweTljBB0e97bKQq9MDzWwRH2yKWO3JKyC7G@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRJzPRiegHKyVurv8wOP0UxoBl7lj8UhxAmbgqEUUi8+jTJ7y
	F9asOIrRYpktkE6SccEPGV+iYbp6ZPdUGZg4VZB2gzvfwoIZtVSMED04
X-Gm-Gg: AfdE7cmoUP7LucCfcmXJNiRtrd/c+revkfVwxyDwIGgvQwLtvBEIUH4LHMAHX+XfC2q
	aP/Y5V8e1L35VJctHVWj7qykk+fsyz8jQkZybTBgIEP1sca7X/BFJ8G8j4HVVe3KYatX4NQg5gb
	MkXIG7lmfpIHP3Qwuh3G1fR3WJfeLPGhJ+U9mMJR1+zliJwDP1m1lUAEF3vTCRzHzg0LIlhNdZc
	CE6DDljmq2ZqUsH4fYb/+5EcoypjqE/TOiYTDRpUZ8cjudnNERoT7FSWGzbrZcuMll0iEfAlPKt
	dX2JcxzlIzIH2jNB6qdHAQd8qjjSz5qAoyoUVzzwLLt9Isp0zzUKR4RQa3NSLJDkN/nyLjmcr8f
	bVYlyhplsJqET5gAkCaMKd9qQGty22BL5lS22Rr1jx1GLklC72rDZjdp5NmCeCIxU9J1Ovj69i1
	X4QQ==
X-Received: by 2002:a05:600c:1908:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493f2b4baa1mr35892515e9.18.1783693814906;
        Fri, 10 Jul 2026 07:30:14 -0700 (PDT)
Received: from enyo ([2a0a:ef40:ea3:3f01:ca44:4cd5:cfae:605b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d88698sm65315605e9.1.2026.07.10.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:30:14 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:30:12 +0100
From: Dawid Olesinski <dawidro@gmail.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Corentin Labbe <clabbe@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: rockchip: Add crypto node to
 rk356x-base
Message-ID: <20260710153012.0a840512@enyo>
In-Reply-To: <4011768.FjKLVJYuhi@diego>
References: <20260708175837.1718437-1-dawidro@gmail.com>
	<20260708175837.1718437-4-dawidro@gmail.com>
	<ak7jEYTAGgeDdi1W@venus>
	<4011768.FjKLVJYuhi@diego>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Jul 2026 09:07:23 +0200
Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Am Donnerstag, 9. Juli 2026, 01:56:10 Mitteleurop=C3=A4ische Sommerzeit
> schrieb Sebastian Reichel:
> > Hi,
> >=20
> > On Wed, Jul 08, 2026 at 06:58:24PM +0100, Dawid Olesinski wrote: =20
> > > Add the device tree node for the V2 cryptographic hardware
> > > accelerator on RK356x SoCs (RK3566, RK3568).
> > >=20
> > > The IP block sits in the non-secure peripheral domain. Its three
> > > clocks (core, aclk, hclk) and reset line are accessible directly
> > > through the main non-secure CRU, so no firmware intermediary is
> > > required.
> > >=20
> > > The node is disabled by default; board files that wish to use
> > > hardware crypto offload must enable it. =20
> >=20
> > Why is it disabled by default? It doesn't seem to be board specific
> > at all to me (the same question applies to the RK3588 DT). =20
>=20
> You're definitly right about that ... there are no board specific
> resources needed, so Dawid please drop the status from both nodes.
>=20
>=20
> Heiko
>=20

I'll drop the `status =3D "disabled";`=20
lines from both the RK356x and RK3588 device trees in v3.

Thanks for the review!

Dawid

> > >=20
> > > Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi index
> > > a5832895bd39..9de7e7487ca1 100644 ---
> > > a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi +++
> > > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi @@ -1112,6
> > > +1112,18 @@ sdhci: mmc@fe310000 { status =3D "disabled";
> > >  	};
> > > =20
> > > +	crypto: crypto@fe380000 {
> > > +		compatible =3D "rockchip,rk3568-crypto";
> > > +		reg =3D <0x0 0xfe380000 0x0 0x2000>;
> > > +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > > +		clocks =3D <&cru CLK_CRYPTO_NS_CORE>, <&cru
> > > ACLK_CRYPTO_NS>,
> > > +			 <&cru HCLK_CRYPTO_NS>;
> > > +		clock-names =3D "core", "aclk", "hclk";
> > > +		resets =3D <&cru SRST_CRYPTO_NS_CORE>;
> > > +		reset-names =3D "core";
> > > +		status =3D "disabled";
> > > +	};
> > > +
> > >  	/*
> > >  	 * Testing showed that the HWRNG found in RK3566
> > > produces unacceptably
> > >  	 * low quality of random data, so the HWRNG isn't
> > > enabled for all RK356x =20
> >  =20
>=20
>=20
>=20
>=20

