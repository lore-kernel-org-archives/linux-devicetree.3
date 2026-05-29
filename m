Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998533A9EB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063586; cv=none; b=YlmyUUetI3N99tCDur+IlGrRFGGfjmdTEGlpCH4JQOP1o3b3KurlAf9ZPycVkH2MCedcFx9nOAYD/VKqLHif3DExheZdR/yzJCD5y+aMwqbk78+vu8WhQ8H9vufYV3scNjp/WpgQgG42eG73bAcX1iQrvggwDyzK81kzFSosarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063586; c=relaxed/simple;
	bh=FvGBtD4MhrJFlNIXOAnNdz+JWp9IesS3ljWsTh6yhhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhAn1x8EzHlAx7is5igTw6yQOg74ZgUVjOCglmW0nsZhNPjhatFGa5mqgRe6hajV8nnBLyWRAs45lBX60GmUcGq2gI/wfTR+K+MjDOLoKeqUY1kq/2RhTa+JZm/mbdXwTbtJE9qtORifq+0CS60VZLAayjq6WUnF7+KFNMvvjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUS6eiI1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUS6eiI1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bd266f6fc0so69168945ad.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063585; x=1780668385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=CUS6eiI13As3McOTIGRRV7Cah4EXgGdDPRe5bAgzNg78CgYaX0G9JpWKjoFIMufpKL
         QNebBaIhlyJkvsKEvPp70hT+eSDwhEPRvoKdnSuth8ED8+W9iVzsXVFXREsMNEyDDsv5
         JYb6rdVwkVdu1rtECxuRfZuGn905+AkMKA5eJXInwh1nK2YQRvCMAZHE/MQzouiAtkHM
         BBJ1BnKgYjX9sxv1HqtFg1DhamFykmEbu2nvaoiIiMjPyQw7hr/2V8ZswMCkGMpRgP1C
         OBhvyoGY+7AkRfXqCR9Z6nMiK2L/MdwnyOx272xJ6eJIpYfRyUazKXgNBJ+gLyDxbJQc
         HQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063585; x=1780668385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6Vlr6IjEZJ4HXKB0HJH8awIxM/NowdIhVK0gPa/XrQ=;
        b=rbQ3ajqMv0rn/66RVpMZOGRy7q43pPtlsB5V94JpyM/xHb+ceTp6eG2C4X3EKjkpVU
         0w4ZuZE58JufZDaMZdi04bS9OXd2V00rWrYkjnoKUT7efXkTVItQ0yKDoTLK6ouzjYMc
         WFmjJ60J1ofW4MN5he7LaCM79KP8Ns17EPzAeWwn9CR5BMphA3HhfQiRTV+smNKj/JQb
         UzzNZII9Q+ldV+uI5Ho6Cjx3Gjrq41+qaPVflN8yMxjdTtBpm0rHMER9mOSDNmMgK8OG
         QH8HoDiBTn98LXDQLfQNFMyM1IoWlazZdq+R2Fp6g2a6tSvb+GBgkHdq7WjLoYFuWW+S
         nDdA==
X-Forwarded-Encrypted: i=1; AFNElJ/ieO5+TqPthRcujjpG2o80Iidt6Tjp3ztRYODihrJHzqFCzlh7dKTQPe592q0LvpxM3zfjjDwRUWMa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5HvPx1caKExLPVNHR8+ycHsRIp9or4ARO1PMALfWagqZL3sK
	VZoCt/TDd5f6ZNH5LhTOcKbOTL7b1XsG5+INmRbcqGCm+s2cC6+/c8bl
X-Gm-Gg: Acq92OFv6fm9LQaCVidYGPJj1Zdmo7uoDoh5KL7hfxwNlHKvAt8yrAzlEXa+5YpKBmL
	SXjF00xvO6G9J2TjJRKtHL72jhhlq3jF/8OOpPwkU399BDU2+HTFyBnic69STeoFT5Yk+z+2aqp
	iqeOJi6VaoYlAkTVmDMqcPHT0kJwBNxICcoUuGegsTzv5hIbz/AwPaBD0CwNRyBsUf7Np7kn0uJ
	tEKUTAD6Rv8CinFp9s7qzytEDGtgELodNoGoPzVsmkWtho/3Y289UVqJYiopBYarkqNBE2+9HcW
	Q3MNOPjpXgcfJxUwA2EQXdAi45eMaFLXqT9fXK1llRO9KzetYT6Wdh4MHNVeoCS4VtYBMzDRzZ7
	Dpge6Md+zp2RhVX/UbI2Dn2CiyAYhiMD+rQ/+KEn4Zmlbn3U8oNkAcS3LcN+hkOp+CKjQk6gHuh
	biJzu38Yt2hvSaIgq3bHmS4khsxyXaTd3XLACsVSpe50XYT9ALkw==
X-Received: by 2002:a17:903:37cc:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2bf209b860bmr44254305ad.30.1780063584729;
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:24 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Fri, 29 May 2026 22:05:58 +0800
Message-ID: <20260529140605.1070764-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b7a7f4fae7dc..41a75e3d286a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0

