Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1240B4035C2
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047124; cv=none; b=X0PQiV5aGKc0tSsCHaKtXPy2rh2wbv4jwziBM5RowpjRkMDS90OoEgiY9tCISiVe3YoSg2R2CayID+fUoaAt6pMM86vAkKCCo/fKBRhf92U61Y6PG07MmFuMs2S+rz2+kZjm2aqodl/VpUltlJNT2ZWwOB2YV2oco7VOyr8uLD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047124; c=relaxed/simple;
	bh=2u00Tl2FL9G7O0Q0N6WoMtl0BxIb+vAl12QhPdy6m9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDE8CSl65STTEp8cRj9bLg1D5s6k8UPEEmJDWrmnDxoJQo5Lxit1dYjttv2OS94VvJqs9S+PPXOYRztwTZTufRir3RhO3VEXR7xuWWDYY+0C0jurnQJMnaoMOfJk4XzdKFpjQJfoWYUml6TxaSilyZXWvp6KDn/btiWdlnanfcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgwkLVsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vni22YCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgwkLVsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vni22YCB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318MHw7718548
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2k
	qeXri1tQ=; b=QgwkLVsyRtKuZp021guh5Sg6lyZqodQUMVnLuPHDZDMZqDrASJX
	F1vKGAetqkridbehMD8VjNF+I7WhYNS5YjqRRMPLjUmYD/fmTErFJQk4hc9zZFKi
	+9vCPkkn2z2+ctdx7aHum+EdVizQVDw0ApXejGGS120sCesSyoCrSjLoKzbrA4Qu
	r3at0ALPIvSt4KkFBcLqFntSMWNBVB6dV/6PLuVc5BR19UZeVWl9h6gC7U4quHvx
	vkas16DCkJb06VOsaCJfRPXeQcJ0nOkI1qJ4iHM5iMBvyo/xf3S83lpA7RXIY35+
	Fruvj4GhXMyEanFHb1L75FzleQqSXaf7xcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsv2ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:38:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358f058973fso7838144a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047120; x=1775651920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2kqeXri1tQ=;
        b=Vni22YCBlxtzFYif/IVPlvHxr0f2oEXL8Xuk/XoJD5YeQfROWMiWEfIfJHjOpY8l+1
         AjIGlcWfmrsRradq3LSsZpiao7EBsyA9xA5EE5kLyUMSqO8KN7iwwunx6uGlVUd4BHfP
         15nuRFVJWgFh10/JydEqZNCLuSoBYhOsYJrlqWGIM/awjfV1DZMliaD2GQi4mkqF8hXr
         0fvF3yWWKkyKKwBDCIOL4kMudwhKVHCBbkUfrTuuo5cUPlLDuTY6LtHWB6juR5T1jQnB
         QH8krRDB465imtIU+Hvczr34g/keVHr7tI7tbEJscJ/kvBAl+kXBlr0nFW1Q1TJwkRyp
         mgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047120; x=1775651920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2kqeXri1tQ=;
        b=tIfWYuALF4DWx6XJCghxTEPE8eemaTq7at3xnXHxOZAw0d40MVtXClsT/OZj1QLIG6
         f/FgUiICll1qOLqB3BPhYzFJ2LPQEsaYBZcMVioE05Kt1nBzWCxFdd49D2MlroInUO0F
         Gt+F3p8K5HfYsHLxGX/lceYepqS7QunX6pLEMShB8RwbDu0SxGlM8NhDT5hc6vlktiKh
         CgO7seUHKH6DJbl33eCeRuEpl6DPIndvESfajABCq2aQpWdaL5mUjkBXE58vU/2YI55w
         HDWAIO7US9iMt4kAOPkXOgmtv14aiZri5zChqyF5kYv4SRJPhkzOgGr3uvD5MTSqFLmS
         82mA==
X-Forwarded-Encrypted: i=1; AJvYcCVECYbLRQS7CAmBT+bvXtFxpdYNRx8ArjfYV0WyhPqc4AnesuvCFFDQl+EiTYdxFDqZZDo9vG9Bl9p+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Wqkn5M+JR43cKCBlv7bTDVtNgQ8FyOYSgaWTXo2/EuPGBKMD
	IG9JDxYMlbvryBbiXMFpPLeCsrtuc2Hc0mWqtEhX62UUFngH3511/ua/yv9jy/TPxZc9u0vzb+R
	NCdYOQKVdudYYb1xcmt1uA7hKUE5MY8BfwYC4I30D9uNj3G8wZ64wMVoErNgP3n0srj0UssVl
X-Gm-Gg: ATEYQzy+Tp/xE20k2su9LtSOcajcNgjL2vfQZVNhQhOzMQKVH+rDqn79PHraozp2aas
	Xzb12YLzQ0Npj9n5aU3WwfNvdGvhsPE8V/uJfQNCyRzDxAgeXJs4pbJpT+nLKUT/EKOlGL+o3K8
	u8MpkFDLNeSjuSZZVVnPOvYeQI6vX93eNrqfm33gHr0KrczmJmIvEsWwrOttDTFqLMlMzgAnC+g
	7zukydqr7pBjfIY3DzFI+HGVw+BjGb4mpV0Y96gPAbnXrPODf1HK+7TWPkvHuFP6ioE/iQmK+sp
	qd/IKq87EgbpDxAQZah08fOgj3BzYrBaY+UcA1b41tKSoftGnMn4ikKvhT2Q8beqmrixbd3M0vp
	vbM8lS/pkTQzTswNxKlEC7gHBA858r7S1wgXBSdC14AuK/hcV
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35dc6e43815mr3780324a91.4.1775047119689;
        Wed, 01 Apr 2026 05:38:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35dc6e43815mr3780278a91.4.1775047119079;
        Wed, 01 Apr 2026 05:38:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm6910595a91.3.2026.04.01.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:38:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
Date: Wed,  1 Apr 2026 18:08:25 +0530
Message-ID: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfX6KbxU6M5Vns4
 uj+GINHfBYmn21j1NWyuvfv3E13C4PrgyQS8YOMcHooPlDXJe6a89yTdFwjjAKB6MwG2UwdAewt
 X5wH3ltzVgEFdJi/kTfD9At75RiVuAe8ns7NuCKXxNPu923BYAo9p4ztqbWUnlTDITcg+OdGAG8
 ZkkIDCaC8G0Oth18Z4yTGtvBzqbxElra4ihxhrg0TsJJthTQ8ktXR5/cAUP9N6Vc4ga9R3e45Bs
 OSj0cSAm+Hx88EgxxlVavYO641CtH/3fRJ5MerLCj/UsF2HNkFVMeF+gjFrkkkM8/viNxSduveB
 ylMQpa5xviSBmuHjhUzXSasU3LxaYoEFVOCU/2fOaHNQoaUDXbTFF465Gob2JB20onrbsRXVdzm
 1yzJVg3HJfVf0DE4XfipoEU0mamiSWoSQRAVNz3mopUDDDG4FAJRCy0sGyC99VpNufgX+oMZy5g
 ESxCy47m/SRORHCFolw==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd11d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZFHeMJQfjZMagkwiXKAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: lGMHN5GAs4XPRweT3PHGItD9wZJ18V6F
X-Proofpoint-GUID: lGMHN5GAs4XPRweT3PHGItD9wZJ18V6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115

Document SCM compatible for the Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index f628b1d70fa1..07eb9b2c73ff 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
           - qcom,scm-ipq5210
@@ -207,6 +208,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-milos
                 - qcom,scm-sm8450
-- 
2.53.0

