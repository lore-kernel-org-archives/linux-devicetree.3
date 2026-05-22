Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE0379C55
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479709; cv=none; b=pOodU6l5f4KkmRnpwDAo9duXAlj3bUvknfKIlByJBmwhdSxr46fRc17fb8xumixAEgCfBTsb+KcbFFWifWCUscre3dUWIwcvqcBrYqjfoAfPzoohSThvrC0dOTK0jcPiGmDK9qciv+LUyRxcN7+y1BfjEP1+l5RMxZZ6FMyFj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479709; c=relaxed/simple;
	bh=oUbYgtn1B5imIFwv4hQI7KX3V5yd8V3dM5McS+c9AMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7GT29CzHBs+O7xtaC5to2rhNLvPrMMpTx1XFb0xHstWQ/yu/RTVKzQxUI7EBmJGs37JY0Bxci69dJhdQHeVLW3sQFeaGnCk8FTba9jsbJ+3JzJ98thJv1ycJWwZ8eINZtFRerrUGb5Xb9uMjCLTuswG6/HBoNXutSAauUYHCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX9pJAfc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTUWfDAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX9pJAfc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTUWfDAx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGbfoH1734554
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1NDharm0At
	7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=; b=mX9pJAfc5AyO6OzBgeLbmaE+Qrw
	KQwSjTj5oHTRe94mm+FeZSBZSpwRYZLv580hrfhFtmlIYyF48m8ua6sDwbabciZS
	FKHHmAMaADR30JGOcTDVBwxnpqVAY4iz63cfsHcrJQAWklqvdMq8kuSuWGHJKn3I
	yBRd4cc0gNsoyfVRlKLMKFCS2vVXP0OpM6prPB/AV4fs4KllnfqROQ4CDg8xk0QB
	5rmeS+uBpzAfUOD0RS973RX6jlqalEyqZLc43c0b5fRdlu9l4m6cz2VLRFGHI3ll
	itqE1/qpDyACZhciTpljYJ4DGmEHkDNtsLve0R6GURRgtjrrGaIs9CrZgxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8pjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba268cb5e6so80850585ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479706; x=1780084506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1NDharm0At7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=;
        b=dTUWfDAxOv1fU5cr9mYXvTBSy4c3A8RY39jgba9TrYNIdubHnHzMkU+gzoru8O2DCc
         7BRq8VyG7gDib2u+f66QvmPd8HxWGrZfP4Bly6e3gBPm3OEgGpxz5b0C6mAuXQQaquyr
         mMfu8QBGBFn3ehLNUeg4P5S5PwfUiGlA/57fP6V5cTFAEZOivk1/iOpZ9VgIS+Bp1Lft
         xWF1xeOhQR4XdGuUHCK5WyMtrgP1rHXV5wFT6wDHwFF9bT1gUOSFQ3KxlQ621yx37xxo
         W8Da4TExvTESUFA8DeUxXQ6Ywvnw7yUbN7++fVSUie9m5Bl7kQsuIZZm2aYMXWCAWEcF
         CZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479706; x=1780084506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z1NDharm0At7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=;
        b=MUz9F41tlFI/Bkf5y8xw462mLM8vd6agN8qXHPnQ9WCKwdyugatkVaeDJ+eBBNqzPs
         Xd/CF+ZRXTh6LCesf3NufozHz+rs+zsVf5wcl+iOdpMtpkBJ3/BwsCF956mQ//x+Xrta
         nPWXEy6pGogiO68p9lFf/8zS7XPMXxSTK2YTfZlu8wVOE9xen6vpxWPZyRhcUa60bOOE
         3k+udMG08OHkFOHi7wxwCt3NfI/ciUVfDCiP8KJDlfaHlU4VINyFHi2Ko+DZDjU02HF0
         k4/mlcOlNkdmofYQQxVFoNpOxphDD4rfivT0KUHO+C9phq57tKE/qya3EKVIPRy1NlvA
         7dAw==
X-Forwarded-Encrypted: i=1; AFNElJ8VUoxWblbUm39zQwwOwjYf8PAgub2b6ldvzF1YzZZhD8c4SaGUkuXTLOhmS16Xyo/qYDKCFK9FIHY+@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCjkRyA9mg13rCdi+WBsks4BxmPpCMrW+mS8O+y0/lKq0HOtU
	O1z8N5JzLbzQCVdcpkJfqywgeKV0DfDAtKq/9OwfXnWVJBOk6CC0wVdyCM6W0D0SD5/uM2Gz5tx
	q9Pl2t24QwgE8jjTGAcIMRWtPRSIyx1MxZYd/PinFeadwTP2ClZne/AdJhObqF4GR
X-Gm-Gg: Acq92OHLR4mhuVywE5NUz6RIXpVM/IJmjaYKso6CZnMpkOmXwrUl8cFt+ywYI7rjhPv
	FII4jPkU4IAP1UMsSJTv10wvCEEK7Z3S4+NZbS0sBFnyPck6L6bozhAZ8HBK+Wpx1k3hCxHoh2k
	DEaf9aoi60xRQk5tCHRem12uHV5RVDk/bLL7SjYpwjBAvqbtoAvHlxmmlqcxHm3YXHRbsW4Xm6l
	cYdJoOxLVmjxV3LNlk7Rn5Em1bor+qjxjh30IwUl7sV9skyWGSZlPRkprNvYkpDCc4KsYfriOMD
	n3WD0sNO+8/Y5rDM91+RFS/C958nU/dl9SYkYP9H4FoNfaSD2rhAkJZh5VNhQARq3F43Fym5/IR
	+R4Z3uYPCUnnmnHDSLaqvryOZuCp3i/AWxI+8TcSYroQMR01qnRMIpnnG/hY=
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2beb034603cmr54750925ad.9.1779479706161;
        Fri, 22 May 2026 12:55:06 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2beb034603cmr54750545ad.9.1779479705675;
        Fri, 22 May 2026 12:55:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 16/18] arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:07 +0530
Message-ID: <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX7LRdcdiU5yQ3
 eIMD55rVo1YcdAL17k+lOgI/mBtk6dWO8swAZtF4edqsqOuYjnDN3/EIsRhQIv/L/spyV4yun9r
 hzhfzHojuw1u/SMMwpkR5iPaC7DDiBmMJZCoyrbSd55aVtectg03HWpHaqdAFDUR5NFIF14pJRf
 Fmk/774l4GqGkXwchCzWRQdyBXyF/LP5ti8w9y/HQ72sajzAwjwUXNgxFp4934Ww8nEF3Gjif/9
 42MB5zbR4CimiUhb3thWSnqD4NaYqviv+f26ZmldElnejxkkAUWxNLXj18BUqtOhbO3iaUpiftS
 6Jz0EU0MOrirpFqSe0gXcFQv47Z9cNWM4FKUlWIP9MNPfJEb2LdD0zCM4dK4JArLGqmTnqTM2UT
 cnf++8R1O0Z22K7tRu/dU9Fu/zEDfJZeNNNMttsiH4CdTe4UCxLD82AgNNCcirgBA26+mGK6U+d
 XNprgExBfCnQJXh8rGQ==
X-Proofpoint-GUID: GaBjKKZQEhV2_8lxVqRA_FXPM-g8a-cZ
X-Proofpoint-ORIG-GUID: GaBjKKZQEhV2_8lxVqRA_FXPM-g8a-cZ
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a10b49b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549..71a228597093 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -307,6 +307,7 @@ scm {
 			compatible = "qcom,scm-sm6375", "qcom,scm";
 			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
 			clock-names = "core";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -1645,6 +1646,10 @@ sram@c125000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

