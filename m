Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078513EF648
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065506; cv=none; b=Pn415c/M78HqCjcJ/NFgNIUHRbATZHyT66oVeZbY/e4GbssUHa6FGDyMIgSLdhlVSvzc3p8UIJA14EPpF39JqS93qRPncrETtmRRuBSDTWxqGPN8BPaJ6ClUgDbPQdsjT9utaZKoTnQ0oclwvsN4EsSk21uvVM6vvDFSDcNKLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065506; c=relaxed/simple;
	bh=2l7ASUVYGl+MTHZQX1kdxBx7D4NE1H4xPHCxp/OAHqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhHWGYeyZ9pNRJznGEjaB8dx2d9ny+EBHEhVGHEfROjBnNnLCcQSaSqqIRqZ4t43Wq4TkJ8s50kBIJ4GbRwFgvF0dlGyg0QTp4ipdEPILgk36IBu/3gsnf5JowAYkMOarUFbtiY2IFfy9VXlzQVSGEmamlnsF+jq2YyqduIpN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZfrr961; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERqOVPWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZfrr961";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERqOVPWr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDs1154455
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=; b=KZfrr961hmLBrKT9
	XiTWDl1D1ZNymTD9ynXZ2wsPMxqsUEdrMwPyim1m8QKsz3i3seGeerTit/8d1Kt2
	2yAKhlEVaW7BveEhaQJYlq6y7XM3soaiPiGhSN2bEk0E5due9vKd1FlEZrkgDBYc
	jlRDc2GWOyTDSuKKLoll4/FlyfEqgj5J6tME6WbEkvOSNobTy3nGbWWjVtq27V2C
	0cpccSLA8p5MBvCC83sreqnvHPlE5uz54LtDpoZL4Rngh41rMd144hYhXtPC1mZO
	Y2QqCElPykRdZid8aQFgqKTQG2FHYDVOmvX+hFF7VoszyajyspZ/C+al1ikIG51p
	EvdENQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c7f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:38:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so8151926a12.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065504; x=1780670304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=;
        b=ERqOVPWryyh/XgTcyw8ItZzQFLhHDkMF4OkkKRBPRU4DPFXqYMh3Y0JrEF9qJX6XLh
         0PubI+A3rdS/PxObtvtq1WvUk0P6jjzxvzDpBrbYHwE7kfoTF62ZVOAqbXceOAEhzrAG
         S8lr8VO3GGYa1RAIxaxtA6vxJZHb+If6xL+GXha6Tbbgr6zOWo5LBGDBTr3ceSlWY+1N
         iCMLzLNgDFT5do+vy2KDC1l/0lJ9oGviawuXzBNQzSAK//a9wgFT5cOODNhPqW4vIJEp
         g6+A89n6ybmGr+jn/N+tT2+xgJH02QwDHfuTlhNpz40Duu0OIAMwIIKN0GYQmxVZx/Bi
         WZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065504; x=1780670304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=;
        b=MLAlimuapewYiaUUoSt9DN/knhvmx989nrivhY1+sZgXo8xBfFiVUbIyuDRKMEqUAz
         BUC29Kc0r13up4g+LRXOWAxoFP9UZydFfbhPegYlRna5RdEGBc1mqsa2PnvdyFu6WlH0
         sBXOU7O8KOZwH7AAKgKedfmV/Hn02SrcqUgZLYXxzh83+WPKZ8YqA0ZMPMA9g4Jj8ESA
         xoel/Uv44V2lg/ASKOgCyPoTB5yyE0LnY/Bcu+DGc47u8MllcHDrv5T6hMxe5Cf1U9Al
         Q33wVMEF0lIbwMZy5F+obIOcBr7UBTS5eFp8fQVRZBbIYxaxw6sCFyZwcSMCzAZh2bY8
         Sh4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9k2DOGjPMuo/6EvqYTon7SwR0zGNUSYNxkEx8Mdd1lfoGdnyLcpuFc3GySjoMywvt0+Y/8UaWRQb8B@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYgF+BO3FDhGqwagdPdrw7aogMHJLQrIlNYCkeU4ZgGkpFVTr
	p04c/RO4FE81MsEK/CuCFvUsZdOfHXGb02rZmB/vH+sNvwJoxtV7OtKEHmBF+iyize0ZxGjppDp
	6MFM1f+nl6hCRgYl9y7shpipHqhLc2Sz4a2mS6rL12m9FlAhbIatqOzFG6rFxrcD7
