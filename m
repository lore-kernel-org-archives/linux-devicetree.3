Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C763357CE0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023549; cv=none; b=oA0zfVMdJwIqLBRK7C+lLOmcsxeO5anIZt0ClEkiArEo47GjjC1AfxNvXTgKR1SAJSFVV2By8FEnil28gQm/CzivMPBBDbOPre3XzA1zMEtU7xKHji/aIorbwe6ZSN+DfOpibwKvdE5GDWNqHLJ9YyTyaBhBAPluzsWOPR6/vPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023549; c=relaxed/simple;
	bh=VKWRSEFUbemWfQG+OXGIX5arda6LIeITz85CHr5HnEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlmEhgqaPQb6ikHBjnn/FAwaN7zifWbFOn4gTQORJGwqhDQMusjpNVocEki0S3l+3Pc/zys/H4JSMqg2DGgN1Bcb0EFP94Q9hCnjRsPGWncVbeOdcDnQrUQ4YjM6ApWXcaIb6awHHe6NWqNtdbkRfEKUSd1Q3XqZK7yYG81i5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4VEri9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktB5fgaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4VEri9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktB5fgaD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZFw4005264
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=; b=M4VEri9mclUfV1ab
	MPWwrPTR4GQYzHwIVFo3HirhSJOiQqTDCzmQS8gGR/EmsqNVitu0UoVnXkVinkWV
	+in4NEPJFxe7XM1xdYD2+jxCHeVy+6vXw+ZKjrGlKKHc+C//sPFR2hQB54PWU7qg
	/yQP6Qo/p3rgglEH0t/RiuUcGCSQvXPSIHzfHqCUqLGFV2CFHgecAYmlihqWJT7b
	t6zvsviyVeQdYekGOIeDSSwCe2cHvOVPTzt7bkZklRe5KaArY0PuYOLwn6uMLv/q
	GvQB+nkRr+w4Ulpdgc/MSTgYniZyjJueUGH5eDSgjvfKqmHvSCeBWV9YviYXmSOt
	6QI9QQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cu6u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso93840745ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023547; x=1784628347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=;
        b=ktB5fgaDim9DAa6gmweNmoyn2NfRFKQ3vFD3KfvpF9uBYR6LXS5k3Q+U9IcWOIgTt3
         KXnbw+3LCMaWc0Q+jdcivTfudmjLwVDADMa4fLmZ8Ey81yXua+UiVyFwrCEWdN/Pdi6m
         gyaIjUoICgT9fwd3KYkgaPje1K5lIPK1n/Tu0jy17qEMD+2/XckgJU6kuV72Xlc84jDY
         eke2zgkiYjVBCA0TIr8P0EO6mylz3iyqhO8itwfoDhiPCbk4Zu0eWvwO83/KUh0cXQMQ
         HsnsEu8F6yqSmlSFpfopWX8gZD4xHYEYy6hAuK+Y+O/kl5AormhWFQji7MF4V4mcN5Jr
         2+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023547; x=1784628347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iCogDAWof12E6CRfCJqjcAH+F9g7nURKIMRduQn1mM=;
        b=DSCrc7xmsxIbvYhRaZ63KEMhfqlq6Y/2PHf9Q4cePPzKKbfc7JYSdFGAksi7TkOYt7
         2aHzHXME4Sd+bhuXTeYtENs4knRJQHLxM4MIzjG3bAWQ0UeZS7wGwEIvIhrOIRzHpiMf
         vB6T7ngsV9kiYgafYjvyxh+cwF7oA6rxwoxfKnxvdAWV0tKQUoUjx7utq6EFQX/2SX1N
         azD3Q3gR1/gA6Kb0evvkVil26a7GH1HhQ/9uKv5Pzgb/E7dHxwu1x44ZB6tC7yB2kKEb
         tcceHZHq6ZQ5Dcgj7/Obr8cIdGmVq6/Vppxe0V/bH2liPX56/x+h41QYtVU4dx4mH9uW
         1jaw==
X-Forwarded-Encrypted: i=1; AHgh+Ropv/0HTxQ+Dzmm7+OOtsh090KEkp7MYxvlSbSTtryAFrW5EQ4WtlDcVkvbsjGjKQpX8v+xjOB6PpCM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrqw4BYyK+wVOh2HOfHJCu9it3lNuJbjykg48nWRi6pe5iqNLi
	27OpGutZgknCnZkAkdLz0FSubHQYD2wSZaUk8+4VznWWdFxNXhvDqRiyMgrx7mKyCZE7OjvQRrx
	NuzUwWAPB2eVR9Jt0ojxA3blETpA0fZ5qUR0bUYkhTeL9bz++HtqsBj5zYAYgOPw/
