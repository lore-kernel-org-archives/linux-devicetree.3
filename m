Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7573CB54F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217442; cv=none; b=jpA0yTJBrnd4vHsRUaggb6H1E7sf9yjXF+KJm33B19cett06lGxN0/e/N240o4YVF3Qha4xNYim9CTjD8pdZhfn7mz68UGoJNOdE0qiOdUu8qCNzrj7WtbD44XWI51ZBmF7UcSZuZIFKxjRQU/e1/qHoGhen7NfUexxt7T6qKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217442; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nfqa5MYg35VsYdGcUhFxfY0FyPV4FAY2k5NV3G47nq+IXBEafRvlQ6Vsq2Q+uU1t1ONvOYTTjDtr89Y3Rt1eZ9QgOTC0D7J2oXoQgaUGvRRAcf7PuLvsFmioSfO4oIMMqlfVw/cGj6fbdeuiqsawY9s6um6sw7Sktp2WBl2oL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=PpzT2ciV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PpzT2ciV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1139151f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217438; x=1787822238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=PpzT2ciVGkQUfaksdl9pXHJyQX3QoQPzJcaNrQwiUfAqcT5lJgsD0nmsmYBnvs51lG
         9IQVKsPB6bUX99XTNFRxTMD/GenLDDKvs8u+p0oZb22BHCs+UZZrJZPNfc0ZoSQMFpAO
         sUzFiv72CMphuJbXf15AKwgj8uFG6iV1f0Jk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217438; x=1787822238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=BWtODAjXdgovOCgk0BAcabG8aBHlzjhvgV1sW2CDOxjJxfzJNEBBbzSZWWBCrK4vkI
         3sf/y7ral7iEa19syNYhvEmJLHXNgBVCNMbY6b8uPfH9fW0OIWyGtXTYP7yVEvzxJrhL
         fphnlqZHwdiWjiVWWmUc4CwUujeT87eh+PJBPfzPiwSYZSDJEVFUYTqW6AkVXQ7zAEHm
         QBsiF9Gqo3UGc8YmVcfEnVXPyw7IVU7YO1sEIaSv8WgwyLuHlevg+qBzACduG8ODS8AE
         kaghBdcAhIxlfgxpR2mG3d7v5C9mrhUHMI6uGqw/isdVbhV8+2zv5VN2nqit3nbdJR8b
         FzRA==
X-Forwarded-Encrypted: i=1; AHgh+Ro02wJYQzGrCtoDe07jarGJbZPPzA4G9t/aBOgJOVxoCCFf8dU+BlcYjPZH54MtQETL3H/f3oWGiGUY@vger.kernel.org
X-Gm-Message-State: AFuF++l5vVTOBBCNJsoS652gLwW3G4l2peNehRZtVez55IeHSxsKrvOv
	DqwxLzlh5xo9h0iSGcOdqSGNRWqQ2S8pugGM8qRV/nVUOE0ovNzJiEZYZIvnozPhOi8=
X-Gm-Gg: AR+sD13iCujjuda3w+1eCruYXilXACqQ3f8I8QInQRtTQhAkvnFCZHtFU5PaLkfmAzf
	LSk9KN5PWCkI1mVB8+MikqJCc4qAMgAmuUh2hWv29YURDSEb2r2F5K74LjY6OYmFPtdpjtnkKeS
	o2MF42e6dm65ZNfcGivlMaOUjmfHiv54TNepkl8D3ANCxsZdmM2+B7UC4mvuRj0/GQoBSWiyYSQ
	rz91ERU6luUzoB6Weya9XCyM8j0LCi4fhr8BNsyjKPLI0ETBP04oov/BXC5iUpbGvgmVefxgLdP
	D361/1KZwx2Yg0y+YP0IWs+t7Y8Bd0uYqNFAsgcRuNCWbkZdm+RMnelBlSAwT2NIV1jnpIR42/g
	s9tQyiiyxh2ee+rC002s6kbleiJBV9/Ua6G7G/bdG+LCTyh60fbTl6Z23xCRhyReAh+Yt7sjIpL
	0BoqWdZO2TRLCjt5SqSrvZLTmnRJKLVSxQ/hnmzeRIyotC/+cbVQMnTAFsPBpeLo1UT6e2A1n6q
	N63ZhqU1ucTLsCfvRnqcr4GpDm2bVtr3zxbjKYZoUjxRjFZuWc204oeJQ27N+56FCtc03THMWaA
	+w7Qgu8SCIg/v47p6zKJVtx3qWkGjwIAflz7rL2pZhaY3VG8HEdqGqKvXlEowg==
X-Received: by 2002:a5d:5e91:0:b0:47f:7b75:9dfe with SMTP id ffacd0b85a97d-482b1e958ddmr19929009f8f.8.1787217438610;
        Thu, 20 Aug 2026 02:17:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Thu, 20 Aug 2026 11:12:13 +0200
Message-ID: <20260820091652.43541-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v2)

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

