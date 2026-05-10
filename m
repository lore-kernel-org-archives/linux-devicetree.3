Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9851E49F
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778379510; cv=none; b=OgqElydP2SR27I1uoHZyY6PeHHCpUgZKGqynl2h1Rvmp6dyxTWbT9x14Jav0bRJQVnP8SrLC4/hJxSXgq7aB4MQNNhILMsvjrvN0fp1JUmZ23jsrNYurIbazpanBBO8/vBt0ztQujtymA5OISCKT+9IGhwVUnH6f0twVeoPxPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778379510; c=relaxed/simple;
	bh=/V7DicQaZr6wCX6VuoEC1W2T0ZF12u5EWIfNyRIj0C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/OH6xOAh0HqOXNgSIH6NQnDc7C7GNIuGb0OjAao+uP0oGGp6NOIXs3lNrSkWs5ZZVioSzVqdpf+5sFvHdcX5KGBAIn+nb4tENl9hwa+CWF4453RGKDEbcE7EHWuil5A4qbWEIiqY2E117wccj+NdHNxqJ8ZUVDeJuiXmPl+41M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOhaBbLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIQuA5Ty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOhaBbLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIQuA5Ty"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649MS7iS1443719
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWt
	baw0Jne4=; b=bOhaBbLn5ilCXS6zp8NeZ5hyq12qUhYUl0S+iDGYpVVM65pD8TJ
	LJoHb+2x7s5jLVGJ8HoEFm+vpeOm2hxnVLWOKEurk+GOBZfhPCrr/C+HCY+NXDOZ
	XCEGnovlJTc+a8sRvurWJS7buN2gkEIqgjgVVwnvhu0BX1MxJufsoEv9l4H5dxfn
	cw+7OnqbUiukNW3zf4W9wEfzQyp9RcYeyN6VcpOTNEkLU9uRaoTuQoB82TAx+pO7
	XhfaYbzU/7V3gxJOPNlPHTIJgGJ/tzj5/PpaLrh8L+ZjKFiwUwbrb9xN7dcHCJfK
	uaGVnhg4eaA5UDLQiVUJ1wgFUCYIZbWa5VA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy25fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:18:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2eebb099efbso2721132eec.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 19:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778379506; x=1778984306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWtbaw0Jne4=;
        b=MIQuA5TyeSxYwGr6P3IeAMym4pIL9CMFQAacYwZXT+6mpfs2ssa8gs9lZS+3cTZgAe
         NFgIK+pzbJ6NCtm0C2D2tlj/GSWwhtbh0zXpABSgAVulrS5og8L9T6g4gXVqVS2LkO/U
         j9bO1Qlt4nD8+7k9yZukKL3g6gOBMdgwXE83Kw4gFtLu4313CswYDKeESzy9r+s2UhPX
         3B2DXxFaf4ci1ztKi7vzG7Dv9vELWcHC7rCgGv4jhIw5ik4DBVlctjW7Blpvq5rsxWek
         DG/SKgM69lAeIq+r1YyFWw2++Ac+hL3HT2TYqgzcExqbxBCvQ3FcxmrtjV2nDey7MJyy
         DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778379506; x=1778984306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWtbaw0Jne4=;
        b=ldkmrsC+6ZUWg/mW2bIZiOgAdkHVlOXROmwLlcVAlN2vFRw0p6ncXaJzzi6xdLMP8Z
         Nl3kZjBmXA/mh58HZJf2A9thwjukGo8QnvRz/qHF29Bk50+VyukJUuORX0Ny2v8CqPfr
         ldBbOcKHXOa8ZOSTrRIUhF9UthX4BqFOe+9+27uHQPCjIES7t3BdPqNjCfUww9eYsUkG
         1Y92Nv3xWmuvzsYFI+XLSpU0AK5dD/TbGc+oqc/vNoFXQryu6SsWqxfisVkPN6+FBITY
         1MH8yGqdvxB60lIFN6gW5cWYOWizsglu2m9fe6XwxrbWO/qsPh9T7h7IbiU6D2Jw64bU
         /abg==
