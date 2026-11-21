Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220789;
	b=x2Pa6axamsgITnvi19K99RPjaQa3LU/FUq3XN8809szRD5HreGzQXwmvJUKYtKBCMZKk
	 zIpCYcaJAJmGWIXbTIba8kYktNsXFq0h+0b9q8PDIizKHFG29nB9MCnjXeaexlvYZnGbk
	 bSl0Cv9SGL+JmfMoI27OwWNk8J9MG+yzwriJELYLBMOIbo907XJMjnkIrgThSbMafiM/d
	 BmdcFSYZO0D6SlQ8jSqdO3vwTfvWdJPm6LpOvCBo0hn0OKynnx2cT76fMSQ1AOv3fMQfo
	 Waglii36HYK2JIlZAxWXc4R3LRdeevhWaYwpliTE+Yh1Thv2BeMi+UXRm/BOuQNyKaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
	b=iDGsOP0h24DKDq71CJ4hLAQxKGN9LxIBXXJtKQwsJGjUj/A2jJnNCRnt8moTFnvoe7rt
	 q/6NvPzBjIIH4v82fGq+/x8dnktF9Wd30Kd6STbO2iJPASmDOAkaAfgMPBZyFWYx34L16
	 ej/6Sn2do52r1SOGMpdz+n3a2TVUR7yA2gu5a8qXgYN1l2V7NzUy/pnRVgLKBpgDxlWeE
	 8LF0pVxMfMObse94ACLhmMAdPIjvbTmVJlDfJHOAzV+h+yplaFc0rWgJ+qXMmlcxsW7GR
	 xaXAvBbKAEh69JJgpTJ3y4X0eRBcsxbytYmgCRMlMdRMVpYiFvoMi3tWkOhe19iAbjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e8e//15h";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2A606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8e//15h
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd69954c755so1112148a12.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220786; x=1795825586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=e8e//15hIhIT1q0/n//rl0M9wqm6aTwfwRKdnJAzEHo6I644F35sS9DpVtgjIMzICs
         LJY90mLDOXJnLLBXDLEpapTsThMsBtK2M3yg+kH9O3h7afYkuCgGlLiVRDSnnyLTsNoC
         KQJj/SRA3I0WZZy6bfqXDNHV2TnJxiv7XCaQ6AkLIYI5Jf2r+txypxoIAuLbOU5T6guP
         svim14GmVVYTBXNUOhdyAoEwrzlMwLIgb7QMmGRAZPdlVQVbUGPXrWTpJ5CLYnofbYAw
         92XGkz2Q0j0nzsBtfM8HfOD0/zn+gVcMT2rNASvAd0KP82NYGnjEwmT2RCa9Kr63rAhh
         MhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220786; x=1795825586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=M3zQbm68RUZzJjHqa6tnX5UcFb5T/1ZYYBdrphHkoCQZJIbMArXp7HQbNHvcgOMtzM
         cNfRfxQQbqvkJbKCbYrkelI7ryKnjKD6yw6oMk0OauuXkkfeAAScz+JL0ch7pg3Tf08Y
         VEnJMiA1PzNXkrQ00YXBobuNphCCNnQKJLa4f7MbJN0bD6jOdDDQCjrMAdu12GSUuR/W
         g5NDtWv0VdQOOLLEVCsi9/Km04Kafyo6zydFZLwZmXBdfWeeoefvF4HSy7ZW4/d8J0II
         fBY7JWQNthgFyb7zaQNtkq0svFr+cJMWV5sOfaRw73LAzoIvtpD2meVKtU+SyYSyQQRr
         45Qg==
X-Forwarded-Encrypted: i=1; AL+hErFu2/bxXnkf+xxrxHz4zyv1syLmvFH6G4vjipjSvgTwriZPWDI0AWvUNeBtAZcf8n87YU+UsJAP0caF@vger.kernel.org
X-Gm-Message-State: APuU4Z9NxZ2ie247u+ZQst9kOLAbdnRsC6ob7ALnO8ElwF8n/ESp4IOt
	5KbLQeCmrk1RLAyHwaQXX1kraKeYUZEyS8PGf6oPhUfoUepvpfwZfiOH
X-Gm-Gg: AZFdTZccXHGsBPZIYExIGM/cONi6bj1kUOL2nJDFA3/1ZkjpzgSfQE/ycJnMz4eemdB
	3jY89PC1lIdx1cXzbK5rzoXNtC90ETTQ/TKilQmQ4iCrHW9QW5Ik7Tc5cNcpaXZR1Bsh2Fj2AUz
	nSWb8b2tATdyOIkU0yRcudNHSOoTTxTEf02D+bNoZGL+DH6T5rm2AbbZJqMN9j+z9Als1xGVzbY
	dzBoOIHegLolJXQ1tgLSyfgPmWLRLyfcBJvzRP6kI/6g9I6WjgFxtaO5QhJ25AI+GW76mB5GtjD
	89J9YbP9UQzeYTGYBnMSis3bzSQ7OFOegp/AYeGR6TmvlqMYuqRcTOSspiTTJpv5LnIGfYRHiVY
	EcdiqJ8AXeomSve1mhHAdccDtQ46qdjKfeEcJ6dXxfsvGr2tjPN+2YRPiwiy4d0Bukm/nx5gEVN
	XRAP10LW6NQyDVvji1NRzK7FFi5VWM+l4p9fIGp0Ta5lpBF06ogrOzxSKHiEp/7njQPMMNVWdl2
	oNnApuL8TuhxshWLBho+0KQFPq29G3n8zgngLLpEAOwDc0L2VuWTURmzpFc+yaXg9rq+VCE1Thp
	ZBCFqGXTBEdV6wPh+O00OiOGoSQaLo4i/m+yglZmaq7MoBMcEmBGWsU/SIy4K8B9Is1hINwnS3d
	gAeAMvG1CsyJ1rVxIVYUrEigSwkWgdgpgq/AI3B6PsUBPDE64zdG+IMOQ0GwMtJ11cnsFg1JEJR
	3pQQ==
X-Received: by 2002:a17:90a:ec86:b0:3b3:ab75:c940 with SMTP id 98e67ed59e1d1-3b41c9b2ddamr4473434a91.18.1795220786299;
        Fri, 20 Nov 2026 16:26:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:25 -0800 (PST)
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
Subject: [PATCH v3 02/22] ARM: dts: BCM5301X: AC68U: specify switch
Date: Fri, 20 Nov 2026 16:25:42 -0800
Message-ID: <20261121002603.25254-3-rosenp@gmail.com>
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
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 6e82d2af9f1c..0f369c5d6a5c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -97,3 +97,40 @@ &gmac2 {
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

