Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA444BB27C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070206; cv=none; b=fPF5iM8msRnXaS4IpZdZY/FIpw/RejbhY7g6HdIKwO2m9DUM3dK83t8wjCrnqUIq7Ik3ZACEfLnUsV1J4W4WFqQvh3YkiE4H/FLyO3P7T4U01JkZTukT1YXdkzjrqVBDDIFhIZOUaGJYMJvb2fZxhPdbiWuYI6Hpt8ElM/OKD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070206; c=relaxed/simple;
	bh=8FpQYJUuPKkYwoHx3NJMkG5u8wrpVgNGMsqjtggKG1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8+oIPzApcfiPBs6VpigBmjxa18hRn+GCrvpm/sZW2OnlJYOAhWvL8x2/aRWoYSijUiGueeDJD4atcA9/NKmWE9M78FmdmtkCdNENhaCtAq4JY/NIrYZCNKUCU6iPh/Ei/75/jZnAraBgC0EPsfqLZnO396Av6d2nkPdd4O/I3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chuXp4zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5e6neC5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chuXp4zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5e6neC5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M74xop3840691
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=; b=chuXp4zEBIINxdle
	eHPOF/tYrxZAq8dH3QmqxEE0tE3CeIvpF5hoIPvdIUBH21MvbCdB+ulUuXmTeEFg
	XGmmCX4/LoaaXRNbiZAKuH1B3c3s7ffk8BYQe0Oth9i7z7FECkSgJVx5sc3fPPht
	lkli51Ms/SLF3RiZO48hzRhNjNr6LAicMu4IAmjBpvZOULEvb47e5oRloY2Vkp+W
	R8Sp6H59zHARie8kTJbGfFZZlO5XEMJ4q5Yg4uPJjBmoHK2qcM2bj/rkF8rPS0qp
	tzbQL3AHHnbEouXd7LeKj3CDnYPblZ+vdIsXtuCMrWNCqC/EfB46YNvqwnsOdspS
	K+ijLQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v53bt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so3305337a12.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070203; x=1790675003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=;
        b=G5e6neC5nEXqhoHYP2O4mL3TfKsSr+7ZiXZ7S7l/EAM8hiXMYsr28sj3NifTdbWyet
         xhNzHd0ds11yEqP4kBu/AwzV8mcbby4e7Kd2oJRXbZDqfFc4hlOhFdJchmFhd8yQRrmy
         VePbNvhTVhfxNcAmpNaWkViATCSffd+i83ds3WfPk27aB5gDe+spqgdQvYCmt9S3My1G
         hAXtxxixslrpkOsFMpgUqgAYBAwzw5L6MaTUn+RlfjU0SiTh7vxTz5nUDMWqglYqWEmx
         seCKB5Yd5HjIK0cpbkK+PEnukMA6hSwsg809uAPzDdOy7zJdOmaF3VRbCw20EissIlgf
         OSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070203; x=1790675003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=;
        b=DyHPAaNxgG10zZYCzQYH0VaOBQydgdLV0hSZdCl2utj8u23VWEg7g+um3suZCRlgel
         5pjFJY0bF5+HHrds5QpLsXso1FQTrFAAjF8KMi/yIXA2efZb8SNKoQI6VcHeipbckJe/
         xYPg33z7v/pd0dAtzEB/AyxWVK8gsLnbZbt1CX+OgxZ7ifrP9re6b0teGDQYtWNR6sV2
         zRu1oGicNlzkRMw6oaV7KfjUSrrOvDvMgfIvSvcgfBQZKwXub3K7MVmhwmQVMKKVxGfs
         3HHUBj5IdbTYzYCd2LJBPdnArQdR+kqOdGCmXAsBhj2dzMs3gfcIH8e++W8SZ7LP7IBj
         mYUw==
