Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F23DDDC2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764608; cv=none; b=egY3FTd7un4E0KwnMmbltHd03l4+aQn7W4tFryaUUUNvnoGgScwNM459xkmfdcy6JjN1/txSsImjmiDaq+Gt5KIgxZcVQ84EpFm4r5EP5B7tnKU1QPBKXXwhggjGUoNwDGOhF+ufAOGHNqG5RVwlBIw3+DDv5/OYLDfvTqjCW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764608; c=relaxed/simple;
	bh=6dOmXBHnW6tKHtNL7QoMr6t8ob0iBTXb0NJR/FL3v/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaDq+t4+B0H667lIz/ZpdvJQ1nA0ozQryAaO0EoV4VFROg/Wag9u7LZZhiS6tOZhmbSMS0iuVP0qJE4I2Yt1T5XX/KGaprHXgUXBB8NPX40ct7ddyL1sct/x6y4iqQomwBRpf7uiL0PzUx4v/rYXW32ZaHwZNVEfb9JQO2WXeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjAkdJfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6E4iOIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjAkdJfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6E4iOIZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWJs2841093
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=; b=VjAkdJfO7YPLU2FN
	nFU9RIlUvBd37rwypzzACRGaZ+PUy0IGK5q1b/irX7Vdug5vcSLlE46f2xeLU8Wh
	b78lhEGr2B6VMMziJUA9bBjHVS7Uok6tG7l5SBS8zToPnCFgUAkwml0/VV61Diiz
	3fWfel9vChv7p/CmLxNAsg5MJg+dQ9ypPkgjIopVbLgvYFhDOQD0oiN68BUZahGZ
	d50jmw2BiOFS6SoOYtQ42fiqfZSoZsPsB/S8PoiSdEtJn6flbXmPC7Pw6DuuCa+u
	bDDZhjV13ixy5EyouA4MOgBfegAUOkP/qkfF31vVPSNKf+hRqaZ4OFP9bioLXt1/
	FnOBaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899sgpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c84be9c3so94107a12.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764605; x=1779369405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=;
        b=e6E4iOIZSwRuq1M8BBr7HYu5Z9DnXa8z8BVauRwlC8azRTRSjxJp/npZI+iHmZxuES
         40i8eXFIXvyHNlsymvYzRqmaGPoHF6R9KUBGloD3d2iPhC+DGqijrmf8MjUFxQaSXhJB
         MRxIxM04iMxPom2eYi+7HheTZMed92PXpL2dwZLcguDpGnOeixaNQwWPgczYelMdKA9J
         MvXGe5cHWsGQvvlju02BQxUMP/rSWUrzcDZS1aSZjfA27Xmdmq/JzJtFBj90ZcDCvKWi
         6vsU6jC0JNXZQsMAHYAbm5aDDKDEmBNMEuEeuytUGIESnkvjuJHEMvGMwWEXn71497ue
         GpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764605; x=1779369405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZBik4vQ6oskEkHVvAPfIRk0jhTzMgdfctoUOWCvyM4=;
        b=oNAwT8VrNDJZihvirYrKqe7BOsIcW7zcYCLtiG/y/Lo6tU92SCBzQbVliW3oBbNT16
         xDIVNz/UlKIMkAU/rNjB0vNusd5amzkgr3nKyWsPylYEYZzm8Pl+BNYMledSGi8LIfew
         Rw8+HyAOP+mDm9jtzZ3zGMyX4aTOpj/qd22wREq9xg6gIpnRpqHdQ2aXkKJZ7UsYloRA
         XeAxpdw74O70MNhl/EGpTM0rrqBGmCuIZAeNwz8Znm19Ja8Ayy7jTZpaFCOJNAORYm4G
         900gdm+8qCMPc2yD4HdrhYZAGIDAzSAXdfoZAiDtR1rYZGzqryv9+q8r+/jmjdrpsN5J
         3iyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4D1DSu+j+K6hgGe83YLqLTJZuSgiRw7ds6FruVdLaUslwNREkel34NOlvhqSJG2QUR0nWqGJ2w2BO@vger.kernel.org
X-Gm-Message-State: AOJu0YwvBvc7if30d8DNCPQ10a7uCThHa+eFrWRUHzrZkOgQ2dn7sbvV
	xLEc+X/DG3ABVR2GqdmL18TNQVP0EvT5kxiUPob37PNrSZZljfBKtckAGRR7da1vyWjhTUQsTSG
	quV6Ig8aXPuVSrHLyM6ChZ/fwadLW1ZVrXj+SxTm2DkZ0QaWfPkwf5ftVeW+gQWxE81EtfH7Q
X-Gm-Gg: Acq92OEbFMiiHkgvFqg9UEMs6PM14E3kvc8Y/LLOR0Jp2mMlOEEycYpH+tIVLCFxPZ5
	S6U15nlXtiAJVEhfU1/yr7w/2KEI3rRpotMvQeTnLj3Blh6yeL58ECEfjiB1m7dyhvbCY71zZaB
	MJzskk6i/h427HVEiyA7dpL9ggGVYBNqBM+smJmo2teFwCEom+Ar6lMoJ5Z3eCMCFp1Nn6ycVIB
	jL4TdWMV5ch3Iq8PU+P+WOH675SSKqM0QJgHVMneT2p2BA0AHWe5awqWU+rWcEZUqDqB1O45AMp
	fsHPJj0rI7c+ojW/7Rw5uxw4yi0KbRT86wB/E98cmRFRVtFFbluzop7V4m2IND07f9mN9LcjCAv
	SdjM5OkPf2GVTnUicStaGPH8jVPrD+SAc1d3foIP86bB+7H4h2WXFdGR00g9Lx4dyuA==
X-Received: by 2002:a05:6a00:328f:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-83f042f35b6mr8247227b3a.43.1778764604571;
        Thu, 14 May 2026 06:16:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:328f:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-83f042f35b6mr8247184b3a.43.1778764604068;
        Thu, 14 May 2026 06:16:44 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:43 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:46:24 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Shikra TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra_rng-v1-1-4ea721a1429a@oss.qualcomm.com>
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfX5Ixmq7nYv3CY
 P3WOCF3ib3548o4DAojiZRbgtHMYHKVMrKDDLkBi7LIcDQIWS1tuhseVlaqjBrh37jSfigv2WgK
 k6fyOwLDG8whsPI2yfoy2CrpgCILm4o9GqixrkssagN1haxWS8jnGRyWT8qP8TF5rp9shcSsYQ5
 tHgNrRnHKdNzjiciZyPZVK7Ky5eTCHT3XKTib31sCgvZaopSsroqs6cnfYoNNkPSkfTXg1JPkZw
 Tz4GXUVZjqVab8PhOZSXg8zpxQyiyrcpRxVrEwHZmLcubIuyD7K6Uo3pYgeAz2O7mB2I2DBC38X
 rnfMW9rn8qLb6LBrrDZE9lphhyjVAVELkssRVD+BzxwDekZYZOoGxUzv7BGEY9Bxt4RWLNgo7O1
 kyNWTGnOGOg0cwv9VIJKSzsISRCMI5l2EFdrAeSRhO8sBa4GJvj2TqffE2sEoR/Pd4XycSWsb/i
 K122+KBYzS0gqBDOg3w==
X-Proofpoint-ORIG-GUID: HUfdBjzoZFYtQTjdSVpYND0rGQLw8XGE
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05cb3d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HUfdBjzoZFYtQTjdSVpYND0rGQLw8XGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140133

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 498d6914135e..e2430280b2a3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1

