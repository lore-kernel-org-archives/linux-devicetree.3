Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF261A6816
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355681; cv=none; b=XfJUyamWUaFRuEip/KR4GUN8rzXMXk8Hd8HAlHhdhDx1HER5trG5xLsEf/zgFA4kIVMtF6Gea2LCzAkOS/hgOhcY8AnLJXkvQssbJmWowhLxbup2pXBh6E9VtD+A6kGm2LjRqWxOPNUxGF3IBLT/jxoye1sHgHWef9ZMYztiwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355681; c=relaxed/simple;
	bh=rqXL46s5rfAo1aFBC3py/cLftxsRGHrgD+Y5cVyGBHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=saBiR0BTgKQqpsaJarcBSrBi4W0Ydz8Q10AiwJ1aki7not9tlXhhQaZaMQWWRRCzWPng4Si99cGrlyO0GXHfkAwMR/cEgelwsm43N0ENvZGLzQodqvdcL+c1RNMTSs6VsduVd4yTfrxXZGVWsEJd0TuH1LA+VMM1wEVyQyig9Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNgUsX6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDk9M4OF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgUsX6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDk9M4OF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3xKOo2111973
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0aVE2FwY5Kf65J20nqa6ss
	u/FJorVRRYQdSelms4Hu8=; b=BNgUsX6uF6pdJVl0gkyBoUszAKT0KQ2HfHf56d
	QrYj3vEjWu2kTXEKTKfmIPghzWO7tq9x6EdIkDDIU2cRoJP0xzL79H2zByHvie7m
	6oq0GxTMXfYAtosKX92zvMsovsZhYvJgwkAaPtnjEZ0IAwyGz75gosYF0tNgqaXC
	3A87dplUvTY2UjtWafS4uUxq9cfTg1laCIP+r2EG3pM8bHhgQB5vFQ+lNO2Ul1oE
	vXaf/5QFXp+TlxZiQ3l1mNHEwTDJtLIcM4/gBOOQcbC+pXJFt7X3lisGZ0PTZ+v7
	94HQyy2ISAOTztZa5/hBU/aFjeJPGwor11C+1RRE5z8gb6IQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbj0n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:54:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa860e71eso5248832b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355679; x=1777960479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aVE2FwY5Kf65J20nqa6ssu/FJorVRRYQdSelms4Hu8=;
        b=QDk9M4OFGjnIRlrgRmcZQQ5GOTKczsT1VlippkpGvRFXipJ0HbCuu2Wicava7wtinH
         tLsGFy6ccCWUpt1L9J+ruTtA6RXEoD69JZwHkLEhP0PE66Xn/dxDKLWQG+MA7Dp5qXSb
         RaB7+fekqQXPsX0/cbwQTB0xXYT0yFYnKS/P4U/Ra6HV3X5IolLZNZXpYd+j8jBkAXcH
         jFL0yrVrkmfH6e6sZ30Jaf0xBLCFN1hVrBIL2afQSDR28Di8tLqO5Uw7sVrYpanfUe91
         yN4gN9Rp4zBlzpz5rRs55b38f+bEiSE1NpAW6Jab/AbxLtyREfZQ4trET4fvJv3vCYOS
         viBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355679; x=1777960479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aVE2FwY5Kf65J20nqa6ssu/FJorVRRYQdSelms4Hu8=;
        b=Ftj9R3ly/YI+E1dH0fjX0AtPLlFAT7/50jCnswvgH4lknjFHHVbKIj9Ck2/3/Lb5yO
         oXlTZGe5fYjydxeHH7xMQpsfsTTDwlcoHTvW1r21DPa3kgYQ6HafUYAvLMPZsfxN25pc
         tPvyjEDdODXbjLpded16L6hKX6//zPmu3coiED+zhD9nq4vendyQIgGu+fx4sfzTLJfV
         w6Fd/vFB4xPCDizIladsqO0tJNio3z2F/UgRYAHKCvkMyWWXpwFpSEOkqtMJgy1xk+0u
         V+zDpjeSBgRFNQffTLfgPSTD7X+tiOCY+oQc6EwdHA90ach7LG11AVkWylf+dr1VS0Pi
         g9cA==
X-Forwarded-Encrypted: i=1; AFNElJ9iSJWZdS1+xFxVvlykSaqsnzsH0VXHY2D5kS0/NKXzYYsjN9bKKP/mFg7r/Oiv/XHSJrg+8XkHVgWn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+6EqVQqAiiuuGmOQkRevxm2O30fIi1k3+fkBUTmP9RLtsv2a
	0D9fia9ng7FX3HJeSr0w8mVj11u2+VSQYZEqipsm2OzedM9s70rpme1QrHLTdlBPyRPVOUuMR/N
	pC77DSRf4JQHBpRHJF0UTrogweD0kuI2hyKb+3mVBuOen/Iu9Dbnft7s9yogRPosD
