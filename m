Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C73F7873
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965286; cv=none; b=ocTLTknKyNN0u/j9QbB9weraLYiUYeS8tWa7w3gnKUaa7mhe5I0Htd/QZvvRDqiq1b1+vXp/rEbWMoDrAQZ072dMyZMih9q+knFQFc+yc/RX3txmrH/qOrmACz3i1Bkk/nZ7kzOPvjUGuOCaLLDuOZfVDu5N/bzZbgQOlvAs2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965286; c=relaxed/simple;
	bh=uINeSghcSnHTcoOpGq08LKuvp5VQ26vSLMRX+YztYTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lS4i36btmP1WmfXQJZicHTblgfFkBB5+RigsPiUbGNhxvZZNnaa6mSJ9Q81RHzHG+DgQz4cWcp9qLJA6aPe8DcTMiHozr/yGgNVQcGQMMHj+KTLnVDlRwXIp25C83I3ODeyaK/hvCziCCBS5lurZYSGOFJ9qNl1bUqAeaBBa/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1HcfgW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzJy6AAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1HcfgW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzJy6AAr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBLNaQ2409369
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=; b=B1HcfgW8p8EhAZoO
	4koPyWYua2eCxVsOMv5bwppphbIrnIsI44u7x+Jsi1F37MFCiB/RSXG8S8bz1qr2
	MzG95b5Z5flxeL7riA0gZ+2clb2VXUtLLi9+XOUcTsTwFkPwidFJzK3SqqORMTRd
	gdvUHR8JHo1ctRNIKzEzDkl8GgAw0Ua7WdO+CIjtN8kclU9oqhhueo2MgpzTSozb
	IlQZU3eOVHYqEyQcQPe3Fb/LpyzdAgnVuTV1dJNCaZGYy1tKSz99JKHQReNpEWhU
	2BcMJ25AJEf0Yi+gpCfVpbSEGWjVmSWk5MWrThPjizkxUh+ht8PcBWTkqfUamjzS
	AzB0ag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heuek5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso33057105ad.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965283; x=1775570083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=;
        b=IzJy6AArdbVusMklZBbBeziqAaM7FPRkRxzFpBnowoXzod8tf795MVoSdvP4SYKqfF
         0edliB0+jp2QCGs+/0wsaFDTqNdVscOzq56LEJpBQ5JYZXiy5NbkomrGQQa2BBl1KVjc
         GdQvAAo81F9ayaYfuHmbkAWN7MYy7iMfed5ltHjFDMev4kFhvGhdVI5m0dlfj/1Eyu/1
         waGaHGbJ4uwUs8hrL7W2pOM7LuP1nvfmGXINxgA5E9nZPVS5k7GscT6ROD3sol5sznDR
         /C1nxhvUMbeXLGuqqfrV41gatypX+bVKyJvC7AmSJAWCBJQWO22/jGMBvVvNmNM8zKvd
         g8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965283; x=1775570083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DDNBhIh4AOJoI28FZRnT5jIY4cmc7LdxaFMdNuNxdxk=;
        b=CNKLsc4dYTxY1RgY1bs4fjKXFHfo6PTEHgXLUc71D6GDwaAECsQZVoBV955txkUn7N
         /FyC0bXMdd8NAREQrOvZ2HDCQoKNyjXfd4ltADKT4HWkslYs8NPwJCZ3sx77vSOj3WQH
         uk70hJmdyDZd/neV7pmbkUC+wwmrJRzy/4/O34esv7SpIhmtNqWJOmlcZ/3V3qAXVrzB
         l8h8DywL7VFyi9ziKZw+75+FAuU9C1blsMp+CgnIEOJhOiuOV4woo4An2dNvovx/hJ2c
         KC2sVRvsbwFQ8W4KVhf9gOwOf+sUS8J7cetb6+9qbKW4U2ZKEDkLlzTdujqk345ugbzj
         1Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCXm63rk3vBoRthGyiJrAgpEEts0s8PtxoVZ4acTsON/du242kWK3p3+1NIXpBJYSiAieozBZHEoVfgD@vger.kernel.org
