Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42637EFFC
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723529; cv=none; b=e6qVD6/+3xA9TmMtsoQt5sSXIWhl0h4iexb0beor7P/5MEzukKBeI/KvXHwnpROVCVmodOkEhS5/p0Yv7UhmZVmNIzGu0OqQKb24lgMeDSsIBZUaZpFTDohrzOVxvRqEZXkb2loBv6sq/S8gm4EEg2KUJnNHk9sMcTeHU98Y2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723529; c=relaxed/simple;
	bh=fCn4ov74V4PYWx7v5uigSaWfpvZiTExLOlIV73pSWdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=peo7X2hCvtcLomJtXhz2iyIuFJbm4Zwpas3yuPa9bSaubTeey2toNQHEDx690t6G1iZXiXNICtsYgBWmdudwBMtY6k6mKpeEBbdGuxn+J5jf+GDtZJREa5aeDY2eTe5kQFOniCvNMqSoBXcfPezL2SXQ3DbUVC/9QDRpdvzrPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLY1whzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+NpGXbA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLY1whzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+NpGXbA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397Kjir2845444
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=; b=YLY1whzrshH0A4Zw
	751aH8qZUAoksTuOXKGfsxav+j24fXkDzlB6Co7X8SAJMLplgldaO7GFRnc94oVd
	Q5fM9RZVjp6q8Qfe/qWtuVSu0t81D4TCSHavZRMQkIe4lNHPEmJkvpTYjfb7FyNo
	XgicIUSdMhdwITF6qWTGoc486KFCJbFryngd3s3HjmAfSPDqqddlrb4wVKRDRDcD
	XdBA2JTSt4Bp34OCKPRWPYLyHhSrSaxqzHyTCrwuj8ozbWfET+abxFkqHSf4exDr
	m45ID+ABLYeHjIYZX36f6sYWpj4Wa3W+vjKhQQkRJXY3uVrm9TJ1rxZBtmIRsyXI
	5t8WGg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hk5ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:32:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c649dc145so389888b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723526; x=1776328326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=;
        b=O+NpGXbAlsaHzV2pxVZQ+ogN80hTvQsmje4XjOHRSfi375uKbeLKRMI2XkEGsMBB6m
         8/xA0oDGynUKtbyuATsAHz21zADKMHtHEZeFbwz1yYJBm1N0BHtnYkJjcN+Fcgu9UJsE
         EekqCo5dwFwO1Uy92b9SkcWQVHdSQTxFd1dur+GtDZMQfokYT/OfrcbeIKNmX00tvoq8
         ziyXY5tX9N+wHVJQlY3yU8E/fDsBTrVjt2HowHE+JAYRqHYEdGw0plSUF7GUaIlIfrgx
         v8FuYuIXkp13g+bWRZnIOTIpPLgcmjlKp07PQ/xxKXtIXRFBulaJFQwvMoZDNGfuE08n
         7pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723526; x=1776328326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=;
        b=mnfKpXgrgqd8+MgVR1xP716WKX0Tu1TAskIj+hWEPNc9NLxDWrZcNbOJyCQGEY+tn/
         NsPTNNBKH4gzwl6nvSkAir6442nBU/waDDgDPetojGqZVjUa+N9WlVLntj6BZVJ73kp/
         d6I+DSQcT/c0OKbKYm1/wtMLbcb9lK+FD7U2NYWQSpZ30dfugegNVQ31wwiskBaxnta9
         KjikfI9NZ779EMxmODizXdNjh2xrEj9cjFeH9nW9yfGeUHbQCdv3LaEgCxWbW6NoCKnm
         iBjeC27D+Wez36J1/p7YvlCyhbXdgLW87ztcGISLGKzVUAdgwZvvNy5KnndSXAqqKVrT
         yjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcmWp80ZicNNMpU9s48ZGPPJXR1y+7QoN/W9ap8BZFJi93CWQEXYTSzEFQsw7C9ULFYUfO7NzBzQbG@vger.kernel.org
