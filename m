Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53C337BB8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172550; cv=none; b=hGJnaaLCLu1+cxGSQvRQVyuNbfB1k5JTfoT08CwEI4LnbN9s6CfEOBePH8Yksn7KqVILP5W0teA5et1nmbSGwzF+WR08SrNF5u3voEiLadTqhp68TKvQH4qUVYtdMaAOQrnaDV4eEvytAk1No6dVmlf1TIKEtFiHqpyJEkZvi+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172550; c=relaxed/simple;
	bh=7X1ctswchEtMdjBWPQUOoR8aZBAdNL47AcQ/lFZW/wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzQJWlaHqTidSY99amFVdY9KmDv+AHdN7X6ADylUGQ8xYCenTgohjxOD0UUC+FFZLxEjmYtHtUOHzZ29QoG1DtqlUdorelTBmUKcXu7hg8o520+l2JDge/cuI8hm8wSNFj81+vztJ56PSI3BEtXyO37cD4Uu7qJcc1v+zh2ytYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7v+4LPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M998iO+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7v+4LPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M998iO+u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vPxs2437943
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F4mv3meOFLS
	/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=; b=U7v+4LPghfkytuO/dozaZwhpKDr
	OCp3KTpO/ysFFw70EyLqM4ZKHkYeLFk/E2guLus+XvZAfjE1CR4vtQssh1NqSuWM
	tLD8JbL2jHfZD/6+Uqa9gNk3Qp614WWjysUCXYYhxSFzKhBnxvx19GoG5HeRVm1F
	/OwxMLaDjPuNMqzlw5RHYzSfubzFULpMF56OnPPNR4BN5YRflK6qnU9rXQAtZlsU
	8RXagPn6C3hzWkCKr11EQ0w7NpDxyGG/mKuVYJgnTWw2MckmhAVzM+K61ng+l4QP
	sl74q3pP1gOeKb7ZHdz275KiWf9qRwpOAqG8cNOVR3PHeGSVJk7xQQMD71A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3gsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13536592ebeso15266123c88.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172548; x=1779777348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4mv3meOFLS/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=;
        b=M998iO+uzIorIl+6LjfliPnFQahI/8GDPAXhKYH8USLnTbqjjblNLvL86IWUSbPaEo
         DHaYLaNYDA0chjGZqHVcUh8hSm1TlZD5HMMYXbaCT5/E63pNcO43pnlGLwrgtWFwW3Gh
         /Eb/uVsaCG4vDNzuClMd6C9zC/9OvwbKyjvgBZpa57yqpRLvp3xGSQsT1nDF4mFkleBn
         svkfNKUFA3YtLIXWZ1rmdU4C6j3seFiOW28FNYh/9EN2GDeZXwmAcGuC8l0R2rctDvav
         FdOdK+1uNaBoGxEclI48eoEMbmrH6/X2EQW1pdjVwYs09kKO7GQLWjeJCKE6Q22QKlYK
         +ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172548; x=1779777348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4mv3meOFLS/DEkNjNpC0Q/y/CNB2aawbAufKu3fGA4=;
        b=sX58zvDsoQ5/gr5q1Z5sDhonZ7Wm5qVl7Kr6pM+ST9brG9d5TC2NGHYykZgcJZycEO
         cT36FxzFNqWQE04Xz3UKS/G51Qcb/FRe0xOsFNln7o2WaXtBd+cWVBqVxYEKo9PlJ10P
         2o822T7ACKiqw8JASep2Fbr5t0I7+I5RjQW3izBFeulnLdLquqgwWOpdTeq7+dNsgk4r
         BjrnYjMWElZ8sj35qWQLovq84h2GlT1jEqRZZYRMOtsHp+C7smPu6tb4jS2bwrMo5JnZ
         B82IIHiMJ8XVGJmgsoSp2tu18Xyk2qH7Ct30/A9llV7SYy1RhI/kSspb3XGC4eJyLwSh
         xjlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JqAvBxGlp0YO4WaDDXd2EQ/AQ6BXBXh7ArOnRg89pdvpGDImvgoJO86GuLUbQAZk9M9EOV+yuZoKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLugdHm9tp47aUrJvM0M7nBBwFCTL9iEdqeuy466seT38vR1A
	9DjBnhwwQlAAuWcKGPSkSeAvVzud4ayeox+y86utODbNf9CbjZqhzB5K6sj0/pCx2MjA4GjBwBA
	+Uf3jJ4s+A2XIRY3RqbJ/zQjp3bMuvD+Yr9/ws5RQx/6jRgIcHbwPLCUH7VxQSJTT
