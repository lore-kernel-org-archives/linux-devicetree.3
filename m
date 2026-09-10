Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049914A688B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047067; cv=none; b=oJ9xiAmfmD6L9RNbAYz6VH+RTeBO9GwivnB+7kl69+jyCqT5kV1aHlV1JQpFu59uyD8Nskx+zzYLPBjlPUBu5CdaSI20bDkKDnA7zqXRp9W+iE9SDC39BJ1bwQ8kTLZ2M68hGuFv9PnTbdyyZRSqwnKiaNtjpCqFWNvHVJzWAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047067; c=relaxed/simple;
	bh=p7aqUPZ9NzKFHGhbOc8uSrt3cnQE0f/XH0GaeTxa3Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btm8AX61hIaJULiN8/LINlESspzPciaRM2i5BCB2n7GSrzRac5Whg5s+xO9uq90q2+3ba233RM68U2/594UsAfmRVyIifqO1Q+Rt/CbYXrkbRMg22aSae9AJ7edJGVZVmKlynD5Xrq9fsYpet8i2DnIeOSS4Y8P/uhxEUy2vr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXyNrBxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFZuuo9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXyNrBxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFZuuo9T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7acP2029183
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbzMkcUYNphcYWROxM5k5voa1S/+hFBi9tp57s+FIVY=; b=XXyNrBxXlDn9DkrT
	et14DVtsoB+eokBKLdXW1di2ijlSGoLaah+wxIJ+tTfTynaO32mMCqOL9OSrGGdm
	aHQiw0QmYL3wPK4Jm/fHjevQQUI3iAw+j9BhILWjb2cQdQxfVrv2+hOvdWUnVakQ
	m+t8Y41Iz8Hm3L6BFcw0ZcFnB8Cew5Tip7g7lLLcKmIi0i2qM7OqhGl6m2Y6u3vE
	vDgtSR9UAzT6ck71Zvo22NyqU8kW2NegXG8sv6OEa5l1JGVTsDaVZ/bVXZhaKe+G
	Dps1OR6E8tiFyakjgJKFo4hnC2HsD7gVoPCZArmLVBGRsXpCgMNc9jtclJWfX4+7
	PlLRPQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc0b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:05 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bf7ab47124so856077eaf.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047064; x=1789651864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbzMkcUYNphcYWROxM5k5voa1S/+hFBi9tp57s+FIVY=;
        b=hFZuuo9TBp+VkoV+zPvNpizOM/I4/Z5WYqA7vD827A02Lqdr3FRTPqXnihqKTYrq4J
         Y6JuRBvcZKE7NCs7ac1fKDqeV1xFsHslY44iMbgyQxHMdwWcZIwRswgHw+xm2k9gAWez
         uMN5NkdlJ3PtRgZVjs6lP4YD+fWr+HGOpBlx7c1UC5bZT5tGERSjxxo/B78IyGMHaRCG
         YSWAmxV8pawRrN3v0Hg0aFxFGb40hEyHAGRX85X4UtBhhfWf8hM4Ioff/RemS9TXzfct
         JRyxay4nXPGmDDt3+WI8g2ma4+/PhJ8oS4aa4bW3HOIqslRdeicYUFNe5uwcw38qWYtn
         ieCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047064; x=1789651864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbzMkcUYNphcYWROxM5k5voa1S/+hFBi9tp57s+FIVY=;
        b=DvUyGwXNvw0nej+XMgzDzLh/MWv+wvORHIZ8HOK3mZtNTQBOMqGz7ROdqA7aqGE8rP
         hJ2ppHYD/qgettwUljIOYZ4dRodk+qp03e5gnAukUysctAX4deIJwrqkSSUFVY8OB8vJ
         MTSiFv4kAH8t0rEHjm/D2i/BapjTM4dclqFcrjGQ5HWKI8Swj3GBfp5fy2ES0VULXYBv
         v71W8hPeKfzOvCDcrWmE12Jnj7jnEZ2JycIOPFnC3mHN4Stxc6NV/x+ZcHoajcnAdSV4
         5uVYZf/jszrpGBjP7ta30jwUgHja8NzRdxQMPdAJRpvM9wBUhAPwphQo0VjCV62vncDy
         tUzg==
