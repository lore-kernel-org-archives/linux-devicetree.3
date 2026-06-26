Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFA379990
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472396; cv=none; b=noLXcYcRMACdTNrwmGyv9hyl8T+RXk0zJDwRP/ULw3jmWHj3QjTgf3PxWKGx8hrVk9zvUvsI9HsC4RT0HmCBBRnyQS8T/vLtA+jrvAJO60QmNYgl+2qJNgGyIHTMLXxjBlm5I8E5qPKmxrvZiysNekKZIJTFSoJhVcbRa3zZc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472396; c=relaxed/simple;
	bh=5CcdM1owvnxwLYUd3cJ8hL4UP92+ukXLaJN7gwUdCPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QwJMMRRuP9FSdHvyk4V5Y3qiuanC3Z7+/xDByAtazCpmfNJgusdYdHfNadXvUZAZ/5Gv5esuqhjmRmY69i2zbC89ON/5tA//UJNdOKYP5lTzh2itOrbWALLhp2c8YgXKZyJBF3CfA2sELEqFZmeLgVyE2nLPLLcZjrYAWoWRRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMXxKKbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDK4gTKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMXxKKbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDK4gTKU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcj2n2239444
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y84swSBgXfG
	en6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=; b=CMXxKKbsgT7nw9MxU5h2sBargYX
	Qojys5begMUXh/mSSrDFinkIuCmP9GNX7EglHMPizbTg15pfALOxFRO5FTQ9mKX0
	y4SmJlPRiTTE+hWOjHxTlgLDlUX7tGNu1S3Q7w3S+Vci/XhRlDzAJ2nzDx8XXcVw
	KyZXfWrwDrSqWfDoKW/d6/csXwUtIwrjDx3xCXXpRUZmiMgv20dkwnObOQA+gtUo
	Zrl64ysdmfFdj0YZi8nyzJY8wR84hPHYZ0WEg8sa5nPapohUVkD7ZumRLSaIzAV3
	gHY2QJSJ3Bk8tY+hx6NwMrY0ykPvfMr7kzWkbvC9KuqKVo41Nt7mxEG9T9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc22yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845c85d911dso148092b3a.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472392; x=1783077192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y84swSBgXfGen6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=;
        b=gDK4gTKUVQovSsNpJ0zjGjGaBALOmqECHpfbiDfWMmaLvmSvlFVh6MOnYUwJcJriuh
         GMGU1jCekG30hptGUnxKsNthtVWqEAG4HN1XO0NAMjX10V4LSi8K33cwCZRz9g591QV6
         kEo7u5UmC4p3eueO9S6T4UtNmhJz3/VPy8452hBfeCkyQTaLrlx6Hr1ZyTJqQGujgASB
         ALy0RcNNh9Dd0xbh7mUyslHlof+hvJ6YnLZQeKJtgce8S7R3TzRgi3ddoVWYFNGoJub2
         hacXY3XE6SfOi3OHdPyHY9bmaBhwhTyST5HJRZ+NbeQ1hc9Oh/ToIKNf7+P2qSxZiAUE
         H+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472392; x=1783077192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y84swSBgXfGen6xzSwkrQfwxGwFanU/sxFKsgfy6qzA=;
        b=Wg1rF6ztZ7kSFFF9JRrotYc4yshO1rGsgI6wiJFmkkzM0te/O63DSkQJzxViGYNVGc
         uiLFW143yRleGWPR3HW21o9Msu8QPnUDdFVoV717KgjYG7nO4TFrV4pwKF69QRxr3LGJ
         X4KrBvvcZpmmoWXrAe5GkyyacjiRXUOdN1nX5BmL6o/1kzO/yDBKdpNPm4Lv+JR3XwaA
         bcjSSpfKhEUnuDm8iaRkj4k0ggVoT3uL16IdArq9Wk84VJXVurpj8emFbfqh04uaFFr9
         Eqok5AqYzQEve0Y6LhKDxB+EiDOTfP6qVszT1YCDIybJuQFconeY7h4U04mXHGiqY3t/
         lbcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNFZH/Yl9RYh+6KzQGGyaINO0Fh2hTHC6HJZEP+YunDVLvTtZgPVPosEYEWRvhz+asDcZAityLVp7w@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwn5lZHAJ/PH8zQMUi50jGY73h0sSYfCpX+6MTMjECIhNTd1qa
	YbOsC14xIokEQBp6NSY7c/j4KcgHC+tFe/enWWg9ZEoexYB5gXfOTP14lmVe68Ao+XnX/IA6yzB
	qgfDdCjzIVhV7s/CyFnbAQwo7dRTqJZLSTdAmCFe2iNSyaraeRGeFRE2cscsbVxn2h5qlWM3O
