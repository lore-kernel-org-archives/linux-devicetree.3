Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695112;
	b=mizMNnuZDFKK/TT29Gq+ZzHcna8xb/Tx7weQsNI8nfcyW7JIJgF1XwjnbJ3EYnJo9s6R
	 5U/nV4Ntwwz514sxQacHvXii723eptlM1bRmbjmWR831EWiylzpwOHPKk04Q9omVE/UFo
	 SQnHHF1XRT4j1np+3OT7RABrdU1NMtOHGWY+VKW88OtGFM+Ozc5MZ5KjmH9oRB6jj8W8g
	 38aBU7a9DR+aApO23Ur49lOfwRRUQeW4kC3Unaky/zc+S6nbNy6c8wpcviFUbCVJOM6qE
	 ROCZYchq7JcaLtgNp6/XJRTKPJpMmsvsoqpPGBg5QrZd0/khlOxIH8XxKFnJiSEDWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
	b=dNHn/yk49Y4LajLZWJGl2qfKZWd5SvOMUoOraMYw3atB+UTbk+4//ke7508uzhzKh6KK
	 EzR8h0/8EDX1vmUK28FVobnPx17ORawEFZOhPFfvLLmrlwRYrxcQjtDNscJzHhLPxvHEq
	 yNOatTHH4aMc0asyXoFFVDrjSIij9BsYYWiLEvf/z0WRI4/MMtEx2LkHgpM8XvK+8MJCn
	 zoR4eRGAVrlfbN4O/Z+hQq1zHYQe/z1wx5KRrCgoYqsBblWLktWrWULVG1Q1Sy8IpzGr3
	 eW/DsoLAEn0Ft2cQ31MP2lkW1HlPY51rmEr21GIZTY2V3apR8O2qjmigpijuGQxnoQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCTymJZQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5vwu14M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDA606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADDA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCTymJZQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5vwu14M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVN5i3893640
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6asvH5wJCav
	hVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=; b=UCTymJZQNu5+WfDfqajkoJdrGSl
	KyQZC55I4z2ORzP+2irQLb9BZ8zxfjhInVAfgizKEfGh9QUZIIUaWVj63f1+xvpD
	HNDiCVyrxpYa6Xwv3rWtFg1kIHvntSSfczjXZEyCLtxasukAd9akp7P2aEaHgXqD
	1ZvHAiXAI35Qv9YD8un0y8ixgZR8poqqcaoWlTK2JSyP4aw+brBRm9u0p6ElvPzB
	A7rIujdmbA19JKh4vQB9/WNSanG7RlTpA/aEaM6dz/Tl1DcOsDdM0YhxLNMP0dqM
	vlRv+BHjJ1uQWcLWodvieDGqd6JDEK66TuKOHdP4+4pAq2jOiei2SpzyTAA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80r9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b588e4bd7fso2076140c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695110; x=1796299910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
        b=I5vwu14MiBNj93ksKL+LGPGFlnE7qB7U3LT9PmUt+9v5nzIXiz/bjj49qNbOKF9I2v
         aSUHvXiUBKHUw+G02ryjZ7mvJaynSksYhYbTX/uJsQhxUYQSobMNeKdaUhtqJIabBn9S
         gOZwsNIxBvj7o/zEKoIrUgPyxu0X59zKSmHblV7kEL8gbjtmv7iNnLuFC/ACFhCYXZiP
         jPX6DvBXpABHeNnUa8WBulm+w0Z9V9Kaz+23TlGQgvqawEuQQucHPgoz/SjG2AszIO6/
         shLrcNhcsGTwoxp8rnC069xDq4pez/oGCYceRSbtpE/a0VJGLkrIPYaP3cxsq+zDGpHH
         O9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695110; x=1796299910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
        b=xrwdJCWc9Vi6MYeQSZWwiH8py/VfrVdclCso2xGcO3ROwrxlEjP5Z1egQ/lBMXRbXX
         DpWfB/UXt96GH+yoeNZWXDkfbfUVFepZKES/Uow4nNTkCVthNI57e+7zLCWwEa1OdfF2
         mLVpU46hVI6MdnCT1Wq/DEEAher1sOCvszqeTAkdYTI6ByCw6xt6teYuyc/SdIcVbmMW
         EzzTAuVfnCD7B8cHzF9gMl1UNXIXTOOb5J1SUW09U893eOoSjQ09r1MeuwQRgxVH0XJ0
         BIgCWWUgEsXU2tZInpzZoDzz8G+ORVDwPHXR76xqFJPNyMUVzlKLAUk143no1ZDGqrdB
         1I7w==
