Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDB3E1682
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582201; cv=none; b=eXwZVV0YahlvzAUrvjo9/9eQRwEswBZOqvk6uIjNvMmDtrZnu/B7vaYTwDefhBsMugkBN9OXwK4eSHqJ8lNS97VNQm2iv2M2c2KK7aGBSNr5L6mczcTWGDnlY9wF4tY/x+Sr3/v0aPxIo3u56ztnyWRFuckshQt5033gU5JO0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582201; c=relaxed/simple;
	bh=CQuF6r98MUyoHzeESCnsTSPvCQtraJDtOi9/MqYC/aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cI0pcrODfVfZfGJBX+kHSoXTzEPZK/yYyAkKEUK4sbVVxhLtsUENAzCDMdFXjBaDc1BR12nZHhir5n2/Q8zDLqaUFn1+DGb4+rbP4CQrVFVtgjxor9fewSvvTXlFgEsilAn/1aU9bTDB+ou5yrru5APHZZ/kg0xJThWxNs5IelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU8u7XOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK3Bd+48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU8u7XOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CK3Bd+48"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Ia8972678
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=; b=NU8u7XOqoLnceupP
	5biCqB18flB9yeri51HNrvfJXfCfRDC8/GLbdYrN+S0VlJIxjemOTVeQvDHm8uir
	Ae1uLE6AQI6pHMTcoN4PB1hlGnnjip25U//FOMSJhhZ+l/t4DCBumflcYEcQGGbx
	MXMa8S6o77P/KkNmX65/ZNFeiAtvVN2fvb97GY8iXwt8pG+OM0Z5hIVlCuv2lmWC
	nvWUSn2aoCkphQOLci5olvSForDwyCRHWAeRVsnYjr9LJrz23VQ9fO+CnMLlGGsw
	BdfJAhsCRWiIemiXRmbk4tVbAdJCcVvJV8iP9AdjiNmu2Lu1BIlCtenAJEhxolCb
	DRawgg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vtdtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:29:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478890cd64so364531b3a.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582198; x=1784186998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=;
        b=CK3Bd+48tWjPBQGpIpMMlqxtLaqqTq5C/XD/iCa+ZwQ758W/WzX5/IymNrhRM0IXJm
         kirrqM9hdef/RsBJcmdW3z9zPpPu/06C7vQqyoGx8676P22/jn8DwMVHMgmzMT7IeR77
         yXgsMGoyd9cHJcUEMNS+Q/8xxwjXBIqeMNzxHGtBWkzMhLw+TNu3kY4NLSLnFJim2S2Z
         qeXaUtf1ZbXp1Lb9EydEI9cdkJCjl7X2Wd3DcWpyl5zryvVW+f6wRzy1o4y3LmyftmNI
         Lv46piz03N++1X+WFKooevU1TEU16A29msRD8tIJ0qKRqQMYo1018/Y2oNJMgaNlbivZ
         MmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582198; x=1784186998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=;
        b=D2S1jWhtC37WzxkVztI3PaHgBT8sfTnupJSU/S3pNUUT9ZaLR23TvmcQG7XiX8qrYQ
         UhsTRrxLSiiudi+udOTpK8gFMeTJa4ZSy81AgYx5VAq6DsIp1HlXWTOiIavARXynxqr8
         w0dC/fjX2HtC1ECNjocI6lCN7DGqWMrCczQagA6dmEd/jJNKpGvIXJecl1DHOnL+own2
         eGfPY9RphVBnLkST5yHs11IzdpbwqDuZZ6ZctrxFuL7ffeiKY04ddSCj8Z187MVZk3Yp
         cEo6IYcelhnt8sLTz7o57UNhGPc7N/hQkzShckwatG40ieLFDM2p6IxcWs/HahsV5Rk4
         7KLA==
X-Forwarded-Encrypted: i=1; AHgh+RoanmX/mQFI4Dg4QOowKG1grhfS3R0Xfjuc9s4A7+qyXb0OfhhBoM7wsARX4zEnSI7vmh8QeUIElFfS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3YJuSZpSORmrfowknfs7UINcuyGvTRou5bHKrjXef0cruHo9z
	ApqUegknU5SCsACFTD/QxLIMzE3D/tGsYAphouUE1b/Ks32prWTyXlOP+Wktk5tN9LsU8XYHPq0
	UNfgoSHXI9l8zBP4AclWGvmhPoLB6kUli27XJ+94jCe3PZXzYN+I6A6L8Xn6nYMcv
X-Gm-Gg: AfdE7cm1TUUhxxewCvHeC+05owTXucurUePD+EkMcOYbn9GpEbBkIDDEyB7qpr+WVRp
	47+43WEIsSMub0XjPq3936Kv2901ha2ofpwl1Sqbe9tXTVar217zP4IS0vfVGsS+KqEpqhcGZuf
	PgdNXH2CRkjyyT2STSqncYuVCG31tHiHHTAxQXXZOl5SyxYytFn+jcn3DQF/sHXxGRS2DT3l2Dl
	FJZE9qdp79OeyuHtuXcN/2Z7F8L3OVLqrbLdFqPn68q3dovuql5qhWOKAtZFYJPDHBiPJWTCsjS
	cD3ERzIQpBh1kXsmFGcBDDKSlXbZzYBn0ekcdzuNOBykbcBze0LIPVhH59ydfPl/HPH48dEdkEP
	P5b2BDxYa2r6Lxlculebofhxfum0BMsLkUOpNasR0Z6h3sO1fCSNssShhcpwyyg==