X-Gm-Message-State: AOJu0YzOesUUqFpLaXV4y2HiQHBudBrrTtIgf9aGzqGfZO8dI/vZk806
	0l1wUgQl2nZiZXHIUw9mf3zTLD1B3trp2TM00Ep8X0M239QttW/AXwXbRU1bmQDxEe2T8310FOn
	1VaKQNgOSN/We6Gdg/m9QlgoYBdoKjaAb7rgxhF+b4qgW1JAM+7xwBKpw76oqoxUc
X-Gm-Gg: ATEYQzyX4C4XPzcZF1fpqRrEoWoZzDrL6P2lIhweMmSPeKXjm6TGnsEL/7b/7SBuWJl
	DzGNFess2rnLuS+oN2K7kadvHhclGYBpYHFqsg+bO537q100u7DZ5ESF2uUZiQr4Hyw4l9L8jkm
	4uyUvbdZSL7EYaudUpXI4X/jUORPxj4K9mnWQK7VUn4vR6SSZpp3YXmm0CbwlAYFCefa67xqeCg
	iaMx0MZxCpS0DnZYtiVlvnDMNeaBW3OmEAyFA6ewI5RcHE9JmSZctwXw+BD3/cLiEm+rVjbVWaU
	I0zzMLpklzV8VwhN9vdYKpCouYwpWH529UY+Ghu/IKu8JFQqS4a8wnsroFc6utlKprOF07hNRec
	iPGHK7fqqxsyEXlSUv5H31durGCZrLB5mn++J4vt/7oWpRIWCvTJQGjbmtGoKBIjAD5JoRAv1xL
	PvDlJJMSTpGJ+4ngO4HmJma0xTth24e+GTD+bTPfh72g==
X-Received: by 2002:a17:903:94d:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b257df28acmr61863565ad.33.1774965283001;
        Tue, 31 Mar 2026 06:54:43 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b257df28acmr61863275ad.33.1774965282481;
        Tue, 31 Mar 2026 06:54:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 19:24:21 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=964;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=uINeSghcSnHTcoOpGq08LKuvp5VQ26vSLMRX+YztYTE=;
 b=0xs+xR5bvM/EBUxkzmOZnAUpdJkAbXGZzN+xOQaQ8XvGZ/5t3VZF20F5oVQXCE9lPGmefBc83
 5R8+9+5qcpTCMitwe4XaFYKJp27puA154RgdHbSr5ed/Ubn0vCJcuQj
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbd224 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hSIpf8IZWTUUM_YmQ3EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _wOb8XakZmVPr9o-UJrU4J4hikQy7hIJ
X-Proofpoint-ORIG-GUID: _wOb8XakZmVPr9o-UJrU4J4hikQy7hIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfX2NOckj9MVaQA
 k5/FKkk3IFp66gCRCmz34aaF6TkH/hAdY7Mmx3EZLn3zRLzHf/k0eZpCEyXvihHe0plDhyUxRXd
 rAbS+CoTkt9OD0rMn0LIye/FK7TMWGgmT8FuCeK7aYYWQP3cidSCQfFrOSlze+AByX3mQTE3u90
 xyQzlBMmcgl5SpYq1/fvBqZeIDRiNm4OEh+RD+Ls7RU6bHzSGALywYpOp5uRCPz7wtcFzs3A8iM
 cH5w05enKjpM3j9M1IVGVEuWfEXCozcJLXGg0V7SJIsbAwpkSG68rQK/xD3AXyleA+WY0MT39FT
 4gWu/WLIjMFYAsmWCqM5zW2kHjayNYkU9IgtMhq6F5totmqzVRnK16XJ83Wckk0KYhCzVWHb2yu
 6B6Zy4VpR2wUNPiFrfjeY2z63TDAU0CBdbIoLST6nkhUxloSXgwVejcNtSsFve0I0SOdxeeaEA+
 Lv+o1J0yIHkuF9U6Wng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310134

Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
node for Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..7a72fcf292dc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5914,6 +5914,18 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		qfprom: efuse@361c8000 {
+			compatible = "qcom,glymur-qfprom", "qcom,qfprom";
+			reg = <0x0 0x361c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@138 {
+				reg = <0x138 0x2>;
+				bits = <0 9>;
+			};
+		};
+
 		imem: sram@81e08000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;

-- 
2.34.1

