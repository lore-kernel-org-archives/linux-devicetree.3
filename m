Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFD4F7991
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330508; cv=none; b=Fhi4GunJxyQh4UDOwT24yKBI8WGtXIzG+hfbFdbtiibA6EnggEQFVb2yW8EKI0j9vXhICNSb9dxK5nU5jgER77LZUwvuxtQsIW6Si7/yfJNwc098X6UQWJvEYaOrYfhxraN0RBOWYNGSrqy5YkJQyJNBcLydSvRzm5ZTq55oNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330508; c=relaxed/simple;
	bh=BSoZzBqEeloYctNTcEnE5HNwheDgAkV8kpFCbDHhNn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwAhuMPHMFuikrJcnLC2NaqcaKBXpmQI663uAEBPuPtDnskin96O2L8MP7G3jN8d/IVQfAxrFVAsV4bB6M2WNArbKYVj422l2BI2pdrbyPCnR6aB1owWhZE+v8Y6wvd3b0iGI+7TYLJ+1qfsz3RJL3Vqzc3EWNk1w8Br2xKxlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkp7Kbd3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkp7Kbd3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10828155e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330500; x=1783935300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=nkp7Kbd3R5C0vbfJmbWmcPe8CHMs3j2SZCazQpFXbG3njjAOqUT96CUGNxkhDJKDHC
         DOi/P1+/9kp406BQbsKM/fDVGcZR1gP0COZDCB4W7dKZJGh30mi3RDXnG1ai3xUyvif4
         ISS4r+s3ah8IRVn+xTAOnjCwC/o4Y2MYftUd0yzrAfDPdSVlA6k8mSk7Mk18AO5YpAr5
         Q9LGM7ZYg/XWcl3rbG3y+Oahq1lj9gN6LxyXNjbjTf4R/OCOxoGFpmqhLqbSl5WF5tVt
         Tt9OJf/r4RZi1dARZo0WrF/KaYRBw3dj9pPS4Am1O/IIFNxjG235nD3SuvVnMrS9lVQj
         zGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330500; x=1783935300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=cdZZrnZFy/igxF2IO6xyBPSxo3GjzptWnHQXwTWvJgazM1jwZQ96BelJCFsP1diLzN
         D2cfgAgXcmM1ERke168VjjBQnHWzjJ8QYIaYIvhbi5hZ19nA7iVRmowMuXlqwUPcA59A
         23LmSqoeRkgkgkN6/yCPwRYZBxzkGqWJeZwTzDgXj4eFbdVzt74gQyBCZM/Yg/mho26/
         6rNPBxNkNzxf5ydMEz6wtnTILdhs/W9a296cvHKZfyp3ZpgtiR506ljUsRdL8pioq1Zq
         etO5HWFork1XF8LHirznHdgwuZS0UZ740d26ShSHiypzcSWwJPQaJU8zwPioaDJekBuh
         paNA==
X-Forwarded-Encrypted: i=1; AHgh+RpUHUFtqUJR43lQeFz1v+5CkloT5yqafYTTFPJfZ7XdVikF80S+Iu5JWhJ82YWMsaz4R6iTRFLWKWI3@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiIANfT9T85W4bK1w85+0GUxbENhQMpbtM3tcC7UIFPbBaWzm
	gYCIAXU7JrvWzUBhl6OxfQplWpxOgTx3V6MQECZpbJikYZEzbPwUA2w0
X-Gm-Gg: AfdE7cnknERDL992PjhqZMEmfrOOXJqiIr6x1S091wSg4btMzMUVjJZJQdzmwKzOooc
	hKlupG+HQ/QDsiv+SCyOqBhPYaRvLxY5SNmL7S6ySh41KtX54+9tC1WuDA1u2xVh00OWD9fg688
	niD9WM6wC2Z3qbU9rwyzCOkqCeZRHO2DpEdrYBgr/thIWYU7bFNQP3/42Uuv1sPj/Fv8O6JLRYZ
	2jGDIBPGr2+FDS3yyIHzOEs6dLHdDWX9rp+i38PS7iPazFM4Zal9KmrlNdM0/Ned2WOjXMLrvgC
	elYo3J6AXEdDRMNkgVT9gHq8TC+51WS/ngKrHVdJS44RIQuz5XyiaE5UH+QFmLySiWvfszyvLCj
	rRRR2GnE1hdYA2gYTGMr8HV696QPsvRVrrzYc81j4xI0HF/vB1QSeg+1wCDhSPsCsoflI3FWfv0
	xxO0VIa1BJ+Cy3nNm2fSa9azT4riYxy5uHmkxSDbldAGRnpeOtp3aMVwkLEWfHyCqeecUvH/UrG
	MFt4fsyMEozl2i+j9DTk0kwPA==
X-Received: by 2002:a05:600c:4ece:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493d11f030emr111490185e9.18.1783330500022;
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Mon,  6 Jul 2026 11:34:38 +0200
Message-ID: <c9696914817c7e9290de7c1d9f588632e700f478.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 5d8cd8c13633..7a4c7455a162 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
-- 
2.47.3

