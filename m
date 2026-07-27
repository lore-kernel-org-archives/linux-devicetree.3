Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB593F076C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167273; cv=none; b=Eibvxo8e2f0akmtSAVu9cDO+KCl96npaw+w3gmwSscETNypxLoRqJM97l75cJeRJUlKqfd++r44NlEpchz2kggfqJJu5TfqdiTkQeFDICAHV2x09u2EomakvfoI93iOFnPKPfcUvQD/BpoketDjL5ccPNuSFunkWgEbtUnEMTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167273; c=relaxed/simple;
	bh=+u+VmD0vZTIx1Kr5BhGWHw1xeq6O5ai23jpVosZ81Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t91E2v5sV9KAn7BtJHCqdYFo4MFkKJOSLp48xP3FlAvA4Ym1bcpa2XDiAqKPg9Q/D9tvOvKve8WX58CXZYxTEYsrTLcJKfreDby/5PyQcRMqkpgEe640m8nPVEAp0QYFgY9cz7ETOc4Z7QcX62V9PFoeblGIs2OdBIaa6Ju222Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzCxw8I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxiM9e+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzCxw8I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxiM9e+5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlc234115122
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=; b=GzCxw8I2xBIciyvU
	CgBS15gRGDb53a+NyApeAF0VzrzbWPxOD106p3WKJ7SHOYecVSwH+2E5RHYtB8hR
	zMoIm+4dd6dDxJtcnC6QRJ3lQ3FFxG5OqRwwbAqUA9ZpMJyWPkuPphWuL4rXS8d7
	U4NFNzdYQJt1aD9PoafL4tyW3+90gsTG4TMDiCjZ4XRIHPEV1iMxLysBXknETv/n
	0d5yY0cCrkiRVZ+QJCu9qf78Rjcl5aTbkSTciXTXpPM42Q+r+Lno1uXwlFuvm4o1
	8gynB1oGkAUqJdEJiX3LWKbslkqBu87XXnL7AQcQOGf5f/BK48wjeg3BrKj5CA71
	h5RAmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsj1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso78790535ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167269; x=1785772069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=;
        b=gxiM9e+5J4zZJsyn1Q6qFYLgmKqbW3D2Csx1QRjBYLoaAvlGM5NDpOEp97lNnovWq4
         eVUu/Wkli6HTUfxwzeSk+IzMxPzuBFyULG8X91JtfeTjLlC9U9+1/PZk44NPLJmRJW5U
         46N9tDRE2hccWU8zQYCJ7bdWETSFqOqm0piOfCo+/zTxriVFp4QCjP+uhAOJGNZXh8Xf
         9Qiyz2lwn/8ihTc2gjursFnCDUAJBIGq5t8E+ng7eJkLlAl1R+o1Er9LR450AzCYwqP1
         mafAGFp8ZYyamIfCPMdqCucJfNxSGfj8+4IRjFGrkoGDZ4z3D+6SfVnXydf+eCy0TLY9
         DK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167269; x=1785772069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9IFRoN94PW3/DVUtfpMdzCmJQUOxfj9fFXBbki/jb4=;
        b=j2hWkoIiNl99SR8DGw+XqF4lhTFJYYUA7XOED1mtItUpdztua5Fr2d/sU1Q+kV1TUl
         VPDzix1qNUsZg38oeb4SYDxKDLubPKc9raGaN8JGfBaqJ0e39CCliyLWXcJG9ILhole/
         kR/Km3f8Yv/R2JqMnATHQRqwtmf6lg/IYkC7SQ3pGXaGa8bxaDtFG3fuOCQAsbehqhfg
         WyV3iIkJSITf2zApxacNLhsBns56ZVKaQcJMmRnEQ8U6B9LvJno8lOuvypKevC0ANtFa
         gohRgjJueiUjdTHJOIpt+WFYVltGKcwPOxuZdhIb8dYB735sB0wSY12AUzQTRo572Eto
         gX2w==
