Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E961836B90B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132733; cv=none; b=rMhhHpA35toa4k6ME6graES2GCc/0A1e+drzLdjdEG9wlfkNwkBMQ4Yir60iIRy5+PlsatIKq6fcZM1tetlwxgNFXXw1bp1l3hhVZHWcwTUxssiJ33QxswuHDicddQI+SnjMyXy2qlkDHR3U207NAUbdDv4xGwwxabqEJPUMOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132733; c=relaxed/simple;
	bh=tSZQT0LrtIqlvvj4bzofa+0ZRmcVBQuZhHxZa716dEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5EjEjKWdcsCHVu8ksWgnysByUcRwG6obvfzUWDudt/i0UeQg4/efOLz3k0T/5Y42Rvs2E5sXGFs0HJqu2Lgth6h4FRbLlX3JXa589aJaM8OQ8OMG1g0dMBRFOElVmr7Enh7e30LDcB9eWMpr7RxPldzHWYgyddkzkS3QQ1O4UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qHXwd3th; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qHXwd3th"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-902fc790cd5so23249536d6.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132731; x=1786737531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hm7QhstNetz0aiW6U5su/2tVvhMjzRx8MD5beNCnFAE=;
        b=qHXwd3thCUq0ukah0YNHsHNoqC9yemqaYP6SuwMLSTCclNN9oVVIpUeHHDVSRBd53D
         0Q/mZ81UQuAG97xZXYBPOH7Xt5M0NwYkmd1xbaeiQObtmw9cQEsuoSmeseLj2ni4STv7
         dbscalYVjJ8fdI/40kXm23k6WizdDYof7HCzvVxgSioBv8M8gM0uQwVLDI1elYjq+TOS
         kK2TDz4sO8QKELl/n3IiGN4ihTmYF0tC+LlDPIpuwicElL47tLa2+VPGgmR+R+W8M/xq
         oWutenKVKOJo9e5D2lp7+x5OGA+g5ljvu+1o8Rlul5syek1P4ZgOhAq6+dCGbH7ZqQif
         xffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132731; x=1786737531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hm7QhstNetz0aiW6U5su/2tVvhMjzRx8MD5beNCnFAE=;
        b=aWEZUqrc6OETU6tbp/SkqNiS2l+EDJASTGOs7klSnVeaKbq/tocI/a/UQ6zSxxY2xh
         G/1vGXcagl5SAhucqZrMF4X7r9/lWppz8wqUUZhJNT7/Q3Bjdz+/PGp/330LMjwnZ18Q
         pmjAqJZyD8mJlc8toXnUNAQDDC7fI2p5NjZprCDKmAZF7in4+2o95f25TqggPNa2RdRH
         8B/kMi0eboY+3upa0ugquwmnPIm9m20kM3O8UQe9pyIjx82qkBgjEb1YtAfnH3RCs2pS
         wJiYnnYKxY4LfrtxirSQz7mXOfBo8eJsvzo9D4Fe34gv861qRsgalsOvgNuJ1oQNEKNv
         DNMA==
X-Forwarded-Encrypted: i=1; AHgh+RobEzqpd7i64a+XIfByh0wfh6B8fI+1uWMQy4qcb4uev/ZuiRGoXrfyjuWaPx3wG27u8h/YlLNWcru0@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3+gsdhjpBm+TK+9OtFWlfJJiYZXLylqvjWI+Lmn41sJzJnOg
	BlBGSX3a1fBHqILhfRPK6CnyVz8ZkOcG7HRnqUNKXPwx5YzFdu1yNbXjYmRmQe/pKtU=
X-Gm-Gg: AR+sD100/sWWHWUznkONUlVKdxmbNZgI/Ar0t5vV3CmiTGfqOGa3kxyB3dHehKAQIn2
	0/Kx/qg0y3hThi9ozZgT+gyLS2sPxrijisHlY5nanfvr4htHdNUUAbloz/j8z4Gvf7bnTEwKOv9
	Mc5qLWPOp+/icxeqHKV7fVOVhV3hlesYywDB8l72WYerVtiSuZtgY1ndT8o1ZFlGWYavOMVT14F
	RqWGUDc3XXfK7ehABA7XjBSjCthyKtmHSpbdN0p8QZnIxnzgkBdA0gbnZ7H+EG0DNX4/i31i8Na
	zdGLjeabsVS/yohb4CefqpQLnpskpyPKnBCF1hQU1sRAb5bUWMTzjjBVqn9x+AFvA0RWpTrOjMF
	sYqNeX62WKNF7Pwpi0fsCIcSiKik7u16SogtB02agvuROxRrpF+Ot2AJPs9itss+2k+8c04AmY2
	2M10gWiRt+12TqQ4svNKkdvjwEuzvQV7kPGIvuV9m7lCzQmqAzJIPLOkTkyrFNgsMb
X-Received: by 2002:a05:6214:4f02:b0:908:8f39:18ba with SMTP id 6a1803df08f44-9088f391c9dmr219694436d6.30.1786132730818;
        Fri, 07 Aug 2026 12:58:50 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:50 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:40 -0500
Message-ID: <20260807195846.456079-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
References: <20260807195846.456079-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC contains a PCIe switch with three downstream ports.
The third downstream port connects to an embedded PCI endpoint,
and that endpoint implements two PCI functions.

The devicetree node describing those functions incorrectly includes
this property:

    device_type = "pci";

That property should only be used for a PCI device "that implements
a PCI bus", but not a PCIe function.  So remove the device_type
property from the nodes representing the two embedded PCI functions.

Additionally, those properties contain #address-cells, #size-cells,
and ranges properties.  And although these properties *will* be
appropriate for these functions on an RB3gen2, they are not normally
used for PCI functions.  So remove these properties as well; we'll
include them in the commit that actually adds the pci-ep-bus sub-node
to each of these PCI function nodes.

Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..db6578f7fba51 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -956,18 +956,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

