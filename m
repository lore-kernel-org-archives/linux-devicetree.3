Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025EB39C00A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903163; cv=none; b=qVV8f66o8rNJ76PEitsT/H8j9gf7bOUdpSnN9SpVmaSqWNyVvj0eveAUnprD4Tl/EC3MqU4rK7FA0grz0lwbnsVAnuP2gEF/MZkOnT6GfY6fVYKgi07LeRrw3lYRQw2NfS2ambFJgdxbVpgMFcXpkP4LxJCn6ul6cQQzoFltn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903163; c=relaxed/simple;
	bh=7feR8JXOW8roAqvni7qC46BUe3HpOJFdYh26onFNy4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0t+KUgbkjzXZ61l6K8OpeabK0cRVTVCiWOfVAJB9CNZamvzWFLM3h+tKggs2LrVBZZgKgPuQDftdw4/izD7ll2c3HUdkqmOcwxQ5Q1QW9zY4eKWa4+ffJJ4EldbvLb7AQJawDn552Z7rShjirf1zatjnZB/NbSRi0PbTTHk1+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkYcWa/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qn6y+Al8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkYcWa/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qn6y+Al8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFKIDN3175937
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=; b=LkYcWa/LzlP1B607
	QnljtAkg0WxbUKfmzal0zwXu4FG9yrTzXSSI2kNW1zZoPMdDDWQYVRCfpxNDhrL3
	bNzxe4Oxaqev4zLYR52KOd/w46xizFUa5321ZH4Ef2FRSjLj5saWTvEbQYGCtYw/
	9Lg9AXju8PEMgjz+aD6dQQHs/q7TCHUBFEqMoiahEK5XwhD6xrsEgLk3Bgpb1okI
	QxVyYZ8H8y849RoA23uVZ6lUDoPLKZarFA4Uo/GyWcUwFB9dnnzHWBMGTqM/bBcq
	6tXQCIQzWry5QsAQTVlWLHi2/9ArSur1G5iEjiFu4AEE+vl60sHodHtJR2dPcKwb
	Br8B9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h2c6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so20692065ad.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903160; x=1775507960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=;
        b=Qn6y+Al8YddrzPyIyMSLerz8KD0aps0s8WiFerXDwa5B0R2bgqdDoZxWYhhgIfBP8U
         him8pW+gThkzp26/N03R24itaswGzuEIYjfzKQITSByc/fduch9RIBUoeAp8+q+tJ2Vd
         sx7IQ3xfaHyYJ2NVZW9KvrOgVouOb9fJ36MIRcINfOpmR7m2aQzKfpZ0NE4V8JbIySt2
         cyThqiUTAWu7y/KsxX/ljTfhbxopCP6L+WnLYPfxO6ZZnSHoU069Ojs8UZZMSHzrYc55
         qGsN3YeKHudfMoq05UnCHlg7fggcAM6SXnUi3Uh8EDBCGVtxy+hrzdPopfcC/EhrCtfm
         JVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903160; x=1775507960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHWj4m5kp7X9p0xcITcipoqa6X4UhFrBaGVb5fpuBNQ=;
        b=SXGTAV7dQp2sOb44fWyr2bWhZVr0pxGg1lJB/2HaGIh4ucGEUktHvZNmTTu+BDKTsB
         63caQF4URyQNS4/UqPlIvkqVJ5PTvvBx4a0LS7SXDeQX8W9Rcuv+Hq9Zs0hx+GGm9hJC
         TN3Zvf44v9LMduAxuuwsPSxZ7J8ojAkV3a3pS0ixF5uFTmEIJgKbWyrQZKiN7glOPAlx
         1RuI/tfvE2wCtfzoQbly/oxE0cBXbYilmgVa/nBoXjbwKIafeL1YCU7twtPwZI9tyHep
         k+U3M7d/GIiJxv4UdgB7EVTCWylOy9fclMftd7AwmA6dBTf0GSFu/3wJxEzVHLihW3rY
         rwIg==
