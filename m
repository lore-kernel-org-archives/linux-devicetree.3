Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CD37880B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775539602; cv=none; b=MPlQDwVX4CIFzhmC3ukSsw/GWIknN3lg41q5xZRcugq8dJJs04+bL1djsLvOoshk7LExu75vkuQUBNaS77Mey4vbzpWL//3aARrPcAlurogNWE7eAH6J+V5GdVbqzITQ7drWBrFRpesr2Y4idy1tdGg59k0dSQsoZ0bwi8BQYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775539602; c=relaxed/simple;
	bh=evF8UelYqeYrz/mPFVVwmW3vrS6iJxnqj0DMj4NnPfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mw11a9iTkF0GBbLQKz7ZLs6xHWbmoEEfBsxi4L53NUEm0OAMEHp1GU2qs6QQwXlznC2Hb4nLJv/vS/GZ2Tg0T2eUC0/Ft7ynwPlpR7hHSKUY42UOLz6wm56xZBgXrS7LxAGGegAs8TGhC/z94Tbj1iBbB0IM/Kx3Z9PaGVEfK4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtybaZtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da4ZNBV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtybaZtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da4ZNBV9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSeH42580027
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 05:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=UtybaZtpNuwIgnyG
	O8CFd4bbT2ohmZr3RZJF3G4hkHd1mk1LBdst2K4q83TCH36mIL6eZ1CTfq7nwmwU
	P190/bIq0xWDDL9O73Y769hu7+UwdFJK7ddARMgabS2HBfHdhMWBXwGxU+0NUIVj
	qhaMQ0bDdLkCYylbFtpXVYUXLJAOotzvBtWlgYGjjKNDEu9VrSLDxQLkOevltMOU
	l2g/ku1PdlfSy3dGj6ikXJN4dQiQYQo3Js1wX42pZ2gFiJI9W+TCDnBQAZqMpez0
	VHBOQYLB44sI1s0LQOxoseNUds8YFdS0T5fg8x6G+q3ihnMu/yUCCOVHBV5B1euE
	PModqQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf158k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:26:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82d02942266so5859236b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539599; x=1776144399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=Da4ZNBV9l6RxnGC7IX3quKWJsYuA7qsKUneJw3WnUdogw91xLTSwQtTHGpIj3Zzl+V
         AL6S/A8aYstB20KE71xAxKwv3DNtAiRoBEYYFgxh79TjWVylA6VP7N7kiohQHG55H0mS
         moIsplHD8Kc6Rlv5kNzI92/B/5WNH6id8C9+26ZycxOzPyQvOSa2d0opcLwdBTtz7LfA
         kMcla+DUtOTZUL/H0tVU7Q1zClVixlcWKl8ex+/X7ZoLXJliCEzZtz7dM12VCqcsHqjU
         jduNpmA1mq+2wVagcCwyY5+M6byI7vMVvZIJjiO5BTfd6w2XcLmZlDeH9BK3KaWKHKb/
         rSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539599; x=1776144399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=hk05nRiApV9A6uzU44DstZSh9EqEwAA2CLp2iKwfsVcU9zjnPqhkelzcp7mGH3Q91h
         a/zyJYEtygn31yX9HVJOOuYS8QAJ7uUlmaZa+1OlyCTUl/q69szwUPI/qzNkuFG5RLcT
         N8VxdC4yTzkml4emvbRM5llrpBiMTn8KozVh23AV2FvT2+Wp+EXa6xfIhyj02woX4jvG
         3rH5eo2/GOM+UcIUM60YuzjNwIJc9lh4RDIYUw03c3UHOs5W0qo2xX+FWteyBKWA+JgH
         ZuJY2Jy9QRC1sRVMxTj/afUa+6b4FH/fNDuugYQztEG1PgQVzcQImg6BQ2jh9NkR6ucs
         RruQ==
X-Forwarded-Encrypted: i=1; AJvYcCW81ITUdiIgqsTPOU3LjMJbfcZkezka5X1eAC7MJHA33z9dpWHMd3W9kcncmC5+qiR7eGvmBoDSwFN3@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5QCraYAlpIuXL4lgJ1lftYhlOJKKEIU5OmE/GO8Zc04Pl260
	7E2nLVys1ZxXE84gZPLU8Ik+ChVKSnfjI9YzxZ6tkiorbbB4c05rUv6Ng1Z0kQKpqoC7veYpFv6
	7qMqXYp+GqP4ZsPGFIiC/6SC5oYnD2zo0OXykSQoUif8fDDKCmF/gIXu7AizutBRj
X-Gm-Gg: AeBDietpIQTxB71fljioMAluoJcYeSQHJgNS0WN53/KamE7pnPMizSyjUw7ANkO45xE
	YgpV3fRmAe0pDYl4gRPJPJYJ426YPo93N6cD+azgq8VdBY2+3w5cK9YZD+XGnBiG7vYACgqiN+4
	kUYqev4VluUrGorpLK0saJMRDgDu/8rQOv3Cx3bkOO867uDehWG0tmAfd2hBr84kZPGmWF/lcan
	AsFB7l5dWF7EpuNe8G74imolJaO62nWf1yq3JeYtZurqXiCM7VK4Sh44pdIdFvky5ODQRft8fa6
	MLDtoOJzwNt2kXw84uILJbXGIwR3FpfZ3mZwe2Ddd+pnUHxDVTmzbPfsAI4/01G84okLAusTtMp
	Rubt9qcexDtMzomf52VJEeu5e4LsFqsyesvI2i2F8fnLSIX0NGRZVOK2s568Abglb9YHQrQaO6N
	0WIMvyQRM0kx/2tVJRRzcr8v0BVbqKiE2kcJQhmjA=
X-Received: by 2002:a05:6a00:bc0b:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-82d0da284e4mr14976073b3a.8.1775539599373;
        Mon, 06 Apr 2026 22:26:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc0b:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-82d0da284e4mr14976050b3a.8.1775539598980;
        Mon, 06 Apr 2026 22:26:38 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:38 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:28 +0530
Subject: [PATCH ath-next v5 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-1-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfXxi7ARfo0+cxU
 eYfX2ySPU2Q81x67dtwZyj6gmieFHGGZ4DpUtQCgpbJU5eq0j9sxay4FZR2zfUVpzYCKWgvOgn7
 HFtx0ipCBylo+RGoMNox2v/M1+KgtnWBZNWRlDyUTp4JYYfzKuW/LQSoUSiv29+q9CAP0d51N25
 UA1LEEv5lrt52OWM2I9rcPnUeKM9PjPk76kC3EiXuQqn4pEDh6CjK6hVJ7AVECQCHiiMB8Cqhzd
 tvny5Yb66hg+6flvwb2Aocv5goeXf2TGt7vLnE2kSKjhglNUxamx2avWTtVkrvGFngEV8HdCl+a
 uChoM/Tfd+pfIpTUhAITJPvPPpIkTp0BhGhltpQSmi+7wo1SwDg/lZAoevrgQ+j131jYB5FhBfm
 xZVoOBu8X4hGvol1DlaFPOYMbs3ZWTMoCRrqCl0SXhZzSc4y4tqKJWQnmD6MCg4CuiaPhhll3Ys
 1BCPDYp1QpaXDBkd4QQ==
X-Proofpoint-ORIG-GUID: nYDyL13eXHn1j7dOc-rXR2MOLdNF5P3C
X-Proofpoint-GUID: nYDyL13eXHn1j7dOc-rXR2MOLdNF5P3C
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d49590 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=HmtOZnpMNtbFe9RdH4EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..37d8a0da7780 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1

