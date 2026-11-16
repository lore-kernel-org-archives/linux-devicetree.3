Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829460;
	b=f7wmipYpjE29OCyxjSAmOB5nHb6rSsixL9kfH6YB/2be1VXS7LB8Wz40S/8ELRK4i8pj
	 cDDnRWVKmoZIegDGHVbt5quKYvH+jEU9xS4GISVex9Z5Rrd5CderjTBQ0LcJISBj87zRj
	 mS4+zPVIYf9QxNKQGpkgiRQEPVWbwpvrsUNBrdkCSg+IRkaS+xV+WjfynyLlREGkPcDoK
	 X0jEG2sV0pFCNsKHhDnFhl/knPQsxJjxA3FeKFJSVyjFXso1zT3tgXcMBwTYqTPoF/jyB
	 nDUC0A2SjbzE52UFIbJ87XbReKHpgcKmbJ6U86bK4vEDP7qVQyHDrtReEr+PxYr6rug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
	b=5DVsHOfRbV9tMbBdh/gi0ncgQnn09hVry2kbHabi9YFGRxMKIWrTAUYfsfydTwFOxkwS
	 Ggzq0weVOSb9reDWr5mNHCJXg/rufptxCag+32+rwZcaEn00RiLbXHZUR32FqRUIGsTE2
	 2PFmLXtqzXwK9R5LyROoZ4H4ePhnuOL4hS2URhQHqBLOnuVi1H5KM1QoBQXZcdbwNhy0M
	 SiHQ3pFc2YACMTo65bVMwxZlQ8OfAjHw76ivE5sWAUz/4A0KsLAsSsNIoLK5qh9WwBDPY
	 1r+K7vgCM6Z0e7G1eBhZZjHRkUdDSyiPnLV9uc4OOgffAZ/x/FYT17QMQdYxFPzX7XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dol/fOlm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B9606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dol/fOlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLcXm2388081
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/
	W8WvJjKw=; b=Dol/fOlmqtFTlwG38Eoj03cAsBANyF3zU5yerqX8RZU/ISPd2o9
	+eLzOTaY0AzeLgQ1vksuOPfpd5ac6ZFM8ffWXYeUVcd2/QIftE205P/Uz47z0jDD
	8hsGAn0NQEbPa0IW5q0fHsX6XQARAaqVlyEFfn9lxaPugACT3oVpYfBLRDte/ssF
	flfX4IvuEAmHhz4O0Ch6d+/LbylQTbkZ1Se1hLI410oqVopwwidguyKrStI4kBA4
	QVBfHv6MoOiVmzP28U8GtwhVAD+MuWmw2VXn89W2NqXJZSdaoKc0X6md2shkG7qc
	C+tGtDdMJcu9/Lim9K6TKaG6EY9OSEyVnuQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdx793-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so3427693eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829459; x=1795434259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=fEZFj6VlLBDG3NefQ6ZJEC/X8f9ZlkmiknefqJn/39PVzu18+xAyPesTvneGbCsSuN
         ABJEf5ugs4MLj5UD5ps+axU/pJwaCw0hnfzuHLMxnZ45JaiAeX0D3m5bDGRPmhGYO1Pw
         npD9ztDSKZfFWKzN/UnfE8EtCpHGwZWJuoBBT28aNSTh0KHWmf3lOFGEbArJ5g/Y0xsD
         3nPSAGcF/OLRd09/wScbBVctsEdnDcS+/WjPiysgFkMBnHznjElmnaQnSRxJ4SYBXxZl
         N74q6RHTsMBNn7EcShDkK4cXMuNhqPRNhHZ7/JayFFmczrBJcs7RiqfpGq4PWkIeoJp2
         GeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829459; x=1795434259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=tkF76anLKtf9xq/rGhqz+8OaRgxNckICYx87b0TVyXoEvqT78RaVYh2vdHdoYvGdjQ
         WFh6zLHqCcuCnusX/Hi57UukxH47Fzu76dtbtyyY6xeeLxHZ3ft6Jm9ex3x5BoFC1fnw
         MKrOoMI23zNzFj5n6/xIFc2WAnGkxmE7ErMMQ+JasICQTY9MXh4COLblU7l81aStBa0h
         oDN13sgZ58zbgK4BeQTOYJE1f2uFB0sbU/UGI32IwFYwtXq+C62b5ONhv7PaTYWkUyyu
         GzoEHxElzDhmQ42D/y7IMmVVJPWCdc/t6y25K/JwuP8/UU+8ZjVzUoS/PW9+j+kCBnYl
         w4KQ==
