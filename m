Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121449E13D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108349; cv=none; b=RPuwRwd96F0pHeuswHewxUJu1U1Ck2wsMonPBWoLtAgJR/b/7ixlSsy4Kx7Lbkk2WqykutakkJUID2pvUam0/BrhuXQ+B83iQpq+yd+fExE7L5BJfLgOxYLwHzKoFT+pnQie0I9G8zI0eRvxEdpq5DEpB9Cj3jQMNjKIAU65hQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108349; c=relaxed/simple;
	bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah3/SLpc5nsJMh3pxDfFg5CEZqLXCQa79TrzOY2WKtv4i/meiv6rYTRGtuDQdA/aVGzYKEzKgGKguXotzkqYcCoKjEFcVAqnzM8+Lizjp9v5/8Kj5Im4PKuE/GHdDhcec9gNPHMaQkEMPpXrTUeSrpuqavI2chaHFSGUh6jrTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXbplp4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7CrDyFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXbplp4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7CrDyFi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBf9H3897565
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=; b=OXbplp4LKDPgjPab
	BgoA2wR9tKGaUNyV6yDOz3/Z8ARLMd0zJdmdjnkEW7L0VIwvPrX/p5wPJ1eWn/BE
	3pZh6GSM+Y59JxPWLpLBD1jP1PZKsaTULBbJzEY3byZFnP0dPF7p9NaY2zjp+jPi
	+VrwwlmCF/pPb70NYEsswtYPPt7dgXVPg4IiZfDY9fs0q/tlxZ0whFVgQ6Y1guNG
	CUWCjmsKKfOie/CnosR3nTNJ2PXCfhwxXTpNBZ/wbCA0InDNYKj5WxxxkYLFukhI
	DwBDF0r+MCwfRCmkkWO5ZwmuKaFwTMit1GDaPoID3nhHjE3alr0+wNEsuDu7HnuL
	1GF1RQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0bpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:19:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso259652c88.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108342; x=1790713142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=T7CrDyFiu/fBG0PdDh4mTjjEtd4LB1KUmTL5Sp3UC0PFcfP35KLo1JeqGcl2cyOeRm
         DjronCkraVIN06MVibPEeafMK80s965P7UcLa8N2gKaGrxCB5n2hrviF5IMOckvKM3Va
         /050bakC+5iGzlfzFlkaXaDNggt7R5V9Zp0kMQgZ81j/ctsQe4IPn4bEnX+DT31NZDwk
         5ukmEf7Cqw17TOBzPJ3TWh1irvUedkLzEiZ08cAQKvo0F0gST+1tfx1K4n/y9QIpolH3
         kNXWWQw2a81RqSq7saYiMDIpTImyCASSiugzwEZtC+RgLqA/SFsUW2t6n6swictvrscK
         +0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108342; x=1790713142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=vFTac1L6tbI15VBkKqeMSaP5ixUl2F/fzkA3TOC4S18vFefemcqgwGvp3mOif1R2HP
         l53xwXnJucihO/L9XMl/zU9cxky9tEvPbnf1DITiFX1RgBC47PSrfVl1cegVNIQ0M6bj
         oW0YBTDx2JHPdxL7lwWjE9MF7geJwZHAuHpgo0plHP06ta+mqlTPj27w7pdRaUt9nYsD
         d9n0tfSJmf0ngDPJ5uT3IMeMLjCNmA7kVgS7OwG93XAl7NmOTFkjMtqbzcZHfTT2QqJJ
         DC8bpWaR4PBNniepPvgMQLTRdJjk+oYF+d23srxlknvnqTzZbLJNZsNKUc3dlTrmC7Z9
         dXzQ==
X-Gm-Message-State: AFuF++neNxYoCimbEbZ4KquQ9p1Ud78bbEIEkMksmE9uQ/Ov2umglRoA
	n0eep68EKLjBotGF4qgvr334uw2e77sWxBJ3B3xXA/UiEZb3iSM7VDiJvxcCSCAP2eYDs6fr0OG
	oUoClS7VvXarO9jJifYBINtNVORuJ/FIh6pvh3+mSrbGX3LLiehjEjd2Zxwtr01ayEL8aEePF
