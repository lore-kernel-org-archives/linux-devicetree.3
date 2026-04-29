Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A937B03C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476298; cv=none; b=Wu2HynRi++3GyYUccKhTLuDZzwRcDLaSSQ0FQYXLSFQiYmBK0OflSLQtWOTjy4LLwbg5hZcJ0LhN8qH70x8tbm4cfSShGgjS27CwWk41iLFLQvg3Pm3xmvEyC6faYq/TdpWH2kXOHakxDLuecYi9PNSavlds54RZYAlIFJ+MNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476298; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYPmHzcvFyQFHYBayoYueD17W8ehH6pCEo7ux08jsZEDEzf4zqr4qHatMeo8AizrtEmAtQx2N4JU5fTGl7205eBsyx/C1F3KqfJbD117nTrI0P9ZnCWm/qx2dkIikIS8WYA1E+XkPR9l0Ga6Kd+UfPpow/SXQRI1ZxzVoySYkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8oqG2jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPQ6/FwD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8oqG2jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPQ6/FwD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEqR9q3752527
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=N8oqG2jDWombJYvq
	tZsB63F2YmRClEKLURoKXuOpMS/B6byGpue31iVLZROIriU/aLbommp1WCdYe6aG
	bz4gG5U0cVSLqPYKL9GdwnTknbSGu8E8ZAJVpDWLMCZSQvvEfmAdUGdf1XtBuTfJ
	oczLT90+JMv7uR8vCE1Ts9Mg8TKcS5LBIouSD3RVp9Gwt40VVyzH624Z/8ZNWZaN
	cBjzwH9ys8Gax5ULFSEz6Fr3gY62cm/3IiecRfhS0wpePgTeZxIh4/3na6obVRcD
	0PUGbyd0iKZ7Qcs/DnwQY/kjusRmZ3x77OTncVtmDB7SO98WIivai2H9Jm8R4704
	Nr3TDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1j642-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:24:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso12265615a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476295; x=1778081095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=jPQ6/FwDtJanM0DyDNhpAQO7U1HzRvaZW9XSIQwJha20Z1Y10lrrar1cILecs8q/jM
         iUNl8q7hMImBzfRK/CDq9y6U8VFi0Cyi+I8cHMaQ6rImToN+4U44w3VWvj+aX0EV/wRD
         DeA6T5zZUv9ajNk4UbRig+0ij+uvCo0fJ5ozfhn8IZ7fRWIWrWzlkKvFCUm61PKMjRpd
         vhDKo1TAe/Ho6MJqASmFRCRjljhCbZkANV/eYoiINn0IVkqTLRnZEYDanuPfG9qHiFqq
         NLW8dWqt/bkCjBD+y1a5CTCjU9zHaw7iT/s78v7A3rLFByxB4i3rgBpaoAY2ZqmyI+iH
         epVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476295; x=1778081095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=nI64uHioTg5UgIq6CyUSi7VP7wkErCevo42OsB+zQL7rbr2sGvUNtU+dYFPCDrBvZs
         2WxEn7XSI1eYrAkFq+ackZGfyjUsXU904a9dQFM2vNzJaKvmzIKpC/94JaUVu5X3xxct
         Sxc6k5pMRu+bb6vl/gM+qXDfLKqNxyVDGQfTjEQVPcV5AMZPtIsE2NIULmElQL4aH+JI
         QvtAZjy2hHykWtW129o1WinCYzFr40HGTZkUi8Nlui6bWL1zdHieuhmaIcdFogAYSlyF
         DWuuXYLiYdMPRukdzYcLQooaR+8wFEgKI/a553WeB+gIMtwSvPQsSgAZyD+7M4h1djFx
         wHfg==
