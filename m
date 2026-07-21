Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2A41228D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615412; cv=none; b=RAWlXbDMnfFbp6vJojTLUvnGuIDkE9PXO1nlPtCB8FmJtdMup1CE7VbuolbZKtqKOnc80MxabzOfezsorNotNq3WUXOnsZ8dRSrPlaxExWOWb7+RYOXR7iBT9NAOdUI4ir5WO9JOjXpuDXytXc2VdRMHtQ02STPEymk1hCqehiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615412; c=relaxed/simple;
	bh=8umcBmnbaWPKhT/bCG/xlVEirctwHTcqHHN3lc7dKzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7F2joweOlR+gaWhOTQ7cc5WXQTqU0P1OR4Nx2Z6YCyI0MvuiWBtvVC0UP3HWgjbVAmcd0EEmUgjq+zA60AK5drOcFBBsl68p0Bu/JoWXV7jPOnNsatjPbvAiFxCE5Rn0QXh7cbqsdCqkowuDMpqboNKNUIWKTWEG6h+JSdx9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyI3pMRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUXEOdls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyI3pMRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUXEOdls"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4SiDw527007
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=; b=SyI3pMRcr5Zdxb5S
	RE1lIgZ2Gi0iYF2e8bNtSh+7abPp5iFao00BUlPL6HjrxVqelAQubcFkI6dnFQKP
	IGJUo7S0X8iHxLov1CV1AGPRDahZqSdZX1y6SGaodFt8qxFzIMAbQiywp4bC7c/P
	BUOjQdNgWT15Jw4XXWcTu0OgjJN1x/5pld5b673THARMkjtge0wsgm4C0vgRHM1J
	/pH1n5UvZkFmmKccK925RXQCsAtBVx8qCtjcj2o2Fd2oC2HvnJPu7I9Gh4+S/xi+
	YMPClwHzKjDR8t6BkmN2VVL0r9r8Qtn2g4LanCqZvOtXT2fTOwptDMCxFVztgGXY
	/BEjOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0dk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:30:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so206900225ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615408; x=1785220208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=;
        b=LUXEOdlsC+DkO6EVm7P/uazw/IvpDurvtOixceOD6sgn5t1yq1A32FQZwawuS10qZV
         VN2YLYA+XRY4PLUtsbV2B1z7S5GMClzskqi/B7z9yCy0yeBZR8TKotV9dpoudS6RKl30
         AO4n9cRigYWCNRtFfOsAoslsvyaoVPh6ZWr9l4hWrwU7UJy7mg88kcX5P5iD+itHr+WM
         jRi1sZb0ly/63fphXdUazN2cuuRqxZKQQT97mwpQuLkVqjjSbOQkyrtJhL4RjB6pddeV
         ZB9l5lW62T/2HZPj3gGYidk4xvjAmbct2lPfDCZ8x5B7C6lIoKUeooXef6gpKAI613Z1
         SnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615408; x=1785220208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=;
        b=WEPfTt2wk3KmG0theBFFwJlCxhaeGlIlW7cPvM+H1jgdma/LJ332x66aADv/bhHXYH
         3YCYJYVmnjBvA5cYVMjSsTj5HUq7i7EqntnbLRyjvzDGNSkQq7PlxKJVc+t8+OFW45AB
         dAXLQprmyeaMqPmmRb81mnKHNIz9KgZGjIzwvDPr7D+zj+R/330DshGcMr0uF39gR7mO
         BIlnPqvH+eUU1r1u/PhWYSCKtWCFFmXazbc/RGkLMDZYOqCPv0LYGEeBheJ4qMFE1Xkl
         TorkUO6tI+S4iy1yzHRDFaEHR1nbheCrBWo8xcdK+X+mxemahjmkLCNDXbdd0yJ6lkjv
         ZCuA==
