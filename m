Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329C442FA7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226552; cv=none; b=ByeA/ns/WRc9foWx5FvpBTKCH6ns0WBSbbIkk7jq4rCDBJ8vbacZiGoGaj7CW2XGeAK0qXhZWag/nKeJZL03X2DKtNUVBf9qXi/FPjDO9zB+c+gup7x1wv2xtTFJZ1juA6cJMvny//VFvWE7bOagNZ7ZoY9WK9zxdje+GbZM64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226552; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rghEpGFkbtsgI3WLDvd9J9DynZbI2k5jZ59nW82ZgEDn2aZD3kD+LwSoybIIsxGwWZ30/safQ/+GFwTZTIEx+1M4GKHnuRavSLjD2zQEB8yvJfcxxQDljc6REGHR1Of1bxonIdhFmtg1S3ViqnXF9TtkM5ZGxo31WoiyKdZqBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeBbESi6; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeBbESi6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6128bd9b3so3568210a34.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226549; x=1784831349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=SeBbESi621SDyL2bHe2iOsUBNNr50i4WMQ8WV/aLwCvTAAzl4D+nPd3ZTPi6xrvCGf
         xR4XL1Eal5AxCmDaOV2lPK/BmY9lzPGlc6CF5ScmSVEIL19y3mILzRKH76dANMz6QJBq
         +qf7nM0BrZqulgFWLF22kjigoeKmDkFlsyCtZjlg79LG9IjMFiHX6LZyaIWi5SQ58SUi
         G5YBlWlAI33DN5+vHKXOF/3dqwOCrA/4dzXrsvdffw+z028eEbPnZHxp1t14t8HIe/cf
         zoFjLkWVLdVPRGD0lacsvi+YJF6fog0LiOH3+cIQ9DhzcCyMWWCoW/K9wuraYGh+3Nyv
         pH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226549; x=1784831349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=cvMw7pXR7GeJYJj9CzxouSY7kpnw877c7ULQ1k7DiCVRgkacyxC9m8ShnnKKQNIIRp
         5b6Empu4i15lgia9Mph3hOc7h8ltr7xMXshwFWcZ/W9JMn7ekqDK/u6QzRlT3AUaehtv
         G9LQSjHsetlUll+QHPy8V60VkUlMopQjMauGJ9oTi4nq2vOFB/tV0fKkEr1eUB7e8Vs2
         oV6mOAOb10WN5tXfRev2J3O5vsB3Jxu/y4xCZbHYBPRysadjoU8Zz9d98uMQ7jVJBkwe
         31kg3xeAKqJScs4XZ2IIGHVMAdhU4NfbmkZPKVBkoigJ1CdHkmwxjg892pHVNHyBqDcN
         ap8g==
X-Forwarded-Encrypted: i=1; AHgh+RrSSoGxP4ku7UEQnW7c3xEjJbVEnZzmWFcFcgh/PhDxiSr9l4IIA5cUPwM/BDYAfYiUn8sZDBCgP3mj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvtp92lUM766+kDKYIUjRQHtgYlwEC1S/g4NuwE6D9m8DZVX/q
	Cnvtie71vEJsPCXGkb9B8wSpeABQOjHPYPbIjyBvcl/wyr0H0UXnGCJE
X-Gm-Gg: AfdE7cmiiL0jJCuIOcO1fesGllMV3RD1fEdvV51I+jFI3iQmRW+/PmNqk9qBYB8WV9I
	c39HNfdA9DRLn6I4i9XpNLzzA5JExBR4V9Kf/1s+HoQNEqU7WJrp9ePASTdvMHBUfKv8KcGhWbN
	24gnh7I0woYkE/TYG2qIDM22d7oeATfMhovRYpd5mu7dC7nuxjE5bDPCYpTyg7liUtxygw5Hnci
	rSi52KOAK4jqJtAl3Rb7qZZTvjE5DaO5FkYXoWoRdVjpAQm9qs9V+Pijhh2207tINXe9yGklazC
	2Lqym46ACXEZjCmKrVJTFFsUh3n6iXY0ABeWX2fCt5MKf323W17K9hy414u/11iYJwC1bDTH84j
	uu5VqaybLfBhnhicaZdp6CTsl/1IjlOwKbWtWHKZ1nxQkEWrRVgtWKx5AG3gpJDLxvPKlGsdCXr
	CN
X-Received: by 2002:a05:6830:6d4e:b0:7dc:df37:844b with SMTP id 46e09a7af769-7ec59b0dbf1mr5341717a34.4.1784226549257;
        Thu, 16 Jul 2026 11:29:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm19939993a34.27.2026.07.16.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:29:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V17 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Thu, 16 Jul 2026 13:26:36 -0500
Message-ID: <20260716182637.24310-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716182637.24310-1-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..b770bfd5268d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+	};
 };
 
 &i2c3 {
-- 
2.43.0

