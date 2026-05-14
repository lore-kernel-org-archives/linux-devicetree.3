Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693152848BA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753392; cv=none; b=gZ055OYVPakA1uarylcI15DPVj2IGym1S/kR5G7mnu6E/LCD/87hqa358QJXZ18QqDzx8o7rM0HyLZ5RgxolU1RwI6RBrBbw94M27IgI/0dWobvtepOG7b5tYkDIidvzCQ6BcUxlEvpLYfgsRvwu2wLDqkKTTJ8dgo0EFpcZWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753392; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+y2IItwv+xXqKpBhJpqQuIwUic3BF0xJCFcTzh24TjNQj0FOgTTx4Z//7Cx4c3w9d4BN0MPEY0hsTfj3chI0pMTttJW6aXTRhVVYVHzBZiSwU3homgT4dtb2whGWWgwPyk4vyzhxZ8ojQOvMvTwyWY9z6FBb+FHs8/G304xYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaPqxgdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT/PFZi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaPqxgdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XT/PFZi2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9klAj638789
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=kaPqxgdotF8HSTsz
	LpFohmizT3y3giUL6pPTMQUG9YWLTXRlCvKrj92u0EPsC1ps5ZzefK12dIV/g2vh
	95VqlcmITakvQKnWXAtVabkdtfw2MsUmh/rlH50f1Z7UT9BTIJWLUh8VJvSxT5qT
	62tOi4rAn4SK0agQQpU7E2TRrY6wUacGZtVP4sRrYcaGtx+06/AX35y+pbziy0mP
	ZWfQg90FLk3djfbPS1DtLt9Y3LpJD6JPKGaDJ0j1oxV6LP4lkmtqLcyIGFuV1i4/
	FXbLQgtFA5clJkOuadTwuavxY0Xw2wr+GuzXyaZMSsYu0tCM7nEuyOO2lonQIDFm
	lXkDDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjkdfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c829586e894so2470648a12.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753389; x=1779358189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=XT/PFZi2DZ+hvtWN5TDBSCWeqKvbImEGB3VCSK3y5ksFO+e+h2BEFIvWW9lWcJBkLe
         Yz6/omKjMGdiUaEQCJ4jT+EsJjKVwAOeWFNmCeWFKcFtL/m28JVwRiKesra2AXISWL5I
         kMfvswnGk4yDwP2WX8z8mmOyTJy7kdKplS4lCzEc2OvblhZwnMiY13LEYsXTmVFaykKJ
         aemMVYz0GsGZ3pz4GrWOWAGR0uY6zstXou/p6+PVf8Hvg/ECnbVHYxZS4ssbHo/E7C3R
         /VXKEdUSgxcRvVVS2VYlG16fJfCJbraPz6oD8GcaPgiqMg+srQLsrmq1WFoGqb2+OXAz
         LrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753389; x=1779358189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=XwUfcsHqC4P5OCclRoyKBaMVdMtC2OtMT0Y2kxifmvAIt2LpVuXaOJuoLJMiPXL6vl
         h2qXxVII6hC/Heo5TPQ7otXQlJNN0Ez8I906inXQ1O5m8OJ77DOm5vRps5LNwfmYM8XE
         btQNqJnszArJWqMu1sANRnbJMY491WOxPWXQYUl04ewSjjC1sTBA44XVYUrsnKjZVPnh
         0K4tCxvzwhfCGcn+54lMQVYXhRJx4HRoiqER3jq0oedZ0F5vKDMVX353uyKnTSBkyIQH
         Zy2LL61bItRVzP16Fq6ZTlAntpsVKJ6vuGvWtsX0shSQSoTlbqPImdPNuDQoxfj4s0pw
         9Eww==
X-Forwarded-Encrypted: i=1; AFNElJ8ZykUb7+nF0LP5Ep7AeDiqcTPzZ/6JyLfqIrrwq3LQgANQGMStN6xxwkKKsE3nBtuLhKLdHJIdi3uI@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQ5mzh9s9Hh1XISa+pma/lzjv+jiL3dmCamXZCKOboLaGJ4qi
	IyunF9ZSlWglIo6WjH3c8BfrpHVKms7GZZN7m4ffvrbzvXmdTNatj6lCiFC5Q2s5UgALDGwBjdU
	fVbHHRgPC7Cf6hfAq1PCHPopLW5MpEHoxDMEN3PQ5twjmi/LYaNTNUPEfMn8cp4vh
X-Gm-Gg: Acq92OE8qJMbU77yuNFC7ZchfbdOXPJtjNFSw9+/bh0GxZ+4NuEa+6qpBH8MZM3ydJt
	hYp4Px8Henk7767Hnsf+j9R0ZryMuSMP3/SRxLedhaRIVGDo8s7bQsBy9SuDac5e+qws1l5uLMX
	rID+ySGSpKszgMMg++5J2Pm8BcJZibekJXG1PSF/LL36Efm9hSc2DCHEuJ3pwPyG1F9EpdGvkDg
	wULyfOAQ4HgsmHvZevxbQ+xRCqCZnH89ar+b8E+I+39+m3gT7XVoyotRHN5tEmI/uV9iTO44fIp
	QX6f3cJm8Ok+nlQfvNkc01hb/tmeW4QnI+DP00hDA7PhoOVBOy4DFfa9z4y0vt24SgaC9droBAl
	vI6D/hSjGwpH538H4GkQFEvrge77nWasnQWj7RXkUwsoqNCYT9yvbSmkW7EhbXvfJ47RYIdPbKu
	HZFfJL4VqkaRcUBOhW4f53
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203318637.34.1778753389117;
        Thu, 14 May 2026 03:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203279637.34.1778753388454;
        Thu, 14 May 2026 03:09:48 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:33 +0800
Subject: [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=LMuK4N3K3iRXR9uDO9yPF60v1xg0w83b3UFfvpAmAljL+QJiXGy9CE91vy1tD/tzk+qdRvDFJ
 RrRisRH2HzkANtypoIiMNnHdegXZoqXUEycn1x3j6GxP07UIkPRkFCq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: QW_7RjRgIJCPfseChqhclSc4i-AkEJlL
X-Proofpoint-ORIG-GUID: QW_7RjRgIJCPfseChqhclSc4i-AkEJlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX/J3P1TDufRco
 erhdEtOBpGf4/bv+Mvc9R1lpfgRB4dQ8/slkXhU+4ZnP4X5h2OB1GhahEqgyJLzLEWjr/LwWeCW
 NPHPm3XjbXGeeM4nLgLTlGLbqESO2yOf6+O/afdb+omosoIhhRUK8sxfc8JuX5l0hnC5CYcN3EZ
 TwXazAz3H6LdVu7Twf8x0Z92M565v70VJoiDtHGmtJTG2PD/lB1uZPMA3YstzzKXcdLA59Hj+6H
 7oWON3B5WR4iRPsnXDbwLNHxd/XhWJNvBdDpxcKs8G6J4ewe3/ShMzOWhsLjLM/NA+o2pcSBNdC
 uAO4KjE1hTdP0Wv2FV8uIteP3GegWka3t22Yqc64rewrvNq/za7hJGDyUS/77CSRoK6X/7Pk5Nf
 bl0WZkz71FckawnlKTm2f6Yb2CvQKl3Q45SPCWpCj8utJUeossKBz6j80jHJtfr+z0SNnUoIfSl
 pkDYtMl8Sh0/LYliTsg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a059f6e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140100

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0

