Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F23A2579
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706114; cv=none; b=E+0CrnSbSGLYJwYp/J8PV4d1s40bbd6HOkRlm6Wef4iuynphsVdjaQPYBFLihwzgBFYlBZfg+EQIe3PCGyIOgHlGDy4HP3pFC4FwL1Ujj1PlZ9cFN4vMaJ+2t2Z5w0OKoJ5I6t4a7+G6Ua/uFffRhzVci8CbDqSszHeVBAwEBEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706114; c=relaxed/simple;
	bh=GCi6mw0My36ujT1oK/LTdUMwkJzMpNgE74Gdotixj7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VcBSTSZQSo8yikLfKix6DUxJF+IL4PmuxStBtREX7OsDv5y2oVkG+o31B3Y+X7SS0NI/9oYjphoeWeci+HvL12g3CCA6Umz0Xvs9kBUXS6EuhBUGzXHD8h9B7bro0Sm+MtRIC4ovcsoYocC1Ky9080PDcXQXY4uiWs7uZmrliRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHE8kSwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaqdQQ9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHE8kSwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaqdQQ9u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFJjq3084674
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4UYnNnSbMsa
	SCnlByRKL88+TiKw8FjoGU1HQCV13xhI=; b=gHE8kSwio9FRMWTHIDETRFEHZoA
	633JXXyXt2Nt5Xn/k/+YFmlJ3+hBisjW59+Yq6jwBqHfjn/y/mg9GP4gp3WypREd
	rk9seZfixhpvvUHAxBXJDvi7k2x+qUI4C+siBAJ5gsO+NLOND/ZdIH8fZblCYIAq
	V5qrG+VQkejQid+TbSWNuEuiF1mAuzPSwr027TuFajn7qxiY3oTtviCAaoIez65I
	N5QFEtAipjdrNrXCPX4WLAsFZCQ/ZlxkDZz4OW3JzF/OOo6L8PVts0q5GrIEkZeO
	3LgSKXmVHGk1pnGKNrkNaq0RBC3tYKUsAUuxFohXojn9qfjnUEKTjcZm3+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hv30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:28:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b258636d16so32069025ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706111; x=1777310911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UYnNnSbMsaSCnlByRKL88+TiKw8FjoGU1HQCV13xhI=;
        b=CaqdQQ9uPu6dS7o4t0RxdP4XcVNRa3m63y8jyt/3HRZ1dPTRxmOnFoIn0qrrkWD8OO
         YiZyxtlKEiZtBWVhP04DQNQsMT5ReBzP0uoWc3+wWWCexGfJN47k/ByuajbqeO73e0AA
         MSAhVxVxCp2DgPDH6610GTvncfY54l6rI7bOPfCzLO/k4bh0lR1OnBDvITmUE/Lkc+aW
         +TIw5nWC2t4vRO6Mjlz0ziUSbzL2AAAx7M53kn5nt/S4RMx4SNBVhBHsiNBKoCXMsYca
         iEo2A62xlJ4sICQzM9rtsr7u1LOPHNAlio5k6oYVAQuWi1QMRvXsdsTz1W40lo0iIyEG
         NlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706111; x=1777310911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4UYnNnSbMsaSCnlByRKL88+TiKw8FjoGU1HQCV13xhI=;
        b=lqwh9KUpHyB2Jr9SNABdyUpoGjFNqmC42keZeIhCPWdCS9HsqxmrHmk9P4AZ7fVA4M
         XNWXjaUI6VkkMnyg0RmNEIMTbXYi5qycG2jxHUeztSuQguCVZij4ZThwcxiuYvrCBAQu
         8TRtAi9xvikGjqd6kee1r3kZ5LzJNcAnKQxgX3RTKX459b3WO/Q0SkYUfDr4f5bUbPMz
         c6Auy50dylE874Jgd8CSErNuUAYz7LbPXvOMe75J2Y6Tw0xvGPm0S3UknKni3wHWkJsn
         LkXQtXctnycAyzabFkVQiTo2iF3BzwFNJU3MylLGnZxJatLRwoO40pU1rgt+HW8LvNu3
         KiCw==
