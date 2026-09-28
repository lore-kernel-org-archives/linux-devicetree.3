Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C965B3644C9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577447; cv=none; b=ILxK9JXvQuUYi9M1tDPUPd/CnpfXUP1lcU5wGBCuYsr9kXCryr2JVPEvJh4nxEHdjqh8WaywxV5cTBNV3R7G6NZhuIr3uYtLyQZ9+999zjb+rUIO0wstmBMw1zjg9omLAQQ2Ln5EqcUkPRDu6JVDwU+OsYtdCnNH5ZqU0t7tj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577447; c=relaxed/simple;
	bh=QI+ToQia8MP6u/kd83sS0akMU5phWxNIb71stmnOyYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2Xf6ArPEFgcxa35pU5Demye+kZrL9vzB4+TBEVuxHs+zRhwNPMfJwd+DrdCTrZQ7jO8rCT6+U8eB26XbtHIZzfI7WFVMVr69Cm7DIh0YUAspQx5GCZ76MQkWHOrCKSehE5OUlPMR/t5nJ7thuPNIaV+2L7eVMWBiFHYh73trAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxS4oH1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOG1YkZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxS4oH1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOG1YkZ/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RIMlfY3167944
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=; b=FxS4oH1G977jPv0I
	Gx/Xxdq7QqkeW3e/wcZL5xGQP3fJnCxImL2k86e3lDb43M4LrP78zqk3IqGFIQN3
	FUbF7UHGXT2yz+ox6mq86E/EQGRORMXxR9mes/PXtc72svUXui/H1NguIP4nrMXE
	73DI1+pmbw9BrpThDSQ0Ihs1P1o8I+Nu6bmF/47bJnbIKVzXpLBjhKXU7dNh/k0B
	tcXNnRgM8tY7kFueZLwayG9o/l13qRTHRHE9y/emSEN8LlYFcM0m9Npdc9ocCllE
	ixgBmb2rQqn22zmT6GDTd9MU3zw+41y1yjbUshLWGx/S2Ug8/M21gPy8qrW5GQKx
	lscCOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jvq7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df7bc60df6so21369805ad.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577444; x=1791182244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=;
        b=AOG1YkZ/HoF9jkif7OAhTx4LlnBmuqs4t3P6Deg+caBK1iQsbzUe36g/JBlG9tFR+z
         k0nXH0+C1R4NmP2z8aGdWSK/1CsTjcJs1rxC7P8Xwi2xSL9W98eYIZsuOqQkQMaIBJqP
         VgPTvby9OJ74cTK4rQ7nvPg2yBhbYlSEapi51osQzpIGnNo3lJ8NEIjfRv0/6NZbQqsW
         7EVqx7gkg8NZiNsmMv3eIYWfP6qOCMMXmSjxHzs/eTQZo6nSMcfky+VqpEg8d2jOOvIk
         +veYBJVzF3slgIcp+Iz/BFcebyBLrtGZa0mL3MeRvA1nE0P+Kdn5HPAhq6GTuzdJuHIY
         lakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577444; x=1791182244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=;
        b=vu+jcUzBMoyrD5TtYnVzp1x/VExG1rx2tOQ23GU2DisqSHeDVJ6W8aES3kx/Moz4q7
         8tkxcON/DIr4NzxFH+VTl7/jq1I76ZEdvQM0jQHjMvP61x6JDLs6rMa64wB6Fd79j2oI
         ikJIH4Hg8HeQMrwa7UueS+ki1bAKtXk8rzHrxU4ttBHsn8jkFSrfvYblr5f82rDea0rY
         j+T2r1T0Oz2BZuh1pxa2bFZD5XfJsPI8pDg/JheMAX/ZaVLZ5sINxxCTerhlkqKNaHp8
         9nlIM/MK6rGMknWUZ1iQcPVGF50M1oqIZTuG95LNLjG/K4K32uvnWETEFctsR+I9ivyk
         hWiw==
X-Forwarded-Encrypted: i=1; AKwUvByjQZiB+rrk9FVsY1d1pLoEDcEvDvt9J5pnmQeRpDqQU5bsVzqubeahGNDHg5SM/vh+9Wm07h5rF2KJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJU/SdZhHHKasy6fITiwYh9M3Y1jRqnjDEaWgKS4w1RLeTgsTXw
	TMKOLudPNQayi2J+cD1q3pPLNCTBGhm/T1Q4JCt5w9QAEdl/y/+tAud1nKI3O77H6/hvAyZAREK
	0BqIXltWfVHKOvNZCvdQ3cfnMPGczXsvl3tpQucvtT5DUtuK7jCsDnggTB+FNxAik
