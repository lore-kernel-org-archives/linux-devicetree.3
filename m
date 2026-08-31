Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3D3C4565
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161194; cv=none; b=c1xMbZyGPCoAfC+zuHnZuInG8xHi8aMVbM+JYReHiiM6aAI9nlAMOUh1B52Foz1j36ZnwTI7AWZtZ5oKSTDHSsMslX9P79spYKrij974sWQxRkMtPt9RO/UgiQEzNy8WowGFbmWsTxCPfkO9YQVjS0zzDyKFnxlPxnCeI7k/pY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161194; c=relaxed/simple;
	bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HojtgKK3bcw6aabKLJ7Uk1ZYnpYT/aw0W3bIbD8UaxJ0SqvfpIpDfOUrVTjs631KtXHsvCcl/ilxPPg4gWsCaYETtfYU7UZ5Fi8Tx/44YDORE1K1gzi1xDjzNuSga5R7NTfmUIRJL2a272hpPXaatQKBo5keHMXPa4bWeSpCOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cb+W6Ypv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ln4HFOA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cb+W6Ypv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ln4HFOA+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52cmX2017703
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=; b=cb+W6YpvtF5y3yAX
	6rv+oXd/Q+wYrFm2Yws/rl/HK2EjfIoPbxBJtMqDwQ+JCI732Mfj8v5dJIT6Uxcb
	9HQgyQrV7Kr1TEn514xea1pMVxR7b+LRX/Nv8oWaRKszT7aArUrkQx6p4ur/AmsO
	fS51NXhrRC8itp+FNwS75r939xLjcCMl+Lrao09ZCUmh6IJ6vEi6Yk+8YSEcXNEZ
	oiWRDeWJeH1COoI7yOKlO3PxoTz6o2s8NLZrw5YPIKDN1cG1g23tHhxBkEf4u9xZ
	w89shjs6k9ZouofbOPUZlGPCuaRGsA4kHuvY5oI2qj4Xq0n9uW7m0wWcq38W4wdW
	oezlqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6n4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5511362a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161190; x=1788765990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=Ln4HFOA+AEzwNgWut8dEXfXNpPtujQ4SCIyJpoCUCfd5mCt0z27UE7nN3sp07RtXup
         O0ta7uNe1YLDuCn8KKWrP4Xip1aQCMwtN/RVD4MsZtD1Qb3G0qYUr8fcrJt6cxfw26QA
         OCpxep9fHINbmCstzVUoRVBN1x3ZF/D9OwCqHeJOvwPsEu+66vu5x59mbwdGq5XNsDTW
         ok4BDW/pOsw5rzf/4gpy1IRksMYn0E8NSqijGRYUr5mgWYvUYg2RhmErZHGAVOF+U3tx
         +00S6LdLlUkl6FvVYoYtsGwUQ7fbGlYciIG0xcMNS7Hjk5YP025MRjli5T9shzvPHTvl
         7ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161190; x=1788765990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=MITuZmMaNJC99uQLVGl59eJ4zU8cfgIOrQJLd8O/gSfcD+XB/YgotLcRP2RLb6+ld8
         2CjmTiK2qchpVHcVbHqsks0I+0WwdYwpJ2zY7oiC2siXuKLcLoNBPZLD5owdr6Xj+ymu
         Ij+JVKlCx9pZ2n+oG4NmN7CfC/FvvVsuYA7uy4OOofqT1XB4weH9LBh+eDi0qsLSFme1
         qvinOwzKrG3E2emMvBVQS0MVx4SWJrHcgEos/+WzgnITyzwy0kO+eFW6580qNf1cQZRo
         T8zEzSqzdDcAvGdEK1laSqfQvIWCqdk1GP0K8o0CU9LPBGY2/VYQIEBeBWOIuMFLawGe
         NdAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFedKqKXHcjeWjXM22ed49IbW7HdJoHcWe4jq/RoVjDAteNmc+EZEdL47vxn7y6H4hH3JtYh4LbujJ@vger.kernel.org
