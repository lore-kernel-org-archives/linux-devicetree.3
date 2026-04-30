Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769773C9EE4
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542335; cv=none; b=QGnK5EjUiYqmK1MAh74Qd57lXaHwG+hloA9spCyF4sjsSzwQj+Fc97dAcD3Bb255BWX8NpC8cSBwODNoVyIdl6f/v8Owhve+bAvg10QaxBDehr70xRlszffuVOY0hovqcHllnCELPJaVzLHUc3m2tYhQXX/UsJSMrfDpe64lXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542335; c=relaxed/simple;
	bh=MSsuyX7kuGk37NXM51O1GO4ffCLlI00kBU5NRA/D9vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ufs+UZmX4u28+12H3g5EkLegEqXTbFAFfxWLNBq0ZhhnVQCldtzYSN4AUdWb2bCfyqFOMD4sU3BD51KrrmDCHVxYvAHJ5t3MAaMAdM+2h9fVcaiKm+1R/exV3m/YR6qVoCDF22Ct8MrmzwOM+oz3PhTlY/b37ZmRsJc88MlmOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTxq+ay8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5pmcIjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTxq+ay8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5pmcIjg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3HC0D3729488
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=; b=mTxq+ay8uRBlPnPZ
	QteNsP5S6e5XuftAqHU7FpsGLYMxEDGH+KzPzfxyjVLgcjx/xD0fsxTu5r975mc3
	Il4AX+640fvAkkb+pm2fr7Di+n8ClgpPe5nTODV4RRClVZKBnBIJuoBr7xIKNnFI
	cYNlnxq/QLy36EEKX8bUf55UaB0IO7Se/FdezSSjd7PVN9b/bGUc+7kr2xALaFhM
	NhEZmsVUE7Btv7wQ03R7D0cOcV0aNkK2JbdItB9DRf95DYd7ThFoPmZGAFkOlxT3
	8KO+34FVaZzssuCkqbOjmEcl7+SiuK3Siqdn2IdwX9M3B/WC0NFdJs5LMJOooCtn
	/xP69Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w99pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so1478207b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542333; x=1778147133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=h5pmcIjge55y2ZLupUp9UI4bCsYUHYaE/PGE/rn97tNj71Hmgk81yj8b7oYU6FSx/9
         Uh0Q+cB6UJkkQm8OueGcf6Kkjv0ScTAnJo78YkQ2b7zwDvd5WBQBXXHmheD4NueLBYY5
         YCck1xYshPrCoPVljfJhhYQ8ttzeSPvMX5C7mosudAZ/gfcoUOpz3yfbcu2cGuH0ORsp
         QhY8yyEc6BF0jQW1auWt+oLTqEcQKShY7FaFM0hlEonVOGFT4ZZQVyhVjmsEiofsXZcA
         nMDzTiReVqFfS+DKyPhBdQx+138iZOgj+d7MNzBEb7ckn0cLBnEzkvXQXfrhVvb7jk7G
         nxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542333; x=1778147133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=GdM1TnxGdW9om8d6lE5gYEmk1Fv/eJU7qvEVIrZit8FBEQ/5F1DOfeyKwbXT5pO52A
         0aPt39lpn18KFQD6aehufsNmvweRcRpYgckO2bhI9hGyrTw+R0euo+EPPJBUebJ5cJoB
         poKIHBIMEX19a8w8VtA7qi4ZvSsAwVxEeYNE3JoXxGKUJ0FiDlCffeEhj1eZSTU4TspQ
         Ksx+QJyKZw6UW5kScv42spLoVlynMTZS9//ClvdIwXHrvt0cyJeS+2Na+7LlEheSTHUQ
         bj0Y0y4ZwFfwUzWnPJOLQhlJ2kE6ANxjd2pdhAO1baNlQ4FVCVqBE7PF/I6HGp6L36DA
         iaBg==
