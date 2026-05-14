Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800A26A1CF
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790630; cv=none; b=fCEgn4SPiIjkNm/FWpovlhPtzDG0ZtSXyC3BXnVi7wLIK9PlFUz229xUC7OKm0x1orkBUmFkVGcy8BF1si9+gxQpLDpO2W0Oct8MfkOPYCH/C4kUIcNuokAUfkeTIslBxrfqAWUs8DosGNOmawtme+UL82gOSUd+EylqFXXzBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790630; c=relaxed/simple;
	bh=RvUqiWlt1Ergu4NMH0uwjjsce6vuybjCzM+VDSmAESU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkXUdY8Fe8PDS0GcNSP4F5lC9ZbuOOEw5se/AHPm8FVPSE5AJQV6aOXMrtNjkjbR7L0yYJCPp2Ax6RCO12/Pdpjs4ANycVvqVFCtIGMPbDuFUShGklkUpY3ONcMMsx7b4CP8nyQw47e7aHZGgpA6dfMhNbUmRhBgNe+OwhaCgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlGE6xjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4LJDzvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlGE6xjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4LJDzvP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpKmX3197968
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=; b=SlGE6xjATffQwsgQ
	9ch/9EftiCTdDcVvw1ld3h7vG4h1vZCc583h1/qFE7iwM8UoLohzOcppQXhXunq1
	RoK7gDYlTDS8iI/n0JyC/Tm6X77EQwIF/eME4JRzzgBXfRNwG/9vuXrdiM6wBXJ+
	XCqjYiplFTZcUBxrbbBFBWwb940kjHSYMLMeA2Y5HtCqvGd60TIaA1JlvLcrg63H
	a8+8mTvKQ/Dl9QauYgLu/YV1UwfANxuIPeM1GZVoYPQMBpBSnPl0JiNii4mvpf6v
	M6WjqVlsK/jLNpGCay0VZEnbInFerO1qUDC5zSvR8uzoEhwaErc7B7rX+2fygt92
	94Q3XQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1q8a91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8354503d9acso10634966b3a.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790627; x=1779395427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=Y4LJDzvPsBOhtBf43zlkTg/fkkre9Lvgz2IwTQrMBv4Z/S74bl/krWtdEvCF8HojhB
         amxfBe3c7jT28HExJp5vndYYUsV+iZMnTabzXumy3tuGkTl9X7YfLxsgHUWBleGN3Ftn
         hObvO+za4BMxv9kK8JCpFcHy7E99uSTmwSjk8INK5EIzQz4O33zLg6gzgxREWklkquTx
         YNMZvqtQGBXfatKul0LVO2NaDZ0NH8goAOht7lP/7cHFLs9rxNGdGzCwifdr8KhcqKOw
         oPk15KWOTqCBPqdhTZMQUqAxVGZ4pLNqThmOmS2P0/Cezv6WvH4AcxNxtl4+2gZWg9bi
         eKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790627; x=1779395427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhsrID1K825RqNqJYg3J6AtzbVLQFOaNS/VEzGY3CqI=;
        b=OyQzNL3G4S4rOqBbP4tUfD/XxJ0tP2VlUkMwEK3TKEYMqdwY+EDBU/DUv8cQhdDLa9
         sK3ImNe2YcQN6+PI+69SusifxEOXaG2aTpxl8bewfymwU6igVwK3214dr12NCmS718/t
         cO+Smb9+0GyfpLCigFnVqv+rjZSJuw5rSiDCS+U+eX7EcWp6kxqOxSd5wUWGshcZgvxo
         Z0I6wICCaJkFqhqXLNF/5HBWzaRR97z062jydMl8YRm91Q2B+Dw/a8ewDMMXzCs/dvcm
         0sMQNzmRhkjwaqyqMd+hpyl2LiaIR2R0WYMfqrq3LhoPSiABvtyY6pvwaD6GeIOs4VYg
         sbvA==
X-Forwarded-Encrypted: i=1; AFNElJ/d+bcUPcUvvHSs8oYesbVv61/Uf4fmEg6klEQXro3xW5o8PUMyD0Q74vkrCma9uGp2ZeH49DAG8CJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBXjjJjkU50/Fz5wfxRjHuh4VLA9tI5Z728IxMlDoKUUqyCby
	RdtCNM7o1GRMIfXxRNzYZ8T0oJjHMUdfVLuryJpzSzHch2Iee3GkubBFJj3faqPS3NRQZZPKY41
	OzbqfDBzwNedk2i2vpqBAzbp/VE/UjgO4TUtWcTxckNMnEI43G6JJWZ8gedc1pLFm
X-Gm-Gg: Acq92OG2/3mEp3FtJRvlbaPOu0Q5AHERYx7RWwwgmx3/DXYJnUF4d63eXJFcj3y2Jbv
	Q1TP2eD0IcSFZSX0z63s2GZwFy+CFVCHan9CUrZp64gauTylyozsXQlxu6bMJaD0EVOUjExm7Qj
	C7TAmGoYbnxPMlgTXdZCEnpfWJ7KZ2N7ICJjwXY+DGYnyMRVPf10YjIYPZvL+AdOVijjAdFmHRX
	uboIDbVgOHJvhw5qJvHnsHcCCUk22lViNK7Onqt+lo+SYHpBZ6JsqdUj9GoQDWw7Q9P032k87bA
	XOgYKTYXTDdzEO7+PF9UvkrdYHI/3skaC/U+ZMJeMszCJtXnutU39GXtlRQuT27H4f393dz5Pv8
	BvEZiHuGfy51TPIzdXCSCdceQhj82aTH5zVyUh1Z4x+PPBqWqFIc9/lM=
X-Received: by 2002:a05:6a00:3387:b0:83e:2eb5:b196 with SMTP id d2e1a72fcca58-83f33c344b8mr1153369b3a.26.1778790626817;
        Thu, 14 May 2026 13:30:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3387:b0:83e:2eb5:b196 with SMTP id d2e1a72fcca58-83f33c344b8mr1153333b3a.26.1778790626335;
        Thu, 14 May 2026 13:30:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 02:00:08 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v1-1-b1b6ced70559@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
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
X-Proofpoint-GUID: K0vOvyZJQ-g0hIzDyPo0sCoMf_LNDfKS
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a0630e4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=twW8G0p2hbz0t8568-wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMiBTYWx0ZWRfX72n264Hf5Kpw
 mjwkjX9TEPxvo0QBmD2thUZP5cAWVpOolycO7GXMGvwzyH93m6KxZ2iycC1T0I7F+V9nqqyKIr6
 AyfSQseMMr+Uh5Eb2ua2XcaTyJra0aCPEOy5qMqCyubb3x1Gc3UAgcoT+FByaR7iNSQxwkM7hM7
 Fbphl1tjHmjC149inbKDi9BtJm36LvTdgMvDSCqNOtGu316I36WIXYNA6Fz3AwalrtchYNa2/dn
 g9zvsrAG7dCtbXF3pPFpDmpp315c1YBVnP3l5PIF7rxG9ih/GofXfUFLZOHsRB27m6HsuNeF+ZL
 wm3grAEy6VSiMiFZhaNPQOmSknFGhQZ7kjqYeRG2bGnkVPfAP442izUuZjar5j1kaq0akei7m0k
 Fk932Mm+D3SZ+hjn5vNh3cy81+FG7Vq7ZzvkHui/izew80WxF0//xZpSzeDqyQoCdjnboewUtyS
 e6gC3AbJOeBC90kQaRQ==
X-Proofpoint-ORIG-GUID: K0vOvyZJQ-g0hIzDyPo0sCoMf_LNDfKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140202

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