X-Forwarded-Encrypted: i=1; AFNElJ+0Y+VdG6LNThS/osY0HHQZ9JUcDVncvPEroVX132DVghFRxD86VXX2aHlOZ33aV8bgCr0HimwFRcQn@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwdpaPxpwCQ7NUmvzt2J0H91sLGwKLPbwsA6I3WFJI7qU1Ggj
	JhOUtI9vgjNu4kFTKGWMWzYVKzhQVKDvy5oa3oUMPeNBnLKFeo4DCMNLKM7byp4HEqVHwHDZGYc
	srXRr8et9YjfQta1eEx5XdtGNYg5Cz0+4dLuSY1OjExmcBvqWAg0H0wLJQs31Vlsu
X-Gm-Gg: AeBDietcKuYNSxG25eqevrMvtcqB2nnW6Ju9RUdRGmcUMSK5FznTxQYQjDNuva6iI2Q
	6mj5mhVOlgKFIxy4IcrHoTS3atR1JxhyEEimbDUr9vWMuG1NbslirkjrOjstSJV6ZDe64LS9DPq
	fGS3NINEuwpOqZz6sUeVg120vPen9MVGm64jnFdYkVclsGVqiCk41YvNudGK8p44dQpuBVAi8gS
	0e2dAdjElSIPJwq5zt4MNq2HXzh6WwTz1+QBJg46NRiy4UyGbCLMUnYyjnK17cepU85ze8rOMvv
	v4jzkc+DtJK/JhsQJz0FxcCFqg4dzhIWqSMft60GRh6Ko1rLQw7Un9y0PDgGutZ1GhOf6R/Tgb8
	A/wuja9RTmGCzqvSExFJwiLM/bWtQzJ5Bzq5uk7g7n6avMe/NJBCy4vqlTC+LbYo=
X-Received: by 2002:a17:903:1aed:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b5f9ec9cc0mr138879595ad.5.1776706110648;
        Mon, 20 Apr 2026 10:28:30 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b5f9ec9cc0mr138879245ad.5.1776706109964;
        Mon, 20 Apr 2026 10:28:29 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm113132575ad.24.2026.04.20.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:28:29 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 13/13] arm64: defconfig: Enable Qualcomm CESTA Resource Manager
Date: Mon, 20 Apr 2026 22:58:03 +0530
Message-Id: <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfX3nVqCpQEFzb/
 G2h380zqOhkovKjly2M+jS3dmmx8uRAsaX7QoKlsZG03HKJpCwI3xB9Qlz4hAnSP3o5PcNMgpQv
 28HFlqJhhssaZ+ZX+eK8IUmeSlsltEsbECVqaHKq0FqEoW3U6C4gVn9hf46pAEN6Mx95r88E/kz
 C0zF6cNJ9XsO2VEuG+Y+SXRUHZ9jGTZX2uLT5Dnt2QN/XZt4G59UF7m0jsnLPgCnWudOqVyiGro
 qE6mK7yX7NwwGTpt9Zk/KSf9SxISFcTIw6ctM++sCflj86MSfP56/1Bv/I39hKQa8LSd2KaZL9r
 6MXyXsS772tNg6pv5hu9t0G6v1dFFwPXs5TVccFdXnR8Yo85oDxLIzvMsucKP2i8hx4gm6J0LEe
 f/wCPNh52uCub3sQyAud2qvRJJZKWUhI+Zz2SIhpxXmCJregbC7Cco8ZDR0BE0UU0gT46SgP9XC
 5KPFpDMMD7PzQC7XBFg==
X-Proofpoint-GUID: VeK1rTnzSNVq9BHA3TBCW_vQEaMHuKIV
X-Proofpoint-ORIG-GUID: VeK1rTnzSNVq9BHA3TBCW_vQEaMHuKIV
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e6623f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SpUqWb2v3QxbaYDcPuoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

CESTA Resource manager/CRM is used for local and/or global
resource voting on Qualcomm SoCs. Enable as built-in.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..94d226693004 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1658,6 +1658,7 @@ CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
+CONFIG_QCOM_CRM=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_LLCC=m
 CONFIG_QCOM_OCMEM=m
-- 
2.34.1

