Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889493D967F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981477; cv=none; b=VBE0qJmC9DIVZ20OqnvqLQGN+mBrIp3yKZA5gVdRnoaz9gxUbaAOo5hkSfspbdV7KtbqXuc9LyphE8YIuhEbtsfBR3P5GU+OWXTa5NRXBlrZvZPEOuFOF4G9IL8tuHa5B4ZOIvJQS5yeRioZ1DeOip84uzBaNL6jY1j+cewhSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981477; c=relaxed/simple;
	bh=0PLPyKZ+Zc9ZwvjPXMBK030Hi7vLfG42r8ZnnL7xa6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKsmoVfsHYJ+t0CvLtKs+410q4azSwoRK9+7HiXeve07xnMR+nRkPMTdORPtPbLOV8A5p9d+wRu/bs8r24QsatWvKYhdFKhkN8AfsyQycH8jxb+bOjcPxuUdW5mv/a3mNf+edDuCddhRkCziU7lj+Y196qCQrvCoG5/bcKdYUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kc2EL8Qa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kc2EL8Qa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7cfa17fedso15553155ad.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981473; x=1783586273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=kc2EL8QaLgnKmGnOeVeoW+rvzg4Vwfljz2wSjifxNWyoUI6sSCgs6V6qqurVHwjk0n
         1GVzDu9L4xfKDVIxiCsNdFZoyDDfW3GMm/niNHjXeGa0VqrNqVWSZKDvtUNn86ccKTm2
         MVdwMSseiRPET0YJJAe3nLWiEkgz9H3kTpc6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981473; x=1783586273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=PWxr31zhpgiEDqjciTisLoUsKyk6v9GOHpWy6b+Ayhjbd0t42t2+ThulqlQG13Zb8v
         nXptVtJV3CcTSQ73BCdW3GqOxJGOmk5LWuNm74KtoYovxRg3kEBxkXLKffsJKWaFUzF/
         +Plq4mmcDtPc3U190J8YXYEQ9rnReiXgbTgCGZ9nNi/xVQmAmYUe4UL4Ovkbyfg/Mb2Z
         d+2hK4zaXIiFIlAQ4aGALli7K+D0vwHrTErDhYrhZktCw8lBQLHRCmVoG97GrtwAO7V8
         ji7UZWPLpvaRR1YAnBp59Q6CFPio17sSYYq9xkR53YpUUN+8C3Ss9u6yINoz0HlJ8goC
         EoWg==
X-Forwarded-Encrypted: i=1; AHgh+RroasN472SShyhJTqvfSZizHs+gHv2eDu0VKAyshPlE85Ha1H9+UoPXIXLtqjNfQR4nDZb334xcJiIJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5M7AlYMsUZnNsnP/2aI96qhNAWG4OY6CKUUu8OF61+iQcgnaq
	WKWT0F0nRRy5u0xfwaz4BbXCm5U8oI1yMgBfm8nXPFhJRbbwLfl9y5RnI+vKrybhng==
X-Gm-Gg: AfdE7cnu2jMqA9jmXWQLlk0AYyQSGXORkkMtGd8saOaMVCMkbLKiGLok5ghK9/eTRvr
	bJHf+0eifWDRJENEc+5vuYWDrDHP9NU3V7p5+pK1kwOf1xT8Z2dG50m/NoMJXFNgC0e1o84vf30
	6hGUZYEqCFfHyiABoGutCWlUA1uED3e/B5Hlv/WkVCj8pBY21m9+Njyedi7KipaQWi01D+6/ykQ
	uAm1gLcdqVZe84cJInt5pHw6rPv50UZrMswbQuNKhBrzhlC6OWSK2ImF+o41svpUVzVnFCILZY6
	KPbig+/h7uHL5zin7vV+eN+Tbi+mPP2HL7IrS157V4Kicq7+GtoenRix9qLAFSq5uCnT8E1N7yC
	/iVsy0E/KovGQK7yKcEBLsJc3TZqljSE51UGLWtzFUxH2fC5vW3kICELZ0rlTfSER0mGbbVFRuq
	2dweTmhK3YzFd7N7VS6VeONBhVdfgVsA/nxZ9c4bHOM7Tkr47QFPt3Gx2vsVNENqlUImtsSoTTQ
	ydftUCd
X-Received: by 2002:a17:903:22ca:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2ca7e706861mr54959555ad.21.1782981473366;
        Thu, 02 Jul 2026 01:37:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8fac27sm10102495ad.20.2026.07.02.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:37:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:45 +0800
Message-ID: <20260702083746.578461-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI NOR flash is powered from the always on 1.8V power rail through
a load switch that is controlled by the security chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b8d261b375d4..ed552f023cb4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -980,6 +980,8 @@ w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
+		/* Power actually controlled by security chip */
+		vcc-supply = <&pp1800_alw>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

