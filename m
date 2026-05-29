Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D500351C2A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017038; cv=none; b=gmu4+e86OmvZVJR3Bxti/7ipDJ40z+bUOjulBOPKL+IsHwggIWtPmARXb30HqzfL76mZ5f2nQ1w7ndUj181gl1/jOvHBOoKlyj6685+l8rx75auezl0TD5SCeHOhtHH99Cp7uZAG4bgrG6udBBeGACNxED9+/3oRQ2pwyj9+PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017038; c=relaxed/simple;
	bh=SqRYyWGxDpggIYoY312hZiHBKDzS7/Y1bj/4uMnD8EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2K6geOPLCjSn4dWGt1mgiF/WXJo0Ja5ZyWGHAPRRo/cjMnclfHaPTXg/qom36AbckFGlEsAbVtPD7qmyteshFCaVVd96j0JmBmmL0iTMQZU8sUf5aj6CCBFSOy0vMal0PjA5pGm3vwayHnQj8A/wCCW2Ps3m/IQvU9HkJeun2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2U6yIqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUk8rV8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2U6yIqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUk8rV8q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkddT1931979
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=; b=k2U6yIqsbXGzlfv9
	Jkz8GPwIROxGvmYMXqyCLYLTfEzhcT2hfU62gKWG9yu3gPwFgIBn3CEH+1Wl1Z+M
	+51S11FRPKOH9Jt7ieKGFHwLXqoNgq3yQqFqUYE/kygOZ0nedyyQmhObq1lEZFtV
	XU+N+fc6OebMrbwH7NwhIcXGRmlXaqIELHPIUs3YP/1ztsnFEWTofXcAWWVXKqlV
	++h3ZY6O6dy3qa0t0h/7w3ac+sMrGllcleNwUiVpaIfSU8Dj+7ytJWq+IASKELMv
	nBgJMWZikQ0wrBvT9njDdFnAiSgOWkc67SR0PLN2FAOruVl9PBzmS1WIWDYRI0Dj
	wLlcgg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxa9wj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304e7fbfaf5so1707512eec.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780017036; x=1780621836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=;
        b=KUk8rV8qsejG9eczKExSh4KZ0MZqZSFi3grNHx6m+yqxZhw+T6C6/8BwEy5shQx3iS
         04E24UMeiWVvCdLkNLMhMuxvbXyNRZnP0GmIprt4Zt1xy5RkfjzvXC2czhU7rPSqdAkV
         +gtu7+RvYQJz8O+YQ4UrZUs3w77Ee+0b2zB06+NCMHkW+N4YRA4vcgVCjaf3uDlx9GVu
         E8cxVMmmdukEfZfxkHlEWCsXZa8fOLHEyIm6AKNHvJI7u6+SOVrE6fDqWQPRMIkObFmN
         4AKg/YgZUaiSZw52P5yWPvTjInw5t6VL5f+BBHQcIBK4qvsyp2lFztN9QSj70MBcnz+7
         uF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017036; x=1780621836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=;
        b=prowSwZXXi1uFv06RoJa1AdVB6FZGJ5s4GAwOW4t0kvNLvH0qBqi+8z51oUQA0Jb2S
         /nlxHI0IMgjp2rR5jYHfLbEEulO1Vf443I9V1ZL9ewuL2hQLyJi5mR/7kkeuqOwFN+VK
         jNJCf5HdDELmqouovW333ljrQe/Z7Ai8FjL3ULyS3dmZ4FMqyEzsG9xqoFVpYurvmA2S
         skEFmEoJheE9LujzZQy6FuE2NKbbnVIrT9FQPK5zIrxrCSkDWbZBnHLosg3vevQBQu1E
         qyT70VW6YmGU241Px/begKGUVfrYC/14Cok5dq07wHCY5WxAndcx+Ovl7ez7vqtgfjlX
         owYw==
