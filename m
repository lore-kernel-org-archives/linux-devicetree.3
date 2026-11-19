Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078548;
	b=y4ytqE0OP4K6XuBg6TeGYPiYujtapq8HviEst/5D2uximHsj4edRIjJblm+1lbGmXeM0
	 oSoQ3emEA+YzCifz3SsrfgnbbfcDlN5Jm7sty6pHRoiAASgtB6gEz6708Vtxzw53CeJB0
	 Ebrg/kazWTSkfVUQcGt1C8/1BDy8oAKHuClI+AaXBwZWWd4ElEbnINmPpHYIMCfCCiHy7
	 Z5+v83Bb1RCJxi78rU7ETZyTbbWwVHdSZi0RR+rNjtiMzdcU7xR0KPc/ucrzVo0ZO6woh
	 3B23On0iS6OorA2cvDZ8zbq9dIkvLODj+Sl6MzvkmJ/XU+gOiCBmDs8+eLwp8rs6Sig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
	b=MWFpesNBHNP9P7XgUN5BxWJjbw3HVm++LjShTT5cMl6znKS5zZwZtBO0xeigF1mKaY4T
	 Bv5jHjCWm1Ii5EYW+W29rkFk6Po136YNWwDQIuJHqIvfDoJ5CiFthIg00f2ksncDClZnH
	 eBuK7A8G48RYV8xxBUv8G0nwFDj8FysgxqZFqCqVg47ChG6a+3rIr7J5KfMCCmaCnIuvH
	 2yJ4oqnngML66vwgHr08A3I09GIBSbefoO4GOs52J1xoM9628GWHvphQY7kgUTPeexoYG
	 8md4kdpIS31+YuMtQhJtUcRrWMBAI5PapPR1ABFZYFXT7nx6aYQHMWGepJnNNiLoeJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCZB4MLS;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07B606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE07B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCZB4MLS
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55d3563e50eso26043651cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078547; x=1795683347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=VCZB4MLStKFevXGFk36BcemEMUxa+9Sg/acri3fGsSlTBgPKlDkQtvI0pxi/2PfeTY
         mpN3sqyovp2ZVX5syD+264l2EZuq6jH5v0YXL6IkznpW/TY55en0jsmGo9ggLsbIhFMM
         67SxKfsL1dNj0eeJy8UI3OGi75Ql1YWFp5g5LB/DRATMuptOxZFxuzW5xJyQbNAqvJEd
         ZD2WPTVJZWeRqK3pDEZrQxOYSFQhKe5cAIPWFv4zDgxQ2YwIgLlfPp1kp9k9QvV6P8iM
         wOHOqo8VapWAN2BOkJ4pJ96ws8C4KEqrkHBh5gK6E3/gmAIQ9mq1aSkZrYcGCwZ6U/SB
         xPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078547; x=1795683347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=tFsk2tyidjt5GvATQ1VJC9nFjQHodC/8/BvQjlVWG5Mb3SzWpzdxhzkelLQjf9zEah
         jjUZLDaeRSF76ZZ+nkvwOwWjEToI0IZAcSLBoEcHULP6L3crgO1LnhTRGNFc5NYGV0vg
         5K2YnqY1xEn5Qcto5BBxrXDeWTefutBclhYk+IGiRxlS7jgHTH34gSCFXgY4XExdb6Dt
         KDZWN3Pcj9a1kURRAw8k7RJ1whi9Nr98BMNl0rgJ5sK7VekgPcTkXhoEPztfIhGdBaqb
         GOOesqpCk5PrtpuaxM/yTX0LJPitEMlvK8KrB42JaTYSDz0L8FqgH9FQP0iIO4iNdQC9
         nndA==
X-Forwarded-Encrypted: i=1; AL+hErEGWJgBrM3QVpmbqR2Y67MhadAPf0gaRno2eME6/gEUgc0UApJ5Shnp/MMucqjzbUc3667cm3spV3PH@vger.kernel.org
X-Gm-Message-State: APuU4Z9bmvFQkPaJLsHrouZm2LR6oDiF3hXPXZEsq4FuNWAlMYYY0Ve/
	wTOu5cAS6XzZcalGdTG5aKoHXY+R1u7WoulQk0dU37nebeUg27bCeFcc
X-Gm-Gg: AYBFou0IKCbziXYEBs7C5tbPHzO3VYz8XiESRaSdNBhBy2gcuAED67eLHdpBYw3c636
	VaCFqant2/ojraN0lrH79I0t+QD3H7nK7cqMxrzauwt2u/Q/kOm267kAxqwO8I7DR+b97A1FTRX
	eh4B95w5qgFyujGGhYnM991ZMkPU5RiE4zLarVDmtGCdTdR0rUxDeDQBKUUgdBha5/Zcm1M8W0F
	p1iN8cNuRaK18RwuhXeKBpDIly9uDoTdYll/EUAH//j+Uo/rtvMOIZR76G2LPHJXtgFQ5slmBup
	mB+97ILAfRI/9/A/E7G2uW0YMlaYGwP0GnaQ4L17BsqWYcraOnYLH7wF54ZhtFmnIE77JnhBkia
	FQjAKVcW63gOr0SXNd9rvT2AY3/t+XB5CPixVW1RbAp6JYSJcc8VTOLyQr+5oxailC14EHkLdYv
	FWKH+utRlLt7r3LFpJT55TeJO2d5Lcu5AvXgr79+7yHA68H84qR40rB08W6viqEb3vEwrBwxZx5
	l336Pl2p1jqVhfm2aTQuxXisVo/GON1HFBRqIcBReCW/cdOQFN15gaCfFnfXlkezArkx71dT4mq
	PZLw0J1j2NiJK4XwYOSO73vU96Znum+j3We72SoZNXztpwZWWc1aGewq+nHpYUj2fapN1HhRSB+
	dts1QjifoH71qDCSp4Vm/ahzyu7icP6j3jN2PbgVNossQG9mPBMGmzh6kLyhebj/HcNpaA/f5lm
	u1RA==
X-Received: by 2002:a05:622a:650:b0:54f:8d78:4dae with SMTP id d75a77b69052e-55d5a6b9901mr82855101cf.61.1795078546742;
        Thu, 19 Nov 2026 00:55:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:46 -0800 (PST)
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
Subject: [PATCH v2 17/22] ARM: dts: BCM5301X: WXR-1900DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:47 -0800
Message-ID: <20261119085452.75708-18-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..6543eb8aa9f5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -130,3 +130,41 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
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
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

