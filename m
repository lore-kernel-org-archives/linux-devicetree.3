Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28483DA5B5
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555881; cv=none; b=hB9v6JlNuVQcsWnsHtKZ7KTNEG0qwEgHa7Pan88wg/Lwgje6HQq01OD5V6uxFAVl9WrrGO9c8YswoUdcF4y6owZApGUBL96yPkccvwJ3vxTgnDtseyT2hBq9rmC0NJbwz8s6p0kvofHcFKsizD4HGmozwEbSIWG+KpqMgcRAk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555881; c=relaxed/simple;
	bh=fpy686p8ddKfyBsPF5CtRR1fnIjNugEqnWE+etuOQjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKhA0RvDJ5XnYjxMWscgSV1AvwYTROKIffGdqqg2JjEMZ7zQYD2sMiMG40dKIzOwiedBj31nxqBe5n42U/pKDlVGS7io65HbiL5FiKPWDc6n/+EtzHHEtQToM/Vykps5wb/QWbPoEVfKqZzc8rTwfB4SS8g3IoTXrTmKJdPZCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjQ7e68W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjOIUrVK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjQ7e68W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjOIUrVK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540toUf598076
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=; b=WjQ7e68WNO+wU0zV
	dGUp414Hr7HAL5YpWcHuOp9E6BZWI+kZS3dHY9KnC+hV6a/k94rLrm+e2m0dv7Sn
	wNRdON9ssESYFfiK/JLAvwEVdtX5IxRQzuLnZrUTA2I61xYFgz9NBSXLniQJ9o6r
	PW3QRYxhXA6q6KG+x1bnRIUvKJLkVnGpNVmWAhMPZr8eFsWPeYV2F4M+1PdzTNd2
	bu+x3nLGXpWscvNDjGIaahQZKQbtxCWUysoQxXRfsr+RjhwfcPcuRdvm0s0hBcCj
	coyn90pWlCFpWBKGMqG8yXnnCFF28GrUyB5vMko4YEyKw2Wf754zoLOcs9VVPL4k
	+A436A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m11gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:51:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428419982eso371829b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555878; x=1781160678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=;
        b=OjOIUrVKU3exK8VyPOPM77y3/X1TVowMMdU/CKYCHl9o+e6P2J8+wP/9i+bHw7hVMM
         O5/EhGniUdXUAV1eBq9KqDEQDgM2+UVwE5WXIi2Eb3JCtCCXZvk+jV4K4ENEvg3wdmpx
         dlilu9iEe6lyZ4ZGJaHw13b9fUB8RCzjn2+UmgU+YIRVd5aa+6BmtTIHtycqF4CRO4eE
         97KgYlBdTFMk/15JTVisDPxCvvZ7P6mpmzNkNGYWKzk/AlGlg/pIwSQiKHW29YYlE9h+
         cUN89ZJrIbLIPqtoHsi0SxMZEr/gCNPjfEgIs78Y3/fzK064znlUR/afjfbAmLuoGef4
         MugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555878; x=1781160678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2088GKdH+0zCG19DSxc84/cxuUQLcsZtoIjUnM9OSZk=;
        b=tJzphyeAlrOsv9CIrIY3oAiRH+CMcOVDFMJyzirX+AW0vXu2r5zRTNukV3l+BK9JQl
         PJKeq5h8WKy9FUX4UOkbb8WjFrA9hj4YOyDX6N8YVNKdg1Aq55+1e+gN69zQLOZBCGz8
         CKGhLKEBZ3urcKn0/sc85A8yk0BEsoS3oaandBCKAEmwj+X2UTyMQ0Yw1+oVfw91okOc
         NpfdS1pEZPx72ncl9+lIuN3ijVvQmG+Dqzxvljh1Dkcg06/qtMPWm47gIh0AJPkcZtYG
         lYHFfcpA/0lrdi7cB1o7pocqRYJErHIDi7zfZ5UnO03ciZiRVHk5Mql5r+euR8FmCAAN
         UmoA==
X-Forwarded-Encrypted: i=1; AFNElJ+4y2OoSrTON8TGpoc+KA7uLbM+oXfQ/OilM33X9fXWxe6e+5gBqmbPL40omClEV/W5a5HFysUup4Tq@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9Sf10pYCTh4W6CxBIVpsU+aVe2bc/LFLvrLuWKcFrY5dkzjP
	FMErUIe48QcqbqLU1aqbbkvD8FIsrCyEsXWQHuEJmIINKttMYC4q23gs6nsnoYVL9GtB84PKs1m
	IpwSIVzMZ1CdIo9NQiqiLpARg1t3Ir0l1jy+2wRfoAOE52tS2f6hvf/a5Gc0rJXJQ