X-Gm-Message-State: AOJu0YwInfRF79gQt8Q9FU5nkqllidbD5ggfjAIzmVsT6dAbnI14gcZU
	moZeAQ2rMBQSX6OBf4y/zrCLvnC+wK1Ps8+JchGC1sivWvXfk10JUwl3q4a33oZ6GNJcVF0N3Ay
	LhaLfTJWQ4HCrQJTpC3xtPSEBJxzoPOKTdp2R4qIzcRmnMiiLipdr0/Z68e0zQGMOmm/OXbMS
X-Gm-Gg: AeBDieuavsQq2ECG5ubVw16VBGAuTkc5da/8Pgaegkys1KEuxBPXvyGN9HVqlc4a0wT
	cNGmb0pkpstr1Oc9YW1AeyWtqabawTETlVbJcB6VsyXa9qS8EbMlLx0fahYaXHzw/v5BkaCpBGf
	51Ib7o2n8tBttpO4YOz9FOHZzwE2+fLJWCGmbAgP7OVpsWkyWEWVuergVAjFL30zsU8gKhhu7/k
	ZN1fJuY/vsZrTZZIYD13BqW6NX16/9IOVoYBEpgkAfhu5eaRqn+/rVBl8eSVtEFT7C1FUbCkMfp
	SZHX1HQ3JZGh5Moeh0cEeaDqN3mqYXgnnv7ql7k6z3O42/bbiRbH9bN61Y4ooB+oTbBDWjfOHQC
	W6IVjqKWLQ7G4xbcSXfmX70e3yR57ZUIrdk0mnSTtGoLwsHJKvUoq0E8=
X-Received: by 2002:a05:6a00:10c6:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82d0da44bc4mr24463384b3a.7.1775723525626;
        Thu, 09 Apr 2026 01:32:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c6:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82d0da44bc4mr24463357b3a.7.1775723525078;
        Thu, 09 Apr 2026 01:32:05 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:04 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:50 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: kodiak: Add iface clock and power
 domain for ice sdhc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d76406 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zChIi_bjjUXeECqr7xMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: iHQINDTIFWkDeI5GMNMJhCd_hcT-yOe3
X-Proofpoint-GUID: iHQINDTIFWkDeI5GMNMJhCd_hcT-yOe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfX9g/69uQJ63B+
 /oR2vQlwk3rIiTpFSVAW05vdxDgf6Oc+qSEHqE7MfhvlbpqCwCwQqnch71shq+Jxxf/T+O97GRX
 MzGO/Sn+xjRYvvUr688QCEF5kHb9XH3PCkWt9hqfbEV7Zd3mlTHZeN3QYldpiPzrGGDr9Cr3UAa
 Qpt+Onh5Sg0snuRJl0/+DhxA8R3I87BCY1J6P3Z1kJuCnOXn+PJdemIlIa8O8DPN68KFdFmu49p
 Ipswb7v+6JVP8uR4o9A3zdl14CTLM/LcpxjcT1uZCvb31PPnZKwKdcKieGGOFqYTnNd8KgAomCJ
 NX/OpTGa7Nx+bcgXlTBbU4kGVZ2LaaidowbhGdPZNg+s0zM+x8YVOZkYAzokJB98D2DT228NHkB
 la1HA1xone+ZXi14zp5e4xSlnEBWoD4kzkh657fGaqjdcvhcPJlGuXcSSxllWajoqCLN8nPXaVp
 4NVF/Qu+CtQ6gdRXxCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090075

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver. This can
only be done if power domain is enabled.

Specify both power domain and the iface clock.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index dda4697a61b7..a8260f695058 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1082,7 +1082,11 @@ sdhc_ice: crypto@7c8000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x007c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SC7280_CX>;
 		};
 
 		gpi_dma0: dma-controller@900000 {

-- 
2.34.1

