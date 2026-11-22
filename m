Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372945;
	b=agtJofyrvnzMazjZX2zgBS7ROnLlYBmVhGrbJtSKxfAAv+bPTJzj6GDsZJKOczL06c+p
	 KoF51E4axyjwpMP1mefBXDpY3iRpT/qwSC3rbneTJ9RNcDhn3ihLWmGeSOWwHGW3KsZrj
	 Q+8viZ3x+st4NUs16aaku0NVlD91Jg3x62aN6KOy6iDHJ+OXRqaB7U8j4ot2M1lPu/0mv
	 DXJKfhgR2aNvWNR935a5LlUzspCG9skJKoKzVgU78ZnVU+Fjv1saeTgRvD452s7WzlJ9w
	 OjJWrnDLCdZsdAahwyEWV5FoTWugz8LIRB67QfLQTgsCi7KoBKcg4OuKHsoSUFSU1Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
	b=1kkePKgqj005BJb+bxaS1ESlfj5yJzFMA5Db7ITs84wg5g6xk1nfifFHfbiDy43jTL93
	 E9teVGsoS7/c0wkiGvi7JpuAA29ePD/jEMmxFKgvDGZ+p47xOFUcR3S7I+uTATWVq9PO5
	 YCR7icRzUEJB/l8BkhrpErrO+YTrf4JmU2xTPZ4ivSbfWt4ch2iHOkgeOjAydoDLIMdGQ
	 Bf0BR2QGsrsryJhlJOKzXIw65S8IOFRzCRs4H0Q/b/Xdjdhq7oi2HI8iVROvtDpgL5Npx
	 HOtyUVpt/CQp/JsyJu/JRAMDEnWOl0hnIZWAPh+q9mGCc8TB3a9xaCAzXi1adB/ExtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiuLAfZt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvDzwWG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F10606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F10606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiuLAfZt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvDzwWG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV6p93986376
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=; b=KiuLAfZtrrRhAVau
	C6yQsRv6noDbddOxm3Ck8FqGJYEKS/kVKOHmI3ofk7GO8+rfS9vucUxaxi9hnQfy
	n0KqOpN/a0slNdVeQbbZXfYByhuiQWg9VIlrlH/tJ2MOfVhUu0n2cseAgOOZGfug
	WoJvBlEnKJb7k5dsHQA9zkMj9pd2Ty4l3+5FIFrwn8whfp2Eor1Su+rVLH+Zv7pX
	WtEG8rFzIr6WOydI/V59s5nOQNtZ7ckV/ljh5zyiTRh8+A0noG8/JAYbFBMvqpiv
	QLhRCMqYluyryyjkYMVETSAl6zEAmHra8fHTloIztwErGvKqyH4Vo5a7JJrjavPX
	RR6xEQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu40vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so4695249eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372943; x=1795977743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
        b=NfvDzwWGWKQhSUXbySado8KfoQraE6gSPR7GKbjV5yx2Mf8qYRe46EoEzSIhpeDnJm
         bdvvZJQEcePerqHRxMc1ViXcvl9VgfF6CJffHbh9mag/R6VbYP9rqWftpZ26ikCewSGk
         lzN8jf4sGdG18j+UVMro5Rdp6eCrJQvOEGMJ78TjgtLmzLcebahF3x9C0tkeqefo4pJZ
         y69FmEwCMDrl+yfpDrwPx5HqSl3t4upP49bJje6CXx9SSsvThk7QjQp0kxCsfguUSeI5
         EWt3A9Sp7H/pob4f9O2rVE/n1b+WLqYkhWhzWf9Hs9ykliy6g0maXlQLg/r+puaB2UxR
         62rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372943; x=1795977743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At+uYBlqvIcm99uCnM+0UV/o32mUx5kQMhyyALbCWq8=;
        b=BW9qZGGW3n5wng+T+uQPikxR56dR32N5MWs3uwWgkhYA+12zjGniBGsR1nVYgvuM0m
         +Ca00lD0WBOq34zF/+utBNNtdPBg4Op+xdVSCcOoJwxdy/plkkcK2pbF5sU81Eo9O4Rd
         /cd0AD+A9UMc1IbkyWWVEl8pGaa8qC/OWbPJFDsFTd3lDALPKa13KZwVJ3JKC67CI2bB
         ZZe7WfiF6eRRATzrXGkRO2QWBec3QcqpgoFrR/gMxCCKi+gb1MWelgQr6nXed0bPUE0R
         PwsSQwOn6WpYcHFplaG08fVU4pUYBLdiBhfYUYI7LSno6rSDivxjXBoQR3kOvYB3PiQ0
         2NYw==
