Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A8348C7C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798565; cv=none; b=rH/UC/CG5YRIF6M7fUoGOdEAIwTZl5d79ynC0Y4Er+zDSg6ENngqJJI/8U5WVnyXDS/PBxxIyK0jXk37VyA/oeiOmV0Wlif1Zsrp+fBBLsan6P1GDsCH142VIJMq6v7bYr98d3iNxjcB8HIXT6AsDpMj3JE0O4Ds88MaKJi8Y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798565; c=relaxed/simple;
	bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2ObYhUPdg6XLfM1ldzPcc9l4Bg3r2crrPJN8D7w7fToVUU8HtP/x53EKeJEx4z7LguudpebSOz1MvhqdwCozij0YT/Pz4arDpEURFdwRI5/UldWvKWGTujVBSBt0Dgz/A/QIZ79HEroG8reFaM1dbJZ3BQ5LtSz1slatYs+d2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtayOct7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihi4XcLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtayOct7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihi4XcLz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KF6D1779391
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WIS
	F23hsLQk=; b=LtayOct7YJMGuwRhZVCkinpNhCvzxLipEalzIqtg5dvIqE/Bs0c
	+wpmGmrQSnPrPn8WRZo7RFgkRKpwXE/TXJBW9ZBNukv/cjOozfRfxZImu652nK4x
	sAAjP4Tm00wq6pfcegpsOFDLGI+rFUCnzK2yt2Qy1+0Z80WwVbznjqOTKgoc8ZJL
	oV/XjX5X8DSoG03nx22A/Ud2+MJH86utI9kfndKG/HDe/AbGTRJazlL1Tp1+MeFY
	L0pNTxerxHkIoJ5hoCOytqr4yqY/BRkSnJiqXgm4utB8eEB3SHc0YnfvBHUf7dW1
	AVE/eVgHSVqeWpY2v+e1Ma6Hzvje6GIpoQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0huw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea1b6c89so344582985a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798561; x=1792403361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=ihi4XcLzWoC6M+SgVidbFx7QMsn+J1gIcA8efJsx9zgSBqRX35ZU49b+6zrfE9G+Yk
         HTqpEAd+r0cuMT9ZrlwG7FNEwcM7ILRFz3OGzlI742YlulculdPcjfN+S6sL03fFotc5
         vcT9nDxhCsDMZHqf1LmCDtFpNo1PzYrOW7roOGW9vr5p/6nOkipBbGjiTjS331ZQkKUL
         yzF3qRYreCvQcM58nM88P90PFAHsuYFa6llhmVQ4NpvVASpwUfoggRj32Uev9yENhVGQ
         iDttyzxRkGRbGgs5SxS/XHnjf1T3XrX0uHUmiLF42IZDc5jnZxMaTrNtknIEqS1nKXDw
         fKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798561; x=1792403361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=sS+EDpEB5d2yaVdwBFpMg6eqjjUU57GbZ61OKc0Cj8HuCUXGx4vINl7p51ni1/dplQ
         752+obyDLStj5ycbUzxHmz8GJxiZgc5cOFLZt1vJcMvenC6chOzMB8yakk8mVdvEG5/p
         tt9uOJmAB3De4cSppu6bNFSJzsRRfFRT13Qjt7+ylPNtoNoQ0SzpSRnJayDEcCcO6NSi
         KANC49BSZtiegGsbirzlQ6jLCxWhL2XbwOG2dzdS6HTossHEZoOuTklNYd2QCB99hdeu
         BAS24Iceceg+dvc7NF8SrzYXTWBCZE6uEPHODRXzbYU49NF8Grqtc5HMScvrRBeg9Aud
         Wb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBze5rAyCjFK5x8xJYTvYd0w7KwIkYBHkdYsJqExhSSGOhfufPPWPT/+8Gbs4jOsJ63QcZzuTR9ZlyUL@vger.kernel.org
X-Gm-Message-State: AFq9FYJeE4DKKUr2+mQ+5a+eYOYt39IbHEiadX3TuYZWQfs0WvprGDJO
	PI5ErzZ+YJUGortfwwZXihvRt5ETkBv3JLvZ362H2GWfvnRCPi4Z0LeMN7nOKrvZdsgJoMuFkgb
	GvwFkj9PR7msE7XmZhe5S3K0hDl7oR9KVqcfIzBnjLuVHVKP689emLQKOqB9cWe9m
X-Gm-Gg: AYBFou1vEfDIOXrEaCH9vwUKuBilnIRa1IDrDR3sAVaS5NFHBaIaQHdgSsxzF1b2fA7
	lW6Wc15ajaQNY0BTnHbfXGNc4XpFoIhGvO4mLFGuXj8Q6nn+mdaIdm8H8T6BhLoCu9jOHV+ywEa
	8hCQpDyKzmZ7o+I2JMj4PwOx8n6E6VT7rVkpv99QqpbSSvSNujBE7fMsK/hHjeDcCdh8StN8UVE
	TTJGzjVsRluicgrU/kRAGt1NH3cZvmhdHyfC7+Lu+JlujHurc+hrbcWV2EnSPkXKeGarJmT5PPS
	qIf2s6t302Uf8BltUFKSOI74pl59/9t2Z42hOx3l8uY97gVdnD6z5tSjzNbUq+rl4dvehJVZtPg
	0byeQ5bLPcr+ClG0=
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539956585a.9.1791798561084;
        Mon, 12 Oct 2026 02:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539954085a.9.1791798560508;
        Mon, 12 Oct 2026 02:49:20 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm243381415e9.5.2026.10.12.02.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: qcom: Fixup sorting of Eliza SoM entries
