Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D155466B44
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180447; cv=none; b=RI3kF72CLY/bqbHbdrvFbKygc6ey38SaP/JXtHXK4twVLs7Wja3YbSzqwEN8LdmjRVypdmN4606F5Zan2yKF8yikWytHoVKe8rAaJdjAx6iLmnrsH5mgajkJoxB4WEL0dRhQPd42ZXJIWND6RzZzbc0XQNIzebCsqkWATiqPErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180447; c=relaxed/simple;
	bh=Iv676f4FHqGF6sow8D9+X8nM6vaaJBBA/c8qDmBAc9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDVwu/1JeYXtGpdxGzBghIW/lLbInr+KNn6fKpbTxWYdkRMWkaMmro59vDAspjCzUaCer51lWZTGt7/47agsJY6kb3ap5Ndrm3wdQ9meABuIONugn/1CV7Z9HVqm8PNXgda7kb9zrfsEVmDuMUa/t82IWZYlQjqKbaePtcz48lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/sBTXGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4lkzOY4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/sBTXGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4lkzOY4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HgUQn1971787
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 19:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Krz41mp8lZlLx6aqVFvVF
	umX3vO+SmX0XbdTZu8gxA=; b=d/sBTXGzMDMxixmLtHnhi1nFY1X51H0H1uUYpD
	WULd7IfzkTS9cimVkvtJBGL1Z/krtk2WIY0kMj68wNGDg4x9UvKCQiB5mgtaZOvl
	RIqZK8vxlmVM6ZUJ6JNQF/qFtmVDTsfHViO01k3Rg8AgJIWKcbZI7z1yBhaKwOnr
	ba2ZtQCY9TzFM7bKevvn7zjXVM/4VekYy8feuw4lKCQzKgI8WgoDcY/PqfBtXPl8
	enx3251pwZD+mvx2lcjmSVvCi0FPBTwmDwSDVhrLlEUStX+qU9zTdJ/HU31UvVAQ
	9EGOxIF8V6WPLJ5aqyJx6N0OIpwEJF3HwbSE7u/6QrRwURjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej9q74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:00:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so848010a12.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778180440; x=1778785240; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Krz41mp8lZlLx6aqVFvVFumX3vO+SmX0XbdTZu8gxA=;
        b=W4lkzOY4322N+E+8+MBbB9n+b6yU41TChcr8sVRpCcX+9tYErJHcbfMrkq3sNHn1Qb
         rhUBByNs/qntJPhoN3OvHyf9a+QRlw6b19xW1Zzh3dyuEbMQpg5jKlCZiYT6gE9FRYCm
         TL7e2/S7BK0ev46fIiq4laLu9hbUiBOMvVyrB6eA9Fp0Aet8ZN08BmHGuKCE4oc7Gp3G
         /HIHRPm6zGlPEzcguAI5sORa/HBKnpwuLLIkQdhH7AFW5s/OseFKmkxhZ5lAiIGWf4x/
         uOZ7QXqRm3hBJheQ8d1zcMTOAx0eu7q3n2osyguhMWeUWjRkfoUiDTLxTWZek12p2rSP
         hVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180440; x=1778785240;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Krz41mp8lZlLx6aqVFvVFumX3vO+SmX0XbdTZu8gxA=;
        b=Lj0TwB9Y6IsoXXuu6u8HWkugMQb2e1V2tPWQXF/2qb1wI10oKaa96riW1jfKYDCCig
         hL3HkyX2vktKlNiE19SeFmlP3eeVRnx5OhE0gQtg33ro9ATKgG1qhOIWCmajEWr3tEmW
         zH7efFkLhSpE5mqTlgigRlL5DtKTn/RgcKv7sj05g8gvyn9uMlw250maM3q7v8HH/vcB
         E+m/MmhdfA7IZPuJsmxHw4CR3jzAwnoLZXFIznpzr9rYqDY7DmIIfCoyLW1L2BtJv0ly
         nhhZaXENCHE8Ewkm3GN9t4G9h9VEA+POx1hW3JQ5VGXwh17UPHqd31gJnmgenlCC2nZN
         +MIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+atKXK1FKqb3DGReb5gQ3w5RPqaHlZ24UpO+OtSXp/epZokn4xH8k0PH4h17iJrubqw/r7OgRReAi7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8My8Gis0t6kWw3Lr7AWW54/CqYeGTQET9iONXrt7S+6i6v+k
	hrVPpsZpQ+7mYdBpQ9MybaEr5NC0M2XtC/DYfy2PbH5NNQMPUE8/HMhZX6fxS4v9NTAlq4JVw5D
	+QZ9Mxib3GibimQ6HnflUiQqkAPaWHMmV+Lt493UfN3QXyZx8xVDgebMDRfkACwJ0
