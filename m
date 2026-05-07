Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62C3D8901
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194241; cv=none; b=ftDkNIlVitFjvxu31xZyzAe+iktXos78py4nPpRbibFIZ6Xc5uyjtMBokEAFQRiYnxiwjoo9JZzx6oSNipkEOMxc2TSh8RkMOz7PQbRt/Hz6/YZfOXo3XwluXunYdcP9t4MV2jgD6lT2mqQgPXbKQFvqF5xUFeA7sQZio73kU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194241; c=relaxed/simple;
	bh=to/mt8DVhWYg+PxpdqvrCs2worc7HH9azPMfci+8vno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDpG7+73N7+W5/nQVDyTcqd3L866kFQhyi7Q30yCulzOV+uaTKj3BCysyvuG63DdJrz4KgAGgunhppgHWM5eZ7wsfxe7dCpA2rD/2XkAY6QKynH4SWWen77TBBCKWImzhTFs3L16D17mK3ceMB/hYVd2dgPU1pVaxo/+DpVhgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMfRawXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4+pxWvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMfRawXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4+pxWvd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647J7VJt2531395
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=; b=JMfRawXSv9QljR4f
	bqyCyWotnAiHLkD+GdZPIG1ly1Ti7cPUFD/VSa609y+Bka8FRxLZFJDXdQkXRa+l
	ivyZd/zWh3at6druFCXLg97FZNgzE01ge5JmgbXKJvsY6++CmYZVZJwmQOoWqw1B
	32e1e840D3buKyhKiEDzJ9CgafHXAyKmY2NB4rpUQud7KKtXkNhJu1LQ/69o4sAi
	4J33dqFqfZwriuHLmVq0AM/FsHveHYuxFg7eHWKYkhGaUQgW0w1b6hXojgs0bF2W
	57yZ3CipxukRrIlbCoUg99MWW1IomkQ9OEH6AuHcJs0pDyLTmZyH2mO5mEDRwt2D
	fU4NoQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9rm40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313c9d983fso81945137.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194238; x=1778799038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=;
        b=f4+pxWvd2NNpTzGM92AnI5MAEmrRth+n+4fOflfARGtzLo6QSmNmlF6HStLu1g6nYq
         rsRibi/g6dRG79qsPJWpTNPS5xD160RZmu0I9ajVU9m4JnMTNLt/Ps+73E/QBsXD0ErJ
         QlIYgkq7KvUcMHDRh7dO6avXCFxcAJ5hTq7j9EvFCiUGm/6sc1mPqCsulQEXQEONfh/8
         BQjMmvaOVxtjAQo2BRCoMvd7lYRe+7O2KQyxGc5wxqNKcNjQVToh7AgBwqZjoQ36dkmA
         vqExyQd8zZS9RuSXqxas1lBYr9ux054mzpi1vQ1nQesp14DBVmC70TKGIkr66jS78Iuf
         6h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194238; x=1778799038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=;
        b=BShOqxR7mrcgs9YqIB2ce9nHo9JZMxfousFEplnU1xquWOKyAHZ6GVXghHuRMSr/ov
         K9EAlnuxeIfxjRHnlWDxBu4mRXeCVehJ21OCOEm6EudWHrgJa/qKoLM9EMVGTG2fJjXl
         6TYd1Wp01V1xxXA7tqDdyhd2WRYCVrw4uTd2MAbIMqeHTsLSnuZKZ+f3r1GdSS42n5Ew
         hdUsmpdFcY+OAt7XtX70CT5ywSraIvxjDzDAO1iSeOUWUQhtbr6ED4ek/Xi/1lxQooTq
         1CHqkdm+5Ho7fTos2zDiupY7+hqXfA7RpAmk2nYWBS8IZxVZJBGBW6ibM2AqE5ZKPVTJ
         N3wA==
