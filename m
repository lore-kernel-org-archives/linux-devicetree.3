Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721616;
	b=AK4+MrRX8I4LygcHW1wk+8JRV8U2cdHtXUG+VYhLvrWGtAtwS4rBU2uhDxj+2N5DLIlv
	 g5riww3eCrvxxMSrjnF87fuye+jQ+8WAxyrdpyBQjEY1TbwQOoCW4/ZoatRZsWRJv7LsZ
	 T0CBoLfT/W56EDpY4LNY8OLUSWQ+s3kkyM/fatQ3lFgjiaqamIduHC0wMfiKrL0o4VqlH
	 m1onPOD3dD1TkmMyYv1Jt2q+ccximgp68H1vJX0+d8GHFB4Im4y80arO4AOyIMoiJW1Rw
	 RbC7pnW6R/9tnEhfajJv3Lob/MXvGvGE9+8iqQ7gBlRIuMU1EWpTS1JgYecttnOHr3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
	b=5CNqFJr6+Gf6qtGMBCz5lOkc6P/YqivJ4MzOD4/M5pxNmPwMppu3+aCWq6FXFKZ/HVd8
	 SQorJzJyxSILYi1H0txNKinmZzKS0RxrjCB6UVcJnDzZWmIP2qETLZZPu5cb5U58si+WX
	 G9PbIJU/cAVWu7cA/c3ntMkV1ifFVgg96GUcTh7Q5/IeN1uKCHGCbcUwOMC/h8QZAwkau
	 00ZVYnfWyPYowUHGgKhZdo6vkSZyB17pmwK7GTbTa1HwJ4DuG4KoYDl9dgtsPBUp5YSPD
	 EhC9H8nSzmEHxIt2KCM6LRiwYZALAb6u5Y4dgaax50q5w2016AbpbWiAhLlNGfLxfaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySuqqjZj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1959606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1959606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySuqqjZj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so6885890f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721614; x=1796326414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=ySuqqjZjZ9WVNDz2VrYAP5v7NKHGZc7h/6bDIXIwGx+NLxILQ3/JWU+a0vTved9rwx
         edhTzXLbcE4bVj+QEKMhwmBzY4WfLeGyjDk7TEiNhyAGnHO79UNwTKOgXsdxr2nRxkF5
         1QiSZiOAClJOsO511K9mER1Vy6dhA7ngw9HGEzbS9kVZVEOWNH9+Xu9EVeT6VfFw7jQP
         8M+j9Pyhu0AfgJSlspeik+SDiYCPZDzgl/bnB+PvZ/E6AehD9jHkPEZdu2/xP08lp5xd
         bxFVi2NxK51Auv49SDeb01PpPtsfP4WGVx0+3d4qm5jNK2z7/Dfyf+IIF61Y3InbSJIe
         s+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721614; x=1796326414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=1ywbQlnevvPe7/6my/auwsT3bjVFU+V7+TLjCkHoyvgXCRQZ/QGp1zWSCr6gMx/Ghh
         Igtf0M5AdwqNN5cr3Wh18JBi6UlI9ZjvJlAyYOiyYClQ4+R0TWeT8svONBkLYJdWxkPA
         ImxwWd25wxoM8tcb2wlZhdNt/Wx5K61h/sPtqp73Yfo0xU34LONo3Q6xIcYCt+ujnJkQ
         NljeNNtvS0+XIVGMhj1zKIB2P2arNyZw5PqdAahP2P7G0aufM/AER4GyzPEpWnYuJIzn
         G7YYZxI9+IUw0lzhfeW9vwMPMqWiYE49JrqXuefzQDLsAC2blOUi1LQvDAXDDJgtSIwE
         JLTA==
X-Forwarded-Encrypted: i=1; AL+hErEV4GGwFfXPb6bw7BhiN3D+vRTUUiVEusWnqB8dXQJWx9fR1zP8Xu4v+oB1xAWz1pIVQTw+rRNNVCq3@vger.kernel.org
X-Gm-Message-State: APuU4Z97KYxm30Jt++fYrsSFbVrBJOES8BmgCtyB9WHAGMzAo3qzdALC
	I4UnJ2ocCvX5GVF23EoBrP3UDN5Jd8Nta6sYMM+HADmck5xqi7KYYTAM
X-Gm-Gg: AZFdTZcpTxrvdB+dylbdcUCCXT/J7LTuNp3daQw59iPHp39Df9a4ILMaRz58xQdfyLw
	t117MDZrm+xqRqFe3hnaZYZfPkeS6+7sZOonP08VOK57AsVtbMhj4fz3kbtCeMNVEkxJmLeuUVe
	arRFJOPPH+HgpqimMNqAB/vMlu3EfhExevMka28JS5gYlYaR1iETMNz3wwX6prDyWFw+8ZxRt/9
	FkDkDJznRBxxwpv0DrOb2NTHIHSake7PBdBMbyVqMnO5idGZv2cL+93g/vP/dgrxR2N2qZCi4rt
	86VSemLnpLEdQRyvVHvD7JSw0fYtlFuP7nohKbo/Sxr27E8f6K7s9v9EwKfBtl2TI4lmYH/Eufq
	Jo5A0+EVNMXc+h/L/JWZQkqiz4mBkq7SkrmWD0MwIURSRYfiOUOk6OssNuoCDzdcr4TsPkZFPQi
	LMaTaPw51vyFgcusigHP7T7XMcC2GDoO/9ujfKqB/Nq/4w2wcG8utSdugkMoxF5iSTglV7upfy9
	HX//zrzLbUWIf3CFCxt5ILlZe26AEaP8zmRqeRnG/EE8r6Ud+9Oaa9kMeH5M+doxkBC8XDHwDZZ
	PYk+xz6LOvYcLOmE/OME2Hf5xxv4dXs4wgIIT7fN6My82g==
X-Received: by 2002:a05:600c:c086:b0:4bb:a5e1:8288 with SMTP id 5b1f17b1804b1-4bba5e1b76amr99845895e9.6.1795721614313;
        Thu, 26 Nov 2026 11:33:34 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:33 -0800 (PST)
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
Subject: [PATCH v13 21/25] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Thu, 26 Nov 2026 20:32:37 +0100
Message-ID: <20261126193241.1471372-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3