X-Forwarded-Encrypted: i=1; AFNElJ9XcdZRQWNoxCstvpTdW3tdTcofRQQw4JRFytydZKjnyuKsUVLb1ds0AdphY0BGAHtIvEHWD3OlLGG9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AMbYiX7VXOjF1bwJEasW/nj9D0/PzqgOiFl/HabjeA/nTitK
	XPN3W7UNQ/syrsrEz9HtWwvIpXLjpxgojIS9IpkBnLZSTv8ufB9dF03rIsHWxKs+is0SLkW7t7N
	CB16mWL8RtsPSqeOzvwt2Fx9hJ4n71oyJcyjXvp/Po4Eme+QvfEpN2/2tRt6j75kc
X-Gm-Gg: AeBDievsIa6huUnGI2foKRvw2jPhwMlglIhzCM3uvkYOzSIawMlsgMVn26k/AE3yIzm
	bQ2hKu0G/NwdwpFQz6cPpm9g+iu2H9bm7DK8N4TgSJKHTY7OkgEwOaacRPxICENsDbOCaG6MOR0
	m31BF8nTVZOgc+OlQIUAo7eY6KSozM9DeXN1UIme48Isrb4b+xWbb1gc3Z0tmI/3NLLdg2xGbRM
	q9QHGuk1N54ztBntmgskhtPIIGSxRVOJJiMtTQKYooJVBe9aGfjcBpgsTgAm13zvwAhaHjXdZQR
	CMDZaGApkDDsOQdF09pfRpN0rlnSPrXj/jYsT/uznI+E+NHJ5qiKbpRpxVxadv3tDfAadG9+3GS
	O1rVtexls0oUEx/zj7h66Oq37rIZdB0gM3wLub4CwFgTn0di634mAADZcgwq/Ku3FPVY0jEsEtU
	1zBtOvOjFbtakPGo+91a8ektHUqPJ5vsVj2pCAB/LUGwcEMLJbgj9PRsJblNh0By1gm8Q=
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811646a91.26.1777476294817;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-36492055f11mr8811612a91.26.1777476294352;
        Wed, 29 Apr 2026 08:24:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:54:24 +0530
Subject: [PATCH v2 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-ipq9650_boot_to_shell-v2-3-9b0dc3d1f3a8@oss.qualcomm.com>
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=ZiGr36yeLWDWz/rwMpos3EpHE6sMlPJGhdwRjn53GQe03ljyPYrbSrZitAR0iHT9+PWL07Hzs
 eLR2oWrl5mlDp3lpObDcbE0nYeU6EOzow5MCaRcZ17MxBcAHiHVDcBr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f222c7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX4zu8mAOwLKSv
 xTzfLskfFQQV7oWXMbiLmDfOspXM7/UOsGYU3LirSNJ4CSeB4NTJX3x4yzIw670ZehImce+ReE0
 NfALnw9W9ypspn5AlmioFgbGKXhJaOmrBb7cI3KfSd8bgNdgCJ7lWQO9PFtNi3gT5vaPNfxNcyO
 piIuLyTZSKZ5wYYa1wFcs5uXvhdoXdtGuCSUSdVCyz6DWeVCuBwD7PnTXJetnc9sBsL4ZM+P/S2
 nsG8KqH1FnJ0zNRo7wlvXNnHNTHTNrejPmRJXSECZY2OXKtrRtzvShxmzk/KQOS9v8sgR9Py331
 inIxJnkU8p7kpmK5U2xYY0z0c5vuMlyo4RQpoJE/9IaJyf3IF4030afMYjM3eWZuV0+3HFXv6rQ
 boB1oOPhfC9S48Q4ctxPKLh+Tmf2gVAtj68bAFeLK/z+UxpZzbZJrawVbJOnJqkBBQZ9h6UjqQR
 /3dQcQO04/GdODtOj8A==
X-Proofpoint-GUID: 4177nrdpwnb2nAP0lLVuJdsQ3Ri0OhLI
X-Proofpoint-ORIG-GUID: 4177nrdpwnb2nAP0lLVuJdsQ3Ri0OhLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290155

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