X-Gm-Gg: Acq92OHvXccZWJS9TdzZPedBPUgAuh8g/3N4w2fjNTxk/9ncx43xSa4wZ01wqIdXTsz
	FRjMQeQ1zrUGObMAOvoIoZBeD/4Feh2lesFAZ6yKhOB6CT4WBa5hpLFT2ekkVJpwZKsYOsXP68o
	cxjIHFuEFq2NpRi0fRSxv1l4yUMD+NyWk0VGjKAQLv3O7j2FjiVokBIRX1/APiRaWyqrTB7jTOD
	qLmiLHEd4GUa3U0mV6yI+5wurJ47vhvb9pFD8ESzGN3CVG8kSsUI+mi+ews0+RsNECIcC6SNZhT
	rXtHw4AiuPk8n94/T5kKQ7W+ZodqiqWGebPhGjZJQq/iuyC7jdckpfzzpIotCOuD17yYnCsJncn
	kDNuBarTRLcjyWEvfMDtLGfvd4dC1avgElgk1bb0UWEuo70Aph8C6xUwsEUaDrUZafA==
X-Received: by 2002:a17:90b:4cc9:b0:36a:3176:ad08 with SMTP id 98e67ed59e1d1-36bbcff7b2dmr3693051a91.25.1780065503617;
        Fri, 29 May 2026 07:38:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc9:b0:36a:3176:ad08 with SMTP id 98e67ed59e1d1-36bbcff7b2dmr3692997a91.25.1780065503106;
        Fri, 29 May 2026 07:38:23 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:22 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:26 +0530
Subject: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1246;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=cjRbYS3MDx7sjTRWCdrbRmdl5hn7CXbudx8PwfgWcG4=;
 b=Y+9dlGWNrAcbBsDrknHM1Mie43lV9Z4E356FDUowae3qBsowgbcnLblt/w2+TPEFBvqN7iz2Y
 /EP3L149QFcBpoqzk+zGxdSant8Ug9v6mny0vsvig07ourJidmQq/Ez
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a19a4e0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mRZuhVVaaiH9Hk074e4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: mbNlKqCVCGZSMIaMHFfIqnmDr5t2wf5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX11ofvMU2YyTr
 zGQufs1L1r3rsIaYo4BuLEMFb0bvPJ1DF758uUSmS0NxOqF0XfvLcFiUPLRMkUkrGY/nG+TSpRd
 HMqRMAU2EHsrTdgYFw7aYzUj1Dv2rMr1rlnboNhGoUc/ipamWwkIk7g+1s3ZAUK4WoUIJr9IiOH
 19H7xu6xEEn5KQr6rmL65YSLgYl+OK3Uih6FX7e0pQxSCQcAY1eL/dz4imjX/JKF/1xgF2ty7/x
 kRL6Y7uXznbaKNVbajDbYZK5sh0dfAZu0cvNzKbLOTSL87U/AdftGrCb2aV7D0jvIZlWhVAPkv5
 PWoXj1zJJGojZH2P6Q6LGZOWkjFU8r0euQM2dPpMUgE+8MpTHccLmoMfiS/ChA9ZklDSNR5OseV
 NG/siPbWcani3mZsa6j2o4uGQe4I5yemVW4f/rpgdVRwTTlC59Gew7VdfRWpAw7h5/zkC/PYvsG
 IJqdl7Bt1+koOMz2Mdw==
X-Proofpoint-ORIG-GUID: mbNlKqCVCGZSMIaMHFfIqnmDr5t2wf5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290144

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Enumerate csiphy, csid vfe and tpg resources for Glymur.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 864e16e999e3..004df8fdf08c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5564,6 +5564,17 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources glymur_resources = {
 	.version = CAMSS_GLYMUR,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.43.0

