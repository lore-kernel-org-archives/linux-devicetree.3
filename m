Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583111;
	b=5qnAt0LVJUG95QrgGXVz2SgkNTyBAmX27hmC6vmiAP0e9ajHnnxjwip19EI3u6jdw+AV
	 /y7xwdU8sVKeCulLjXinf6gpF48IUaaNyHuIbpLzmz+oLnlDxHDjCXHKZkPD2CbDx4Sj3
	 /ja/UGyMGh+SeCidXhdNYAgW725Y5YA/bGgCgJ+oK+KUSBwAAn3EnBbJRXXaoYoCr/tMo
	 FvQbLjwHYJz9KdgW1WABHg6tWnZnQQxmCsovkjHuk5TRgmi2Etk46kQ/A2DVbqIJfYx9t
	 B5rOprql9DTS4Qf+5yv3ZM7CaXAOMkswJg3+87jRY/0ZfsCS9TIfkQHL3kHSn574V7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
	b=MTyRLvk4iKornFPNB/ZcOOAEZ0uMOV41UlcM1PMArCXAUOQvgNW+V2CuXQw/FLOLGx4w
	 aGNuT0xIxGFsp8p0XU+19/9rqthbyOmcGw+vpTOEKYGRkRJkGcr2BQw4aCd6AWK8bmZeW
	 MBe4RRZJPwy0SraRQYfP8Ee5rZGM82VZuPVP2QhNCvINh+XMyHn40GQuGyp3I2G262fcG
	 20unNjciMl5Tp2SzqUSn9lRWT6QUoYdtP9LFnN107M+VWsa6KaxY7kpsoevEstrenUK4V
	 rh7Yzf9g2kcheBVqRsGxyHlPpd44y0fJhc0RluZ1cO51u7gA+096W936S5VlXl5/tYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mf5/vKjC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjjBOknv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B74606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mf5/vKjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjjBOknv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg8Hk3225075
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uw8HOn1p1eSQSwTBq8Y1Cu
	ifynw+A2KsCcsyQI9cCJM=; b=mf5/vKjCMM27Gsa9nkwo7PjQ3a1dhpNx7+mLDz
	avt+TSZTRK4Db1vKZuhKdFAuby9a2cRtehLLh7+lhIe2WcEU+aH0VneTLnbXAFO6
	xXiB81MnnhEodvjaBD/jyJvUrukgOHZgJM8bOgOCTl1Le29LsHXNvP7yPQ01ClBm
	KTJZwozqG+32htp9tAT9OOo3gUjRcfNavoJ1oK4oxRdZWbHwVf5h/IQXPXwtltUk
	1xkIlf8qhQcse+K5mY+gMuTRH1gsHwwrQAvH07MmH7Ga/ZRosemfcZextZixAfv3
	o1OlqKncKOs4brOuuDrArNbXtv4TeZjQw2Um4/nbqaEEzsPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78uk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:45:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1199235eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583109; x=1793187909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=IjjBOknv9H1QX4NkUvOdKa45JcUBCI0CUBD4ThU49mkjZik7T/hWpuNhtgLe+oqwLK
         c63zBHaFOl/4IhcFJb1yZPROHC0BnzMjGuWsSRo7frTZsVBbALfu7USyeZU16cQv+e/i
         TaddiJej6sxgA53QNOlap+CPlhJc8G5LnJFqEPXCZZKBJ8ar+joEnr2dDetEgE6FRS1M
         EeoIjVeb1OUyNim+NE/qyuVWLbL1UoJ4ZPQYGs2rBzp9l3vo5pCfgRwwtw26bWiBS5/x
         x4h2VXpyjPTUl9tTb+v+7gtqWYTZFG/GNEG2Bbd7fFhyaDM0rREvXrt5m8oF3BlDfYm0
         usrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583109; x=1793187909;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=yC+dD5QvT8M5ot+kHaChzT6gX41wmw0xA7Eh/V5livyvNPox+mzLvr4IluCzAnuCK6
         RDfPVhNaI9jmHAJBnkzxvyjZlZfGUk0DPIJvQO2QnBImoV09n1I2JweLbWmP5Ux0efCm
         pDH7ALVnpKHwc97Zepy0xsb/vutfaCW9i+fAV9VuFcy4BzxbASpox4XALs3VQphJFgPU
         TFOutG05e1wesCCBKuN3Es3OW5aQmimgnVO9Dx4H6ZSV/TeeSQYSdEov382wb1ewDEXo
         JsktDgfYMXaRG7oNdxhlmGJQRSWj8B8wBNm2U3Ngp89j6XTlppu1IUlcBIGOr/NyIP3H
         pUQg==
