Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220798;
	b=PWfB/4D+4K5k7XZe8dMRJIKOERBx+ijRJgkrvUMwRVDiXWYdnmDj3JyK/wPKNKXBwt8T
	 RrQgDjoYLSiTEgFpMNuJoVXQ/J6ncqSGlqMaj7qIIJGKp9odZGIaBe3eNM6gx3L/LVdPJ
	 HztXSasust7iFvDJ8Xg1OU6HvHYuODJwa2+ebZFMjRg/4yZyENyvxXhaVoiubx6M3EzYC
	 VqFWd9qxWsRKfOg2+fTkxuAlCsJCnYcxkC42cZQw87/6ia8bHxabc1HmCeypve9fgBl57
	 8D1Mo0R8T8egbShhbEhmT3NysmLyMgT5Jed/6uC0vA+1DDLw8ZMAk5In4t5ozQ3daPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
	b=5ToqCpjV9XeiEjRnjZMzxrPJ0DFUrnbGE8U+bUho3hp0fA7qlDd+8kxQKdunijh7Q39W
	 1iFYIGVXBcK/SuRo3A4/5giyPxNzBS94aTJ4lWkZCNQkOcNs3Dfs/7EqYtXT0jROzpTUu
	 ZEdBszXnx+fYYmfDJMkPfL+GK9mg3UJ6qj7D4A/x3/ksgG7BTmCnxRZP4afqTwrJN+96S
	 qGNKWZhayCTQs18umVMej3Xc7bMiiCQ4eVB5mDqVzrsRIub8S3AwbxT6u785eU6qyXsM/
	 kbWgnNkPrZTn4qo3rdkaGKYgq3mvoGjetf1gdTMbhxEZf09aRZRESCVKnIqDoJDoazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDUOELlX;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520DC60A2601
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520DC60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDUOELlX
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b439e37813so509830a91.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220787; x=1795825587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=IDUOELlXsPJhrKiuzMg/IW5XVsCjLRudEkU5BGU2F9WmOy9/r+bWbJjf7NvYQWdREX
         CScVZ95E8Xy15G8mdwdm70zNDJAqdFlD1y/S8/RU0Iz+zSffCsH1ZPih9SBXn9MNrId0
         XMcbf9Nr/a+gQjUO9GdaYx2QwcBWXfxWWszyOYs7LiiKD4hXWNxB0iOfT06H32beNPMa
         UnAMfmDAYusiLdFY/DvE7YAvHnRHGUdG+QAH18D5Qqi24++XOUtBOKAtS1LiZw9BbpWf
         ecQ1gqZjj1Ty3gh6j/zkIHwuT3/pVwz9TxeGP5DYbvR3WDKw03mGeRMdsqzfgFraNT2I
         BjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220787; x=1795825587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=eje1AKtVPGqQII3qVSGbuOs4NK5MQMLkE9v7eoNqjyqhjwOBpg6oPZygpZ6Of8cICF
         WqrqlgATC70EfgJANABimqxij5Z59a93mVKMx/Wa1D1VDDiBz3crBDi9qQtcE0ngWzo6
         AGEzx5uSP+zQfvv+z+a3HbeEL/YHMZLAQzlIQF+aT5q+iINNnsOoPamVKBeBLVUFlMkp
         INuqBRmRQ4VgerOvkph3mmIkPFeqo1oOhqjuPzJgStKBAuLzIY61edaSv0Z2xBN/Zj8p
         HWaqLBn0+ye0wkbAUOTALfF2qq3bIJIU7qGfCM22Ye8ejlfET79rZ9GjF7PaSmq0+Iy7
         XDTw==
X-Forwarded-Encrypted: i=1; AL+hErFdNGwpDlXQ5DW23NWmEsHkflvNiGOcR/Ni8I7eWATxkIgazZA9pE5RpUiTldBKIaV9elzJzsQtWbTL@vger.kernel.org
X-Gm-Message-State: APuU4Z/OG30CHvjxvGCO8iGy5hQO2CzzowjeUw7bj2l1L5jM1BQWe9tS
	qZgmMjU5kdyBKXaHh/Bu/YzcdnTplNSyX/GYlN92gQXH1nyCgVOJhwal
X-Gm-Gg: AZFdTZfwBAOf5UaR6k1my/JMf1WNWjT/8syTu8VHLaYcPKzVXCs/PfNuTRs0tHd6alo
	x5QCnqEmcIpKK5Fto3QLW8OaLa2GSm/0x8imAAI5u7YJtdHjVr9OI4QnKfNQPU805qADLM5eMlC
	gr1Y6ZVRa3gbzkde1cpaAPa2B6Ln76tOUOEMShDlOf6OIVCrX5ozEPh7HqlXpV2zZgbsqmZM7Vx
	/giCdKK1ZM10c0h5tTtYtOcLRKtMoF1rUT5r1TIwzY95dXsPSuXGnu2qq2aCM+vemsl/znLfhmf
	Hio+vswZnXzXzL4e8XzrFJXg3PzFK/zZexklnJAv+2VzXHTry9LMXeqBBUdShcovhGIjqQQPunj
	kH3PzzuYqyqdn3dex97H5aXKY0evo/SUEXwCRtB5lL+V1HdaCikBG9/xLeSpS5JdUV41dLMw5HV
	wphbxKJ8LLMv9lHxxKFx3Gru7NHjSE40miE7Gjbu7ew3YdL7ZbDxs+aa63hkP9e9u0hkGhov3nZ
	ArpNgQDK0rwXPPyp0O1M4XvYDbtwVqyTdtbLfJpnMbfETWMyig+rXpZTIh9iexMJGMUKI3F4V1H
	CGHBmyOusgBJVW60xZj+VABxex/MVHL0tSLtZ7Nr1H7ahE0Z+x66dCPPtMrcHaNU2aoHCbbfLIm
	D0yY4BZXpl1YDG85V5c24OF6Cfk3hQpG1fTLwy9Mn2GedJafqrfKJE9NEZk9mT0mmepLHVQVbfh
	/2Ng==
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr3659922a91.58.1795220787596;
        Fri, 20 Nov 2026 16:26:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:27 -0800 (PST)
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
Subject: [PATCH v3 03/22] ARM: dts: BCM5301X: N18U: specify switch
Date: Fri, 20 Nov 2026 16:25:43 -0800
Message-ID: <20261121002603.25254-4-rosenp@gmail.com>
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
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
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

