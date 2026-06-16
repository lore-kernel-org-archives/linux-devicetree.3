Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3C423A78
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602004; cv=none; b=pGQ1It5TYAzVm5t5Vsw3cyhVz4BhZWe33TTmCX5JFqXQHrLUu0mKlHQpYF19uBSzqCqy6mNASzL6on184Eh990AOT82KvrA90RYwS0knQw91/NHLAnU51TUmnleXbyU8ZPeJwqCzle3QH0lBLXFWjGRchEsnZtaFklh5jQ967iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602004; c=relaxed/simple;
	bh=RryLpvNjcnEgufiiYafBW/jYrFGPcPPAHt0L9y5MhkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6kLahwn/rr4y3kCXmxI1PiGqQFpOHDsfBJRiJeBf24Hlu81rgZjtOFoF1amI7zlYIt2P0w6Xme5DzTqkZdbaHy+yVVIYHKPbI0qFvGJnjX5FZe4wwJ4rtxuAotceg/OGTUR0thY4cIW1jCO8vGFuWMlvjjaBUw7v77DOTImgvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG1n+AnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q115YO7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG1n+AnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q115YO7r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6fZDP2901610
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=; b=mG1n+AnXZZQLKxy9
	LcbmRyegEqN+LD4gfIibl/V/lKqAcWnGjstylLk6dDZChoG/jg7txOC2K6pxwLIN
	PDPYuX+9nTAD2FT0+n7QG0I/wN9EC5ySe16BfliHZ2gxrBXk1A7x9RT111Wo5tAP
	kIYytZIWGqVWhV7kdPu2mT4KdERAFBBrHiH2hRLIB2YxO/7ETuIpx8kSAVyj7rUz
	rtXE1tjBJF8Mely+U1UXh0mSwhMtQDApT1IfSsfrjOl5G1cZL3OInG8dNmfnDKUu
	oJeqtwgrY1johUVaiKnbbEwMEbIW64gFpTAWl1Nn6C5SNl9r1aQXLevhjUJykytD
	FXm+qQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep8p5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so42771025ad.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781602001; x=1782206801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=;
        b=Q115YO7rjgx37EOcviWXJOFHPqFDFi1M+QngAOszbVMS3PNZJJkSBL9vP9ZqcWRYGK
         ln594B4BVzSclArSBAYzg2QvCJFciNxlknqU8xkXfRaRsp/47aKy5EQy3dUa75o8nxO9
         8FzhD56lr631181zxoW6cVaXTKLPQXGZ6C4xuSpYSEkSzKbPTtU0jXaxRjQsxXmTGEdN
         ftgNRd+Z7ZSo2xo/cA93tMG3njLi0D8owWrXjqt3q00bjvsu3fERReoM1FrY4LNMUoht
         m4ggl/t1xzk3W3m9h3AikFBQit9sIPEVkdk1u7ijKJ/Qg3RyBA/MeyySBbzZ/8KZJbGJ
         Cm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602001; x=1782206801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=;
        b=IFyc8P3dpMTVUQyi/PtRpFMfuUObo9n6+GsEWHjCpDU/KxXQBK1SGOxgn4qToHTjAN
         9gFNmU+NYYha7OOEAiv730PZy6R8M/iFNa3Wbixmk8ThEsEDoyI8ib9IT0eCXlzJK10o
         ovIZcilj89RMHRoqJJNcaAjSQW6a6z5VFkhNDGlgQug0M9gkiQnaKaMQB9i1XU8IgwWE
         1koA8rFBydao/fGHZQPR226jJY+uY4lVXh4C1nSebEMyvv9EhyqPRQZ49PmKqJdN1FPm
         +4+uYHGzEn5/v8/hQ65r6rYL+PJ4vacKOFmfTbrOeM6nA2Vhx6iTwahwaul538ExV49W
         RLZg==
