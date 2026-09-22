Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD914BB277
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069704; cv=none; b=YsPGqfGiarJ5HFu7GMlUjipKxIVfMAaxDu/Dn9YHfUpgXSfW3b39Y5UM6yTzSJsIEL5eMZUYExyPqdACgCUEPNCmj2olcaRDIhkkyMcGQyB7YhoOSodsGc5ywr22OSc7+u0UVEm1NB/MlHRnJcjJhhv//kw4Y4nBpqdZgYFqeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069704; c=relaxed/simple;
	bh=4yHRISADwcXmXHkEvPtX4i1nkkFdIl/OqWOHML1YXn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkOZp3wD/o4nwWQNQ6yobKAPtp8A+AtBTHaFj7QJsbivDTp9i24oH85Z/zDizz7VcNFz9lXB+x4jvN2CIxLvNbeaRR4XbZh2LyRj74lOmDrtWibQoAlQc/c3pag5gJ1ywSquzF9WPjJef3UFesKU09GupgKpxwgAC1/ifwbZcH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcKEBkxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFnkjoDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcKEBkxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFnkjoDo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M78JP63840523
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQ
	juhQ6mdg=; b=CcKEBkxhJOgjamGcyu8+HIhRHbxYAg/QqzTMhjC0dPB0lF+REUD
	vMJ5UPDZxC4uTfICuohSClyuvvYw/GOninrocbF3WNbX/hy5kVPocA1xEWPOcHhm
	12pnenHxfU6lcq15lpFKRWu1nkb8fECYBpNw9TZSG4NIH/Xy4eRZw5f4Spy8N3Zm
	40ePL9mEmU6EbbDEy2gOrn67792kC4TLscFaCDtphH50BW8gjEKm7EHQVpdPhbpN
	mM27JfGR3bz5Lvf4gbmYcjIQDgwn+bWFheyakkoYWdLxZqQ1gfRzZy2h9P59DdQT
	jxESTzyxc9qTUQkPS6dVAnACjTwqNPeOSXQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v53av0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:35:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so887520a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790069700; x=1790674500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQjuhQ6mdg=;
        b=IFnkjoDoTax8mwIGGZJBEGSYUfoUuQLiWmsbyH/6JNvDe4pXtJ0xDB3k9/lSk1TdxC
         btX6h8f/btqRpQLaiVa58CCCPT1pmEDVpRwCpxXEF3qU4kgRvGIy+ktGsTGH1vl8XFyJ
         9aMwdafi9QX7Za+8UIkZZVcI6Oqw/FhspyBXN3ua+jL99tD6H+J0FPfx9H2W9MCYJ8B7
         HmuskaVQhpwtmKn0rCllpoaSN8McWyxztY8MVdAXUkQGgkI9A1rT/wJ7fyrC2BmLy7sW
         gUL8a3+nRt7o0uto6PaFjztkDmieE5svmkZr0qH/LTPrPSfrp5QCr2htfA3RrQrBXfh9
         T+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069700; x=1790674500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OspiU7ZLQWHMjkyQ58rangZNdkNtmqW5EQjuhQ6mdg=;
        b=KE9q2s1qrGYR7+8T9Sc8o+0E/xG1PC8VVUDh5gRmutiv7oUxBJtcINh3VWGQmwNTk9
         sov+0akNCsKDPal2k8aFUuD5ZinbSTds1DniMJ+ECoTPnhumsNFpsum6r6WH6iFv2+Oi
         28TEFfaIOZnb/Oa+8NWh28tGhBTeHfDHvE75kCLK1cdcMOUWEarwHwX8ykJ+CXS3sbSf
         WyjTJrUDGwrYJMkTvZBIX65IIbnqdG2muPb+U0d7mB5y3OYA5cvxFflyT/73AyUAjxhU
         i3MXYvwzJXdL7rq9mMlPEjLES4+4icGMXgyL3PM++X0ov2OP2l2xzI3HJYhqEX9wnaoi
         WXmg==
