Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395651;
	b=pbL8+fuOaBbQ5HGWeS7lOy+CUlmIoUN5lmSR6pfKNNa16AFwYT8lzLKaggP4+QAD9Tha
	 dAYqfZnshGmlAQ/2s/KMDYYGbwBKIpFyvV+ZMe7EhaF3qmEy28Ewr8kReW1s73tag9rX2
	 6udonBkX82VFf5jSzSGI6Zdt1aDNxc5yoEOqnsX+0+IAiyO9hsy33BnVP2uDPiRi27nHY
	 rZ3/BYj924KExtDkDuGxp8KEeEm2g/cuL7BsgGtLy7lBdu3k3rVOd5RFqPG6VrGt5MlcL
	 A3nZv1uo69KF8dWoP6wxBeWSQloyzBcc+h/FN4i4e0T0tDhxp9do6DnqN3Ohc4L1GtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
	b=o1Uw/RV9ZViK+VVGn4ew8vseFWsTc2Zbj5m8iAN8YKkMKq15Vf0s9f9cxF5py2Irvni3
	 jFmpVzOO/gIwirMtcZ10cKWqWjs0UUUNN/xDLG+8Rk3vva+7lJHjYtaD4kJfLGVEDRlCp
	 OshtCUsyaHinfq8fFd9jy2NYXd0KWDVpk+/uGol5pYbA/Ok2IGxvWEzqJXVMcrx7for4U
	 QtpHBaFX/BUMm+T5x9vkjH+olZOhl5ICbYtMfz6WF1FgkQbBYGznHToIt8qXYec7PrbGx
	 AuzQ1/Evgl97Rz09u/aFTIKF96EPRswywNBQvI1+UyYmjAP8dt+mus8BZbZ5V+wGfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BAKu0Ew7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESH9GbcY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1ED606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BAKu0Ew7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESH9GbcY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAjqNs300737
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9mil
	LjWO+GfM=; b=BAKu0Ew7LFJsp1O6/VdtoCKdGqZdjLA5PZgFdml9LrsiEoRcUa/
	bZgqFxmMBnQOA5mTDyWGXawPg0HS5/qVD1WqTUGwQAOy45lXdjqzl77tiOvsadsO
	55Qo97IJartTuyQBluUECtYLd0onspL6yXMc9/DjPOKGrWwOcrobL8BNdh1vae86
	15F4JEg0GNZj41loY4LvkrJPs90SRdjMgHHTEOfXh0EUQ1KWXzIlGbdWFaFGWF6t
	9LHIE8whsONU+uDeOZFznyHfFFFLrttNI8mB9XwD3nsoJQ3pcfqPui/bYiVHW93I
	otlgf9iMvyqykCeVBVmbO0CoGef6qKDtEvA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5m00f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:14:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecd2447f4cso890908e0c.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395649; x=1795000449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
        b=ESH9GbcY9rf2eYkdXThA/SYVBkeQVYPKzsq1tGv+l/lz+DS6Vm8oVHSLiMMmiqqfur
         gsRjlTh53AkiXJtGenKrIGHNfAEPp1JNbWqZcq+eCshCJlec7x1Qj+ppS0z8cgk2SBfv
         5yIyVcRxNumx1KWtf6ROruSPEM9tVXGJiwR7Z9osspqCWmB6n4+N+wot3Pj8p1Oc0B7J
         QN6Ak/hQOijuAMDx59pG1073+psV9pSt3W4Viq+Fsj60WjVWvtOjYglvEiUOlVuUoIqa
         uqnehuloAmfjbisqEEzNsXdwDIGDb3vHW0DaFwG3yGQ/CSaXcbfs1Xcf3vcg/pQt5TqN
         zrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395649; x=1795000449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
        b=EMHewE4VPvXPN/W8fArjkop7hibg5wqWcOTibAvnkpACM9ss/8OXIMRl8xUKvEAbsN
         temH+5qalIFaaNZff7yZsmTyZSeVyfpPlX+mahhAh7Uw/DCEd0RUD1T/jfDfki0+SJm/
         fkCS9p5WYDIcjxTpvbVHe/KQkubF+9BAVGXu26QUKasAkk4iJwvGet2bp70NOVKvPkUE
         2IWg66Fve0450AnHlCfcvztMzqlARCSAprBJIBgzbQTx2S76Z+nQdkZluEYgGPAOEIXZ
         vDgoEj4c8CSRH4jIJCzBFZPm5RASK4D3/UwjtPYSj5PeRxlarXxf+KLmGyatZWLliMrB
         4GYA==
X-Forwarded-Encrypted: i=1; AL+hErFGTOrdSZ2TFI23kwYxpd4eJZbu0dG4VpDfGfTQ/mZyUZewgkAPbprSz7FUh1LUn0pQoW5A0FhJ+lVl@vger.kernel.org
X-Gm-Message-State: APuU4Z9CJXeN/tRU4z5qGrcd9tyzb63cOh1T45gDcvGPccXPOm6AkrtS
	l2IaQYwfASFcU1Zx33pgEEqwCqAlpl4zWY/QXxag+KMgDW6NTK1oAC7zq2z0hVPcqN2jnGpi6B6
	eKmQMuovWpRxF6cRkR+YG7YsU36hbknHB6teO+3rwXH+PziIY5f4AFeqZzco3p+5e