X-Forwarded-Encrypted: i=1; AL+hErFq+eR4ZVrQBN84cPO8AkQFoUkoZuNf4Os0tA48JDaBmDmqXI3kpF7+sBxXkEqD0a21VeDdhGgyHUSa@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCdt2qLd33DD9D1/5t2I6rRbMWebsyXtNc8TpUykUDivs5Qn3
	Lx4DGIV7M/4pQMuG9o7E7ORWoG10tD6cnZYyHE4sgHmqiihFaXjzsTNwjuThnwHEbxHVcbPTLXp
	Ybv4AJTGOE2rfpKJyVrzhmJHJS/0acG2InLqrPy9/J/y3GJBH/+ySwmMCLglQJkh1
X-Gm-Gg: AYBFou1PdToKq9gJByruTWearN70UkF7h7T+PhQBy+nziZwctfmS664bRes1WubKDOj
	dBnEB0wvd2Bzjk8VxrLbu1a3w+SXgi0xWRPQ4GbJy7sFxrkHSteISvr1y9Y+GAD2cML4y+O2BVQ
	tgAkuVwTXs6bFTsmTgi5ttvsf25lvNY1x+lG4lDWTHH2NIUuNYMgC+yLWBTGoE2osjB8qM/S1S4
	Ii4GPe3Pfwely6R0gQiPelMMaCk9ZiIZVACC446z+2qa7iV+OsBuDTlyoLAFKuagviQ1WBPg/tX
	B6MARRkhi2DnCCVjpVMuHM5HC5Nzc5CSwU/a2osFmMv6ZZIccH5IykhyH4RjQXc+XQvFRVTQUbA
	ImM2bQ5TQR799Aivrp8dO5fPRme7XNVeNBlMkPfA1p6zP7O5JpB1lDT+jdQJWpYKURo/vwC2LMX
	jlZA==
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323743eec.11.1794829458479;
        Mon, 16 Nov 2026 03:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323717eec.11.1794829457576;
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm45612670eec.19.2026.11.16.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:13:09 +0530
Message-ID: <20261116114411.1700153-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaec93 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DSWJuU78OHK9oOt2xpEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX2nVzvTPCgP/O
 zRDqN/2yBHmYMJnKJ1W8H6FuleOWvK8GJNxlqtvQqsKpWiJsUG1KJPwauDF/kY59bgZEMSLVxnT
 mpBqLnCKxBFT/7cL2TgwtQOcxa/UqJQ=
X-Proofpoint-ORIG-GUID: FeysO45bJmt-vORFsw63LqVd8iy5hLTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXycxoVaJLPLzr
 a/ZQ2gtiCu224e7zJNFYMfGwvRo/wkJo8Mm9JqjKVMdAMlrVGv1I6eSAzD4rRCuIGCCVQ35pEER
 EL0RkoDBvsUZGQCLm8IrLvLQn5+jk8AzzWrJQqPeO+x4E13ckqQ1m+V76Gii5FvEKpdtHY/IEhz
 wATL/pIarUCWpvA6Oa77dwjhxYKcvdi//bCDC2akyDL2C9T0CI7gstHu1kGqxPa1EMdO8fpdTqD
 G+hDt8YqfLhWYH3n2XfwzVGO6KnEqcHLd/dTHRT7NcqcNPc3yrX9yGlIpRhpc0f637cWw2YaBDO
 Cn8ub/w6hNnuzqcha7+GWgRpavRPRt3D6L2fw2THIljmxeGgItpC2ZQVJ8F7AFIWBp/MbkDMVNm
 zGgbW2mKXwBGFEqe/v2a0OuTp+fZp7vY54cfSBh4mLfKNB2728G9TdYMssOwzxGwgTnPYNJXR6f
 Se9kqUmpR04qPZPmUXQ==
X-Proofpoint-GUID: FeysO45bJmt-vORFsw63LqVd8iy5hLTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
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

