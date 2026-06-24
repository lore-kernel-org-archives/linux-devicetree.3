Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B933F5B0
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328140; cv=none; b=gBMK4wkqcfVQwtaY1pbJPYU19DHZHJHuZBiHemuYrbEpeuq1YEShaEmpMpA1xwl5UA3Ua5jtIb1sYDMh1d3Vzo0I/kxTOzOZNi7UhzBmg7amlhn3zDTfSeg8HCr+SYY36fXLIjW7NP3SebbWkWH3S1oqznidwg8TW1JcT61Gl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328140; c=relaxed/simple;
	bh=07WDKA0OdoOqxTpe+k+VziHT+HpeKDFAeOlyfNRgqpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TV2Bsf0SolELcnmVjCJnbG4xB08RlvEXMz+kBDps3YqHEL/BmTxDNwQQf+ZqKZNJ5llElzeZOW/SdXmD7XWPvvNRXbqQFLTLs2wRv8Z5xXnFNhw4lPElfhSsUNatdhrYdWN//Mcxa4P0hz4rEsXA96lnzk+HdvleFK3e7PzuDog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUEPbcBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRUlz6Tw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUEPbcBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRUlz6Tw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHiu5j3832112
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T81WvvV1onC
	oDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=; b=IUEPbcBD/Dz7Cr151OoBwPjK8j9
	fmMSIEk4nvNENUeQ42Eerx0cSU6ZS1H/rrBzcegnXTlOxRZ6FYVqctHXCwdzBz2A
	A3geQczUVM+GG6wngvlcZ7seHvduYbapWjugrc3DCFL3ulFY5gHELnmN3QMiswyl
	MHuacsLPodnzjJDv3ma0PNimt4ip3JkTejXOo6DlBJHBuI0WjWsvd804ZhfMXUqC
	id+RYZ0HqAynBW9oaTPUiKc1vE0VLZdqfmKucZyKKJAottMxanKmQTxsn/cSKEQB
	b3zzuu7Mi3P9WHJxP0ckQayi+LuuepYEppZxLq/E5wIJKwUiETG8pLU/v7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7drtqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8453cbd38c6so1284994b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328136; x=1782932936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T81WvvV1onCoDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=;
        b=cRUlz6TwmLwAcV3Wic7l2hlG/1sZzIULzC1DNg2IpY6h2XjUmK3cNXUGQQpfcbRD5V
         5sK+clA3RT68TknRwJQM6R1fgxr8Z4yJUcrw+6jr3B3+4xqjg0+4O062JrekB4USgHH+
         zM3TpEQJ/ff6auI08XnsBbuutWOiKt9qxdFCly7pI5ky3o8/ZAJN1HB6K02lRZ05ri90
         9XU87796BucXtD9jnT4Meyh69qMpa9ScJZ3xTXzE4yUOe9WxmWUreSfEJObLcOg89e9x
         mogoDgpVuVFhOTgHeQKcSoLvT1tDs9lM14KGJq9pLmsfcnHf1ZDFaj6J7lQI4/b3VitW
         7V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328136; x=1782932936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T81WvvV1onCoDTK7QcIKnL89AdcLmXT+NQJ9Gf5Oqjc=;
        b=CCGwsLDrRTfvLPDYkTYt+1QMtFocFbC4x8vhqc8CkGTen0joeCCgrbiV4BN9TmFa2W
         /6P8qH26IR6aCmOMEPeqLbNUAOlUFH0eZUEoAZQGKqPaDefFWz+CvVIxpm31cK/eWxWP
         IIHYbmDHKLoRvBVniEDQ4BI57rRrECJzinKCrpp7oPmf3v15/DZYm11lGZ+fOMFSQNrI
         P0vhMHphLEcqUFyylXqy+X84pBR9/KbP7XPDbCPdBESw4KvTS2H6n0DwR0080B50FTES
         KUJ1vhxqM15zz5zDSB5E4CZM0IIkJ+dNrLIDTVuze2GRJD2xgX0XE1bhqIhc9vHiYX+Z
         s5RQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3J5Vc3xtZGtsKJ6uyos5rphUealC/z9u/IMKZlQfOHYrtzqDnVql4iyS8x7p3QV3f+infSnWbMqBo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1aErZ2eQs0awXhWYgM3qBQJ8FUEYpzHLUmsXnYAQFBm1TEIxt
	e1x+o/xGA7cPT82xiMc6Ho4olRLf9r+vZvnNECvB4WytmoSmXVM53RDp7wK/c1uUvdvJcih0qBo
	GHJIeROHY/Bm0+Bbp1FexLGlkcKo9XrfUq3bAk47YrsAN1Tofg5G6m5SzseIyyVoq