X-Forwarded-Encrypted: i=1; AKwUvBy1AtPAE8s+7nYJIzC4wRifrN0M8JgP49tFAGe+Llv9peuOaQDgaX2A6c9Oi8b9sfvoEj6F0zPFbkdv@vger.kernel.org
X-Gm-Message-State: AFuF++lVrKbxtpuu1f9NcsvTtEs19TT5jkhyO1lwBYNDuKHpOh84kxDm
	CUT45iEmKBPWkFdoBOO/2WLQMNS+xCpQskkTIDv6n3WelRAiK4I/0J+kJdjmg9x3jp4J5NaHDOL
	t8RKwzmp0Scg/tTuSJiMwybhs2d0+mfiOwoxx8cdUSqJUJ4VA/hjJxkDk9jwbzG0uZOUvqRC0
X-Gm-Gg: AYBFou2CAGDwxdVjIH92W5wse6mV7bd4vjpt7v22s/3ZT5CWm7bhq+0muI2ZENYscz9
	sMpNwkaqxyak65VPhJ2hkzN1uyGRfUA4gl5g2izzqYqA3RhssO9F73a4+9JaIKz9AUD5lDZaxF6
	3BjGKOv1ZPUXm9kJLku4s8Vs8hyGg5Ci0wltt3o+YRoA12fEydkZHADFbkvusXm4myHE//6sEuu
	ONh0s7FwlqLYTVL9Z+Mg2WC2adJm5i3pJRCUGqCmzboOMahcOU2pOIFKM1YSUKz9wG86MmB+ccn
	7gAPbGjAti5LmU/tfuJKPxPLrcyGIqcRMEYlMSKDyZ+xGyRO7yFWImCRXUS/iqF1p9iiS2hsPbT
	yaEmMktJ94hg9MWFlqFPem5qhJbBcP56++sA=
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5812528eaf.39.1789047064165;
        Thu, 10 Sep 2026 06:31:04 -0700 (PDT)
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5812498eaf.39.1789047063695;
        Thu, 10 Sep 2026 06:31:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:16 +0530
Subject: [PATCH 27/34] arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-27-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2912;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=p7aqUPZ9NzKFHGhbOc8uSrt3cnQE0f/XH0GaeTxa3Iw=;
 b=SrErWxWYMsMt123AxtrHpUqVPXa0GuNoq6XZJek4Un8V7dPjQdPEVgAf90KmflatQzFJkRB50
 bKPNM74B7IZAO4i1dfgllcV3EjQX6MiQ9RDm5UisHu/B8Jn5Liud4Bu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX1p0sdPoSXJnN
 L+KrFSWK+kjNRc8kAtoCsWkAseKFd58bmn8aT3rQ4AoO1RITxry2d8SGncdKwUHDkB7jVaU1qbW
 RCUOBCgNP9zcOZwZ+oWUuez95jkczDHI2KO167LdIKN1k62l8ctrD6V8DnhubCBFuVjEDt5iX2F
 uk6yMzlcIvCoPLGwci+g9nU+OPHg8zfr5rSMfoFTTvIkL34Wk96h1yLbqfkQ4pIwBmY0pGW+2kY
 H6D3WoAtwxoX3h9LhP3ZbB4gP8oT+Abcoq1D8AvbgwM6NjSe6RhtVGqpjmKxVqUrK7puPxX+NV+
 ejtoVjQWEntJqHV4T/eoorI0lbJqFdX82EnSXNpG5SqW21mvE8lXyNGIZTJAwWOi7Jm3SGfnzyK
 Q08ouCGiFhPrsXQRyJHiu1BEE5WNQug2HmZ5FnkG/ocYtTH+Fmmckk1c46mwaUQPg630xslYAq/
 nErDjSkyRKwqlZuOaIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX01b88/57JHQr
 2r5cPzE3UKoJng0A3BOMoFrPr5gsavXymURiaC0ey3a1IxqyImEGMZOWeGpKA2i9s69OF8Cw3R0
 fvFPi+cT3IVMJNqTHSV2EU+c2t+D2R8=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b119 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: jMwoT6LrYmCYv2VRgebuK4OXpPRoT8J4
X-Proofpoint-GUID: jMwoT6LrYmCYv2VRgebuK4OXpPRoT8J4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100162

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e0c357222bc7..7fa26c1b37dc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2207,12 +2207,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 			dma-coherent;
@@ -2224,6 +2218,10 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2334,23 +2332,21 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2461,23 +2457,21 @@ pcie2: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_2_GDSC>;
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+				reset-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