X-Forwarded-Encrypted: i=1; AJvYcCVK/Bk593ZbndRqA7C2ixlhob0v2eA1IReAEELNeTBV8cKQR20u6U/waRSdff+CEAmm/lsWcPrS7+UI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuz6fIOPeTBmtKE5/VncAOoRY4v8RgWRzeLUxvtcpyYIatKwkM
	E/AeBgcDZOMnYMERJA41NdpsgWf3dDc2VQZtqhqpM5PEGgBA1ahNSML/8UqtE/PqCwkRvoS36gr
	ZP5+XJxHMAYwhYEC3Pptu4lbFzjNYFQOazm2lv4v0nGWtDuR2+LmDTJ+5trIDhUzw
X-Gm-Gg: ATEYQzzGevpNN03VNhd36iqFMwF4Af8/7NEsuqYUlU8L5bEwuAPXjnCQ8pB7fYjKKKb
	7SI8ZAQFkLCeTUtMYtPR6gphqE0DT7I3iJqyuleSU4sUFZ1Nov3cy3vIwRwsm2zly+et0BE2gNs
	TFQfcDiKOvIIdiLrARkZ8xh7qmISMsJTvKxA/bR/eLhbG0t6SyA2o7+rrWUThY8vcX7n9jvE9cI
	tcn8eCgaoMMQ4bS6l7Bc7DEYzaQpbLfBFod2z72UZvO++ZRVoQ4oxftZrSXet4YBEoM+Rv65Y7l
	2uf6f3F83rsG17zIK2Zmi4xQdfW7FjdygsoPEFgm6aDQFpJJrYBXJzIogQEnkVs6KS6UpS1JWRD
	QQS18KpatCbjETZQ7paGHnX4IqrWqdBSUyJGEd6NXJ2VKI0qNYcaI0a54y3Gd00XPykfzl5XsVm
	amD5w6XwK90z2V/wXuS2JdU9kEhIf6Ntv93BpcUj8=
X-Received: by 2002:a17:903:98f:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b0cdcb7d56mr153261265ad.32.1774903160008;
        Mon, 30 Mar 2026 13:39:20 -0700 (PDT)
X-Received: by 2002:a17:903:98f:b0:2b0:9a61:9e9 with SMTP id d9443c01a7336-2b0cdcb7d56mr153260995ad.32.1774903159492;
        Mon, 30 Mar 2026 13:39:19 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:19 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:06 +0530
Subject: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX7ge8vZbnsHhU
 q8tH0EJmykpiLWy6GZcSHngZoxBKdEzQ8703dn3RMYREpYsfzIATV/0rosPQu5TO1DEAbaLyqjP
 YOkZzwhKZdSfaXbKjTx7ETyYLBd4LM9EaOKc2ARW0uDvnNpcUkGfZcZDqX+dwgITRwDrr2DWAuL
 aXg+aAJQwxikQ9N4vm/5RGbWQXFwJSmzswxaPmp78Iz1ScAYbWLXdMEpDOPfNokejv+K9xO64m2
 2Etix3v3V69l1zRI+PzzTmqOR2BovUzLTKEgcGgKf2ThiISdJ//PeiRd4gQEz37f1Nor/9v2uft
 3ayQ1trTKsu/HSLJnVuIHZpts+6uZaJULFhUIYWnJ6/zUkR2Aj64FhohIlOyaTrK+SU0fafF4bz
 e1Y0oybY2cO000VYwaIvLamvOU27a7jCNRwIs2g8beIT+bnkcZqP7jlOASi57OijznJ2wmzZPAm
 YVML/TcajgUAcSqrkYA==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cadf78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=D60P_gS81Jvdon0wwAAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: F4D9Yw32HVjLOHzQHsFw_vooljmw2ANE
X-Proofpoint-ORIG-GUID: F4D9Yw32HVjLOHzQHsFw_vooljmw2ANE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..b30f639b4c91 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1

