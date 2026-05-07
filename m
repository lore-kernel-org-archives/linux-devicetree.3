Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A83382C3
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141266; cv=none; b=mm2T7LLddPJ7hZJWqmMM37jXDHSj1Nvd6DGWxhFBhrxFahq+gZrAxPYRAfNC7oQZO95mtDF4w0uhH5bqz7RYb8elkAS1VZF47Z2cdGw+Otmatc4Y9gX8eF9qzLYuk/CWgPYZh9EZN/Y0q1QF3WNOIYjrPOZCymDIahYEryV81xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141266; c=relaxed/simple;
	bh=Fqe1k6ndoQL7AnpjmB3rnljMslxXfxgBLPUTZjxTcSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdJOYPMASjfbDx35HCqC1JSHRPuieFhkBuq5qAGezI4rnmB7Z3MWffdocYU4JgXuN2S3MheaCsCEWwylZlQEP2BwQ98Q8APJOqh1sMRphQOWW3oETpT1JkFZ4GXIHVeVXJEAu85jZAsXalGDsiss8/DedWIMNdSZ1+ZS02Vicf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aId/aLsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOnBTRDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aId/aLsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOnBTRDC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wb1n1926382
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IVQVByW/wSo
	hyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=; b=aId/aLsZi9orcrIVTnUwyCJaFk/
	N7Qzrm2XOewR1t9hT+ChzLteHB+s8DvhNKmXrUepqklZioomkIqhRxgdtrXGw260
	/h1Dbt9uz3/grSl5r0e4U07QLyE4HZ/FGtegwsVTzYpivpwQBN+JmsU0lqW++HWc
	x2fcop8JNfdjE1kxXKz1BuZibPVawjm2mq0lSGdAX4SufF/gRJ8DWX7ndFk5zKAr
	k6jWfv0u89wF17G1O3UrNnPtc+WnsB7joMJ3uoiY8Y3X6TwNkO8AAVhQnl2rQ99f
	lv0tvYTApHUF6C6zGCusunMERQotv5MiWbxhDLSTd523qnmcaInLnhOkg2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8fts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:07:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so1359451a91.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141263; x=1778746063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVQVByW/wSohyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=;
        b=WOnBTRDCe1vJWqHXGwdF5eMFUV7v5z19/eocnZqTTjtyBHc4z3cPJmahaAiZkZvYMm
         cOOP9Fmx13vL7icFYdrDcncBB8Kl3YQCrRRDBLwZAXp7SXN2W2mtSl5jTUMuLnuATHpR
         DQiqkGtqWfl4AzR4OQYErpp/Y471qsthyrwlSW8AVIvYvox/QwTfWR5i31F8A47KyHYK
         F3vFuj/ESt8WASFgh/jhe/aWgNKFswqxgFNZ7pdHlurKVVEq7x9fGssMpXhgSt2wzMZz
         O/PbU9Fx1QwAHYVD+0obtovl6jXOeuw44H42UrSqbzrzWk4cD1++I5CKHpKfDtnzf0+t
         IoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141263; x=1778746063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IVQVByW/wSohyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=;
        b=UhUaiHJydXQVVFu2vLS2T/ZgVw02i+MMYsSrxZ6uw/7cIoss72RIjdjSwmLiGLk1C/
         SpGIOZ0de7W13oj3xbm3aS+NWTQ15F5cuJa6prouyP6RsFczOfCy7HkPNHvdw+wj12SO
         Xb7oh2KoCT/cC6zA9j0IoEolApj8+MYqZW8w8TJU8CiyyJb4mX7nGwI04ugvTaz5UDvy
         X27dzNkKBejJsLKjL04nZ7+eYBYuBiJeI+S53mxUxtgyHBV8cdYALUlo5yDSwj7QWOzz
         yihczWV/m0+2t1BMuR2A0UZ1ifBWaTxO1k7VRifyma4hB1CdI4MTbibq+MZvokVrXUv4
         gaXA==
X-Forwarded-Encrypted: i=1; AFNElJ8tZRG9QA38uk7MCPDkkxBrEVquZr9ouNZpMraNeoWJ8mmjHHukAa3aaZF6a0lkFCqQr0z4i+Rt8x3a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40pvbU4i9bddbJdw0XC57BopCdve/eRpzDCC0g28IuZAVFyx8
	4y6npFKBNzTt1xSu4eWRrVIRg1T2FT/UnQJJLdqqbCNUcLn2dRRbvYoYSkwVCUiAA1gk1AmJjG2
	z2PTchDt0gQY0KO2la68s8wCpHYALyyOCsymagtcQnKWsEpJgm7fgkAtEr8CbzZSx
X-Gm-Gg: AeBDieuWbyrxoCKNegBLpk3aUyF7UznQEs1wcuACHaikmFD0FUnGYF3ax9lPUqndIdn
	01Pdbv4ttguP0akBmGKggAWqlqwIYKFToROiU6zyRdy6Ob+1jpuj1kpTuGVQjySGAtOtR+FfcbA
	t9CcF1MCAs58fpKWhiVubtX2z21EwVsGq6Mxykxc3GMj2q9hWeF2RnWnZXCkmKartBsSx2NjgPr
	VTLCBlLX6feJ1VQUub1yGVWf3n6ZqoEl5A+/A3mfW3ijudFd3cRq1UhNB94YxICdLU1Ht18k9Z9
	5d6H5z2VeOnPr3QCDWoTD6smD5fCrIxM2eu1U++JJUAR111zyE/MSeiLh///e7gFh/OmQQUo4fd
	pCxh4+X67Us53/Rdk2sPzL4AXG5nZF3xl/16zyxRtCsI3U2iGLtS01b5E2Uw=
X-Received: by 2002:a17:90b:5284:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-365ac766d8fmr7725928a91.23.1778141263433;
        Thu, 07 May 2026 01:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-365ac766d8fmr7725871a91.23.1778141262870;
        Thu, 07 May 2026 01:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Thu,  7 May 2026 13:37:18 +0530
Message-ID: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4850 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7_M7cpwsPd7APosSulYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PLKL4jGM-ztYjrqS3oXo5G0f2GTySLNo
X-Proofpoint-GUID: PLKL4jGM-ztYjrqS3oXo5G0f2GTySLNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfX/s4IyiOT1eC5
 tA71Cv6oe0/+pMYhNQpjFI1JY1Y/nzKVq0JEjxhKqgty17raB1V9YErwEBeUURhRv/5yP+hPEYB
 Z00z9ikEhRBs78qdQ80ZPFshI/WgmNxmSpwoI92vUwW30Obds/oknZusPYUUQt2BC+5BknPO+BB
 8GaXkQRHHi3NqqMYztAjJosxSDXpUcc4UdAihKp3m8HVVgcxnqtc8uZvLW9V8pEVOe1W1+SdGEQ
 FNSM1LSBW8Iw4q6YMjqKMyQpU84UvyF9LUPNVsTMFOTE+ibgLVq3a9YTPu3ldMk/jh3y/5IRQn4
 GeN8yPCPtV4LizUAeCh7oXwuDUOnIv8KG4pPYqUOr9+oyJoNhXvh7B90D3F51GQHLJzS7HH+QaJ
 L39UiLortw+x/DcDV8bu4VhRLbb6KY3SuPk2z89rJt57hKXNZj/BWNIa321MuSji0BtJjtV8ydX
 JO+mVBqhitBnS1kZhBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d9ee180388aa..f65b132004a5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to find download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0