X-Forwarded-Encrypted: i=1; AHgh+RqZSosaSBwZGTqJaulGSbT1BSbbOygf/EiENjBwjWWzh4y192oY0vc8yVp1G/k3BljF7XGEasdULo1p@vger.kernel.org
X-Gm-Message-State: AOJu0YytAPVqz9mk/pwxs5CyxaqUUpiET4yOkjXrMvVxvdrEI0kfGjY/
	NA/HeGPRY7riPE8k8jj9maYrTFJ0RT+uA1fC/BzXuInPzjUKx0WRnsXPPoOpawBsyXaYRxY2lo3
	bnQBOHQJQtARXsUH3NS+og+lvNFfzoCx3rywYNbYMB9IhJ3jCwrsLOaaFHZ01ZUuhLUmoIY7a
X-Gm-Gg: AR+sD10RYLxkOns9BMgaTbo7IGtQUj2tj0gIBtfiSI1Zg66nNF8aL0deb6nALHvgtR9
	hfhMFwJBJcKrup9FjbsK/rT9Nf+H6cgzfrBF5dlP0pHfqFnk3wCPHYp96Emujfbrdrl+Vzf3IUX
	FS04lCH3MrlE17llbN+d1nad61YeFtv0R+/sxFoUD9qvN0Ej4zE4jLne/qgpvTFuiEnVWfu/nLp
	dAMMB6ve3F2L3e4ArZMUlL1MiNJngYuheE+xVr6A64oopblnzJCN8iLmID3jVntQ6/Z2D+Cqnm1
	/dtuj3OwO0ePITmFSJT6OZa9m3rRp+Jl6Cu+6RVAUf0lAY64zz9NpIwN7YCcabVsUZCuLsNYfmX
	FWG3BnRDBR3NlYRekiti54MQFeAQ5H0o5l91NzXZWkwV2NB8P78R+31dn2TkKm5quBa+eKUfybP
	apYYTvjbTsnYWRwNIk+Nb8hvZUPgF8nQt/zQc=
X-Received: by 2002:a17:90b:5405:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f294ea28dmr8392940a91.12.1785167268761;
        Mon, 27 Jul 2026 08:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5405:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-38f294ea28dmr8392918a91.12.1785167268356;
        Mon, 27 Jul 2026 08:47:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:35 +0530
Subject: [PATCH v11 1/3] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-wdt_reset_reason-v11-1-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXwjmWEdQQEx0y
 RjcToHmZrY98+jf5yCYgn+cRzl2lSP1fsmqQsedGBBQMMWtK4nbFIyMDx1JdcqcnZKr0+zS68de
 TJ1XgelVC9vEcwT6iwMjgpuL9LyArCQ=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a677da5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O_M3gYDVzo3QzbZqNbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9S91A-RysmgP0YqysTgDF-NBSUzBm0KO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX3q8RMXI3Fhjj
 ZhQZJi4JkC0+VXQpN4nhKSpFighPpVvNqHtx3zKL833U7lRwGyar96L09tFPZ9QhmuTVvvSV+VC
 jGqlv0TZTdCbS0scjceIMz72bqxI6a9Fn7xn73TTB2gSaIiZ8tFA1+IlwhJUHODik+tvBpMl0Wc
 y0TwBZGPrInvQKRp1Js9lh9dbqY9So/uhF6BjV5pFqTGmp1sQvlT1rePVvrFEbrULaJjJzAMtC/
 y6jY9SfjY6BWV+oIMN7qu2W78yBa/OoJ5+B2EvnKVJ3iHXGg/wI8K5EKjT+7noOJ3N0xHmyxH3W
 ki8LumZ+HSmVy+ZaFzEzGP9wRTrKzhNes5jdTRLYFnJOu69yVcQRT0cgUpZsLT3nL6lrK68ux9R
 yIOwh1ukmqH448fjmCrMCqTL1fSkl2a5okfKZ49mhYzIYLIsGH0KKl5wBpM9nXBmk7PzsVRIFwX
 65wCNzJBrkeraD2zISg==
X-Proofpoint-ORIG-GUID: 9S91A-RysmgP0YqysTgDF-NBSUzBm0KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index eaa8ef367ff4..95630871d957 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..0acb7593045c 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,7 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

