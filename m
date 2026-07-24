Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A33AD517
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877591; cv=none; b=O9Tc8smFdL8bdhGwqiYdjQcEmdkdRhl7hbINIJQp+O7WX9tQAdnf3JnKeR45ibGzs7z7IM7VNZK57V8ubc5Zllk1Nzp2lYP9k6ZJxCozNXmc4oi7XHkti/spiEryhbRBaniisalcos4lFspSzequMFelbPbEsk26PhcH4SRXx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877591; c=relaxed/simple;
	bh=wZDWaODCyzp7t+O12ZO+CiytzMHhYNjkW2d/5Umhqnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpAHlZVpjgE21siG4c/IG3BhEW8o9lL7HJUPYFEKXQkPxSeFXmRFd1EJ3GVyCZWVRp5NVTc+Ptp+6HqAKMxPhgnr7UM3IDOiR2zM2EHMHsaNFG1Ilgqkp6DEFcgWcBfNpsUfBD/B2JSt9rUeIC03PHqtLvZeaTzgFYQwaWkEY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRfReoF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYFNx3OV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRfReoF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYFNx3OV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lOZ41869163
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=SRfReoF3mUtI5cLQ
	iPa1Rfmx16lH4+oLCZeIV0lGWOxyE6tIQVHkKpCPQXUCzkD/zdTgTqbfSTlHOkXc
	Ss4E3udo89bT2J1Yn4NNVJs72qofDVhIpC5xoDYT3GonXUzZelCynprqMEg414tk
	HbsrwjIZFhBLJaFUgee9nc/uwLm+hngYoczJDGbQzTYvTEUepKY0fXLCKv4pWEzF
	8kuQoXKADivj9b2CSh6704160BqH6mdmUwZzk1poOWGybNxGb0nFZrlE6i6NEsQN
	WFoy9QEBwJpDxEjKw+F43/jjw0v6Ypzx6t3L+g0E2SbGU+YHfbPPYRrNvdBDOBOf
	1NPkKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8mtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:19:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so3047085ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877588; x=1785482388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=GYFNx3OVufoJmbsM/V7NOjuOIG7Yy9R/taAR7Wb6P2TAVDfTwq+V5qSaacKGeLFcGN
         B3zBZV3rcpHzBb6gDtN1Opp3HUXIe4dXgpmQiT/uAH7rGGvBDZxElCvyD2uONOgFmh0V
         ArmCVv5yEr1340mvmS+Zpv5H5rW9tzt+5x4eYupGoP5c2x3nYoOw//5CGML/ro+YVXgm
         dp/WViP9FqBNe4VdK6fScUc6eutYB1ReYIBvsSXHx7n3J7YN5v6mt6e1cbFcn1R3Fqcz
         0nA3L3e0Xfa2UBaWX4tKtVFnIbj0dQ9ZRRtq/52Bf6v3ZY1mvzw6PC17Dp2XJmtluzTi
         ekRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877588; x=1785482388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=Kkr3nJi1P0LFP77jRBBdXXfHwko9tHMxhOKcli8Q/gi/edPYyumYof2GDg4m5SW5yX
         MD5W2uyY1JK2h8H3Bse6vjAOS5qh4wlsdJdH83R2W38diENsLY4qYwv+nHd1VpXekzPa
         r45wJERwyWK+pxmNwIwRlMx5iqmUx2lNJqWT2UgpHWe6yYWFj0xylm3okk4KGGWTwcxT
         LN/o2Qj+AdhsiUydB8KepYy1e07DNaRFZRvuWRWFRkeT5eYC8BiCDU/6KUTcjOFvp/ii
         Wg2BfjZVDYy2Q2aEFYo3RA2eO0QFcWqS8U7LNnfvNSqwI5yFXxW+SvyheeDDjF9KkXRd
         /+QA==
