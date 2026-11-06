Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953543;
	b=ulP/5AXiAPokI7m7GCNMqhCu3K/UsgItOwEDyg/cQAg2UtPCXegnzJuefaTd1FGjIjfW
	 rqSGya4DPgi7WLUPraHHp8B1gnIC1D4xXZubitnmupmQ02QzF+N4+ttfgjPKg7n9o2bPW
	 G5d5/bNSVHN6PYvlwhiimZAPv5jec/19jqPaG3n5ZsC52iaHeE9okgdlBwcBiMnZsENCw
	 nYL7erDFehS9csQ14PSnRfYij+xOrUMm7JpEIpOQbcgP1I0/LvodpM14lYLeWKaeu2blp
	 z1gQUMwBSpXFwzro/D1ps+9jVAFquGyjXXaUQayHZtCHu1/K9zCB5HxJ9TLAx4JQUFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
	b=bDiOkGrp4qyqZPtA5i9VWd/03cIyG1+QdhnF+ZoXVOkHScwMgB1QyNzhOEVcYHNN5lTk
	 XMpcbqsQCDpbC30oIqyLLuxkQQz+Kj/Y+VBozANqNmfJmQa2iYh8EFiXOUbEim0vzzDUM
	 1jnmN8vOjDcTI8rLJbMMyv6kBqnC9TafP5PCvwpKnoHVi3ZV5QWqhiZK3lqmiadlwDMq3
	 VPKYBhbnB9axb3SYN1uLAQ0zu5e5NVyOGrOws7veJEyNeNteb9LSzgYhoJGlf62DbN+b5
	 ViM43IRC+/yUyH+UwDKuCi95R9HHzxQRDHzErl5g3T/ZtER8GMR5krEz8NLTBk9HRGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75103606D80B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75103606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RSml3284392
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kE5+p5P65VP
	jFBQS2QIkASIL3ETgZUjcBDE965AYSOM=; b=P0zg83WEuMkifmeeV8xUqbW45X7
	0rC+m7lJ/m3JQCTqKQpEzDLE9tJUSHsNi84J18L9PsE1ChkZ7ftnuk9Z/Onge8UH
	6B1phgqmiiTIBSGouPh7CVimEBWr1MIvBVf+2DTarC3krZ07HQY86PYT9g8aGKi3
	Y+j4RJs86Wy9UDl6z+3c1k1nNpqVi4+apVRh21rhzFKRMKcJB+ZX1zGBrGCfMo5z
	JDKjX17td+FjrMlZoxP6JQ7AFcnYWKgtN/l6sH6dIGCSkznPfTFL3EKJ8uOyyRuO
	V4jzWAKBODoHP3jzdPVvxHaDd9n4BUaV1LYzwcUVQ+D4KTZ7Fj6HA3bm0Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1upa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so78905185a.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953542; x=1794558342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=Tk7B1nchFGiqZDNgi2rPFihSgE9VZxtvO6r1BCwYtXE8YnfKQvLXHety9yj59iRhGC
         zg/LILCn2M2I47HNzw0eranHHv9OlslaZnS97rOmbcYa9g4E+NsizCXDSl2Ta/wYcLra
         amiPrJYB0VG8xzbDXxi59ki1h8g36wjJSON0eLMlSDyw7MjdFmV3wPaRDeSne0S4mT18
         TL7D/VyHa5CTGu8q44Smp6/zd9tAwOEIGOCSxcJpKncRxLBZ0oQfVYZa9IIGwwy6owie
         GCmDta9WZ3ERMpRR7K/zXHdnsceu/AkCLTp/9RdVz9QL88J39nagKheLEq6wBoOm2tf+
         3haQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953542; x=1794558342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=qsCc3qWrjFWIuajCWJiAtnrJbWx8kG3DsvWBXc5tNqLL6taIaSjeJZit8KwL7i337h
         fq13QwVtdy4fSENsJyWWx0e6WzRlRpKK86pW11cLvQjWKM5oszmAz/rtg2YaSJH7Iv6v
         VJSEtyz2bh6BV1ovxj2yBQUNrWrF17yT3ucLvM+udgGt8ek989jGb5TWBn7281bH18A2
         VhcmLBGj+2A4tHDdNJ9zYM18AQiTkKaoM4Kib1vm3i4IB0lyLeEWC+MahGkQOxERKO29
         o6hAEhfRPbi7o8zt6awWH22P0yVrZUj1bx+oIAzWzdeyQu+MYKlervr+U4ExAsifQqB3
         a4EQ==
