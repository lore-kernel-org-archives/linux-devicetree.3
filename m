Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCA385D94
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980079; cv=none; b=Fk/OXgK4KAJV9FiAfoCu6F1wCjybnqRKFD8XPpLenlKhxEQYUG6pIvw3vRbuPpeZg4l9tR4UZmHFA3WzTa2ptMgW6CQk7FcBkn8GQC1aUGfWtcEQUWNBEQnu3FVKXRW4D9ZUkSNeuGbAgdJG2KVGrC7ccPa5bay39pXyKhwYpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980079; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPvv+c3XPUlELYxHbvIIEGtug687tuh5beTW/WsugQ7bKTfD8NOEsp+mfcKI6Dr5SA2NRhVZ8fKZGAp/d1f6nRW5z0mwPCLWsOGtzsw2CxUzw/NU97EEznz0HD1RZL4KHvp7PU0TL9FQ1dCufl/UTkgJmX49eTTpXDpsHI7dK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvU6kJGY; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvU6kJGY"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4a071495be0so233644b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980075; x=1784584875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=YvU6kJGY0u+SquAgYoo1dyWh/jXFGCy175kOAxHA+2a6Ctg4lqFPH0XUMSyGnkNi0h
         jjrVBStyhfVC5anUaIcfJRi53o0ZlkoZscFuchkI01mQHgci2O5xxSMiYdYU/FSTLFs2
         0qLSo4smY+QFwzSGIBBWY+2SLzKWjFr5gQWr2wR2br5pXd9oaoP9jq0acLLKvpoK4c+V
         Cy5pdx4Mb2gGgZioPr+nSbh9M0Uwy3IjXQXKCsUh/R474tm69g1BkBbrbzPzVHZfwnXi
         NBTLsPz+9e+XzXuCF+pHqmU5F6IfaoDDBVJfy9Rxmm5qCPZGv6g+OXNupK3qO5vtkemJ
         SgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980075; x=1784584875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=pjySJYIJtNn7LMfQQGGcX/AbZqI7OXrkEK9kPgRChy/d9jYkty/UgBE7uf5nxUG5wF
         f6ECuGvuvO70M9cfVSRub6MFrHeawKvdypS0kGFtbqBCYx1Xn7XVIDNS9qmTdaeIgSNO
         IyoPL0UGjm1KxTEamYPRAG8QhQNZPJ1ihClqFQYlWQk5LIs06fhVjy/FGxFnLvfyP4p4
         F7hQnKOnugNgHtLjVtbhIJyzFKRJbHULywBcVxKUA81V6pfAq3kgy9k2D77Fy7v0X/hb
         T6HAOeUJJKrJimMv2Y+T/tW40ok+tSpkhRJM2a/xQkUlHGhsxn+z7D+JBo4LVgfEnu21
         MKAA==
X-Forwarded-Encrypted: i=1; AFNElJ/7LNmfebAmDFoM6HxwPUbFn5CUBHkZq7eTgg5qWBQW6D0frdoWllOkAabG2Kpb2oG9R0ra/nKlTeRC@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSA7+/6b0t+ogsX9HGeHcO3jFw0st+nybIbWsuvxdBtaJ1A6v
	SzpN8O6/GxLNib3G8o7RN6PIw54K1dGaRTTMIsS2BzHa3FljSnKt9Pa7
X-Gm-Gg: AfdE7cm0XEOqM75k3GHmvaQa+ebtck2m4RzC1sOFxgVslhtz4WDS4Gmj5Uv7z9q7dTC
	cM35oEtEMUWbg/M5NaLwi+izvaLBQKjWQ9ZULUm8hZQDgn8mriA4LrjPFu8jino1z0vcai3bdKM
	6XgYjelc+EbolB+Y2eHpSd7/jxKBl1zqRJYn/aTOn+IDd6q4tQixuirtE4jj524gNSOnPhK3nO+
	nnrZ2KgijU8DIKgMInI8gt1kvplFuJdn1AuApsh0vPmYGH1CmxugHj5UzlFvE9ZaMG/lYXhmza3
	djXCHlUBzWXM7UpKTV0nTRKFrB1rUMOhQD+Z8wbOoNtZjIdZ9mu0TXB4xkpUCPsKTRdzqEQSqnF
	mMEivcTMoTA+f+N957yOCwPIq7hfs/MY6A4hd2LZcDmfo7A3u1tPLWbavG/FGJFJDj5ZKHYohfo
	Mr3muEAYDGgdgTQqgQpzk87g==
X-Received: by 2002:a05:6808:d52:b0:495:eb85:fc31 with SMTP id 5614622812f47-4a42ababf2dmr7011314b6e.1.1783980075443;
        Mon, 13 Jul 2026 15:01:15 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm12939785b6e.3.2026.07.13.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:01:14 -0700 (PDT)
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
Subject: [PATCH v16 10/10] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Mon, 13 Jul 2026 16:58:40 -0500
Message-ID: <20260713215842.69097-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713215842.69097-1-macroalpha82@gmail.com>
References: <20260713215842.69097-1-macroalpha82@gmail.com>
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