X-Gm-Gg: Acq92OFlWYiSclMP30MVrlHUhpgiszru8YzhJ1uYkUMZOEkYHqKRgzNqZEjcQWt9dZR
	nGHmJQH4iObaT+Uqt0B84aLGnQlMxlVWxarxH06mr/FbQXGaN75C+NmkbM/o5hnBt8UjLJwqQPR
	5Ocu4xh0CYIiOg0QcBYf/ftf7mWYgvRk/9syyYTLYOE0Jtvr9cKbU/Oz5JiamyTEoyxijZ10WTL
	cWGF2GZpsPgSXtgTcBboqkikVZYJxsP2eMmQLSMEOBl4Fzw3Qq9mt3EDVjPY1Rf64v/U7PtxVpw
	oFnogb2RGBWjDMaG/rZGwNGTQ4vXnwy9LCNQ7mIKlBVDV9KIUwxiaXn1UsDI4ikcIH26KtIGpWw
	15d+JRXT3pn8qfARfqirKTFNHpUpSbEWMiIsSoiIB0UrxIqmF5ZNNp9HXQs9K4E8Q2gaqLv0GHu
	vYCPjTVw==
X-Received: by 2002:a05:7022:4187:b0:134:7497:2148 with SMTP id a92af1059eb24-1350552c4fbmr9451577c88.28.1779172548151;
        Mon, 18 May 2026 23:35:48 -0700 (PDT)
X-Received: by 2002:a05:7022:4187:b0:134:7497:2148 with SMTP id a92af1059eb24-1350552c4fbmr9451559c88.28.1779172547547;
        Mon, 18 May 2026 23:35:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 4/8] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 19 May 2026 14:35:01 +0800
Message-ID: <20260519063505.883379-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c04c4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: LpyFGCABd67I0DaFbAVYvztl8Uj6CstZ
X-Proofpoint-GUID: LpyFGCABd67I0DaFbAVYvztl8Uj6CstZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX7CdgHFdWxiI6
 DPKhzcEhzvAJ61XFiv9zHZrcbgdeLODgyaXLdPF/8Ht63nn8vmn6IxIg8buX9cQc3ATibQ67EAq
 5HLhIuaY9soY1AMRzcZ4fSTZOC+aOmTGbfbR63LI8EW9zrcNvapVL7CxKKtL6zUjqxZHwbgWtwv
 hCBYZgBW7UJ0/rq4hxhCpjAoE9ZPNBvkMN1ZnQBuoc11TCUbbPsfklId85Ve2+pR93xJb27r1HI
 CGmlA3EAsRO3yrk84BSbYSiha4Adpk79zBBf78Em1KJvPunhs3tPCFNTA9mMZ6yGpErprIySjh0
 o/jnKsf+VfiVDt3q+zjm105eZenwXOF2bIbmNAoIfW3bRZ391gU3SZ1VZyrGwqfsJiefNOBx0dH
 ONjOUfP1XGn+w8rmg/FcbsPop6ceLyU2DACqBGYoQPra6FYIK7h0Jocjlb0alpI8Rd8iVn4jMl9
 asDs7q1nzjfWZyTYY1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190062

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0

