Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780924;
	b=bBn3Mj2RJZ49UMWP+MRv5lXS1tsycrtHuAh/6Daw1uUyB8ApzcC+W7onfLtBTiqU4a6r
	 kdpnxVMIBscBfNpXU4gpn5O1m4cXeroj9ZiVDhmT7vGgmmXtyVomMdgSRdqr/DZzZx7tx
	 smPajte5l/IaH308MSmdW92JtcL7qjxfM4QBqdvXlHVbFVC2iZkq5S5JdNgyzGCRp7rOl
	 /gOKdqRdjHcc2HHtkPzZbWklVtEvtTf4kw5TcCnz8Za0U+33UTT8ho+ObfEHHILc7VENE
	 LOTUmO6SvYJJBNDyYVvm3C4/rKvjndwxAlIl2Fkq3XTgFOVuloLHzjilkQ5YeGvZfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
	b=4zMWQuWTeO6lISWPwtr4F5Liw5BSpKjG7glJ8da6YLkPlxRnAUeJxWq6l8oYYaIUiJLK
	 RQZpsf5f6fhraJfS0kNI0EQrDseeQRagbvFzjlo46EDyqQgqmcOA2gb7H4fOy4kSZyjl6
	 NacHOyAURMPus3J6dLHq+G9T9OW5ehmU5kyFMevYuqw5BlviLtCs3lwpna2ZHku2dJC66
	 llZn4eY/IDalzxUs/YrR/VHiB00Wdl7X+b5qG1qtWKYMmFW6qAcrOX+Z9dA8byvX0F1/T
	 LZa473wfq1cuZ8ysmnmmq1sdXKX30dCjkya3QucVK4pB4dwseCBt6oYajWyrtIiEHMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7kxU9AR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78413606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78413606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7kxU9AR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75481585e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780922; x=1796385722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=T7kxU9ARjFf1WbLVPz5TAmx7eLni0kTl1CysR6FYPmPTXQT4IgwjVK/lebHSlxX52d
         B8hxM/59QXcIzYDbgVc8Oxub1ibLay6RZqNsXDgkGOHtpw/dlDtF6vKNEddFtrLfMmBe
         armbz6xxNFfEITgIlucI5CCIIBO195Wm6am4vsX/+fb9VpltxUXsBIaMA96azmF0+QGr
         UoI8lIoymQKTRNTMGBlLxbtrW/Cvu/QwuiZkJCboz0jGZiGlwAxIcodyXDQg2gtpa23g
         /wuBOibh32pFKmsBEYjLMwUzKqHMe4lGh2s7Hdm+T4DYDTFxakukBR5QyV139L3icas6
         Fk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780922; x=1796385722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=tEiKE/nQTuISIBf4GP4VVT+bpcqSm2DTU6vZcTutM05ki3c00lJnKty8VJ7pMnqICf
         REY08ZR4Isn3W5NxJy0F1/JgNleQ9gvSLEWWPTMW40BxGIYtHD/ynl0mdRfi8goKfgWM
         lUkbgqIwBbbtbA2CF9CCuEa/ru1iJTjutXbgaS5liSOKn0RJUllptT31wk+WBoAVPSF7
         w+saCghc5Wdb7cV8jHPjxfydxaVDP/AG9ZkpLVn5v/ReB9LkACAtIh7QdDaD+8nFXBEl
         FqY79ZBIqOGDvP+l4fWf4dgKtZtTprAQR5ruZRcEeCQ+1+VM12TQ+I8ZmVIOyzUravRy
         dTMA==
X-Forwarded-Encrypted: i=1; AL+hErGtsA3joxlAcW+Tn5H9jXemQ01tlMeDWZ48MvtVl2nNKbMjZLz7WE+MRhUl7DGE0DSouWMteSffGnw+@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tiv8/D33Glj500zhCpTAyedHq61YOif2OqGCUnoHq9U9D7JMA
	BcmKN2fKvZaNBTFvW4+YfOwgOxdj8hrsfmql/zgDrCDkaoQLy4/v5qQ3
X-Gm-Gg: AZFdTZdiYngHf9mmnQJ5Al00fjUF0Z/FEKj7b4IXFWfpbfRAK7L+72AdCbA1oKEWzPh
	L4FI15FCPuy2y2DXlQVLzOGnm3+PXtpG9t/Q2JyfbJtbr5FxIgj07xA8FWQY+x9gCNb/SeLjFOL
	fe3yyEmjimNnLfu6ZKRA8GIYkPf+Ggg7XVfcJ55quyechQLbFOZ/vA5J83/zyOO/7H7PLQjXGqR
	YZMF97ZpWmOxqMTe230/b+eBpmc8nKfjWYLGXf/7p4W0DedwOWmlp60k3uqvK4QT/tSq2E1zTrY
	fI+d1vRqw3omfV25v4LxuU1vChJqpf/PDQlkzoLWzk79+mBaRtsfx806Tqij68fRtue70Sma56V
	5hdN6jI5EqQGCI3RL1XX6srNie+hoX7nvV+oTTg07j8PRFsWNSaey61fkaTMplfx/yPZxRG6fLu
	58pN+gnRiTbkjuIpmMQY61urYdepgLKhnDF3gZ3AAYeJcoq8Reb/wh7Xv8ggFnUmyVxiIKJ3jPQ
	QPgWkTHTJ8a8VFYEbdlFtiT3WtIkl8wLQFenXq3hDMEfasi1bVRvqelN04b2VU1HNaW2QB5vHda
	A+fBP8z11spo8yw/1A5ToZC8DFYunwmAChJ6zP7UGZZ6Qz7L
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr479327835e9.10.1795780921851;
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
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
Subject: [PATCH v14 23/30] arm64: dts: amlogic: s4: add crypto node
Date: Fri, 27 Nov 2026 13:00:56 +0100
Message-ID: <20261127120103.1532882-24-jnieto.alaber@gmail.com>
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

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..de173f40e15e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,6 +71,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -621,6 +627,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.47.3

