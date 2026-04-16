Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B0390C80
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339306; cv=none; b=pdEV493+Y7+RyqgV5wAK7keQ5PqWjtQAYR/kMc9J0ncEL+QDbD8NeDD2ZXSMLLoix/WjCTPYyBUPcAI5UtfMOpeM2Y4tFS0HmagwF3OvoUy2XnlTJ4EIS7Eli8hzy5v2boVQ34DGv0s2iD5XtZM+9vt3Ir42D32yhEdmY1Arsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339306; c=relaxed/simple;
	bh=hAZRszKGLrAk3oaqtg0e8Dh1KNCie2INOW9nEkpV1G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LyLw2zz4dSBxOpSTKywdAoUHHm8URctXmKSooyxZdG6QbZm5f6EftDOS75o9C8dFgAqKXnwUitnWl0hALOcvY2B5ZFg7yEiOnE+WJPIADnjywAC3YFm3pub3hLhpgikulzg9bpwzjpG7y2iFVGJHwfgsLKW2VZa3riR1DDtXS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TplrZMf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyKA3khE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TplrZMf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyKA3khE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xnke4125032
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4S1axQL7mkxBLZ9v9ZhYzL
	O9uuVKtQgDNbh3Uc++7Cs=; b=TplrZMf7WzL3eqVqt7qr96obZ655EZ7ykR9HFi
	MsvU/0JuTORlOWmidSy1PSCwqXvsvMhpvHAHtxdmcZy4eFXTGqJOmjlbCXlicvj3
	e9OGWvDcW+08VXWI5d5r7buzRXa68gxSNgPolaUVmrsIjgGI+/jIzr9Ls1wQo6AG
	lkxd5Yf2byfVMZU1aFZyWnIdEimGUyRxVvRTORwJCHa+6jv+tFNOewPCYGsfBKhG
	SOTLTuyGnJppX/oAI9SnsBf5SJW/9+bIRe6GWOhY9fV8X5lmBxepaS15rfqE07UN
	TcVUfLIEchk07UF/0Ztt5gCjCQFSKHBePCovsN9jDlG1q9dw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf8h1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:35:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7963d8d167so676775a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776339301; x=1776944101; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4S1axQL7mkxBLZ9v9ZhYzLO9uuVKtQgDNbh3Uc++7Cs=;
        b=GyKA3khEOfo/rke8tRSkYmYMEqQ+63avbt9Rjxc/b4oPZ0rtoldKEwU/YtP13I6xxu
         Wr2pWIPZqu/uZlxF4tlBhDDEREoiXOq2+LQ0o0gn0tCc2v/tDLeK0ojSrpyNcNiYIhc8
         MJOWOM24Tqfn9fU5eXjQZCt9E31iITEeGIkDixIfZcSq4cBDyqOJ8jqlRhKVVF/oCvJF
         m+SdGBCVt/1Hs2sLxQsXF8dlsMvNKNtGZuOkYvOYXK8CXiBQP8i4IwEcsp9rRzhX8QAU
         +sx8lRWU85XeQTadksLme6YgsI7YcZn0JR45Grz+27MoyfgSc3+LrTbdWAkMmI11HXdl
         RuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339301; x=1776944101;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S1axQL7mkxBLZ9v9ZhYzLO9uuVKtQgDNbh3Uc++7Cs=;
        b=oTskrLfVN2GqbKPgfX8BbyFFmAYqHboubdkRSQLNmV+py/ExMBLi2BpBs2FuSTbrd1
         ycYYYmpF6d1o+6AKp9xyllnGSUoEZf1rvVcxJ878bNY1AqRqL1cSzsW3Y8koiQ2DjgZr
         8sbs3u1F0ggcEi8NlemFituRMoXh5y9IxIypEXNp4GUnXNySoYxRgzjcv25JwFWlgcG0
         BIb+7g9kJDOTiBiQFuiCNnigUxoRyUQNYrFbOf/k0qJf4jsWJzn3SaFLDCT3TSXiDeHX
         3xxcnV9+ZMcNlxFs1n4C4PZkwNkCS2cHcMzawFix18ZfeR+em2yLbXCcu0u8n6gLXTy1
         jZHw==
