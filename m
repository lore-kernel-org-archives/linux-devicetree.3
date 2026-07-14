Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A842475D0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004103; cv=none; b=FCNf3a15V6i78PDMwknqiSsNrlq2AH1RnAAfC7Gjm2dgA7F2uRjrsB+QKsZL9Q7TMlVXFwiybus40gDIGCV0vLl919jZOwVhYHRrHnYSi3Z5PcoYvC2boLIMFK8hmFKUdAmSUc4gFZAyECtjvksYw7QF18U9sd2jaMPlnFoO9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004103; c=relaxed/simple;
	bh=CIzFmI4snm9JtwJh6lQwJzt22lqUvhjpWuKOq38+wBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiTMnoQmMxCb/dxofvE+IwzOqh57RRPhno9Z//AHs9eF2zq/OVyVTNwCJQDudH0KPs4PczEc+oPi7fhFfPYlFI7ntP+/nnGfbh/zq02WgwzyXOODQZIaWtP4Y0S+/jariWyqf7iXg4oqrPVOTR8FsXdCEzfpIN3fhEm6uy+x67E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9+UH06q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7JTNNkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9+UH06q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7JTNNkk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382ps3482653
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=; b=Q9+UH06q+/ovvuyz
	0I+wMQREL+116VIn4tIcvdD8ytOBeUOR1u3PbQFOy0mcakUmvi0V0VVTF36UkPHI
	+DuTauu9NbAPV4ElpJd2HrRgTyhjJAP8Mclp1eBuOIUNeu7g/ZPhT5KHpEb4nQq0
	fQFnh/AABjpLdQ9nDtzj0RxswpztKw0ICjpRBaBure7HAq7Vm3zvika2UEKGFtS5
	tvfEvkZgGQ2bqAYJt4BiAMF+B+X8dH4o3ejY2Gld0s4qn8nYP/vOnMidlLAfupeR
	2RtvaNnyHO/1q/kmCLlZlMlzyBppeQikr4TOwvMImdPyYGPRxSqyZ+3EHMro5Ien
	eDlCRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa7qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso3698403a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004100; x=1784608900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=;
        b=G7JTNNkk6LjWDTjiUbS0sMDWA8O2MqAlFpWsIykBVoNmnJP4n4CjyI6z0QZxiXsXAk
         4P9aTzP4NfDe2ghbfHvIYu/Vlv8wA3ZTH3N3HKNIaeBWfWaZkc+hFZDgiTJxZBWsTzhi
         DJAts23ysXoAz2tNPXb9ZOz4vtqs2OPV2EcjHEav8vlvaqMwT0NZGFWgTXp5F3BHZKMx
         MJe4c/MFOasOAiNA6ORodSqUjJIVuiGWeOl8wQY5Kp3aFOGb0BUBYXsh4s4nrI2Se8uP
         iTBHA5IO12DmqWqQnxAZijOXtGGAOuR1qJ32862hjiUpfbdr5HwqV28iNqBR5LGrO4H1
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004100; x=1784608900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=;
        b=IVrGhvkJQqBSmzKc4EHvq4JVKDHQ/lnxhIA+LyjwUxvkpga0ximXpOhiQVeubI1Qel
         n7F7Ph9TEKFDDVzcDaQE3diHf8TvRtFQerYvHL7mH/sANr1OUvd289PGa8QK/icQ8/ek
         yZvesEZNKJ/adAMW+ylsH9jF+dX6c9kIvyaEXCiah4QVDl2iZcFL5LK7+bRndwS2FlVg
         ZZF+zhRItNoXW9Y7uS+s51mHtAPVZZefdVVD6+eOUMtkBst/QFQd5e83Ha15RJwTrlAE
         BKclfdjDJj3QHRmNhVr7uJAWluRznL1+TYgQmy67OxAtvhyZdkjIFhKBOGD2Ydm5bAWL
         35Ug==