X-Forwarded-Encrypted: i=1; AL+hErGstHLvlQ/82QsiFUxoimTRov9A678jlnZisI+ssYQLZGcTDTZLfSqJbjX9ETv1rRe0S3t38SXoVV21@vger.kernel.org
X-Gm-Message-State: APuU4Z806BtuVldlZ4dN3N0j5H4sB4uI1JcDTDb9MgL3Hk1+IL8ud5Fr
	+3fEVQj6oIcr0mhvaMpdcnoHu6Cx0GTzHXRMegpVpVcd7sVvYQFMyIT0WQ5lffJe2CVI5y2pFik
	GwbHoX8hE/zbovfmC35r5+oDwVk57JXGLfgXJ3VWDGWQ1ScqW2FpC5A1VgQ2gruESpuvTgHjU
X-Gm-Gg: AZFdTZeH68qyEffm+lWVKzZZyBlOlxuJeiUeAtdBelBESctKen0IQhWvZbFPBsCiWyL
	M2n0PyWs68O3t+gvURc3OJ0YskOf6wWjw2EoFiPxP8wmZwTNsF6pRrPW1qABtM7wwbL1XYG4TAf
	0n0HmqGDajioDZpQzeACTmhKB/UBjHUyOe5TVvhsVGvAoV1jdDsl0x0LFpuWOwdNXNF+Ma5EJy/
	C1gR1LIzvLVU0EVZ1B8lHtoSThP82u5DIZujj4fiaktRahodf0LMBt9b2fYRPr4hohmMClbXOAP
	Hs/4a5dTx6RziiIOe2ubciKq2uQQ+1Z2h8crMnsYDvw8ABzrcdp41IS3djCScCpI00cC8fIk8jJ
	DC4+vfqRoc5dW6faAmPYLl6McD3PXRJLlqZeRHY59coXF5pz7a5A5oaixiP9Z+oskDqhWB77AtL
	yclg==
X-Received: by 2002:a05:7022:f516:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b5567c0c01mr18076770c88.3.1795695109940;
        Thu, 26 Nov 2026 04:11:49 -0800 (PST)
X-Received: by 2002:a05:7022:f516:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b5567c0c01mr18076744c88.3.1795695109225;
        Thu, 26 Nov 2026 04:11:49 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:48 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Thu, 26 Nov 2026 17:41:39 +0530
Message-ID: <20261126121140.1716190-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
References: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XySm_pjMe6hkpFr0zbAjaSEfwTHJjzcA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX3ljNtjD8byO0
 uCdgdV89d01j4zo0cQlbkc8wqJwHF1oZG+KX0LUBqRHTH7YQk7zF8eb1FFO+7BhcQy9HfwAbIaa
 Ou3hojL9VxnE/E9p8p1PPdvUzGCKnmk=
X-Proofpoint-GUID: XySm_pjMe6hkpFr0zbAjaSEfwTHJjzcA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXxnFijubzEYSf
 hUTD+xheG0U8W47/d0P8a9gWVwGOqOgGPohSpqV/rHAO7ADYkagaenLy0zMyAoFLKqQHOH41lNZ
 rV+z2mPNIPWac/cI+LjQIKcU5fHI59QkKunc7Sd6m9Zk6P3XFksk2fBRVjfbTa0g/+mT0Y8dQVn
 tndQnkcnbfyl9QrYnNEQQlNb5PxyG93jlBTqlWN1kIMIlQN4+w2cGUFu2v9gk+obeYkv2VJhk8b
 ZnjfgHgMlRZ2Btmgw915UzdXBnxac3U8RHsUwiIJ6CppeT5PnBPWWQABrZnm1fB07kxPoR71QVB
 6mdw9rWCqNp+/pOs/YWfyL4A+4hleo8DwjmRAJGlWsSIZIiFOrlgGiGkoFzjdyStmHVwHc+/KNQ
 TWNAp2DTEFfdIYQzbOBSwV49d836i+54fj47MAZaim4ZtlSUC6XiA7BiXKPLHXoCFTZotQttC+V
 trVwr/IPvlh4V5bc5cw==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b082206 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DSWJuU78OHK9oOt2xpEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

