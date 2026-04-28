Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2D37DEB9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405014; cv=none; b=GaAacEgs4lFdVL2XQHE5Y0ntThElGDVdAOHJSUnCJ3DYe2rE0NshNGSXrNTsB8BLFCB9VFcw5P29odC6zoKE/NVUic4MJ9VUTd7cqwK+qb6qLpzPmdzEjErX/ruwy1TCotyovAOhbKuykvIdmaRdi+xKK7dMPfKUbdy/zJN3zIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405014; c=relaxed/simple;
	bh=ne4VVLXjV6xzidOrW2cPlvN1Ry5ir8/CWCik3UStLf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IeVMoiUo30K0+2b9YdO57EpLK6lbKDZvOgzmhBXs+GoxIidpMSBYG4MjUM3llRnOQ7mQsYAaur9yZzgZCPo8xDIwSEIEVbEwKyrMlWGo0hXRMpxYpsY8RX3ohFQUo1G2Z3yPvLkSH8Wrgb58CHCVk/dFz+VNQX65xUlrJPfcNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWqx3obr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDLXewgd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWqx3obr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDLXewgd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SIuMuT3347474
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RsLwX+L+cRCD05EBR+Q9XC
	f92rcSrGGXzY6p7Oj+JXI=; b=HWqx3obrBS4/FAAYEGuaX/htrGNCTA0UXP2xDH
	qDuc0mhogLoWaV1/+esTz/e1sGCpuXPUsm+tK4SkdqHfCcavMZR1ND+QD5/yAa5p
	od02AGr/bkgHJIhrtINjy93v7ky5O9UOD5uWzt99YFwkYc/3Ku68n8ED+mmAQn4B
	4/q4GYqtQkDMpS27DJA05pAlGLGIPJXOKBSVHeuzomIERiNo9O+AUopnzLlNVVk2
	jqtKnGfGL17KG6CHmbgR7YXJdwdk2l2OeebeJH8rDJSHTPVoMLrDoYXi5/k+oM+4
	sQfBwMaX7ENJTIdbCPqqHWUg4Ndors646y9gmiwqtCXZ15yw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4r3td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:36:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662a21d35bso24353753e0c.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777405012; x=1778009812; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsLwX+L+cRCD05EBR+Q9XCf92rcSrGGXzY6p7Oj+JXI=;
        b=IDLXewgdIX0XgwfFK+C9+xyWvawGVljYtrg9vfx4fPDedfJXPcKzvzFrSRJKPKDYf7
         pGoR1qJVjCAUqwOBARUZC6rceYM19XIeCJH+BpSrfyv1xm9HT08roN+MHrt/32nCHvfn
         ExHi/qZgGHCJ0SASAHMpNKcbV+V0Q+wSyr1Ss3IDfJ3pg+WLtntqRnJz0iO6PAjVBVbW
         oeY8ba7aT2XA95rgmXnkUUY8SLh4YWPFQOtO9WJAl2Y8UeTZ1fnutik08H2OS4j7mPRW
         axT3vCNXcmTkD/+wAlP+LxRYZxXM5CR+D+Xf3PALkDKXybt0oIgSz3U02kTh3UP0Hhvq
         Fr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405012; x=1778009812;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsLwX+L+cRCD05EBR+Q9XCf92rcSrGGXzY6p7Oj+JXI=;
        b=f8mQuMW8rWGLISc10gFDP5ZHeCej+glhSjKBvZxyl1M7yegl1NiYkpcagfKAqUSehf
         ztt8ccB3c4uq6bFgTb5ilQ3xLYsoGhCNCOEpgFEG3gHBPNvHZyNCcNgFfcImncTqYxP1
         sdWlS4YeEW1KeAREHSrzcYD1EifE1XQd6dsAu9a0yTl+dpZjj5eE1pQyYfPKXyaMOpQr
         gW1IcmTzRfY4DCsDUHSPA1LPzeMVh0AZFIfjlnkF0i/++sxD35fndaBWTxEEZpfjL65l
         Rm9XRSxuXZem6UH3ePpOYdsSEfQkMz3QH2iBbcLS8UcYx/bqm7ocB8ND9lmy4kt+DF6M
         K8gg==
X-Forwarded-Encrypted: i=1; AFNElJ9vC9SGMENJbqZCvdbfCtlL3mFidjfDUze6im1zWfym/b/r5lWzPEY0VH51PJn6NBPaYauozsnXRZEX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rdt0cdfk0n09Z8/4A53lfJJZ+Y2Ur7E92krUm3VeUi9lOrgp
	OiRkFiXkuPvB0x+bmVl+rrPqjL0kXfvPKftp845AAWrDnxHoQEQrNYV7+G+64q/uLej1a23Q1Ji
	NibvGp4uEvj+I1QdFp1xIdhZlhtzf9MkOwlMCt5pT8IVbaDvYNtrI9eBs5o9cWBzk
