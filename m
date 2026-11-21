Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220797;
	b=J91K41D2qS/4Gdw2PMIxLDDh88hl/xp9akjjVdXjQwZoal/LcfEpC+4B4T9FQ7wt2TTE
	 nx4k41/WHyYfiv2WB8pLaufdyCWti3y7DBT8rqLU4bzLEVQBToeaxqzsT3dW8qhEYsVVS
	 SOICr8SI9DMhnoiEoQsDIyBfeZ08WsWZVzrgY+h22VwoIpJ28y2AiAvuMQb6Dt2CKvXek
	 ag8x9aOm9HqT3ctPN6b7UbvebjHjNsGHrCXx3vKvPi63sTKrXatZ53x8idMy1fXRqdAS8
	 LNEXfXH5wrrqhX3J+qAzep1pnNAQtUt11/RfPp6qeNyL5YmadQNBEoVvxT5eYMYqk6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
	b=PguZqq33c0tzTWozcLAVNwXYwygpiVSXVDBDo5NsaTswndg7khidpi1nakvgjddqmqcO
	 FlBtkRXjsCUsybqnXRjlSPkkc+Ly6sAbMWi2lJPioxtMJh7MauDnIvCe/xCI84zXOzPuE
	 1qDZeUqLYmXDj2B0C5r7zigHBJ96Yk6l4WsvjymFxvaPgJRbYibEzYt9Ct1r8Nj2wCeFk
	 2G0rnSKSjgHJizpZZuy9sYBoHFRTobyaaaL0SwJSF4a0lzbMLlIU7XQ/hLzkd2/dwEJqP
	 H+Ojk8NFmY52fwJROyxKD8KuFXvZ9ORO40O+NQCqIwk8Ur/DuVpOazPJB7SKAG0NZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLHGIOo9;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE607606A338
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE607606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLHGIOo9
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so1183040a12.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220785; x=1795825585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=cLHGIOo9O5JsYRdCyLp7g0/qfy4daSSO7MAae0QwqUbvE+0e+ohdROZrIsSlpsD2fP
         NEFdSxhwkfkXtAtf2oM+aBAAUhNVpOfAzmQKcCQYK2NkSUqYdpnN0SkpwenMjlzWVyoo
         K4ZUf6bPLj7YGbo5oD/Tbda++/x5GSV8/LgpPk5L1cAR4Lz3dEwUd96PE3jBL35KU9gu
         sOSZpgRkqIbjhPMcMb3fSnwPfPctY8YJI2de/voKRGiNqE4aas+k2qsPOJvo7CDLYAK0
         /WJ8b65nysCyCpQVPHvHhpGXW1X+P7/GlyQiihWzxwrBDSEDAY477xCYEKviJ7aY598p
         xX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220785; x=1795825585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=C6QhCVCijbiIitazE8Oo3upkIaqrXAQ70TgyrceicdCf6AGNCzKi331EwYYCsOe3dh
         LPWKFrLKaS2M12BO+e7i59sUC3atmxuEXTggLF1MfELuVNS3lgIan9AU1RiZINCYOIOU
         diWw+i7LDjKxg1hRNMfn3T1T3Xb4OTzKZLeRZ8nZeKqvY5Iu7tz1jY2VzgiYyj9+Yak8
         oRXkP924ily9Q+uufqJ/V1ZgjyIszSUaKod6mpvsfKLYtDlcYXVm0YpruoKIHo0v6N7g
         DbiGK2ywu47DRllZU7s4oHd8mJodQgQWaovTHlSQUK5SlbQOrh+EwgSKvrIQICPvcM+u
         lBLQ==
X-Forwarded-Encrypted: i=1; AL+hErEZf35z8Lc3aSdYASRIe1TS9qEVOEIXcoJ1H+STh43A2KQymVGMLEoFrT6GWJ8bsmKksiIJRu1bSJal@vger.kernel.org
X-Gm-Message-State: APuU4Z9GWmUo6vpYWdstj8cZRpGEZuyYleMG0kI0qB0JNDL8Ib7/QEl7
	s+Z2q7Tbx5YzwXEQxEMifhIswYdfarBxZVd6erk5sVE75zx1E3bi9Jmx
X-Gm-Gg: AYBFou1SfO0JV6uDKp0J2yeSuuq/SWv5pd9ECxPdCvn5AV6ljV92c265WjTgpuZ8nt1
	7imYvgME9CZw+zCJzR9OtwqxpE4Gi78v3sATvbWMnpywP6EEdEJ5Hk0OgDKwLHR1QXu4B9a2G/Z
	lWqANeQynBNCzmXrCm7mCLcIrgPBvTxfZE+iqQjMIy6snnXFbjLL4URiYR51LHe9NV1+KkJrCM3
	qTSsJO+Nlv7iT/UTzbvR2knPP2e7BkpvDfYfWOtuUdsBSFcrb3y2XJwrtW78OPkPbtVP+5k0ZTm
	bJitatAVFHoU/nR7QVTec3n/NVKkvC+gUaFNDDdtb0ITEUFgZI5JbMQP2M181LLTMYuDo1QAHls
	cFlogkiGU6QSrseR4ejB3D67inN0VMK1K/2lHWoR2W79vfJpcEi7XdzZfb+iFVkuwV8pc/8kHa0
	3aETXRQOAyHyL6KamfTcSIopHktslNdiBFauTeVDS4liQOltQ5moa2SjsmoTWbwSspqDT2Qpgpq
	VZ6lvgqRF4e0lr/n2aOahMTrqkiZwKhyEBvxsrHNFQpLlDb7QfthI36baAh/KfuEguFeSAaDkKc
	Zqbx2orRLJlr1R0ei+fYKUCU8tt7cbENN7drdB4ZlvekaGXm07k1oXqER7abZ5CFGXwRAsUZwJC
	HZZA2b1+T8AxLDVxeksjY+lsdqrsiU7s0QtSXKiElnJIjfx0KptSBbdcybjb1JpooVx3lBjTqBN
	+ogw==
X-Received: by 2002:a05:6a21:3b8e:b0:3de:4c08:174 with SMTP id adf61e73a8af0-4014d457f6emr5156002637.33.1795220784824;
        Fri, 20 Nov 2026 16:26:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:23 -0800 (PST)
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
Subject: [PATCH v3 01/22] ARM: dts: BCM5301X: AC56U: specify switch
Date: Fri, 20 Nov 2026 16:25:41 -0800
Message-ID: <20261121002603.25254-2-rosenp@gmail.com>
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

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
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

