Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721621;
	b=FDo05RD0eAXs3TTnvIgK6I9bmJgvMdVUS9lbvnX5resm26N2fzBtrI2d2fNU/A2tP+N/
	 HsPIbBP4StQjYoiBZqXdb6Ol7KPjtwiXvx3XN2jrTLimFhFWvQVVQLEHLrAcmoUFPo1sT
	 WdnVepRUOFp8hQ9B+aP5Y9HWESU/YoM2CBUjtNBBi0WEOKKQpnK2qUFr+8TpB2/xc3dHS
	 wtk7fiI1ov/u7xi91jQI6/45bceKfW+qfnaa/Ir8pi7+5fagG3aihuDXHK/9gI1lhM2bb
	 N4vKCJRiyY8Qd8kNwkV2pOyPh3lLHVCzw/G2Zlaq+8FGt2lHQd0wser1qSKSnPBfIBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
	b=gndkUSOnpcJncWEJPE1M/eyK+M5j77rJwjkcv+4CO+yCcczZIo101rJsLnVYfrQMmC2D
	 DTEMAmvAFQQ0rYeD7mqg4lLqPfRMeXBbsT1f48LcBQWpQk5uQsuZCD1wEB3WblvjGOk6A
	 +DgE/J+tOLLltWiRVg4XQmILQLsZlLrWINgKSyo/boKMnY7h/XOsd7S8f+t1ByEZxmlVp
	 ajlvCzi34hOUnIL9IkT6fHDH2dY+dthi1XETne4/zEyK6lAA/znUpVAbYEs3UIIbQ1ANA
	 nqfFMhK0FafpOEZ/R6qd4U8Y4mV0DPQduhaTmuMpi/FlFW4nV/pb5G5Ksm39F76cgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXZjYF68;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCD606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BCD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PXZjYF68
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so61538125e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721620; x=1796326420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=PXZjYF681Cys0iH8L+l1VkG6kxpmZ6t0xFDNGqmNd3kTah8MRTqPQwu87CDNYTNq8X
         Na+tfqFFGx/NQwh0dF6LWnFS1zRL3TBhIL7ob0x0kDqR3cN2C0hlpDDDgVT/oQQQb8rx
         tADfD5t+MzSfEko9WB060ZzGSMsgomJoKwRnx7zPAmtALai2ezo3a9ef62Sazg92o0VK
         oV0QWn8gDczPcSjskKSJNST9ch4nbURhKcBSAy5xWjqBJ4cHVN+r4UtSt30UejxTbg67
         y+pRkpxhrA3KnyYiyTKyulMtRNDXlJ95HSWsXEELmF6afYZsQ9ABIpY07N7FGH3Tz1XS
         57ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721620; x=1796326420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=ep/HnFaE4W+8lERlXZ7bpa5z4VdwaLwKXOVF1uPGg+wf3zFKlulT1vFqvHggjt4znf
         X7Y8wWrvU5NRoHtArF97zjuryd8pa/wvqVRuoo+VoRtQH7gjeDaPfjjprqvKUmjXgUl5
         XGAaeXABqaos8t18NMIgM8ixheCkAJZ9A7LG9nQP5/+Ake8tDvmDrp+Q4kNSyq/d1Ghi
         YhyfKau9aik7K43DPrtVActBj7viKQZDP9B52ma+uZ5vvLjzlZESKDR5bVY4Eg3s/vRd
         faJIKi8+Oe+xp3pOKDuDmAxdXv2h2IwBJveJidxNjW7uiFcFhPiZFHryPAQTGLEEMFQK
         7Cnw==
X-Forwarded-Encrypted: i=1; AL+hErFuGmXFN/w1k6fOHNqnnsT/+Oev3H4W6IqzR161oNOYJDs9P3D31sQ34ZVWrO40rCeeDH6LNnd6hOea@vger.kernel.org
X-Gm-Message-State: APuU4Z/G70JkTtSsu6rBSyA46iMlaz9QzwV8MTvaz83aF/cIFzk/urXZ
	/PyzOdmcwvrY0f8PW5NQDzG0yX1ZELlyEQvMNcH3E5jgYSERM00WSa4U
X-Gm-Gg: AZFdTZeaoEXZ9GFTEwfPIGOLDMF+PFyQRqnGEm5Bek4HRvWnf2IG+om8quGgQHpaSyL
	Fu+fWaBymPvu6PDsV0eVMJoummP6PfFR5dVN8BZgR1fhnjW//wJnh8Xo7RvnPQ6OvzigIhTdoXF
	Edhag0fEuonmYR7sFKl8YamWv+su7k2ODRpB5tKa6ZuR+xTkmZfanvsfXaCtoDI/z1taxXg/p9+
	wZUj8fhv07I0+4sS/j4hDcrNUPrWUxKAMc/6IyslZd6T9o3AKbkWRkgKaO9sqdMjiyyo/R8v5GZ
	1cCGpuHyePkOvpAu7rGCMzcQ6gDPHkuuJBjNpBZ2Zue3MGa4Nfk0JkLMeLdHSdcfOmAqbgNA7CU
	3O8q8yUvqV0n1r0raqkN4pou1n4UfxUxggKqSVcnTXFVbsK5pHMHA41crN9ZdjBx/p8DRHw4DBH
	Vl/i9R5H42wOJ0hTnSmIiRil11CuEJSrk8V6o6/rQfxAYhCkP+wo698vE9Quhwd2NIvUzodeOma
	ZiFfUP2fInZIN6V4/A5n9748X2P06eULir93uelRFoy7QN3qaURKloPU0hF3EsYngvg8ExzbP/+
	JmdjR3h1VLOBrXrBjBN49usDn98RERIBxMRDizuZBOeE0Dk=
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr474464105e9.30.1795721619820;
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
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
Subject: [PATCH v13 24/25] arm64: dts: amlogic: g12: add crypto node
Date: Thu, 26 Nov 2026 20:32:40 +0100
Message-ID: <20261126193241.1471372-25-jnieto.alaber@gmail.com>
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

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..df1383f86366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1742,6 +1742,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.47.3