X-Gm-Gg: AeBDievZITtIlqJCyLejqjS4rjgmw5gQYgd0CbaQn9eX8RO5LGY2SqQScMKQfGBqnUg
	ctyEfZYoFEKfHPmn3tWaphKnBbFnGUthEa0gViyhM/6IORFotcFszmYpjPh5/88GCxzvXMomnIf
	r/9WdZgltDyZriV3obKP68yhFgjNUKomFJLZ5LB0Qh1LBh2/VrE7PrwWKUkBHnkr1FK/cDptasi
	oAB7XjnhTsPjjXEys0iSI/e6P8L09DrlJd0rQPLkcrK73pcFkXEvx7AfaJwkE9xpBcdPJzxKD7R
	RvCRPWpqoW3eGH0lapqr6kN8HrbRhfiD7lAFH4QHVQtQOUCReeYDxIeP7v78H4MKOofxT7xnYqV
	0HX6evBboAzU/XC8j6z3c6YV0wWjaAyVmhMJzmgsk93Jg3LihYQeGFt50gRUiBTyecHxoMAaoZ6
	w5Fx0ed1wa/luWqfnvKaNTI5BafxHavwIH0G4lbItdpBx9Aw==
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr3151586e0c.0.1777405011675;
        Tue, 28 Apr 2026 12:36:51 -0700 (PDT)
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr3151557e0c.0.1777405011180;
        Tue, 28 Apr 2026 12:36:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924d3541c5sm671971fa.26.2026.04.28.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:36:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:36:49 +0300
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFAM8WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3WQzYwPdtMwKoHhOqm5qikGioZlhiomBqYESUE9BUSpQDmxedCy
 EX1yalJWaXAIyRKm2FgDkNlPHcQAAAA==
X-Change-ID: 20260428-c630-fix-idle-ed0a161d4050
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ne4VVLXjV6xzidOrW2cPlvN1Ry5ir8/CWCik3UStLf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp8QxRQ0YhXV+fWRnuX98Eu4MOP+QO+f9c6dat1
 +IEr/MOd+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafEMUQAKCRCLPIo+Aiko
 1YqLCACzkMLgefDs9atofJIoqpIBnH8skLO3KcOP0eEdZ5Sj4HB/X//T6uqbeKejdQJzfbzhvME
 9rR5LoYR786CHTN2U/E6r4WowfRUl0olEryMh6XCQFbKKPIGjnT1c8mF1fW2+MdbZqkJGRYQX9r
 I5ACChPA19VjPbmaGHLI95cDbJ/1ANX+c+lMh+miof3UOUYUREXFQgikxhvGWnjkGwHtjLGFiDO
 ZCHxpQBzeeru7BGUnjNLh3D+VB852AysspGOp6BOSNKjx5q/myJpVrfhuJ4RtuQoYNU23UIBUD6
 WNCQ6AHiIvTkYm9lDqTD3CILUkZwS1HKg6bDl29fRvCNKEAd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5MSBTYWx0ZWRfX3FQNyF/t/fsa
 lfdz5rlLQTN8i53zcZbE7jO2DPM2Db1/azLqCC2nJHybGhBEYZo0ObN75v4QqeLmm9il6wN0tLK
 LjlVKlRV+bIB620DVp3UFcC2774QtUe3XCb4wUymnMpPQ8J1Ooj80o6hhCaKk/6WveRjINiXYMb
 4d/iHzJK++JUc3sHigxMuOqG5CU7sAlbEodPNnESRvyL1gWIVSQy2InoAlaZPz5/cNotB/2hK4T
 tx3gZs5oAJgemueRwrThjEzDmtMBvASIokTdcf5/PZdVY/ksBZmsZJ0txxQCMCVxQ6M3Ajzqdkw
 OOLQtlhLgez8EpruPJriI2nm/vS55do/9LtCOW5XsJ4y1mNSjMh0ShAP3gBKZSs4Oaw4+XFCPvE
 1ikOUMHqrC8FaOi24ZcPv8biUjWAULZ3dhJbp4bt+C9F2QkL2o3XvH1fMIIhFYQ6W7rahnYMUu6
 GstfHR3MaKU2r/5L+hw==
X-Proofpoint-GUID: BkWuVyZtZX9c9qK5M1P8rF-ZXMCiKGu5
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f10c54 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YmaafWwY8Jf1NbXxEVcA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: BkWuVyZtZX9c9qK5M1P8rF-ZXMCiKGu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280191

With the default PSCI suspend value for cluster idle state Lenovo Yoga
C630 isn't stable enough. For example it might reset if display device
isn't probed early enough. Drop one of the bits from the PSCI suspend
value to make C630 work in stable way.

Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..e6c67016552a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -347,6 +347,10 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&cluster_sleep_0 {
+	arm,psci-suspend-param = <0x41003244>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260428-c630-fix-idle-ed0a161d4050

Best regards,
--  
With best wishes
Dmitry

