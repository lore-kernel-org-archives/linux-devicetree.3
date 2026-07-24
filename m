Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB241D4D6
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888077; cv=none; b=ohMjOFvNO4u/IJASQEcF4yB0a97e29FpCYJdre7PAMqdDjnbjGc8DEWNrBkXH/eRuF9wQ2aEnDYC1ne/paOJ51N5pVaXq2f9b2DO1zY7UHXbF/eJnWNlQkWmA0NrSW6MRW4IxrPmwqL3ZCP5zxX4Ft5s3/LjAlocPKsYeZ6gdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888077; c=relaxed/simple;
	bh=J0OxQuXtmCCGQsk/6eJnqFwNhphujcL1r4uiZyDxkws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yij2H44XHdlC4/wKg6Ek4asVmIZ5GGBy3LsBS/IRRfuv+is2V/yh90ImFgNQ3vsVMHIVgX6iL80RKSLTjmaBCOA9VrQ2Jv0+yVFrOZLbPD8c3c/ib5o7ABLkIi6f8XI0pOIE7o4bsxCeKiBlPMo/G/sPm9M0obiqbyisN+ORJF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ildJ/Mri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dd7n+lrD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ildJ/Mri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dd7n+lrD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADqVe2616188
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IVDocxZsiM9rmlLcikvDLE8daLnUfQKF7TLjilQN4o=; b=ildJ/Mri/ib7F2E6
	aGiC2mDLwqeidF44q74ulXHF1rnIXo+qSpxDBupzkSnsysqKZiCFHr02YzR63c+L
	ZFWPv5cDWmlBNs8R0lTIvnHILMBg76gKQoxrf9FTJyzrAPGhgi89kOennQseOayj
	D9gW0IJHM1e/SVepirrtDsiLLu/oCkShzQ3/YWi8CXjLdRXpgyZhwGytb0wtNCa3
	OwqckVaW6UXbc8ht4pQEvvm7rg/ody3DJn9WzKUWVA6GnxV7OV0/rAuP/ayuAi10
	gnX2RWlfnpjmWtLKWfXRpefq8U9R6bZIyPb4FNoq+D2FGw8+EXE900fK7ZQU2P++
	DmI7AA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw99bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so5254555ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888074; x=1785492874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IVDocxZsiM9rmlLcikvDLE8daLnUfQKF7TLjilQN4o=;
        b=Dd7n+lrDgirTdEeRJHqqSYWroICzDBOCt8pIUB6MIll5fK71glO4SzObFzwzvelwf6
         w0dKFGmaiwJmL49l5TtthTJo9V4VW2prJbFjVWZwd8MfHkCpoU63pDsknL61wbLlSYeF
         anKftVVS7/CSeK/72mCXYIdu/rHFLbeLb8BTir+5OfYn0qQTsL5kDAlGoTKDNoSVK4xy
         SuT2V/ulq53GnaS1YrhvpMREykeJ0RuHOXU2jo4e/lfZk86DtwdKo0Ml1Iz7awHj3ISc
         mWj48Fn0GfVyLfZQdrSKIvkdmU0RqmN70505rZfCX4QzdRUU3BU7wyxZCMMY3QIiPrAV
         vQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888074; x=1785492874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IVDocxZsiM9rmlLcikvDLE8daLnUfQKF7TLjilQN4o=;
        b=EiUNf92fBZiYFXDmZYleQTq1pZ2Pn7ryQVKJNg4HNqwT9aUUQbQ32xZcWt7QaZlrDh
         0wEh5GrikK5jcxKw8ZI4A+Npse5HgV9U76IYI9rmrBWxnB8+lBetXvVMdDIvILGlQcD+
         hIxwipucivhLGaPXPfQoO0VyQ0gkTFOD+FvQEQot+jGMndqEMyYzJwcKW3UqCatksosB
         xdGVDKamo3RGLKXrljmx+tMWrUVHJhGuQ2BvnfRAwAX97cnBhqiYS4LUgxXg1Elc2txw
         wpwG+RlBj4iSmC//2NJyE7BJYycB3x6yV8TYFRCrXtL7Gygi3iDdr3kdhMHTKLkThdbR
         FAoA==
X-Forwarded-Encrypted: i=1; AHgh+RoJ/aXGa5Ok7SxfVYdwYV5RTArcjrD+FdGDeaBjk9OV+QZyXvDBxiNIalzFpL0q6gvAXls69R/suEH2@vger.kernel.org
X-Gm-Message-State: AOJu0YyUu+wJ+WvVG6KQiLJR9LPil+GWKlzxut9WTVyuQgSRehmlYRRf
	YCiP8liFw8ToqN2kBeWx59PoCXJOwN5IybRzvp/giYDVF38+cW90pkFkDqHnYzjcOajU5iBd0NY
	6Hik55Iel3pOOHYozWgj9s8pGRf+sOcHvZ6f4pwoJy/aJ1nzFAVMdS07pGRtLBsc=
