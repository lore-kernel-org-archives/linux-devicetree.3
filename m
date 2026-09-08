Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1459B667
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889485; cv=none; b=o5xC8MQxLGX9PB60yzMmBve1DUFGx8Bt1r2hX+j1+yraaIodgsbCffclkkM2hxNZoVVqgpqZP+XnJ11z9dJLqHaE8lMhaos4DOwb/yix48CPlCggGirqrwSPsiVguVpeYO78JKPNNaqKk6zFbczy9rt7U7NZ2tQtnGVoCpEKrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889485; c=relaxed/simple;
	bh=07ov/I/ldShm72hNuJQXaFMDAcMGOum0C8wl6iv0rIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwwr7UDQ37k0KFSFaHbJXW3EqUPM3np8u7+ImuLWRd1LVpgW616vl1shDkdTd1yPZGk2NU1cauZnlWCWKsyYsV+AaHp0yFeJrDkc48rWYDyxJ7X/9zgB66JXxUnhDwI/4uhxg9B4yS/AmEUqrtRNkTQqipLHvbnWAL8slVWDDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkuZ/MIH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkuZ/MIH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485850cbac3so3199958f8f.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889482; x=1789494282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=kkuZ/MIHSK5yRaH2AR1RuW3PyD/IMk39SEKUnzMwGMxHAUJnt/IRHp77162XmjScMS
         6/W45zcdbLtF86HbUkyu1bJphc+BAbcVS0/FYMFcKjQavB+bgkT6gVwDp3Po0zbGxCGX
         EV2Px7S2mAA/ES4u2qhCzOOWJPir7JQAPKwy1i0uCspnllX0DgPdw9De1+ig/e2csye/
         AXuXj3fTrAGLSEcWFeVuTlogyxCp5CCxvFNtPAhlC9UAzSw1MrTsplZBh3hs12/dtWcq
         MwQZiV+HxBClnuwGSv51B8uApIdOS9tvPsO4bvX6HaPA8H7L4xqsdXDCK2D7oAdyytE1
         O+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889482; x=1789494282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=C3gwioe1m09US/uVrWjuD4ZiX+ZRGmz6ZA3aIvECYki/L6hYEenROYQOzgmbhkjr/O
         RGem1bEuSBevNRNAg2rG38ca5VbPQ2rfZUGapDhDSyKEDBqa7Bnjqgsjacj6jaoAAklQ
         gwKBZU3nJKYKrY/JVYINtkOt3rOgtp5fXZswvjbWfFneT+FAaiCQQl81yhfNuft2U2tL
         /gk0gK9/cuNt/ED3gZyGXhw7lKDbbA9InW4lkeGlBoXg4ZnxKQUI8q2mFAmMjJGdk11e
         JVR+70TZsvbUI8Lsy6PaDljfYx6lqBGZgMxHPNmAoJGuVgFSZ0Y3yyxuePHc2/61KUPz
         t1/w==
X-Forwarded-Encrypted: i=1; AKwUvBwm+OEWixe9+0iejS14XioXqiI3rR6+THiJf14+EhNoTTvt2pk/k+bUbacukjWIY8eIQwNzvyQaCEGX@vger.kernel.org
X-Gm-Message-State: AFuF++lMZmg/UKJ4ABIeg4RhLCbokErCr4P+EOxN8Fb03ntVpynMBh/P
	JaHR4KssBXltjVvloUtYzWufYOJQWyRTkuyrm8KV8JvpQ8vDY0OdWVPz
X-Gm-Gg: AYBFou16NVF0F5K2LggOiSTAYTp0K+wxxuTlAg/IHOk6eh1cyKUuWpikNEp015TWTdW
	7PfJig/BsAwLbkT8hdRnoo3uGjuUNxLecrrNtNOPEr3uXCJzZ7DENMufySMn/Gzpj/zqq80Dl6M
	f+Mw+WPwJV5NZCSXZKWxLqk+Rb45ShdpeeSDcFTE2DDWuhjm7siAbXMvUvVhJYB8AOdsuwKoGq2
	MX03hYu9j+pTETRoI7FEa6KobDc5/AqkIGMLcX7H2hryXZF39H1E4jGTdNOViMl9bs5riTW+DAs
	o/xM9hz1jlmss/8wPaPSNdJ/VQp1EKAPR/BaCx9lQsunNm/LjXVsoiAAGIDTP2zGCNbMD+UBq77
	FDb45CfI0ChKSolvb9IArNMOUGy2el5/HOTgUM/LzfXY+NkMGuuuGTUF0BZ+VthgXeqBOZdg8Aj
	8GYIn6ao/bgy22qTNMtrikOmDatzVReLJeLaXQOxX9uHwjnATqgXmjZbUZ
X-Received: by 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr274872685e9.29.1788889481519;
        Tue, 08 Sep 2026 10:44:41 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] arm64: dts: mt8167: Add support for mmsys resets
Date: Tue,  8 Sep 2026 19:38:35 +0200
Message-ID: <20260908174259.9009-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index be215390730b..9eb24dc8715f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -132,6 +132,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0

