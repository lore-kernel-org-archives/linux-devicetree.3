Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750344;
	b=nclMzulb74tHjGe78T8awQVL3X8HBL+p/tgocSgkD2dQZgswaufYWyBlJUxvTHeNbOmk
	 sNMJkDGGgvGjN1uvzrbtYhgTF5rtzuG2/UndhCvectbnvGj/4oYNWfsrLYEOINPNiB1x8
	 6NPU8QotF6Qj9Gq23kgaARazYE65vJAEBxP9kB69Yde0Ne0Qt6GTtf/UMniMUYqcpKVj1
	 KyaNHoJaMBEt9WKhhOPEsRA3iyPaYltC55oEoIGJHx5WNbB8yiDS/FWs+lecyyad+HVJA
	 9a4uQoxlDADjVaIZp1tzL3Q4YvsNJ8B4Jyi+nKLDWaWLzaarqf2kmCFzkVEYVsGTc+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
	b=4yKiBbRxHZAZ0iTvsUOuE3N2AVSowPTVUz6J7aB/fFR9r6d4F6fXcJbFfeZD5GwRGL1n
	 A4/VGv5qE/i2QrEqMt5iV8s0QZXzf7hccb7dsXGvabb1TK5qzxBmAGQsUp+woO0IojjH+
	 WmFnI1xG2m6iBHVB7zvbsQk2SybFYfq9nEfQb5PamYJHgax6/dFhod9Y3sfzKv9RIyE57
	 PG/5mnCxgqQGASB7G6ZQ/4NFb7sVh0t64jHV3j9cfQ3CRpsQwsQzsUjbWxR83ZA4tNOcX
	 stdFFFhPG3mErQ5oGOz0eJ6cILFZslt2O4yUYExg1uDhXwz16eE2o2ART/wxDkort6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C70606A328
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C70606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6157185e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750336; x=1793355136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=TXZQvtD7jcqOHabVOR/WQ+U/XG+v8vjWM/Qmsl/q6MzNZD7uqig8eGptjZOesICJ+P
         ScR9lJVpLDAQrN6bNGDoIzP2zfnTu0iNIW4E5ihRHRNcomwDgzhBfltCJErnLQgizFnP
         S00llh1bjJPqLGcEzS6ZFocGV5WDpL85Le2xfNFTfrCNSstwYtpe0mbeJ7qhc2DHuvOL
         Bcjx2MtcWUMSzpiVgxQRtlhn14/FrOMDJtRIiMOO9EZURIdpIZTJR+t7d2Y9KJAc7J6f
         3cj1tMnVc+viMiKK80xqhvsvmQcodKjtbWVwwE2w7iHG+6KbtBrtw84P6UpgGVAD0/Er
         MGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750336; x=1793355136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=JAwQqgWhMahx1NqvEKlJzVH1hOQ/oylnk67zC521NOnv0UC7Qs3UqDe891qMCvUnng
         iRCijruIyO7+/WnxdqA0sQqOoNLMNkPmfALlUPWDjQ3qfwTormJ+XcKtFieHluDf1vQe
         M6ey72pUwSi7ZlD2f6dcayy9fgfjUxcaYn8oCXb5lL8FCeWZNUJbpdUf7H2wz1gLnM9L
         Ix8LF91dewAMnLP2qIoUK/ZZXhwHFJHTvX7OhMbNWh+9oVI9xyG6frthlaxMAEFsZO+A
         xP6ylta8Z5HbGeQsfzyjP1J+IUv/dx9VlrIAAv9huPX+2IW2T8WGN9jjuHMP66VXnQvi
         sy8A==
X-Forwarded-Encrypted: i=1; AKwUvBw5BSVg5ujN8lDz9DqsSAAJUMk4cUt9U5UsWtmFt7HnFL8TeldLH2nZrOpsJSs53n2SqilCDCte0Hju@vger.kernel.org
X-Gm-Message-State: AFq9FYLR5VIF0g3ZKwjD+o60mX0Imhl3bmWVD6QJ26uWm8R+s/hcXQm+
	lrt+yu7rZ0B10kYppgxoP/FUjG2OEfXKuec3LC1aDzvPDH00OgQv14yP6Z6ar81Pa5o=
X-Gm-Gg: AYBFou3xKGQILcLxeVGF6IpcGHxp88hrM0ftHQOMisCrH9cJgrLY6O7usfJRMhlhuBo
	2WHuaF9MlFrZonoSK0eq88Yz29+4T1gzP27BE20vzYKNFuDDkKP/ax6Krpm7fQr05g0WQRM/bYV
	1/a9TwsFa/3NgrvfkL1LOuo2oSmawnriMDD+PbniEJ2JV+xBbNrkv0YNL13KQ+RA6O0gayBNC//
	RpvqCunox9Um+4NyP7xM4KC6z0FpbzstU4iYo1zpIvPWSJ00AChtMf5chbS+P3pHKYlcZk0Xk8f
	Zo+owvEWR18zwF2Jz6AGO3ft9q0Ae3spm0TEJkn9GTSaPE7CkIdh81Nx9g/dWfghJo7IHwwH/bY
	iBAintKUQZCrJTsdV1sYCoAPTropspMcuwoZfgARkg4UaaNiGbCTlLIQv8Q0pSJ+rJfgjIX5YDs
	ec+eVYgBH88ikuE4UtpFihQhyIc/vOLMPk+wI1E9jrFSTCTUKP7l6pFuVJuQU4hPfTZ6pSjwDbC
	2YlNBiSqMsmz/f7MbcLFzhuqVPG5YnprKy6akWpUFvtBVv/iNhem1dGdxFXLBn9Kappjtd+Shbo
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr26707515e9.26.1792750335754;
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm57982975e9.5.2026.10.23.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 4/4] arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
Date: Fri, 23 Oct 2026 12:15:57 +0200
Message-ID: <f00b7ccef721c7120ac10a9507ab211773787aeb.1792748691.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

Add the hwmon fan node for the Raspberry Pi 5 to expose the cooling fan
speed (RPM) to userspace.

The fan tachometer is managed internally by the RP1 PWM controller.
This node uses the 'raspberrypi,pwm-tachometer' property to link the
rp1-fan hwmon driver to the existing RP1 PWM controller, enabling
RPM reporting via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 748be8f1ee9e2..9bc6d0e9da1b5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,11 @@ / {
 	aliases {
 		ethernet0 = &rp1_eth;
 	};
+
+	fan-tach {
+		compatible = "raspberrypi,rp1-fan";
+		raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+	};
 };
 
 &pcie2 {
-- 
2.35.3

