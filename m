Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4344F566
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203144; cv=none; b=btnIxkXSqud4Qelq01K327ty+z93Y7h/oJH/EIdBBabp9EhixcUO6IiNL3c9iDdZv9WYB60GedyRYXei5Cx3SXgXa6hp88JcahY54iewZA3SF7zyPkWeHT7bvXEOFn4zX+2FHJKtmsXFl1di2rSHATeay0kX3d5XqXmXezUuBfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203144; c=relaxed/simple;
	bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgI3k/fHsnXK/uU66RuYRGd5L94Sh5Ug2xFaDZ/DfsFzRNvtjepid3dJZNL1aq/7IxCA8nhUIV/ErE3ZmgxMCekORedmBm8kX/TYwLf4b80TkhHoYQaRlc6fiRwrCvOJyESnj3EDBFDJuG7gIELZQpye4OVYHPhvXceOFiAnVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIACho/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTVWnwM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIACho/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTVWnwM3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFHPM1068042
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=; b=bIACho/7NXdIu1PH
	1G4xPaMB08dTykt9/XT3oTfVXnk8Enyq+4I4aUeXrhc4CzbvXU1fxE5SGZtPcRsa
	yElcjvp7+CZSIw/N/lKRqi3y5zkBJBe5uJWPTgtEFxz9Q1b1EDj/FaYToMNUFgh+
	0COc9M8RvmzC8jZx2OxdSmBUQ5mCebYV6wcY8wR2ONNHAGsm0qV4HnIhG+LZ1Fvr
	YDRlr6pAhcBzeJcBSVsLeVBQ3HiFw+LmIaQDLgTtP6MlDpgGlkL8f924hTIz8ots
	6gsqxDR0BbFba8iMiikGyDIO2TvZJBytUgcE0+T/V7mBqFqMJPgzp5VS3hNNp6ib
	+XJFbw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08np86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:25:42 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-806004ec379so2485326a34.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203139; x=1791807939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=VTVWnwM3pCF45tweY2tV++WskO6m0GD/Sea32ySbBiJG5np2Ok72UMw39ACcJu1ZXl
         gNoY7Ej8E3E0YFpQL1rLK7Tj1PQ9tnsN5wrNG7TMwfkz2pEf8ApBh7mEv3X5WR8O3rCx
         1uRBOuNRsQwH9V0v5ZKI9dSEm2FONKMw+Dj3SeJxT7XmgvjHBAl/+gTVNQsejCG7/tTe
         StC37eDZZ+MzjScNBHs7r64JgfRTcsKRW259L1zraHN3z6QHyjux6CjcN7LRljAlAiCx
         /HpIapD7HxryHH1OPKQlmXucWGSDnYDEdlYaOKuvxugWBhavBoE/R7E6ifYz9DczI2X7
         dMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203139; x=1791807939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=cJd5o/N5PhmNDvg/looXIpUN6UXS7Gm2TURCy+qZfTbWQKYzjYV4zykTuvpBUnvCGK
         8MuDfkUaQclKS/0NVcEqxVEuwIn/20m6DpxxW7wncpn//4u0pjcJ0e3oIT8YhxLjM/Fo
         aAonrJ3vI99PtXP/Jel54O4H0X2pxrT1uTPilpNj/caOow4uJVM6a4Cz0DKZiJyGQdBo
         7jMYJ+1k5AGfHUGrwqeQF878yQum1Rdb/sX+GDyr62GNJIr9bDLHgPxZwyOk49JveT4K
         6ATqk+ILVeJXfWGu0tuo4ynKDeyCXfrvs9HjPXYaglUC3JBp7Fv6xlucimRr83Y7eU89
         yygw==
X-Forwarded-Encrypted: i=1; AKwUvBz9Op9eJezIJ+BySsemMRWjLppSfKl9aY0zCAYAMWXD+mDb2fHdTHaM9T0dhFN+mALe73xrrkzTVwf1@vger.kernel.org
X-Gm-Message-State: AFuF++l3PQUydKc84eD3BsX9sVKT/qEqMU1ndx2OhCK9WyDOOx16U3hr
	cpzgfSCZZjRGbkh5CRCpjQYVwwA9QtEgBfuzFQHP4lRUueycKnDfubiMsBhEX1lbjmBt73TPGw4
	KKKTCZmCjceWwF4fNhzXKzESn62TV1Qg+8/5XkCIH40ikbalvn8pGB6Qj2RX0Rr8Z
X-Gm-Gg: AYBFou0c62J+Aym8aK+wSSEIQlB00l9UAuyQzOeB5j5MUw3i5+UAh0H0QfJEfxKlrm/
	DThK3SeCX0MRRvdxztihCfcrQ6//A0gCWeQ3WRHGB3WAp/9jvGvlbEx0ImE+jQvtEceW5/5inJi
	AB6+GIWWaaKtpos7R5mbPMolool/jjAjvS41sZmfilb01nuEC1m+PqwU0EpPx6y7tBbuJakT0jV
	O6Sxh/gBiTVJf6rJr+s4tM+eil3FhKiTuX1Q9xHX4EO240SFOOuWLdw6akO9BOnh+fyDQDimfwr
	4TbABkgca3lez7AELJWm2/MIB90a1enFg5bsGUZD+V9psZebLD32TKNyydehcDwVhmmKkb5XObT
	22Sb99w4sw6pJCGdR4gUg+Cv/I6lP0yKJpA==
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939118a34.21.1791203138540;
        Mon, 05 Oct 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939077a34.21.1791203137992;
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:09 +0530
Subject: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1189;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
 b=e8l1k2detbM6njameVDRrH/P5djX3PqBAZVb8P3wS00EMPs9dUybaghEOX3sW6EI7fZ0bXx++
 CjMaS1zZQfbBDDLxQyq6T9+PD4Lx5cofzHLt8soCQgoiQY/lo77AtBV
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: gVNFEThygdZFLrwp4nmatT352TZ0LKBB
X-Proofpoint-GUID: gVNFEThygdZFLrwp4nmatT352TZ0LKBB
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39746 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7lgHJA8f6TKe
 MNX6Wy7i05W3M2lCPyEEE/46g+nt7+lIJTkVblxrtKjRFmvyBtPv3TPd4Ax0rp91ttdqfxPjrS6
 E0vfTQ4QXq13LMfUAcbEa6Ocs9OCNlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX8ThIf1BlztZZ
 UHlrsykRbjuJ7DPfLyGBn7t0hWjMsEBqzM8wuRy0vV9qiWDCuHYMG8cvfOjpZdOftEpB/TEaZKd
 gVe4QBvupuZI+pIdg9h6EHNU3Tlru9QiOSZUfvrQyx/vGR5NqWhILIfbW9WKeizcQ2QLkRcMftJ
 cfGPqnhJL2BIyc2KJe1BcY4QIVAtWbzD1hYpwz7GzDFiBnyc4o5EexVgtwsK3Pr9xgZj9ejPa+J
 LMa7d61Tzf+IbWlRoz54nrgSAEOokgen59N8lAN0Ke7Y9SZLgyILVViJsK6zDB2LGH7kzy9icab
 4iGYSTddY+De47gIdhbr6f0kg0OtIQmaqdy90/GS2qsUM7ijoyyzOu58QW76tD9auSbVDqfrr67
 gPa/LhhFBKFd/+wGgEFPNnUcDotFXw7etIgR35fP1kVceUqzuZjAcN4MtpAVawJCoNdsDXdjFaq
 6loHGI+61zCMdIKE6ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