X-Forwarded-Encrypted: i=1; AFNElJ+IIuK6XO+1Wd0pQNryXrcIl6S4zNFH52ygkoNfpkSWLO/V8jfliY09cotyUJBPgMcZ60QSh7X6iOVf@vger.kernel.org
X-Gm-Message-State: AOJu0YwL32zrSariU8qC1N0rXWQn0xS0LnGMBHXyp+6SMCbgWHycycK6
	P6YYRRbmXg2X/+iyef23CXPWB4kcHFWRBUXsqHJl/pdBCQce6e7bZ8LwhDAaK9366hL0ePnvEAe
	SDhUuNTw4LN0O5IfwxBLi9c8cHawV5qs9gB2dc09j7S5S6hQhCq4oYPoIhTcLswep
X-Gm-Gg: Acq92OFzdtAwdn1VsSVWizzHy1t9QKw4l1JSyYsPB1AVjCh/n0NFXxKCKvlN2zJ/1wb
	rRXkQTAUj0ev7OcMcS9Wr6bzLeF4BY57+Tf4guyutlSDUTqO9nUCsfusWoDKh3Y5keLYOCUlyzA
	xpwjZRg43Mk8YI0wvMzXqauGhmhXttT7weFX2KQ5PjA+S8TkwVrP03+H+Mk00d0MxoBqfFQ9odj
	A6Uj3Ao136Qv4TW1oLNXp94MyMDS3z30YlE7zVf9RYpg/TMnUBPESk2dAR26muQLnEz9lIcY5lE
	iSPsRbxnAD+IvGsquAZrylLQURqeJ66W8NGDqZ91fi0Mm4aq14twzHcwANRrWIrmJ53YCVMv0U1
	jPH2NpZjSfdzLwI6QDSS6F5NQljky7mHqbMGbiNAdfaChToZDpwmAS71e5eMYWJ8ySmuOTqx4c0
	kbvW+nwQ==
X-Received: by 2002:a05:693c:2c14:b0:2dd:6937:79c8 with SMTP id 5a478bee46e88-2f54ad730a3mr9259975eec.5.1778379505649;
        Sat, 09 May 2026 19:18:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2c14:b0:2dd:6937:79c8 with SMTP id 5a478bee46e88-2f54ad730a3mr9259959eec.5.1778379505174;
        Sat, 09 May 2026 19:18:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm8333538eec.12.2026.05.09.19.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:18:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Date: Sun, 10 May 2026 10:18:09 +0800
Message-ID: <20260510021809.1130114-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=69ffeaf2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WCKKRaTC9nc9FdfpmMsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: wizKL5sq_Cq--ieFHXsbs76R0WvgErg9
X-Proofpoint-GUID: wizKL5sq_Cq--ieFHXsbs76R0WvgErg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEwMDAyMSBTYWx0ZWRfXwZ1aWRW9+jLE
 mm+OUQq16Fi/cFy+LLLeaDibMD4brEvEggcn+WEMNCHLu24iRJUJQd/lREDBqgik5QYYks9X9PS
 VKGEKCXsJnVxO2KS1PSJIWu6lYeo3anKVpuYy9nmCjRAaecAtGEiSBxWd+CV5k+pL6+g0HMKmdU
 P0LiJARoYRUW7UUXFRYsqZjqhXTbobyuAoDj8EHoiK2jmSNb490j4D3bunFVeW/b/7gaM7DS2eN
 C0uEshZERPTNy2Hv3Xi6r94rtFfzHo7qYOF3MFLNVoaB4RjlmWgGB0fxKPYVZskyW9Wc8zjdYr6
 aoD0pTJpG3NR04HuWp0PseLYifnulX6HKToF7eFvL/qSuwBP/PCXfxgw1YBxPZkN5nzk2rtCGyp
 81lyMa6hLvAQdEzBqLeciGmYKQ1GaHDr7UYYXtrpuyT5tWjKwedziBndhF68MDlnr4SZ+/qg+Xm
 IpHs7VS21T/v3HVycZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-10_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605100021

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document True Random Number Generator on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with qcom,trng" part
 - Link to v2 (TRNG): https://lore.kernel.org/all/20260427012308.231350-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Add missing SoB
 - Link to v1: https://lore.kernel.org/all/20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..1362a8b748a7 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
               - qcom,milos-trng
+              - qcom,nord-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
-- 
2.43.0

