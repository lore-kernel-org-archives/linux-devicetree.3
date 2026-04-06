Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52C318EDC
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464465; cv=none; b=pcU8JEk4YYZdvjbuoJciFWgFXbRnvKMg0dFbQUetqOAjnV+tyAqRwM77AmFtyx34gIklieuAzu83XwPgPdI25pKWfxop7zJan03EAuONiAvp/oYwuB6YTYArFGxjzT5qMNie+ea9Fr6XG2i8IYJ2j/+sAm9vF0zi7lpGXGerw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464465; c=relaxed/simple;
	bh=HqaU0WD4qknySxmo3vgnfGG3nfKchKcuwTT98vGyX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWcmTAqf6/rAqGpo3kY/B/Avg+2mcXTk+ZY4z6LaGURAEM6ApzhW4g6dBnWJgThcB5joOE2mzZ3GwMEbbwU6kLgBDI7FlV4Zj+5nOxgJGw2qhoBvpDzo6o13cD3tcBzhSBMMQdeqVBDeYmYfZNSpGR7qf4iPZunfRJSOd4xgNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9bjBvQc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9bjBvQc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso17252335e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464462; x=1776069262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=H9bjBvQcCDU/GTcLbhzEu/+fWClxWxyLbLhDLuUN1Zs3MX1xUrXa7J/2ovn48UNihj
         JgQxKlmNY9Hrf3FxLjHXmy/WJjkgHLTfmJV9aRoTDMu5NhMZhT06ubwY4b4de/IyKPJN
         K/JPp1eAkb2T8+4X/qtWV8ZD3WM4KpsOnQePT7Hu8diiT6NfnaqpxFDgzJ0Bmt//Di5Z
         cgLvY81UcTNHZmtZqLFxsgV0HSVUAWt7k7q/pRgvZUI6u3qSC5UdZKlVnTdY7cd3Uok4
         9nTF9AzmMNJW3T3U8Cgy4+V4up106t7BZway+KSPdL7q07gwuechyvj/W1eInsL/uC10
         LkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464462; x=1776069262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=Ty/DNLLEPZGQK4qPDIxWBPANJTA7ydOd/xacX0lVcdzn5t6R+fQH+q8NB/4Ki2eg4A
         sEPG3LL8o8V4Yc3d/WoKHdZj+vG2kOVDBT8U7GT6F/ckxYkBybRZF9cwjZeZxv1OTR67
         qS0H0wuKxCdtziF8OpnjfTc3Dx9MMfHIMOat9WZmeGOSPYg7s+O6NNWx3Me2zXGJKohf
         aGVWlRzUYEWYvhUb26Zcvs9H08689x3rCwOscjM1hv/WDGDBkHMLfvxwB/dax9vGpTTj
         3gQNyE0aej++mxh0Wiv4DHTBdx34vzZN2zQk0SRwhCaCo9zNJapBkVfhTaHrKABSRnLY
         GwLw==
X-Gm-Message-State: AOJu0YzdSXgdgY2HZGtgghUgBAj9eyHYAQuHQCp9JInsn3Fcz4Xxvd4Y
	KrxmsjoaxA0s0U7w1pvv0V8a0+6L/EEPbE7CbmBbdcfWY/7R6q8CUDdj
X-Gm-Gg: AeBDietgGboJajRUEdiomQI6d5eRPTz8Vypf1wvo5vs9+KwscOBRm/jfllMrppaQXSG
	4j4M09cpL7KVqJ0g9sWwMxFCJJFLAMv+4daHZcTzpyz1DWplE8T4YT3AzvoAOEK3U7xvvawO7sf
	nxBId5alNO8I8kFc1xpK4Zmqs7+xMgQZzZ7ywtM0iFB5O9bgmx3l/T4S5ZkrhEgeV3MdGRkfAi6
	PJPoCoTjrjhiKcPwIJWdrOeWjeO/z0RFuj2WbwjU91QEiTiIscxLsUlqa5JVaSR0F1FqZZg8MDX
	pu5yzz/CEnR9XKZAOtPLem27wbTV+Ssu39oJBnZniKcnhlSAzYng5afGyF/ttrOu7jZKzh2IGT2
	CxCjWV+QpvBF+DzaQ+YxNhhuD0n1DNBgyFirKd5gQeaaE0RoW4KUFI1pGQPwUXEx9YjOtUdEx8s
	Z+sa07wcMvCgF3
X-Received: by 2002:a05:600c:a418:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-488af48b6cbmr39672105e9.1.1775464462084;
        Mon, 06 Apr 2026 01:34:22 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 9/9] ARM: tegra: tf600t: Invert accelerometer calibration matrix
Date: Mon,  6 Apr 2026 11:34:04 +0300
Message-ID: <20260406083404.31359-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMU calibration matrix used in the device tree is inverted when testing on
the device which results in wrong screen orientation. Invert it to match
the matrix dumped from the device.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 0bebea0cb8c4..5c634b0f3f46 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -1091,9 +1091,9 @@ imu@69 {
 			vdd-supply   = <&vdd_3v3_sys>;
 			vddio-supply = <&vdd_1v8_vio>;
 
-			mount-matrix =	 "0", "-1",  "0",
-					"-1",  "0",  "0",
-					 "0",  "0", "-1";
+			mount-matrix =	 "0",  "1",  "0",
+					 "1",  "0",  "0",
+					 "0",  "0",  "1";
 
 			/* External I2C interface */
 			i2c-gate {
-- 
2.51.0