Date: Mon, 12 Oct 2026 11:48:44 +0200
Message-ID: <20261012094843.66537-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqzKz7jMMTDHh4wHsjQVbqjEGmiKi/z3hR1c8ba
 RjfY0DK5LuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasys+wAKCRDBN2bmhouD
 18woEACNQ1EHH0AHlHsxMw4Fm5fWzxJ6Z2IaD2UDW9TzcjZW9KGTfbitPMZjTVrk097fNbKTcwQ
 bjnmIqK03BfqRp1P35Tw8qE9kNA2juQbOy8wlvrah1bEoxUUGaT+8ayPDAU1rkouwgLKzrAb23W
 Xt+I/jSc0dHctoV0Lapyf4yxcIQ/NYs/4bRybUgsNAPSFpEOgajC8Bs7lgdTZqeKargYczalI39
 sZ0DLL5qKa5/v1P/v9yb15w7fWGhr2hytVdmEx4RooyE4vq5DWwbKc8Ofto7lRLsiaFKRZHi4zK
 Eg5m62B3INVVFnCP7G9zn8HXw6kC69VFWEdCk0mqHffUH+iSFollLteuuZH8zMaA9VuYPwW5Qh4
 L1zOe79tPnvYMcTkvcuJXywvd6jAqu36XSPPw4wj92OTvqcIZjrvQEknmh6s2gEMetz5GuXCK6i
 F234R6gbQqgI2ViEOO9VjNYJ1LlvTE861ykoWZ1bUwMQpK5WRvgsuokYpvKwdKyizr75SP08NCn
 Zziabm7ru/BdtxYZ2r/E00YEzlP+776lMTmsvdTSf44fcJQG4rCKtrvmG6UTrbvTIbPXbu3BZbq
 E3jbt+II1U0Wm4pdQm22exKBDyXGM5W+h4MLAuuZhExi0Vqv5NVqZvckHv+a4iGYCgSfXrHG2Is lJaSIodwOUeAv6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accad22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EASxALMklSPAlHyK5eoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX8K6nyOLP9Ga2
 449lbmXEnU+j77w0V1J6ITll6xepQxEQct8/AsHo4HVfSJOmLo0cNi2xurD6MRS6t7YgCgoTveS
 XClY8y/87u6Zhcm/aqnHqGPL8yIAqdA=
X-Proofpoint-GUID: M3zi2PAkF7nA54AdEeUAq5zGgNORMNNX
X-Proofpoint-ORIG-GUID: M3zi2PAkF7nA54AdEeUAq5zGgNORMNNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX99cR5qqYxStM
 QNyfr1a/Tq0B5ML/U/7E3cjNzx5QObvP7GFydtLPERQAgogjvRIyI50xNQjpjc8mUHAjniTCGjU
 W8EFJ/b7VGcPoANLRTSvFCF6TRjqxcNQiHlnPp3a07Ycw1v682/I+Lw+7lygZD8bZ4DiF0GQ0P/
 JCpSlBqtUPiMjx751b2zW4BXd4HR+IeE6Uy2XfePgUz53xKvscHONZ5eDja3YliixHmKJW3lKCY
 sD54gpnK45DODcVTqV5vhemWG544K/O4YrtwQnwjAAABZWLvw6GJM5Ed3Wkzn0y07UEtzgGMUOa
 N2q0pFLTZCJ6hIoo7alB7YVAL0TwQliNf6TRXPMje3311l5kMilZDNUYJhFlvqMCIy4oGajbyuZ
 5LlMJ0Umt99TNPrcF/IvGt+hHnZztDpNjVEmuK348sl+rQwE7IpX9qIFJZcxETbr6le/qMeJgth
 blCogVy7R2aWQ3YPwvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Commit be9222a4f92c ("dt-bindings: arm: qcom: Document Eliza CQS SoM and
its EVK board") when applying patch from the list, placed the entries
not in alphabetically sorted position of fallback entry (the list had
correct placement).  Fix sorting, so the code will be more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f28645b0088e..1fc8c03e4401 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -55,11 +55,6 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
-      - items:
-          - const: qcom,eliza-cqs-evk
-          - const: qcom,eliza-cqs-som
-          - const: qcom,eliza
-
       - items:
           - enum:
               - sony,karin_windy
@@ -79,6 +74,11 @@ properties:
           - const: qcom,apq8096sg
           - const: qcom,apq8096
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp
-- 
2.53.0