X-Gm-Gg: AeBDievMgok1yD1jmD/SF07N6545rhV5gG+MUbwkLGal57pYpbWOlAEVHQC+F6RucQ3
	76KHlKvUMWpB1AepeK15nGEsYyG0Mb62gGEblr3uJwwoyh1aBzcoXL6g59j7upsflKTUyubZKXB
	MadGBbKHC8Em6CHrXFBLCvU+ozpjxtrk6F+YLp38PJ3+jgCxuC0oPsS5nvDhNiywi9lEiNZc3U2
	5Ovdtw9wCL4Fb1V+qzHXsxB09sUOEyi8cOOnEG2RNlzuv8QWf+VZ9gMyI86wNSLflzhgKNz6txb
	h+x+XfV1xu3z3KHKj5A7Qsy2G04yoP4ByJ+Jn4EJp/toGBsAWvkOMi5FUvqhedjnwDVHYFMGUxf
	cAp7aZgpMDqDrWwmIQU85tuav8kBhH89D2qjj0B/iVDC5oIpfpTO9B/oCkyAc/5X5qZlRszN3Ol
	d/WKJq+wb+muCz62u84Xc=
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr1589833b3a.38.1777355679078;
        Mon, 27 Apr 2026 22:54:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr1589809b3a.38.1777355678595;
        Mon, 27 Apr 2026 22:54:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae22ea6sm1590630b3a.23.2026.04.27.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:54:38 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:54:21 +0800
Subject: [PATCH v2] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI1L8GkC/4WNQQrCQAxFryJZmzIdrCOuvId0UTPTNmAbndSil
 N7d2AtIIPA+Py8LaMqcFM67BXKaWVlGA7/fAfXN2CXkaAze+aM7+IAtv3GQsSFBkpyUu37COKF
 38RQ9VbcqENj1IyerbuZrbdyzTpI/26O5/KX/nXOJNsEFV4bWO6ouolo8X82dZBgKW1Cv6/oFt
 IkCTMUAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777355675; l=2816;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=rqXL46s5rfAo1aFBC3py/cLftxsRGHrgD+Y5cVyGBHU=;
 b=MxYpcizJj5ch9lKYV8RZ2R2NALO/yFR9Fu0i4+0sgUZep3jLfMMoGXhDnW7igqJmHggYXaNs9
 ZGFb1HWf/uzDmotaraogz5UOMmjpqntN5kvxEDZCj2v7DCP2AjzcSlc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: B3aRU-ClF2Apx_wWmLIsuRJg1LZm-Gww
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f04b9f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JzNmrNgVyS65FeyOR0gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: B3aRU-ClF2Apx_wWmLIsuRJg1LZm-Gww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MSBTYWx0ZWRfX2emdB9Ks2KRT
 m8SGeOVCFm9Q2iXef4opGB/Q25MWsvQPAhInzCeH0f2zQ5+U7K5Samt450t/wYMc2dKA9KY50Ww
 v904PMvqMOwSVzehnHTmvG8E7MpsBu6udoS1IfJQU9HW8QUQEW3xgPEnH1FRppMbkbV15gyXLyW
 09SLXFwvzoRf/ZkaQmEqGQKC/E/07yaQl48DyPEGTzeT6h5WSI9RDz44ZRqdRNeBm6WTSNWuEA+
 KrTsY7zj6fKer8fM0FnjPjDFMNA+aF1S5WilsiQKLmR16rgwqIlxz5v6KaH8cRykpz6+71gUBv7
 1IGgxoQNMVURoyy/yWjNKJkcYIeTvEO0aJlksTUkAoy/E+tKA0gupf4x6/1td5qB4tYy6fZydsx
 KjexnpBqoJd864RR/vFTWox11ocBq/GJ+XRvE5fiI0r3EVztkqBCvlb8wa83XZocS3UyhLtQ3hT
 U9i651Mn/KztEpeDB1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280051

Fix the wrong connection for the qdss replicator device.

Fixes: 4f791e008807a ("arm64: dts: qcom: monaco: Add CTCU and ETR nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
1. correct the Fixes tag with correct commit
2. expand the git diff for reviewing
- Link to v1: https://lore.kernel.org/r/20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..50fd8cea88b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2996,48 +2996,40 @@ stm@4002000 {
 			out-ports {
 				port {
 					stm_out: endpoint {
 						remote-endpoint = <&funnel0_in7>;
 					};
 				};
 			};
 		};
 
 		tpda@4004000 {
 			compatible = "qcom,coresight-tpda", "arm,primecell";
 			reg = <0x0 0x04004000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-
-					swao_rep_out0: endpoint {
-						remote-endpoint = <&qdss_rep_in>;
-					};
-				};
-
 				port@1 {
 					reg = <1>;
 
 					qdss_tpda_in1: endpoint {
 						remote-endpoint = <&qdss_tpdm1_out>;
 					};
 				};
 			};
 
 			out-ports {
 				port {
 					qdss_tpda_out: endpoint {
 						remote-endpoint = <&funnel0_in6>;
 					};
 				};
 			};
 		};
 
 		tpdm@400f000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
@@ -3713,40 +3705,48 @@ etf0_out: endpoint {
 
 		replicator@4b06000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x0 0x04b06000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				port {
 					swao_rep_in: endpoint {
 						remote-endpoint = <&etf0_out>;
 					};
 				};
 			};
 
 			out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};
 				};
 			};
 		};
 
 		tpda@4b08000 {
 			compatible = "qcom,coresight-tpda", "arm,primecell";
 			reg = <0x0 0x04b08000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260427-fix-monaco-coresight-dt-20d8d2c5b57c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