X-Forwarded-Encrypted: i=1; AFNElJ8uVPeSQhzRq4UbMseN16QREy3qJOTZdKtwE5q+XbhbfsywxDWFPzP86YuYQ4r/zL24KV6xhENdGglx@vger.kernel.org
X-Gm-Message-State: AOJu0Yypo5b9VPZIgJ4LN5iMl4098QRNvKBK5STpqZw/VD4Te7tyod58
	x7YrGlxkgKp6M7U7HgpiKiew6OCJNdJ3/a1rwvGmqG6BNCAJdk5Mg6++msr8uI1cD7iAMHniT25
	lYACIIv/ZyBvkvW5B7/63j7lHo2H6VoBv13FBAQMqTVKgUTHVGWSx+re5MU5TJLr1
X-Gm-Gg: Acq92OG9Dt+OgWYVa20oIGerKhwFX+jNgomTQ2z6FUORmrsvuDivgH+RkxHbdoZ0lt3
	bK0xWzWRcqD5I++kWw5AYkdU/tw/pmAlodUVUoYxzhma91/MH9Y10evCkVToxvpuWjdKgGLkDa1
	tFnHb0rtPxtFVxbv8GUuQXXGKrm3CZpY/Rjj7gxX2ujQ3X5VdyiRQWqrCI5AdOoqWfZxX1awoSl
	78RmxHlia+yr5MCpF1vFTt5C1FfH6SMKq1yLM/18GSr2u082CGGPsxHFs+MohkGQLsQ/hxEGady
	1V8NVCAAVMvUh103+FW0+r2BN/KQkSHYJhP2oBG8+PpVblA7cfoTaGLNqipAjO9+7tmQJzZV07V
	6b/MaLRsR0ly+czY3YGnbRG86a5RwhU7k2Ip3C8MM5hsQS2A2ow==
X-Received: by 2002:a17:903:4587:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c4132fbee4mr180613915ad.32.1781602000845;
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
X-Received: by 2002:a17:903:4587:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c4132fbee4mr180613655ad.32.1781602000382;
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:58 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1102;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=RryLpvNjcnEgufiiYafBW/jYrFGPcPPAHt0L9y5MhkQ=;
 b=V9lhyPCgjvFw+PKD4HoMKpMOXDEb8XdxYXuuuxvHbureBOGfY5Jdz4NS2I1KoFNgBWJHcxdRQ
 xRVOYb7c6mhBb5twRJ3t4moEkPC75zcP0Hjkd8laTm0YvF8G3Gi3Re5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3116d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX4dGS827YrQJk
 kDw0J9qDjM8litBKxKjETm/o/3uLiiEw5acVSOSiPYW9o160zRK9+YewvHcovjWGx1on0YQNi1U
 kq2BoPleSJhClHA2vasopB1Y9+Vxbm0=
X-Proofpoint-ORIG-GUID: sqUhLNpkUYjua0gnVaPTkweNd_WEAf-F
X-Proofpoint-GUID: sqUhLNpkUYjua0gnVaPTkweNd_WEAf-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXyx1yDY2+3XoZ
 6t447w2w5hx8IMT05PcaB1wScq5LmYiCMZRqkSPb0XODVyRxYdBH/AkyHNBagXZEewQAgThk9gK
 /CFJ8DYwtA0ovnMWwa8kAUcDN1zjkZezDzIi6LbsdE/nqT0EOaOPT539y+7timuSypamTaYM7m3
 PJgkJgXvkkCjtq2JQ68Tm/fvdfP6aWO2fWvDMWB6w+p9HIobWVNjFSY8kaaidKo6PtNG3W9E+D0
 j0/Gwev7uT8q4MjoTHy2pgD2CrJlkmPCGzATgT8CLpINUhXRXhhUM/IV0S7pqK4LXls6EhM98Gt
 4i8EK5kIEbFePJHrCJGf1ifVSnAA7WQWcpwXidAPSZgaeQaL+n0+UR24mOOjnxwv4c50KjqRgbU
 UIUtw8CaeG9qp+NDMfFxO2OllEnXPzWVFTHh6XhyNcGIBQv19Tkditui7dnawcLitxzEFsVsBTZ
 gXx2IRQuE2ABJ/y/I/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..47e425003028 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -460,7 +468,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0

