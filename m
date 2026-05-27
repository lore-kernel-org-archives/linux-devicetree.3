Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA203EF0BD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875081; cv=none; b=CWnLLu+vyetD0K/wanbVeKJNFpErA3SgG2AqOnTVBuQ88K8od9q9xFbOLVXXPRUArQB3kGxZJZmb3yw2pkUanBPkUN1Xwq6yZ3l/nZNKdEsR/I/9tBQQnoyNKEEbGKqqgdjZUldwRW5zvFkiJsoXvZntgc98ncedCmkIyRj4o7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875081; c=relaxed/simple;
	bh=nT3doCJE1mm1HBx7j7+EiThw1tSZX13medjKcIdVqVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNWN6iKz6PPBNY2rWxIJ3iClgs/I/ctqzTzJsYTeiOcSuz5bmJ6iNMSG+mb+aCt5n1hrGHAWtqgKUgkaEEIswqwgMyzKXvQH+g77s5zgazV41cUDJndS/A29JQe4NJW4gukv+ZXEMm9wQDDKLd2e6lSPm+F4j06rU44lIuxu0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1otZ2LX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvIGrnu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1otZ2LX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvIGrnu/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTKi879313
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rrX/6SAGT1J
	Ef8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=; b=l1otZ2LX0y6zgeTyonhM9YhKzoz
	UEPO9fxf0rJ2XFUoJlyd5G5nEs9MuDCodjCsZSp/IGjp2BNftEHwbqIyuEq6rKid
	Lk/JsdJ/S2BL6/kHI3hOJD65xgjkRDIIMbU8wRrA9F2UtXz5SmFL5r+Ym5I51pk/
	z+hEpB8xdzQGbLLjngYi6Vh8DRRDeDyE2nG6T5IypKo0dwtMRxgB+uEfesCCJGX3
	VGmDTdTcTEF85+o8Lc/HOpTw35Y8OFgZcA/pspwTVcJXDaQpVlTaCzjk+Xdf7hMa
	NdzNnnLvCeaBMzeZgCrxWswluXLxHLG7NtRNDcaVa6S/525N/GvzrT92E7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so110462455ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875075; x=1780479875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrX/6SAGT1JEf8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=;
        b=RvIGrnu/l088MqiYled26WGS+yzRj9JaRJsy9po4hWO+k/uDofl5BRpcDznHqcjdPA
         FNJBBTbGtoVeK3ZeYx/Melb5LHmWM4aOISAvj4H5f4vpXmHvxs5DNe6xFMOijIcPxkAm
         dh6NiVaYi7HxlnAG9LWzN/X/PjMMVDSNUmNFae691/LoX+Mcf8pJ9b+sOUk6JS+6/zfq
         KpsiUv+layDAUqzVYL8+KNDc+fmufORk98yPk2+H6ytDFvdWBg/L5uJ7gP6eEPIAUQ2g
         HWBnrNPBD7bqNub/xFAMTfuTRRu6DRo3irqGlkPric3LKf2uvEHjtAcSGKHYvTlv3gpj
         X+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875075; x=1780479875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrX/6SAGT1JEf8WSxXbKOvLl8Rt3YpLyNAMrIlzNkes=;
        b=nYgMN15p9fvRchjitHddSeTXaJKzX4IA5UOeoNwvUX8cAy0WDrA19jaWmU4YDU4omM
         tSNBzOhZ8p6KOhmVZGaHmfQNsKtK9fxPIny06v9iCD0fwO/ytcNsF75tJoOv3LQGOKo5
         8OLRngRWGZFCrAuyU6RaMxZc7McwT1oto/81MTxgzuKzzICCfjn+ihyuwyzD4a0tgUin
         b7VXSdJAlyuBXodtNIz1C0LTk4VTnY74VdLL5gFMeS9c9cQFEWxkN81D+yNj9sLPKj4J
         xoTv+rgbxAqnxlvo66pxO73c5ZCHhbuq7pViy7Hz+AV3NpMhSVOswcdUBluOD/mAo8y1
         TfHg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZBl4sktu3eDf8FFrpkiaDT0TDIuMBZ5FFGRZKOsaL5/UZpAOClBD5MCv+3nJ5c51Psu6AXySsXaRo@vger.kernel.org
