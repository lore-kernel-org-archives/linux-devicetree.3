Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7E3C0A08
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408292; cv=none; b=Tl4IIqr3LbjqKW0SoEgA6p+7guXaWUHtKuWpKtLszd7ooVGMZsE506NWRZMcurZ1p3FMF3PAaXKADXRNTjiA5AKV5w6bjsNAjxYlCKvV3m/HlPGkZlJiUO0gpKBQ9w7OoXPQJ/zh5KqLfbrhv/VqJo30dFcnv1JZD/U1vc8plms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408292; c=relaxed/simple;
	bh=WLqIvtUKgECpv0Xco/YWKPlSfN9F9B/RCBl/algh7j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9l0ozu4OLNy699JyTzmsgs3rOX6e73sx6xF8Eha8omZQNjXnaQ3sc+XwE4dHqQqxTRTJ07nASlSnP+PXGqorMCC2AfWN8eFByQOLxedlzdpYQHAb9YU/SRoSkWHYKY8uUF0VmQuJWzKDR6m5McYO9BzlAvnWJmF1wuh5WJlMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEPZXPd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zi1fA9F8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEPZXPd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zi1fA9F8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748l7n2649148
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=; b=pEPZXPd3fkV4lfWk
	AHEFY+VugRipqqnZcBDZ0AHusj4JKEmNcs8dSLzCokIE8W+eLs6X4zk8FueZYTrT
	9heu5cJuxfND6mQBTRcLaz0ImXbyimRMt99xvjb7Whhasyys/3qDUOitwEuBchvw
	jOiJigwXkLfTrZNvYDYlunGcR8iSPIemmPFEnoP9GywwJLV9W1rMa9VpYio04Jyt
	pBa87wHbfMD1so0BZ3ol/MZGgnxmNsrvvYyynTmCkUroE192GNTDjEb69jAugSOU
	oEpTyOt1NOp9rgEBJRdo9mFmkQTIs/vjtu6FxZLr0UqV0a4ZU6C8HbLfegYtFxbB
	cvae1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw324m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:11:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38001e788d6so5528137a91.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408289; x=1784013089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=;
        b=Zi1fA9F8A52BpGR/2WbiXfu4mX+hbGEYWFMwZS2U37EZBqClELRjx7n7kmedfby4tQ
         kUNvgof1YqE1vApZvuZCT5sCDMxEy3KY/QEPoMniukkBeSCiQeqhjDXM0vYfNO7fmGvu
         xjHXKmznZLgFqFmq3qqrJTj9AJ9n2q+SNKtd/qU37YutiegAbz++tKtERDgmgSG3LomR
         w3MBVw5BcJq0/Xq+H+r48IlbODZ/+YmDttgUl8qFEJGtwf6bGsj/DgBw0sxYbHa3DUCU
         71UouC7NgVRLekNBBUKqoxxkUzdt7mKnRxjnO9e6bZAPo2CJTQ+QjamvrjBAY+XVV5qB
         Iqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408289; x=1784013089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=;
        b=ZitZWvkjvcAQNHaTh8JkOfIcuLYcV1y2wlgcoUtbD2kMYwS+kX1ZGZH2HWlgUSVLy5
         iZN9G09Skce7mtkewSsov7pNWgnHoD+we7GYs1e8A1W4pkJojm2KcFiN5YgNpe20NQeA
         E2HDx+oL7qu6fUiFDH8D5w0KChQb27EPLUSasHosz4eZ60OUn3pkIXvioDN3htQWEwEK
         u7QuUsHd/Igb5LbGWz0eEPBbm4kO8VGbODf01QPfVTn4YS0W46jCJUQ+CszsywCfExom
         2y8gFUMad0QvzXv4Q1mlTNyZEJQyuOF7UuFegzA/7SDXAu7dsrjo2FeZ4kT065tdvt5g
         g38w==
