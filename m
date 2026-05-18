Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C3392C4B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134881; cv=none; b=adA889EGU86fhwXLt7CV6pU7yJOr05JiuP7rpX9gN7zQocx18QSkRbLxAvuHhrrF2OTdIQdoFHwdFXbB6XWgzFagTENphaMuU5NewKUW+e+K/h6PdJSBPHZsvZ2gFDq6v34n17Tib8dkDZghydVYxzwn7XUpSx2PFRrT6DNkBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134881; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRnYjtlxQZCnxokyTH27MLidM7Z8jXtZaQFHldGHDU9Pg9+BaFH6toX+t9FaIOtZwg/QGynqnNFCcO30WtZXgYHOLkE4O1EW+mF+2+83TpnnkZmmSVA5p4vBtFKN4pZxbodSwFiA3EEh7bO++AM/f4woamUYEq0dKkQNssFtNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtSARbnE; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtSARbnE"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso4088986a34.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134878; x=1779739678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=WtSARbnE08EEZ2+HIbA9BOIzvjIqNL3XLnsYpONVWdChZLO912wZ5ryRsAzrKe6Y1T
         IQMnhNv3yjaOD8DAtng50xvhRx2GwbYeoxfT2h7iqMbEWUfQCIzlWXsd3q7A38flU+wk
         aGfbMQt7rfTYd4ghiPTEBudPqsOV7Duz5cCTCwJTdqIb5iEovEnJzK3KNWNAY8OFfCqk
         mtfewQ7GV0JLBhVt+j0FO+uaKvtLbkdbr4ithrCmnS5SBnTbjFH4kiHZoU2+/pXjTvh5
         b1WJzAfGb+ZSkTqNQ2bqIRscJ2BiVWWfsOyIQwdOTecVpptGCr+Rte+B5nozAaFOTPie
         pxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134878; x=1779739678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=fnup7xyc63zP/nbSsZEqlxOju5v6ZYJGzPZ6/2Kd/m1dxwXSnzS+9gHZ+KwDYSmWC1
         Dy+GTeu6ZtCIvLYLoLPM2APZqZzn56QxXTodFJATu4HOJK6QJXa4TwM/eNad51afbHXg
         8eJG/x3CSh+XxOaV1npOI2+W1xFvGuSnV1KnK3/I028cXA7l/MYuh2X/0rvhlnH4C2q2
         751UqYPoIUhHqoK7lp5EhXowxdbwgme/MOWdB4ixroWozO+of4S76AnY0U3n+s6L88NP
         YHrKiEEl9B26HQnmFce4MghaX8uBVz5HAxhRicGzyesVbXKiYirbWAnIzt63OB/T2dhi
         +KAw==
X-Forwarded-Encrypted: i=1; AFNElJ96m22pIw4drgKVyk7Ws/4c9+pjbtNsyINOGvjKqtmAX/Smalb3XdUNfaYRCrY7V66Js1co6kCvmboQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyO6j4iksQ0sBBUtlrn7rO3cVAdDStiJtFabsMIHvqM1vM2f9m
	cLO3DrYP/9yxKZVe7nU+r5jJTu7o19SZ1RHo+CGa8kjDbUG8baMNqZrj
X-Gm-Gg: Acq92OEUgw2hkNNiKZaE1Sgm/+fEmhEI6PA6ogODxc9LC5rEsvBd4nXob852m6/JlUu
	N4jyOHFtHVYFJRoQKDy94yUipDs6r0s1rlOAtiTWEPTLfQ0SlHnccPRH8hZF5nBk8aEKs8A4Uy2
	YXWIdS96/d0Oq821y8UkG5IuuthYY0HmbM8uwqCDA7c6a/tqwgwuOTBFzIG1b1qRdUE4k4lWD1I
	MAuU5JybdehzLZSF9jCjcuJkAHcmGo6DOdaO2oRkeNq9HBSDIZb7VvmtibxG17SqKTNXa0gmXd/
	3JgtQI8uONrTA/OSbWXgzCZ0T+gfOnul2N+Jr1rTUvCg8SeQxGD+FJT2AnFF6h3sa+33DsWzatp
	V31Z2KGigijfIGaZwDPUqS/GZ3cYURlLGpB5InwnwusbnaeiowMaiEOJXeBC+xjgK0Cf1+GRLyH
	v1N+th6RbP6XeItJLzZlEHAWq1a7Zs1XY=
X-Received: by 2002:a05:6820:1b05:b0:682:ecb8:c2b with SMTP id 006d021491bc7-69c5d3b8b7cmr8844624eaf.6.1779134878528;
        Mon, 18 May 2026 13:07:58 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0462e85esm6113360eaf.6.2026.05.18.13.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:07:58 -0700 (PDT)
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
Subject: [PATCH V8 10/10] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Mon, 18 May 2026 15:05:25 -0500
Message-ID: <20260518200526.458421-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518200526.458421-1-macroalpha82@gmail.com>
References: <20260518200526.458421-1-macroalpha82@gmail.com>
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
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..875ca884deca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,18 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		interrupt-names = "INT1";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD6 IRQ_TYPE_EDGE_FALLING>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c3 {
@@ -932,6 +943,13 @@ &i2s1_8ch {
 };
 
 &pinctrl {
+	accel {
+		accel_irq: accel-irq {
+			rockchip,pins =
+				<0 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	gpio-keys {
 		vol_keys_l: vol-keys_l {
 			rockchip,pins =
-- 
2.43.0