X-Forwarded-Encrypted: i=1; AFNElJ/ozRPKGfMeUE0NQibOYCzoP8Qz5xDRym2PVFNFsAaXzQKXrBJH4QJkww4A10YAyGSUyo9qj0vPi9VA@vger.kernel.org
X-Gm-Message-State: AOJu0YymoXrvP8Kqf2K2pxf6mqZ4TALJu2nK+2/fQ0Pdg+3R5yJrV7ma
	I9MjiULwJxJE7m2LjeSI7KWmw8cO5sXAe8SxvRbBZhaoOTOBTYOl1dQFDOCziWHsn1s648voXPc
	e00luXrYTGBrdpRd7GuGVw9oqZg/pTM+ikeuCbhsXU4nDpmo5wBwhElDJh2khHO0S
X-Gm-Gg: AeBDievwBOPsaOKmSFKTFyMhATQUeKy4/IeUTpRkMVGcF1JfOmzXeExtJbhlTmL3pJW
	G5OxpjvzNVzhTXPui7HsqDwTiOV/zx9g0KZ40iw4h9qd4TsYoROPlGO5H3xZBtY3S3u9wcr6Ao9
	AyymZuF0JhnJpu65V9aSH+BBrg4r8hFmFgUS5A/EqrOXtPPaW5iMLXKcVEz1xYQ3k6llqdFa/v3
	/cvj9+NhdX0NEexDCkdIGakE3oK0TVesdpyBfwJb1VcD++vpF88PEmQZ5SvSNYKAnGzbX17yEyw
	ov+2xDNdqnT2RrYrRSyuJZavNUY66kUW7PB5lxm7QzasvPPkQCg3aj992Fg/FBSLfFSXTs34CrX
	60pTt6ekeEdHwKAm0bA2Qo1v3E3kMPKZEYgZTg81t1KBZP0W/o4vTcrsfSz1x0g==
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805261b3a.27.1777542332652;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805243b3a.27.1777542332202;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:31 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:58 +0530
Subject: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1198;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=a/F71uL8BlYVHt5572G7k860jwl4RJiexWiY4A6ZqIc=;
 b=orZngModJ0uSGvNPHFHBZGxcX7qljzqhiGxI5xuHxsPuL0HDEW4CMBNWPSQCW8oDGHuynra4U
 F0XqjlMIetqAYOVHpTIqCuDMUhkFAaDOsXOU+GNfnRVySCFNOFHVxsI
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: lF0mKfeg1WlhZse64IT1Uk3rAiDp1ZW_
X-Proofpoint-ORIG-GUID: lF0mKfeg1WlhZse64IT1Uk3rAiDp1ZW_
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f324bd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_6-gM951qmUW0LqwlVEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfX2ZCK9yavCflx
 Jwa3Nh1nLZbSaTmsjVM0TmX6jjJFx4aZtqkjbPXYfxuodRH6kLxEl5JlwXUS0Nr54gHfO489R/k
 KKBfQo9y2ZNmwgOz38Be0emJtnL5Igdvc+rYPfAbQzoEhPX5ZdyqBPGC6mQ8lvgCeCu+doEYMb2
 +CBfPXLj5Bv1x/Bdjrkzr58MxWGSZH9CWhQA+lXbC0Q+Q+Hndoz0m2KLkFmoktZLjr9LJm0k9PA
 vU+uN/ED+KSJ85aGoyDqO3gNffLRwCY/whSQ75g4fpPIuZeB90xRcd7rvCrIph8d6sMN/kc5DsQ
 Viug2g1GDEMgGqZk2VPj3uOVfVeSVjamT+em5Ge+fEUUIErvEzQbyWotx3GAqYZrnmBycDv0aR0
 GHlNLOwbQLlP/lG/cEZOIzeQpAf34eS7AV9bX7e9UOT3vLHFkcsVon/j5UKEJNw8/8hAgUPBl7h
 fY62ytByWmAeNboByZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..f22729a493f2dbc8ec2d189db84f5435a80fede2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -65,6 +65,7 @@ properties:
           - qcom,msm8996-apcs-hmss-global
           - qcom,qcm2290-apcs-hmss-global
           - qcom,sdm845-apss-shared
+          - qcom,shikra-apss-shared
 
   reg:
     maxItems: 1
@@ -238,6 +239,7 @@ allOf:
               - qcom,msm8996-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
               - qcom,sdm845-apss-shared
+              - qcom,shikra-apss-shared
     then:
       properties:
         clocks: false

-- 
2.34.1

