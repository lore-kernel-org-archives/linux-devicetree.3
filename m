Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220806;
	b=DGvUZjiY3J56G6qfSguTcsAaAzuFlqtY3yLi0B9sBZsnc6zZxsHG5iUGAWps+wAc4FWc
	 g7+OvlvMTddStJ427VtYS4MxS2RS9AwPHnNCDiCS4LJh4LE76OIq80dtXL5ugvatRYQ7q
	 7Rqug/l/4ZLAr7B3mPNTtvlJ6COwvz7kTEPCjmuPWXU8XB9PxxzX4wxnj8k29MuOQujKR
	 1X6K8hV7RehdECBHhXUlOJhiuAuV6Jsk9bjvDZvci+V+t1Ae98RcaGvYBkpzwJNM35klJ
	 XhZwHfVT+N0yyAOLLQ6J9Sr5SYaJ9KR2iq1Lpqs0udJ9gwklJbDKNZwm6ceC8JXTn7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
	b=hYMjCLqH1p484CrkdIPu6qogkkpTwwpHZYl6Zc8I9R4LcmUO0l9MFwtwIJtv8or2LXnc
	 Bnp2QjIIpKdgDkx/8qbVvFJGZI5mkAxpVy1DhzPJ6cI9KWnBxWz1CRZ2vLgpptl6jkBA+
	 UxGkXidVk7+InLp8i2KLUdeM96HrtG62prBz8VZ/QYme0ctqP7zIRMq2xLW+Oof1V0fL7
	 WbEPAMGDlIOH05Z/5MmxWQ0hpry0B3XIFBFiGNProN24izOx9b2LB0bN9V5iFZ3T6+a48
	 0ZBlfOdhjnE04LX7mDAMu1ZwVpG8sV1KsWrdZb28hqPav7cfNreeoWpClchf0f3dxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKkAfxDz;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE546606A691
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE546606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKkAfxDz
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04fab527eso7951075ad.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220804; x=1795825604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=dKkAfxDzHRbYNw/FgxDEyS+IdPLea51DsLcawopy61sWKUffVnIJzghx0sm0kKvrYd
         ErwhSRzJoWV205dmp0z1v34N4E8YBBOTl5tb9LKcKPP35Fo7rtu3v5VJTPBeKKoZmQEN
         WvP7d2H/qsUNh/D9vRExiwBseRzWRezYAYr0Q4GKoQIHnh4YY3DPwSbOsKxgT7r47aIY
         6swfdcL5k8n+gSBX7i8BRghvfBlG377b6c3G6STHIIp5QRDQD/VX1ZIvhOfq956FsAWd
         EAY0r066WAYmxwvJzakjecubaZ1iqwOh3e42EMxV8jqfet9NCdZI2rUBvzi5TM9wcrDX
         8Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220804; x=1795825604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=fntgNptujXPxxZ61k00YUTi45t2uRPMRtFug1rtSn5vYAgLOw9nBtb/pTdzS5CQ/Is
         hbznASnPdJFvATUhDAp020M7/mwnSUAOvkE1sfHM6nb6OegKvTPgSxuIiJkTUVlw4qJe
         wT4gr8w4FyZLAcHLae1gT7L39Q58aM46smCMvAtw1vXrajbrTHbYQaWyhYSmUIuZ8gjQ
         61SjoAbfNuveiI2PDuHonR+ACozS9kpVZT5u+aSOnT7VDN1ob+kDVBVLmH+GweGnG8M1
         faYzNZSd4sxiaiio79tVcASA30pKrs4l4gxZ81JApQ4Zt8BEoZ2Be4umpcFTfM4IdDOF
         1Bgg==
X-Forwarded-Encrypted: i=1; AL+hErHj+V/8TpEcn8Nt9gb1PBtGDyGM0+KIX2o9xaem9DqMQr0+RtH97372aFjMIrUpT8uN+Dd0qovHSfF6@vger.kernel.org
X-Gm-Message-State: APuU4Z9kw0VGsYKzJXnIx0+Tn5pd2cFTJ3FhtN3y9sZuj74bCJzwJHcB
	fu2kg7zcAiF1oRrZJ5dycqg8YFoxuMD/rA99xZwYqhsVJifNaBNyOA9j
X-Gm-Gg: AZFdTZeOGH+dm4Ze6/5KaCfbCWY/TvNn/4fjQhfgUbIyBdGFOcnCA5lpXjA5WAhnLei
	y+KaqTBP5Rx+rsrIQg6PSgoZhMR24yh0oRzp7sqJx06PHxONet2iTpPnVtBHLFQbwnzc/m+cR12
	3tfgOpbQAFw7o7u+JBTypcyPWDSRJ69sN0xpv3tJsW32ZCRgZ/TOq3l52XFZtW4L9atsbByJuC+
	EjmUo5qpyZmNO07SXt1wwsLA1oAkpZqoZnZ2Bh1a/Dgty1UqCKsZipB+UWv/lxj8GE4JGw4grGx
	FfEf4iBTJU0+y1KbsUoze6RhLfXaPUzuZJ3AMzRe2qQYz7peGjGHjGtvL/gAnR8dgW8ivE9hsrL
	hYNat/A6oKshWhbW5CuGxaTr2cnFA8ymasmrZWZWniMFzbJdou16cAbQTDw7eDxuxEHNv65Ea9R
	45/Afv7ePK9R1fIahtAR2vpTRBMHXVoXvCOqvBi2dPE11Rb2vbxozfBanCa32icqdtsp0obZLTA
	XAEbikwwwcqP7CbUOuwXfpdv3alP8y2lNTGM5/FBp6JsoN+qGEv3g+kxDCNPKIzTodL3KpgiG1Q
	II5T4ByeTn1Jty558LeAkM3nVG1Gz5HSdQ4nPndjoBquNG/9uKwoGacLYX/7EMP0z926CkOH9Q8
	naaD1p4IVHqfo/BEDUupCELkf8vKmTPNHtu9ap1GymIUm1Kx4SvKYuuEg6wYM6BTZUBB2N12BzS
	cJzQ==
X-Received: by 2002:a17:90b:442c:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b41c7d17d9mr4688820a91.3.1795220804144;
        Fri, 20 Nov 2026 16:26:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:43 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 12/22] ARM: dts: BCM5301X: EA6500 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:52 -0800
Message-ID: <20261121002603.25254-13-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index d9e4f84058e3..8b3074684e78 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -61,3 +61,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

