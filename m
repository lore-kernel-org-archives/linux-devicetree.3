Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618565;
	b=unOIHt5ArF+6NzwJUb5qEZpgz5wKlKcBBsJNjYmDdsKYymBk69k2wTo18lPCaGlgWDv9
	 87jB9qg2RcHMhxrO75zRSq9we8QpsUtDUIcM2l9V5MlW3SjWYwSginypGuq9P1zd7z0zu
	 WNq+XZO/cq7pJnu4K05QFTk/kuZjByqjKYFluouvK94fm2DMJlb+Xhdfww0KUAcixs3MS
	 EViTqhi4+uq2xenbNAwk7z5UDpA/KLo4LiD2JNrw+6gAOW+DIzbIsoqXWHv6LgXgRwqad
	 pZpe1/3pCb9RyWXuYR5bCVoT8ink7S4nhSNCLLfCuyJpgx6x4aYWv3tgYRV383l4aOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
	b=f/sx0pqXCbKPNCN6Wk5LZrsSyzR7UMpuQnPm3hyCRg9PY7D8iBZdTkTM8bouO3fgN3KW
	 cG1qCzvjj6tBPucBjpG1FHSZuTf38MLElym0TTh+gUJ/Et7ZmGM6Fwb2SQXiXpju2FCSr
	 IcdnhgNITNO4Rg9bET56JRxrmvXiH3C0lD3o5CYtPQfpYTCVYMc9684tZcT+JjOY0rV4e
	 sR/3fTTcwfK/YWEaYu6Jbt1eio3qGR19m2JSvese30zlOFZiTxIfoqt38RCtW6DobUgJT
	 4NagIH7hqR9MhBrmOkZTUr+Ig4+tvnmstLuC/bLFe3o+I7S51NmFdN2wv/qYqrU3CiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FobxV/cl";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A3606A33D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062A3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FobxV/cl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3100276f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618563; x=1796223363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=FobxV/clKloqO1UdxCrv3xpvWs6c5bg3St9Zcvhezhxh5WxrLqd51kvXcBRk9xsnru
         u0jnrpYyRqxAzbc5rbydfIWEbRafIhLTbZeVRoP8B0KIcE/32LogcZVTLQrgVTKKYqYT
         4/FUQvJgAOXhNzVXT5JiZsZfr1bdSon44rBRtzTMlb+EGV7qLDTvEhDRbIs1l8Kx9e7z
         tp0u/OCpRwBPV5A+4k7AMj65FGdxKdXxz4qiO5tkBlyKnzrKm8fXqx+bDULRIz7n8/F0
         GO0GO7qfAGPv0SiGGZAl7anlDx4cfHyz2GYl0sbXT80n+Tu0OhYrTIjvhz5SCm5KbMil
         O9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618563; x=1796223363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=TleHz1HTQvkxR+JO6sXpmGd/TW9uzoCTekAbhqpRn30+UAD/MpcOPvBKIF2HCeXvhN
         GdmryA1/ZQ+PGrslDCVGjXIo9sGq25ieiU0F/JnXeBOwE2GRlnrsaDUpRDCVtp8Xv632
         O8EvvTUhDZ14+5rMi194rHdbpvhINDFsYgIoYdkjwVlBYh/OvORR/acDSf54g/hFkkes
         Vb1HNgT49xmhLbf7IkSV2dLhJKCCGCOvWr2pnpr9mrGujbi5/HHDyWAvaaLEE3nxN65y
         9JHejRBSkwcMmBhU9S1F/juQrO+ObajKgM3vupUI145EUuRJrf07/cOSvvWdcuZRGCT7
         v4YA==
X-Forwarded-Encrypted: i=1; AL+hErGjqcOn4X843nMKK4z4tYoIyKi+Co8fP9/6DrAoYVpsKzoKAqRf8tDnx26BCw+MBfn7+nPc37tBKjwZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8kLcXdaZYIUsui4ECSlPrH4a1oKaAq+VjB2UZ3I8U3Ns9SQuob
	vVkyNF7qDAWNfIuXI6QAFsMhxF0GRWBO0qYy/oVewJU1H39l4sGPiXyt
X-Gm-Gg: AZFdTZftOB9F5aib1G3RF9L/hUfO78fzu3umDKsQ2qpU7j9cODIevp2LBmgOFkdRjD1
	wKvVWnH771uPumDYZrGD9dFzCau3AcXyAM7Fh3ZBVgnIA7GhEEBgVqpxtlDw7R4oJAx0PdTYkHE
	6Si8MRoh1DmMhtZESgseBvRYgvO+XrrMawhFg+6Z5V99gkkCPJMxScACuNS8emu7Q73FsgtHNth
	lm7cwaaauJpk0Lur0D4DFEopkgo4q8SfnkRpv0wiGGH+YNuV2zg0cr6LHmmCRdS3wIHPNJNVEwV
	tv6ankSVqwt1AxwK3LlaRucKeyITFlnFiKi8XPnBjI94o5QqSy9CKf0g0TYCHbcP2R5axgclpcJ
	lCyvwFYHKwBvmRTeJpbvzcg83eMrEyTaACPllTUvasIRyuqsmqIVB6zUOLx2z3mc+GoxSXtUzgn
	swzlXLK/qOu4v7NUBWxfzneUv2aDPH93vSfGc2PfdczGGpDLcIrtuI0SyQmKeMrlwmw2gvC2jFF
	CHao1PP79+oGF3qMuB3y96KeXW+ST2UJcmWfO+WkK6F7tEl0oCsqizImX5VkSjC000q+4AD2q7n
	i9Ks/axvHXzwq44qNdSKr1i1QmFghT2mzYgzRa/lTyF3vAbRWOdRwLwWtApj8dlmQA4ugDEWjmU
	eEmF9/Qze6YaW995X9nYQnnRtFE1ywJHOGg==
X-Received: by 2002:a05:6000:2902:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4b58a524c2fmr17778122f8f.13.1795618563291;
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:52 +0100
Message-ID: <20261125145458.2594179-2-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Add Reviewed-by: tag

Changes in v3:
 - None

 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy
-- 
2.56.1