X-Gm-Gg: AfdE7ckGTTbKM2HHWgM7L0ypVyT+mw4SwXF/1GvFWSN/QL8Q6166zb8xHwYnHx908dX
	Wa79kLNPqnJWY81ulepGXoceEvHihnk405mF17TSyCzzyP9mCP5T4XvTE9+j43H8oo9KnCfZwx5
	oc1h8Ydwm5fWmHhJ5/24YQ/hmFqGL6PBhIciQtVU+Z5s5bKzoFRNdARs6SJ7VWEpLrP3cX/ayDP
	R+ui5XrCjbsdwkIqLspruBPJatiIVV/tmd5uVwZuQp+Z7KdXimXarjNzcq2Q9QXsLez85ZdEa2o
	+gDNtvEDAPTmvxgqYiFueo01H4dIK7QvhILv9cqLx3Jha9z0ZXTlaV5MtwymAyT5cZDC0YhYqWE
	Ah6wy674QeJhEfUgBlfIKyntzrSb6ZadVqxux64XJ+98s
X-Received: by 2002:a17:903:3d0d:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cef13647e3mr20409805ad.20.1784023546710;
        Tue, 14 Jul 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a17:903:3d0d:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cef13647e3mr20409225ad.20.1784023546058;
        Tue, 14 Jul 2026 03:05:46 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:05:45 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:12 +0530
Subject: [PATCH v4 1/6] dt-bindings: crypto: qcom,inline-crypto-engine: Fix
 legacy/new SoC strictness split
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-1-06a4ea97c209@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: pIiK28WjTSNkxP8pVAjt_Kw8dNxjZj1f
X-Proofpoint-ORIG-GUID: pIiK28WjTSNkxP8pVAjt_Kw8dNxjZj1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX3z541fl27r+B
 1KhVhascjqDD5PiJ4LxjEhX00qb8Dqo69JtmhA2/tOyexY3aOzYnlvuvNHGPoHfwjeecvXaJviM
 xtP5+XWMGr8GfeOOnyqMQF3K9JDMKX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX5R+lRt4lTRCk
 mrvz1zO2I+zp8RPLmY5SO8T/65xukZtGAj9tbx2ewC5jySISolp4CW6d9ADInv1bCm7bj56n1Ca
 gXWOEnPLTrs7ymsDO5UePbxUpeeuwmS7c2OzkCXGSv8JpfTWf7i92s+IwAw1y3+kJqYwq/DAy39
 gpHqJuiz1zE26LCgtS9/GxBRnMgQrbnNoFtc+c9hKDdKp9fIWh4q84DVkseUlfGqNv8aYGNsw17
 KjloICUUFljkenioZ8WVpS6LBS6gqvkJ+7dO+2nunzPSpfZcs7uzRoEl4TV1PspuqSqcwxPc/GB
 Gd3iGZpiF27AiFV3FePDeZLbongQ5fNRwH1I+zlm81hgyQiSFiRumFBzz09AeV9ZzO9wNKZTMMf
 rn8S1z/DMHpDS1StB18Ik77dO5Itc5m4kDhkMYxb95WJ8VXMILEsf2dRB9hDuT0Qo4sSWQR3cup
 oqxptsbSIFF2t3GDgFQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a5609fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F4we2z5FY3kt4yoF36sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140105

Couple of already merged SoCs(like sc7280, sm8750, kaanapali etc.)
describe ICE as single clock historically which are recently updated
with mandatory 2 clocks.

Keep only the known legacy compatibles flexible, and make strict
validation default(of power-domains and 2 clocks) for all other Soc
compatibles.

This ensures old DTs are valid while ensuring any new SoC (like hawi,
milos, eliza, nord, maili or any upcoming ones) must follow latest
requirements by default.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 7be14e99be28..cce21aae6499 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -57,17 +57,25 @@ required:
 
 additionalProperties: false
 
+# Do not extend the list.
+# Legacy SoCs are allowed for single clock.
+# New SoCs must provide both clocks and power domains.
 allOf:
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,eliza-inline-crypto-engine
-              - qcom,hawi-inline-crypto-engine
-              - qcom,maili-inline-crypto-engine
-              - qcom,milos-inline-crypto-engine
-              - qcom,nord-inline-crypto-engine
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
 
     then:
       required:

-- 
2.34.1

