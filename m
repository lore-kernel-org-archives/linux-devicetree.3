Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F292C15BB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004116; cv=none; b=GwDZK2LNJvvkP+tS3BiTR4jvRcO+eXK+kZaYSBcc5bCq9W+mMA4MsIWJF6XRfn7u4iAxXtAwZfjB+dGTefVqY+MK3B3X0tBoinl7Mvy48nLmetqg1wtOFYlY4Y2IeEwAY3PITVptKCXSKCxoQW8TUkI1ptdS+BMYruHhPrvip90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004116; c=relaxed/simple;
	bh=yjJfnVfAPyZJQYHDnz6+/OXUy7I1iXUekOwvY2stxZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGPaUIY38Kh9vQYvOuHSY5BTXdCXJMLUe7NS9UxCKBqrO4b1J3inMNaDGhaGHYeP6bb9/jc0ztF8I15Hf//ykNZIM66fFqMWGRqiodyVtA8PGGwx1fSZpRzofWr/TkbiNN7NsgMcsbFu5mh4UVPUr0Og5MlR1vQ1O0KyvOuJcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp/WE06i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcRRnbNR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp/WE06i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcRRnbNR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38AnL3441002
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=; b=dp/WE06iNySG79IC
	dLWTI+qa69TR+oBKWRenTLBo7dO56kenXWTSsK8/lr/k77N9dAP0t1gLv+WtWb6l
	7IDd6QKcFdZ2ffMyPzR+qPujXtqySjon/JHJbGCxy5EPOiAWG+x/hKTWTWSTFHV+
	GfVRhjve/ixBTrhuZe7yOjy2RLevBAlufQ3/AuO3ezgUf/rkR1RJ3O+/b7etMLjU
	ajrLFeUzZTmqus2/AVBeStILjFlMmMPZhUhqC6krhmLiwsFvXSO2gr8Tf2ot2qaJ
	mhUx7vnnlDtZJzcvf2Mt/D69iZ8jBlVQNCgNDtOJO8CCbEr+Kz+cWznsuxlJ33Kn
	rnyT+A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48guh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so618420a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004113; x=1784608913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=;
        b=RcRRnbNRKBtk3STIByyV/lTIt2Dw6a9gW87k9lOwoEhgO3sHZQO32O5xMjvbvDGZk3
         j3x0rCZqGwaM7aHQHmuF0aFa+T3Zja/P/Cxn9UAokcwnNIRNR/LWHV1UOho6RrBT584p
         jYROfgWGPB1wdVT4pVOpgjQbIRPA6I+MEbPe2/iGCdL57NI6vP5/YqTDZMRPXB8T7quf
         Aw7l6JOLHLlBDjw+1iEgaQUwIpQExIcxc0FEXn/oDC+PfiyysgxVtlU+k98QmhYjXcto
         bzBAethiYdh7zSm0atxnx4sdDN3m9yrdYH+2RMQZsmQ4Xtwgg4OHTeZOOX2lgl9oCzHO
         873w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004113; x=1784608913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIYWnll1RgHSAbQKf8Xt0wniO/vmhny7JLi0bmR/U7w=;
        b=d5zC2GtsXxeuapjBqx21h0EmUXejaGLopjmcZS7wpyPrGCneCFHIjx6a3s1kw7w/kf
         nxbs6UtYDLdNMhZOha2AcRGarcABhqU4n87EQGHrnwdf12GEsrkrFd6jGy7qm11ykIkl
         N30heOVOP58zr/JR0jj5s/9pUB522z1b5u5dTCx4C9issOMzDzgyUPPLVUl3os1CR6LP
         Yx8rF0nCNVorXRvahfKgSuHbwmThPsNneYg7Nj8mZgsEcyQYzSSDsNgvpCBiRkqMsCyX
         9NvOUK7xxfFQPQq28QTXqsJ1oMzrdcxl2zdHeS5cv5R59cVF7J3IEAtNEBO/kXmbKjfB
         B3GQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZaGNPwFsllWskWNgQ4qR/VkAQJGqbS5cdcWDgGZowsGBZNGHYWhBY+cuQaGdCsguHA2k7MrMIns0g@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvcpI9J5tn/vCatVw8BoetZ+3xOz9Fy82B61H/rLFOCpGa1mT
	MoiRdBQ8nwToFlOXuMWzLFSmqH5Atf6TtmzD5J4BRryvqETfYpB/G679n0Hx50TO80wtWcZeNyi
	pb0bBrcbHLPlBl2POXqsaNn6QkXBh34VdrHQOwrK/FDh/pIjmg5EtP+NScJR3SobhwaXsQS9I