X-Gm-Gg: AfdE7cl+C0GptbApOt2F+oKFB6cRSWfM1vc8ySULw0ECtau+rou1W2UBi5QTkgURPIX
	sUsMvVJeOeHwnh6zCkB1uoM/+nO6p4L90xOYDsSvVtB8vN9fVYeb8rTTjUEaUnvCy+qcxNG9YRg
	DHGSjbDt63RF2zv7PG7RL3UjFABfUlH+0e38RbSyhe45kNJqKK38Z5Ten3FMK65zbfpJG2jss7k
	ukxu8/VFz3ZOJqMKqiyJu3ihNDjgYxUgzMHrGpqYLoxrwqY8w26bMcbO7eHXP7CEm2/gXL/hpW1
	1VHGkBB916jYcuItAMx4cf4pmCV+RYLtdQQAy/XsHRNAren4cmK4OnKaqfR3eCq7Na+8QvxSig2
	F4M9h3TPchpazG8BjcXy4WES7TQ50FVFmjD+tTQpd0w==
X-Received: by 2002:a05:6a00:726:b0:845:ba04:5881 with SMTP id d2e1a72fcca58-845ba045935mr2207583b3a.5.1782472391859;
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:726:b0:845:ba04:5881 with SMTP id d2e1a72fcca58-845ba045935mr2207561b3a.5.1782472391389;
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:11 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Fri, 26 Jun 2026 16:42:59 +0530
Message-Id: <20260626111301.3479559-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX2+DqYmIcT947
 jb9otTwzeBpQhOxz3knMvdbVqfttv55SeyuHlE6kMAjjPFLFfm52pRui5QOHQz3WtzbuB+RLD1X
 0Sz0npCJZweDS1bgbeh/QJfaTUdHf+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX2MZpedf7mcE0
 GKAHu5y3jxmMYnOCJydyjJQDHAAVjdW6yrlVUO4kd4n0O905YytMgQHAOz0frkUtJlFUGbV4WPq
 Npf8HP54QpP4/daOZFakLCKY3gFZTWz7j9uHlClRfK0CeooN4QitLLkVhCN8tdjbSHZUi+MIRmN
 HRPI82xqwXTlMmpl2k1WrVrYQ+Bd3Sr9gSjtS6/PinRun6AmdrHFDonoa/4vkjRlq5Ny6jz+02X
 PiXOxC3YLv/K/+4Wi7JTdTL2oIy9cmTu5Yb4Uc+TNz1atPJZeUPJazfKhih4wg37qPOJytpsysg
 8Bs1dzSZw2rjeO9lNzWO8SQyk4jcW3ahHm7KH3+H77FYcUkjofcXmtwSLMcaiHz9FrgCRjy1C6N
 wRJpaYAJHTfJpGeu/zxjm3edUqoT5cv5BfzdxCFDcFJXHrRxi6MEFSxIrtbSQDkXoIKNfgDw2ss
 zSsXV5ikF+yzdj+xQAQ==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e5ec8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vnR2pTXPFHMqojpGVs0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: _ibDvkTy-HF2OxNcSyCqprFH1zcldgcn
X-Proofpoint-GUID: _ibDvkTy-HF2OxNcSyCqprFH1zcldgcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260090

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..0624560643e5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -932,6 +932,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1