X-Forwarded-Encrypted: i=1; AHgh+RpGWLT05FOVYhT2vZxQE0OXVTidGtsQqpntTBYQJ/HXilYL1OPu8mWy4sMiZMrqsKSalLcDB1nOXmpw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CV9cPt6LeplY9krvfLPPgwhz2XAK4uW8ppnkLOrmvcVWNipU
	YDrRNx5VVNm1vVn1su7mBK+0YxiB8VR2sJ4VJK+3jjDPIhk1zATAzaTg91BVP6W4sVvIkbv8PnR
	spMw7AWWLNFuBgBpc0lpg6AhnoLUZk/So4+iS2gSUOBXS3fFqqz7qXTAC7olASTyw
X-Gm-Gg: AR+sD13YA8SB3mXFeeY5zJUxe4FYBluXLaKejDjBdTmEayfz9gwhn0wCe63ZocEdjL3
	DszLc9cHm4jAKiqwCFFsXYytddGBswN2YEOm9p7v3I+XYlXId/8c9FoJd0QpPQxY25EzlCirgai
	GXjk+K+H73d5Zm6iBLGH/qPYmKac5NCqvclYEU8JXLwQF0FPKU8JHr3MnSSinPbxRqh5Ne0RsxR
	sEh9tGX/XraMnFIjXIPqpPtCt1NUcza9My8aOX8ODJjpFquOH/pkRrzW99UnUhPVX5b+p6+bkYM
	78bOyFmJR/ftCtGCMx8d3Zbj8MXR6EuH0YxldEyR1SKpFoqAkqFguwqQ/Xc5YokAfyaA2yJ7n1P
	gVG2OzFOGaw0RJfcc1CpU2HHAA7hyIZyPCIgtDyzwR/WXIUFv64ZdWwKVbigyvlc6Tlw016v0xx
	WZ/3CqQH8EOk9VYfTTAT5D9N3R6w0=
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555495ad.34.1784877587575;
        Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555095ad.34.1784877586957;
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:14 +0530
Subject: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS
 DVFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=1007;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8tKdt4fKJhT/tYsqDka1HLDRza+yiVyfZcS7BTSC5l0=;
 b=ElL7bMtCXym3FQCEHsNOAZ7OqHreyEim7+hA/4Ik410F2ff4uLS6Ygqlqda19xM3CYybnTvEV
 WCJ5kWpaYhwCMF/CKunvlKt6HUtpNwDIoAQtQGMSPWQdpDEw01Z8B8w
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXxUbsv97S9Gbd
 3LHXj6RWRyqWI94xpIBCKvwVW9NRc3P6shH3cu8RkOuqENf6QCo5AoLZs1JhHxoS4D9DzvvujnG
 rsJwAN6BYV8AxUs44aZ4o1gEb7fqg4caTqMJVmPF7oM3JyBPW51dNsm6xQ8LWNExbuIkewfgkjw
 EZBcczqZnELpi1afmzwS/UA9ypwXnlSINOzxC3NvBywDiQC24xJBQkKa3C5txIo56qvhkjOwKiy
 RbA6jFLz4ZbGoV/gNE803Jgjo0fFNLUgKt+6eRixCypPSpoFEr9W8PYzOQlr/ieA4OS+cTw0Gbr
 k+TPuBVCV2ZfxV7kbiloxiWc8+hWcsevLHJ9zV1QWgJmgUHgoyB6jjEUT9pgZPIAj8bu5hdFjf2
 gqyXQOIlvnAOEmHG/GAXZm0HzRGI4eMufV27jiul2Q2Qh/AtBGWU0EkXx2ee5I8o5knHWypkQlT
 7lEwMeKfnhs51Lv49Mg==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a631214 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZUFoVB0R_VvRiptuP7sD_VHA3LaqJHPN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX6VeqMJsKXjkT
 Ajh/SvBMuQbX68OjawtuU0ubvVDtQwwW6sb8aEmXMPs2B3xDBc1BePprhiuyHszTE4NYe1aSZQx
 p3Bcuygx6fvLs61reTypT1ceWnLZpeo=
X-Proofpoint-GUID: ZUFoVB0R_VvRiptuP7sD_VHA3LaqJHPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe and get functional bus DVFS
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..e9e75c4c4da6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -340,6 +340,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1

