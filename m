Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97293A7595
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485785; cv=none; b=APh28gEciH3T2Xsrv9WT1OO53rKstQxBQ2Wxt/WF0sPeYrE/huScMnxIZuam9BSJjRW4qnaKcJ38lV04NNsA9Pg9pBupbFDIU/62yq4gJZxQYmijWGE7GnRsfJHxveIA2bfdtr5U4KUiT/4Ymi6HdE30Q/bqrqt4bRa8lJo/McM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485785; c=relaxed/simple;
	bh=HqaU0WD4qknySxmo3vgnfGG3nfKchKcuwTT98vGyX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6gSqmVhc4FJ4/LHv3Lexqkk+k1Tk0aUjzQc0CGk4bKVBhfEoOrvTbWJmNDxpHyOy1ghDw+jm/r6QF1SGZfAN/GdmweMmNxKsjJmiCCdvCuwcgwjBaid+R6y+efDxYdQrgAmeWfmg1m91+xrp1f4yxcKxeZV5ckmmfdZCh0vgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU1XYHGY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU1XYHGY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso531911e87.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485768; x=1779090568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=IU1XYHGYGTlYBfKq3lUaHvO57ya7O5QTHVblzdgh/VYVwidztJZrQ8LgUuyZzkILvS
         biWkgvcr0z35I/AoO6V9Ic7FDrTaI2ITcHmop+03wIjaV7OvSA9vYTXCoSZTPGlz/w0f
         S0/4Jnf61KazTinkxNyx6Mt90m7eTD02FFT+8m4UXWvKe9a9gDV08tlW/uY4Y3NcK/EV
         NH6d2QfLYUGSRDIv/NTlOFysRqGLUEB5uuxA+dWDENxseXfvJbciSLXA6iazGXXpbHXA
         NoD3mHV6CvHudcN1rDM1NhMTagZt0KUQ2hxwxSb5GBS5dN2SJJgmr6cb2fiN3sgFkDeY
         MOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485768; x=1779090568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=lUx+KKR57u5Udygyv6Gltg+JLDigzz9LG8dOBT7/Sbdkr+vO5K8wziSJ57p/ppr5wP
         UJJunEy1q2+qgXFlBGj7AYeAsbuDTQTGVNyLteO1KNRKHdr4feHfl4vW2WO2R+YaIfD3
         yAbJSD2Z2O8QBRyl5aFWaqXnN5bKJ1d4scB9kVGsqxtBZBTbK+S8i+Qv5Iq8+Dd6i2/Y
         CvWqL0wiZqH789dy3HJ/D/44mKvTfCkVWfZNERm3881wGiE6JnBuJcsRTwxE/ydQMrQ5
         krSwT5TY6j84l1u+Xa+kd2RDFsNZfB2ZZGU09eb2MnKecyLXnNWbkup5C0RsPkm6M5QN
         9vrA==
X-Gm-Message-State: AOJu0YzLgHOd+Xdb0jmCrW8EMPPwEiNW+fyMaZ6dg131zm08DDkI6vD5
	R8zULr3A9RB+T+rch4S/AK3gA9uAadi/We7Nmk5dbKk5R43Ip/3Uqmk0
X-Gm-Gg: Acq92OF4Q0vB3culaME2TkT7P8jdoIM/3ZWmmfkMtwhZPzNH960JvVkjhKSWSbnI6OD
	9SBrNRa+5KiOxALmpwaNBCN2maSvnz1UH1WwgdTUrLsl4Htz+7H6fblD1WYZcQwLuOKrTQSBHvq
	HplcYr+blFkv5LjvqI5WU5armzU9pPTb+3QwQHOr3BGACpFnKE0SiqBIpLCOlas3WCn6bIoD7Bb
	eZGqLFkcUZIaEgYkpfo2guf8ASSqfBnoxUA/HSi87cUluRRawBIXnUY2bfdikKPTvRqzgB3rRX/
	G0+p9vQnV4cXN7yOthpWx6JRS21t+42Ujvzzt2YdIwFEWT+Z8Pk8VE4OGiGJ/taE6gltfH4Dz/F
	P5/64bU1G4VGknwzcy3N4Y1FRPKG+UGrSxxbgX26c0459H8crIA+1L2a4r4NDwWDSeTmq/mzZYw
	fzalwYuDihiJbc
X-Received: by 2002:a05:6512:2310:b0:5a8:65c8:dd87 with SMTP id 2adb3069b0e04-5a8b6c9c56bmr2359582e87.3.1778485768068;
        Mon, 11 May 2026 00:49:28 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:27 -0700 (PDT)
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
Subject: [PATCH v1 9/9 RESEND] ARM: tegra: tf600t: Invert accelerometer calibration matrix
Date: Mon, 11 May 2026 10:48:59 +0300
Message-ID: <20260511074859.24930-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
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

