Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268107;
	b=LiS9zo3+PKhp4UGA8WnHtCgp6AKanKFs+Uk7PwaWR+7MrFfWNDES6uQ87HJEtrNfvb5X
	 iD3bLST4UbLli+XkTNevDo6XNLhCLSXuTwD2YvN+m8Alq4fekOHNMovSn8kf7UrWOdujq
	 x0g/xIM1HRt7RM3njaB1Sg/qYaS1qh5P5H+N6l16V+/FDjf517ro5UhaCs90ypxVStaMK
	 s9UifjSFfGzW9Iilf6KoQRoOoT/+r5p7ah6kc4ohfw0aW+zVVko3Q0QC3b8qy8YiTSHfQ
	 Embbhpq3MVmBKZhTrLyt5t2V79E6dMt+s1O/aO7SurZSUPsD2SxlQPbBJnU3Od4b2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
	b=SHWHFokxMoA7ZfY+6OLOU9XAGH8pDSAFY8q9UKW/g8n+M2J8XTEr/7QQlJhY0DQ4/+YP
	 uimooD+K68TtW8eUWT2p75MtAccunkrQNjl7Ebl+0rxM/2EZ1SSvlbXPmLjbHjuuO7c/d
	 AQtk7vUoxsAFfmDsGu09gA0yRTxOsCzxElbMSSSGvT1639bqKBVvtbUoD5jCaEHIGndB4
	 JrN7V/dDXhWxFJ+RlT/eTQjbTeCIaHQgT6VFCuhpA0i6Na4v+9vw5aAm6cQ4VG9R/eJaD
	 +/4klvL5Sw7ijVKHND5R3TNoxZMmK0VQPL23NmQyHpqeLTxPXrUK2IAQr1EN5OD9GcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jQuOzM9I;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA160A260D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAA160A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jQuOzM9I
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc751eddf25so717428a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268106; x=1794872906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
        b=jQuOzM9IX+CDejyj9lEWy+Le4fLWrgxC7pMqccH2Wg5zeC6uE+gBhFkr2MlltqoWOd
         nwcJJbgLlw0d0SVbrPNazeM6EkV0FCn//l3MkBQb/eHF4mzoweVhEaXHe0l4Za9b25HC
         C4UY0h+aqhJr0zzb++d+49u57+0DL6Sxlpfq0BJO+0ZMipk47YrbfVjl5AkxwbDIn02T
         0mllEbzO80n4b7j2pdHzgQCG4JZExDLTXneo01xNCHa/wIOUcWHJGCCksEWzX9AFplUi
         Nt1RakJxy+9VnGhYO15sqHkEv1SYKCSGqdT/bmHYbdMKAff5l3mk/x3MSnn425Kd9gOC
         hj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268106; x=1794872906;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
        b=f2WKEE9xqg2cZe8HfH67cF2EG7D73PgX048FfAE0vBxv2BoFfm4neYfhEiQfyW3yuO
         ebW0nX9v+nJuREqsXaJMbVyAjFswUFSYaOHVQ5YMlbmzRbQt8u1+ZBBhMugJy+hL4KZZ
         Bdptci+ssjQNFsfKSYynn4s5s3+408/BxaDrEGAdjToYp4IEck2Z62NfTjDnehx78sNz
         0htNUmrDLLb2xPlliJ8iIN4UDf1IKPk5lpxmo3UBPKFKHuE2jJF1MKcsfHbpUJ7wKCpO
         Qr82Js6WJ0g6yqpoDsa8rp6vraOxnj3edyKLcE9ITbdIzeKy/Ux2BXjo5rPpIzw6XPF4
         WEjg==
X-Forwarded-Encrypted: i=1; AL+hErECVJ+b7iH330IJqgjZ3P1bd545XZT3LY/QzF5fv9VV9GJGS6i8/td6kjWejYgaYZk1KPamrgt5z/bN@vger.kernel.org
X-Gm-Message-State: APuU4Z+bgQb4MFR44eLTNWmyNA518YjiLe+V3pkwYtkv1btxMwgz4Yiz
	SpVOZfv+AtiScYD8t6bXy2u4Lh6VTpK9ym+mo4jwdBktU4ovXCAQkYbCi/+JGh8jLxI=
X-Gm-Gg: AYBFou380MH2ZlHTyWv3j8JMrH/kScStsMBGvpEK9xIMT3ILYkUuzyOJqiCd9bzrO/O
	ooplcWgnvTzFe3bpqPbLXilNREWJvoftAoQnfJhsz+n2+jpcx6kw7e6xJ0e8A0baG4aP9y26r1L
	/pLlHKzL0AWuOUuoGpj4ej5yURL1UuTaoozryRDiDnrf9iOpuMOZG4BLbvZINOz56kFqgv/vV7L
	EG4QkKGwKt8QtG7ZyiR5cl5bldu3rMIPq5F5gDP0jc6+VgQCp77Ka1kNICkqZwDs++WLTVWu+Y9
	y8i/fH+QkMnFPik4VtYLkq8ZO0UklkESh8raX8cYSnPK24HYVKwFDa29eu2J2n3DgwXRrx5LbCT
	68Gd1NCTP3jFg7KBa3Jq2Se0wOj+3d2+FBhmTt/FY+i3bYHU9n7phmyFajoyOF/S6b8QRWP9gQJ
	36gZbx0UUWW2Q3oKyBHrGubOaY2Jx8Btsz/8Rdfz821ymyGHolDfggkOxfQTiGy12YyOnQr1MzK
	VVd57+AsKQR3DzpwOFCp1+Ks9wcf2hLWdmTDeLT5Rwz9P0ZD7m5v77nOkSX+yZd8MT9l04w0RKw
	ILtQrhQ2ZZPRbm1vnA5PKMemFQ==
X-Received: by 2002:a05:6a21:8986:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3f18f98f975mr625196637.56.1794268106473;
        Mon, 09 Nov 2026 15:48:26 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d6940f6sm198558a12.12.2026.11.09.15.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:26 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Richard <thomas.richard@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-omap4-dtsi-v1-1-8d987f953fe7@bootlin.com>
References: <20261104-omap4-dtsi-v1-1-8d987f953fe7@bootlin.com>
Subject: Re: [PATCH] ARM: dts: ti: var-som-om44: add local-mac-address
 property
Message-Id: <179426810568.2265990.3229558705065836668.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:25 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 04 Nov 2026 16:23:01 +0100, Bastien Curutchet wrote:
> Commit d8f1b27c9f12 ("ARM: dts: ti: var-som-om44: Add USB Ethernet
> controller node") added the Ethernet node to allow the bootloader to
> patch the device-tree to set the MAC address.
> 
> U-Boot has an already-existing helper that does that but it needs the
> local-mac-address property to be already in the device-tree and an
> 'ethernet' alias for the Ethernet node.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: var-som-om44: add local-mac-address property
      commit: 75bded0727262a73500c61b86bb6420fa9e23f3e

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