X-Forwarded-Encrypted: i=1; AL+hErE4UXMD9PnSK/vx8rWXAYrDxPpb/3uW00bB2ny6MJG9WfeY8HM44L7cC3Ge+LO5jR2OulXmJHL87MHm@vger.kernel.org
X-Gm-Message-State: APuU4Z/HH6RC9TTHVPfuSvZtn8mhVGYfcZR4KQ9PptLO+2UdwjAz7uHH
	Lp2ABPrq9QiHSUxvWqbjZR0kA6WHVDWBoAcGyNCbpjbIHDfuTj4v/0tWP8w6hTiqt6gEgUJpVB7
	CGGgnHZgReXdXKAPaCfvXJbsUVeKyHgzaYG8P5jtN0zBwIFTHlY4jufYcj8QCxkz2
X-Gm-Gg: AZFdTZcvdj0JdxGBx/3tafHCbnwTHZ9UClWEOeZlas8KqLkkv0e2bFrxIOdiu8sLA+4
	fG6VOXfYlsrJmPTX6vN5C8CtGkqAbVARCMo1NXgF5EsfBVaStez8hvErm/kLNadKmQPIKqzrwYp
	3IseNKaY3DYwW4mFl4jmbik6F1PtDMKcokM6wMUkw+srqipmfZZY/nRKdFqf3rhheW7bYjflXmi
	4rm7RRbdYqJ5faI+mCMaOGwpRP/Uc4yw+LTwETI/dN8tpixb3AblSf5+NUTGZkEpLfsun+lhudH
	8dNEgRWGl13kjE1Ic4v3JR2tbkhZ37o+CyJk2OVGPm+uGITzcnPDfvt4SPuaTnVHo2dfySnZGZ9
	ZzsP6ux+cu5p9L8K2OOKxlDVg9dvRY2urgwJyDFsjAGlDUmw55GWYbXCwnujUNeKDREITDp4rsi
	Djamac2C7B/w==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr10804951eec.6.1795372943285;
        Sun, 22 Nov 2026 10:42:23 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr10804895eec.6.1795372942668;
        Sun, 22 Nov 2026 10:42:22 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:22 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:36 +0530
Subject: [PATCH v7 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-6-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=4456;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=5FBPDpaD3OrMAmmupNm3eZ3W1yGgtsy+cEqVcyNVSmk=;
 b=j9Jrq4s1XPTzNlEKY81+i3CeObEyRz/c4Ubb1RU19kKoW56BH8QnBqphMzqcpIni8vtfAQp8T
 MB7u7yOXWivBq0OqDTD7SMI5FwOLgag8YesZ+bAHTM6MOZTk4tx3nGX
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: SK2j7M2pSmhEocMhT_Mdssk9NKidGEIK
X-Proofpoint-ORIG-GUID: SK2j7M2pSmhEocMhT_Mdssk9NKidGEIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/D/ufFMC0DWn
 3vV382JQPm6MSrs8GNPz3zosJ0pA8HcQBvfAMFMwGE4sRvrxbXBlFL46guvbjZ4VPkpwu4UcrjV
 ghilz/5pSnec6HKYRzkdN/qpMiJpIOr14dvhjXOZySep7g/+HBaTLWSitYEkGO8popeKtkMHQqq
 W5q32hbsBLotmmeLpjUrF+1nZMACjgdCRYdEt2yUK6JoPZcUCiA4uvAZ1hwpEpVHRZjEoht6R7y
 4a0UAf3TxeG2tjaFibKxcXhZHRHtDDuQk3O540EhEh06hfbRt6h9HUvJpbUauZ5oV+PbFFH0F/S
 7xlQuX/bQRKAQAQaN6iy1+MDsmGG8rPc5MjxviSbQinSR30316PQZ4gFfK2ZhS1AAc4Cp9SeG39
 oVFYI4LZFZcZCc6X0NXqG/JcLQlvazK9uF5ejTmfpdqgS0tSnvQjKSuQpVdtKBtM5DzVZem73NG
 59Pu83swUWlFE1jZawA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b033790 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QKLxUzbeBypczxc0BNYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXw17yx/MR/Zql
 ytFgcs3JdG2Pl6CLimNNC7cAQWTXiIHDWIxpaWzjiVekc9fjDNg4xZJa9dMTjhNcgItM0BWrvby
 11EaeG7RB19YJUoIKujWuM7Oh6vISLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document the RX, TX and VA macro codecs on the Qualcomm Hawi SoC as
standalone compatibles rather than using the SM8550 fallback, as their
clock inputs differ.

On Hawi, all three macros use an "lpr" vote instead of SM8550's
"macro" vote. "lpr" is the consumer-side vote name for the
LPASS_HW_LPR_VOTE and is distinct from the LPASS_HW_MACRO_VOTE used
by SM8550. The LPR vote is shared by all LPASS macros on Hawi and
Maili. LPR is the vote to put the LPASS block into sleep-disable
before accessing the LPAIF registers

The VA macro takes an additional "heartbeatpulse" clock sourced
from the LPASS VA CSR rate generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 5ecec8d0b9db..0ceff31a26a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -158,6 +159,24 @@ allOf:
             - const: npl
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index f9702a11ef82..77cde8a4c9a9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -146,6 +147,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index eeefe2171c57..c8392bf7c31f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -188,6 +189,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

