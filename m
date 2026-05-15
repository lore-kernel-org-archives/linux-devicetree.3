Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F93644D4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823782; cv=none; b=SLVHaeNL8c9gpW6Gfs0MXCUyVLP/e9EtK1f3ZihMVKl+PNIUHOfx7Ni2kVE9iVmGmt0bMZgYqD13mZyCePVbq4iZgtzwNVxIaIjDsx1IjrXsm5/SjdiaE4Sx2CvAUxHIl7TZNehIrMunMj0a8ajyG8rIHjYJivpbxtn5E9gRNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823782; c=relaxed/simple;
	bh=PpKTrbBM4Os8Rc8SCG+XYjDDmnVB1a2xO0tDP9ChOPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4+PmXY9oEm2XoazGKHe879VgYDptEj8fKGeG3Sanbl6n+SSamyPrc0FJ5CCg2daq1qvn3jHa+11F2RxTkqUnkYcNjar9gS70ql0o/liy9gUwiUO75FtfuzSLQAFMeBLtAEu3G++WRVgRAT/G9tgsJjFjXA/9aCCux2mcLz7jsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgtS8lN+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgtS8lN+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so2384776b3a.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 22:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823781; x=1779428581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3PjlyOf8sBl8btmWeVxVjjQtlMp0Y5dRKaD1umBdh4=;
        b=OgtS8lN+M8PI7PmackOsmBnijGCXED8pYUDNWm4hAHcxUwnaOMsSKvtOZ5/JTtuEfG
         IlYDC/uEs4/3LlXbS+gCFlnJGBxee5RVh3NRQbpLRKDWyW/IbfhJrSpX3aB10iUWft21
         jFIesrYPkUsGv5uSwlraY2Fl3y6Sfo8sQsinKU669Zj97qOQd8T+V4BLJVhmq7TH3Wqp
         EF7KCylwDdhB3C3428lLZsu6sYdt7ibMvSzT6gmlBA9P87j2sBkUdifmRBjLMHWDKZln
         7qg7dCWc0Oi7/pZWGv2yhIJBPVLoRtv0ydkxO7GgNcSZN0qfb1pogamFNmPya0RhJy/T
         e/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823781; x=1779428581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3PjlyOf8sBl8btmWeVxVjjQtlMp0Y5dRKaD1umBdh4=;
        b=HoDku/J3YRmVKNX+pL0XYgyE7P2oDQryYULjK32u4XKfyyz7jhOPJFzobbi/NnO1N8
         ItFs6NaA3LA4RKdoLdUlS0B4ZzXyMuAf2woAgxv//PPpZ6XXGR3SQ+f+LouqAoX10ozc
         DYB8dgeu/NU0Kiy307TGe1kfPIXuGqsLqUOe+cj5sIYjDTy2dOcSGFPHe5nE7iPWyKi1
         yQhQsKaYey3Cj/7NujuasQQpY9ZyoC/eNWwZS6gOfeIr0/mWAbQJMtZTpAZxQb1Q3Smq
         YWuFUs16gyRpz+ilQZL3n4SLd1IP3KydDnJLuEkLuTe3IDqxVjpEqHFf5+jM/LJ6HVdj
         pEag==
X-Forwarded-Encrypted: i=1; AFNElJ9U2vV3K5PALULbNj9jwUSWcpvVt+HR0NYW3Sr6LhwFXcWH14UAYwhAYe6BZMcnwUSHjlovFc3XYhkK@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAo8Ot63P2rOgmzTYvrCGi12dDXnEkLi2r/ONpj+pDihjEYg/
	tXYJguotgJyBb5o8bvDdAP+9RMetTM9ykM8/5WPALpL7+JtMufzODLrV
X-Gm-Gg: Acq92OEr1Pu0ej8BTid2YVHkfUGEwjcwhNmhYeQXUNmV9GGloGEFlDOQIzVRBtYysCs
	W4YIfWRlVQT0hPhcoGr+6+GC6YNWO5IOC1bNK8i+wj7xKAnW+pKARa8PrM0lOcm0OpDOVpY+vhW
	9/ysRu3UlJr+wUnJvRl+YhMWIjwTLSH2sfN7wy+x4Kp83io5sYjQq0GEftBzX+bcZY6dRvbeFEQ
	dSNGVePOYye3bb+Rtuj4q6+WwyFKhc09b8fs4K5I1k69EzJgYPYG7bpoY/HnYV21XAwjkivEz4n
	+6Hh6hQt5z+EeTA3ucfSkh0q9jwzeoAh5qTyWknX122MRrKYPMCtEATbIqmzvl8Dqlu7qT9K8SB
	vlcDO+QvINLsUHpJHEMuDABK6TsuDSgofKOgkYYpGsnA3WyNXA2mIoGhB/nT7n6MZu04BVJ+ShY
	HkghABptVwOR8Dw4wyeysZtNkMtaS01nz8Ig8rqjdzfMgBVCi7vln/xZMX4NkJ88raC/h355uLI
	bz/a7XSj0oSYZFe8ArfwAgqV7vOIgXnNLl1pg==
X-Received: by 2002:a05:6a00:3921:b0:83c:de0e:bac5 with SMTP id d2e1a72fcca58-83f33f3d3c7mr2755385b3a.49.1778823780683;
        Thu, 14 May 2026 22:43:00 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:43:00 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/7] drm/panel-edp: Add panel for Surface Pro 12in
Date: Fri, 15 May 2026 15:41:50 +1000
Message-ID: <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the BOE NE120DRM-N28 panel,
used in the Microsoft Surface Pro 12-inch.

The values chosen were tested to be working fine
for wake from sleep and hibernation.

Panel edid:

00 ff ff ff ff ff ff 00 09 e5 c9 0c a0 06 00 07
0a 22 01 04 a5 19 11 78 07 9f 15 a6 55 4c 9b 25
0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 62 53 94 a0 80 b8 2e 50 18 10
3a 00 fe a9 00 00 00 1a 13 7d 94 a0 80 b8 2e 50
18 10 3a 00 fe a9 00 00 00 1a 00 00 00 fd 00 18
5a 5b 88 20 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4e 45 31 32 30 44 52 4d 2d 4e 32 38 0a 00 0a

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 497dcd48f57b..2cf52f03c217 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2020,6 +2020,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cc9, &delay_200_500_e50, "NE120DRM-N28"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
-- 
2.53.0