X-Forwarded-Encrypted: i=1; AKwUvByxSTJJk1oz8cApAub/Lu/zBzU8sH7NOhI26cyckZ8x8ah1hPECmwDtmquumZcD7Okm9dxO8qDPskr8@vger.kernel.org
X-Gm-Message-State: APuU4Z/aBJE+dfsJn4MAy4cAoapPrIQEFNqCZlXKHN9NhPJ3CiyU2Yv+
	6wfhop96hp1KnVuNgIZ6eBzHiLv7RosDkYsBJDV4XVE9+K3k3oLr0nQGzWvX1S2SBGFToNMnQ32
	FYoWGU7ueCJmwPnr/vPlQPmS/Izre/mTeadQ6XefSbzPfS3XX2PSLSG/EwKHgHpUU
X-Gm-Gg: AYBFou1NJYCGs1l6njXcvJWTEeRcyekv66nrOOxWqvGzpDExTvMLpJm9W586y9SSkby
	SkppBiBEUkd6CT4A/H6D5YhJILp8iWn7sCyZMd+jqlHFHJDd4bobFmrTg9EgYRdxkocmzTkLHnX
	O16l0BDVx7st2swn7NxGa75tdmw28gVJu9fHvxiH7KwFc6TEvUPV+3bovQTI6pMrSuZ6BZvHYPE
	IwDHZD51i8NZO3b+PPa3gc4oBRRVufr+4CY/GsoYvqOXzVba7EQ+OPKujEQXpCGfPpCPdviZ5Nf
	zzNKKZ1y3Z3cJwSOCB1n62TY4egP2zLLSCVDmqHDYHy9v0wHj3cDj+c1vUMIppIPBIiohkYx7Jq
	tUmS9G6E5dzcCJRg+5m7mdkiKfizWcXg8LCtkOh7aGWzso5ZbsRi9h1OEWWVlddfvs+sjJlINsA
	==
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255538585a.12.1793953542037;
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255535485a.12.1793953541605;
        Fri, 06 Nov 2026 00:25:41 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:40 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:21 +0200
Message-Id: <20261106082522.1448390-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dqmf00TCjrFIKNNwcvtNJjDSfRF0R0Gq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX6XDzN5lGogCo
 L704hiLXTJjk2HUMwX3XoeSzuym3J6+ARfa8+w5+5Ujs6qr1KhIQ5QTKX7BNf2eIPjBiS2uf7Dr
 mVOMQBFJoBIl2v0hbTh40/hdOvQsUj0=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed8f06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXwbCi6t7M14wa
 7mTbX0lG8HGuYf9qxulEyLSVYEypbnsmGw4ixoWd/EhOwUR9cenO1uFAd8tflUQP2dfQor0oHZn
 Vbn8OtyN+lPn4Nc1xRZnJrcvnLNyDU6GqbavGfWe3GMJbPQRky4SgYyTngk8rhdt2m6U52Nk+Kr
 Qd1V+zrFQd/tCBmCCyi2+vWJNgqiCgf9uHKzdykhwfd3pdpAvKJRZ0PLrrCPfJpalL8QG0cryt6
 18R8/mbCboHe9MTkV6tgvVmDtI8OaRZHhMg8Tv5NsmYwFotGurqtiKPqd419gQhTLO0Q7X17F4s
 L+CZAZEm9SlvPH0wmqRinukQ1wikePK6BoLcipCjwy7j6LE8V3gjoZfdlHPEwR5lJ6yo+KhSxUV
 wPF58a7k5+sv7QV8ZuwzmtTcMzct1XMGB2u8QGAUN7ske7TLiH5IKa16GcgUbV4b9/C+PfwMdty
 UnhNk50HDAfsjH9C7Sg==
X-Proofpoint-ORIG-GUID: dqmf00TCjrFIKNNwcvtNJjDSfRF0R0Gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..463ca9a654365 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,75 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac4e000 {
+			compatible = "qcom,sc7280-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac4e000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "titan_top", "cx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x20c0 0x20>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <258480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <531480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <1006560>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

