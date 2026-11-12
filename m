Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487906;
	b=bM6a14m5/uFMYCTTW0hC3g2qUAR1Fb/M1Gf7KYQBxAeYJ7Q2XeoHC//FiuMURwvC2lu4
	 2dz0i6fzeWfoqvFLWa6h2qTlSYTp7zrkrgWi05nTmnaG0mbkkaZQfdPHI4/ljJFo+hIRn
	 znupUyN+SsvNelLpIhOGy3BnpO+i/wj+UW4/0DSG3NqZYNce20AB+tP7ZGFBPRBGB64LU
	 7jDHvkcMsoIyvLxrUmOXILFtG7ZhIPdoW8xjOlu/KJKo3WVdVDSs7b9u7h1wThr3BlyJB
	 ypJzgnUUgXJ5IDPWRoo5xAEUoYDT0HX+GWmxjXNqxf0eWSHUjTf91PZOZaJc1XSi3dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
	b=TQ9o5btdXvtVkibUgSw/YhRqU5oX84l5Da9qgWHKn2IQtylDkd3fnhCpAHGuXF0VmhPs
	 QSE542poa+zbJ8sqbzVhrrUz5/qDq3fiBJkx13UoeRn9aX3dcqh19x/EotglOh//9Ztt7
	 DR7lsDMUXmHKj6b0mdEqnpBd3JptfIxqusiDzccBt4ajJ78CAju9wi4zfokgbma9xp9kB
	 vUJdW/SFtNHAP6OXU1UtBrkgCfZAYezPJFArVYT02l0iVna+IHAm+blYZC/ZNmZMnl9wG
	 hEl+uJJrBsj8OxnkYCPbhSSvPtG5INjyGCt/u1AoJJszphaBCsgPD8vBk8mHbTOu6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FFB606A332
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FFB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iuiQ126100
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=; b=AimTuc2Yo9yJik+V
	+PM6lUNbKSS30/q+gCO4oJLZRjVqDRk3xFpQPxLuGGu5XzKf3gDfyyWjn0L3TB7O
	1dzsDAGOhNkftxBUeWAn1mxEtV9EXRx4jEzUBVhtPjnqDZL1uR7H1Pjs5WZUGb4T
	tLVs0jA6laI41zLrqaTCAjIL9xSBV5J1u/QofStmX4fshJUw0rJzBrYratRr6pcK
	tXyJ721YUIe1K+CGhzPxY1zBM3/u8ajzDDUKcUIhYBLLSK4BrkxdTOAsJDuXaGIp
	l2oQLVuMDwmbqdQGO2xNdnrutq/3sv9lT4qb1ME6mQFMtRkZ9LBcfrkivVvzXtOH
	DNOB7A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a092f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8520e83f715so4609596a34.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487904; x=1795092704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=WHL1JtWxsFZoY6QW+h724nFvARRjE/mCmVTP+TlGS41IAcp9Ypq0gjnWASBB8umgB0
         yAya+eq/mc0ZahVrVUcAItpQO77pbxgxir9VT2frV48kTql1XpC+Xb5aYYGILN3iMDGi
         nJwAAkJRWK67IEDobXVJGPG232XVE96QS3BLuE3mmZ0Tjw7PRfwpWzuJcjuZ7l2nPb0i
         VG5JF05pzO7ouzIehPBEoUvUG/uoW6zjiiSjEjWcufsXpra+qOsb6rvn9DYUVbRE6DKz
         raqdNqg8SeM9okhDPf3fHi9UL/E2Duc2ATBvMcu9gtf9Sw4ouExuUG6lt6hSybJs+gTB
         TMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487904; x=1795092704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=qsW0/MvD57U7Q4+JMrlBhf/LvbXF6N7Dk3kkVrIJ2/UqqRjbbqYmg2TtvieL2cYJW9
         qH8x8IhdKfC7Jhpxa3RIc7Zvfsx0Tea3PssMDIg6/ye0rthjj4DdcgZNVVzEbSq0x7kx
         ieiRKJmiK3e5ctp98O6kh6RE4KO7DpDY+kKgqDSl0zemJ4qtwng2L9aUtpIwJfCe2/FN
         AvqQikVgq7Le+nWu4TzjXHFRjNlqCEzB/ECMn3PwPY2QMyOaC388jEmtwZqp/T5kW5sG
         FRqsJi3eAADHV8hw6AbO1GFvb7eS9kx837e1Zd481CyK7DfxKkZBI+b+xzg/qaLqp3ln
         W+4Q==