X-Forwarded-Encrypted: i=1; AFNElJ9npjZKCCGhJjhBWMVkoVzIC4M/4cIH92rFVZPz4104Z9QurLBbpXZhmKLmcJDbepIhFiueAQ9YE694@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ZWcoxX8+QUGwsnPXgCPmHjyIFncEPvbZTkbg08TjjumVRlp1
	GjFa79YxtXeGwWYGYaugn347XVQAYyFL8+zK+IjoN0e3aNI3qvxmZJaUSt/lC4J7DID1OyjBB2f
	x6Fm2LU+b1nGFQUWYC/Cftp31W1m+22sZOrcKimoCFptfXABtuec95a84snG+zh5f
X-Gm-Gg: AeBDies7n+bcd0oGHT/GMapEf9xbw3gaYaQ6+WRw2uV2QOUtVJECtPQK5OG3AF8a6sx
	yaSgUag66n0fh0p7xR5U9oiKTqz60oJpyx/2EX+qvC3+bb8kKlOdwuHK/g0j83J8HZarkXsLvbq
	s/F8BCS1fqmrPZlHEIlijZbH0/R6qa5Yt+xGTeG1t/tZZWxgFCRolcd4gG4xZ6LohYT5F08XEYI
	6zW1p5ati9NB0MwiymiZO75c8q3V42fnw1T0Tbhu5hTw0nwPyqS0uAx2cnB9qRBHd3w2Xap3F50
	Arv41F4/TyN/Sd+cis6At3k9drYoT9dstCNXQIuWNQcptIGkhK1Ssqfozrp6L9i9395Wt1joDUy
	i7Gq1M1PR3kyTPYCbXK0YLkdhq3wRmaVc3i5I8fYMrnUtQ+HAVMUdOge/f2nF3lsKex/dWUHZMf
	aqXiLaROPvTzloz4T0
X-Received: by 2002:a05:6102:4408:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-630f9017661mr5371544137.25.1778194238043;
        Thu, 07 May 2026 15:50:38 -0700 (PDT)
X-Received: by 2002:a05:6102:4408:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-630f9017661mr5371528137.25.1778194237657;
        Thu, 07 May 2026 15:50:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:26 +0200
Subject: [PATCH v3 11/15] media: qcom: camss: Populate CAMSS child devices
 via DT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-11-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: BYm8huLtxOcEfCcgh_RYKyBH3vqegc8t
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd173f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5bRy6lfvdnCUHtv4pvsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX4v85WkxZ2MSV
 MhSi79u6AmAx2+XmDte2XWTsqxhnvhf5T8PBnTyyPXb7QN0KdumTsNmnXWjyC1pNzgd7UCeMxC7
 3WsI57ajACvEzbp3QWcTGlgcWxsGTmIK1Nku4C1xq6wh26OhHO17n05br1bqSJdvfjrGarefflZ
 5+HB7x9dmrQ2e+GuXamTDvlWv+A3LJ+ptAGnJq2CdhpaLpepBdtYezuR5qRCXFKVEF0DvQ63hkc
 C5qgkySgv37/QJzchnZcYRCCa0KW7/dHWOlhyjC2HoYrdBxZgXiJx9EKop2X4oYw/rRFwwARpke
 qpVi9B2lz74p2MKjEvf1l1CiKE9ac6wFrmKzASq4hd6ktoktGWKCS4O2grSdDtKQQjlq0xiTNlM
 jO3wKWzYeVuqdkjdfxK7JQhjs19bCBLFOVtEpAPqaEVwRUnWRBYHLh2i3mdB3QOq4YyXOH2z9Sy
 DFkV8GAWSr5HvV+XOHw==
X-Proofpoint-ORIG-GUID: BYm8huLtxOcEfCcgh_RYKyBH3vqegc8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() so that child nodes declared under the
CAMSS device tree node (e.g. OPE) are automatically instantiated as
platform devices. This is required now that CAMSS is modelled as a
simple-bus and ISP blocks such as OPE are described as child nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0ceab12d573ee7521d44b77d23ee563930d6aac3..6d65b1e08e30246389657a0e46477d33bb5ac27c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_clock.h>
@@ -4631,6 +4632,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.34.1