X-Forwarded-Encrypted: i=1; AKwUvBz+J+r2tJk6T63pbLw+/XiNd1WF5Us+qIhqVI0oub1AAqZfcjVTXYbs91Fz7tzq/epamgHepg7UTD1H@vger.kernel.org
X-Gm-Message-State: AFuF++kS9cM4n5SC62iDeSkK/FWoDFfgm7RcGwbr15ycsElPbVJxyGzK
	L6CCj8SXRA+KoA5RT8PxemN/dbMudvRD+de5ce5vnV41RIrAVZ0RAHKNhXjezMIi8y/G0eoZYf4
	iBdgjVEhGUyF3efVGw5Rr9EYMcqKVLWaf5Ea0Pk2y+a70IC+LGQyKgpSmUM2vxQye
X-Gm-Gg: AYBFou0gWHxSigcWhk0JTeYYIvZSo00FgugTVpPB8muDSWQUj35miWLUZhQIPPcLh+g
	9r0hDamjtjDD3OIWNAvXluKwIkRISGmePpRzd/AFjIIM3Dm9tUdNFLVUYnz/uLHYBEsP+zRiJw+
	8GIWMZVrXr/kAizEEbowqk4V5Yo1i4JaMtxRMeEIY5zBsE+jjHvDShSpN9PgNpEhncvJveyxqPd
	kUskDPzQeKtSDuNMWdEUL/mQRxHu20ZRIhcZttWnttEExtuqmKsxO/nlcBzB/oYubzn6JkfnldC
	qBp0F6NgX1Nw3H9vaKAMDUOK649EoR8yGLNMNxJUVy6mAcwu3Ny/er6j8hsyts3dGY1VoPXd+94
	3Z26eL0ci3PcNwzHmT0a+TibZ0Z9Ey2fOZZ0=
X-Received: by 2002:a05:6a20:e390:b0:3dd:a196:3099 with SMTP id adf61e73a8af0-3ddec80dd98mr638752637.73.1790070203091;
        Tue, 22 Sep 2026 02:43:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:e390:b0:3dd:a196:3099 with SMTP id adf61e73a8af0-3ddec80dd98mr638729637.73.1790070202659;
        Tue, 22 Sep 2026 02:43:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:30 +0530
Subject: [PATCH v4 1/8] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-1-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=2711;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8FpQYJUuPKkYwoHx3NJMkG5u8wrpVgNGMsqjtggKG1g=;
 b=7FIfV0k+Iv9Jo9FJMNSSqjVi8WXqPVOh8yxleuccMIIcWMiR1pJZy3H9YtWMwHPo7n/FFgucb
 GT9yd/pEVjwByYC3zd1V63cvW3xe72y4rMoIefZaSx1hmpVFf9xO1nd
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: DYNeclLjyWjDdbeKUK4mIwJwnuy6bnOt
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab24dbb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXwCjkDDUyYGp9
 W8S0kmw+9GxCMybBq49HcBdQNUcyJqYkg4ooLjYRAJX3TMikTq03xT0RR6nBKncKWENfFKt/fya
 RTqg9Ul7n7LB09jYV4g5DIVVjBlfv2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX1dU4nGNcAT+E
 Om8GKZn11csu4WOIOumrtyK8mIaBuRrlngnWFjsy9gB1SFu1GcCF8ErIkrGaml/o/Deu79z/5mg
 D0Ij//B9EvkzaYQEEApjDvJarpeOj0g2hrhVDNKvD2Y0DTNFp0blfeXOIsnlZ5ICguTHSspzEET
 vJPNbWCdXdzVW/Aq7AEn5g3YZKZmoT0nRw2UTzW7R8T7oBhbnCqmNvTQQ01fVcyKlrLqobuF9ux
 K33vPOs2rXKdooiVqJXcaFx1mk0dswAM7HVu83c2pc5qz/UKuYUBxDKaTyVqVSF5Iy+z33Pdm9c
 VlF/ZRayTDOZRdDiwQzJQGQNbf3IFT5l5fv4IuKOI/60+j5h3VciLrzOd58UKtLYcacADUqEYp7
 M76QH+K+JOqjOW/GhvLuxs4tTxnwmbkq1/KBa/ckrLNBeAMwuFodBSL1pN7h5hGzyE3CjcHF1of
 ZCCy00xqXekepQ1ZzOQ==
X-Proofpoint-ORIG-GUID: DYNeclLjyWjDdbeKUK4mIwJwnuy6bnOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220139

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..69d7b7332d36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..683ebf702ba8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