X-Forwarded-Encrypted: i=1; AFNElJ9T46AR7VBrWwd1TjnQ/vecl7iHP4nb6yCBa5yd3EcqeyKhQO96qH9xkj761xTTByDdhXKMZxKvzS0+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BoqwhGbOU4SI0+BrNJloLLrU8516HORyHCUrq1EouXlKyARB
	rkVIQDG4DwiOViMdW6xDwX59QTCY0Y4xO/Zi/+1K9y66PEzmVl1GC9JfkdWDoWCXTc+PJ51L+Ot
	XfUkZ5F8bWmI4s8PB0hWzIQsFDvoK9Bn1SiYHZEhV6E0Wx4q6oE50ZxOJEbPOmlrx
X-Gm-Gg: Acq92OFwExcQOks1zQPrPdxriHv1/jFCWMEAZB0tlf41bTjdTyJgdEySxSrmlhcWYHA
	jmcZbTgQtaWzEqvbPJdqtrmB0BR8EX6IXaORMHrZAteCHATqNXKd2EZfP5vdiYS6YUFcHxg23I1
	//AAk+x2bxS4+Hy5XDOsF8kBDjmX3eFOUMQ1tWI8Yn7BkS+HxR07Vl1dBjGeHzARD38r+2suLjq
	NyAYt5SEeNwAFzNypn5DbzaKKiuYYuLfkqNRqWlPhqlhGTqx1kgSfFbJPNrq7atHDxQuQiyAXen
	eN2aP6pSVzpk9fa70yI/49sN//5Uht3XgQfceax4eI+ZhJmx1T82r3YFzUGsipatuJMcqot+sXs
	MbMBmGcGXVxyqEBZWS0P9wjsWAofwlkGGPjHyg4lBuRBxfgGsBZ2p5/2vBclZwbL1dlPeqQ==
X-Received: by 2002:a05:7300:7313:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-304eb161d3fmr378814eec.30.1780017036075;
        Thu, 28 May 2026 18:10:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7313:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-304eb161d3fmr378787eec.30.1780017035380;
        Thu, 28 May 2026 18:10:35 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a114dsm173785eec.24.2026.05.28.18.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 29 May 2026 01:10:09 +0000
Subject: [PATCH v2 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-hawi-pcie-v2-2-de87c6cc230c@oss.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
In-Reply-To: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780017033; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=SqRYyWGxDpggIYoY312hZiHBKDzS7/Y1bj/4uMnD8EA=;
 b=x2Mhs1h6QGe3C4hNRrzrpoZoETXQ2icHktNcZc//QGUXgaYDXCh2J0HryCQSgSeaG6TwVcjag
 AjHlnzlbhLMBN167zvse9emeWKy4lZdA/Veg3xo7Ms8JJvicb1ZMpOB
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: 6kCKGkcw1zH5U9y82QtgSgnWOwcsr3w0
X-Proofpoint-ORIG-GUID: 6kCKGkcw1zH5U9y82QtgSgnWOwcsr3w0
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a18e78c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwOCBTYWx0ZWRfX1TedUO1EhOLt
 F5xwlIY+aqZ6xdjMEBNvdWP7cwc1WG2BAcUC7/WgE2uqnoRxCj7coR82GR4Gnu/TsMPKmd2d6Y/
 j3MoCUAP5cHFwtpfFNoA3rPUXZfj14u22l5aKL/1MBbVq2qUuxrE/Ct0/f83Whzg72/N9J8wE+s
 DhKokLbv1+o0YweMQ8UXe/5f2qJn6zYF958AwcUyTvfxBKQcngOH+6JANFrxGXzc9kP6u0URoeo
 kg4g8/WnfWWVQ6b8j8M4jo3BoLFCJd+8Eu02yRefJZvMkigTmSqnH7PQ4OefPY82I0vwE4uUrQI
 F158Y70or1oenvlYwaL6vXaMFpSwg+hi2lZ4IWsP3ay0iMXxXVY+0AgAufq3ukJO49yjVrFcHYA
 uezO37uGoCUGDqu7NAIBRkC8+Bczcdx9oe6WOSTEIOzwJ3xUs+j9HCY/X8O8GLwgpnE/bPl5zXk
 JmTUEHZWKvgSwHtCoKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290008

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..5fe8667fdb8f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2280,6 +2280,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

