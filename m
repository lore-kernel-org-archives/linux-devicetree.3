Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2072390985
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343506; cv=none; b=mikhGbf9mK8igSvUXaBPz1m7tVs7YvHo51VdvnflbUaewLj/1Mx9LL+FR28MZDLX55Dy5zSfo+2UQyb9hfo1iK+PPPxv9u1BcImdKM883lZgKoOSxeataY3cC00nONVgW6Rpy3jeXX9/+K+xHIhaRQddLxbM/uJ2KReXjpxxM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343506; c=relaxed/simple;
	bh=1sX3QYXGeCW+Lv5W+F5sZN6MOeOyiU6kXOMbPlP1lIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxRRwjvNCC7hvdxMFOPb0hCSAORBcANEU8hfxezFtK6lApT7tJXlbfgaod8rrtA1lArVpQMfM5Jki3IjNNuOVuei5QzDAFiwwHtvS170T+LhaSBtJIFhrOf//b8Y7jbozgpqLzzB/NmaTErJtEUZAspmKKWwscSRHIav7Evqw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxEk5yFF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxEk5yFF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1415374f8f.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343500; x=1781948300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=HxEk5yFFIHCL60zi4VZHltwsAt+3NMC9sn6fTSLyrnV0uPjMZ4SR0x0HOibXXqKiv3
         BNKk235u+0aihneFdDNunIHGXe4yUKx6eqY9gTKmRpqXmEnyAI1b2VoK9mLrp0W9ZN+D
         9bOOTNPZbIYyZnMV7te/p2A98cVQh6akK5eK+6v0YqIrLExJojsynl6qm2XToUF0aMTu
         B001eorNLnxHZunY3yMVaZRqfQYz/mlQpc3R/B4kAt0Gly13hzOoE0m1rd3/e8EXHlYG
         123R9VC8loM3hDbZKanz17ckf33YirB0hX9w4jcPDAx2xrAtayZJP/sCxvrnpVl7R/Et
         2I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343500; x=1781948300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=YQxZZVkwra7OmDIjANC8sPHsQA8Rxij3dqSA+6esWHRt80vcbYmKOiPEDlaap95Pvx
         MeMOvmYIkFlAkFRiIi5/FL+SYQb2O8tT54suGHKSKSYAPOyLSQAq5jZRkzzErEx747YI
         R1GrZJBbw/qSURMqFasztW2gJf5vQwZ4UsgrB87s0SK1VM6vtegdqK26DEeLi0a+fuC/
         rhUCuSU1Sds9GUZi+zYKdiV4BLl5/aYVOpW2sf3kVSc00+RpTcCy+7AW2UVYPAoS5oYN
         ohUhHuOUH/PY2RCXVN8zPRNmMGnDHzZzGYY3n+8DfVeLwB361aiWc/G3NHr3Vvj9zFb9
         vNOg==
X-Forwarded-Encrypted: i=1; AFNElJ+cDSoHf+H7cVbjbuBN+J41Zz/8+zuDHOQMUlSdD2wMyrM6b3Kr95UDWa5l6XEBR+lMwiaX6sbiHKiO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pISHH76tRfhgHeiRvWjCJ3v2VgGcYNH7x01xHUpH2TJ1wOrb
	2Jgmtgdrd+fqlkqscMQxvRNWHyNMeLKkwS4U2tlCUZS1wrhbYo4oF/iF
X-Gm-Gg: Acq92OF6xRIMUCi/lZq9lUugX7mjgK8tH4uvl8QxOEPPVG780yGL6rl9PT+Ut8OE1wl
	/o+0FybqUL3XsHNMEZIOejCz7idYhXg4nPZqxTGt14Dbs6u5UA1zgMqpOPskn9hDPrkpppk4YF0
	aUFXa90cMuDv3HZMZJ7aOtGHY1mfQR6YwoPexP9rYJrq94K/qob3T1hG9eLBPpFgqBuXe8DDB8/
	fIpvmUiOoDAt3YdDOCZy0brjblzk4w35zmV8QxjBFSmtDN/GVqC4pGOmoE6QW9iWYvInX2cXKD4
	DwMPBlQq9bYv35mXOgG+O8IK6Auw56mA15yqssbYn7TBIsaaQKjVToI7TKOY6E752VAo/nnQrO+
	3xgKcrc8i5MFOA8xpWrTJwcnvE4CbG1bwSVP/ehR0fc49idqvxRegRETI0Y9Pq7blxVrxwTcyls
	tkOdNWAMRFlVLpFIWkmOE9BnH6VYWEWTnOwaICt3qylCRO
X-Received: by 2002:a05:6000:2684:b0:45e:f228:830d with SMTP id ffacd0b85a97d-46077d40be6mr3398045f8f.23.1781343500099;
        Sat, 13 Jun 2026 02:38:20 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e592csm14464581f8f.36.2026.06.13.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:38:19 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Sat, 13 Jun 2026 11:38:17 +0200
Message-ID: <FE7Vh4yfTmGMM24i18Wwwg@gmail.com>
In-Reply-To: <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
 <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 10:34:42 Srednjeevropski poletni =C4=8Das je =
Alexander Sverdlin napisal(a):
> Hi Jernej,
>=20
> On Sat, 2026-06-13 at 10:22 +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das j=
e Alexander Sverdlin napisal(a):
> > > Add reserved-memory node carving out Trusted Firmware-A region spanni=
ng
> > > fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> > > itself passes the address range in the fdt to U-Boot, U-Boot currently
> > > only reserves this memory internally, but doesn't carve out the region
> > > in the fdt passed to Linux.
> > >=20
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> >=20
> > NAK. It is job of boot procedure to properly inject TF-A reserved node.
> > Any issue should be fixed there.
>=20
>=20
> like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
> ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
>     Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ? ;-)

I was against that too.

It's time to be fixed in bootloader.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej Skrabec
> >=20
> > > ---
> > > Changelog:
> > > v4:
> > > - new patch
> > >=20
> > >   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-a100.dtsi
> > > index 7cb06b19b5a5..d8391663fd1d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
> > >   		#clock-cells =3D <0>;
> > >   	};
> > >  =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		/*
> > > +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> > > +		 * This is added by BL31 itself, but some bootloaders fail
> > > +		 * to propagate this into the DTB handed to kernels.
> > > +		 */
> > > +		secmon@40000000 {
> > > +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +	};
> > > +
> > >   	timer {
> > >   		compatible =3D "arm,armv8-timer";
> > >   		interrupts =3D <GIC_PPI 13
>=20
>=20