X-Forwarded-Encrypted: i=1; AFNElJ95xOEZU5PYlCeEGWZlzE60sBM6ZEuotCFfXRS9vSzkH2Or3vEJEyuWiif0yCtb17mM8+lNsYBKSdAk@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/0T4BX0pqsyQkJQ33GvxsG6G4fuSHyuCMvUZGFm+cS6zMAp+
	SQDCvm/pcQGuiOQIak+L9sJ9g5Z4FCCwSiS40bocwqBVOWw/Tr+3m4w7JGzkNJ/dyikEmqZi8R9
	yEMYE66KWgzB+kVwJyUAoYxLRRVvC1SFRAwlgkyEHyoVTcZ0Cj+OoDZaanX3iW2F1
X-Gm-Gg: AeBDietdT0DHeDQhQ2Vp90NGXzCUgjUq60QYzqBD4013Ad7Msn2HsX9RSBlvTg7QyLG
	QcwOOUAAW6Hyy1V07Pvt6TbwLmBrQZR/ls3YYXJsWmTRpW5sU0ZYYXkMz7smOWTSBflKH6MfXEW
	cv8rKyUf1ogrTY74zo20N/svBsi9ma9NqlqBl/5y0DLQ6DmecdUiLkAL/gQ0qBDqlsOgFCI6CZm
	zVLWiWe/AlWJPIM5e4lO2guDIUIAYZhUPaQhP9+o/HUto2ISTDyuquem3dCIKjOL0sc5uDtKJrf
	sLwyPem3F8k7PIfjqsQSwygyToDEW5S6+O/jTBzDM3Hj6NZPTZpsJGVurfMulnjQTQSD9O25xG1
	Xz8vmKbCx9Y3ZVFdRr25rd5Zo0TV4Ln7jgrSBRGj49m2ENhBDPOQ=
X-Received: by 2002:a05:6a00:170c:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f0c21d396mr24740880b3a.25.1776339300736;
        Thu, 16 Apr 2026 04:35:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f0c21d396mr24740848b3a.25.1776339300191;
        Thu, 16 Apr 2026 04:35:00 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f670374aasm5832570b3a.12.2026.04.16.04.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:34:59 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:04:48 +0530
Subject: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal zone
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfJ4GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3YLSovLE+IzM9Iz4kixd0zQL8yTz1BRT82RLJaCegqLUtMwKsHn
 RsbW1AE5Tl/FfAAAA
X-Change-ID: 20260416-purwa_high_tj-5f87b7ed57c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776339296; l=1393;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=hAZRszKGLrAk3oaqtg0e8Dh1KNCie2INOW9nEkpV1G8=;
 b=IEzEQnKmql6bcs7ebhPEs1uYNygteV8fHrCC2XldatQKm+EfJOO7vnp1A+2ZBb9G6262ZPrbE
 POug3ER/aJRBJpDxTkb1dtjvVq2Pgcz3qiTsxlvVOoHuLCsiZDMNQM5
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: faIFYp8xWG-2MzUokVXh1TS-Q3VUEUxg
X-Proofpoint-ORIG-GUID: faIFYp8xWG-2MzUokVXh1TS-Q3VUEUxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwOSBTYWx0ZWRfX4SbL8J18+rVl
 J5Uv57cHevsEOyxhM6yZtvVA0KMMW0DMGD4rX71hN3niIStKlgdYwgor38srXdmokyquU21sQv/
 qVvMkERWCa7QQgrFZoH9etYUVfmDLyLrih1/yZDFAQvbFR34P5sbIlg8S+4ozmE9afC9VT4Qqn4
 oy2MmmsRy7f1+QebFW56PeR9GIoMSPwQvcNM+x6NCOsFT/HRhaD3jqPDmF3fm+f1K8hpdA7GI2v
 KdCX4hECoiU+vXhFLjG5548pR36dck48pz6+JXKc3+hl5ZFejC0JFC573rGVqNIiCgM986rT0Uo
 4eq0xpRbCZh0mCHYqogfSyZ3g6WnGMmoPKdaj4hj6Us+Zo1XEK1efucG49+JQqIxnylfgsdfgct
 ghqKwot6mUe8wRIVZjWdlh+Z/fnGI6Fl+0BmQbIcxWAJItSlNNx1CFJl0oBatxho9OBjjs6p+lJ
 caYXk2Dvj1A6oDepvDg==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0c965 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rnUGh-oqUXyQQgXjzFoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160109

Purwa IOT boards support a different thermal junction temperature
specification compared to the base Purwa platform due to package
level differences.

Update the passive trip thresholds to 105°C to align with the higher
temperature specification.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..261d1e85651d 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1325,6 +1325,38 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_gpuss_0 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_1 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_2 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_3 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
 &tlmm {
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-purwa_high_tj-5f87b7ed57c9

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