X-Gm-Message-State: AOJu0YwqkWwRRtzPJfgQ0WdAIpa49UPgwIK1348s08UKG7Vc+Od2txnw
	Y7k27pFSsq3/NawgdiVchl/NjR6advcFfzKfr1BrXQVlv5jnsQa3k27sgLLB6D4eGDw7Bj2B9uW
	YfZFMneqGxx/qwV0iW3Uj79WUt2KwTBx1naOnMUrltg7Z7W3hIP1Z+kGm+hzkS8n1
X-Gm-Gg: Acq92OFrpWAfaA+RqbZFDj2HcBEdJ/j1neh2Rt+Vf4zC9hIIIi9dqZDtMCrbMte4lDl
	K7Hrcth4lSWwMSxZ3PFbBGL13opK2yfIDz288RURWz2QSniR54fW3vafWPt8VcQXExYk055ZOIO
	uMIsk3lqFG3Hb3LtWQMdK9VS5eSRGkv/BeqsWLFgQOocfcGdxPwm21JveC3RF/DybNhd6SBD4ti
	5ccQcju/bvFf0vkLXuDI4YbRKEKV9N33V3rl/NRHvaPsHkPdjXg0/fN8TWIot58MK+rsM5RPrRL
	m1hIw0t73iO93oeF/7c0bsHgEBvj3RhBmowndT4oKrMP1ViiU0+3b89fb7aDXCbL9bXJt1E5v40
	UZqpvyEJNQtKyxWOWUops5i+okg47tQzOQ10kmOv6FmOKwvU+
X-Received: by 2002:a17:903:1208:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2beb06730ffmr238744445ad.32.1779875074734;
        Wed, 27 May 2026 02:44:34 -0700 (PDT)
X-Received: by 2002:a17:903:1208:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2beb06730ffmr238744165ad.32.1779875074183;
        Wed, 27 May 2026 02:44:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 13/24] arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:18 +0530
Message-ID: <20260527094333.2311731-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX/8pMNowBPm8H
 gUGCoHASizjVqzXNTFPlUj0Dt9U5IvmG4J2zKTBEicJ0Tgl5uyzuc7E6Gi1F0Q3WfHv7OycSweY
 qjR31jL8Ow4i7W4ueUsuDDrxWYm21HePkC3XKJ1D0gw+j1L0J5kFBIymWJAh9KlMc0ToiZ0XF8j
 svBnBkaze+mSFBcXOqXsXoyu4P/Ek/eOET10YA+JplB6hEpeRyXbJVg6URBw475vwLufSJIls64
 YbUb5kQP7rBLDKkgbwP3/wegsh7AvVes+P73OthWb+wCWuXoQfAG1CG5wHhbHsYsXW2h0nxammx
 1a7i1RFhbmywNueQX5G/ykIE3ke/NRox5oZnWvT2zBKN9FATMCl57VVcigLcsN6SKwiMBi7Wx+G
 VfQ5kIwlVoQMAp+s3XkRpIqbZiltrpjvzif8U0hyajBY/GXnKjxV/8VX9tLzKDXT/CNvF0vhuBa
 UIfhnGP09/QeMf7xq1w==
X-Proofpoint-GUID: 9RmLNwxH2gCpUJNc5AqWPgyIPln5Pnj2
X-Proofpoint-ORIG-GUID: 9RmLNwxH2gCpUJNc5AqWPgyIPln5Pnj2
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bd03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MCRu6uKc7IEJv5tjkTYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8650 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..7a66b79ed336 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5987,7 +5987,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8650-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			interrupt-parent = <&intc>;
 
-- 
2.53.0

