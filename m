Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340B3C4572
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362172; cv=none; b=fsfnRUX4rNvTC1IWdPqecsCPZlNbKQTCSIzRRlDu83fAfnZGNYRNHMYxTdr3T2UKqK2uly52G9tCHLQcbXgNmtz3MVB6GD7DF9F6nWBilG+SGt1ETE9ofN/is93REOAQOsRATVvNK/mfONviuy2/DZa9WsFqsphy31V8PrRc3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362172; c=relaxed/simple;
	bh=4OAepbflvDuHyyYKRedNcB0DVeaHFPgD9xYG8lg0t3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8fPCIDkprKxqxnZxP5JupYdpv3roUKVMI1QGSOJdOPwxz9vTx5joeWebObni9gKcC/EribYhhI8VWgu5H8eaqkRb6inf5tCOdDvY19ISYCWFa1+EC4DLpw3Vx+iVtsog5hg/yFBdZQwMMPweqQzDGcddQLjkae9ImcmiHTNd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J19Boyn0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtWXLwIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J19Boyn0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtWXLwIh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S0XW1727642
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVAf29kiMmANxN6/WIEtvFJSNEOQ4tpALqh5ZTsbAt8=; b=J19Boyn0jglQUx/H
	nuqLFJXtEqLY0sgu+yP6dKSpGfQNW7IA+88ZOpGGTdReV4x9CjMejxGyfwJeNLf5
	1gKwOChWejnUERcujBnrUNbCWUNaLzEnVxE7QTY2e7T8SpqyslFsU5yiXV3QRhPZ
	MIDP+P2JgPncgm5IXQQ4liI+F3ILCo5OndlvmUDF2tjMA1y+ZOFMvxRlSJ1WuH4l
	z2wbqNCkEfQG1v0eXhG/hjGX2Z2RKpl1VKFBcCQfprz4WB2D1HqH3uvkox+5cUsM
	kwsQvMW7k+nxe51vssnFe+5HPcD+obvp3KD9bMVEOPCCvOyyiwWmcAB8c0p+2qAQ
	PlrBPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3s9rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so11968201cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362169; x=1786966969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVAf29kiMmANxN6/WIEtvFJSNEOQ4tpALqh5ZTsbAt8=;
        b=WtWXLwIhvRtOAnmEXsSotsMovNwm912hu32eRjg0qvtm9wWGMdFxhBvU+4CJAdzlep
         2oP7cD7UB0xfsa6qwdDtOeoQ5zvbVoJBpndraBOy6WEiCRfX2FfGd5yKg2jkWoGtq7d8
         gLIp9Coa4LwjtAFxgmfAqFGVHyi2wM9aP4cVWu2aLR0jT4WaLYSlfNo40RIOmBwv6tNW
         gPb5jAXvWTZZDL/pIlO12yQBT5XUNtFB95z9bw0IF8ycm+5ufQTUQS5mF84i0s39McSq
         D2FxnITK+D9I1s4qZKcEffwntsR10LlHB5ZFqfRuBXV0v1dhkP0/AOy8twEzyY9G972U
         t1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362169; x=1786966969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVAf29kiMmANxN6/WIEtvFJSNEOQ4tpALqh5ZTsbAt8=;
        b=gUenaQtVWea+vsmmLoKfyHcr8pp35Pmzgn7BeFbqQQca7Flky2dblk0ri7sVaGXFEU
         aWfpOyXIviJ3VivBNbx8ZIuqvtWDr8gjMAdW7p4exNWZCJFdtde52WWaguuAgkqixamL
         rOadBcdepo0L1uJNW0fHY6NQyN7vs6Dg/yRHylSHctAF6jj6UXspWTtSLWj8yKRnIUw2
         9WfG+Y1dFgGB4nKbsVcuXmoLMWAbnFomp8ueNqUNTefMkFdaPjm0794yAdLPoLK0bp1y
         eEylbXi+/U+T8rm1UlCVv9t/ezIof19MgYQw5F50sAuGfgkuOgAjjTqindqO+HXlZMJV
         oDeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpne4Q3FbZW7BzWD9ojJX7znomCPW+1S7vRwaQC0U6nEPkAMfUdov/Piu4SbctNAWmN82piz5abY61c@vger.kernel.org
X-Gm-Message-State: AOJu0YzWX3qWWKjsiBUe/Pb3S6twMlCvNBGG/oZ6Wv+z+6432tG4Og45
	UZYtITgWH5sQkJuGDaIV8IC5Q09CWnrXSdZgRREEOfG/WNsR+wR4OLQEPEItiFL/LNI9/n1a9II
	cYwqo56hBex62ouyfBWShXQG8kwem6u4HTi6IlI97RlmdYYSGsm6j+S09/wAaF7yNhyM856Hh
