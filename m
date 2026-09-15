Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885F4BD7BA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495816; cv=none; b=MBD6zcBDy4t/dj9qQBOBISsUkkPTqNmrYv2LIZg6zV2CpOYi6wSJVcCLWcuuLNQwqCkjfOSUsofnNwvKAGstMo/Cg+Dvk5iohx2l14bCVurcQ5HOyBJEOmT4WAOZbmoJ/0hxrkhZkTtU2ZgKaMAdlRrjza1fCIQpnonjdim8IKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495816; c=relaxed/simple;
	bh=tdYpvWgSjy9pb8wMZZMf3uOm14EnHaub2C79rnVIBoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEj+nzmUCsg6zlPODtJ+U+4Vgjv5wpyvXAhBn3z54NzZGubrp1N2qy5nKGBiD/63N9WJsY4MCOhHZdwAFw3K7n7XHhHSM/dEPWJG9jCSulPUktP2tehL6WTgSd/J4rckAei1EJ7010Ev1uaQ4hbY+t3e53rqA9ot0pr6aTNXb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pLeoUaZH; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pLeoUaZH"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939656ff6d9so6681485a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495811; x=1790100611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=pLeoUaZHFwXqKvQfAvxW6w9XjTgMcZZpwUT6JOWOlLr4BimjldmpjhIjG7SJUDIwiP
         RCFaiMbzUeQZYwKEJGd8UINUw604HAYfqiZ4Wr2jOsYfVaLSlZ7zFfwj7INAIXco+Dll
         Erwyk5bdKKN1AxUDGprq6T9lGOVfIt/ulBbDQ1c/HXqeMbRM6F00CpfoX5TpjLsphKRt
         QTSxCT3eISuZ6qTuWrAPEFwrAuXwUZvTnHSFE0NqfzO3uNpt5v/rNpnu5yZE3hxlTDPf
         vQi7vsFDZe+NUT0XFE+2sF8awdNjgvA2Mh1APc1BuaHSlhDlnbPKwnkBSDKWGMKAPDvX
         BAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495811; x=1790100611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVBxclk9QgEAlFYkz8nlTTQ0570gfN7zk+u3PBMIQfU=;
        b=WPwNT8x1KHSAUdMJLFozqj+aOGq/ZTBqNQFwo5ESKX079tR3rOYJQiz11TzXKkgtWB
         9eFaZSN9qQeUE7l3s2Eq3Y7fZRG992K7I+HoFddWFXFj6p9XBpybk+nVeOxFCB3XI7PN
         pXXatnXDf8gAVeK0KCk9reOqEVS5rlPV0+plOW9M/IWHHaKcD6r6JX36AZHlwck2i3JW
         MHxxDKdLlM7FP08tXLgl6nG6tNjtX59/FmkdJQa/A1+YcO69hz9LNNUw46vCnNQ75Orq
         W5dtj+PZ/df/oY+gCfpu9IiVH+RGzIw7g6B5IPYmWzZhXhJO6o/FrapWnGT7ssdmKu0c
         254w==
X-Forwarded-Encrypted: i=1; AKwUvByVN7kljj4yU7cBmORgAwQaa91qhHi35WxKBMCQJWAOdFcOqYQs3DQucWPiUleKDui+Pj2Eo+qInJTv@vger.kernel.org
X-Gm-Message-State: AFuF++m+R1xYOEhIGIUY3quwdejUSv6EjdC4HMXD0Lb2NLFEqjBgZ2E5
	4Q91W1jXpsRCqs/2tzRabO6jfB1MN/8Joi9itzED/5RVab/gH33iLdx7pD3HAWox+gY=
X-Gm-Gg: AYBFou0xjT8I3sRqTHs4fhEaGjIxdtJGs5wQ8Ty2XDE1GD5dnvu3GAQU3aRt7M3+pOs
	LUDYpv//ZdVa6/dqvKFWJbhbDFQp7vKHJlpCQ92O8/2WaqzEex2lxKg40YNUjHbSaV52jZa+V1j
	KKxTlKKz9QxA3vjYuOiuUfrNXnCmLNr3tXZs8QwtIFnIlcoWb8dQWBL+b5/Pcga0nNXD8qiO4wD
	WsevM/sp+ZmrBWWUHzrui8H2VwuLAQ6RAhIBAfxBTOQOSilcLLSujVrJFztkNA0SPaXiFC3pnNN
	mMu+2WvOvOpXfPrGmSSG8+MSLkloOWaSYZ86/FZoMPI9zBZb0tPcsRtChxrEetrB3na63u4SFkr
	gJTWU/Y+LE2cybT+jRCFmiiV5zxEWdWDpm8Hx8A+rAeR2N9WBPNEP+p9U+B0IkWsa7mnM1qsXGa
	2QnnGOcDK+QmaZa4X/tGRTcmUOQjBFGcBTrsqGduNFLf0a9dN8zYRNXXoLRmqeasLxIRvV5EzgM
	n4=
X-Received: by 2002:a05:620a:640b:b0:939:e735:c50e with SMTP id af79cd13be357-93a297c8d0fmr1256082585a.13.1789495811337;
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Tue, 15 Sep 2026 13:10:02 -0500
Message-ID: <20260915181003.1633543-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915181003.1633543-1-elder@riscstar.com>
References: <20260915181003.1633543-1-elder@riscstar.com>
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
endpoint that implements two PCIe functions.

The SoC implements other peripherals, and they will be accessed via
PCI endpoint bus.  Define the devicetree nodes representing these
buses, including the mapping of each BAR's address range to its
local address space.

The endpoint's ranges property must be defined, but it will be
updated dynamically to include all BARs.  As a result of this update,
the parent address portion of each range will reflect the specific
address assigned to the BAR.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Updated ranges property "parent" addresses so they're unique

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..5b7f5292a8864 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,41 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
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
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
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
-- 
2.53.0