X-Gm-Gg: AYBFou1uCVDfjgWlwJ4pz63yzGgsxdg+rGYo7Mia8g5kmVkiGs5HKrF+XbCu6Xoee/S
	BReML5T5fZsBhKjAkfqxuXrXN5+du3O1UGW/WClNQi2wD0kMrbsQaZPGNak8Ugic1tz6bPXS5J8
	wrq3pLCT2r3ZZGDmUcsgeW6vuS/DiCa/veNEVJwG+1YuSP13uminTA2W6J2MiHkoWQMATVWFU5s
	rQqxNCpvXbPb18j3eHnw49wGZhlY8sgDDODGczRuq+Zu+akyRkmfxraXxpFungFRjjC7/xAQwqb
	1qkth4VGIO7rRBaYaDw1HO6C0bisfdrCZp9gIEeaj3Lk7n18WeMSc1/Rc2ha9scqOmjTirA/K3u
	RzTrKElES/PnNZitCk8aT67veJw==
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr477101c88.40.1790108341975;
        Tue, 22 Sep 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr477063c88.40.1790108341264;
        Tue, 22 Sep 2026 13:19:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:35 +0530
Subject: [PATCH 1/4] dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU
 compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-1-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=929;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
 b=ANeeQPsv2NbzjxheHp6fl7Ay8B5EtBvQTd7xhic8j/izwG1tJhpAxHYB0nlsWvIl30j48gy1v
 AqdbCvzZrWeAgrgo4xuHAG+pFZYGBfYUIJQmY6c6/LE04rhpEnXitJC
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: LBA3H3G022fijn4gov2DUc9F2vSsKT2p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5MyBTYWx0ZWRfX/f0c1ZsmNqp/
 fJksaTLmFYAvKC6fh2FF84sw08lWlnikpmT0OJ5AU4/D9jvwZBZzOY1ftDCOQHmMvUcZrYFY883
 Oe7xdvhd3S2mTxHVMmk58Vom9VWop5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5MyBTYWx0ZWRfX9XIr0aZYeoRd
 ML+3Seot38Ecd/AuWK6qWcfpcsOTEUwQ4sc9KPnvMRZoGfveNUGf9ebs0VJH7wM4tDM2XbDF+Ax
 Q9dVSXcDMM6YAuchdcJCdKqmZ/LPsHLDAzwonMLFZyGSENJlaY+UdtWqFscQENPkdHZSs/p6xF3
 TOxSTsZZRx2U/zhaJ39EgCAVgEteObSZrs4U/lf+okE9oTT5HLbueOGu6uNrPZhj5T9zcLamma5
 plkWbqpyPrpy4ZQcUUlys3jS1TxgDNGDZBzGi8/TyNHPXi5hO+8ntCJu9+g34bLvZ/fcc+sVXiC
 ZbUr4Yd1eNnfiCzDjSNMcYpYPrlZUkevvz4T2mvr7/J+zqF+KqpjMP27EgZjqRc1m2CFwtyuA4D
 MlxAGFGXKuh8lDt6ZDw5vWq2Zh1LYbal5MNsFEDdLdKn4JelS8BbFXtnYokOFfQ6PysBjp8Rumb
 DrnayJBEIMy+C6rQojg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2e2b6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qZrVCR7J192xugBBzLgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: LBA3H3G022fijn4gov2DUc9F2vSsKT2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220293

Add core-specific compatibles for Qualcomm Oryon CPUs with PartNum 3
following the qcom,oryon-PART_NUM-VARIANT convention derived from
MIDR_EL1 and to be used on the Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c3facc98bf83..ead4e3f3462f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -230,6 +230,9 @@ properties:
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
+          - qcom,oryon-3-0
+          - qcom,oryon-3-1
+          - qcom,oryon-3-2
           - qcom,scorpion
           - samsung,mongoose-m2
           - samsung,mongoose-m3

-- 
2.55.0

