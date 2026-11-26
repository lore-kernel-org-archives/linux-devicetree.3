Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725228;
	b=YupVNoinPlGwskw2UZB/Q4D8ZO1KBbZQ0fceWl824cQZJqZvxsV2qQbugf+ixMaPoyGL
	 Gc715wPu3VERSwe9ACHQdxcVGpqBAWyx9PslUiGQR5GWYJ2oReyT8KvkN8zOqpaTHqh6K
	 rwOwkfSQoJ1suPOiT6BBT3PD5ZYiu4wK8H7mDhys0zqZn6nK1n2z3mDRDiKEGE5pfmRRM
	 CX1KVIG4o7e6gkN4Y9J3UXZhyTIPIMjeXr8BEhRxd4NwdphpTuCyC3L5xvIdSqyEQnwB/
	 kdjBlf4AKWdQvAxYMKmUuIwMtBNx4LpOIwr3tOz4heoZnFnFRs1lhR4AD+3ekfte1qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
	b=RRaJPYaPAUP9XpjtRcNMkK6osDtgYRoisScfYwqFMlFTycv3+9By3V2TMqa8Xgn3NULZ
	 iVjCr5LqPHlHeyILlORrnQlisinpBJt14s6rq8po1nduhtv8+v4a/jdXyaJtIsrcinSVh
	 B6kQoIEY6/BZlH+WRmQ163Q1ajL7RPplX1PCwmMG6FLidteaG9B2ZW+83FoTohJ5vayE5
	 GtulrAnZBf4ih2N79Yx5ResOOlTlrOI3oNm5Xbl+XDPveePEO8ufuN4pgsSMJ2nVscnfk
	 debDKiivEVQwXsPgCEqFnltEMkqy9PdhIhVkWXyIo5yUyHPOtB4NK6mqPtxtBraPmIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM5pywaE;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B71606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM5pywaE
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86298f9267fso3857890a34.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725227; x=1796330027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=WM5pywaEWxaYrD196hNJokrEB0kNq4Sgdtp/vgFyeh5/CnEIhrEV5z73vSddNT3wRb
         9EaD61P+480eK1dxKlNsgcyOilbtI+sisc3tXIGoIn49HmscxIEJUYkT3GkTofXvcvJ3
         h8jp34Rwadfbehibssz5/wwEjL3IsAH94NrTwdVi5lXVGlQiJcBUloJPG6wemirmtT/1
         XklbmkhlchN1GIrqQnGqSN6KfbbKywNdZBu+0nZyYUQfh9Oal/cFBW31Jq+H4dc2hPnc
         CpJLPIo9tYgKDaEUH77jqvS0eScnBcDo3m4/ywOTd0DO1Ly5ztffWu9HN9zi8f2G+ILQ
         Vtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725227; x=1796330027;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=P2Uor+LsgoLfGEaP0tl3WyrENEg71LPe4g+sWcSun7SdbtcqB7PIIUMXNILCTXgAw9
         zx7trlx5MOaw6eOM3qwfkxRmnA2BUGvsZbcuY1ZHZ3zykt0rqhWPZMjSzEUpR8MJcdrH
         6Ov6AYPpysOKc1XDV2y502ggGECZjJuR4XYFG/TeQsoLum34dv2shpquFexYds40KteQ
         rFlqaC6kBY7rMdbq6q3WISQz5DpHD4ibUznER46CIjsMkNB/aE3eG5WtcNp56mn8ronI
         GOkqrN4bSHjbbJx1wYXTtIDgGWQEn90lw5dTPjAK4C388oG5nr9bMJBxxTKkFpYOYU2H
         ScGg==
X-Forwarded-Encrypted: i=1; AL+hErGDXguOgnyey4juVuWGsl1XDKo+IKi9AmY6qg5DGP2csz7+SgHF8H1goZM8o9/YqRYyqlPSwkyzsERf@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8QXnKaQmjOxw0J9XgHvMAQRiFunEws+RlcezjrAsOyFWTYEu
	kKjTRG5Brf59UYSIpzYRmkAvn4h41+1b1J/8VZOqIHIvou87FySbp7EA
X-Gm-Gg: AZFdTZc63WJtpHhEbp9vVWD6582VdHHNW7wyd6JSNsStxDqGd0H/4VSR7pOms/bjJZu
	nhBZjfvyHzlBv8awAWKlszc3+JhTy+dpHmhcRCdzXZVn7/OUtRk1tscW84E+k2F6avOIfqy8vkf
	nlfZ+m15S04610Yu0iZHiGYUwSGu6QP+gU0tCu+bK80DFULldmvUPShMAXST+iwdRunTQj7P+M0
	PeEexwTDS1ST1yW5kF0TmisVg3/zP8w7M0YNLFohFynQtQkaoylEl66UQmSBtc9UkgpqMtgbJ2D
	nt4HzLR3wbsPht44AjLvEtNGLJebUQEeqvM3FC9YLymrQnvTjxRgp6xGTC1Dkf3Vomehcbyt+pF
	zU1fHpZBs4kHIgFn1etD/VZQ2aeTLSgNCCamS4PKutOZGw3GoZw4dmVnCkBwfN4uTpfRjGwvaDb
	9kk9p30EZs78qZHPYE3ggXEFif1xy1mwQIpw8XWnRFlUxXpXHOQGCE5Ui7eavU/VOuD/3BYVkCu
	pNAqZMXSyaVoHMt1vD/hjffpE1BIOPNa/HxtfSNlT2F03O8q/IOqZvz053oQngCL8z9ZUdZnwGH
	M2kbs2TjiKTXgs1q/8YCol4uOak77trkSmduP9sTdq3Xwf7ce1W2khTZhfnvVL2r8CEB1U/7wtA
	lubYWjQ==
X-Received: by 2002:a05:6830:2696:b0:862:c9e8:5788 with SMTP id 46e09a7af769-86314febd1cmr24635150a34.0.1795725226996;
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm15139167a34.6.2026.11.26.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alastair@d-silva.org,
	andre.przywara@arm.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 26 Nov 2026 15:33:44 -0500
Message-ID: <20261125-a733-04-alastair-pinctrl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
References: <20260910133519.459011-8-andre.przywara@arm.com> <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset="us-ascii"
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

>    Adding a 2-bit variant (writing 0b01 per bank with mask
>    0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>    and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>    follow-up series).

Vinicius posted a separate two-patch series for the same issue [1] and
later marked it superseded by my v2 [2]. My v3 [3] sets every two-bit
voltage-mode field to auto (01) at init on both A733 controllers, as
documented in the A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20. Vinicius tested v3 on a Cubie A7Z [4].

I've posted v4, rebased onto the EINT-mux fix in pinctrl fixes:
https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

Could you test v4 with RGMII on bank H on the Orange Pi 4 Pro?
I haven't tested it on that board. If it works, please reply to v4
with your Tested-by.

Pablo's IRQ-bank v3 resend covers the bank offset [5].

[1] https://lore.kernel.org/r/20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[4] https://lore.kernel.org/r/20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com
[5] https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com

Thanks,
Enzo
