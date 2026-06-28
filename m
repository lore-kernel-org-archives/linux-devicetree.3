Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCC2E03EA
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671074; cv=none; b=Ppr/v6ASYYtoELxLlZdk+BXmihsmtVU2GrHoBdPL+94ESYPi/MadUJ1tbt+ZFmCQkcgouo2RwoNK3v3qLbffhCOgd6CZ0JkkfpBacVSZM1Q0NEilxsU1WdP4VmzF5xAUkhBUTg1Qi9AS0exdwn5bM7hpfPD+YfnIe0GlVIXawog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671074; c=relaxed/simple;
	bh=FouFj+iYJhzcqR59XAa2/WxqzLLfYvt1re4RY7l+JLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgDy5uwWQ+MABtke8R7rRFJoS8b9Jh98Q8Osk5xnhtZG+LADvlvMCsFFJij99QpFKXUzGRPuveyX5NSlSHzGMFyV4hTyFqyS6mLFum8EpYsBxLNrCftf7PKUgVuz8FLNw/PYf4J2YJJcKNALFW6WA8xcQlffZbLULYPnyNOLapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7gI6+6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnCaFBWl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7gI6+6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnCaFBWl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj2rS420317
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=b7gI6+6E+IyJ3GMr
	JGNhNPvvWEuhGi2oyJJfH1DTEQHSNX6FbL0eowjjuI7VjiPh4XSwP7BLOWIIV8Rl
	A5H5QngRwub9KeE5tQw3SGiAAmKJu7prlKkvfGpNEUOOhu1aXTb8G+1dF39AbnKg
	4oRKopXTA/yYrMhvmtRymFr+cNs73lhBW/viD4ZGf+iYgNkZ1dgWeu+0Z40228t+
	DYBk8Md2Oe5xrscuUVFHeMtgpr/2kGYIYYQc1AArU103RO2M5jNoOdoDohy4Pi1j
	ChZgXuVhK9rH0fi/9OIhe9/AqvCbRqFlok0YejzT4ajEv3X9SkySW7YmraHOTTvp
	+5ggHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734beuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0a27ad86so5673481eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671071; x=1783275871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=MnCaFBWlWuaOrwQcCr+xWYP9H0w3nTlQ97VGT3zKY9UCudI6m2n59iG95CfeicKUYG
         q4wkThtegXxx5pOSqB6LCZrSsL2am8O72KfU5r537dHG39+f+qhe0cIKSImKB4ogDgRX
         t3LoxC9aRQf3qZDx/j9D8kg2UYNAv7WavBNIF8ymMg7P/9AkZxD8vwUumn8Z6301nTOh
         lgOt7qMRZ7e47GZ4PHcc4YZuJrRmOTT3I5YjVQ50cCPYcxjDzrg1T9+Ltzx8gzP9VMGp
         XtRqpASkgD0M9dzjNvDlRD44Tb155ZTeqri5k5gHsLoQeBbVK2pOT5poneefrxCWlTdN
         9liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671071; x=1783275871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=c2MGxXFpwitDpYfzsoKRK+Xq3KevH1X/ihC9wAvjF4HVEoCId9CUprMK5+at5CknRo
         Gve+G0kK9aiijs2XmLPAHSlXEz8ktqgrga2Kh491Fvnik2BWuF9f68CYgUPPDESB9EMV
         uFiv65qtSxvxGaERluRPSNgKqR3h1554KCrpxdutLFYmiXgRZpfwbLTOQA1FB+njU33Y
         Ba5ZIwHU6GsbOMycUYoUqyIyn0peYEkaNVDL1hd+Sl28c5bvMHMGs58qpt2pl6PMBmEu
         zWNMWHLizNpPNQGVr1Pi3p7lWxDa0K2ahjD85cC2KO/vLsS9GhExALKvYQloqbYom8UO
         PIdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9lKH9OsLcHUxIS/TBTGXynzA214cowneQm3s5WHZC0V7UdxDH8xSkRV9Ir455AS4nMgs4zIRdwRj4@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLOGV1cUVFx9ui9pIYCMSWEoZqqowKGhZav9NkG63AvE2Zzh+
	ZPSjUSUd0+BmSWUsSe4vEV0sPEYjNnz3amno2wJvpj6vhJhYXrHpYbLbc7KCoTN9VKtX10wS40U
	pJgrXZ3x/0bTmgIFlCWok/AFDBBH1zbQBG+b1B3fNuSX7grUpIqy04Yixqznfbl3H
X-Gm-Gg: AfdE7cm4CLD+u6HpeMyK6j6kj7keXgdkBB2N2BwhSZSuOSKghWa667XvyGZ5qD1W/9j
	CKAcblvI3zoX2sTcVrNZ5OZ+DZxjN+e61R1KkfDndGaml/rXUuB5uX9Lh3DrGDa4JfEmjeSd+gA
	8nP2AyuGJSbB2pTYW+VRBWTNByPbmmbtfSBCkfxHbTnYtpVaIOynFPSE+7t+dgM1yhrGEOnD3Uj
	G8fYTz2omWTPCopu+GldEDexSLHOu3PVi7ANiFUDnJB59Iceth3ve2Pf7nscCVT+x9nKWG8gHFU
	ziv5jgGCav7FWJzuKx9Om2WUa5R9tWH86lVFCHq5FulgsNXnXdzqMKW/L5y9tz6HnfKRAwkGGur
	mYVNauMAnS3QgzHqY+rAHJDwX3hFqeyLc+YQ=
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670335eec.0.1782671071211;
        Sun, 28 Jun 2026 11:24:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670305eec.0.1782671070686;
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:54 +0530
Subject: [PATCH v3 1/8] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-1-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=22p2wlSkso0sZ4PEQ7LITGuwdJa9RASM+Jq+223nG5cAcH8yMmpZFDMuD6z9JBVhrbUJh2aE9
 UR9CUdoJ8n0B5yFmfy5Fk5N6AuTTQsx6RktlFU2oCAgzHBC3Pba4JXE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Juhm2EECPziSAuajRxh5-P3kKfcKHki4
X-Proofpoint-ORIG-GUID: Juhm2EECPziSAuajRxh5-P3kKfcKHki4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX5qwV+tyr3k7A
 XXiM5fXGhGEgjPSIa4I/S1opavbM/jkiX/yoQI3yeEl4hZqAeMbtTgkEljZItg9sxd0crWTejuY
 d9YmwHWZkNUed/CpFj1gKrqTwp/CJKM=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a4166e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX6MJ+Dith1w6J
 lRsO44r8sBn0OGZR1uqURVnl2TnKKKxLqQllOv8q0WrWSBnoo4OIS82VhUowKU7Q+MtkqdIGY/l
 hDIc6vGoasxgFlA+rMDn3/OzmznpXjPmW1fSWIaRw18qA8p86bWfQJFGKTsCe/pncdd5PGAJiNo
 1aqhgld+2/Fm7cwri3zLm1DB1xt49oDqfib0KPDBo3pbZ95wYBk4+FODikTCJ8hH3IAa/jVQEpC
 kcYGaYcx4NSNOdLDeCpItEEaVZbOatmgerW4iyJmbS6kQlzwssa+QGoMPLQwH7KB2YG4VmeyhBY
 17s9KQCAIcJdvpM0kPvjHlywJnVNHMHz6f8B9ZK4EkLQSyjoN+E5SKixq87Gy2lxmWQSxUqvN85
 fYs7mV803X5GSB7HraNgWOZSp/VHRyspPoTXqsogTzWnjurOoxHD96gq2RGhQtfCJEjB6ByGFOC
 vSBUEq0iW/jL6k7jrGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.51.0