X-Gm-Gg: AeBDieuTw8LdGT5HtVaZcVMrmHFVrtghWVlbWtpSZXNq9YQbj3CGgPXQPGfFOEXdyLa
	UvAZSt2M0/NMyBhQPJ9gt91+bSNab2eivfKDz4mOmBtZFNnuZgeeQnycQlN3kOMnuSM8OhRMKUU
	m3ijwWs3Sj8zOIUsV6mSxoT6HRbuKV/RvuD8w22W1k3HTIruqD3KdvcvHTez7TZKjWVioZiOK26
	qRS2KPEs2KZUv0m2WyQwD66gHBrLzCfXzZSTL0iBFArkrnGw5C8ofl1+15wsDrEG/GBOJmyAa0V
	eptT6Yf/SZFnP01Tkk+eYtIL5/W8ChO3LZaDAl5A04mAreu5Qpn4kjgIMVGxFt1WH/N58p4+Fp0
	asNo7w7+YJBjN6Z1TOQg1DTS/9R9d3xafq22R2rHPHXAVTxw=
X-Received: by 2002:a05:6a00:2444:b0:82a:12e9:c75 with SMTP id d2e1a72fcca58-83a5d388892mr8928691b3a.30.1778180440480;
        Thu, 07 May 2026 12:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2444:b0:82a:12e9:c75 with SMTP id d2e1a72fcca58-83a5d388892mr8928622b3a.30.1778180439723;
        Thu, 07 May 2026 12:00:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbdda0sm9914950b3a.44.2026.05.07.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:00:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:30:32 +0530
Subject: [PATCH v2] dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/h/GkC/4WNQQ7CIBREr9L8tTSAFasr72G6QArlRwstXxtNw
 93FXsBMMsmbZGZWIJvQEpyrFZJdkDCGAnJXgfE6DJZhXxgkl4ofuGDk8Z40m92U4shuGHoMAzN
 SSafFSTVcQ+lOyTp8b7vXrrBHesb02W4W8Uv/LS6CFR2t2oumNdK0l0hUzy/9MHEc62LQ5Zy/Z
 9FRiMEAAAA=
X-Change-ID: 20260501-shikra-qfprom-binding-c262fa19640a
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778180435; l=1285;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Iv676f4FHqGF6sow8D9+X8nM6vaaJBBA/c8qDmBAc9g=;
 b=y0hAQLxFzn0yAmgofzFhIQk8TTj3w2sf8LblordPjDEBeEY8N+3zgAWfxW1AlfM2IBmX01e4G
 CdZ7OCqTcDLAp9i9ivkApwOP5iIaPjkEaMqzY5fOHWav6nCb5/kNVL8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MiBTYWx0ZWRfX544UQtuCBY7n
 3fHDKuzRQTeQ2FQsLY5A8gH0mW1pCprh2iHx+4SGv4OC9SLC3wvJBxwJaSvuVIOKo9Obo8eKjsr
 se7AKdiTSqpVgrmud4qXeRQuhch5jEUQyuEqVsRdoIKJNPx3+vsZU5Qhxc3wsNu6nBzbIoEB/Oh
 eAsG6WaSbl7T+xr/3Cpx8v88Z/M5c7zuz733cXm+XrCIvHO7cLgRu6P66GjgDLpW9mHMLHoMgO5
 LyykfJMzzAzDh7bVojmGW63K064mTcouh006CISSD7PgDselk67Nz0C/nHgfU+VDHTkwyOHFXwN
 dDocrMmqz2juwgxSVD4R3Gtu8uKf4+T6YGqjx1SHTaq7xo9QdK8u5F2tx2ufn9sdFxiTiF2SPaT
 SvkXWTDCoFZnndG/zrHxD87ZbeivE2bqypweKHX82a/ZpuivpuJUyHmeE+KCppVKPHnvQ8yjjop
 uRueEAxOXwz5uNbXmSQ==
X-Proofpoint-GUID: 06kSEiLEKS0guCi6nkNYB6K8LnY37_r4
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fce159 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RENOrG6OWV5kdoAFrl8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 06kSEiLEKS0guCi6nkNYB6K8LnY37_r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070192

Document compatible string for the QFPROM on Qualcomm Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Add the QFPROM compatible string for the Qualcomm Shikra SoC to the
qcom,qfprom binding document.
---
Changes in v2:
- Improve commit description: "Shikra platform" -> "Qualcomm Shikra SoC"
- Link to v1: https://lore.kernel.org/r/20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..52b86133ee00 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sdm630-qfprom
           - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
+          - qcom,shikra-qfprom
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm6375-qfprom

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-qfprom-binding-c262fa19640a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