X-Forwarded-Encrypted: i=1; AKwUvBzl0rg+AhZxvAzlb78BVYczkNlDb1/EKHot1/qPqdwAE4QmVUtFtMvnOX5Aw/5PQvCJQYghwwLkjt8e@vger.kernel.org
X-Gm-Message-State: AFq9FYIQltoKhilaiKPqmeqUE1/N5nke0CEiAUGXcvqhJL84iLt57gyS
	QqxUhEjd2lDyTsNpe7TpAW3zzG6z9TT3uum6eU+ZuQXR7nEQ708Bydicaa1mY7PbqlTPcf/vd8k
	hmQVttDJs46h47mQ+v52bFEOKBSdVxg9dzPdRCWnw/gBjbf8ZPoY4X4WF4xCTxyw0
X-Gm-Gg: AYBFou3TAejHQ77xB7zGsZ8G0ZSQJ0oDoArJiLiJgsLks+q3Qr2+2b8GkAxAiR9TrrL
	f5D3KQskE1vI/cTt85+uM2b4kDIgvxuIoMcTQiOq+OXd6XMi8cvbj6/I5Ns7JbW4GQxlkYMKVvD
	Y2MVfHvs9DMBhG63Md+4tYDGhxLtJC1kaSFwYxgJHKd59YqXeILozKQ9zhyWo+2anbk5SIalJFS
	GMW1DIfNpxuLGHbqMYhGXPhjyG6gVYpiC1CgWeg3LZDF3XPd41/ykcJPgINhTkNQy73j3WSqi/F
	Yaz0yyfQd57pBrT7qAWVhSpuJXqUGW7d2IOKsn83gvMA8UliljUCdO1qt2Fw0gnzHFW/cosBhZt
	K/J73Lj15bCwxO7Uzi5u0zsgxAQZcDe4=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595179eec.40.1792583109077;
        Wed, 21 Oct 2026 04:45:09 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595123eec.40.1792583108246;
        Wed, 21 Oct 2026 04:45:08 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm7556732eec.9.2026.10.21.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:07 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:15:02 +0530
Subject: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL2l2GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3YzE8kzdogxdEwOLJCPL1KQkU1NTJaDqgqLUtMwKsEnRsbW1AP4
 M1K1ZAAAA
X-Change-ID: 20261021-hawi-rh-408b29ebb555
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792583103; l=1802;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=TzY/8yLb7ebLKUf0lf6FxtuE/z9EmJHPGEB+lGCDCOY=;
 b=dKfV/PdNOkQZRAlrWVQ3ZwiknN/YmycciTttmCFN3Apbes+kb3h4kBbBZ7+hzkEym6bVUmcjc
 GDR5dAcnfWVD0H6wOeDkgudDK7gA2M8JE5J3Mf7UcChfUVsqupX0etw
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: UIISZisvhwB76hXYPNjneHUhJdihnacZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX6T0ZCOMozr4S
 pywCbDwYiYGpXXoQWMAIeCRslD+izswEB6fQd8b6g1SK/tGOfA9XFfgZ4yYu1ACIReke5Ab3QRJ
 hR+crVXRclsztP/h3VX46pDi4N1IifqAh8/PGV4sd2HndUIw7mTa4y1QRFFdQF10ioFcLMSpSKn
 347C7kuhE4dCYzMhc6vTE5gBANeeFerYMdSbpE8Wio93f9xBQ7dS1Oeq5F1hLaDx2X9DTlr4wLJ
 RhfIC9tW6dCXP2drIilItAYJ4GukuhakiEb62tyGnSZ/RcC4atcsrKL7HtIARgmGL1al0ZrRpTN
 v+lkLVgFzvootfKk+aiDJvwctclkptjgihJsA6Z4NMMhADc0VzZiQLXxmnqwJ8fphmaByJRj8FK
 u78PzhOhjQ6vFpmYUV/2khcOnQhWkAKVRJHMZH/1fxEn3/iwT4U4p1ZJCKI9++EUtEuXHx95tL0
 BAw6XnkL9vmbAbBpDTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX/zkpNNJUBTnB
 G8sfjNvQvhCyxCgcJLfKLTMnMmzPtEuk5i+FVAfIX0AjzexFOrDZ1+VbAr9ouQ5nHRupEdhKvCX
 DbKl3CvJLjDA65GQ8KiapYZRciwRoOI=
X-Proofpoint-ORIG-GUID: UIISZisvhwB76hXYPNjneHUhJdihnacZ
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8a5c5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ecT6ZAH8srv0KshgsUoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..80cb00eccdf1 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -441,6 +442,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@bd500000 {
 			reg = <0x0 0xbd500000 0x0 0xf00000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3781,6 +3790,9 @@ fastrpc {
 					compatible = "qcom,hawi-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-hawi-rh-408b29ebb555

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