X-Gm-Gg: AYBFou3ZFIVsL6CC8O0st/wgpgNtSaZPClx6GPYQRMXykz+gkODc5XNzJmOLEqpwtPS
	GvTg/pcHxh+prtaTARgb9BNokVhrN9S6oD5rZEkgRl4d8pNTcdmd0tSIRAiAXnVYFzNUUvv7KIN
	sP76AZNwBo3qJsgylPsypqA260qo3EjejH5+zS6ofxIpkzO5VrVLJPxUgHdE8jOt0CurN2cGpLl
	1Ts1oCYPdLdiumZZ4TR0h0ok72X3DNeonh0GOnhdaPtbGcw070E187Kg9Z2e2/PS7DZAFWWt8+5
	9EXQGWkg3GH5+bFTNYj2//r+9Oh5E3Xsu++sLXBfAIU5G/0Imc6+tUKiidSPGUMnRk6phVXOtVK
	Hwpa69SyExTch9Zq1V8+l9T7jWAZVjqsiqfehJtOeZqfckZqfv+iEFRxPoQRAcA==
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr468687137.1.1794395648684;
        Wed, 11 Nov 2026 03:14:08 -0800 (PST)
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr468683137.1.1794395648149;
        Wed, 11 Nov 2026 03:14:08 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm86994955e9.0.2026.11.11.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:14:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: example-schema: Show example of dependentRequired
Date: Wed, 11 Nov 2026 12:14:04 +0100
Message-ID: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VOFvsR8n4ujVMiycRZfmEt9KZiHFAXBQlZakD1jDTSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9E371Z+5WzBLVKnM+W4mozaM16H4oD7otaHlK
 RASWqGJDiyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavRN+wAKCRDBN2bmhouD
 19OED/0VGeVYuCCyQixBA2tBRzwO/W3g0IpszbkND9U6X0HqOtnL5l+OnssJJUMR16EgEnZ5XlA
 n0ZY22oXJ7VrMMQ4o1IJdSZE0S8tvIHyRWcmYbReeZShKXW4DvG+zsi3lQjJpDCaHywIHm7bc4y
 +QBmgij3EJKOMCRZnwbXcuOEssoBXrYIe92ELMZslrfsjAaowRpruuGMAvGj8mWJAUSh+Ykt/V4
 sjHeS1DpjfkxoTaRyiL1yfVjukmyNkLgkTem+J3duAg9lbB0B/M4KkoKJUaiTPmv3hmDEOKqLQP
 2JnRru7NeBzGmjODwHvtN5KeKbJ5AH5QMwD/2aPie8scMLfWmuGR8fYGwwoFMywt7/yCC9XtpHE
 7LQEG8N/VCRkmSYEejBRbU9QSLDo1asgJAb66T1Alu4kMJgzGMx34eMvp4/6ZnoJvWKfFb78G7t
 jmz66jMNXT1mQIURzcJQBx4NvV042a0KecHjqT8a3+D6S2tzFjNU+uRumvYEuotR+64lGOsMLS4
 M9yfvLv35Vyo12eg0KgIxwV8zFxZhfPt7+bVKE2SaWis+x31zU6JVANObVPk8rxogsJgkqBTpsE
 jIhMo2wq3teb76dJSwCS3laexAZCKbMvkYjyfEWvTE3xoD3L1esw3+3ayOzHouISeZV2S8B9AWB YQ0QcCrIaOf2p0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX3CX8DqXsLWv6
 Ral7HNq9znDZrhAYjzMwbP1TVLoFWUp5QgSOideeDSEnMk2HShpBd/MDZYwi52uJMTVLKxHCvar
 vMYbI5ft/v8IMO+dzF/OINYWFHGoMEQLVOZRRj0IMJST4prsZkz72sEmKCOCIiO61/tI9hFJ2Zt
 cKdTYBt67567OPcvTtBEh9W6dsVJr346kSHsp+zlujcXcWIM8D8iE702lspXTSBFVESr0ct0irN
 2oIat/Ld4VE1DGerjPxLjrdVUIQSqGbZ7QjZnRXYDYjVSaddnLlF4k22qVUJN7fvDauAFFxeReb
 kn3jZn7ySsMzVD/W1m9u/QaTY6TB2I8Rz16aT3j50r7nczHY4q+hxJw5VXmmV0Y16dykCgZ/bZZ
 nu4ZhxyJlvMYXnPoGCsuuAHcx5W7rgXmmrS1gZrpH3fps1w9oU9YxE/VnW59GjlJblDXZIbDjmv
 U1dEzhO3spznOzpRiCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfXzlrSPOVPkmBr
 7kWrVAuipcC3AJ4XRli74ZXdg/mB6RFhtyA42KQfSnUuzb4hw5XAv9d6EjfANoUvpPJ79h5FJo1
 E0c34ygxzpeTgGBC0CKEndPJL973bWw=
X-Proofpoint-ORIG-GUID: wZYI3WHxFevbhpcM8LF5OxpMYuV_05_U
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af44e01 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ma7z1CdSWlCHNZC_glkA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: wZYI3WHxFevbhpcM8LF5OxpMYuV_05_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110044

dependentRequired is shorter and preferred form of conditional property
requirement, over allOf:if:then: block, so document example usage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use clocks/clock-names in the dependentRequired, to avoid conflict
   with existing foo-supply constraint.
---
 Documentation/devicetree/bindings/example-schema.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index b04f3cc4312c..a37d10ff7469 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -217,6 +217,14 @@ required:
   - interrupts
   - interrupt-controller
 
+# Properties might be required only if some other property is present.
+# dependentRequired is a shorter and preferred way to express this, instead of
+# if:then: block.
+dependentRequired:
+  # clocks is not a required property in this binding, but if present, then
+  # clock-names must be provided as well.
+  clocks: [ clock-names ]
+
 # if/then schema can be used to handle conditions on a property affecting
 # another property. A typical case is a specific 'compatible' value changes the
 # constraints on other properties.
-- 
2.53.0

