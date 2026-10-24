Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877616;
	b=MI2OQ3saZPpvYCk0mtfIaEhOhlyFNBOs7iM+v5+Lb6yvEH4CJMqaShI+seE4fLJvVfJU
	 Pq0drdlZK+DBaSxpfhsEWPqqNJVRKnDyFEAkCxUlkoHDbpnujsY43i8IfwLB1bGJoRJte
	 GPO0ELjO3maSTsfILyppXs8R563cl+PiJHgiM/4A9C3/jZWJMpO/mhubrMDubg6v8wuOy
	 qxMrr+3LF5ABtoAEO8A4v5rv9YBpVBDOS6pTGcIwczEdbXPH4UWtEY65PkAPTHGmqHmjo
	 61Vi19UbiI23klQjige8y4JojPtoscK36Z/SPZUinFn6xnzYgYFfHr3koOinOmLkSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
	b=H7LkgiYcd+qS3Ucol3aw9vtDgQrrcMwFoe9OfluT/8Xp4mrb8NGljDNT/BKpbkJzg6kN
	 tFl7Fpr+0UbwHSfvQlVb+AwAN+wh1bSXChzzjqpUdZr/iQmD+awFdd93RBv7Rs5ZY3hV0
	 M/EiizAnQZ2ibn1OZfnN8ypUGmsgKmn01FUoR4nMuypgoZT60UhSF48ZOibQ5ZrOZJkMW
	 sgCDDpAXduVI+aYio71yOBZe6nvIgsIXlUSab3nH4FE6jxbJnwga1aXhdK2dAJg2qHu48
	 /6+6cCQoWcAPQsalVunDhDKND2xqs9NUGGJOEYyDNWAI+kfwsQ8lNUe/DdDPsTOOwlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zCt4oLyI;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67FF606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zCt4oLyI
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13554485e9.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877614; x=1793482414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
        b=zCt4oLyIkkf1CqfeSXRB2mIw1vUURk2wMEQclBWujMGgge8xHAnWmq7H82vRauzL7y
         FAoerBqlzYJKFOkvh9Ejj4giXXpdZn4i7Ev5wI7xnyezfGiOdsRZ+AAGQdEc8q9gaayV
         k/cfAIp+VhKqscjhPf1Xn9g8odsIFHNKPHpCp6MFFGxo3Sip4v83pVWapXmdfIB2/ylu
         456rlPZwb6DVAzRr26myyhB6+uPJOEain+cKR9mpOXVbs9jeMyzm3hcJcoEPX8+82wSj
         k7H6pHmaYuMEbsDBCg5iqIEjpGworu3hpgfFHyvjNCu7joTAVwDp60xcOn8lZQvLwcby
         P5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877614; x=1793482414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KswdmbKVSA5fjmS6TP3KWbeGyCgT1MgBNiKyDDfZYs=;
        b=zXbC3zO0PVPgbpnmaGRr+V22clccXEeHg7TbJWLZy28BGYL0wKO5n9UYHCE4UENHfz
         yz2j42/didckYreJTLelhhw+cTgxCSDmgKdi0YloVKCXIJ4wf2nLUo7fgXtr15dulFsa
         VobL0SF5Xm6do9R3wF5zkX1nhsHqY+D8PbmhdQU2fTUvl4YWcCYEflGVt2EFCHccI6rH
         TznBz8A2YzdMRnDn04il/xDy3iBxDNAd492AQwGWkFiSkiMnyxhaAE5ix9xq4291GbrY
         XniOXUmjiSMzi4+iiYsMShsuwrVEu4V+EJCj77eqWd1PCAUzx8LbiHmEcaQ/iNOEMpq0
         urjg==
X-Forwarded-Encrypted: i=1; AKwUvByhKzQboJ6CNqV/d7Z7yR2guMQw4Un1ne8pZFlBSeX8oqxBjsUhrPzB/ZIhKVXFB02LxP5U0Z5YOjjY@vger.kernel.org
X-Gm-Message-State: AFq9FYKqEmPU8jGPRaoM6wR8RbgqDwHQo6yzoEvzEnqkjr50w9IGpY1Y
	AkI4wJh57nt9MVte7m+rCWLEbuX4LRaLaYkSDMARY9nT/ltaiuZvOZgnS2nsnkM+p9bA3tdE4m8
	A1IFnDvw=