X-Gm-Gg: AR+sD12IKvj7WxnSd8GOK/67QkA1nOnEUGlGUtgqmR97MeHK82fRTUGrNKtvh6/maFH
	y/2XUaifVtdEDf0TeCYoFkQuEkmik/eZSueJswMRTJsbkFSudi1YRKzotBuIRMECF5B5wJZS5ud
	AMADBj/GjY/1khN0u4HsXjJvQmzNoWHQ3ka/S4b09RBGBlUSiwybA1kEC+Fjuflv8fES/rnS18U
	2kipvsSai6OTz8Y/KztUt2jJipHaQGDe6xkNvlY/PhsCzuZopw32Mc/+7CrF/LCBD+NzuVoWYEQ
	lw+MpKyKKtQ6Lb32eiTKSyHoZi6ph1ZgyHFixW4vsUBz0QZNaIq8Eh/chDeLPzv5GIIOV4LIkCG
	LkkjRgmPsMHvcue3E3IFzUpSZBH+Bl4gwI59WQDF0G6K+GUDdxNCZdlGkQDkwf10fN0z4v0SwMk
	tX3LcABWGuQM1LHQ==
X-Received: by 2002:a05:622a:4d43:b0:527:8770:8fd6 with SMTP id d75a77b69052e-52ce618b876mr489983841cf.35.1786362168988;
        Mon, 10 Aug 2026 04:42:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:527:8770:8fd6 with SMTP id d75a77b69052e-52ce618b876mr489983421cf.35.1786362168597;
        Mon, 10 Aug 2026 04:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:37 +0300
Subject: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4OAepbflvDuHyyYKRedNcB0DVeaHFPgD9xYG8lg0t3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkp/oMf5or4mevuLpBse3cI0bN5jDFoa3Nvz
 wHSunQabdGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1bGIB/47QQmtXnuegZBrP5AjHmJoklZ8wjVRfEYA/+4UfysK5JObxMiEtoajbtmzcXYhJ5At7Hc
 jw+kTtcPTQOijwSek1vznjQ9/R3eumjCIoaTEV0iScvQDGNXGB5IJ1tg/M9VKgxYMNZzW8SS8be
 1wQM3m8U6eY9oyls2d5SDXsjSpciRbE4jbAVa02obCTJ+LkfYfQs4CQ0eiuDcaN2UOYvuyVPFdF
 rnFEAiCr8yyfrq3dZVdk5a9cGHQxueSDNrPVZyQSKEVtPat5CryxEKsIymfpS8T0NZAEWiumZa0
 wBFy8r40TJGaXZZwRzeZz3TRkx6rWffa0FYzCXGkmX4nm2eW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: lrO5h2WY08WBHUaytoo_TdhTZ5FXsbqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX25WFgne0fgRf
 Ll3TcYp1Er0Csw3GPo39uJI2lcnjaqhvvB9qDEVW0a9CSiFHMT/hJy9k49EhsFWECWhCKhzBst9
 YUeUgHRnCyQnfGpEyNAGD1d+O7FfWuV56xAcadeMYUhEUAiATv3QbME64x1gOuNfiE05N7ZnT0X
 DNZen8GDUsKfJOFwYHloCzjjgovlR481oenV6CcjMSqDgdxntdQbDgSHqgccPFtwDG232lxTK8J
 zg/D5QMo6csL+ooOp+TFrKXUlWQlu4Y5aQOrl1HknCVB38qkTTprWZztNb465UU6BOmxfzTpTl+
 mkDo+xEXI35iA96ykpU1kOtMjEKnnkm1MEqjQ4V4wmKX0yW/kXofLlbISbRFM5JKTAVEtipf8eq
 ob0ZOFC4BtkjZ/dxU0Z5Ni+vx1AZKIeyZudj2AoZmZvFYzUNHRic0P7JZFndjGbAyhcXZy5seap
 XMz5jqcPigUibHM2Ttg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX4/+oAKVS7s71
 LtIwreYqc5uyEf0cMzaCJTVIM/u/GG+x4s86ZhxtcWBRDc+qvlG3zUbZPbrjR/MaS4vZ3e4WK3X
 aA3svsDoGio4D6E4G1bdLEi8iLJ2vuE=
X-Proofpoint-GUID: lrO5h2WY08WBHUaytoo_TdhTZ5FXsbqb
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79b939 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=l02VEh0-TEfkkUfrjp4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The driver reads the transmit de-emphasis override from
qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
so a device tree following the binding is silently ignored and the
default is used instead. No in-tree device tree uses either spelling.

Parse the property under its documented name.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 3d3e9d6da298..86e8e869a743 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -561,7 +561,7 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 				     &phy_dwc3->rx_eq))
 		phy_dwc3->rx_eq = SSPHY_RX_EQ_VALUE;
 
-	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp_3_5db",
+	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp-3_5db",
 				     &phy_dwc3->tx_deamp_3_5db))
 		phy_dwc3->tx_deamp_3_5db = SSPHY_TX_DEEMPH_3_5DB;
 

-- 
2.47.3

