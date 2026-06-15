Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FE3E556C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524503; cv=none; b=Nd2EG2QyxI4Jq7LX9bRCvhuZ3pz2FsYUjVbvYEbhGW7dsX/30SUgW8awOx5cOdRrfCm8414dgNG6hvOnmX9N/sIA8uicFJD/zSAcQcX6NlB2rwXPfMQZyARuzhb62RS1wbjkjojB4bSk7sHVoJJZTKguoCr+8qMITPjkQh0K9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524503; c=relaxed/simple;
	bh=8LT7af1gvzlV2+WXjAvarECgjW4NHzj9sQOqC8g5KNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwZ2N7D4OYOmFmULynKePym1RhHGW4jFU1R5DugiSs68CpFWLLSbdDa53QGrQUjm1o3vMhsKIA67xjIT6cl6WhUezIfqPW8O3KZXsPWk2O3Atr9f4Rmft8GB+1pDGENZ7vIdxUoMFXyZb4HOTkHWUrQeDv+cyq3gnClLU7V5GQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekkZjYzB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekkZjYzB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22156865e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524500; x=1782129300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZKtPG2Rsu8KYTHm+d7DqMiooUqTh41VK800SmJxLJs=;
        b=ekkZjYzBuCWWthQyAGE2N9MIXEWntFE1lPeXnPlgpiCWGkFxRT1CScI9Ng04oIbUkZ
         I+0V7keGQ0uuPgYu1dXZtPkaiHbHQnbWheQ4xGpKrnS2RU4WLbaE3/gbL8XxLLmk3CKU
         rpqBId90wwwlXsKZ5FsekyG7yLdPvu18C8S5LRm9mSoJYsCFq4y5foF54fzdCBHC0XZG
         vxGJ2/rBjW31mpKJZGjMQajDn119qDImMwZOO1y7Mebol9B96i6s82MyonGGl7Al/MzW
         QQChnw7NzS4LIp3PgDYiS5AeL1/uxA+VBvFgS1F44IiKNYqCBBTTJSiB7y4nO0htkPA3
         0F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524500; x=1782129300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZKtPG2Rsu8KYTHm+d7DqMiooUqTh41VK800SmJxLJs=;
        b=oKeSV1IL5T6s3SEImwFJDFM2lKBzQhNXb/yjbK7dpjc0vHGHjvGKzqpAn9kU6UWlWZ
         S+QFPrOBEfr9tJ6PRjmE5f0LAA0Dhngqjx01n5ftjVdbNONKhkUzx2yWt1C+sCAYhCdM
         w1v4vx2uOU4ZVNfTltmj7htrZ0DzkcLdR59HexOD9/ZuwgbvNVV87Y5ODNTSPMMRcVO0
         EGmhZJe/BQDms1pSIua3L57XndjN47id9MfS1mSYT5AaoclflFga3iixT0+Xi25vY8jF
         Edtk0sL8mwd27MIT2d9uWSWxxvAUXw8b6fDwxBP/OIeuEye1W+472+i/5K9Ex9Pdmvsv
         hdXg==
X-Forwarded-Encrypted: i=1; AFNElJ/trQYbVIjLsbDuWZpXtSyssQ90cr38j1mE6mTtGHc0hTIK73HJErEM/aHG2jvM/ma8VMUwfb6uu4m1@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtvaG6emo7VZtoXed3eMVDQdjIDCK1lQTNkZXvRlfPQTB4r5o
	6/WBXydM9dc5dTlVGO2LjpCWf+lkrX/KtxJmDQXYl3EvTmmykFB7zmrs
X-Gm-Gg: Acq92OFULNMsrYdlFo/hf0UYHag0/W7RlouQc/BW1iACXlPZPv6X1TkZCNFJcfN+8Y4
	37cxfrpGSda/9Nj8gVE07crrEEzySUn8BGLbSzSP0ReO1L1QQwNcFP9jfKDgmgIQsXZ8M+0RpWW
	jqrAdwaMSEcIYXVsUUs/dQvrU8OFXRISqpBeXJQ9HuEGRve5KFV4GvcvCdHAiWBjO7YLrmhNITz
	NzEB1R1KBl5q4Gwj/Ur10U7fA7XnFW3NjV9MzPQ44S1elPruAstYIf8vDLEOIhLCWbT+Rss8UTJ
	esPqxENQrAdUcqQY2M+w4PMKrGIzF/X2G9xyYi1upAiPmplZDfCT6tVyI5tcbalT2cYXu+soAan
	pVqAnLags8aKvVx66LAaItBmCAttT22KgSnCTcRaNa1elUFiKcWiui7xOkwMzGYgGS/2bOBKVyA
	0Jd4g6s6YqHJsH1R1Y1Mw3iRL+M6zC5wBFqkfA8Qm/7u3rjC2DkzHBV+8RuJ/vUMUVTrzznGcv0
	6a1xNxIdlqDOkaeIZDuSYBjzd5L/M6htfKq
X-Received: by 2002:a05:600c:628f:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4922017b005mr122122595e9.36.1781524500002;
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:54:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add DU, VSPD and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 12:54:50 +0100
Message-ID: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Display Unit (DU) on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) SoCs. The DU is a key component of
the display pipeline, responsible for driving the display output.
The patches include:
- Adding VSPD and FCPVD nodes to the SoC DTSI files for both RZ/T2H
  and RZ/N2H.
- Adding the DU node to the SoC DTSI files, including clock and
  interrupt configurations.
- Adding DT overlay support for enabling the DU/LCDC pipeline on the
  RZ/T2H and RZ/N2H evaluation kits when fitted with a CN15/CN20
  ADV7513 HDMI transmitter.

Note,
- DU driver patches have been merged into-next.
- FCP/VSP patches have been posted separately and are in Laurent's tree.
  https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/tree/for-next/media/renesas?ref_type=heads
- Clock changes have been posted separately and are pending review.
  https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Patches apply on top of renesas-devel/renesas-dts-for-v7.3 (e0c6913891b1) branch.

v1->v2:
- Fixed typo in makefile for ARCH_R9A09G087
- Explicitly disabled the LED7 and key-1 in the overlay
- Dropped comment about DSW5[3] in patch#5
- Updated commit message in patch#5
- Dropped internal RB tag in patch#3

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g077: Add DU node
  arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g087: Add DU node
  arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with
    ADV7513

 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 50 +++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 12 +++--
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 7 files changed, 246 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

-- 
2.54.0

