Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028F4078F3
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568581; cv=none; b=WaLgD4PoJcwrh3QPIx9OJmpq8U3uoeq45xlqR9CNBNgk1wITRthgQtamyFNQ1dqFrW0EwAz8Qse05NIk8W3ri/UkW565YUFQNfWySs7j3R8blI1QXQxLw5Zhrdj2qTj+0ONGBR+oTMscMZuypx77D7RgQqV0t8EADahjD8v1fMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568581; c=relaxed/simple;
	bh=rNneJT7obxjP1X1Bry3YcWYR3YdUEBRbf48fYw9g3dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRoY9zKBEbOwAvWZwkOM/pRmxrTKvSJE2JAmz8wH60mzaR6J2104f7waeZpNuozmRAgipgdmuRxNOkF/OB586K4EN7vXx9E20ZmDrBISvyOoKaU6deQBxq7W2Q7D/8qUJOkYdfvk3s8HoontBccxr5EDVJvUrAIJ+mztJ3ZuD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdx2D6s0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Inc8Oscy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdx2D6s0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Inc8Oscy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O997qT2081914
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=; b=gdx2D6s0AgHa5gpJ
	FHt2e9cLpJa1eT8hIKmdS+MDHfoMZIjr8CLDRpGio+Pd3Ll8PlAW0OyEoUHRiei+
	JCZ8/lockj8DVQLZJax+LF6fd8nX2FJ21LNKC6d4cK7IXTL+kAGIybN22q2ADahH
	GdpPj3X2NJAjJ48YogqCwHd5yC/yxqpykq176471Th71dvlAwjAsAi+Cgap5uIdt
	VrWODHROI+espcLui9/DtlLunliiiVr9yvHRTazucN0NV8RugL/f4hs9Zsa6sRI6
	wSQ03FoeaQenz/YW7GuEI0jUj8d3dFHrX3kGbqwYciQc3Yg+/T7JMJc8NGK6Lyvq
	qtijKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsh7jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso4454889a91.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568576; x=1788173376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=;
        b=Inc8OscyZgqBuTxhZXbM3wIZ7B9hq+lTs1nDvN3srXlH8IA8zmY1HY/QINZsfIVi0x
         2wtzyaurfyve1bIlW/AfpA/pU5V0osNl+iGXTLQ9grbvXfAX4IxnXfsp5hrghCNjaW3t
         LfQuvsD5qrA2ie5kWSwMIjLSVzaUt743rsX+KvCqqqM+2gXqBpb3JqKcWKw2/5ziJcbt
         OvJ9CET8nQfgIQC0KqvqcheNGAPg+ImYJpccNet2ETZaUUfZH9iM6OrzB+3hpYOiGlea
         GIf2lIlM1iI2OJxbKAS4DKjZtHPNkeVYhi80TYRat5mpFuAX6ZAV9G1lzC3SemLogk4m
         XQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568576; x=1788173376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=;
        b=dP5RaBPUFDwGKsUQfVSybg++I+Q4ZMzDKypitosHxIuY9qIXtVIV96NI3gdpSSZG9/
         f82DK7h+kDeZRlPWrWuXRgYIJZjxDSjxdkERjpNc7rvIyJjLYIPud7wNJ1N10vhIJTV8
         rKoR32AqJxDVIxfJkXqvbClpthUtPvb6jHu2/NO96fJ4CVHDDN9/VnkVKXWn3E2TFTwO
         vrOFU4Z73L3CgZDRjHOFffo4P8JImUkDEGwWBsE0LEuYe7wugM9Dm4DINw0eS2OZEo2M
         IfGQ4eTmZu7rWmc+khfZ/0u/GMHmiCw4O8PO2TNH/1xAtEV9C8wueiIrFWf8SfJF+ICJ
         ZFPA==