X-Forwarded-Encrypted: i=1; AL+hErFdipBicYBcZiklNG7egg5iQSori/bIv1kwl/5tjApDVvGRcweoUNvmEJlZ7JSr5dYAVBSFzrG0QRo0@vger.kernel.org
X-Gm-Message-State: APuU4Z/HzNsK62OVXdwojgJzMpxE1Y7N7A3j9F35EbGgN7tJVFGVgG5D
	RaDTgTc7xrlsb6Qi8AMV/oJQcVhUujvoY1gZUUCd5/epkkcpgmd3rBmQNwmkhLm+Q/CIZzi7EHx
	UcE+o0Lj/A68OoHvplb0dsyufOumbIGMWttSsCbxmWD+43PpDKPusAEp5IwqVT9qv
X-Gm-Gg: AYBFou1P4d7EG8As4vSAt1ZV32gI1FbnJ5hz2U76U4wnEiIWq+yErqdGte0f/TElTVw
	ILf9uN2HvZOjtx7jH8Zzll/+zQKV1Wpdn85rLIjPdn7DYNbWdxVeYRQoAvHM9Qr+boSytIIMcxQ
	LUKs7segOxbE0nqDc7vWMiOWsA1a3NaKtWjCz5xZPPCKSpMcYvnh8hG/Hoht9EfAi1iKjX0EMXd
	yD1dEgQp6SHGi49ZJ3umFbORwg2Gkv8ZXTlCnYgEuoUYiKHUDFGwz3BfmWA8Dd+QyAXQfjc6++J
	BkXajz/Kw2lDQwV1TQhgVVF9Ij/txqgtDemLwBBm5oRt6BbTVbq2S43sm4YvcvGb2zRoZwGbCQG
	kYMDDivKyjmXVervGUXu1wztWj96wbzRavzBP8Cg0+uSc3jDAbyR8HsxsIWPZLf/MCNDbx63XGz
	QkljP9wQ==
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593998a34.31.1794487903776;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593973a34.31.1794487903345;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:42 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:21:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261112-shikra_qce_fix-v2-1-2ce112cc2ccf@oss.qualcomm.com>
References: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
In-Reply-To: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: WyAkUemeGzLZm6AeJILh1fDENLZE7hRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX+rSEhVeww+Uo
 8YI+SXo5I+l1wpIzPOzaFXANgXAQAIb2UFvBm0dGzkLcmmMl4gO3oC7nayWIq7pqCxLnVxuvNdq
 jnXYLrcw84zNkywTV2Y3DCnXUDEe1T+1QkVED3I6JM8AjDw7gDhqXNVL3FQiEL7iEOrzMgM4c3u
 HKCOkYAuaxpza9w26Ey3Lyb6NA9gFoR0NnD+jEzuBbdf0+T2akEjl/tidiVS76sQfbkn1RibKW2
 tDiYPd9bvE/qt/9Kj67hw6iO1ODLJX0SBx94oDQutDA7TOfAtRny828L+UT98GWSC0zD52CG5DW
 ijN9l0d6U3qlgTNVZwC2kbKBPFeligmmj5uTlAd+zI6jhyYb9+KBnqyMyiW6YVIJKjfLkJlc/c1
 Q5uXjfUPEQQAIV+zVR0g+WIiNBd5sHbqVmvaJCszdEhr0psk71OrMr9oouZJnSwQ90Iij0gSkHb
 ssC0SomWuORKU4P4WzQ==
X-Proofpoint-ORIG-GUID: WyAkUemeGzLZm6AeJILh1fDENLZE7hRB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX+I6I0APSDt+Q
 dz7H9ZtPRwZV9ZFOx0kX4KlxjbEThwh7bZiOko5Fu/k0xADt+wbCVwL4zOLCH3uXNosOPDZMR8U
 GK7xxi7XSXbMdV883A4n1zFLjbYVbdk=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b660 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

