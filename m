Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9683F6C26
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066044; cv=none; b=HGXzBiq6I56q5Dzz0nx7S9Pn7TWPy8IlGUwCIgO7yO3+BgbhxGMIIXEgluHFFuGPB4mMb/shDt1yD02UbnZ8Nw5KR0YIXF1FlxIJZkYnq6skSjtXwvoMFROjRmEXHaLFQSkPpHbZzGnX6/DjjG/gyFfwvI/Si4FPoIkoeF2jYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066044; c=relaxed/simple;
	bh=tmdvYiMZ7GnVIbQ5+KTzb1U8qAylpJyXl/+ThGzslhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gK3mNiUuTbyWooqla+sbmpUQa/Hvm0KtYQI8rLGY+JuldIhuKISAfM8Nc7+TNasisgFtwd2R26Vt8ZUeRi89Qk0i5v0IwlCRkzZxkECFKZi69s6yTrcUyX9peShf99WkW9JSZA8mBHKmjx+BgOQVBaXoNIslSWyvwy4d3QO3e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WKzz3PQN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WKzz3PQN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso83524375e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066041; x=1780670841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
        b=WKzz3PQNz1FvzRDiGakXXLimu7yGsl8u11XI+qnAobmW1+z6fRtdEWhwBpUNme6dB5
         Sj7Oq6u9h4BLa4F6RpQWNlx1qP4sYGKeVZd0ERkuN7081eFPZHKSXgH8y6km2PwvXb0J
         ip10BnguAU1rNCwLD/G34Sdo2n9i6ynpODT+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066041; x=1780670841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
        b=POlI/vxWvPVmYMmE4BVwGbC4E7Xx7MRhaXq8r5unqh46t10im/+mGnMQQkp/taOCu9
         LTx0oKMLm8l8vGDUaudQ32SIHi8csJbLIrOmhN6E8RWBwIrwahRQLKy8EqX8ePfjBs4C
         N5p1ACF9ANXSyP28S8rWgAolYCQ0PZOs1udlTNR9rwIj89RMyR/HLmjDLzRw/IISlKWr
         KnkP+3UefH91xQMqHNthTZRsaFWoVKWN+0Vhc61g5JWNlJQSF+PyfOLkSdhEy/Fy5Zg8
         gmYzblBSm4LHgvOx7fKI1biqXqdR+M4bUE00ZKRwSK+BNBtqROkx7G3ESagwq0GE7/s6
         qLzg==
X-Forwarded-Encrypted: i=1; AFNElJ/NXB7HWcrqlQZjmzZN9CFzNuVyE5VuatPyD+53RsapO05CHed9SfCnFAmgEFDF2Ufd6Cso7WcRVtqs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80VJTOh393XK51YXTZgOJJc7TDWarvQ0HGP1Rbn3Rbb2nFhUk
	LwH7VIkrQr7a24sHOc08KFe8eFuYu/ppUzN67twUr4c/oSsj/JSiQAqTialJgrV0oLA=
X-Gm-Gg: Acq92OGd08pQ2ATjqDUrEuuEEuUic08XjuzdvDzXAQKR1H7dBB2uHCCVgSnLsJ9Rv9J
	cWEdjsp/z8DoEYTBQNF/TYA8t8PmN7b9RnnQ9NmYiOsh3aTqNqXe+QM6EIqZezAtMYT4lz3lCJ2
	hwBCN82jI/XGiG3bD6nVcW4M4wT1Ob4rVN6tSkWX7ddo5SUMuA6czsVPbie4G5Sud2cJrw872V/
	kR2jLJVDUiWmWP+Yvgt3aHWlcX9qvQ7ljkvf37yQZwANYi0IvojPNtbcbI0Bj0YTjK2w+Y2c87O
	CMI1VGq73YqVFsMOB/M9BuzXFQNeYPGTxGc9cvc3Bz5kS/mEAk9qezmgySEjb8tUpydKVvKDHHf
	4MK6C2q67+MiN4Q0FgK6h9C509SRh+dH5XStBtUf2/zrKHFGQStXtEzbX2GJ3EK0YwTSEqxqFhF
	e/Y0aJsdGaTaGaY9wjkoePOCOLTnAl8j7FT/R3yDlfsi21Pai+pG8ESGghL/xjITKfarJRHBiT1
	TqMSL5P25EEeZbxvnfQ7LrtBMXNc/d/xRoinXuG/bvcTUqtKp+Ihskj5Yk=
X-Received: by 2002:a05:600c:4fd1:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-4909c0f9b76mr53522495e9.32.1780066041037;
        Fri, 29 May 2026 07:47:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 03/15] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri, 29 May 2026 16:46:17 +0200
Message-ID: <20260529144707.3931919-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

