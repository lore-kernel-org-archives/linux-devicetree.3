Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095A3EEADB
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875078; cv=none; b=UbLhNNmFmKhfVkQfvQ8ZeReIPiWxZQzWbO/o8hH5cKk7fMhqB+gj8aY8ZDDgqlxiZDZrMJxC9opr/be9Mus3RMPbl7IQjCrNzRjk+O8gwUm4AuKK48nAWIA65bhm8E6yyHbklNHEvYfQAWaRXtVjk+JwOwM51wdRbDLJNNQnhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875078; c=relaxed/simple;
	bh=D8dZQ0cRhjIZIwtx/KLbMuwbchPMPJBrdYeWaG5A3i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF6eYctN5lMFo1DLX9MUhIqvPdzWRg7kjD2EW9WWPe8DGHZ3b2OthgIJFCNKN1JYYfwqgjlwyXUi38ly680fNX1kME01MTo/pZfE28APxVpZfqJeP7UICO+XoAcqqFtoINS6cc24LTzGSHuG0ubaWXz3R7eVDLen8RT1WFUTzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDgQblpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUkoK6Oi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDgQblpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUkoK6Oi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mSof879299
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X39KgCcEgfC
	h/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=; b=JDgQblpGdZIg1X/+uqL6sbPyYWk
	tzggqAqAoJvEFQJoWNe6I5zXbra7EomlKSsp6sbtYwNbJWhXi2XihfSpP8aBzXVA
	c8DPSmnwFqGlBjflez0Qk8ZJaGKiWdhd/jv0L1tiMM+zNMd0F+tHrcts8X6Luu4Q
	/a0Kad5Ugb/xZdYeTTjmMb4xF3ebDPscLISLHBXMxr8sdff+J99g8DjQvQXwMzHM
	nSbZmOcnGhagbQlPL/9rJXE4QiooUZMiN1dawm+KnK6eYdmVb+KXqGnZ9LmS4dfS
	pXZdfLvFshwnbtuYFL6FkLjLT5rnIftaIG9qwmrJstVuFcX6FLwcwQLsT8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrcsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc6899bfb1so122631635ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875071; x=1780479871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X39KgCcEgfCh/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=;
        b=hUkoK6Oi7lP4BsNO+yzFE1kaOVR4/7D9wZ95JInIWJG82TcbOpDNxGQ7M0dbX8lpw6
         h2zqu9NKq5hKHPGz19LhwzyDyCTGZi5KNcCMJj2v0sNMa4C9f7qAU3fpPkSdp0afBENY
         YVTDdFg/3sVtxM8ln0DmAIUGrsii80kfIbNri2jqUBhM8FmSB1KFNgEVg0WVJuOcFwLJ
         /FzQNOh9zCn+hQWmwBA15sUvqlRuLzPyyccy4mxKgnymBdpARpm1/pWSXVOX+4i4Hj1/
         BUREKE+aspeL6y27BP69h+hXAYk4MAeqKC2x2MM+mG+i1m+7HV59vE06GNZee7RbYv1y
         xTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875071; x=1780479871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X39KgCcEgfCh/1MSxV2FqKmE2KONNv3U9+fv7NnqdfU=;
        b=fT7tclE/mvuza+mu7/pJH2X7gb6y0Tp/sDo1O62f+SH/zisnvLPvFm8strm5hopCmK
         jwj1umQ7fuDdiMU7ubeJUzJhSzkaV4QACqpXbRt0+oMIQ4iqdvTfcuORdscXKvL3iCx9
         twrjEw7TDx1cbrULDNJc6P9uym/HmLdICDMd6QeFlP5cimKSYtRH2e3+sGViaZx+zlel
         LVTJUqLHwgHoA7FKGdzALUKwMDz5fcYysoHP62r7esR+Iv6wzb02GlE7ikr8oeO4hSCV
         ucKHzJEBmeLniM/xorjNYvaiGDKAu0BHTtkFmalJnE9e5a4N4bIOroXsvaZ0tUy8/qP+
         F5OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Ay14y9sd1y8ZsjVX+SdMpD+2XzJaq6hPVW1n3XNb7ROYRiEQZPjJ/dMpfJFDlonxO4pGvKKWrPxw@vger.kernel.org
