Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B93AA1BF
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256390; cv=none; b=Y1Cn9KXY2G+utQGEsvtDaHzV+Qv/2pRk5G9vJJJHZCAFYgXVGB/E0R0ttenjD9t3HVVgIHtI0cvw/ua33Lneb7o0ULhWdJudSICGHWWGpvHxAZ6k4eBSH4D2T0tvXER6WUUqAhdEPuvkq9nxRqTnfy3aBbx94gVtjucsKSEQhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256390; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hu1ZLjJxBYo12GoGBSKC9z0W8LGyo6ArXmMhSlXDeAb61geaLfzokbrf1jRTyLLuzEPFeOvd2EH2LK6+aT8xtf8iM6Eii5Ll5JavBu2TQDOM3Pgz+SlRtm5HY/9FNyV85GFFXCwQP8a/9Up6u1yw9QHR1ixH4C+lUlLMsZofjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpWJqQWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=admWCVXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpWJqQWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="admWCVXK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Vph2411512
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=GpWJqQWXfweDwNmj
	6xqtwlX9roDmCLyyowmW242yENQ/um8sW0UEfooqoTFZdcpLnPZszyJjh/7ae/sd
	pQfcpTgowSTpGTJvWMdNk64VJhZU3K5gICyfdculiAHN/a4qrf+9O9M/1scIjFyn
	v9pRU+6BgOvmpHDCNvtbakyXVmO6MyLwJ3nlaPxtvsRdgpIzIuD2cPMQe9Y2E2Xo
	jsHugN1yRivPXZFa6yExAR9v57zNWoL39JOss8YpEKHR+3RYHWy+65Vx429dd+la
	Nc2lrDRjp4ZA6F+GEXZapVKM1wYlAn2onFfLm6mEZjI752G1HT1xFFtCPqO65aaC
	nNmJ9w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165awfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9661acbf65cso810876241.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256387; x=1781861187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=admWCVXK2GOOVy33SMGg1rOi8wI6YHLxt6OIbsBuSOjZG+X0EEdQlYgEvi+mkKvSoH
         +eXScHqIkjnvvMScKQaVwx6y/dHg0qXsVX90FH85LN84IcaIBJtCZa0TZ86NdScNdE7N
         jJTxoDVTBxMCha6sRpRlKaygpTqxazP6X6nT+ZZSRNoPauVtWKSPThah64yyoGK5Ui4d
         E0gSWK7WSPdCXrXiw87YaJSpn+keCTAgzLv4QdrqxG4gmBhg84vAOPG+j4UebsWHti91
         fnqxduOiYYBJgwt9vdRFCDIVAlMvDPcgvkNnx3e1G+8KX14Q9r6NIoQ6J5CKIFLZ4BX8
         GSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256387; x=1781861187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=bRr8EX41GVHy9r7LVFZzaZ/1YrhGbIqCHydXPnl5QOxlHZgy+ph24jYpEbVJgUaZjw
         XC+V8bfOcvsCtE/OqE4xwURl3YA9c18cJ3ihb1zoiz0FuX2nQiFhCQ1JASMC8ZLMUpK6
         WnB+RIXVa+CaXq5n42piHFPS1HNXeL2KX10H6QLVC9OijFsIwhWEZ6wdtz+/JIz0FR1n
         OxOiAVi+FxtlkJ/fz1tmdhxw0WDl9Ik+s7T9A46ImF8m/0ooHsgljvcN6AJB2rNGtF2v
         vUfnuucl1JvlRhwpUWon18UVubEGGPwbu17PAsuMUlWZkT0FAjIW4RWmavWpg1J8KL1S
         h5tw==
X-Forwarded-Encrypted: i=1; AFNElJ8dOgnvFzNfVb7N4o3ZTy/oz+32oufFEPfAJc11tneI+1GGzybd527jmpuamEh8MAl9laqMXAVXECrb@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLLH7kGVoXuFXXIhIEgNUdeJBG87qo5TdfzLuoytQEDzdUasZ
	NIf+B4xYr6GRcCzrqGQsV5hyKVyQvErSz8s7gAu07FmMwUER57rzcKRWDnXOBvPHCDQlU0Z96if
	aU9sPeXkFGmt06NMu4VwJQbLD1Ypb1DO/BqaiQPR4E8w/CEZBSKOJKgh+Zit6JUkIBuEzFKyU
