Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557104;
	b=W2kJP5XKxSHRYGV31mf2HpZ3bbwou3wB+Gnr2Hh23wcEX4ZpIYj8LWkd9nftyZWTee+P
	 63jI/aGLBsTMp4g8TIg+ZKgC3jQJo/mENi1KdeEO2V7+95pPLoQL1qkE8vUYe8y8PvMre
	 crbsJ4eUUWgaXbjmLbjw/J+B0n1BBMH5qQ7zHaDTqUJXw2W7BGhpJAN5fhsthtacLBOO2
	 Tv5xUoJ7HTABmSOa+oMi5CNo7BiW+zhV08LL7JCPBNwKGTC2oYGweDf9VpQppp7vPt2VU
	 T9WDa7A+ZGSqnIqi2od+zs8aAEsQDOY+bNWTSKRoO04ff4iSfXjSsLXiiYDV1fSEGaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
	b=vbBIchpLyrxNoYBB+Y7q/z01IuZE8RcOjTbossdDiy1tvxlJxXsd/DhkdfuYHtljGZxC
	 F9F0WSqLOzmjf6sXspJgCwZD75KH+XHC8rvhfD8ItBHloq8v/AeJcZyFhLINeSdVyMe2E
	 ZLYff9eNH5ZOFGT9X0U2G2ZLK2Y3JR30pKm1Mg6wnN5UF81k8p3oHYNsk6O3SHejoW1f0
	 lUnMveySWZWNJl4WFns1yRHEZmh+Cblkkn4UvITeXFI31ZtfLTz4GLA3Kg5Mdl2CcaSM8
	 ZkYLc/l2FpRmwNAMrVx/eW8kW2fQ8szMdBzRVG4ekTWHXgBsaA44yGzQ0u1IUDvxcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5EC606A68E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5EC606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FmqJqJB6
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4385931f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557101; x=1796161901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=FmqJqJB67hQrYyaw6JTpSrEOH6WEyZZtcyc5plL8wcZ2keR3VpkWteBgkxRsITP/CZ
         b4J5DSAB2F4oKLbJzWI3QWjUdVmJVtg8k6/Bn5xb3PG5mbq2TEKjdItfhGAv74smzepA
         fwyj5+cySHUuzGVweJ6u6bNnzA9IWOnnpJhGRBuMaAypQwp97X4BDJSOghVxCza5T1E9
         Fw3AxXJCT5Fq0d1pYHNSr94fRnVayeTzufkp81Z/OKs/wStM7rW4FhxYTtBOrP3OnpD7
         MYJGMCMKq9YE334Lle1k5MK5SYkmspKRi7PL18Zt9eIH7QGg0FDy52PLHdqZnFQfl9D4
         8RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557101; x=1796161901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=OfwMbn6yhoULcBFHi9jAaPECClrlI7p68xo3OuLwUhl77lZuqhZmFNNuPi0fNqyAzg
         dLwlENQ0cZs6xcJB2NXqSc1kMP/OtkiQ//hpxV6hvjcP9QUalAkGUlaySQ7W1VgfvoLw
         gst2q5g50oz4X+p2OAQZXhu8fR1FqW2rA9iVOrTu5GABymZOVv2y3GRoG51/PcjdXySu
         x80ndpLWzDCHKZU5lO6hp9/Aa0wjHP15tX10QmmdLqDiID+HqAoA97G0E4yj0riAU6Ff
         DnhEqSl1Mjax8Ad5zfJTTnleM23hgc4kb8bMgszAj3U/qnIp8+XAh+RF3I3OgLoI4wBl
         IZzQ==
X-Forwarded-Encrypted: i=1; AL+hErFEe/KZe2JrjTn/RMANxlB9TApv6tqv810y3Qx7ktscbGQwbYtUGoCJPC4ZZSo1vSNdOYAQq787RrDb@vger.kernel.org
X-Gm-Message-State: APuU4Z/JyTOQlh81THoLMwXxtORpr/5ccev4pJsiARNX6AAlmnHH+0ri
	nkviWkKhVPPo1jT/hu+3D65TkCpyH5rcZUkdSGWeGgHr3IA+BDW0yu5B
X-Gm-Gg: AZFdTZegi5f9QU1J2cCnqSN8CKtcMEYLVdTa13k4xpUPjrwMwROw3IKARAtCvV3KXGl
	PyzIi8dL4DGSb9tu0hCarerAitn1HpsqYG9PXSFy/fODqBiPpwS6cU22plB2gOKYJBtbQ26PM1a
	1JlgVc4Yq+Z4N/SqBfB56/AcZi37T95z1w0sjkk28FcHNQ6O/1o0Aa4X7bsrU86tpLB7J3Tc5iv
	ni0Ox/qmv+vdlcnIyAGm9dLmyZ6kX7b534e4UpH1nkxQbnlwck7AB8A7CYEVP7R1b3qwBcberlZ
	Dvgc774gHCbllIi5Sl2gS/RLPNyRsbkMwh2fbuA8MCoVgGFH0g4AM/Y75T+voRNPRsPYGefwcxM
	YVDk1k1RYHZGnncSvnwjsPJlOhNgP8FyhpkpZE+bTpgO5Hs7Q0AcxXqxFet92hhlLrvoEnGkAmG
	7m5AXkw0xaN1sQ6o6KLONpvk0hlpcG3sAf33rvt0PDyq7CI2RY8kvLiryOczwQVk2R/b7qANbQm
	3HLZoXOLz3TEkrftx+CZoloRhKDHy2WXZ3k5CJsJB+2NcDp0+8SbW2nKU53X/c3hUhu2CtGB/ME
	LPr1hOzA9weCKGSPUXnoPlKvCQZuWbiHItHXzTNUEg==
X-Received: by 2002:a5d:5d87:0:b0:4b8:db69:1b4a with SMTP id ffacd0b85a97d-4b8db691b7fmr2464923f8f.55.1795557101212;
        Tue, 24 Nov 2026 13:51:41 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:40 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:45 +0000
Message-ID: <20261124215048.42074-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

RESEND:
- rebased on v7.4-rc1, no changes
- add Rob's ack on 2/3

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.1