X-Forwarded-Encrypted: i=1; AKwUvBwdgpsSPASOutevV/hF+jm3f15NWt7kyRTi0YRhvrICkujt6TwpeVCWv5eW/4UnxXlaHrTXnn1Dp6i+@vger.kernel.org
X-Gm-Message-State: AFuF++lpBYq1XdTGt78sjLdirbenA7mmfrrwwWnwV3hYexo0oW0RlAxJ
	rkK1LQ/JV4XXl4KssBEulaajWV8WA4ArXxjbjx6BbTNtlQ9arq8BXNh0BtCZszeg8l/UanpEOrE
	5AkYctK80F9yP7BHCK6ujb3lzKzqw4G5uGpoW1LEE+EAskTBOw96OGq9rWcp4j6rO
X-Gm-Gg: AYBFou20JCYw+t/48UDvOi9hIO+jg56HiSQ1KMkJl+R/lknu1dUDCfDfI0jguSktrY7
	sd2saaax6P3BLNkEOB6uxQdPOVzMlgKJJCQgsXOHLSJb26QE1D3umcwQzE7MVmnm+mpgmv1uK/T
	CeTvfRWOefPf9ym4x8/L2gFCLh608Oj907CrbsCHjTc2n3p9SedtSa/tTI8md9luOZbtr9PDvjB
	59hA+n3FY4tUOklMJDHw02bd5CgTaypBR0Bj86tEAac+FHZUT2iTNawsVCOiCvTa9+F6lmdpXak
	0m6afHvXNJIXvJsuJr9PH2kgbRVQG01jX1+3vGJ8LOJNjyCeSo0xx4dCPpW9NPVQ8GVCC87qa/D
	xR7hWO58s79cavn9cmTjJLtOMGxa9gXWpyWM/eZGD3aKUCtF7/0xoGk+jON4D
X-Received: by 2002:a17:90b:528b:b0:3a0:42ca:ea4a with SMTP id 98e67ed59e1d1-3a0730cbec8mr554395a91.12.1790069700255;
        Tue, 22 Sep 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:3a0:42ca:ea4a with SMTP id 98e67ed59e1d1-3a0730cbec8mr554362a91.12.1790069699792;
        Tue, 22 Sep 2026 02:34:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e626de382sm4074060eec.0.2026.09.22.02.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:34:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add PMU node
Date: Tue, 22 Sep 2026 17:34:46 +0800
Message-ID: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fW79R674UMYN9-Bno1DJH125BO8uEtQ5
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab24bc4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ohnXxE1zjlip3Ny1XgEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzNiBTYWx0ZWRfX1Ah0/i4V1yIq
 Tm709YSWiItrj1w3jJBC6ppTRjDAiR+wA7hcdG8Vsq0PXmHB7p8LZENOIrYVkHhLJpfs9BgGXcI
 rFf3SeKvtvhbDuVGAPxGYykI9z7nASw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzNiBTYWx0ZWRfX7+ljEijl6RfT
 hWMMhrHK+wvGBYc+nlEnj7ghwTC+7vWV2YnRmwFqGW6z1InEpbqqGlas1D7lOQFHutagAMIwR5Z
 2k3Z55N9FAqlHqDx880K+hMaoemJ/cnRRs6keFBBP9limBWU6HBavRuMusS2pnyYVYQ2qzTmPzp
 Vspzf3nLLOUsd72miwhJLKh4XQUIOyvWinrmqggSuJeT0pWJYZBgsw4nzkmWtbQPdVI62s0JZYh
 uSAD8oQOpTwWJaZFuQ9ZLPRJdXVW1Dod1eY3XTnkHIu0t/ysdiYDUu2mR6+waHaNcsKf3KOEEey
 3kPNDh85Cl6yzifG1cUwj5XbZJfJj3SlPtHa5jut/vkB9FQi9kTMoaVcNCrOf+A3/4Bl1+1Diyw
 8YkbGdJRn1awGjrHDZKiXybk6o+XhP8NMsykkLfadrXAZge8vafuUPUUmltmBk8IO9yZhj4Qw9D
 Wj038V1ORoQBIsM04jQ==
X-Proofpoint-ORIG-GUID: fW79R674UMYN9-Bno1DJH125BO8uEtQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220136

From: Anurag Pateriya <apateriy@qti.qualcomm.com>

Add the top-level pmu node so perf events can be collected on Nord.

Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..c720b85c2199 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -375,6 +375,11 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.43.0