X-Received: by 2002:a05:6a00:b8f:b0:845:328c:1ed3 with SMTP id d2e1a72fcca58-848560608e8mr2014120b3a.7.1783582198272;
        Thu, 09 Jul 2026 00:29:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8f:b0:845:328c:1ed3 with SMTP id d2e1a72fcca58-848560608e8mr2014092b3a.7.1783582197789;
        Thu, 09 Jul 2026 00:29:57 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:57 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:59:42 +0530
Subject: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when
 no UART serdev is created
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-3-5e725091266a@oss.qualcomm.com>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: VQ4mD8p6PAjMwWNgRAn9NpDIp5N4cFmS
X-Proofpoint-ORIG-GUID: VQ4mD8p6PAjMwWNgRAn9NpDIp5N4cFmS
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f4df6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Rd_Q6lwWc_OclDomn9YA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX+Ii8/7jHqorq
 QJlyMG9kuCFK8gGHeKePeLqiA6jXlhJxim8jklD75dEB1BwDhNpdd+eoUY30bO+uPe5Ol2eV7vY
 YpOyIBNp1FXAaSf7u3Cz29L7mjG1yYfSE2xMsAuwBYrpEoelsfuLzFY8WxI91nordbL11yp18KV
 1Itn3HQXB5MyCdPbcN6CtLO9Uzq+OKL2rkon6tXN8QFs4WUBcBA2chVPnJ+5oroMv0x/m821Xlu
 1zQAVZLHJU4PBwtjANfU9PvUy1xntWLCm7kY4Sq9XgeX3jz2Tyzsoh7dTURuIhQ6XHTXNzyX4VK
 HENmIv/sZ2u4ubGhuq8EeaeL6j242SzYaEujadOWl7+HyqQam6Z2GytFRzmxEr0mPLA5BrA9xvR
 qfPZFlt1WBC2tPk5/tOvTXxvCBRGjwjgNVSo88tSNe8g/66IAsid992p5pkEBbyMW5s81KaxREw
 qtIO7AO/UxO4WbLLHpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfXy2xGeHSUM0kS
 xY+XpZQBv7eIeUJOHtOr3A2WVHrrg+uHKhfKYUN18FKdeUbVKbbRrnXslNzPXjyHE93KZPUtmaU
 2s/3m2TbWyg60SpmE1BtYw5D3BLgS98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090069

The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
BT transport and need a UART serdev created by the driver. When a PCIe
device under the M.2 connector does not match any entry in this table,
no UART serdev is created.

However, the BT subsystem of such a device may still require W_DISABLE2#
to be deasserted to power up. Rather than adding every possible non-UART
BT device ID to the table, add an else branch that deasserts W_DISABLE2#
whenever a PCIe device is detected under the connector but does not match
a UART BT entry. This allows any BT interface on the card (USB or other)
to enumerate without requiring explicit knowledge of its device ID.

The primary use case is USB BT variants of combo chips that share the
same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
W_DISABLE2# must be deasserted so the USB BT device can enumerate.

Reassert W_DISABLE2# symmetrically when the PCIe device is removed.

Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
(sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
no BT interface appears; with this change GPIO116 is driven high and the
USB BT device enumerates and comes up via btusb.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index cf51122d54fd..06eb5eb0676b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -401,11 +401,23 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 			ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
+		} else if (ctx->w_disable2_gpio) {
+			/*
+			 * PCIe device not in the UART BT table. This covers
+			 * USB BT variants of the same combo chip (same PCIe
+			 * device ID, different sub-system ID, BT exposed over
+			 * USB instead of UART). No UART serdev is needed, but
+			 * W_DISABLE2# must be deasserted to enable the BT
+			 * subsystem so the USB BT interface can enumerate.
+			 */
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 		}
 		break;
 	case BUS_NOTIFY_REMOVED_DEVICE:
 		if (pci_match_id(pwrseq_m2_pci_ids, pdev))
 			pwrseq_pcie_m2_remove_serdev(ctx, pdev);
+		else if (ctx->w_disable2_gpio)
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 
 		break;
 	}
@@ -469,16 +481,17 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 		if (!pdev->dev.parent || pci_parent != pdev->dev.parent->of_node)
 			continue;
 
-		if (!pci_match_id(pwrseq_m2_pci_ids, pdev))
-			continue;
-
-		ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
-		if (ret) {
-			dev_err_probe(ctx->dev, ret,
-				      "Failed to create serdev for PCI device (%s)\n",
-				      pci_name(pdev));
-			pci_dev_put(pdev);
-			goto err_remove_serdev;
+		if (pci_match_id(pwrseq_m2_pci_ids, pdev)) {
+			ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
+			if (ret) {
+				dev_err_probe(ctx->dev, ret,
+					      "Failed to create serdev for PCI device (%s)\n",
+					      pci_name(pdev));
+				pci_dev_put(pdev);
+				goto err_remove_serdev;
+			}
+		} else if (ctx->w_disable2_gpio) {
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 		}
 	}
 

-- 
2.34.1

