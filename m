Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C03D349C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194215; cv=none; b=iMKOUtf83oFhNDZAJ1Bssk42LmSfdoM7YmtpzNYcIhJKOB6pKK+kMAUUZsT5cewCITrqp/v/YWqJ9IvUn4hfgarODdRq0i9+kINrD29ItDxGkAdeXtVY3ltTbrrjASpqUxvk1H61CgPeaP2NC30FFHX+7YT/EkAESNnV4JugoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194215; c=relaxed/simple;
	bh=DeoGvIk2JM6d3iYKy2epXQEX0HxjaKrwSQKtJe5us/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b40lGjYQSc91TUuUrbPwuEsI7bUwSX0P+tq7tZEyrxfytoIZczPBxXlXN66GvuR/pFU3zwFoE0wmJqZG6WEvB47YffY2/3cm7sV0qgbuhH1rQR+PdaMs+rVSiIQa73V1UZw1WTaiq05mNVhlZBsTiHLvX4E6549QT1HJqjgCBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCQoeyTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY84Ia4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCQoeyTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY84Ia4U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647KwKp92778601
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=; b=mCQoeyTpvVA7XDYn
	ZJ3rL90ZeOGF12kxncfq0nwsHq0+hl9jeWIqVrJyX34O39r6SHIQuPGMBduHpyeQ
	uV32k9OdLE91iCmWbyfcEgi7EQnxrBHnynuYk2XknEWh9EszpJgM08yjF/BVDW+6
	nLsHvSLahnbyUZGVpc/9qsrv7lUr5j/9RxW2vZxlwuKGOTjknbCQ4mkfoO4E2QCb
	AP9PMNeNN5mgW1+xhf9TPCwYOcwZN+Xls53EMqkDBYDGoGM913ftm5DNl7xLBWam
	E7jFutzSm4uhPoc2w2Kcr5hYr7oiZgRAb6coakDzXDhePcAjZsoXDcd2mIsdIoV/
	uGk1OQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285g95x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62e94ae0479so5172637137.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194211; x=1778799011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=hY84Ia4UACwUitlRjctguziFEGWLtwiJU5yxbCZbmLM3QIHWabZ9D0m2oO+7u7Yqcq
         fXdEcXDqM86PCWjjXvHakGpxgWPYBN5jCMQ/h24ef1gadthThUfBLDZOszeW6NVs0qvu
         PnbhfDZIOH7enMVbYtMEcQrNbrOjSoYGmhWhKyHw8eWZT1QsN9Nflk3Q/yy3/9NAtEIy
         HuF1UzN0RlZICpmEplkKm+XqMksPkaZcSsKeuDyrtuzuPn4VcjyqciCHtL+t5km914gr
         s/2rB8hWAw/wQ4i2LOn+jIlF1xwu1NCxWhfLLdueQY28jP8MY3wC8BrlUtD+YHwJQYNS
         IuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194211; x=1778799011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=dkc4YfhlUXbKwuL9VKL8ELqtz055fv+xTT53UsUzkuFF2QLdi2/wv/mOpvUXoz9iHh
         ZSDddbcyNyrp2MKrcn99A8qDlj9TjJ783BTYddIE3jLr22yhSURY2gyB2WvSSiSx6K13
         ZQY+0VlRHX5Yr/fwEMQMbr0EXiiy6tvvu9egYz2Pge7GsjUOpYeoghCmrhk6W3xbiDRW
         SZb/eDSHQMueYnGyAv1PX3u+nws99L3hcaZk6WBooclKdHGVeEb63MNVyCKOZyQGHy4H
         RufTgcBbKSaf0CqfnpoRV4Zrav4g7Wq/fbFjVipngK7tQAXd03IpaAKRDs+VAw/JF0tI
         Glfw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jf7uk4JhSTB4quk3YZ2b0huyWJ7lhHrR3/+YkNDb8Zxmav4YovqNFEO2FVLbdSyuqzQ06NuDFef3t@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdvQInEqww5/NFPMc+piMY/QG9KltQ8Xmai0HZJMirPqEhUal
	py2C4xsACVeXBSChNpL8DViMtULc2bomfD8uHEpHmBLqHwkZVULtFy8LTEJusJ9S0/GSvpUuthe
	XVR/361rc9mHolT/bQyqIhZrFh4KlAeKK1C6QimLIahs5pscl8bIbbrnRZNZi6nRt
X-Gm-Gg: AeBDiesTNYDdh/zMFkqa3qN/bOD6v0b6U6N8J9b7dPJPBVc79jDQfFfjtwH4iyYSyGa
	wcJ9RjWaSkKVdfEjt2h3E3jVUUsDD4EK0S03rfwOnZbTnBFRKmfV35+AoDFgw6XIUx0kDTNnNXZ
	kfihyzfiF2nY6djrzEOO9mYWzRGw0TXXTCYio9NxEBmFqHFbaVG0cNYFqTqewoLuFkig9fPbjPK
	QY/GZcbNnobtFErvSio9QcxLyzscubbXmbQX1GcUF3Q7MK1lk6CSaYew/gRBldN9XcCEt+vOEbx
	4sX28eAZ/lshX9LAC3VMNBYT5A+ADWfQPjPjdnJR4c2NzKOul8r2E+1wo/VgJQ94+5e5Gn8gJn8
	Ga4KOTJgpAfSLNu45AmZRwKeevvgOt/DamZxH1r6+O2gwqpgLjqZop2CfJVWrP13Vmv7VDtIK7H
	oIIXegDKCIPHZokLox
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101566137.20.1778194211137;
        Thu, 07 May 2026 15:50:11 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101543137.20.1778194210720;
        Thu, 07 May 2026 15:50:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:17 +0200
Subject: [PATCH v3 02/15] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-2-bb1055274603@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX/YA7QgggteXj
 l/Bfqk5peQVFTNANdmIVB5/1PgEZbDmgx+50Z88xW0A1GbQHw36v+pPhOILZFnBEhhtgJN1oUVp
 2f3pPIv4zBs18sjotxI5th4SwkK4JqJJpZkzlcBhlN2VZYU+8aqvxa12Zsq/CAdXdvWVwZ6yDDB
 W4ccnWJMurQgLxGC/VrJzK99cILgglWs7bI/327mF9zW9E2VIhyWXof2gejBybR2ZnY0elYyQZT
 qPZskHZJJ4NHWhtUImgYixkW37hHK7KwNi2J6FPCiqRFUxAXcM8lMFh4eAPIUt2DvRRv8mJFm5s
 SXGbv5nh3xpq9Y6Ix2P5S6wYIhplfq9NlJcPNQClzN72A7rR5606hRLXyRbhLlyZyyvoC+Tujmq
 /Y8L238TiVLDncd7r2OMEjwnw4fhIV/ozEUkBDIKG70Fe8IbmyXdtgqjfNCa3opcIYTv91sH46M
 6sxdfyApdP+48Xb/mAA==
X-Proofpoint-GUID: v9MdvpQm8lZ_XnOSFh6fLHnrxntEXD2b
X-Proofpoint-ORIG-GUID: v9MdvpQm8lZ_XnOSFh6fLHnrxntEXD2b
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fd1724 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gZ4aIBoJpEVIEF-KsNAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070231

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c37d5bfb4072d4d94a8abd453b89c9aad7e15001..3bde26c4750ea932ea69fdbf5c5da9f959e5e5e2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4830,6 +4830,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

