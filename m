Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C83603D3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411347; cv=none; b=fUuZ/y2uLaDsAikdpxq8EOzXrFnNhkRtby+EkEbxxz99YP4Pd9ns9HSqDjU0l49XXMTUuJP5p7co7+GCwY2+SWmDSapadTOJPmjUWIgzwHRyU0VxYPAhOr4ITu7ku63imBvB+ge/Et47a307bCKmeEgWEEn6Lt02XWw7qcyJgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411347; c=relaxed/simple;
	bh=0ZtTflIyQ/Ih9q9zKS2+34drbheFWDbpyOLOT7gZzdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKC2re8i23GTQGq1eYTFmF8rMy9C/uvYXXck5eyYZ4EKAhiOgcE2y1leIfIun6AIOuj5H+s9smW4bVX7inP24PgALaHIOnEmwMc2aFlT0RDAQpFYLfjFwY+wSi55HglLjk/5dvuLcUqAsk2tMgGzSchzi98aezHNMEhesbELlD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhQcPKk2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhQcPKk2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48bbb06e746so956092f8f.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411345; x=1793016145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=85UJNW1kmvdUmgX8wEBdPlUGd6dDmuuDjcTlYqLXCyw=;
        b=GhQcPKk2ngooLxLHIzhC2YRzyGL9g9I+iRHytXtqUa9pcnTNMT4TiIR26Vad3qdb0v
         oLaVV/kAtSTkxPdmy7VRRuXCoEUz1DCmV7gVE4tqHaZdVymc7QZxtnHy0Ba4tb3EceKW
         K0WMME3QIMnbcc6kB+sMHMePu5BvzxMEg8MAFBCAgKpHmurq8C9Z59h6JsxrcpDvpIWT
         zAA5szhhKw5eVXAlvRFKmdVDt1+b2QcnCVafQ/92FVM3Qhg/wWcnmwArSD1Tdvn90kq+
         hyDA4vLoN4dQlQ/YeKmELi5sS+AAJPVPu6lTDRrtVPJG6OPR7En0G+U5m5uxfzIlN6Ch
         +m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411345; x=1793016145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85UJNW1kmvdUmgX8wEBdPlUGd6dDmuuDjcTlYqLXCyw=;
        b=UCmtSiuo+g1jK/NiHTpiBLjdJDq4KChndpHJJtYT/5EUZ9Eu/twPurxFfgjTg0JA9a
         WgKnbMYtcPji8osEbpcNVS2ny6oLgeP4YRlxRSJ0YyFotNvsiL1947KzDQs1Z77a1f6t
         kcL3pTpzCv4k6Hal+Ax8jyJhf7t3UOWTWr4aTY6DiAJuYZHp3Mbt5ICnvkBEKVbWNBPg
         tDXGE34LEfyOt54imkeLYMyhOa5L8W+DAeIe3KHQdbbLvlDSFeYTdooNItFusw27MTMw
         XP6pcUDozEOFNv1GhQJNUo3fInonZYsS51n4OGTevFfSBIz/fvIfe4UKn4HbuDx9RIvc
         syTA==
X-Forwarded-Encrypted: i=1; AKwUvBzJEc0v7Bj2LzVaL8sxyFKCUGvY6ufYEcD7nxzZ2CKxSKHqVjp7l8x9NdqQt2AskAEZIxqPRExN/1So@vger.kernel.org
X-Gm-Message-State: AFq9FYKTHIfhb/dFYeW+67c2d0JQggP6uFTnx6NGs6VA2yHm0lNKdWIT
	LSyDcXVfzLJF0bL6fjuLTKpIy/qLfBUdqk++QG9MbSHhG+knRc9Xn5qb
X-Gm-Gg: AYBFou0/EPTF2/j9OPMJirOWxU/bNauIe2YYLEl58WcH7EQZmYohdpbQDybV7aNa48s
	4HMOThiGLIVQDuxGN9WQyRAv3LhtNFSmb5n/Bspt8yH+3vYDDTHlv/nHNBFKwcqhQCFpl5VSfjT
	xHLbYxcr2D3F/FAG3fHER2EvE5rQYgv2QhvhmzVjX/7q52Iz9XLVIG4iQN5kf2fvoasVHrysPgv
	taz6FLNQM86Tp1RwBwh5cuH+j5e3WOoL7w8xDcwCsKBmRYkQDEXIxXWd1TWZl7mzy7MLRJEpSdo
	Rg6K/nuOne2MFHps8OVd6rMo/yOAP4smv74ZOpzay17Rqx4opxo+2Md0MuQVrTZPffCqSGolOtT
	0gyncGMCG4+xyXLJjKl9y7ZdG3wZ9/TvMXIUTChlzxAiO1Fgj4kAQFihfTvIdEpHkwMNUuXrC+S
	ymvCs1dO7csD7Uh02AW1ZN8ThUNlJl95qAqWI27u42008JU1Zufm6k+1ex0881hqh0KicDejIzW
	sFxA/ax7unpg/je+iufWwLeSYCY7I/hQnY0sj9pIpMH6a8hhNfpOW8=
X-Received: by 2002:a05:6000:46d9:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e07985881mr9011954f8f.2.1792411344468;
        Mon, 19 Oct 2026 05:02:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm22400720f8f.13.2026.10.19.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:02:24 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/4] Add support for Renesas RZ/G3L CANFD
Date: Mon, 19 Oct 2026 13:02:12 +0100
Message-ID: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L CANFD.
The RZ/G3L CANFD IP has 3 channels and 11 interrupts compared to 2 channels
and 8 interrupts that of RZ/G3S. RZ/G3L has 288 buffers compared to 192
buffers on RZ/G3S SoC.

This patch series depend upon [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?id=2b4a5055d517b11bf4a5671cef32e4d77bc45626

v4->v5:
 * Added patches for Documenting RZ/G3{L,S} SoC has no Classical CAN mode.
 * Dropped the patch "can: rcar_canfd: Derive max_channels from the device
   tree"
 * Dropped the tags as there are new changes.
 * Restored maxItems on interrupts and interrupt-names.
 * Added resets/reset-names required property for RZ/G3L.
 * Added r9a08g046_hw_info to device data.
v3->v4:
 * Dropped maxItems from interrupts,interrupt-names and resets.
 * Collected tags.
v2->v3:
 * Collected tags.
 * Added check against RCANFD_NUM_CHANNELS, to avoid overrunning the
   fixed-size rcar_canfd_global.ch[] and transceivers[] arrays.
 * Fixed typo 198->192 buffers in commit description.
v1->v2:
 * Added support for deriving max_channels from the device tree.
 * Dropped clock patch as it is accepted.
 * Dropped devicetree patches, will send it later.
 * Updated commit description
 * Dropped RZ/G3S fallback as there are lot of differences.


Biju Das (4):
  dt-bindings: can: renesas,rcar-canfd: Document RZ/G3S has no Classical
    CAN mode
  can: rcar_canfd: Document that RZ/G3S has no Classical CAN mode
  dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
  can: rcar_canfd: Add support for Renesas RZ/G3L

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 32 +++++++++++++++++--
 drivers/net/can/rcar/rcar_canfd.c             | 31 +++++++++++++++---
 2 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.43.0