X-Forwarded-Encrypted: i=1; AHgh+RrxJMpcdvDZpLyvZHy/V/1KVPkyXFxBwqt+WuChOqH3fkMqawTT1MGSTuvDWwj5sLUISUvVqSmMLGlA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfcd6p5QVXCYvBuEm7WgTzj/Z7XTefqZsUe7gB33jpIAohZVy9
	HfgP6ofiw/wgOkVSlSMfsCWu7AY2r4SehhsqKPbqle9oUJnxYMKnJk6pN/XgLNlINLdTtT1Ern0
	VeUzE+RJAl7H8BAc0p12R61g+T6YGggeIUQ+3yNA8mXqjDIHdaonCbqSKfOJo0GD4
X-Gm-Gg: AfdE7clmhtinGPri+3RKNn2rXBFrPC8yJeEd88/MDvHzr5HkusTlah2E6VPf1H1XSdo
	7y8zU8NjioZEqqoJXxgKxNwELIuVdqW3guiWqmOSr6oXNIFIiFp2S7j+K13VZFWn2OkDJYSvsGX
	KHIURugTRrAspghGkA5gp97cxE8Xs9RgRktDMXmXsEsrHpgOpVcw55Pe+Pl+EeO1bfPQ//+JruD
	VtNVG77aQGkG/15s+DNy/1ZLd9TZuq7ogi/zCPsv0J6GwG4bzeZ/I+TeSmgSJfyUOAXOzB7nadb
	eBAMt1ss8SYfu+7F+dkDywDmh4IuxOZlj8X6J5lNJ9RFCapkOfIltHUNM9WK9P/19DFDB78CVe9
	P6P3qYVg751UD/TlsbnFSvDh9nsc9TncJyG37Okv6IqbN
X-Received: by 2002:a17:90b:544f:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3875576757cmr4193604a91.4.1783408289252;
        Tue, 07 Jul 2026 00:11:29 -0700 (PDT)
X-Received: by 2002:a17:90b:544f:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3875576757cmr4193574a91.4.1783408288791;
        Tue, 07 Jul 2026 00:11:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm587326a91.6.2026.07.07.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:41:12 +0530
Subject: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX4Og1UyJlcgxL
 iY/SuxhxLvkFmkLc7pw8Q00lK8Qe/xL0onbM/eB710Nd512j1LtP1zmydV0EWPmsQhJ0KuBuDiG
 i9Mt7wa+eutJwAC8HXzCrL57UDhPiaA=
X-Proofpoint-ORIG-GUID: kZ24JI7vTZIxWc9DKdjXoAN-PWyizjuB
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4ca6a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tkX6oP73yDwSImw5D5gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX5W0zayPUriv8
 r97a6jADMH4nL9VSQTqbY7xiv/l6k7dpMAJNHaHc+Hbdou3OeF3Gg0XM4RS+LE/PIrtwqi1Yh4j
 uJsa6Mu7S9zwxoNrtkUtQ6IFxiEoTSpmRkuzJd9spr1y4TB9h5nr1eOxUzSezPFEwuZlYUcVnEv
 U2LdU6wSYH+h3cb1bJe4WIigwgyeBwweRuxCn7JslJ6LS2pTTW+upuMUeZNx32tb40pGBXVqq2l
 6tq0yT8JqzlRART91duN6P1AZ9eMXXEDu1T8bYILmxN1hZ8u9mNEAoyuEzMy/fdM+6XoJM20gf1
 JMydgFktdOLwHVm/rP8l4Yabb7zlT5sDuPANBpkQf7ha4PweqT59iXR0Tp4BrKmnvUktz+Sf3NG
 vAmynAJ5Vdm7KdBfDCtvx42oLtAn0DXe/OLuQi2Qmh6HFgDVoorgaFt0/7Zo/qA7yfJNwn4jda2
 z4mekAD0ElHxrqnjNBg==
X-Proofpoint-GUID: kZ24JI7vTZIxWc9DKdjXoAN-PWyizjuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for kodiak and reference it from the SDHC
controller via qcom,ice.

Also, define power-domains and clocks properties similar to the UFS
node.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 90e50c245c0c..3692be65cc21 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -1076,6 +1078,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@7c8000 {
+			compatible = "qcom,sc7280-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x007c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SC7280_CX>;
+		};
+
 		gpi_dma0: dma-controller@900000 {
 			#dma-cells = <3>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";

-- 
2.34.1

