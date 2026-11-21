Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220812;
	b=SSES3AJ1zvw2K3gUxzgsgXwxNtVcYPIENmUCewyqe0wAJwxC16i0UB5BYSlnz/4p5lqC
	 h4TuwKDxJt5IyrrTxKTu9ax4P2paCC/IbwWL6jMxdVEw6hH0dMo1pOurSeliAK+SikBLa
	 bhgk4wZdvKsjkaaFoO8nsDKfDaQ7+bR9oo4V4PdSdpitN0gdmvDdFvKzxLAUtgj9VfvOT
	 dTovO49D8yCOxlo5/6n/Rl75+bDSWp3RVw9AC9OqVG9w785WpINJgn4X0g5QxUWYyzC2f
	 eXGuq3HKbnSg/sdYmBBzf/FhjOWCKDL3oYpluz5zSL/l8BR8P1Y/o+tc8L0faYQ/kgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
	b=OZgpe1oUwkFNrtxDhtAzX8sQIgnRCl/OTIZEbwtesjQ5mcYhLLTVbpUuNd3n0wMp0CL1
	 8+tDwKmrXz32xIR/2EEHt0DDf1NV2mTxP9y079PRF2hPMeCPUOIFI8bRQCl1tAw0CHze1
	 Y9OXpzdnw0Hg+8aUorqepmnKw8M6NH7rfmuagRAUZwK1USyQADxlhEDlC7VOIpDh4m3mC
	 +i5d/TUUv+7r07YlA0tmibYHwPOGfLQ3qLQCOkHvPxGV4dEy1yelUREnrgV5bbr4rkzKH
	 ydBx13La0pCdizmoFlTExPq+0oouhydeaSZT69X1zRWMTE/oNkypix17DkoGYOKhfrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjrtCJRh;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DA606A6AE
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093DA606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjrtCJRh
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b6b22be970so645415b3a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220801; x=1795825601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=yjrtCJRhHNttLgx1TYPSr8lroqWfPXBacKZHPDRdzhgmN7mCdPxI3PzzZJSl9zzd+c
         nPncbKAqmd4UbbBgXZ0ER6N+CCcf/H96KidtAwtfeRH/cNeYKUk45kfvKYOJEBxT4HzC
         TCkYBON9EylYBxLMOvd99xeu6wwB78YgygzKh4VJToM2oT5aPLSXBYvmequuYAS8+AnW
         7rEbXCjIzFsA8s/2HXPAl1syvb21YoEWmkjyS4HhC2Aos8tHNhgeMRyq7rLDp8UIT5x3
         jtKfZKKWgiJ+KLK0S5uZ1VHredfxfW0Ta5zmQa3dquMpypKkDNN9VPip4yeUdOxK0Ux0
         pN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220801; x=1795825601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=mRxI5SRajQ9jUtdFBok1UVJtkPhLnmguiImL/a5bdR+rSstQ164hjFMCgUuSmQVLJ4
         I9Yf56LhSgfnVcSK55gsEhXjk38UksjE5P5Cc/sinHrOsDngk2YFQUUHxkHqi4TN2uNM
         VhZaQ3zKjTsTUZWxb7VIHEMhbfMZiiOst8p5m9jvwloSXRYU++aDBEYwiVLFwpklXRoj
         1ykKZnlRqdElMcZgiOvqvqkllgW0nDqfq1x6KrrWsjyCq6Yerp9ZwwTQgguu9qvOO3pK
         CG/kAdy1XxQHAQm0pVjaIL3jEx0oNPpN4FFuf37oh4iuhKD1B55SA0koRLqzSqgYxpOz
         xxHQ==
X-Forwarded-Encrypted: i=1; AL+hErEXQW7aGkuUYOr99CWSr3j+Rr2K3tSoImPSEsOVEWmFqqlYp1/nM6A4VLCL4c33ao17B/aE1oCbJ5Hy@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tew0Keuu9IscGfnOiLM14oicEIVnJk3HY3xwvxG6shDP4qyk4
	WKaWEqVzx2MMqIFuQxxd7Zl6mj3nAq+FF0Y5vvK5aTsag2O1HzxWCi6m
X-Gm-Gg: AYBFou1gqBPN4kPe+UjRQXeKSdFaARK0J5ojlGJBeZoXqrxBfv6W/UisoDbF/R55+XL
	PZzfsvnvpxl2x9Lub8ciIV1cspVStTbJ8izR7x3GJtABDI3rxmNpEGiIdp7TS/iBTnNPg4PCYN+
	fIEpqXsoOouWERcJBi5lpR/pIk240PJQ6P3Pfj67hAFCWddgPH8BvwZ4IS2IXXyHuPTXHsHtLgX
	eaadFzVzfGYWO5CozOXRHSIGB5mVyeaZYQpERbWGefSVMyvc/pJTtcuF9z7KZYOLP3SJllgfbQs
	RTUt7luejQJETm20VzSs4440rK0o8yb8vB3ofXOteiq2r1f90B2BCcFqKyxwznZ652VoPgJiI6b
	/0j01+vmXqaUxaEn+k8v2c1dI71dzzoU4Vabnij4UKuyrEYaRlUcOdGLUcZKXT/8eY7HCI89EyS
	I0M2DrqhC/p7PuZL4fnvO5lzYZpeIpvfxJ4tPbWyPgTMPb8kWUWmz2r8GuYl0EIOEz7sqGn0VbJ
	fxwvvRrgXnj6IBKJKbjtNEUyRDdPr4VvzfpEL0PyeW5mJZHqdiIoPAm1Hj4bAxLvMqBbn6MG1sN
	wtL3tlL9sHb+K2liT44bFOqycovUk6FcTHikYhxg2nSuFVLLP1pAnchRAXZhUf4+yQ5XJAIex7a
	MGE5XNY36Fbhp3Y3BEnDUjg87//ADQhIYnsBBK+Z/B0xYRo94cc/WdwRJwr/Efaa+2QEIM04gTY
	ay9A==
X-Received: by 2002:a05:6a20:9183:b0:3fa:db87:fc48 with SMTP id adf61e73a8af0-40146119185mr5378408637.0.1795220801265;
        Fri, 20 Nov 2026 16:26:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:40 -0800 (PST)
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
Subject: [PATCH v3 10/22] ARM: dts: BCM5301X: R6300 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:50 -0800
Message-ID: <20261121002603.25254-11-rosenp@gmail.com>
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
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 1b99fe442dda..2d7bbc4ded60 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -104,3 +104,40 @@ &gmac2 {
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