X-Gm-Gg: Acq92OGZQJRL7AgZDDpafLpGaqAhDikdfPjhF+tyqY8O39W92V+QfBybQdeiNEqaqZG
	sOldm89x23A7NvmbY5Tp1Nc7TZzQaBaZ2sqo4hVkznxk1vZa6crzQjgjL58kBV66DivNniNa6zh
	DgT3qu8T26dUlWZFtocQr4FJPLVgkXAOopHcdqHXDxNkZLOzMllKEQlkninkOHtma91ScoDxOE0
	pnrfXw7UVsIgoRTUwshzOB2usR2LREHFz/xygcKtCHcHAnmsnwbHUIS8iGut7OsEb+TGRwA4I5e
	dvrYuah55uK+j5ulZlWGRdYloL8wYtSAkoQMHfCKBnb3n+tt4b81OPcE1MrAP/iazTc+adDWexk
	31+lpbQm4LV0M3hGuA0slH/ggk7scKyFPuqtaD2Rv39UsjltBkd225YjGRmri0jsBlg==
X-Received: by 2002:a05:6a00:451b:b0:834:e092:2631 with SMTP id d2e1a72fcca58-84284def9b3mr6399197b3a.8.1780555878106;
        Wed, 03 Jun 2026 23:51:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:834:e092:2631 with SMTP id d2e1a72fcca58-84284def9b3mr6399171b3a.8.1780555877584;
        Wed, 03 Jun 2026 23:51:17 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:17 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:37 +0530
Subject: [PATCH v3 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-3-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=2060;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fpy686p8ddKfyBsPF5CtRR1fnIjNugEqnWE+etuOQjA=;
 b=pcA7p5YWDG4hCeq130/J37d67EimO2DpnPJYKmiICTCw7KfXE+tSrz15gtNbpWrvc3bYmqQKC
 iIz46UvSQCWBQSxL+lk22jcwjFD1DdvyMn/DvSa3ZNwPE5d/V5VnbE/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a212066 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i7xoKaWEWnc8ZE6DH4sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX+uZsz6URYmrh
 730DHcMf8Jx/jDG+Isuiy6UYw/QgPlqrAZVIsOhUfrRuF+sXSmBaRg5sls36pXWEKGa9G4Yvl7b
 YRMm2QUuznJ0wf3XqNrU1zsLAfkqvboUGU6+huvFSJZsD/miUzSC9WEVblwP+S7pMSTi44jBXEw
 kuA0gj7Bd30NfJPRAdTnfkifzR/DEsIQoP508InVzLhd//emyZ6nn7xPZR6coVhjG3XOcLq9gA0
 zVytDDCuAnjEBZuyiWBDPYIHpBpkaEIKLNZo9gVwIwSbh/ELAfSDdw3UaGHlzh+D2CBwEvqjeou
 gb6oYyFveCcTvtlnZGPgHk1jfEtPNf0CQpOvmN9f1/F2aNxTwKwRJ0CN0+N0/Z4jgv04tSrm/e5
 5fSURDiriqVmiFZeAA8yEMySboujmU99xiv7xNvgOfim+AkIjwru1dNbhL7+1s/BMLSwXkWyI7A
 ZUDymf9CvbgQgooFmdQ==
X-Proofpoint-GUID: 2DpRTS79BSayWZXB9myapTdGdCZCAJmY
X-Proofpoint-ORIG-GUID: 2DpRTS79BSayWZXB9myapTdGdCZCAJmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040065

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added the OPP rate restoration in resume callback.
---
 drivers/spi/spi-geni-qcom.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 333216df922e..420534937695 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1119,16 +1119,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
-
-	ret = geni_se_resources_off(&mas->se);
-	if (ret)
-		return ret;
 
-	return geni_icc_disable(&mas->se);
+	return geni_se_resources_deactivate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1137,15 +1129,14 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_icc_enable(&mas->se);
+	ret = geni_se_resources_activate(&mas->se);
 	if (ret)
 		return ret;
 
-	ret = geni_se_resources_on(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->se.has_opp)
+		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
 
-	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
+	return 0;
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)

-- 
2.34.1