X-Gm-Gg: AYBFou1aD9d7ZlsQOtRUt3xMjwrmBknB2+WQcpIipXlVrdSmV0uTcXgut6+r7E8qGKA
	8QJ0f3nrh/Z8+x4xn2Vd4sBjy/LhoGaEkYVa/vrOqRoXLj0+ntHTAHcEXoujAi1rMegcgcuLovZ
	Y7WRqHN3TXPcHezTEY4zu8r2KLlVsLb6/bS4AvgqvF1cwGlvYHbp0HHkiKSH2ju4hRuiXb6MnY0
	TFSL5hH+bafiiGnbpHDEGF+jsR0b5E4xqJOokeikI3moHpyhMESL57tNmLkIeHURanpURy1tWHJ
	PSJ19SgJXUxiQ1GxHU7Wq/h9XiBvlPnJ98C0JSUvgr4GGgugNseK8CKBH+ILFNfEXAFNAiEtrLh
	dtcuIzrNNub4MvotwZ3tpSFxiGxn5ezLenTJx9XVSorcZmcCcSGwDBuOifIKJMoA9xUyRd2isso
	d5b/MQQliIIjQ4+i4kKi1eo+vYZ0Xr0tLqEHCqSpF+asHF4K1wcvps7i0MomvqHLTHicmkwv3LG
	YratVq6dyDMICuhpk+/9asXOfRWHh7ShgXqXLgHtxVVM7wJ6B7bdHUIe70SVigvYgxsZz5tb7Ap
	P8LuVaeH5UHDvAwqLvR3PbTPTglZD2bSNn+P4z3AfqE1kylGWm37sKph+uB5JFzEbyLNclJKAKM
	=
X-Received: by 2002:a05:600c:3b93:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a35ac96004mr48075955e9.12.1792877614164;
        Sat, 24 Oct 2026 14:33:34 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm50531495e9.4.2026.10.24.14.33.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:33:33 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	Paul Boddie <paul@boddie.org.uk>,
	Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH 2/2] i2c: jz4780: Add support for the X1600
Date: Sat, 24 Oct 2026 23:33:33 +0200
Message-ID: <20261024213333.51569-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <465127C9-AE28-4F01-8721-8D819258D45C@goldelico.com>
References: <20261023081452.44118-1-olivier@mgcrea.io> <20261023081452.44118-2-olivier@mgcrea.io> <465127C9-AE28-4F01-8721-8D819258D45C@goldelico.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nikolaus,

On Sat, Oct 24, 2026 at 05:00:10PM +0200, H. Nikolaus Schaller wrote:
> Comparing x1000 and x1600 programming manuals I was not able to  confirm
> that the registers have moved or been replaced at all. They even look to
> be the same as with the jz4780.
[...]
> So your problem seems to have a different reason than the setup time.
> But spike filtering may have.

You are right, SDASU did not move. The write to 0xa0 only worked because
it shortened the spike filter.

Measured on the R1, driving single reads by hand with the filter set to
each value: 1 to 100 APB cycles works, from 110 every transfer ends in
TXABRT 0x1000. SCL is high for 102 cycles at 400 kHz (140 MHz APB), so a
longer filter hides the controller's own clock. When I first hit this,
the R1 had been started from the vendor kernel and the register read
116. Its reset value of 1 works fine.

v2 drops the X1600 entry and programs the filter on the X1000 and later
to 50 ns, with your Suggested-by:
https://lore.kernel.org/all/20261024212520.91401-1-olivier@mgcrea.io/

> But I recently have seen issues with i2c on x2600 above 100 kHz so there
> may be a general bug in register programming which may affect all processors
> with x1000 and above.

Could be the same thing, worth reading what 0xa0 holds there. A value
left by the boot loader or a vendor kernel that is longer than the SCL
high period at 400 kHz does exactly this, and at 100 kHz the high period
is several times longer, so the same value still passes.

Thanks,
Olivier