X-Gm-Gg: AR+sD10BUHZFb+xMF3LUF8tOAu0XVUdugiVQHyQKBy5XJTw4bJ+09wc+spqOlg+RXqH
	CmFr4wuNxkraTFYIcOQMEz95iGf7N3uuiuWkwwRAEeawMkLmhKCq85iEW4LvvFY9DeKoVtK3OtE
	QvPvSFcQaKRr+3pgHwMnuxIG3f73TVfXt5bAMqJfwT2kyErYhKtRKylONlivBAetqLcfl83kkTO
	WLwqwtbNw50Elz29d5tFBZjMqWrnIfMtOyS69gN5qwqKDBsSM+cqPC2v1NZGDM5ZB2b+dJpnfrN
	9TqCBSq147zJFIEMlNpK93VsNAE+PF4PL4D8I/40nzCAdn5GHuk0FaYdzD8RvRIEGwBQqHQVkeP
	+FFlP4XgD0EjZgRF8Z4tSuA6r/ckt5w==
X-Received: by 2002:a17:903:1666:b0:2ce:ceef:661b with SMTP id d9443c01a7336-2cfa6c512a8mr73664755ad.29.1784888074241;
        Fri, 24 Jul 2026 03:14:34 -0700 (PDT)
X-Received: by 2002:a17:903:1666:b0:2ce:ceef:661b with SMTP id d9443c01a7336-2cfa6c512a8mr73664605ad.29.1784888073786;
        Fri, 24 Jul 2026 03:14:33 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31f14csm48486575ad.63.2026.07.24.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:14:33 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:44:12 +0530
Subject: [PATCH v6 2/3] dt-bindings: power: reset: fix minimum reg count
 for pmk8350-pon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-add_pwrkey_and_resin-v6-2-41acc214d93a@oss.qualcomm.com>
References: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
In-Reply-To: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888058; l=1086;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=J0OxQuXtmCCGQsk/6eJnqFwNhphujcL1r4uiZyDxkws=;
 b=Cm+Y0J3oGt4OotO/l63Wf7mCcNEH/uF5C2YxubMF/VV7f0OZKHANAWEwC8fcyujJ18MuyLzTG
 L4jexlFSAJaB1bosYy2AmqKfqCPplLKA+YB8OOsyfvt3DQRWshDZXJf
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX3pGUCZFBpOHu
 pPxBh3q9JZ57YLUGE2Ec9b10+6ICRwqxa+7FA4uDmIet3y7c5OyW+210bPZO8egIscWRhoKm2YY
 hsDiTd9DLQGuvtsT6l10YcuNn8NOn3WrF8ERLsjUlfIcShvE7L+XpR671Czr1v/ruDHgIGkAflA
 I3RP0ULxdg6iRETjD4WVVEDKiRY4MFtFRA3MxYya4urz/ySj0VZCmniVejDW+8Q3RubohaYi5AY
 Y5lN1Y1jnp5/c9I9pPLu8jWyz4vdcIRhYJzJbKDD4UArwDPXjqBtEiS1pmgUifQKbevBqZ5YtMm
 cPaX8HwIcX12uLDx9ACBnK+w03bKZwp3/9JffsCU/p+umlKDsCvUj5stQHDyTZMp1usqPf08TOR
 VVgXvXBAnbLQRR/vF5Kj6+jaQUCEupg8Th+WNd6fNGoKUR2l5z0Tg0+s9CaN+CsNenzwwWi6VCq
 AknOb28akE+xy1yDEow==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633b0b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0lPQaNVJU3hVsN1xtcIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XS96r0fllg88-70iYSTdW0qSBCqqxYI3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX1olIheICMTrL
 r8CfVX3M40yxJmgr2VQF4V7KIvD6YYQr5lHQC5q2AS/Yt/iD6YelYcwyek/D1+F4PT5nOFBLx8s
 gED/X7u6Lda1o71SYU0kIVcRJ7zu04c=
X-Proofpoint-GUID: XS96r0fllg88-70iYSTdW0qSBCqqxYI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093

The GEN3 PON peripheral requires two register address spaces: "hlos"
for the primary PON block and "pbs" for the address needs to be
specified to facilitate software debouncing. Set minItems: 2 for reg
in the qcom,pmk8350-pon if/then constraint to enforce that both
address spaces are always present.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 3d07aa004eb6..2ac84cc9d907 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -113,10 +113,9 @@ allOf:
     then:
       properties:
         reg:
-          minItems: 1
+          minItems: 2
           maxItems: 2
         reg-names:
-          minItems: 1
           items:
             - const: hlos
             - const: pbs

-- 
2.34.1