X-Gm-Gg: AfdE7cm7sriPoF66dOCfy915W6+J0yrGwBSJSbJ2O04nSDLJakf0VyJu/RiyrA1TWhW
	acTSIOB0Q9IoMyCtkYXt+mtIfpyDSAbay0H6X0ACJZf2H1hGkVkarlNT+UKXFHXEQnAMsIKeUEt
	0aKcpADXSgQtB1e9kQ3lfLyJmY9egdBafVVZ4pjb2s4IYYJVrUrPoLjONA8v5u+7vSPTgP11uFB
	ylFILN0uVgC7d+q/Fg9OfCQeTC/Icz4THYKsgsPp9SZLq0Og8LKAFikpfZJ5lymMN32r0BPTVPs
	gZn5joHYo+Nmxhu8CCtJ1kYdwDuKomEHNMcgse304DA5oAqc9o08QysEDzkDcb1c7tMDPEvE4xK
	U1XqOZJj0oN/wf+DHYJZ6L72c8rZWLjuP37zg2w==
X-Received: by 2002:a05:6a00:801b:b0:845:45b5:9825 with SMTP id d2e1a72fcca58-845a2c7e050mr6230937b3a.37.1782328135990;
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:801b:b0:845:45b5:9825 with SMTP id d2e1a72fcca58-845a2c7e050mr6230889b3a.37.1782328135381;
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 04/19] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Thu, 25 Jun 2026 00:38:15 +0530
Message-ID: <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _tHPi1GI3AJBWjIuIalaQNIG0M6SeqA9
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3c2b49 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2ptwrbyJC/iC
 5wnq323fQQ7fbaaItXGt7YFZf9kOlAHYQXxd4zK97LOGK3rRJct8odOsvu6eFs9ggBu2FtzeJf6
 nHqHSQyLSt36fb3AXN/DVSOMND3sZKM=
X-Proofpoint-ORIG-GUID: _tHPi1GI3AJBWjIuIalaQNIG0M6SeqA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7nBQmHDSVH2y
 mgvkkdhKpwNi8FuL7FYtC9OfV508ncRbVLxgo54mlgLEJ+taj74Xz5TGDduozgd4eeIKvR8s1V4
 lEfgr8Jcb1SguJ7er6lzQerMj3doYK0sHkdOVjbhbZhzwZ6HuNyTVXKCuFmDzBnynLkXXDjoSsX
 HutTUOqZPT6pNNW4pnikw/x6Zq1RMnZUJsTzgVz7ar+wKBQIhj7sMq/Z9QFScNVzMfvPm/1VRT/
 qUMxo2w1ybDloZKh29rcDaISA0J96oceVLFXq1KNziVoej5VYWIEEFfI081yJF9khzrfGyzs8KY
 payH8vAC2dUwIV1TFlWd4SNuPwSEHliSQvS9YOyiCdGaFcd0p8wgDA8+j2FvFVa5ETunCBXsEXa
 irqUg6pt2GOYajMisXlB76lhP7sILA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

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
index b78da40a4d60..83e4810f1c53 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2751,7 +2751,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0

