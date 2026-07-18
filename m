Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FF633D6F9
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365076; cv=none; b=Z/QVWrkeH32W+OHWeFEE5m4NBSQCjvn944ZQrKyq2jvh36zAd4hjdtlEKiJGvQ3uwuXbzgCp44tA4FhZkzJp9doWrGfR/4LTgweDStdMgKsfWGN0R+68D2k2RERf/nnX1gs7gb9MQ0HO/FZkvXExAymRVLcvQxjb/Um+RLlq95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365076; c=relaxed/simple;
	bh=tizS5g0h70SzokJT7ulA6Z1Qe+e6ZmlUwrpJqQZsAiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9WoX/dL2bZQUurUVwRgE7XZvMXv6VdxByK3E8J8mhSNbOYQc2G2hLv3OsUaSKHeExAEQLjMweGWggKTAb0vV3M757UJZdIoMCs/gQeq7ecaYg8vwZ6XLQ5h55M9NmdlVvQzqbGvqmslQxquD7K1PP8RaGRKXFGqlUhxYpOnbXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPGJMfXH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPGJMfXH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495522bc0e2so272175e9.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365069; x=1784969869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkAddxCtIZjvbuQcdVYEMV492MXwwpyu35XKLgJr4rw=;
        b=bPGJMfXHeDy9xisKFzTaiYeCLN2keI7S37xUaolhVDOkoWTRr6ECxNncheVTfHSgc1
         wVgxJJZ7cT5gqtMILcda/olZqOgu8dlq+NxcKb0p4XAxcKr2Aw6MKFUUdrsJHnGss8AF
         8clSKjO92BWxMRXYCpugj0SEJhdHpUi9oMZ4MvBL+eDKxZmUXVwyO7WaM/sjfDzelj6j
         VOwAt+p2PB/a2rUGLzhF+sWaFaCR21yHcUitIU3mKAddJ/EORl+StzmHav93WcXF2RSe
         QJ5aml6SNjn+DpOk9WavoJtdvtA3zDWiqlU9svkZm5DVTRGzeYtCxLILZ5QIN4qhVvFR
         bjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365069; x=1784969869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkAddxCtIZjvbuQcdVYEMV492MXwwpyu35XKLgJr4rw=;
        b=PJC/DZPs0uX/be9mMDJNJJGOYLntBrLIhK8WoDbr5xi1XXGIF1PKDaoIX9KyQDAbcJ
         lnBkdB+mzL572ZvkWmEG7T+wZL8kcjJBLnEP4r41bwblhoSOxrVz8gcKK33ybnvXQAkJ
         Cdn3pbiG2aT9c9kyDgKaVfqtPtgdySvbc7yfjie6uEQz007DQ00HfZj9YLhI4tTzlAya
         p/Qgdu/MGRqLeyqrRbk+Xh4uG8lla23mCW+SGM3wZrA7pKKITxfpjlsYqVZ8mj3XaauH
         HGLreH6iTK2GO1LRwxccMELeBa46hSWyJpk8PI3oK4WnfETwsLETTqrx/R89R/ZjAvLf
         tN0w==
X-Forwarded-Encrypted: i=1; AHgh+RoGGeGX74ks1njIXf3vhMT59CPaNIu+T02MD7VcleZfeXap13Pm1PVjxNvY3s3KtuishK0x0iiw7QjX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0XEtNX22/CkRGxPxZYwhNP0dXjRD0u/0jyUsQEtg8T9XLnAn
	A2Yt+GxNomwiWx2uZzqfpHgQjJGQiv2iMIXcQGzrcT5qmxJ0ufaiPxg5
X-Gm-Gg: AfdE7cmF35qhcoh9nGo/jEXic/5HqFDVQx87mB5BBvsruxcDMR/Efo8aPD7TRi3Sg2F
	C+Svq8/PPP9UNDkleR1j3ku7YxQOUY0mm75KrE3CAQklwLr4AOtpwZQ1ssCP/ZHd6vLX3n1BR7N
	mynK16U0aLWh8R8bCrKxJJth2LjqCJ3ikHp6HgNFSGWLkecNgX8GZuO/20SRe+h82K+rYkqEs8K
	gBeoRRj/qU9qaOy2B20EmrocHMjGIRmHHB/3JHazMbZIkoEVQ1+eX0kgS2/9QKmHVjILhpRA/lx
	cScFm87AZdMFDO3JxXo+vdMRn7r4i0xKBv4FBh9/Wjo6gDFnXGeuBjyPxc8v/QpKA1aSXwC7IQw
	Idv5nyJM6zZuUncgLga37euW6uiEoB8cWPGxNbw+gn6QP7UUSjYyIvRtFcCvINDxBd3g497vs6f
	bw0cd+uBHV7xqZtKbcVHPRssCeN3rkxPY5AiHviDVdqwMakLlTEPUtgF/8aa6m+U3I/+gA8nMAI
	Gfcm7CKag==
X-Received: by 2002:a05:600c:3553:b0:495:4a33:2c34 with SMTP id 5b1f17b1804b1-4954a39955emr39555925e9.0.1784365068868;
        Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
Date: Sat, 18 Jul 2026 10:57:28 +0200
Message-ID: <20260718085728.6797-5-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
interface dedicated to HDMI RX, through a simple-audio-card with the
receiver as bitclock and frame master. Together with the audio
capture support in the snps_hdmirx driver this exposes a capture-only
ALSA card fed by the HDMI input.

Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
follows the source sample rate and stays in sync via the FIFO-level
clock tracking in the driver.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
New in v3.

 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d11..d5840e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -37,6 +37,22 @@
 		};
 	};
 
+	hdmiin-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "rockchip,hdmiin";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&hdmiin_codec>;
+		simple-audio-card,frame-master = <&hdmiin_codec>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s7_8ch>;
+		};
+
+		hdmiin_codec: simple-audio-card,codec {
+			sound-dai = <&hdmi_receiver 0>;
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
@@ -247,6 +263,10 @@
 	status = "okay";
 };
 
+&i2s7_8ch {
+	status = "okay";
+};
+
 &led_blue_gpio {
 	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.53.0