X-Forwarded-Encrypted: i=1; AHgh+RrxwDbMUO3yWNPKa9lfqcZume6y9Cr0nafk2a1qVynB+w63o5eWjZQcj0VuOFRTDQ2yHoPa0AZTC2hn@vger.kernel.org
X-Gm-Message-State: AFuF++nWgJHsxYF7nvQTTIJIe8LfxDv0Vd64ZhX1spnJMlwxhuvEAOCA
	plHnKcZyAS3BSQCCRvLHa933j2+9dOkoNnPub4cd9g2JgeJoxNrLZsfv0ewKEXa+6j3OdE2ajzh
	+umcQ4GvvVb3slSXzXe3jlhL+scCo7AHSyuiucVUx5LJh/QQYmoWm/X1crp+dtUK4
X-Gm-Gg: AR+sD13LF90vpqzQENSyeEMADva4jimicapMOzv6qj72ZTaUGQrcvrI3NZhsZbampl2
	ZqlZ3ACnv+6FBjzE57nxnCQUH9avl2W5CakreGNSTNkclxye3cVzgCUyBkN/2/AJLjwk52CIv9w
	ibqRYGdrnUcKdf2AdP8nQGdzfPrT4M3n8MY+1NdFSKhifnOa7vc52c2EJb1HhCcrGHT8DR18So1
	CDsERpXzc64BsRTw0LWoWEtiU3OJCcwkCypHvfHl2OfLXd5OLtzfFUv1OMlL+WmOyzW0WoWhgLA
	Exl6LXDNUeRZSHgHE4+K9riq8CooieURY4+axFz7SvMABHN9tlc0/qo2yAQEn6fAtX3ymJzGPwa
	8LjrcyiV+yftZAEQdMlADkNRbahXs2LivUQ==
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-395c35f0a79mr46724252a91.14.1787568576105;
        Mon, 24 Aug 2026 03:49:36 -0700 (PDT)
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-395c35f0a79mr46724212a91.14.1787568575679;
        Mon, 24 Aug 2026 03:49:35 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:35 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:07 +0530
Subject: [PATCH v3 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dup-sessions-v3-3-4b019def4e0b@oss.qualcomm.com>
References: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
In-Reply-To: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=1158;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=rNneJT7obxjP1X1Bry3YcWYR3YdUEBRbf48fYw9g3dc=;
 b=UajvJt99Ve5CBv8s1vmGRXSwD6/pIsPjTMZPuuM5ulxQajMLTGSypjoe2PoSZ7onOB+az7WrS
 x86SR5EPYqECTHubX3g4BkIT9Df/XGR35WVFvO9m33LzsxoEblQ2/2F
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: XWdRs3TrQGEbcD2oO_WqVWz3SfyF4vWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX2bpydApTEscf
 /gwRlGpfvFos+bGPtiPR+x6P13VeAy0VTXc5xRraEm4ip7b6qQH3RJ5P75nZgaOp4BAmz34hplY
 yvFcHlftvrHtRTDApFwxP1SRaTFB/zroMiRD/faSFAQbBP1Sf+ho3dJaBe+aXzOux3xlaDc7gcD
 z3BaKCOO12qLShnztT5zuy/CZiKjI1kRlZwHGrCHNSBe/mt0uGhHrq3E3QciRrqLawCGQiIL87H
 ah2qpG39tTWYYdlLvXKBNedf212XRGPWRX1/a8b876FR786/evpF4Wsf7ko8xCF1lUehkmIF3of
 w+Y0EnEsZL/sbRlwPCg/CdytgWZuxEqo/LkG0ZcrEOGnfYyLEH7IP05CGAvqvW2ZvypljX7a3lx
 QsmPUDQZeiflMvflAOpGUNUifvS7hgsqbKO5wE7hzyL08TqHApfrzIw9j1ohPRWBG8m6rkqHiEd
 DznoJxc3+q7ioUWBQEQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c21c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: XWdRs3TrQGEbcD2oO_WqVWz3SfyF4vWa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX3IOoBG9N7Zlx
 QzA1i47JTreDyg3DnWAb7YXGNpGOtnI1tl7jlGHhATyUxkg05C6g4jJszkHnGlgX/AnwW0/t43b
 4JLnuf2EpPTjjXk6Fpo36upQKXmvqOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..683989c468cf 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -96,8 +96,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

