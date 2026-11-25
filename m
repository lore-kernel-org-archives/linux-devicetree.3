Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608911;
	b=b2Dta8voKe5fDL9jT4d6aAFVBbJ5LHp4P91W+5nQFrVB1eEG8EDqVTyNiG5zaKSzQQrQ
	 AcuRiPw/NYI1wBSmOwsKh500pGCwQS3zfyU0pzOhbSLXQoCOwNoZnhiNowS5qy68BTjJK
	 Uh2P6DdP2WhX75A9KnHvseMfvKrEqNp3Na8vnoW+s/WhL5/0m6FVGiAw+NBPynPM4gw1J
	 5K5mBXW1cOpydBK3fISYvkusxZxx5IaJoZaarWmwxbav84HCSGOo0yGYP7hEfjA1wtfqM
	 lmdIL1niSyWHD28l26ClRSQ3HUTK8qTyBH7CRfE17VlE2QTGy9uKO8Uk/ejEHNDpznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
	b=tiAmb/c3kOxpxxE3b6RKug+omyqBG9828yy8F+qC+9ZnXRG/FY/BOqZJfpuyA6/nXUvg
	 rYS2Azn/gSgtkLYyJMOFdJXs35wNDDQxo/27FmTo3wsA9gdxWJVQgimuowJvcnDsrA7hs
	 K09trl8kWTYifVT+lfEyPyA1oGFeaIuGbEH4RrKkqBrkOwfm4x2fw2bYDww7VHwGFuJ5/
	 adXqWuJPran73uVg576PRv7ypG3BfS3ufV1sMHLlbVFAAdNbj+m1C+B4zsNjBV3Dffc3V
	 eRFMsL+umrejlUgoVpwxFdwv0zsYt+J+ZPgg4Nucs82nFzMHSrs8eznsHei0TbsHBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Gla3bR/X";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306D606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D306D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gla3bR/X
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so45358395e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608909; x=1796213709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
        b=Gla3bR/X3n4K3Z+ZPSeOtToRO8WnV6ERzay8JSw2o4o66TZlk2AtLz4tVhBUGoHmvl
         PndKU8cV6wsff4YzyoK/fjelbiVzBk09L8OUwBw9JqWUmBDluN0b4FFcvEBEmzEKGJEr
         Py3RM8CWfAHH46mfQBDMsJSvOMO61XMhSMfGkXX/hEvFvn3eLoeu56Cl1NaF/8jwr+Fb
         nStF0gx3Hf8atPXEdCjT/tNrWQ7H3jwr+w5AkEz9rROj/PARYakD7XHbaIFx2+7sCJA/
         GuJy8zBCHCzF72ObKP+M+IjtJXEhjIiThKndgjgFXGSW71GmhaQwgifhtDrfFHRd9sdR
         bxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608909; x=1796213709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOmjDet4CehHcWMpBY2GAw58yyKf1Sga9AXQjB5h2d8=;
        b=VABouxhdCS41FuzVs4OREZFyQXLpFDoCkYeWqP8PzAk6PRSRVW+KeTT4uhu4NDmsY4
         kH7VV6oJuMdeSUM8zWobb1IoP2+KApTIB9ZjgHvAsFdBwii6NItFQBSLUfZKmS99U9xa
         OKlINQH88ZOIGDhUMJy66IVXgJERYvd8uSWWeHXdT/vP8XR31ZMO1fX+sLZqsrQafcZN
         UlE7yHSqobUJCv0DyZuJytsegxFjfL5MyBD8UF3o2IrMzkrLPsDqMkVlPLb5qZ19x05h
         6YeqdvQNnKBaJGd5A8hFPocrT0A+I5QftHgzvk78KiTEXQHxwW3CWZmvahQuph9ZKDjb
         fFqg==
X-Forwarded-Encrypted: i=1; AL+hErEg4RT1dbgrJ6mRGz5dt+39YbwKxVQYnDGLIRZq4ktdUCcUqKW9oHySrD3td54DZUXN/dQGsZQWBkyq@vger.kernel.org
X-Gm-Message-State: APuU4Z9BIhftPCBTo3mOsFfncuzk1mymoH3soRl4r5iON/tB/EIu3mFn
	qsUrCOW8ehr6DZPkqn2NtF4fqWDbcdJgtyqUoN/4LqyrlGm+5gKdHbIZ
X-Gm-Gg: AZFdTZdxKq+oEUBePqAl6BITdTpMnCPyO0WAfFDnqQ36fgViPagrBUEYflPclX8FNeo
	GxrtXQnRP9JDudDw1YH2H2K3SR7oYkEX7fgFPJy6VEjEoqX6X3c1sis7eH2HqlfRqQsE8N4jkUJ
	hpgUDTFzfj8Wi+kY1Yuc7nrcebqPo1alFP56AgyFm1xC86D4ZnblPG6h2Vny7pCqbPx/BLPb5QM
	3BnyZmAzVsM7jK+ixGmNiXM1apca1OUF8wRZfNTNqQtaV2f/2Ed6iz5fP5zV5EAhuBMCRTAQaex
	5Qy9196WYlMMD+nxQpIYsmIO4VKISPBiR1qnlDpdC6YAuNF0nz7FYs3PF/nqHWgOKB2/C4xfagN
	qeycfN0q7IgnMnQW/4CfboQphKdOItfKus+byBYMul3FrHd+/QteDTFLj97Z9o8v4+RAxFM7PTm
	yZCNkli7ox1E64NrXaGuwhgigfYs6sBg9+7XGzZolCpQOzUgUzks4iFIM153QukpaLJrjAVoz1j
	f5bXe/6Ds5NJ0IaMIUoEHfO78ft8igEVLjmyXTxvxH7PWIZzBFFWTnJmjmE0UldzEcG4sWX+GbC
	BTHwLfmHtqf3wa7mw1AZ/yGKTyfdguLtLFeTid4mECTFI1vM4KWswKq3sVl0U1Oed3oq+7aqeyp
	4YrRx6WSwelFtGd5bJ0h9ybJe9AkNnnmsewBseVYVbNE/4bZ2eQH7u7rNoZ1kMsONCPXliImK7R
	/eS8vRfLHY
X-Received: by 2002:a05:600c:a117:b0:4bb:a5e1:7497 with SMTP id 5b1f17b1804b1-4bba5e18d83mr27314105e9.32.1795608908922;
        Wed, 25 Nov 2026 04:15:08 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:08 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] arm64: dts: renesas: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:42 +0000
Message-ID: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series drops the 'snps,perfect-filter-entries' and
'snps,multicast-filter-bins' properties from the GBETH nodes in the
Renesas DTSI files, as these values are derived from the hardware feature
registers by the stmmac driver and do not need to be specified in the
device tree.

Logs:
Before changes, https://gist.github.com/prabhakarlad/5d2530c2508e68d865507aab7f680f07
After changes, https://gist.github.com/prabhakarlad/a4b871a72307a310678c66b803456949

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: r9a09g047: Drop GBETH filter properties
  arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g056: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g057: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g077: Drop GBETH filter properties
  arm64: dts: renesas: r9a09g087: Drop GBETH filter properties

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ----
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 6 ------
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 6 ------
 6 files changed, 28 deletions(-)

-- 
2.56.1