X-Gm-Gg: AYBFou009KHU35TV6dt6vxAgCIckILNxnnjiBWdC+2x8adS7fhwhmfw3ytA7ypJFmK8
	fX0W7IQ/Mf6L090grTwDzB5CGCUTfe4NkujMjwmuz+pTHJk9XyCkHf103ZYYRnrPbJIClsfhLU9
	oAMaCOEXw7RYnfHVLBOiPjx1E/Gq29aAy1ER/Hpuo2jTK16bUPH0FxSMzOmcJaprDNPj0z0sAWM
	x8KG96z1GKp/gAwcTyhC8ww5FDlaVtOeybDF0prl1CrNkVa5VRgV1edpIKHpSF3NjfX/PAdL1Yh
	+vBvqnwqh2erS8uI142+nUfUFPebWdJnw93RZ0pVM1DBH3arKR8SfpaZ5tus/tLY7zoJSzSVcdl
	Ffolhj7RVHV85W4sxiH4TvRREZoBSg6X8GWNcsBpL3Y95Xs/CMzVM3kf3lXWkLmnPCLKlfGwy4m
	4RamoOTq11NeVv
X-Received: by 2002:a17:902:c411:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e2b62454f2mr3161775ad.17.1790577444090;
        Sun, 27 Sep 2026 23:37:24 -0700 (PDT)
X-Received: by 2002:a17:902:c411:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e2b62454f2mr3161655ad.17.1790577443626;
        Sun, 27 Sep 2026 23:37:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:22 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:39 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1735;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=QI+ToQia8MP6u/kd83sS0akMU5phWxNIb71stmnOyYg=;
 b=rSY1Bc0j5c2uzgLJKbMOCKAE9QpQLXbHxWxWf7elUCbFkfzBDWl0SO8aucNaTGaFb8IdpFztv
 x7X/HWQLc8aC+j7ArEtrGkyhZhkXrol1Zt1aG6VbtF5zzALfmQJT5OG
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX6J+AJmKporqh
 VopImI5p9stK4BlWtPqWATQWMMxYyAXQp+5DeNBYbjzDXIjDCFgR6FF5grUkVwU1QVYUU3HEw6W
 Ipe7LIhlbepWRgp1/3m6YLMGfEp1CKU=
X-Proofpoint-GUID: RVMTFo5M--lJDchXIBKkYuwj34v5iZ17
X-Proofpoint-ORIG-GUID: RVMTFo5M--lJDchXIBKkYuwj34v5iZ17
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba0b25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qPkBp05oCMIUEZk5slIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX+jZFBPCOtijP
 VpZ9+sm+biFgCFCqv9TkVgnz19GSg6Yz8Nq2ARJJczxbzzxTVzfmbT41Ba8f23dB1/3UhTY42hx
 iQ9PJqTfuOD1S8SJkpx8ztVKauz08qBXHW0Vy+Hj+ZH+9vOgtKqu13TaOs7PL+Vxk+//Apy8vot
 8+7ZgXdhQVJf6CMXVhZW78c/KRzPbiIA3rWVebztL5xdgh89oDaTGw8rkmj+xyfAulhP8kZHQ9u
 vBtLyJ8xgslQq3EOJ5yE/yFZu632M68VIGTSXnKzQhs790VR42sEjDjlZTW6GSR4dMHWy6tcIyt
 q8CPwV6+rh7bRAnhJHxRtLDQ70x6nR2qnjvoaUstep5NcQMPnU7nIu0vxfCAXzNhaghLZiFKe7O
 dtctZXUfUChRAEDW3dg+CG0EtNftfDW+ehZjK/WhRPVwnb33nhvyIKOXtLSkv1+xTw39F1m+E9R
 BFahH2vAEyslgBM0EPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

Add support for back cover, keyboard, and SoC thermal zones through
temperature sensors hosted on the EC for Glymur and Mahua CRDs.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..571c98124a40 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -594,10 +594,12 @@ &i2c9 {
 
 	status = "okay";
 
-	embedded-controller@76 {
+	ec: embedded-controller@76 {
 		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
 		reg = <0x76>;
 
+		#thermal-sensor-cells = <1>;
+
 		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-0 = <&ec_int_n_default>;
@@ -955,6 +957,47 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_zones {
+	ec-back-cover {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 2>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-keyboard {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-soc {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 0>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";

-- 
2.34.1

