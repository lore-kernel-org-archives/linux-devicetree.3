Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12A339847
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787528611; cv=none; b=PEBv+HoI++isNNYVhLErjrgKvNIwbmRsJWs1gNTvo2i+Qi3Jf+yrL9AslMDUXpwGi/P8gpJItT4LhhSyb2bKR7VD4gvTObpSbJMZ4JK62mLOaEz+mlsqmMYLf/Plv9ChRh72tvTL/dejCcikHTpdPb+JKqKreFfjsbfI1fGVPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787528611; c=relaxed/simple;
	bh=MFVvndqmgqt7XvRFOQuuPx0LRipmu+49v98832HkAZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqT0SVICS2rEYrlkI7y1Jg/a6cmD9OyLbIMilVKJuUIn6xIMACCkF8OsXNJ4yLIY6aLUgYxoZF0Si78VrjAHXJbsFGPVXIUveTvRJ7PTJ6707NCXNOxz3fN3NLVSG81RI9sjeVyXGVRiZpj2d0eaNsWYLrWi0c+0i+pI3tRWibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exStQugI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exStQugI"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-930f4e5eed1so143895885a.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528609; x=1788133409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=exStQugIlmPL4H3vmdaGX2EOfGcpiitdFPf0EKDaCjZWzpuHI+OpDKNDjftqxPk5ad
         hkXgNFNe5pVfphVg5nYdIuCo21t/IfPRV/Yi3WdJ//gL023vJ3gTvLtgMqt6orpxqbGf
         uCMpemF4iWm66iPN/H9RMN8ldUrWHOo+9PEp7C5MDBSBvN2eT6U1YA/YxM2XYlhrn45Z
         RxvRvJOH39rFts4iNJSS/BpecB9jcReBiXgzERcQlupMwm6NqaTbNZeYIb1k55upXdoh
         3vP+QCGD9LiRpLOKPFc4OWUAKnkCIl6FzFzt8KjX5iUXc9U3TqariPXjGF9xOhKrqwbv
         VE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528609; x=1788133409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=rnrMseZJuYBjaIkXTi7B476/eWpWnroF2PG1RZad++i2R2KPtIMS0mcAIOLmpTm9SE
         k9H/GXyGWu2/cAWMCQCJBpNLHjudOs3Ln2t7k/jXjOFyhqJO42N1F/kiWlJ9lk08cCRZ
         9qNgmE8ZwGuK7KnAN+mqmXChn5juAf+yqZ6+FK7fXKsHlTQln2OMEPGQmuMNrpBSnW6M
         iz7+8HPGpxd0jPYzKZkLEO2+J/0JRGmffuLdZTOnDHxyS8L8xubqcsSUW43w0jlWU7LP
         EpJIR+cm00ns8GJZ2b9mAkm7WvtO1FaaVvRTGf4hakFDXaTAd1NmNzr5RbujJ130yQiI
         tL8g==
X-Gm-Message-State: AFuF++mqDR4dwLuSZgnG2WznALxfN7CTFeVJS4gYnHMAL8ksPvhNsrQe
	yTRqym5Sr/hXw8aC+58cRMv4QmQyekVD44J9MkswsOjO8Tg7Xn0Ukd/rHyfRaw==
X-Gm-Gg: AR+sD13l3EEnOOZT3XnVKMW5g8d4ZJXk1WK1R/N4zbJkt7pamDr5RzUnTQAGOoRhiAX
	IbSyh0M8sd8MkTqy3Yyo82x162umnMCDXuxY7aZ4S5vOBZx8xt4cOCDon9u/AAp6JawE7nBYEEV
	qkkG7aEU36rb+5PrDLsr0p5o4FP55mN4Lm6qb3UzvtGJu9rqalO+hhCa7fzBGs82M8kVk5LnPAx
	4Wf2E5wnEKeCmqNwU4GMu8kR4nyq1kiBvUSJK0N57ZI5vdPyKWiEU2mlZyio6NvNvyhEYKN6RjP
	ZBae5nsPGaek5ilrmPigJvsaPibaD08RsPYLnDwEAUWps828TC1VtNC1kOL35TpZgDCbpLyD+xF
	vzOZf1oTzsIne2sF/uvtlx2BofiZ8RPs2JxzmEnvf+QW4OA+HdY5tN39IfAnM/ssu/9yeXmX0MN
	xQP1iSub+sKjFjox8en2SnfRNdZIcNrmGdf5IRxGb9nW0t3Q3WiwLhnrsCtdl4i2AqaVWF69p/c
	vgCbNJZLuyWE9V4+dNdZQqhdk1OOGJJ30xRrZKEhsVhy0UPkZW7IXlJ/Yj5U2SEFWeDJPSkbWyU
	0mIPoZPvjnsA8ejuY1SzoF2DAAUr9XBRjC7xUw==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id d75a77b69052e-52df5766f0cmr239331951cf.19.1787528609263;
        Sun, 23 Aug 2026 16:43:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09b0c8f2sm37012211cf.31.2026.08.23.16.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:43:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix lm75 supply name
Date: Sun, 23 Aug 2026 16:43:26 -0700
Message-ID: <20260823234326.71111-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lm75 driver requests a regulator named "vs" (the +VS power pin
of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
of vs-supply, causing the regulator core to emit:

  lm75 0-004c: supply vs not found, using dummy regulator

Fix the property name to match the binding and the driver.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..af96d27e7159 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
-					vcc-supply = <&reg_3p3v>;
+					vs-supply = <&reg_3p3v>;
 				};
 
 				eeprom@53 {
-- 
2.55.0

