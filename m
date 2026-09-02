Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C5A4ACC7D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385428; cv=none; b=ZHhQ9bXIWBJGFVj4jo14+tbM1vwLRGbihqupcdU0xHFMU0N0l6HrXQpcpTbu9BFiAQou7J1MWG/IbpD5QCTY9xJv1ACNoTl6mvUhz23zL1lxXNPtDCehOTQlC2GNQ05LQ7cpt+4pFyQ/vO+DX9Zl9zDxHHgiNexi0zgOK5W2Na8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385428; c=relaxed/simple;
	bh=Yp9V0DDM7pBN4oFzQoY+w3CvzCQSulT8S9p6P3JO8Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3hDorhUbHW9ZJ3teY1GAgctKI/sorDtUwUyZbLAv/yJJelHjdm1KTZ/xStWb2b2zh3v2SvqYO5IRDPtiTK/ek0PA2V3Y2Aui7Bkd9H62xaWMMid/YRVjYLO2YhSuOsge7XYZc36Mt88GnacoNK2manxOCY0nmX+5wDyVw8U728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=WuqaxmCs; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="WuqaxmCs"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90ceab90152so12659126d6.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385413; x=1788990213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=WuqaxmCsNCE/3WAEUBssLC8LdqNv4vEAAzpXwyIcvpOHLlkJwheNX+pE4jqVAnNMT5
         ogxxvbRA+xnUH1MDEQ2w+28n/zj3V9pC6j0FKa5um1NrhVSnywjJgkH+ejx73b14ccUj
         jE7yPNdKsCoCOhxAXwqZQITVFVUE/i1VW+aGF3XEXf/02nBEB00vizIb4bLJsm5CLbO6
         zfSSddQDpG6cR4YBXNQ4mNt64uUjaTFrDb1nRDlWJOH3SdT3/z3JODlrrpCcl5TXhljY
         4arM80t9V5S6rYPjGCAMRGIFfJqHlW8pb+lnOfhtX07DHV0Fse1O6lsWJnifN3NpNPn/
         D0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385413; x=1788990213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBSlViqDjCQ5gbe8ZY0C60syox7ylssOjTgWF3IsE/U=;
        b=opqQYO4jC367K/fz4z2GD9Et8l4sf8A4t2d+myRQrKam40FvmtxxG8iybejmpPr24E
         kbl0yUBAm2trEL3EsZPULqzyIVl2GBi1vQ2GhYDW1JtcItglXfebIIbjH3TvdRkhn+Jd
         ZFa2orSGN+yJ43r86/juyaEkloNMWCusEOsLhI7Vgbcwxc3Cs6BuA4/hgYuDNG5+0di0
         FnZE5ubajwn0hRkANT3NYp5y6ghAdSLjcr9QP5rscNp+pM782BLJiA/yj2su27msUaxZ
         jI8LNbLxVgt7UceV+VJgYsubr9AmFDvpTOt37/s9AkBHe4J0gtvt5OlK2BdVL3l1PkuT
         JHPA==
X-Forwarded-Encrypted: i=1; AKwUvBzBdjHTzESVukbk8ntBiHoqhoDkWCh8+ZYnlaaH++ixSod/tQ1ahT1uI5E65pbrcvt1NVWVrtGe12b4@vger.kernel.org
X-Gm-Message-State: AFuF++m+8zOIzdMADmocm25t8JVd1Z9tDnjRBXtXKG8wHWS5bSivIZQm
	KSioAhllpR3uC4tAfDs7UVWbIGL00nSWVXvrcZbhBJNMyKQKLHrCRhCF7AhYDGAxIHA=
X-Gm-Gg: AYBFou14Qv0+0d7SsegeAdduizTwFCDt6epoONxkK6YbDqQPwRDDP4d5pi7BVRpkzHC
	jS5u6jjuyzAsUrQpqfI3P3A2jvc6RzIJ38AF5fPbIim5Z2eppFFRTjaL9WlzGLLiUpk79ppFN/W
	WAlwwcGxLwgSDuso7z1bNlfcqwzJEcsAjwydbVXWPOZ5Q6P5OMxBrQN5wvmSNjoI2DGkV66A5/e
	t/n7tkwadTKqVc7S3RudE03aoftDiMlqxIbvChjmqzrp2tDRaUrpprcTi4MPsaQxn8/VUOgFlxi
	2G4pLwzfVP7e8mAqSe/WALdiMimjv4HelFKBtb66lzw/Fh7ixR6BkiKXbDos5/M0T4SgjfOVY6F
	nhYXB/eB0RQ0OTKrsmOSgy1FNxDHtwqWUCtVM4HI5TpRkaiSJgry+TG3qmhqjlL6s6KJ3vb2XAi
	ORvqV21VQ6I/OCBm76NxKl0jeyebaxjjexIq8NL5KEhkrhA85WdEO5mHY3vjWgPgXB
X-Received: by 2002:ad4:5ae3:0:b0:90c:e8ad:7fb9 with SMTP id 6a1803df08f44-90e9f205935mr108583056d6.5.1788385412590;
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:19 -0500
Message-ID: <20260902214321.1721477-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..51b59a75c1e03 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -790,20 +790,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
+			dev@0,1 {
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