X-Gm-Gg: Acq92OEAxxFcseSSOciba06zj9rDE5t1l93AOjdZF/L1kASUCMma9Sll6cJGPAfIj9O
	p3yJKaOJbd5i5rCxRjzHkP2vqcBl3kDvsPwYzme+csrm8UgbizyMQGxv0wHWr1pkO5LHV+MxfmX
	OyxOZpU3Nt4E0ZVHd8GzLngJWNg04k9IMhJLn9mL2Rz2W8oa2Px2/ceLnAHBM/feWMqJbAfUEPM
	RuhCIwk6OpQ4fvTiiUZa+pPNsLf0pcr2ziH2/DbXtomLVqXMJRcpU2YF4a/U1NpaMjttFD5mlNC
	TWoUI8EE+EtASVvMUS9ZIluoSbSYh+9jgmMowyioYhUY2Lt2RT+FJkm38OsgTdh9bV4wEzgivvl
	I/1t9WiiTEADx2G8ETKdnAgjsOXjUsr1fR3OjfkgS5IcOp0KHhsZXSbApAfyhwjFAeHgZAZHF6P
	D2ksfWZSXoFzsQbhfgEpw9jY/Ue+hLb0nYXHg=
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796747137.14.1781256386596;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796737137.14.1781256386209;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:48 +0300
Subject: [PATCH v4 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-16-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRDFsqLGDWYoOyOaCpvBHq/7rzgZWJ/wHIO
 WZ50XFUH+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1VpRB/96OpmATW+x0xCVpCVxqXtI4/D7EodX72lSX7Tlb2+zEjDX/V7TNre3/9TSkWmegtuL9Mp
 m/4HCTfCQ+btfddAnZDgBztbUhjIarIQzWH6wHnC5FsUHNCPeoUEP1Qdsoup6YMeYgVuZH8q33c
 8jiqc66tOSghzn+S7jXRMSVFwqJW5v1E30FSzZyI6MH4GK8gQhZoypj/gn9wRW3MenPl58UX+w3
 F31p8sHvLEvhh8376Fxd0z/Q2WFPwrdnGWsgKnACt6RrKuMH6bAJ+ZALiiuq0hJukNKZsYyz0lH
 1MbHGMLuKu6uq1Y5f35BUQ03pE5kk0ndlIrZpIKJ/asjsLUu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX2hrLi2mslURL
 45fIPJdU7YO8THGMXpysJSHQqSztm5HCMd/xVPVt/J92iR75M3k7IGfQ8Ou/+lnT/9Z+Og3w3R0
 /qj6JCbB2/Fcz+xkA6bkBjtuTw6q8v7qo5/BafnoHCCuZ8Ey+BFALES1LlKApWq52u+p5OKbfQ5
 wGwFtSscXwTJc7Ze34X1INVXQTkG/MqPP7lWjjdtyS6QeCwyTuWwFIZQP2T0oqapEdcMPTxMatE
 TpJhO2WPrCnfBjWZoh0J3P47EdWEg0iyW+hS0U0EGOCSNCEhxQ59ntFWT3cJxYYMcC8J6IVvLi0
 SXBOVuEuIqx2bLD01R8N+45UW3MCW4RXteuGWXpJicyE47K4lg1HWcjuY+5EFuxXHwVbrvRK6ow
 3jgVN/aGunWiCX1kxOfjMsJBmKjzOHcV281DZlCj2XaU242nOVdYgJ7gXS14BDLOVOL7aliA1/o
 pgiJUWJ9kG1BJwgWXtg==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bd0c3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: p47GXMMiKCYb-ORExhMx2-nXL7RYX2dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+BtiDIdXVtTt
 7q5f1j0bpG6Rm+RfXDZr5zsUX+J3nbP+r/oL8BF+SQylEmDoj/ToJgCDdg0tzUY/f76ZLFynHA7
 zPCUR77aPDIAsgSO26pOgoig+6dYJiw=
X-Proofpoint-GUID: p47GXMMiKCYb-ORExhMx2-nXL7RYX2dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