X-Forwarded-Encrypted: i=1; AHgh+RpB4sTGM3g8Uowp4glOFmHu1ext4bCtpmXfxTvs//pBA1ByUdQa0IB197xaBHV/wtCE8ScjHsQLkIoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJRjGyxR0/hPeFdusU+BxRESpQs3acvn3cXRvOtNQ0LvKHTpq
	iR6leoOXCWXAPkmVqsHS6OuIdBSjXRlNIu7D+2Mkl2PvvAS+mrmtiNXnGQU/ea4OmA4/Cw8tC4i
	dgDDNtahs6aXSlMWRLA3o4cZp9vhhl3KDP0NsC9Gryena5Z+Wli+rhEoNywxy8Nby
X-Gm-Gg: AR+sD13RDxPXqICNA/ltoqDJgv3Ug/tcL9oTy9ooDNaqod6QD6+o989nO5jO6Qub4iY
	YmJIpkP5xniyVEDcKT54P+KvHCzanoETDmJtpAzQBExPSNZn1usduu0qsTTSmJ3o38reOTCcKmV
	be8IW51f5bvKzOy3OHQCRN8kz/2rxPTcWFFu8QVg/f7zzbP4IuxwFdflgeeU/xLpjftPc0hmNLE
	zU8e1wGPjzN3D8x5z1XkWeXsk418V0bh0rVN0aJyBM/Twf80XJtlnHUBxJopT2l5EugtKfnlxFi
	43Y1HUC9AaN9KuyVik9f7w9DC5eE0wSF9/m90Zu4ElCWhnSB1OgXCQmjVo7jL0dHrCxUxlqPutr
	8dh1dBum+XOpR7oWXVWb/XOwqv0m2MQ==
X-Received: by 2002:a17:902:f689:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2cf3462c08amr192048165ad.0.1784615408494;
        Mon, 20 Jul 2026 23:30:08 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2cf3462c08amr192047835ad.0.1784615408049;
        Mon, 20 Jul 2026 23:30:08 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:30:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:04 +0530
Subject: [PATCH v5 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=1868;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8umcBmnbaWPKhT/bCG/xlVEirctwHTcqHHN3lc7dKzw=;
 b=NEITjm7oqR+Rh45ak+Iz8YUMOCtw/iYGUukbUqFDiWOiCZIe3dlEL5M+xkQw/uHW/BIvDd0dB
 dokIFQIDjqlBZwJdtsjzg61dqbvcuXo2uSVHCzGtbbOsbMfEd5bA5fq
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: QDgC6RWz5gFgxM6RSLeSsl5hCWustaVo
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f11f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ptpooaJMTZRctn2qr1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX+a1ydHh52p1t
 sqikLVQhGPjz8WflGh/1fyWtB6RlZ66BmGwCkIxKyrpNzmjLwZ0HKJiirF1+5r7J+mGEhPC80bz
 wq56nubiw1x6sV7Sod/MjNnnn6nB6n8=
X-Proofpoint-GUID: QDgC6RWz5gFgxM6RSLeSsl5hCWustaVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX7LIf2cEi4hFh
 3H2uH8zFXHNpMVbP5rimj/f9lRp6rGRu5VGHfimGS8uVuYT/TihvRWrOJ8meFZM0luACDoIkGBc
 s5HB1wEgacyhyfgAuMLUDG6ol0zsrjFjvU9y/KWlKVgoVC1D9LB8anIc/reBB5f88AX9LkTLieg
 O/uN8k0D/rrWuOrtW3Rp9y91XUXkCboJVpW/DRN4FO3PlOAEA169egxEUSBjp4PAGKvu+NAxD83
 Ck6oMkmo+jsof9DHxZp4it/TtEQDdMZ4gNhu+1P5s3MB1KXEYBq6XRHghSN51ALQ3mAuXdnLCA2
 J0ai9tPt6vdD0+8S6Z1vLACBhhB3hdhcFC45fZfpM4LyaqhyVw4RzAHbSmtKJc/MkN3IWSXNI5o
 +QwCjKCw1S7e/pzL7UC0wSci1ZuJR5Uf7WQG3YKal6tRrjsgwC1D94gbsb+fP1Fe52GO/ZFeKd4
 SL1dmZRtFpRNDZbaJPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210065

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..5602448f0e42 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3840,6 +3841,8 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -5497,15 +5500,31 @@ map0 {
 		};
 
 		q6-hvx-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

