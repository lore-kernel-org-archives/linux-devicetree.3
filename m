Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7DD3911AD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558211; cv=none; b=Y5JGtc3XHEfVR9HonLcA/37bHt78GUYVXZs6uix1YOmvg1i4gwpDStgc72bOFMLqpxqqN/4O2CDomz9isRBfD6Chone+B7rlUuwv2iX6kGdhsmerJVR46jUBdOa6CSAooI1ej3ex+C2P8mjxO7msAfouELliqokSDT/lCeOxZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558211; c=relaxed/simple;
	bh=y4B66Wux+JJKAcfCF1cMe2wXGvPfoijKaxFDbJe62SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6epdO4y54zHFKSuKvme43hKv49by1KEXNPBsPQepiRzVwSNJ4O23cBLiPLOJZtMDzyzZIIs9gCQTp84+xR4xzDiRqeaZNaWv/GD1g6ISzDiWbQqb/AFKLi7/DWKFahc1SZ2IPoiXsGabXmFHGv6FKkpIckKT6KfZtyNA4xPkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC04S9w6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC04S9w6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so17160235ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558209; x=1784163009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/CQ58f2X+E1rLJHgMnpMlJRaoK+MsOQXmqFnkKcVtQ=;
        b=aC04S9w68k2kNzE2vt1AOOHltkFsQSBJ4VXzSz4FNmHG+y3ARLhzd0f3ceE34Vhy2S
         SIWeP2fY98jesFkDw4/h/ObxEOa/jz1cOZ4vxACGyQthFh5ZHXLyKCamrK+8qh5yqPvd
         h9OAIcq5xUaaampmxfDffvKZ2Brh55WVbvJZ4w6T2AdErFAnm4H2k/o0SHgG3eEwC9Tj
         iM8smBY5kHfoJgehDK8n5SJ1EshR32aE0ORG0gskIPiH73vnzq9zQSknG61f1bAmyKGk
         r9pneBgQ8fqKRjzqQldzkZrXmznlY54rHVNzYRLcKxWUhHfeDBHULzLaS3JJdO1EREcq
         udpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558209; x=1784163009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/CQ58f2X+E1rLJHgMnpMlJRaoK+MsOQXmqFnkKcVtQ=;
        b=b+fDTIHkEyVwMQVa/mxyRk71dClLp0dKdcqBMM0mIDwIAdO/Pbj4yvIZ5KrRjTZ5z+
         O3C0SgRSwla/TFuh7nsl7s2nDmzpSVIQXL8KrQi2IZDjiWG4ym5at0YDygC+YMa8mIzq
         zLBYUGtSDqdpljc2Vmvem/x61oCFEmBU9iam74UVkmV4nMpJPPl5uI/rf7CIVynWv7Xd
         WIVcrwhJRE4GOX6/KFR1BlUq6nOD3eE5HtlIIarcSeok3X5RTupclkle86qOd8rwINFI
         X3SvWBkUtvn9eahPUzhuq76DqRbqKMzDtj6YU5624olDWtZpcW/Hq+wY9zNPPRP/xtU/
         OYag==
X-Gm-Message-State: AOJu0Yytdk66UChBFJwMK20o/ia6ysiLUeY9WAQ+eM3pa1o2fvPHuTce
	HqlTaf9rJXoVHg5RAjScFZNv/6dm9DT7P99MReBJeYouAcLHO95uG78D2l0EPQ==
X-Gm-Gg: AfdE7clUQtc9mdnh3a4Rt1rm7vLtwUhbZFHSKSFkiPNxxORDSo4ED3lnrrhIfHEV4sG
	zPlmPR0muBK5DB/qLOPvKVjADxZyeiMCSvL6FeyqxakCCGrf2ajJR6iHBle6HfiMjjpnyVRgSws
	Ixp/iZUm//ETgvmnn1a+htomVChYEkTfUg2BRsB1oHXUpI+VE/bMH92ElddmM/4rHfwh9n4sUKz
	TPvmUdU1YCjoipG8ZchgVvjAsm8JZppgtwYtbTIWx7dbC3WeYkvp1vZtjJlWo7yLPvDhwmKDrNY
	6IahwBWofdYlmiAk32qPNuhyWWufHFyNDdXoDlDTnaAo1UE6abuYIM+ass6w1QvZnU7GdboKoeY
	B28m2hPFaRxMAGVxGN6DBt0WO210tktEP1I5TLpFN+BpTGs9uhf78Jz8S82LMXypycdYNM5nE8W
	wXyadx7gmlhjbd0u3vKcpgy79yktsvigGGcLKDA6U2eXkJRUWMy50/OwGQlogg7/rvMaCKyjz9t
	kefpDMXL25LQC1XdlDGeR2mnguAS+WtdRke/Tu26gdasJN/7o0olo2REqUYSDYAxQ==
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr52045675ad.7.1783558209417;
        Wed, 08 Jul 2026 17:50:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/3] ARM: dts: helios4: add vcc-supply to EEPROM
Date: Wed,  8 Jul 2026 17:50:03 -0700
Message-ID: <20260709005005.1587852-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The at24 driver requests a 'vcc' supply for the EEPROM, producing
'supply vcc not found, using dummy regulator' at boot when the
property is missing.

The EEPROM sits on the Helios 4 and is powered by the
same always-on 3.3V rail used by other on-board I2C devices.
Add vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 390e98df49c9..05540b8012c2 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -201,6 +201,10 @@ temp_sensor: temp@4c {
 					reg = <0x4c>;
 					vcc-supply = <&reg_3p3v>;
 				};
+
+				eeprom@53 {
+					vcc-supply = <&reg_3p3v>;
+				};
 			};
 
 			i2c@11100 {
-- 
2.55.0

