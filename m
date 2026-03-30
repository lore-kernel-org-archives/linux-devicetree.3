Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E696395272
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900876; cv=none; b=gE2sqt+GeDFNfld6eWWMKMGZXxsuPiIWbiVWKOy3oOd9ORuSGK8WngtsvjBrExuxC9sdc5up82PVbrqSxggKqMmpHeOXmdelrIFBBC0nULKjREQ+e59ZCEti6Ah4PwXMvkR3hNgrFJ33hwm55+SFuBLftxpS1JWVBGyRvutaMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900876; c=relaxed/simple;
	bh=P2GkHmZFdqZhu/4XFycrBk2b0Q7p3JNJsFH9NHtU9wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrXifr7WUxrAT4yEA6PDeEou0/Wic/4w5ZtfZ8vLgCq99+93AGtOpXvYo74pAkmg5Ngeb5n7HYNxQVW5H/UykM5tcsx0VKhWowy5hZ/yaYiAJ7LvTco9YXRYKvhDk5iuNClra+5toCsV83Tr1WfgSv1ljud1G6PkYKOiGKnOV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtiZOUVF; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtiZOUVF"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d75371d873so4747498a34.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900873; x=1775505673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxIwxmn6J4qQSSCoJJc8i/ANaXaz6gkd+aLXiTOc6XA=;
        b=dtiZOUVF8dDuFxE8ZsC3qGe7t7pGMCs6dNG/yOuYtBG+thCD4akLa7ymYh44W6cJc3
         VKqn0+cBParMFGhhVGLwYs5tPkgOSawm1Z4VGnep4XmrkL4SoNIcraAIjF4n28UUh6nA
         gzhofoQ4CXw+X6LlSgsEgGJA/3fLQdNaBVAOY4w9DTKi3KqU/557GY0VS/tBavoEIdji
         8ZgC+mKxx9tMaLT5QCaPYgFc/a+gZ2Wy9PLrATCy+TgEwq/p/ZfnSSidfjFN+C93zMoS
         n2hS+WlrYl203nCfreTzoVfZ4TVY+oOGbI9ZaQfIhuJL8/IET6Ih1suIBYl0QnhuqAEb
         CKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900873; x=1775505673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxIwxmn6J4qQSSCoJJc8i/ANaXaz6gkd+aLXiTOc6XA=;
        b=ap+c3SALXTE27rSiP9s/mEdd6ml7d5PZbrfCZWXYk9ZooXtMN15g/4EcLwUTsGZibL
         Vu8FwEMpFCxo2HkZa8a3DZnOvubPI/y94qjpiWbhVVqA3/iXC+L0DuD5hy1jBAnhbwmL
         9UNgK3UpJdKBBAh4AJD8LmHEbrltymwbZcgeIgryW+Q+QGJLqpyLSeMqL3H5Oou9cX+D
         KsZVkpIWZ+pw4DR3qPLjUtwTkuLJWOSw8oWwyhM24krRqPW2l3cZLD9Gp++Uy5efy0hI
         GDI6d5nDXa0iyhjsKLCZdOwV2vIDHiow1ydLqt5i8RWMNCbu6SBESMZ3/9e47qSrz+f8
         DLzw==
X-Forwarded-Encrypted: i=1; AJvYcCXGkSRKVm5D6e7yjHNLmGoZATHnWa8ghn1tBIZ9BsDFHFenH/BGvg1MkbcBwsF5cOKQZFosxtoh3A9d@vger.kernel.org
X-Gm-Message-State: AOJu0YwfaA9v0IigbN0lZ0oy5fMPvavILZZKOry3xQCcTPjGaovocu+R
	YXpP1bzKejkJipAvHHW1vzccgOpY6gr0GSOJbg3T1h9Z6TrQMOchT6XC
X-Gm-Gg: ATEYQzzXjYNOFw43+aWBbWewKbDgT5fB4VQnnSAgWvN/hewpxcySjaNLVKN7f5wQkwa
	q5zDP1h8K9liE/1kz674f1AQLEUPFDgjFGKIQy1zT1eNvnWlpMlET/e05/hga1adkAA+HhdN3r8
	ZkdybC76dUKN2ac52iyY1r/nIhQsPFxdRuHNYZldYJS0Urw24NytePwhFV9CMdsORF7lFFPdSg7
	KsV6pld3PkGx41TmLsVJfXa1xMvt47JrLE33o3eMZm6YZvZfsSutDt7nKH75CuWeNwmH+gBCumw
	HbRn1L1k9gXwq8gsANP5V6pf1E2tTZDcrz8AliLMM6G28UJ6uVKfNw4YpBMGRBBBCWUXEP1TbnT
	ANs5YqmHeVTqoJ4A1q40baiXocOBsCIfC/drtHLkgfE3WEVaLNU0HhYi3jyy3hw5NJutujPLU86
	lM5n4wiq4yPIoiFmAL
X-Received: by 2002:a05:6830:380e:b0:7d7:ef0a:1ceb with SMTP id 46e09a7af769-7d9fadbd658mr7337761a34.9.1774900873526;
        Mon, 30 Mar 2026 13:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336353sm6601068a34.2.2026.03.30.13.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:01:13 -0700 (PDT)
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
Subject: [PATCH V3 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Mon, 30 Mar 2026 14:58:53 -0500
Message-ID: <20260330195853.392877-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330195853.392877-1-macroalpha82@gmail.com>
References: <20260330195853.392877-1-macroalpha82@gmail.com>
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
index 44de35bcd001..834d2c940810 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -872,7 +872,18 @@ aw87391_pa_r: audio-codec@5b {
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
@@ -933,6 +944,13 @@ &i2s1_8ch {
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

