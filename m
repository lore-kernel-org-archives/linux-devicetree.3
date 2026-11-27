Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796429;
	b=AEOBMSiGJdAG3Au4XWPUhmJ5MsgJzNlw6jI2EBmEQ65z3HmB0TcNvYfCG+C6o1PcsYwq
	 EujeOIwBOX0upINLg9BVse1efQg4saMsMlRw4LD14iGSvQpIIdNxO462vu2fAAYv6hqAB
	 CGQQns4A7CU4zALyRhvnJYGVaJbwLL6X3WhRY71RrYJQ5D7iFtmKmxxzjs5JBZ3gNVAgs
	 uM6/1K0v8+1M3A+39Nw6C1j/Ktl5QqS2Z3SVbNQdBslqr7DuNs00g7lnsiRkCRhyB6Ph+
	 0iMRALX7zW8lFhlwh9ubJlZHEPHVWVClNg8e8WwpzhOG1Bq0fdHoIAbEXt1IuveyL+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796429;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MdSaMCAc+qzeX7UXVd3frQ4gh1bW5tiz+7uBp8jCnoY=;
	b=o2z/VoLjp+CMMukRrJ+aSpfXZWDM2HNlTRLKAO6GTMyXuX6xdrj3p770nguWBi7IJKHf
	 2vRRXHeyGar2hP/mtZ9Hh+dRLrtQAdQnkpmVCqEKdaRUtIh2xYtJjEv2mfqNt26nTQz9S
	 yBc+UndjTbgSdbZDw7V+ulGBHDIoTs/NBWjCqlV0MmBPmd/JajKWYl+wlxmR0UgQylD2g
	 e5uIxi4wnoNXcSLskAXjC6FsmmAxmuw+N3NcbKBXyzZoNUEZ3yU+kbVHjcu9J2zhVaAAK
	 bfJFUmoYaOQBG5RVY6/8SlCsirS1tscjRyEkiw0gNNCv9e78y1qoamdBjP5nMLF4vFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NneZHaJ4;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C936606A31E;
	Fri, 27 Nov 2026 16:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C936606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NneZHaJ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796417; x=1796055617;
	bh=MdSaMCAc+qzeX7UXVd3frQ4gh1bW5tiz+7uBp8jCnoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NneZHaJ4TbMuyTnToDQBhvty8HriP2vdPw0GaCzr3Jcy78uh8XzRN0kke4cETX6OG
	 qyAVsB/+KaXdJo+ha6sM4xScSCF3ftOlPW3vZQDiPXA3unOb6kK5zYgVfnWAJf7vtv
	 YERQKsmzS97jTLgkS05E2r7uWOm/B7goV47Q7urV0QdN2hyFLgUMVrVXIyv6HzBtjs
	 +RVH1hb6tWWyPTYcF5NXD83t33+NZsDG4lsyMtVyA5URLSkVbmvS/dZDAQw0Wq/jbj
	 Ep8cyoZb56ki7pdu5iaQ/WPt2bdXiSyjk4ts9YWx8zovFbaOsMCk/Dd1h9UvwJwWJY
	 c9RcIpRv6mtXg==
Date: Fri, 27 Nov 2026 16:20:10 +0000
To: Jerome Brunet <jbrunet@baylibre.com>
From: Norman Herms <dockseed@proton.me>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/5] regulator: Add X-Powers AXP318W PMIC support
Message-ID: <k4mfWv4pn__6O2VNVO0m6q9b_sQs51o8jXhfyLFIDj9kSZyQiS-2WoOhpH_0UJ3sAgd0g9_hmzmv6sXcAJItWvSZSfUoXLy9TeCoKpnENQo=@proton.me>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: d35087955f693b2c24b74f0466b801600b1e84ae
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

Hi Jerome,

Tested on a Radxa Cubie A7S (A733). We run the same code as v9 (the
+/- lines match; our tree is sunxi/for-next with the v8 patches) with
Enzo's v6 board DT on top.

The PMIC probes on R-I2C0, all regulators in the DT come up, and the
bounded ones are within their bounds. DCDC7 (1080 mV), DCDC9
(1240 mV) and ELDO1 (1075 mV) keep the values the firmware set, and
there are no warnings in dmesg.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman
