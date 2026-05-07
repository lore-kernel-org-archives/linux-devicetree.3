Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5803EDAD8
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158086; cv=none; b=tuZjgOmgaiJn2GV1YJawZOIoigKVDvLecpJ+ubytppddYAtpbRyxxbB5rR+c0FfifbsE/YaYjvbJDAJ6XrKWF7dLQzSXIepb2n82VHW/B+OGmkeWUho+iU86tMnVuZWgb04Vrv77BDpFZkJf2Usq2fBW1nwPPKC7WNgjLj0qhXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158086; c=relaxed/simple;
	bh=QMgAiSmytxMD9/iUsqOIoDAbly6L3sYZE7VyWoE8tRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXvlbZkTRUh/5Do1TqA2MLg3V/AMOVTezcwyU8waay19rQSN3x2d7RjVMhUbqVIF2//tKwZjwl/DrrQFk20fSkz1kuFL+mUV52jCYBU0rlKJUlmEHyezObZ7H0S8Y7/B7DJeUyHeXHHFWpUH8gwNstkphQkMEqn5HhGXX+5xmbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJZ14oLs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJZ14oLs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0046078so7058865e9.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158079; x=1778762879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3zJ7Li+6pdLcYuv0jxwsmP2cj3UViCky+5RLrc5w5U=;
        b=mJZ14oLskocYTVtBJzOPugvUF3wGQxzaUHYJCHuBI3ceDMioxBS5kQomjusER9BRrt
         jhxPs4GqlvxUgmW3u4jPdka11rJ0qIzUWkVeNrC4bujbNS95ZoFieuNiGqjBlHG1P91C
         et15Qb1urcfsbWdRjwrQSJ/eKpue7MNyBHwhN5+ALTdcxFbn5tAz7ZBkxmEDbl7j5xTu
         aHrd7+ODv0/d70tSR78QYaloe8T9p9lLA4O1NY465XxeTQFTYLTmOdlEDCYW97os0KKs
         pNI7X6nzem1NhSqDYuZKykaOfMSd+CqFNx2cnJCO4zpj8WmSAUUIhAws+nCtuj5kIvVS
         ETfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158079; x=1778762879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3zJ7Li+6pdLcYuv0jxwsmP2cj3UViCky+5RLrc5w5U=;
        b=L/G5rzbh8m7iq8afqApdSXZXZ6jsYekIxpZblIjgUUsCPCs073iwzpbPcphg8hKBW8
         NIF0DOeZ4KGTxoIn5FDaK36jirxZPXNDvz+I/szInRh5G+lz2lsucmnrPLXoc1lDvw7j
         1KEEKjXj2sfe4oK1foKczOvHHVU3YV+K2kWy/wclAew0dYw0VUbJD4L+SyetNwvPxi4x
         uoGbKMpQqfdbQUWRx0XH4b9k/04kuqJumnxLpqQVPK0VrEktzfJKasXi+8/dzB37eSJ4
         +BPExV06LtqsXrELSTD0cnSwdW3uhyJnobsigfx9WjpnbzGZBTsELlB/t8cnviTKG9dY
         qOEw==
X-Forwarded-Encrypted: i=1; AFNElJ/WihXyKaD1MO+VXhRSyPgNKfSZ8fwRnSNZ7SOSIzOe2LPLda4oPULniRRJxMdTf4jGbkmrD6RoAgrN@vger.kernel.org
X-Gm-Message-State: AOJu0YxijYVOg8obUnsF3oeua1S6+19mtc1l9xg6T0pbhPjd51n5jst+
	XTzZr8O5E9pqhYiLZQZFI5r6ymd9SYWUtrFq8z5EZy+BXN3/yQcsn1TfI6BLY/KF
X-Gm-Gg: AeBDieuLw2D99FM4pV0LUCHafolinQR3651vy+K0oEeHAtea72wQECMlA0yz4ggiM/g
	5QB2FasOoDw8pTQ5+7OYPdgazOnPOHx/E4TYOZh4axWgT1XBslK/9XXuBKThO+pNNZJbGKcyd9R
	G/KGC/D0oqTGCL2bbDeG2MV2XRiD5UUEDHH/bLU/66Ba8kYCkD/5cIv2OMxGGeW/ege+6XEecaU
	huSRa512Jx+9+Qi8NP/YRVEE3++TGS05HlP/B5mAUZfypTTdAG7nibv39AP7UQodSDnlws0eBgq
	U4BU13XxjAWAaTJNhRGWosVXqCIoWKXuqVv+LqcVVqEhTFILT7BIGr0tPk7uwUAD1dapdgh4soC
	xumD9IPn0b4HwBDTsz9pnK1VKx6STIcKi3+3WRmBXtVzdu3rqXnr6TTgvcKGmiQLJUdS/m5byPY
	YAGeVRxNzBgpRjaEoSWKFjgAB7okYzvilvR29JgQW16qTrz7RWF6w+ptbys44RUM8g9WLs1yk3D
	7yFFEo54+6DqGNaMkJoeyhMgCxW1g==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr124411935e9.6.1778158079226;
        Thu, 07 May 2026 05:47:59 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b6e9bsm209228145e9.10.2026.05.07.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:47:58 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
Subject: [PATCH 3/3] MAINTAINERS: add entry for MEMSIC MMC5983MA magnetometer driver
Date: Thu,  7 May 2026 12:47:24 +0000
Message-ID: <20260507124724.813043-4-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507124724.813043-1-vlad.kulikov.c@gmail.com>
References: <20260507124724.813043-1-vlad.kulikov.c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..b1d9d7b586a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17170,6 +17170,13 @@ F:	drivers/mtd/
 F:	include/linux/mtd/
 F:	include/uapi/mtd/
 
+MEMSIC MMC5983 MAGNETOMETER DRIVER
+M:	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
+F:	drivers/iio/magnetometer/mmc5983.c
+
 MEN A21 WATCHDOG DRIVER
 M:	Johannes Thumshirn <morbidrsa@gmail.com>
 L:	linux-watchdog@vger.kernel.org
-- 
2.43.0