X-Forwarded-Encrypted: i=1; AHgh+RomtHSbgtqqCpwND6/DhNtVh0BipzwWWV3iNM/dIrQ3cC2LsEtkEj3p+mC9RjWxMbVQdqCt2/YXOSaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YznXFpsCbJVYXN2nLhGSZGAliChp5FyYCIGf4nn/R1wb01TJfuY
	RKxNoOQ4PNxOB4m+lUii4ZC7XpPafJPGFa8VqIQUUn7iCCMXpN994Q8tRFqzycorFLDcNrQDj6/
	E1H6VarsLObr27yy2YHiVW8hswoYcezNGBDymd9vrvdb9kbpWm7y6Y9ojGH0exXxkjhcWZFeV
X-Gm-Gg: AfdE7cn5q46RPiDTsgnMgNt5+FkPP4njXtiFJMtYnIkxQf/quGz3zSo0B6YRzlddCNK
	nqquq0vkNi9CnzBS+CITxI+x2nPO8FopmVYSvDrPr2bcHkjZxt68C2xqozpN25171RrXJE1mNqa
	kzTcX5tD6e1wVyA+bT8iPVLbSsbsILzGqgCyZtbfKLoFQEI9tRe9w4BHGuv0Ckq9u+oct0BPpji
	fTRLVCohnK3/lThAVMPv54ZcBVblsLN6SxHP3RDkwVOx60BpyQUS0ysWZlRnO/7QpCzvYoVh+st
	MS5M2gtMJmE2/SKpXI49YaswY1fOVDwy4uOYjijc6h8wKoo8XCOv1YOK2DwUcmAdqhZ9TsRgMjS
	wOo2GiEbX4+a07e7UXdEanw+IKmowTSvFSlxVXr3gOVebzxCyCas1gWy01ne3UGTewFi/COIe8u
	VkzBkTlhNSLsYbhqlONDihRhmpW5/VNZWoDjCLHYWKM6fqZw==
X-Received: by 2002:a05:6a20:c6cb:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c34d719d22mr2354712637.45.1784004100515;
        Mon, 13 Jul 2026 21:41:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:c6cb:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c34d719d22mr2354686637.45.1784004100105;
        Mon, 13 Jul 2026 21:41:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:21 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: ipq6018: move PCIe phys to port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-2-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX3EEqn3SCpltu
 F1kH/SSpWGN/nPgeCWodtVG4L/N3qwva9wl8l/u0GsbZxxywSJ0nvQv80InkC7y7/eNltPlohc4
 QEX6mc4BF3dG7EUHODTUgFaD4X5R4LWuCn56JlPsbcTC0Vzpjmg7TARJYPdBycZvkZpy1TP8GgY
 p7hjEvu/B98WOmLr6DtF9zV9j6+dhRtSxuJCX9ZbmkNGwaZ/ENzWJPG33vXVa7NNNOghe7kznI9
 pxQzNdlMyW1dlCUrjZNzB98nZPgCGj1JKCaDw9nhQn1u9Zscba8kiaCIxWaUwEWQ20hiftAIk2I
 qvjteQNzMCj+PB2MLxxJn+oVs9FWbyWEkvm6sqgjhHz41wB9FmscxspnK8rbnJsp0+9DTOcbnTH
 NACxdoIObgY9kcCZvnzAem9EprBlknGMDQ7YZq8Q3hSGECS2q8WpjVKddGEDxtwpY8HnDvvaOM2
 IKkOWfr0i2GEtjeXvPw==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55be05 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3jor3s9Nvc-YBp2SpwgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Sg750Q7032wlGftKiVCaXNESv0cOrPUF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX2/EyPN2Beq3Q
 nb4wQOLefpVfRMYVySdrbmCNXa/A2jSDST/kEjAS06jvuw5Feogqh8RBy+pkPjQDGgnRelv7Rsq
 k7kcFpK98lo5lgv5RGJiZJ1lQOqchpU=
X-Proofpoint-GUID: Sg750Q7032wlGftKiVCaXNESv0cOrPUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

To align with the newer style of binding, move the phys property to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 7866844cc09f..0701517275d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -889,9 +889,6 @@ pcie0: pcie@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
 				 <0x82000000 0x0 0x20220000 0x0 0x20220000 0x0 0xfde0000>;
 
@@ -956,6 +953,8 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

