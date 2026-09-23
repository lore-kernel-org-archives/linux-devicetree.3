Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B3496D26
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160074; cv=none; b=aWwAtxgE2RvpHwlKWRBukc0Qwb6iwq2kD8SuRyjTS4N9FfB1Ra8+/0y0aQA0ZpW0edvGuT3ljGyTJRkhpKgC0bDDoJgTNwH+LtkC2oQu/5eGc1xZT3ku/88PgWAwarC5EHZFQWEHoAqLASnwHUso2hJoAGt2kC5/BL3QcC28k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160074; c=relaxed/simple;
	bh=3FpZ2LQPJEraDRB+xfM2+yX1c/xN43QUsBqOJ6MBVec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHRMzuRKK2adi9FDACG0EMcmfqapmUT5+mdFjlgoJtHf6+mP2G80aJcKijHFCOAoEiysW6YguL2mJaBP5rELp+VwSLtkfQgHd5SYEzsNGRGETz8sLZBmaKD0uu+8eAtB5xsKfjdxx4DPkJRLDOUByOXUUcZcT/C2OekKiqXgbsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTjAnPwz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTjAnPwz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so4005155e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160062; x=1790764862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=kTjAnPwz1Kc5kesTwhtOES+DFBF1BnpH065abtkiGjK6nCcj+w1P0ppyICpgFexZVY
         Odg8dcA6Ga/BsRmIbalJMhroOYhB8bpa3ux4EGHclq3yG/lyXlhWA20qOpy61ii5fFX6
         106BvpkqmlnfW3wWuDHtjgtjD5t6Np9lRvxCg2hc3VCREdSrI2+JvtY4Q8m6f28ZwQe7
         ZxQLKLmJ3lTXfR4BUu5Xlo7hdXDavFzhtMhtofvHq8WTRFEotG6cB+xSSFO7MNwrcn5N
         ACMiZEnmD6zLh+4DUWQcJVnT6Ie1XCwfcf+DKEDd+2cztOxF0/Yiqj9spdblCrzDV589
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160062; x=1790764862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=mmQnkatmtEmNwqGsd/rFjsrI/V0qKWIzOo+IgKTEwK4MOQ78hv0P9PpkLGMlB4QC6u
         JU9jBoUJ3z8Nf6eZFN8qJKkL04RByqF/c8B5hHKMycxE89LCDC8pq727Hi3mWy2kb76/
         9w0ShxuCXWTyzEmyLD9m+8SAdiwl27292H/9SOiiwnuKq2wfRnVAsOVBka2oCvpqdT4K
         +SFMU2JNXqLcrIAXQz+czi5IOoaZ8ugWdIgEmpyXc/AEztG4y4GmUeBMmgmtvO5MzbB6
         cVg3tMPY456KlsCpaQDhHE5el5CgUgejxgfGBLXHsDrT+QUUhVIji1/kjeJbhBMmj4Lq
         2LfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeC1tP3/e6476YcF40m2fu90z+pgn6FoZmrB1oowcdtmS2aQH3QJ1UEoPJLG7zEKGPcvf0pO/2ziFO@vger.kernel.org
X-Gm-Message-State: AFuF++k7ifraFsEAW2l973vxFoydgt910i5/U60r/e6Htx1W9c+R/zWL
	yCeZpZidH9iUcWkhgea4qCe+6yO/S418GYI8z1dMAeLHR+vzDZOecA4jxcs8AejI
X-Gm-Gg: AYBFou2DvMo11i57DLe51ngYOokQsnaBJRh19+T3Di9sMnBSAVjTXivaVb7PChVUCqU
	5dwLCKdkRMsy0LSC6qUWfJ15N7n5rwfOUxez/jWE7mQwVvCEFbJqpRucIiiCrxPoVRryLhnYJrW
	eBemHLThU1BH7v3lU06ON1X0hpobYmPv4hbW04E5SzL1wOX+QFa9gZjitEZgBuZNMtiIlgKlH2T
	GdKcEcJmxPCFDt22CQaBullZPJXcOLqtNFOBv0mX1WMhWWD1vTZ+8Xd4vbwGhUWomG3mli0RgeE
	wQe2v4XyhO9pX1DkUh86gSpks4BHKZSjAmP1qGjPJ/EBiGzxh3CZsgzymCbtfk8vnB7BQ74vIox
	EFpdS/DSMy8i366vmzWWbKdPAqjw4VmfjcVhb+f5sTDZnsyL3wKVgBZv8PWN0h2ksgYRN21l+az
	vPGUVdib7kO80crtyQLONVibpLDanH+wKDSUx1+RxgFRGQnh98o+nRcSfEJ15Fh1uMkP8r4eiJ5
	meTkVn1oRclreGs0WKeZ9SJqhFjbKWm24+sD9+OVF43OKRM0pZQhMBzufZOT9zBGhIgNbFEfTEG
	RsuEoNKF
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr26577895e9.6.1790160061713;
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 3/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Wed, 23 Sep 2026 11:40:49 +0100
Message-ID: <20260923104054.3324830-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index ee1649e0edae..9774fe8e441e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -39,8 +39,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

