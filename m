Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780922;
	b=ZH17xHTmm22wx9yWxU+eCfeuK4AURTPnly9lZQIUxJHLr/K8jIsHOAP4YCBzwGREd+9O
	 /1geSTooE80F6mHdra/CGHuQe8wmYFUHQEo7EX4NWDUkiv6unYhkuIAaBXJYDLrqCO/Yc
	 B1KZnBw3LsEuVUcoNK44BjERa4UV1g8GaKyv9s6HZf81hkxUa6laa6JVC+r9/SCoeIkFM
	 dLINUPPKQ1mHExdfwYYs6DW+jweCJq5kLuTyiOoUzGJa4Bag5ha7faLF/3gJ4A22214Tx
	 7ZZjyihIfe81blG1/lFo+Af13yl81eU6Wn8CYvtRXFAW6JJGGsRe/ZOB5zAWs51aKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
	b=YpRmk3yzFJJQHb3xCysw0b87yTTq8WFd2G4jtck1NCd9jYKBkI4lue9B+cqUTc17Bmgq
	 AofhOHkUUAYHsSV4dJ6ZXRb/bwDuwCuUyouMYi4Rr0xm7bWgytvIxnQmp4GhLNyPuszAK
	 qJG4mI9bhtmAZNFJN2ZiHveGAsI033HlOj9bZ/rdkvMps6TWi0c+2RCaWl9cTlBvGadyO
	 GSld9nwxRtK78sayMFqVZrzbcI0xG5yo8C0SRj53+vXQF8t+cJAoJ5wwI7YcihBjFWwJ8
	 BqVmJ9Vze38VAtd1M3CjPd8bztLrY3JM3qtuzZwM+A3ZmjKCjcT94Qumwh3lsdghQpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVbMeUKJ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492AE606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492AE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVbMeUKJ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4599884f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780921; x=1796385721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=wVbMeUKJKrlsDR8fjY+qRr47vkVur6UIyLrXaCQ190chnkWZEtHUHx+oLMUJDAIloL
         72AKH+eD1I0e5fIJW0VAiqIC4l1CfmcC09dpVnZW74kqiwsHtFWqtIaLIuv0XEu0iadI
         n5hCY216rCsSuIMOBRPuRfL8F4DN729jtI2gTwBZMuFAsgayhBnq+TZeTlZt04E5swm5
         J/44+VZiIjo+j5izaQpSrGLZv4Bk+ueZWFDZPHQqA54JecZkoPZwUNsy035aIBqj+IBV
         1eC/uKlk5L1TC8S1tb1JQt/Sm7OxiT9hFya35wy2QQEZz1+JzLUyJ55NT0bbur4AkTCR
         CT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780921; x=1796385721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=jEmjVqg+xOgGsgbBw+EpsuwZIIdjvoPGBAJYEorkoOdeUNh3P57c7Z5Cm/40NI4T4g
         ZwJW89xhITOHiNJAqmryL4b7/anOikvEhdOs9suQvZjyFjHImjMMIMwtCucsgQhW45Is
         v0oC56CDzQ4zoOyPDOJeZMSsxhz3H9yhB7qEqrt7NLIMoR8NQQkxOrZNkQnjEyPGayXc
         qp7yP8RN+MHuQkqRvuTBcOQyk1FXkx+GC2uKzKKor2RSoiBD3e1vsMTc7fmV82g1smZ1
         nWipP316fk87wJqgj/c1k0DfhuiPAzaLZZ+599k/0Ty3wMFYFrKTAYgwJ+Xf0gMNMj1W
         QI2g==
X-Forwarded-Encrypted: i=1; AL+hErHV1x+EtEXz1tGGRmFvVBUw7zRSljyMmsX4fTwA5DV4rUhCQrp0yn6wOiulBi2y3O/8liHYqCIn9Qpj@vger.kernel.org
X-Gm-Message-State: APuU4Z/13kc4gITarDeATEvj0mgZKxQLB4i00Uv+6FvqLjHCsOCluycX
	QWtOhdmXfuzaStOmvTfUFdWVzg/Zlpf7CtHL5I3bV6pr2NNAOR4VHE3C
X-Gm-Gg: AZFdTZd2WnLdc2wyrhmlJHAWi76OnF5Nhz3MGkFptkBdEAssjpr5XJyKML0c+5urmyR
	RWfvR7i4ExxXygjNP6054cCaER5zvcdGpnQiqCmaKsNI+5WzAZG19K3isGDzBKwruSNNUpK6yxG
	TNeOo7lQnw3muu44G1oj6iNFOzA++JX8rwwUHSshCJBnJfrZJriceo5qnhs3MjgrTJDsUn071BX
	pMhTSKVf0uJVmHGPUQXUkJ0nlqCjmhFWkQqcC381N5Aq0Yz2JS3dRYWtUd4N+6S054ka6xkcwaj
	ot1UrrM7Y/DvZ+oKNb4IPBv8R86tPrumABXU0ViS4Dr+dm4jSu7WJwbFK2Yk4XIVuGCvOyeYoWv
	4ZpJDCmFXp/99Q/WLD4woXajdEy8uCFcnUiTSooQPVmoEzcXWQUQBmR4dLPFL9LXrb7wpLCxO5Z
	nczMbV/n0dY6wKekysxvw4M388WoRZu+9AWKIFisZRs1tgda2bIe309dclfjsSLZUIpTpkmVZQB
	Wl07eDvEHx2sw1cIhpnMfeOnVt1HSdJDYyyOKDW0eiUBXu1gSFemvATnsr6nKwCsI4WKqjKDwcr
	d9XmuD7Bi/XnLvLbLgbZX/YPBy0YQse3uqt4cEieSDoJamw=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353987715e9.10.1795780920450;
        Fri, 27 Nov 2026 04:02:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 22/30] arm64: dts: amlogic: a1: add crypto node
Date: Fri, 27 Nov 2026 13:00:55 +0100
Message-ID: <20261127120103.1532882-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..396260b7b398 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -686,6 +686,14 @@ sd_emmc: mmc@10000 {
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
 				assigned-clock-rates = <24000000>;
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -767,4 +775,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.47.3

