Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749FF41737F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385419; cv=none; b=Dr5wSHyKG7XJ42SuWYVRSRiOl68/wq1jkLmv4g0SE3jqTh9WpK14M8vITeOyj6P6rk2lX6P+4hf/EkmPZUxJiJWSCPGGNNPuph0y6x/6frwiR+TYGV8Swh8ZJszK+E+imWfKk2H5nTXWw5VuiRdNXGyH6EzmWUK3EjzNJe0r9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385419; c=relaxed/simple;
	bh=eTWwfVHCz35mEZtL09c2ZHDDc37fkZg4MEAHwT7r+1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/nGNdslcgisAgWNgt8ZpKGfNnPyjJ95In+3a3KZInE/9rAQXAhhfu9/0rkGNAdImCPvy+2PgQ7lbsC/qMqVFL9eBrYvlyjDPGGYcjLpPCP56Bg5Qx4bjq/NcivyDZiXkRZINXYyC+MLxzbxZn1IQ9Ac6AY+d7/wldkDFNMsS+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FZwzFVb5; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FZwzFVb5"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-530420edf1bso6756051cf.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385413; x=1788990213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlcQCyWFtoBvuAEwrMQkxRbMNlzUSBJWEQdcfS+nHxY=;
        b=FZwzFVb5etu9aG0PksQQ+CW3NfrEp1C7jP2BiqJoELiu4cMFJDwhA8AvmqFa4EtZCt
         /mS55lIcAWmcpTjbxpMSF9n7M8zp1eoRvi0uBksT+aKGRtrnPvBa4am6YljqunqlS6Jn
         fyfh/IXLHDuiNg5GvcsFy+sMissgatlOjs81TfiwmIKgnsPwZqo3aenkiVq5nvpyhRER
         dfyqZ9R7makrzA95F//PQT12zgwQRpTuiERvisOwLxOEwkoC6kHzLlTE8Te5Sobn1bPz
         nz1l92+IWFHvaSZyo9Rt99e6z2VqGdid3M1s0oIhc88+j83o+IStzFJeEp82JzqSVZQe
         46+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385413; x=1788990213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlcQCyWFtoBvuAEwrMQkxRbMNlzUSBJWEQdcfS+nHxY=;
        b=Cbuh4XKpOwiYI+RdWOuIBPqVwVumcG2Bi7kMTSGawBVTYIIFblR1Et92D8IAicO3vc
         Hs35DA3cdb2I5+myntLHWyfzQ0ISBLAcTQvgdjY7dKorgSns3NqWTv7tD7/n7kwx4+/s
         Dc9UrmXjUHYFg4xlvxtWYal+00uYZR2OHh+FI0teYpWbka7CTV4C8XrqzaYiKGwTmrfX
         NvNB+EeR1CpEN6L2wAunLhO0cciisWk0Wl7BRsA+amxr3qe2NPxq5kfZFGOd7kmkisMK
         yWdFQS7BhZROcVx5kP8+RahKot4UZjfv5MZhgej+IDwGp7S+KhImwl0h2qpdmUGVyIXp
         kEGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKivcBTCDvMpjnhXNbb9yKarsS2bmtYAaAhLfYi7EBo5Ym2utNg84dRmorNWKJ9uCNehs8rWolXLIq@vger.kernel.org
X-Gm-Message-State: AFuF++mzb9ynf8BM7AlAHbP6+4uPkK0N1S6BApeudtNJgnk5MrZqeeft
	wm0yg1wvLkRtKtTxtrfeYvrLz5XU8GySPWm0PuR6MWxiecqdzyyqEOX/efBucRiv49A=
X-Gm-Gg: AYBFou3z8yhE77eCa9M2Kfg4kUvfbfMle/KVidStEMPYFEeZtWUxMo1kOyHnYv5/fFV
	Re7gpSiMQgyx93dp3ibDS3EAqxgZlvHHZZoU6DmVaCvODkvvwsljuRfj7FYE7wCq3/avB0GBA3S
	d5Gk7Fz7MZ3nAI8honU7G4GPyubZjfH58BZaRAgD9+7PhUkX5aIZE2ThLeuWzBwVsUJSKhw2928
	pzDjz5nz0aSCdtvEadjPyL8PtFzsrv4k4gCZ0nEZLpfUURzHoLU65ha8NlsVp23jXGzde4NFr2k
	vudcruD73P4gaRGivfWZxvhmf/z0eGuLsGJsxqfl69sTH2MycLM5bi+HO7fJg8UDX8tum7ZHPOe
	RIJba4wAIx1/QE5tsVoGpwt8NqDwYzcW8CCjni3ZTr0SDawWBvSjZ4svaTXi/StfmuMjBhPDgC1
	GOweGLQNy7PPOOaN8+Tm2hxOJzNX+nlf+/iE9YG6hi2GQHPb16ViNLQ4faXTqKIUng
X-Received: by 2002:ac8:5a96:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-53036cf3749mr89495631cf.27.1788385408032;
        Wed, 02 Sep 2026 14:43:28 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:27 -0700 (PDT)
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
Subject: [PATCH v3 2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:16 -0500
Message-ID: <20260902214321.1721477-3-elder@riscstar.com>
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

The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
representing TC956x chips, each of which contains a PCIe switch and
an embedded endpoint that implements two PCIe functions.

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
Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..5259f4f4f8574 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -130,20 +130,12 @@ pcie@3,0 {
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
 
@@ -225,20 +217,12 @@ pcie@3,0 {
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

