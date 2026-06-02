Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3273C4562
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439099; cv=none; b=h/SYDEky6tmSdBuWSKqmwlTRKGl/uQDuuxTYBDzf1dlgPWQix4tlpFdzIIzZWaOWlVjc3Z4ZOW8P/q6c8VF2cen7rQKjsPLSKeUfdZgv1JuAsH92nbqztzCD9vfjI109IdN1WXAzfhUavFgLVeSbS7ghV+5YPvTtNmz4st0Irqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439099; c=relaxed/simple;
	bh=DXh2TI45vU1iLpWsE+RYENmxgSc16LkuYVsOKJ6zBAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUYlICi42okZV3jq9YnKmmJv7UDzYgnc56NMKx4RWtZFyxhxzyy0tNukl4qQ4GXVfwgkd/VSBj7aB8KRejkhtGdn6jnVDPU1ajbO6t78CmhD7qusYYtUIxcBLFjGYDLqDhbF+ZLX5q/8TD/GcFtE5j3stLonUMiWyPvLiXbv5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgIvIyfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8UKOYi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgIvIyfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8UKOYi9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EU8o11638466
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 22:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=; b=CgIvIyfSHTb5+Lt4
	G/vpGmyy9FnnoEJ4K8wXe2sGjDvtPJ1oKo49PRf0evNOrHHOFMk0B27yuwAMon9G
	nnMiO7quixhHagozVYNCZ8/xApFry5bChPrHRXq3FsWVrOkPnL58GdMMmDBx3kX0
	7ciQpBxBUpCR6ZObbUj2cwo+ZVHfNBd9TfDP1M4is84uSoijx2mY9e6zIw7omzAG
	MN1D4beevj9til2vPwg0on8m7I4bRHbwOLuOJqxSGblOuJ6KegofKSNeFT0Bffgk
	qItdLRRJwL7vm7Xio1ThXO3X0huJhLXGpCqLr2VV+bzmnVjZ/eIxyXdCltV67MVs
	+SJKgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1ckhyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:24:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso42338035ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439096; x=1781043896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=G8UKOYi9twN+tOagaIqtrtYLq98h1wX8HM7FoC64BIKzl6AE1sS8aGjaBOaYnEyoHk
         yBoMt98sg4OXsiinFW7K6EKiCaMTPqwNxQRTAl7XcHCsGWdxN05dmnZ2rgjvlZb/gLSB
         yEQi353e2aIELthLvUP4Y0u4kPlZDfSMIPvHrOogEYdeccBd+qxyRBKzmc6GFG5XJ8gz
         ssOUz73eJxWPRUj3HH9Rki2Le0f6/G5Ddcw2j1jlEg0PFJ4DWiJ/pjhvLu1Z4918YZUj
         6KO5uIR4kuCvEOU5j0YBxVnEz2NGDUmbVpawrN82B7d7o7CdUjrBpF2Dj30QQzkLMlVT
         MW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439096; x=1781043896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=La2lmTlephDYq6lCsKGVobNkPgFMqRKcrbi+4VQP7wJg/PshuvBpLtBg6V5eRp83UD
         XazMs+RprhQ8/dlUtjASBojzJOdS0+lXmc+YJKRtSX+f1glYji/K/Oq1B+7RqIY6Wc/a
         nrNL2369ukisNkTE0W9cjXOCs3OskVK6JwGpW7F3XsW+IlhqHoKgrtpl+0OdVQ+CK8p7
         bEWnWddrp4dTaXuupUZyltNbgm4nrUQlV9bkNDugJmhBeio6RbmkX+AMBIzlMWmBofXp
         l0lh9nc80ap5U1gSRC0FH7p66dzedZ2V3+tqjyYg4lA39Oq4c0qXvcq08T9T/N63+mOA
         lyqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5Ql3iNP83j0iBE7Rl5ySi43ciU3dKsO9mTxZNybuhII3QFUofHapH032KHkAh5LAiwwL6vOHOG6LD@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPfXhUtdMRKP0p03JFYPh4QBZh72ME1jm++RNLfhNXaY+7RtZ
	Knb/ZUgeu354AnJ+o2p+8nvymiAFaJ4I71eIhUr391eyK8AT/hsrNiL7VxRFiWLNLAjiBddbznm
	exE9gtgZgsFtWbFYI4Kvy90/OmNlWVUbc/F6yrOFjpABzmxqpqb5P5TFJjSI/6lS0
X-Gm-Gg: Acq92OF6RNkUjYZb6N/6iyxGmdn+WPHzB0/UuJL8WXc7YfnXu72d30SOxOKmuyWPwJf
	fbeDRnr4UJ5uyK496sgOL8Mjhe1r59kIanvBIZuQWIVADhNlh4r9p6JJK9+CMtVPcT4OLMmbh7O
	pHDQIXHUlhIw40XKNzIwFHe/Qx+PX0gTtgYmVcM28JXbljI3Ple3aDlNklB4nKJhtAjaTz5JIkI
	hcFEEo4jhDG7ymf7tVQ2U7jhlMQ6/PXJwKWBTr0Ew917qahiTUbYli6ypQr7nolKMCNADd3lNgU
	O4hg6uMsJMJwFeV+13IZt0AlZdcvEv+3KBPFsjDLpxb4QvzOv2KwWgsBcwfhWQzMnIbhuiNQT9J
	CrTBA1dC4Xic//tqfZD7+plHIsEpheYyckdqrLeg3nphktTeorYRSOYsrAppN+2duCZcELw==
X-Received: by 2002:a17:903:2a8d:b0:2c1:660a:2941 with SMTP id d9443c01a7336-2c1660a2bb7mr5879665ad.19.1780439095632;
        Tue, 02 Jun 2026 15:24:55 -0700 (PDT)
X-Received: by 2002:a17:903:2a8d:b0:2c1:660a:2941 with SMTP id d9443c01a7336-2c1660a2bb7mr5879365ad.19.1780439095116;
        Tue, 02 Jun 2026 15:24:55 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:54 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:57 +0530
Subject: [PATCH v10 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-5-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: saRn5HZPi8HLTo6pMGkGo-umGlQOxJZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX2JODmDWtUheP
 INYWL/ZoXY/1CvFnRXCdm8My3/YuBMDojy9rSI8eAnqnEq8lkaF4Ih4oDlJmS9yO7wTI8o11o55
 wBvjWUvmtbX5YiRNo1XGEcBqV7Wa08K/BUUCczx3fa31kM02G6AGrV3zd2PHoIGI9YLnvZzAnMT
 Ck0b7mVC3c9SlMHN+5JUSFG3S5klhFV2UIjHyDPbmBVFWGmLgyqXdqk/x+/8hdNC1D9vmB9w9br
 FOJOnOlL/wqNYq9tBOHSW2jbXezTRcWyur4gf9kGDb94Rlt85+XXUqDcWXVUa1m4eR0vv22Aevv
 hZB6sGRcQZ4V73xfgJQ+D7CcftluUTTdHRfhnOfQnHpHK/iJ92y2IsQUWPh5HHTfmKVQ09X52cT
 IrQS4HeIVqymVo0WJ0rAquqGNgBH6k53G68fv0SkpBPxRwflT6+unuwpS1OC4S0cucCVjiY8EMQ
 ncqkC+KCRcV0q/UKfow==
X-Proofpoint-GUID: saRn5HZPi8HLTo6pMGkGo-umGlQOxJZJ
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1f5838 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4878,6 +4899,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

