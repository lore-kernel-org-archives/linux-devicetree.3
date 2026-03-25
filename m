Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95633C532
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478241; cv=none; b=Lb1C2TBY9lLxPO9m3tfk3RJH1PK4mEwQceMN58GyxGu1DRV9e36vRAonX9Vbw1lXSXxZii7O/tB87BnwW5zujiemeNrWGq3EL4F7zSGoDrjAvZA5WkbPnHSUMOPsRJU9slZ/ehiNIof2p1VZJdJbGiL5h7B8g3vc0PwDjFRnrNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478241; c=relaxed/simple;
	bh=stnYPRRYW4ehUtGOCnoALxaJtnVyhk4yp0l6QT/e12Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cl6dBuGVqt5m2nKV8FjlehF3fnLCYPC4tmqbF+f24RatrA2AEbWYAGXDv8BkVcafVPQucfMGSBuDvS09a67EU/L9PRpIuFAqVpGQcv+i9OMOINNXnDU7qxffPN7VatyQvW5u7JZUYFR0QiKLNVvo5VbwL8EyWJ+/VTaUGzkDNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyhU0ysa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyhU0ysa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4870206f73bso2036265e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774478239; x=1775083039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hs3iD4jieahwE1HmMDLbVwvUq6t7AMyJcPwCLiDFPM=;
        b=HyhU0ysakwdnP/gmwEGaHbar0lFCs4MLiXwM2O42wAX8XOGIRWXNChxDaWY59CHHYV
         79XjC/KZByvh4/f/zNRcJOvit6UmaZyAm1lRb5ySqvwZouXRf2+flMl/fNoKrcDxMy3k
         KcvCZryhJlnLgeVZg9Epnl63ZZHlzyamAXN86hGryF3pLjdGtdzQ3hj3FkHNQ4KeGeB7
         6RdrQbpngWzNnXH/hokSaiVZwlDw8VmjdejdS/9U3zyURUR/5jn3tOjO8Zd6YepyFpVe
         ggFSg3i8eaom69se98EcZp3G+ssLbOzigHGo5Ns0iQiGABG9XZwtVRJ8H/SvntZbtzC6
         r6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478239; x=1775083039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Hs3iD4jieahwE1HmMDLbVwvUq6t7AMyJcPwCLiDFPM=;
        b=p9bIbrI9ze4KuW3LzXfllIcTzawZO0mB1nKtAJpzBGyOElKRlESEyeziyAqBmbPShB
         +Wltwd4eXc+ln3j8O2IgSoLGp/WUuQEVHW9s9qxO7zO3BZHYRMi7TWRm5btr6AWd9r2g
         zdLeCZ24lKyce4hHAipgVFtYNZL6t0n3e7OvfDkLc7uB4ljvdYXup7mKstDXPh5o+J7w
         LhXFRuD3c19Wt24yF0Imbe+q8uKyi07SDC0HCVHuWC7+6e9Qo2In2uMzE6TuffygrhIO
         3l080DLEJj1UyIgXGtt6OTP5BcKM/xrNxYuvYrWV550vm4VvHBtp3r85JZiqW3k73HQc
         z5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAvUgsBzFyfBSFskdrivU8X5VvXGN8BYWz4M0+H/RKD9GT4B698NlQdAvXXTBbXuQPM1BbvI8C7hB@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuDxQu8FfRwC4E/5NadBBjUS41TrMGldWiVlKqSaL/vlFIKSx
	5EJOLPpB5PxtHQMH7emdI+HTkoXRfv2iQOfuUe3uRm+OdMS8Bqo0mV4=
X-Gm-Gg: ATEYQzxT4le3V8bmNO+pWUlG+h1Uwe49FpnFDiVlS/aHUpyrlrwv+buKlUyNswIS+Sp
	gHdkWQob4OqczfDmAQkkDcqx/k/1ccCCAhahu4+tEGbgW3kVrGzJqPa0+9Z8nbunExhx59DPTxB
	qR7VXgUzoRaaHA29eEHJ0+A8h653yNuoXj+NuRRj/rNHsT2gSo5fe8wIfKu8JyFHexKvMAm+E42
	Bx66hx5NQOQmz2c4OYt1tlrcRbVVvwHIz45yVFC5TYV5UCIAn6dcek4EIigUW+PaBg3I8mTccRN
	AqqKyYRkB5TH2hrHkw5/9w9wdn04S3hmrN3Spwmb0UbxFEgzsiVEDTTQzBHCSTJhvUGUCAuJxeU
	GO310i1lr3zN+AvW8sU5muVM4ICWlJ1FOEdQzyDkjUslYVa6ZMrBTgCe47AbPiGyCe1MQTtI5Hn
	E3ElsH/D86tiYSOokc37dY3hKYEBC0x6gBliXU1E+Gdg==
X-Received: by 2002:a05:600c:33aa:b0:487:1c2:6a4f with SMTP id 5b1f17b1804b1-4871607e25amr43115135e9.31.1774478238282;
        Wed, 25 Mar 2026 15:37:18 -0700 (PDT)
Received: from localhost.localdomain ([78.241.70.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720901ac9sm1352285e9.14.2026.03.25.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:37:17 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	eballetbo@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint
Date: Wed, 25 Mar 2026 23:34:11 +0100
Message-ID: <20260325223411.123666-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpu_endpoint in mcasp0 specifies the TLV320AIC3106 codec as the
bitclock and frame master, but the phandles point to the codec's port
node (codec_port) rather than its endpoint node (codec_endpoint).

audio-graph-card calls simple_util_parse_daifmt() with ep_codec set to
the endpoint node (codec_endpoint). The function resolves the
bitclock-master phandle and checks whether it equals ep_codec. Since
codec_port is the parent of codec_endpoint, not the endpoint itself, the
comparison always evaluates to false. This causes the mcasp0 CPU side to
be silently configured as bitclock and frame master instead of the codec,
which is the opposite of the intended configuration.

Fix by pointing bitclock-master and frame-master to codec_endpoint.

Fixes: e5f89dbdebc5 ("ARM: dts: am335x-sl50: use audio-graph-card for sound")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index 1dc4e344efd6..b3a7f2c91d4e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -558,8 +558,8 @@ cpu_endpoint: endpoint {
 			remote-endpoint = <&codec_endpoint>;

 			dai-format = "dsp_b";
-			bitclock-master = <&codec_port>;
-			frame-master = <&codec_port>;
+			bitclock-master = <&codec_endpoint>;
+			frame-master = <&codec_endpoint>;
 			bitclock-inversion;
 			clocks = <&audio_mclk>;
 		};
--
2.47.3