X-Gm-Message-State: AFuF++kV72Vd3UCEZ0Sv1tSVGx3gHTv9UeSHNp/gpEx5CpNOaUh6Y8Kv
	bvOLzRZM32xegzxqZUm7BMShSJwguuzoZl7QpMmZhJ248auDvhPQ8katAN/keCXxkzrjZvwd8g6
	8HfQDAGIcKEFd6TjRiMIIZlKn9f+7dOfKEHNl7TfJC2x5Ysk2T7u/dSALQSmL/iIU
X-Gm-Gg: AYBFou0r5dQhZ2VvCOrHWG0VzNBtqOqtJja/u7vCamabC3Y78/CpomTtS4kPIdkq8TT
	w4W0r44JJ0Ks9/AVbQh/uloBrb4dALWn7jyKzwvp/NjZ0ImJrK8RJfPThBoiGph19m0Fe0kf4qu
	7tFU1nDbQUyRemcqte63oqPDINkRW5OJ/Qh3YcyrYMyOyf3UxP2iVqDQkWgELc98f4P8BgHlPkn
	srF1YT5NKXanRI+lVdsBiJlpA2mKH+mWqb36JDUMITwblj0uTox9v1Jl4B8bWbTn5KwWitC7rE7
	4Y0LY27jADV2FXa1nt+fdIPuK8kwVRbA1XB0TbrGFZJjkGAxw541smltmYN2bZpODmiK3445SqR
	bIFCgZ1cKWRPOYRxlHlh7Upf0RzowPazmp2J2
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398731a91.10.1788161190456;
        Mon, 31 Aug 2026 00:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr34398691a91.10.1788161189996;
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:29 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:03 +0530
Subject: [PATCH v2 3/5] PCI: qcom: Add support for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-3-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=854;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
 b=55ch1aG1G4LspPpgrm0K7D/1FVbflwomwl/UnDiUlC25zvssra1xrNLuTowwVyhnQIx1T7i3y
 BD5Bn6bEEdKCCwrq2EXn6BNFfR1UIiPZkXZLQs7q6LSnHDVPq6rJGyE
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-ORIG-GUID: fYgtnq9SgkEcQeu-0xyryDPqQpfcRmXU
X-Proofpoint-GUID: fYgtnq9SgkEcQeu-0xyryDPqQpfcRmXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX+Jx+lp3GD2A8
 l/W89rRe9wtqO8oYUzpHr6ehB1b6k98yYYTvYoQ8U+2Vhv6P/jO2MQpDcNEtnCOrEXAM0/hVHpZ
 PK4DgOdajqom+lMAlt9UY4xa9qOwORD4f7+gKk3P7i2acqWv/R7CTl1GTBrFXr4QdQ0ADa7ItJ5
 h0RY2Inrp2K7/j1SEYMaXGm+WzRALGP1C2x9tAo9MvtjxAiKQm4PAbpNy+2oz9/pLb4p02Kxdbd
 MDoGhK1C/t+uDBAir6D8fWHU5kONIDw3kytnVAfK4hzyaa0p9PlaPOBYQiBDB9dwB+z3RXyla63
 ousl1tQ65VbpbnGjI15qhoWqC3Sx4D8Xp7QSnw7uEyMl3wsW680L2oYxnfuyE3Oxn0vM3gjh22w
 q9OICmyCFoBGzuOOqllaRtTEpF7w3YpRGFJODUv3kC03rffOX3+qJJcXN7a0GTnrBsAOeBFcrjf
 gLwnwFKTPiNV6QICiEA==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a952ca7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sKgv3_SsqRtbfYgyWx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX8DzL+U19Itm6
 tno8JE+5oALx1rLvjmYGdtfaMpiKbwmsVRtosj96i7Cp9YbfvpajqOZxwAyRMOjJpKgA9c+zg4O
 ApRK4SIXCOh/v36oFiC1tadiNB/Q+vQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310062

Add support for the single PCIe controller on Shikra platform
which is capable of Gen2x1 operation.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..19daadee65f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.43.0