X-Gm-Gg: AfdE7clWzTDCmsL1Ti4PvjuAAY4MI3KhUcLtU9XB+3eLB6vLuwk+gQKL6Mr4eRptP9X
	AP4EbL8Mk1AtNvaps/k3lhi1dE9RMhMH/XobSj7k5qiYae2VVcECADEwLmbamrUVPtswuQT06jY
	2/JitMkSVALPxGFVkfGXielh6AxKILYF7Aaf3KZ6Qz8ENSfniWDBoOMygAGRnBYAhlF39Ac8mAO
	t1DiJG6auFE5pvaBsFmTD8nV28BLQgVnsbJvCW608WzQQRCOoCmM+WQ3lLYxQntKhflFy2YOS7E
	vWpDD/1ZttGxRafA2nos7Gweg0GCPnTyTUwgr7Wg0sx5KDSJOKmm4kqaAdK5a5GOu6PFeUsfWUW
	VB4rnVX+oSWhfuwrjBCHFl21qS6lM8MP2dp+iR8gszct5L2x6j+Fz6w+uEBh7QFSn2FstSLVz4I
	fl7yNtRCUGC2Kny5eC0bQvcA+35WRt9NFfJSBeUf9U5q29bQ==
X-Received: by 2002:a05:6a20:a109:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c110a07537mr11924995637.31.1784004112962;
        Mon, 13 Jul 2026 21:41:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c110a07537mr11924926637.31.1784004111830;
        Mon, 13 Jul 2026 21:41:51 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:24 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: ipq9574: enable the PCIe support on
 RDP454
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-5-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: YwOUdQsZIGZuu-KMBf2DOvZUGO2Lll4w
X-Proofpoint-ORIG-GUID: YwOUdQsZIGZuu-KMBf2DOvZUGO2Lll4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX5dljEmnFAi3I
 O5jq9sAKwYfJv+9Smuf2ElnEegjPJT6xpObBUnPFNU3bGel4JhUoK3LnMClN5BX/Q8k0gkudZM4
 x1eZFxOnd94kDMnKJUD/2VeN7IPaE2UDc+/czLNzaKQKgDIvYORidYSh0SSJ2OGwsmazvMyACVf
 lQO+IdNJK+oa/4jUFughTZ5FiMkVQDZo4MU3Rug1+x+CShury2/6k7ZnTpYhqimhK39LWXaWecL
 Dh+rK2SxU8tOf6UoobvUMKBg38wxjCEpun2O0NtrAx88MwlZI/eutlAWHI4YT1+qqGeweAVwUj9
 cGAOp4a+gJPWi+L+Vr7ufkDoMwbNT+Gp3sivvfG39FNd9gRl86GMdIMp+2Wi+h7IUrWF1BAjIWe
 HrKpQqpcllgL2gbFiNCkQCk633qvSAgJTBtFXbWUOMPB2+FIfiFmWnGXEsc7E/zbrFAcYVmHSMe
 z5Y7kzIpEZu/FHeEHEQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55be12 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gruHRBXcteZQTzQfZrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX1RktyBefYsYx
 ARt/+uxGRre1RQAomZXjI/HPD+GuSa/2yXkFmCKT2dSaJgnWqzxy+sY/suYhdQozA2IDLKDQkIb
 NJ5xWbd7AfIj0njFZSzIv2UiuYdIa+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

Enable the PCIe0 (x1) and PCIe2 (x2) instances to connect QCN92xx Wi‑Fi
cards.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts | 80 +++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
index f2334b9e0ed4..146422aede7d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
@@ -18,3 +18,83 @@ / {
 &qpic_nand {
 	status = "okay";
 };
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+};
+
+&tlmm {
+	pcie0_default: pcie0-default-state {
+		clkreq-n-pins {
+			pins = "gpio22";
+			function = "pcie0_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		wake-n-pins {
+			pins = "gpio24";
+			function = "pcie0_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio28";
+			function = "pcie2_clk";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio29";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio30";
+			function = "pcie2_wake";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+};

-- 
2.34.1