X-Gm-Message-State: AOJu0YwlibEx15GgBJ15RSmsxnypkK3+Sbc+Zzu94+nlx8yabaCUu39S
	0JGXtrhmlmJL8EGDnmEcDycXbjqqlV1gbmE8c8LHreuxKy8Al0GE/MY65tZrJHwzYX5MQSXnu+M
	bLUaAQslXJ03go0vMv3taZsGxtxd+FBy0CS4hgR2hNNfejmt4ezsWcOmLn+o+RxgI
X-Gm-Gg: Acq92OHWkHReGmDI5ec+y//XEfT6oyTRdewSLa3FY3nESRZEjbbO1SJ+FuzqVtzgjl+
	r07Rvnaum9VSFEXQ5ZwnY7HzUfNjP0Tqc+3PRt/gXfgDaNoXPn9ejuQ108AvxXMMjkMin1b3B81
	oLLVD89tj8qppKTu2U9g6yMembORp1yLWFTdOsO7h40egeofTRTNU8oWZu7X98lu+D8Zn4FD7yr
	x1ztqJvznM1DeaHqQyzVGxywLLaZXMVN9Wf/UB02LiTa1YS1t+FQTfqWlZ6CwHuwIlATTSGzbna
	GDY/D7MbMHE/91eORiC2BofqevHWU5f9Y8PkAHaxw6FoMlltNjlmEUpC8iq7VaND215bF1+NMS2
	yVuWF5Og8LKjKiIB1JUlMGvjLldSYcYk8naCziDRdJ2icCiLD
X-Received: by 2002:a17:903:2f4c:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2beb063361dmr245176465ad.34.1779875070719;
        Wed, 27 May 2026 02:44:30 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2beb063361dmr245176155ad.34.1779875070192;
        Wed, 27 May 2026 02:44:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 12/24] arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:17 +0530
Message-ID: <20260527094333.2311731-13-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX3E70XgaeIA5W
 NwdkCv4IDMmWpzavGy1h6mGgP0rmrASiU63UM3vtZUUxSpfoY4rYksYaPbq5H25NBDmvywXD8zd
 iij5pnE8KdDPen6VL85HJC+nDjtuyL16YQlHxaKocEms5WTTcgyc0scVQGXDJrzezH+S48qVOoV
 Qrdzhmswf7khmI4M5NCPfRnzT1URU4aFD91rtxE/VOhn1b5ua5GDOdwdCGAGSJRMjTZg0LaT4hU
 FcskuIywEw+Ln3ja/oy0aN/I3Ic7Q5ydV7Gk15JUaf1N/nK6fS6nUW8UnhT//Yc+e6CTxla5Wvd
 gUSg/0d3l0UGCFSa2cTG13Jmk7upjjZFYiGdLHGW/4MgxniN7gyDshXwyyHQx/+btkpQE0Lee7q
 ADMiPxEHY8gmYYxqmMU12zdVVS80n0Py0TU7xm+QoEWJpVhGtXBQ5uufrVzU81U3x0XJxWB2SRm
 7iPxEbrQApdE+Nitetg==
X-Proofpoint-GUID: ONnriKfeoU5LvFuFWgqJWPr_72ckwGNN
X-Proofpoint-ORIG-GUID: ONnriKfeoU5LvFuFWgqJWPr_72ckwGNN
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bcff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pCbxfLNB7wN4dPi-li8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8550 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..7805a6a08a2f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4602,7 +4602,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8550-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>,
 					  <138 251 5>;
-- 
2.53.0

