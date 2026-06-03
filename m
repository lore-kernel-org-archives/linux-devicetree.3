Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0283385BC
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497225; cv=none; b=FBuVdXlpTdqMVCqn9mAGgtGSEoNAxFm/7U50DDZThxiW9oBYDEAwDW0r1E1n2EcI3JyrRgwU0Vhf1D/evEhl1bq6eXgbHKiRTBo7Mqtai5W03WZrjSVo+9X9Hl2L0elpWLtPdEIp9UG4E0zwf6gLsQWa4aXXn8kRmsVohUXJ8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497225; c=relaxed/simple;
	bh=nvrltdpc60saNI7UcS08/7LPNY7tUi4OaUtWoXm2MHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ao4cu27m07keS/mKk1kYiH4lyvaZVFfDXLB109T9RvK3SHxNNTlzZHL4P+zmx/iyyufna8FznNmx/IJxZsndySb+E7VaaL716T5VkoBb0EWLRm17Ku/Y5JiQeLP4pljac8IIiyKQ4i0X8jjX0hjvBuYndtJWoj2ygjRfv21VvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYKGB0pY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYKGB0pY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso19092695e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497223; x=1781102023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHnyZnS+fqlQALxl3qFob5dnW2yNrlaDTB0OvsnizSk=;
        b=QYKGB0pYnP/RyBr16ytWBAzcc5eZpwnE5MIXgTn92vkZMnaE8hjT/1oKT7dsMY+DGO
         BNY8WBdid0m4OKIiqhf1DQne/H4mbRPocIM9EjGpk4LKz3dxhAv+FbnPI8aFfEwZ62uX
         rZbKHjgesIUVE0qQxgenFzRWAk3eqUB1wkmToCbvGQL8faoPI/SJaGDp12hiZeyttrNb
         s7vF2ShmGZBp2BtdN88Q9UjbCNYIYwJ/6132XFULlrjd6ITmePuqMR7i0dXBVPyiFBXr
         60AziPbpHpdz54tdNG7moKivHUEF7KylTWy03u2d9rvy/bvHEIanm59lqWUsJRjk2LAt
         FxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497223; x=1781102023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHnyZnS+fqlQALxl3qFob5dnW2yNrlaDTB0OvsnizSk=;
        b=gYceMEmSdZ54pNAqiobnKJQwpnIo9bxoaN064a+DMuOMr7HWnoM/H+1yWF+pp4bTYc
         lxDrTFnRKpSf1ycVnLlbhg7e+A+LMM++4zxqxrwpnIufTIiTfgMOWRVlvSidjTAsDiZz
         35CxwQQKXkYK4GaH8pCEmOgZa5jtDNGelNAt3FCG++n8nT1P06M2Qs/73wFzhdn0IAZp
         eD0KiMPjZpvISVjEdcmJSK2nfX+Yr8II+h39vBV/oJIQZ7ThvZxf5VVlaK8gO+YiK8m3
         eocuR4sLJh9GgTaz5VMd3D5SwZ/G+7vDUs+i2FhFQnbhvJ95uuunNtltlGOyQ3Dgg8no
         kDrg==
X-Forwarded-Encrypted: i=1; AFNElJ/E2CvtvM3oXoswRfaHznTUlVdxybDLJSfpoSWqV0BEwfHW0kUZs7AbVEqjQQTCHS8YmveL6tGpG62i@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGKzJt049Be5XPoBVZF/LvmJ+/rcC61ZVQJ+/S9895aAzXsuc
	BKlTUS+ADJ/lbVFpCS1Hcl8LfOKDQLCA55m9PhaJD9upam/buLIgS2bP
X-Gm-Gg: Acq92OEo1dTXE+XlZwJl8eIEXRbDx9Dunr6qjgrtj84XJG3nXbe0YMRha2NiY0NDcGC
	OyOefFJa4gkm2NtI5BSYhA/1vNCeaD9bqEVg/lzQtf5diSNiADPVjKRYsGbH2NR03FqQYIguFAI
	5dhR6qtuKYzUd4QupDtpVx7kP6tjdh0uZoLwwjt4D5mwTi8SytaUsgpPGriTXbcZURYhn5LcCSs
	bKxuMb6gp1G355bjiPw+dhIL4XHhUUZ7Q1mSrIGcr3DgtpkhQhOYOdWgwNxrOZo/5x0gOfdlnH4
	aWVMzgaFPiB64sC4cOpkLxxpAi7bFTbQMuj59BM+fkG9mPEXa3G+ojkmj/DvWQB8u2ooc99Veul
	v5oRUSeNMV/gU+ThNRbJqu21YV0y2nQSyyzm8gXxagqPYosrntjICkjZDlF2BQ+R5pWt45s9hda
	Hx5kptJ1nYR6XcbTBQInPEfUG5HeAW6MZ1TvjkCCvZtj7Y4QUdfFf4qMF+5MY=
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490b5e893admr60436345e9.8.1780497222723;
        Wed, 03 Jun 2026 07:33:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm160147395e9.13.2026.06.03.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:33:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Subject: [PATCH 0/2] arm64: dts: renesas: RZ/G3E DTS fixes and updates
Date: Wed,  3 Jun 2026 15:33:34 +0100
Message-ID: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series contains two DTS fixes/updates for the R9A09G047 SoC.

Patch 1 drops the unnecessary SW_SER0_PMOD condition for rsci4 on the
R9A09G047E57 SMARC board, as rsci4 is available regardless of whether
it is routed to the PMOD or M.2 connector.

Patch 2 adds the max-frequency property of 200MHz to the sdhi0, sdhi1,
and sdhi2 MMC controllers in the R9A09G047 SoC DTSI.

Biju Das (2):
  arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD condition
    for rsci4
  arm64: dts: renesas: r9a09g047: Add max-frequency for SDHI controllers

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 3 +++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0

