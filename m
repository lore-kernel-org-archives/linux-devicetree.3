Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C94400DE2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210947; cv=none; b=R1kfKWzxAP6RRe19Rg/PawqI30MNzwADgoNa5iuAqdCx6xU8JLkqZT1uTmlHTHZ06SelDp6AywQYNbNG974T+EUMdu3j9LAiRKe5H3KJisiDgrT4Aqym6a0idea3LGV2TcDcZxVruCy5HZ7k9k9r09ZjoJFhZ3j73ZWOol09Zqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210947; c=relaxed/simple;
	bh=MCragVeqWGfwwLMtO1vbVTdRFf4q/FyUz9Na6DMFRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIVWZOFgDti61wwLX2gXZDy80geDC/UK66xMqywrQcCwAx9XTODgM7pVYoeyCTEc+TceX26mQRCO/ylphQsZ7uUEe2QYoPiK1KQEHmJ0S9Gu3/xlBBeXbO/+D5jGYz3oo8STjIs4exEbRWOB/hWBuKUcJotIQe678yhUsjmX1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xma0Spst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjledAlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xma0Spst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjledAlV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwfau1739499
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+J0UtrHxFLw
	6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=; b=Xma0SpstGs2h892VEZcl0EsuuZV
	/OqYjyqFPk5EsN1tTEe6H0kakTj+jmQgO3lCYMNONmC8kYpzM5xMuEN0u7EShU83
	CI6qMr0xJcgadLKeTWFv3PWGy7qsl9PfA/ruVMmpUysdFwpYASBvyDi6Reo74v5J
	7+wqZxXLgcZD1q0RdaY+fbsOckGdCj1WZ2GS3j/sUIYtL1OYoSd9lNE/tXS9fIiU
	fh2bzC0rSXnEnUkujFhzdi0oz2FguzqOK58lSDndmvaFmCWCPMc3UCs8/jXnUCv1
	i7MOFHb7hPwq/Y2uzz1Zbj4rMQQxPSesZWuYhgTxjOyuD1zA0zCwaBksExQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3q8nb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso2014945b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210941; x=1779815741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=kjledAlVJk7asu/x2r77HL7T8LYMmApLPN4tBarODKgpWQPhOayBz5lwfEdQFZFYIw
         P8a2Ma+DNjj4GFVKqTnuP3AlBNI/+4tfn8k1uJ6/3pX6VtY7mYNyIXHkLtfp92GTUCqW
         rnBXLabbrlozsKkxd8WKSpKyP3H7HxUXFEiH8FpHI5H6KaAEud8gVxb+hEtd923x8UnG
         /xfxIB97TAxEBskmTay9C87G3euKG06uIO+/tpZx3JTXEzeAo4pSjV6lCaI+PsK97caf
         yFSXifX5fPvcPaYsmY5Inj1oRmm3tWzOzfFOe8UYsSLHZb1p7mGEwonq1T6RzPcn5mji
         rkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210941; x=1779815741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=qMJHMZHMSciaehBr+frJu/JBFVstFkSNtXusCqDF5+d3x1gtXX4Y9HbFKqdBAqFm6X
         xlwj3kdrhvDduvQTqDNgBjxLhM4MCPdggyqJaTqsKjfM9B1SrSbgfYmZs8frWXbN1IXf
         Fr/smL0lOugM2hI1S4RcYPgyijAYu6r+lXh66g6CIDga6duEVZp8q+Ung+Zj4CcQET5i
         uQanlMut4ZFohz0fh4PYfo3bMDtnfaSrWWl6Fr2gQLeuoFfl5DIn3KtUBaeEE5m9rOzT
         +hX+M+lgNYcztNFVt07q6u0Y9+P36X41SZ/SPIpm/V+y6RTSWrSFehTrhx8ZElurLhJ+
         xngQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oyKHDJyK2FuXAwJguDSoo/UL3pybfD3oAW08w/3KMY66WGnJf/7f8FPwVbkctki/Y8+/wD2aNuKWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyeO/ATnqXLU4j3FK7MWKYdylx4zLHkiq88R3WTOpFdiAWIHwWe
	zYWtcEESmTZODRfDFLqxgXr6DqmQXwHhHzaWeFjfQqq5Eto3cUURr6/1JuVuhW5tWhNtU6A5MxM
	HbeEJz/tF9rfZUmxiqAFEqImbO7rmQpc/rUzseAxXpPQx+wyJQLJ8qSIAEuBV1ded
X-Gm-Gg: Acq92OG2Zr5EmKC7RY7S4MA3Fm/bCwIPdjwAjNPnWPV/Vs45J2aPOtszqwpWYAXmBwH
	RkYRBKu67m+i6nLa9plZjXpM/gph3pRovy7v+3OH1BxM/pMKO2HMFQr2SQfhK5wHpG4Yac5LTu/
	6IZjmT9N0vxFgpFuT2gZVbzv6u0++VHrPQkQjfYhLka7k8nu9jR3N1ccy4Y2BcFGAbPuOXH/Gmm
	zBVjXj5D1D5s0SmNt+qXYpkCl1rLPDA3hSu89rHi10qqNtdWZ65Lm5FwRZhf1BETmp/csoJ1bNP
	DWEMaCbjnPqiUjQlOpyk+UI5mHO2scAEt4mC6vCmp2Pa7MfEHxSk73P9cdF1ObLFq6I+8r23w3L
	eRcHWp3q4cH1lm1sC9+zlWz+5TwW4FEOTccvHgxVmvh898lk3
X-Received: by 2002:a05:6a00:130f:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-83f33b3385bmr20139427b3a.17.1779210941208;
        Tue, 19 May 2026 10:15:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-83f33b3385bmr20139371b3a.17.1779210940413;
        Tue, 19 May 2026 10:15:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/4] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Tue, 19 May 2026 22:44:40 +0530
Message-ID: <20260519171442.1582987-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ow1Roe2FByXnFVFhOX2BReGFoJiywNLK
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0c9abe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Ow1Roe2FByXnFVFhOX2BReGFoJiywNLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX/ZVgp7efMju4
 9jFfmwxznYc9M+FGJyGAXfwc97BmqUj1yxQ/FIm+M8o6tGB6zTHQBXSQL6ydIqhQlwrKjsEUA2P
 oCv9wdo+cE8DKskKouAu60bf4JzaAOW1+IuyC3+bW3YETdMEjD0ov21myurnApdvTIqjj956rOh
 TTImqxzfWtYmUcaFhhI67rbsG9csTOXjtklfOuWF0zbW46//8KVO2+dWg1Rk3E6wEOzjnfqE/jo
 J8U1DYQV5GQKYT+DZdBQoSYQz9vKvNfzWtWdvSKQW7yHlZtjP9NA+3rnECsX5+MeX1O7eKncuqp
 kqybzaxxDhYvr3XMU1Ab7RglYljXcJ4dd9huYIUroqB6JJV0MUdW41pd/gzxJsPdJr5XkMZLbm6
 IYmGGf3WQO6Wlm4y+51aS6+9g9LCcX6bHFbPPGovjVt1ooLzkjX80aVAu+9aCW1ii9uW9J5Ed7L
 RiSyqy2lE5klK5zVg2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..52432469badc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2747,7 +2747,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0

