Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968BD3AC0CB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772410; cv=none; b=sAlIO41f3D3/5DAdiKv7X2X2lFh3YH5Eu6PQ4g0ApJPmjSX0/zeU3nEKNkqBfWSALGHS5XbpelkSCJaxIVk9eAO9yRmRt4Ck//lPa1c6YxI8MY5SyZr8qIbVpW2lhCb7sbWgsnpsoXFHmwviFK93CxOkQUzmbKb+VeDAWAGprKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772410; c=relaxed/simple;
	bh=XZdAZaAtQcyYAGB3DQOfoExEp6vD9CjO1J15n1KZgCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzqxpI4Ay90kEWaBAToWhbri5DVX07GfV/cUNbc7PlPz2ihMDpm4qBuLSUBhFEfPXqj2kqt2zLvUb+q5XGsoGiZTLH7NWovY60BJ6qufXI2cXIfC7Q0DO3wDknJnEhP4hespp+fvGRDQQWFpgq0tWHmfq5PjlvbH3OAmMA2Byik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgA8UMmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTs1Cy/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgA8UMmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTs1Cy/+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2n6FX3658429
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hKpCmYx1/VB
	9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=; b=LgA8UMmfL9/sv0VCOAl/QrYWTaG
	zq3N26UZ1anXfl+EObetK+QX6a17omhYFCUbfoeOx6IemhdT6ddIBclB83M8N/hX
	pwRrl48PJU+yUs9/AFp53Ru1mKwYkp/T5MDLmU+MydSpj/rwwzGgN9Et5n++ulFZ
	R9XxYCweYy4gLvkmKSdeJEtjhqe+JTHMdLymFZqKr7Wl68NVbyxnLT2wFAXZkOcM
	NZ5JNJjo2Ig9sBwkIG9lZnz4aieAjdsTgh38F6apbU9o1eN82OzUxOFjYffaDcon
	SK1rv1NsGryo447B1HqvzpcZSf6zGryXvZCdEgIiPxVLr6nLOysYsx7Q/9w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqyna5fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13536592ebeso2361379c88.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772407; x=1780377207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=fTs1Cy/+fO/f8zbhMxVweDd6g4X5/Dg9stQfX8JNLgCM3xSY49P0PKHxARzPbtftEg
         oTMOGzlb1Jii50pLYmuzz342tDLW3wKpdhkMu3nns8UPUe5jI3a9eqC5g9BFLvwfs35O
         cORBoTuzCMwK8M5ofXScKHNX+sjVdBh1jRiP46e3ntaNMAELiEal4P6KAXQmwgfVIL+k
         F/k0Sl861thIVMBKWN3ure/dJOlrrjXiIyitlxkOkiaE72VbbJBzd6W6F6QzncHoF45M
         AwHomWTi0X0TDk39AFTCz/ZH/NbqKX3Ln2pKo7dh1drDXqqlxb3pIol2LAH8Kmkl3MRy
         lUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772407; x=1780377207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=P0WiN7FOmXOE6k0KobhAEnNP7oT4f9N81VoBr07WerrDFFGgI6vBFtKTfc1Ty6eBef
         JZ5r0+0aBO0J5skylB5B9PlklIPEjRJ1Hgppj2ky/9TwvAxLAtvdqiKTTnQ2dbXx49QQ
         S1DoiNUJ1a2dRU1E7sd1tnYESmanuGrjV78+C+TUTvr9ma8KYITWQdG2aBn6yq8b2lYc
         WH3I/ZH4irbRU4085aCShVkd7SoGTDTsEKtcmVTj+biOiqdG1ek9Z36Inf0W0zzbWv0Z
         ZtnVUb/oZpoiXBx08QGLewGYi158Ue2DzoH43kSt9RB9QbmAg/6bwqUI1/7n/wgKm5OK
         g99A==
X-Forwarded-Encrypted: i=1; AFNElJ+7kewoFlFqD+Br52w8FwzW+lm707IAoxZZJDxw9eytMWQZfgP+X5jxqMqJtMr34iDIiUoZyOeDZHWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2E2xef5LUX+A/L+pzuLE1beIXHNQOD3yDNJY2zvNvF5AIU+v3
	QzedQq7gcfEoiXzHyjN4pZc4x0udoVVITZMAQUZUV9wFqdh8/3s+xkuvnEEyauL9oWvRw2AQw1A
	WHrQe5AGWV7lL5dmZjbVm6nWos0zmyKc7T9p6zmHvJHZpfHcHwbafqcLqpBPcG7le
X-Gm-Gg: Acq92OHd38ZPO2P53h3lICtd5J4G/ts8uwUVjnB1aS+PBKBqwkG1yjy7ySzyKJmtYNP
	rTtQiFNvTVM+afyasNrMooLFVJICggiAgJdJjmBGiP630t9iBvrTnpic+kIsQWijA8N017abY0i
	k1QjgYOR/pQ6rZ0+QFBPManKXKWeBHKGW2eFGU+P8hOOVWUWQx0XzkivNf7tYBF75nXw9DjAYa8
	zaE/yxvMiS8wWZdLkkO/gANxEj28tB3snX7/NtxyxzBAMaMxoe+pUbpcR7dAVjNH/45oUdDzqh5
	VZqTnQmMQFaeDCog0CrzJmU8C6KeVB16T+45sgTjjCnEVHSwOeQ2ne5AC4n42GCSq5JIj7CsQKI
	3nRk9Pot7iVrRtiSXVp6C8jcy/EyUuqhoaRrwpCgUh+W9J3csDW/4LSIwhKa4fiPoJM0F9Ta7uS
	8Zz3Wk7w==
X-Received: by 2002:a05:701b:2914:b0:136:8957:a669 with SMTP id a92af1059eb24-1368957abf3mr2628243c88.0.1779772407479;
        Mon, 25 May 2026 22:13:27 -0700 (PDT)
X-Received: by 2002:a05:701b:2914:b0:136:8957:a669 with SMTP id a92af1059eb24-1368957abf3mr2628227c88.0.1779772406843;
        Mon, 25 May 2026 22:13:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 1/5] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 26 May 2026 13:12:56 +0800
Message-ID: <20260526051300.1669201-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a152bf8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: YXfKWQLfIAJnzL18mBq2EOISGQiEzLzr
X-Proofpoint-ORIG-GUID: YXfKWQLfIAJnzL18mBq2EOISGQiEzLzr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfXynohaVdxkyvH
 FKGbaLcDS4t1HQ4TJhSph309Rib9HxbgXoEJPdmRa/LLBBWlIXUgFUewJ+kS6FVFihysNJW7nIc
 DUPkYvQN5OKE2J9A6qR9/jFrvneT/ltH+PhUxaK1YX76nPn2Qq6vbnm0RejCdslJLwPEYno6iTS
 2+bGt/SY7F1oa9RCTJxyNg01ZwyK+x1Vyxy0l/IGnjznIlMwkwo+Qh5h6biy/p5VbxD/p0Frmj8
 U39OCCJVaPrblxC76xY6PPVS1CgciT7qsLyYuIEs6OLswM71t5zqwDEtKwWpUXyWWBL2U03Lc7p
 8Z14vnL07Y3v+banD2yzE1Jxu4TBlZs60+P+Li/TzJg5htrSdJ0wrEDMOP+rEVXVfxicApLS/nL
 lKvCnfC9k5mH2Sm38YFNbZB1VJvzckkRyY/+yD/y9ffN5YFJ2MSGo+m6785CZ5AXbUw58rLWw5v
 Qz2Tx05SqZsrtRD6nUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260042

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0

