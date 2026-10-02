Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1F39A073
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965138; cv=none; b=CjBWlwvTvbj4oD41q50zwwlT2lvWUaidncv4mFMAFkFOUfZE7qPs5lercqtZlsHpq9uTYi6gUnfVB9oR+an+xkpXPOS7e9GCxnPjj5OUyBIstjRokcc7gQzDHwH5iAjXfvsSB0UAKZpN4zRm6fZo4lHT5Lrye36h5eMY1idf07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965138; c=relaxed/simple;
	bh=xxjspIqmx+CpULEpM4hqjXrOZ9/SSoODxlcNQ+6Tp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ov9+9KWBGvHn+ukNV8CPEVdXYXJlWqmSdspOkRRlYqKdBYi2zYOzUVHs0UC3zGaSgowdSkEZF2Bd2OgRGyd0U2ccJsyg/aHobLnHBuUwidCCDavHvqKFuXAVl1Pb5cFIfKbBzK4b+0+lk9pYqMqRHzUi3o5OF6KN9wfsyNrJlRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xc4eG+pT; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xc4eG+pT"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93ca4dd64a6so22324785a.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790965133; x=1791569933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdYgs3CqbUtHm8RpvjRA9eQJchSjfk11RvrZH/hrmmc=;
        b=Xc4eG+pTRyNj0/77dvvO7G1GRgOtknJxhKpk0H1k7A6hIkji8ss6fvCbiv1/aujwK6
         ae6oAt5XgNfu5zugRJB8vLqzZ046/LDjGCGWWuwaHAAqtlowvs2qk8YUvUTMmtQ/RbuA
         GVy/WIKn7ykh35Wv/7zj77BtWKbLgOonbDkd/JmfzQkpgjK04tPZjLqimYNtUg/Jqq0S
         MjTMV0eJLPBFTXCtKdKVFR9l4xmzBHqM7b2v3MCULgIi5P0TEPrmo+/dThdFKmPGDVOM
         dVceqPkeFRMsP+6sRACTM+6Q8y/tEt5T1boUJcown3P2ixhPrTBi6FaUAASBZofcTpsE
         QUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965133; x=1791569933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdYgs3CqbUtHm8RpvjRA9eQJchSjfk11RvrZH/hrmmc=;
        b=Xun0PnGWK4VKa+ji3XwmAnpw2pYizts1crBmohn2/7Gu3iDEGmDrkP6MGrz/7Xwvtu
         mLEeLmJbSNcMRWypLrfE25F4C8T8AhsW9DsZi9oFvB7TIIp6a8NmLKD3PNdLFfXNjFAh
         cquTnKFFSJlwOA863zitfC8UU/HdCj7hSKNt2Osi58pDSaiGsvC0yHOjNrRkB58BNidx
         cS5ToSUSVbFx0rR/cwL/DhO2j+o5oWkcxIwzyR7Z4dw9hUVuqjHqqZ7FuEVtLmYtP3s5
         4YLOSpMONBCLFAvRC/yc3nQa+syo/8tLWKpPdnYhDJoee7YuNCYiV9vBKCaevbDrliYF
         3BqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmrNF4+FSHuroLQkUr/b/+qsV95ks4nWDk2a+uUHJXqaiBFC2+Oq7ltzJu9B5XeKayG/EjGkzRXc9s@vger.kernel.org
X-Gm-Message-State: AFuF++m9IkejiIhVz12YT4iZKNXpT7Rw8dsi2CwGVHva+oFXTva+AySj
	2pqwwOSApXkOpXIrD55ME1CgO1anGKftzWZQty3xuVhqS6eRouITn/gF1pZ4IFwEZrdFqpssNTr
	v/6eeiB4=
X-Gm-Gg: AYBFou3QmzrSzqM1gBQseRtfMdA76FApU5OSVGXdak7sD7GPvshZjm/hOwz9cWQQE64
	dLGx69XR22EtOvgzr8F9y6FCnDv8I3ANFBtUoYrHSEu9h6zXXGq/LnVqw6S5W09mY+evw3woesC
	TGqNKO2a4V3l9UwZm3J2rk99KD156lV9HJmbeaCfjPDmwJ1wcLPRbk4sgQEnolMbJZ1Cp40bL9J
	/9Fvi/643J9vgwyUI2Y7mccPcr1GX83lKxBGI9qzRGG43nhNUqM20C0fd/WO5PyOYLsoJbAsnOL
	3J1Hd3DJvAkccL9YX/eBz8jkOuMm5cD/lE/Kt+JlhfZN/FWPtaT7IJDugcaCE4q1UdQG7YK7bvK
	ihUNkAxeCH7cu/SDSwlHOAVyC4rFt6hPch+WqvwIyAQKuFwAtXtI9V9SNqu2THeLg3Rr7z8xYgb
	nTLGlU9/Q6pEC7JVh5m6cmF+ctAX8IemGOQxOLGczB1O9OImJTR6YJw6PQJ7bxAh4yqCGx3UB7H
	S3L
X-Received: by 2002:a05:620a:290a:b0:93a:2e8:5aff with SMTP id af79cd13be357-93e50f8199dmr34926885a.21.1790965133295;
        Fri, 02 Oct 2026 11:18:53 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca280e59sm286107585a.35.2026.10.02.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:18:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	abelvesa@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Fri,  2 Oct 2026 13:18:48 -0500
Message-ID: <20261002181849.790275-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC incorporates a PCIe switch, which is connected via
the second PCI segment (0001) on the RB3gen2 platform.  The third
downstream port of that switch (pcie@3,0) has an embedded PCIe
endpoint that implements two PCIe functions.  The SoC implements
other peripherals, and they will be accessed via PCI endpoint bus.

Record the PCI VID/PID compatible string for the embedded PCI functions
attached to the third downstream switch port.  Define the pci-ep-bus
sub-nodes for each, along with the #address-cells, #size-cells, and
ranges properties for both the endpoint and its pci-ep-bus node.

For PCI endpoint bus, a PCI function's ranges property will be updated
dynamically to incorporate the address ranges assigned to each BAR
during PCI enumeration.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---

			===== PLEASE NOTE =====

A version of this patch was previously included in this series:
  https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/
The first two patches in that series are now in char-misc-next

This patch must go through the Qualcomm tree.  However for this to
function correctly, it depends on this code getting merged:
  https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/

I sent this message today to clear up any ambiguity about whether/when
this patch should be merged (probably not yet).

					-Alex

			=======================

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..0e3bbdaf4661f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,35 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;	/* This will be updated dynamically */
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 
 			dev@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;	/* This will be updated dynamically */
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 		};
 	};

base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
-- 
2.53.0

