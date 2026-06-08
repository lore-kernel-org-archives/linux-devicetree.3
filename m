Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A243D332B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929690; cv=none; b=s6sHKeiRigpD32Y+mWjzLEOpE4BGs/W0+p85klKVWuGhdJdSxNhFLRI9hToPQcTz5yT5EXNCz7U/QvqFpJAolv2gVCzscsB0QYBTcJpZZbPJuIBE/6sD0MqYPWoxswKyZs8xvZfjNb1qbxSu5ZFhhGPYWrjkiNsxRFKOWwbGII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929690; c=relaxed/simple;
	bh=yR1subGJIXoGXaeAkg1FrvhGqEyW1KnUc47RvZ4hgew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsLFKGH9oCRCB036AgqkLg59J8p6C+0pymCFhC5mb0KDQy5/e2N+y5peaZWoQbOFSYAoqJYUc+ZmlFmJgyYKQq3xEzrbslmekI4s1X2o1RA+q7Jtrx1T5GOAWgrl8LQeEcMTGksUEzXa7r+RtvEauBAWftoY+6tCHxCXyHS9Tg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNNBjZs7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNNBjZs7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso36234195e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929688; x=1781534488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=XNNBjZs7FnEWsEfVnWw1M8rCkirN/tgJOtN6/UaD6fVJW+bLSi6gG27Y1z+Mk7azqk
         YXYeHTo+7hWVs8dWXOreLmidn7QtJ2ZKh6ccAQtEjg0oB9uwEuU6uw2+5ipC7eVBw8Af
         ta68IHss6N3ZUQXaupLL8AEUAVCL9RAA0+h/PrU3rNfHgaC3Ujyx8qwGwRCzKqeEUqVv
         wqvOpdMDL4yCTjJZ6wxlkfDuNY54RdE5P3bH2qccIsdr/pXtQZYDkAz65ReGhPYOD8a3
         lA9v0eRveUmoXkU5Ldl4iu3aLQg4ISRQR7MErb97ky7KjQwqU8LRiNJaVVVmDr5rXPdJ
         PnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929688; x=1781534488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=HiNNiFbOnwnTIJGmp/ol1xbybuOfgWUK8hVXjJju1PwWYb7thp+QhEr8TL7hKE8Nxu
         Q2iTd8Wtaj/HQgvkFgYRueMadqiDcKMvXPvR6miymtIejWZPs0dPgBJ/gP9N+tL/f2ex
         Zc6essVfCoWK5b9x5+15evyy+ZB5YUIy8wnbZHQvJoxPCsdbHXTIoFz1Yw+KL9xFOVYh
         yZ5X7k6GIb/VFwsD/KFN/zfReN2Q+YXS8/ncvlWqtldzc7uVB49QnJ1G9OscdwjRIvUU
         RwoZFmQdOpB06so9p85M7HbQrTkzBhYL9OsPkU9lubTSBGC5L5cQwJGgXDR+5bcXXkBA
         nFuw==
X-Forwarded-Encrypted: i=1; AFNElJ+MGbpVhBRxk4AuzpyUWRozMsd4JjmF1C6i5o5gDbzjLAke5wMbEonB5bgUAotrIBZNUq39TMrkYrwE@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfxSA68xPWbjj4ggdpxwstfBT7Muswtn5iYInbS1pHvPaCyse
	LoW7lpSBQwdfYcXY1sfUj96ZC7AwmlblxWVWLizwtX7S0lF0ILAUEQOW
X-Gm-Gg: Acq92OEZ4ne2FjBxFUTk8JK8T23J+eQIyjIlsTLRuhyYgYrUTvJnQkmUbCrf6jFXBAB
	RDUKS1X86MlwNJ/78HK2YY87v9b0FfLddS6AS2dAkeesnLHa677Um8kfbzC91eDq9b7z+Hit8oX
	02jNhwE4msIOKGmhAvf3rE4neVk/snaaLtjV7PXYbZEIqKOQNc2bzsdkRZpLXbYZx73o53whDT7
	2bpdMlaei+dRpwEr777h2mF9plemTxMssSZ1OhFPfw5couiegGQSTUHYAM+p/UUJo6HkyPTS85o
	ZF/2Ogsn4hOakIb/SflZ+bFWSzi9sF/3CSDNrxnMHiOZhXUt+4uXRrtO8zXHs9JeDyOmctTF8md
	EN29Y6ifiGZhji7KWBfRUxB4TyAvqN6OlfKjbpesSxXdmBm++rsSuPk37d6NU8ee3whX0jcctb/
	1W+s/vh4OEiGqxEXnibwaaz3RPMN6vCXkA9yofXg5x4p8E5kyBwjraYI+FvB1uqhv0IXbx6CC0o
	1XrUULYNsYBcbI3LOnEGf8cJaFzGyrBvRjVa57Q5PZbeGDXrZm4blp3p7c=
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490c25c66d2mr274749095e9.11.1780929687763;
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 16:41:05 +0200
Message-ID: <a02c86adc97618fe950c8f2544eb7d981b2cc984.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7cf58198ef14..cb3348aafa07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

