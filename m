Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398642;
	b=ixS5PlQC6lFGtvnjdA9B53/xewhIh3NHmhslA4cFHDWwzcaD7cKPLWKe9RtB6ee82TFS
	 pwDdzK5LMG998BO0IlK3qbKs95Uy9DyKvrZJsDhZZw6+lutMSjjoVjYXRBoyM94Em2Lm0
	 O9zgVlm1VFzJPCsECY0D0oM4OxUQnmxkELPghRd4g5mLlxFLl8zTgKIB+wfXWYXlD0ven
	 qMGTP3fPu7zfuBKDry/7mPVBE7CfPAD2Ddx8IwvLkRnYhv5N3m8KWmDKSpEU0TPGiHH+W
	 rnSEPd9gWbvDFQbDZo5viz6DxX4IFylVCwDeU5UxE1J6HPOeZwuWj2307YIxxfkFHRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
	b=ixEGZ+Rx/J/YBj7Xo9wtmV2WkNDZbbX5fqbqxDZv7gp5PMwaKNaDOvkczCL8IJeo+/tN
	 ePitU+YZtt7apqzNNoio5mizA3qZrNsEb+lGFNVTl51E/BChDitTtPXymDu/nKv3dOskZ
	 lHiv5xmTLX0XeYuAforoBa/muNYCrxe3aQ+/rxFh0vUkw+t+EDSW6ATV9yY34vgNkkfb3
	 dQRyqqhi0mjhronyN+SjukWkF2h2NBpQ2fBQpNtNaht61NsaeH/d2Fo2uF8Bspn8idI/q
	 d/50ehB7ZWPhVZe/gAS7YpPtvx6PsZhJAkmWTOOWWZEFhS14++GfnE/9BxwclIV4HUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnmEjv4F;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EC606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnmEjv4F
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4b5138f0991so1992736fac.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398641; x=1796003441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=BnmEjv4F9phMdjsssxMAHoJOKTucq2jeBrTuFvujQ5JHJCNZT/NcJlxU2YAdmvrbA4
         t7qhlNCoTejLZq5+il4P0PREQ2s8wzIsGuHzBMIwG+viIc2lqG2rZEvKSFHJOjrFS4Aq
         QOkQqDJeqM8HFmDVtHBSr00xUe97ZjOwNW78icwsXmRtHgg32Z1Hshui9OiONTgWHXH4
         f2Er0Wr0ZP67H8zqMQPwellI5WFPuhCVAiniU5CPz8XxlQ0Dtsfd4JMxlOCGYBySe0vp
         9wTxzclgRhKk3FqCCRCKb3B7tQA22tgPGeF0agLf4SvcWC17I7kUXf7gh03DIMBAtCax
         eaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398641; x=1796003441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=bQsxhHf00JP13q3OYOs+ADLlLcol0nfZL1gBpX+xZZTAv2m0Ats2UalLTThdSMFZfT
         B4EIF+wW9O8weM+0x6KdQP2gX+cXvVEBXQyhEFB1RyXDdB1X0SU563pfppJJh3K4pYwG
         ZMMTz2rZHObj/0/qO9xTXdpWczFIsWuHS2qZ/BKRvX5WdF9d0+ojerIvah9uEjwyRQ3u
         hDaPeVF0BQiH5SLCcftqvuBw5DUdHdLkq/nN4p4dtRUx27h76E3TLQ2XucFkwpr1ZyCh
         UxfMTutPxK9YiMvJ34d1250aMMmmYnuE1foOu8IISOUEEDMxR/NarD52/RWxX/blGV0X
         PLxg==
X-Gm-Message-State: APuU4Z+gQ99NyfNuPR4BJuZfyvuTbd+Wbyfio7uUhKknWoGkHvGhjkm8
	IpIcz2FNkmVCZO8NOKzxN1E3JmMJoTlNo1qdl0+b8Ii6B20pSv5eVFAR
X-Gm-Gg: AZFdTZd/A7bGhwDm0x3O+WPJIimmyoffK0Vx2D5w+e2h1FXnrmHSO9jyfNY6VM9AE4x
	4bMpU6rDRI3esU4mwUQNqZ/xkArpr/hZgl/QQRWnw1pMI/CSkcj0qtA0OQ4mxmtoNrL1x8OzDN3
	ynDBEsM5Msz11yOtnQT5o91+3awnVhILyk4xnbkbMVZkVq4e5KPNwM+8sH5/PoW3MiGXEuu4p4X
	uqFLvYaWo8s0Fb3XanO9XA1tkX0Wfnkap8GSvqL5V/0X5822FzdniSEWU99lQ3J4szxuxYNXRWo
	Y4UELSapS3WCSSMuQMPsj+K5Oj3Z5eLGn3yZs7rZ1ZdBw4uEA2JISdFx67uQnPTUOzDD9PzY40z
	4aSSmrfrmgYaG+YIlIH0nh0a6lN1zlBk84N/gU6o0e8fd/EzXZ+jIzDghky0ry91AYjjURPP9Fq
	t6bCYRk/3paaeJ0/L/ddj0Cnnd67W4GLhtyzJm9xgNrDpLU6gPw1/4YoYZTDVpWGLQpINSpjPny
	y7U+sm+0ti8fQqhzF45s2Mxcpc1QxPZ++K4kLzC6ixojdk71xMbiOOcLXjGUtMa+iYgOrnquLyd
	18jVAJYsSt0qtDxppuPkY1KkZUNcww==
X-Received: by 2002:a05:6870:b0f6:b0:48f:e0f6:bfee with SMTP id 586e51a60fabf-4bc852ff281mr6943652fac.26.1795398641649;
        Sun, 22 Nov 2026 17:50:41 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm9209484fac.8.2026.11.22.17.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro
Date: Sun, 22 Nov 2026 19:50:35 -0600
Message-ID: <20261123015035.369192-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123015035.369192-1-macroalpha82@gmail.com>
References: <20261123015035.369192-1-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Cellwise cw2217 battery gauge to the Anbernic
Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index e66803b5399c..2203e092e8c8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -954,7 +954,26 @@ hym8563: rtc@51 {
 		wakeup-source;
 	};
 
-	/* cellwise,cw221X battery manager at 0x64 */
+	cw2217: fuel-gauge@64 {
+		compatible = "cellwise,cw2217";
+		reg = <0x64>;
+		cellwise,battery-profile = /bits/ 8 <
+			0x5a 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+			0xab 0xb5 0xae 0xc0 0xa9 0xa4 0xcf 0xaf
+			0x96 0xff 0xff 0xd7 0x9a 0x83 0x70 0x69
+			0x65 0x65 0x65 0xb8 0x81 0xd9 0xaf 0xd9
+			0xd2 0xce 0xcd 0xcb 0xca 0xc7 0xc8 0xc5
+			0xc2 0xba 0xa8 0x96 0x8a 0x85 0x7d 0x7a
+			0x7f 0x88 0x92 0x93 0x94 0xd3 0xff 0x5f
+			0x20 0x00 0xab 0x10 0x00 0x91 0x68 0x00
+			0x00 0x00 0x64 0x3c 0xa0 0x89 0x00 0x00
+			0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xb2
+		>;
+		monitored-battery = <&battery>;
+		power-supplies = <&sgm41542>;
+		shunt-resistor-micro-ohms = <2000>;
+		status = "okay";
+	};
 };
 
 &mipidcphy {
-- 
2.53.0

