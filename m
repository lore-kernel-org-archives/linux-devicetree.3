Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43746AF24
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841996; cv=none; b=BbAsn6HNls/Vl/d7OtM2va1InUaxgOJdGRtq3p7lSMGvry5x0x4GKQ5bRGbPeSKLRutiB4I3TsllHtdsRXELtu+fQYGKzBu8TH74+JfKLUyBBBSLcIEh2CV7WGEKeaRCz71A5gXwWbuATP2Ugqj+zVlNk2bOIktPw85/BLQtFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841996; c=relaxed/simple;
	bh=RvUqiWlt1Ergu4NMH0uwjjsce6vuybjCzM+VDSmAESU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLNtPuMLdwGle9QSq+FIUOL6Sm6ahK3alz6FBXj1vQyXJbcwD96RTfGk5xZ3IKd0UkiiUAAFHWL0fI9vCylOQCN/ppXTGqhbUWlRUoB0A+KsfvX47ZXZkmITIr3I5pf2kxDb+zYXOqjcmat+DJO6SowpKA1SZ+mn/s+wRKvnU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSFDzNx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxy6c68U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSFDzNx2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uxy6c68U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5JYTf2676441
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=; b=XSFDzNx2EAt9otdF
	jLH2IsOwbxjwAn29icuutrWK5wmKo5Zuap0yz+fyNqXRdFMiOKpnIdG/LAGKiSAF
	EcUr/+h+xcXrQUG+XwAzWTUzNJq3qlpws2rEgyZO4JUs2le9TcSvAtKLneGhQevW
	MTyrIZqIWlag3rNoLDRrBEszxvq21SSUX+juwvdk53nwb+pLIZQYL0vYcQ8Y1Of8
	dtfqrS6VCJQe8x5ueL61Anr6nszWz3zYmMY5qdNDK1gSkr3boot52NnVSmCHg9v2
	ZT7o9met/8uIC8qsrBU/rZLC5ihSesScA6mL/WEpoRlFpaq5e1vBPxCGu63sMJgT
	o5NwBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtwnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso14219742a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841994; x=1779446794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=Uxy6c68UIzQgsl88ZrdPerSxxavLm80/YTDc6X2v+qJchROY7Bf0ndE9uJGo2+rVpU
         avYAliqugeuobEOm7gjukYMmrvFb1EQLaFhhAlC/zQuuwOjaTEAsOK2AM8S8QT0v8D9Z
         nqD3Zd3Agk42iFShVWyA97m6v9zpwZ6ec9hCxNyyOnF9dgJHjni3yJTrK2mQbkj5VxAa
         TMKgw0Ad5fBlQxGQHe/tna920o9oQfUwNKgh3YjodTb3PBbytD22F/fEIWSuW6tm1qEf
         yaGTF6EMAH5ZPKgvjgHTkm+27TDMYxwApICSuRtxgiXLRiKeHcemCiT/otD1GvhgtCp/
         HMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841994; x=1779446794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=p//BGaEx+p0xlkiTPrPCJ3fI+kHab4uc7labJq2gwJrj3b0SDnk+oF1fU0oSalG534
         XlPvoqIy2avoWtmY3ThK7olR7en3Ekh2iLlHIos88OQ6CAqMbXyKKk2+94jlMqP4bL/K
         MKRJI5hAte/9Vz5l0Hk8y9cokFcUzLGy6oEunQfthZtddgpbdAyIlgnZTbi64pVVUE+e
         N5tRr7MaQnXxWFzcPR5ebZOYNm4CJk+/4Cnib/0dqyG48Icrt7Y9VwdG4adVGhGSbysJ
         Kqu5/0grtoovH56aDliTUoIMp+8RxuLUJ31IVdRf7QMa4u2rvny2npG41G55oZbm0VQc
         rnJw==
X-Forwarded-Encrypted: i=1; AFNElJ/CXrU88ht4dLwkdopA35RK0+zkx8jQ+vut38GDvFnpc05nhOUxvC4BKY+TGs2A7VQildzzQk5BRfZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpCqt16Y7pNNPs3FKVG5GQs6P2m7D5Vdk9j4g3njDC4qBTEC/
	D+luaUD7Fg1OA9fAQrepNmA0zw4XRbvSXz6jDQXpDIykl2pEGm9Pq9C7mYAKa/+nVfvOl/a+KEA
	A92kA49MCzRmD8xzpGWCnMTvwujSpq9z9ac+jsIMBtyYI/k+7Ta69g6lk952hBLFX
X-Gm-Gg: Acq92OHJPbPn4PURmmfrb29fYIgGkspmIVRhATWx7HVR+omHbZDac9qpOXMaROfClSZ
	ifsE6usfNqEMIrabctfyqn6C2e0WUyhSfHMvFJHpy6D39KdzujoaLRCPs5n4cHXy2EOhh8n3wKC
	+ncVa4Sm9N+XPNwUnIbCqSV+BJBFsdyKgaZ8s96iuynoWfMDoPVBSle3hM5fqe/2ZXjY7M4iAWN
	zaSoxAkWr33CsBOL0BSlrkDkGoFtaZR8sgbzAkA/c8Ucz+27R8wVAKovDAg/fsA7XYFyHgaS0fa
	FlBv9IENANt0tcnIPA9lowYek6YwulbtGcPH4pk+m9oElYBXJl7r8ypIPKC64g8hqoRHdZhzAO8
	/kx234FBAcMNQMP4vkyQd+ZNk1TmwqPK+7ArjKlLDoDh92T9B16L5gy8=
X-Received: by 2002:a17:90b:57cf:b0:367:cb53:7438 with SMTP id 98e67ed59e1d1-36951b75d0fmr3702492a91.15.1778841993933;
        Fri, 15 May 2026 03:46:33 -0700 (PDT)
X-Received: by 2002:a17:90b:57cf:b0:367:cb53:7438 with SMTP id 98e67ed59e1d1-36951b75d0fmr3702457a91.15.1778841993393;
        Fri, 15 May 2026 03:46:33 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:32 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:16:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v2-1-2724a54339db@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06f98a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=twW8G0p2hbz0t8568-wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX/7AB0fpSOvNz
 pgs0sWHaVXQI3iZCZHtayhpBFN2Atp075zOoBqvCCNGeVP2r9+G3HADqPkI1XAvHXSjmHsaC4nD
 su+33AeEzJU1xTJGOayRZ5YIjD6D+KZuiIaqjQu6Z1E40shD4gr03FQ5o8J0oznkJTc2nqVKUZS
 JjTAG9jYtwShssEoEtnlyfdqrMTZvnGePCTqpBB/JUhFGSu8r9+wBVL/gOaE9ltiS2uQO5hkLTL
 rLD1gMfL+nbRDsJQbFpmKjzHrtzbmsfnwFgL9G8ReLrwQTVE8RRYQSXAiqdyjuznSAHuFjEJtag
 aQuJfZxNPO96RwAgqfAGIYSksW9GfcXOeoQikvugb45izOi4UJ4jrIRcdoM/MSvvOt0a6LsvjRb
 siZZOWR2N+Sb0wOdgv+tBvEdImX+EZzviUn2sBVHixztPXtOcp8YCYC95M/JrrWLldtE5c4KiD5
 ceHKt9Su3bw/M5QdAkQ==
X-Proofpoint-ORIG-GUID: genD0r7IdlhP-z6oJQfsLEmOD0u8nNCX
X-Proofpoint-GUID: genD0r7IdlhP-z6oJQfsLEmOD0u8nNCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Document the Inline Crypto Engine (ICE) on the Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c0b083da78bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1

