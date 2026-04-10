Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2393E51F8
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846589; cv=none; b=YKVhXb9sfKkLTBs+Voa1+lk/UedQVmPyjNCNmpDLS4jqdOcbuBs0sNG5+3Tyott6zgN/cn1XBQSnTnHqqCrMgv3ubGApOcU+onlcPqjuOKW+7sGMYiIVuYk4AKSCGFTL7mu2YNTbM8TIpsOFCZw+XiqIFgdirW0mJcZXU1iES3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846589; c=relaxed/simple;
	bh=JBr1fZ+eJoiZaiu1EiIvAAke3CV8bEzY2jwvWC/TtiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeaetWtMu20GfpZfkoNMwdGcFTVC52mp3PwPW2iF04X8wl4yKHqwSJ5X5Id6t668OlK+W/zWFE1YOTqZle9cQsL4W19zSpaowWuIsSMQLEWe6AI70tVw4WdhtBtd7cFNK/EoIM0JBNSlU1EAL4qxDvpPprdHg/K0yLYOroLgZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzZ8k6cM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxbpLz+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzZ8k6cM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxbpLz+w"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHptN9708265
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kzXrR20pd9o
	JVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=; b=hzZ8k6cMCodhD3P94iJef2c2TG7
	Dvf1Ipwxgis+TgdSvbziB0FMLXdI7zqPO5vXwXyhNHso+qbpzHVi34Mc+Z1x17eN
	X452teQYfF/nPy2tT5KcqjTFDVit+HSCJ87cT8P4/6SeJHVgZPNtRrACy2ldtDaL
	6HaCzCohbigQ4sK7tm6f3QS8y7tfXSmwx0b0wUX8gjsEOb2zAqSJetEG3pxqas9O
	8kkX7lVOT8prZdEUOQasUhXA87CmPZYNXppMiFVwvPRYYxJHD1eaqaGhIIAbPrTZ
	BtZp36c9HfurOF0Yk6aHps+MmLRAK2M6JsTEstXE90nSb+kQQZ4/GPnqCTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c8768a704so1199993b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846587; x=1776451387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzXrR20pd9oJVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=;
        b=HxbpLz+wHInIeSKAmIUbdfMR1nLacK5nG7ZbxIfQt2Zo3bLiHOVlJStz1IbhC8ZC/H
         lEkRVlgiRPGMu2msKNEMGxL0fN0osVcdri2krl/0iDyQNkdFzeztrhElgRzHPxmC0jJA
         R6OHGDhHEqwGdP2IODB+JX5kVI2g5IeufQLQpP3k8SWJ/mn8/DfNCr8s9FVy8/UTPwsQ
         qailhqXfd2Oa4uncceU0JK5H6l3AWTuRNIpZdvVI6nBqyeXtDtk7wTKtS9RG3F1eF2K2
         b9JUxklEDbfJ3SWjOohDcKpC7jJNp9slcjKuf+eRWFP3kxqY0LPja6vimj44tdpD25bd
         J6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846587; x=1776451387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzXrR20pd9oJVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=;
        b=cRfDbSes7W1GbxFzpVSmd9PlKsUTO0jU3Oz4Rg0zOhRS/jo4kOAFQrocACa/yASy0a
         MspVNmBwQbSm+HgxfwLe7XjHVuWFU3SxtmB7gL48ep3xHSg6K0RGQuJSS1bnD5jkN6Q/
         ElagsqpOTnalYzBxeahFaIQP2Xv63TwyN05J5zrZ02FRSQlSR3WKdNhUSD6I7shCubdO
         FUomAn1Gb+PtB1N9L/nOwmcHMS/Gz7XTo0StRKiZXHyUZtfaFIpWSakpBs0oWWBvtrKS
         5gQv8WSD+7HlDaJwu7uqTt1vgFfhXLr/cQ4aHYQS4vLV+xoNjZMUvjlU5IEDaDMr+QFg
         PTtw==
X-Forwarded-Encrypted: i=1; AJvYcCXWK0CuPU7Dhxv6tgHxIf0c4ShmEQuIZ5NwJ12sF5A5p4N+gKg4qnuN1m/J9uMqrvLj2AGHNFVrj9bE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0knV0LGFkeW4cS1SN4p8exCemAAQrWai4J2+5EA8y76VZ34RM
	jHH+Jvfz6B4mhqlRM3i9yZaYl3AIYl2xwD06eJ5mFEcXZsYx/e1varO0D8GY4LYEFzthzvMZWIU
	u6ro4mTqcPDWp54vIz/8ZjecBVjo5YBcSZHV0k53WiDIirVdk1yvfZol9TFJzgW7j
X-Gm-Gg: AeBDieuJ+OeTNQ8o6YuIFA0eKZYLzoqY7PVTCIauUWuqtkmqbNaxI9r1KysNTGsVnPm
	2SpgpTNpajd/XGKsp2qBp/gPCnpAApo/QNVHC1DS0oUytpLG/0Z+rl2zYGGg8Mqmd+hreolkAik
	gDIxnTJtuQCUaBoH8RmS3hdeLRgvVXx4YtSKI0nYa4knApA9WvtSqTbmkzxV2HBwbUg6aLhhCKV
	MsCR1sX2OKE+OWOlraoICyFYOZXWfy16nE7JGbFb+LpUb6NIEhNJJTWr0PTI4BoetwHun4boXHT
	dXsAtlsAtwoXMJfKmwqmrl2tZTpG7c8XeoI41hztdK8hdbwzkoh/77eFrq6Pvag3QmIWvMMN4cS
	YALfbHupnhto28rzlo96XOU27nhDNxu0lu44rDAWnje3UT0YG
X-Received: by 2002:a05:6a00:2ea2:b0:82f:9aa:d63d with SMTP id d2e1a72fcca58-82f0c368148mr4928477b3a.49.1775846586844;
        Fri, 10 Apr 2026 11:43:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea2:b0:82f:9aa:d63d with SMTP id d2e1a72fcca58-82f0c368148mr4928447b3a.49.1775846586238;
        Fri, 10 Apr 2026 11:43:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 16/35] arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:53 +0530
Message-ID: <20260410184124.1068210-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: X2iiPR55BAGrjyM1zrYfvT1AZscJ2Ssv
X-Proofpoint-GUID: X2iiPR55BAGrjyM1zrYfvT1AZscJ2Ssv
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944bb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX2PXvg1KHaBFh
 cJft47ujKc1AFHZZWNzxj/sYDxzs3LOr+eYeDcuzWmzSDUlaPX6qXwTlqRjY7paoeTFPJedkzlU
 aCCIX6AJ1lUivk2jDAf6Vc86Cw3kI01I0Uuxdb1+tRgdjWj0Dj24k9hxzIaHRfRdx6sbRlotn1E
 FkDAk1HAh9LdcROMcR5PEfaxloL4Oq7e9El+T0R+cvRb+oqQdIf+k31JPNPBxCmIlQe3WddUhCO
 aRqsTi+NXFxSFNliGtJG8JgSZGmBGkIjt+d67AdkYMKIUdYmEIIgBLWypWTo080c/EB4NsyZcht
 EMt69PJE8KWbjMReK0U8msmYNoQnttRLgY8uR5+LdRIVQFCnRjuOICO5oQeru/m/hb/6u+kr7nW
 Wulq+l5H8taN4u+e1unxUvqpDXJa2ljB3FhTKTo6kKIdMO+0EnMIWB6et/+sbzRlcIntKmXUPUE
 vxoaL+QzdzU7I42RNmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..8aa60aa524a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3728,7 +3728,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0

