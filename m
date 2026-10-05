Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9C47FB18
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203150; cv=none; b=IobRinrJlvore80LeFaa1sr2C2SpsEKGMzUsVfj7lfv+iStj3Fj+el0Lc8ds+XV0E6XGK5Yt+fccrfLOOwtBV3PdXLgPhpM0WQVzaTdSEashMRidoHZUFHcDitBd4rFOpePhJMltUwOusNEvn/Uf1YQkdkpFNIiRL0VxQv5a4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203150; c=relaxed/simple;
	bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5C7uMm0youwIsJXWgiEWPVSCay250B7Ef7wyuBkERwOQeH60WE3LcYz7k4+iRogJkC+2Q+H/QuiOfR2MzCPzqeRYEXE9nr8+fakQg8IBsmWXy89bJiLhuT54U69DcKzzsxDJ7v56xjQ+mqO9fM48oA5h2oJgaQ7yiOfPYYlBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbvQA7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2sUSCBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbvQA7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2sUSCBh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFQYC2225845
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=; b=WhbvQA7k6MPbvR1H
	iTw0Z+Li9Y6zIe6AXh7cwGjYCQ2qej7Bg/ebIVGH8un+bcKP/qzq3sdF/hKWiEYa
	XTGunCpVZy651e/3Nmb2ML7FAGWtcIB+7IVPw4Sv3t9y1sRw4fYV9rXNDA2VNm6g
	YK+g1IZYP+XGvkhNCH2R8j+LOl7jC7+fWkGfjUs7vV32ZsM/vBt3AZLZLnmsJRNP
	j63DCr7zK12PmSYbn0IypozRW9pPOKFqTdngQQwOSWJs2GACr0yKhOWqlo75P1it
	itpWQO6HltJT+wkYENCIxnF0xeRYuNYmmBTAn6hWpM1PfV9yyEaUEx3jcza/8zvP
	IdPYYw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg02e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:25:47 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80a4a17618dso3597656a34.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203147; x=1791807947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=a2sUSCBhHfGxZFnJekoCxhT3DFtIN2tUB320/sFTAzUPxw1tM43JmjYrusONnQ5+d9
         YAaI8rCK4U+arqMwa7bb6rQgoMFOYTnQp++ByLr6+mDJQDNg6JnaRoKEr0rzbfB/mkoR
         m5nW/TeGb+badmXxX+pML5xrX21USHhSz6JltCb3r3ZxEBIHjSeGFTb/p/YEQyI+Xuzy
         0AKu+IPSlzN+vuD1dzLPFx9TfSVNKqdG94ScPbVlEcrfdVyIrGFDjZ/bx8ukr16Z8NTm
         Sh0M8vvLQyAKNAkWIcUIaF9Nuy78cE9fvnh2Njzbod9phd1GvQKAQsUVqBFlpTA8HRlJ
         HYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203147; x=1791807947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=wOyRkb7dN1EPQiq9lsZrMVyPmF0woXCrxCvUIaZ6Hqhl10Sw0luhkAZNM2nfOUUpqi
         DbiugZfp9/tdABsNFzvGPa6zZkJWpoJbBDkersCoaDijq2PBgUUqN20x8egpuFD22jsX
         61zXkpfyQYdrgG8WAnO9ViALvVYZrV85oMHo/5ztwE8Vb2/klV9HZ0Jl0Bq7M0938s2D
         AjNZ+Wiy4LH3tMsszcmAZ9XCm0rmCTrSmCabLVDlfimfzoF9ZroQRYRPuI3wsughgBci
         SR9ULCJAuNi/6wRuJJKL035BBDGYXKpVFCe2SNGRxfU/bAhCkqMzLILbU0+FANJo75Si
         vY5A==
X-Forwarded-Encrypted: i=1; AKwUvBzuYplAcyR7Qzvk56ABRmh7uK3W/mbEJTxPAjbVkB3vDOWzUOsE1sQk5Hwp2PXLbhpGNZ6GUnKGb761@vger.kernel.org
X-Gm-Message-State: AFuF++nWjd3/6MZYaeHRuEAnIgq7wvFmbl7qxCDLP84Wz5F3d6ZlqSq8
	BeCD5TiQjBjA3TRTbH2tlFEyyc9kJqm2TODBJAr2VQdE9brw2JQg1poNFZy/YNs4TgAXm/KJcn5
	bokAdbffpXefL/U1W/WsixBAYKNJzuaqDmFZduH/reGcYVW2pKz18mMVjp6H+1lJzOE3leT16
X-Gm-Gg: AYBFou2b3i7+3rQgyk/xFRaFW1bDtnpcAvZPk9WPj9FnF3FY8PtNaYmXOR+FyHsxnf2
	JqYCUGrNRyJjGN9e1amYX6eP71KHQWFn/tagjRpRBw/MNLDj5XfYhA/4ZsVjFgqpKh+BiEpEAe7
	6xEyXmePpE8/0z+P7ney4UYfC3To3RySZWzNHtYpH0f0nBlN8e5Jv+5iODHoVX7hIFdw9oNCf75
	j5z7NLAugaIVVVamyLmXktZ/A/nxU7B45b4jb8r2KjUrFbzduvhDSSDM3ap45OOXk9E0rSqFauv
	FI+HA/fYjz2kph0OqBYjBNxwm7yKYijpx4bA6dR/bR+ySV4dSGwrkKlBOllSvFwLlNOu9wrJU0i
	m7EppN2l/E5DNSJRFhJv91FfIpflYZCGLrw==
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685969a34.0.1791203146848;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685950a34.0.1791203146398;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:10 +0530
Subject: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1199;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
 b=2YmvEU04ZjJsOIe7WGR/kTsTv42jYKJlGrvC3JtJUxoGdnXBz8gCE1n1MBhRmG+M+ECTXHo/Z
 pMXGg9n45SEAI3uBuJ265mAcdNWfIkl0nL2D0C1+cy2LRvedZ734RQ/
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: fMBcYpPrzeBOFEX7GQZxwKbF90O_W-kj
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac3974b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXyxoB9C8qLkQ/
 4X//v4ddERmEkTtFBvtyalYjB1kFQy3mmu+KG0c19RIrbpvEiDHSinGMgbyxGJ2kK6/jRDvKzRv
 Rp12d5+31Qh5cCXniVUO2C4GR0Ej0js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX6oxv5VF4/8hk
 dC5ExweREtbSlrpB10Yca3OncF+oyopyMke1LpiCpmeVMGToNH3i0ZIua09FciF5hK0+4Ml57w5
 EHErrDaeeo4N45BXm+Ooy5iPxt07MSdSmsMdQvN04F1eJIH1xSWfiGKcZ0X9Xuu5L5x9+7mn1CQ
 JLzZhuMfDtjSEpRryq8OOFur83Rq6X1kFEieEKbF/kXPlsEiFaoaNMrsyzoEEmvxuPgPEn3jgzg
 HGV9Lpt3cZP4wUFfO3mZASKfK7ymC2kET2fQu8akdSe66YaKdvhNf6t0gl5ge2x00pVWpf1t8xF
 +ElLo5A9XiQ8dyfiXh7uKcCvZ/AZmtre1T4dTcojjQ3ef0jKvTKGHd4IrUAeCWxkb0EH1NvGGVJ
 22/p/VVvXYWFEPPEQlTZ7YG+mOv/Pvl7u+7nrLMk9lQQfVZmU/IQMsRUZ8rhWwKBsAW6Us0FIh/
 Xo72K01aiGMaip2ZXVg==
X-Proofpoint-GUID: fMBcYpPrzeBOFEX7GQZxwKbF90O_W-kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

