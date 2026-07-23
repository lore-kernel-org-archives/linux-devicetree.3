Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCD43CE74
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803174; cv=none; b=JY9BxLTNb3iLnA1VGMyz72+c00JAW+wMM6Q4al5hG8m6nMEqoFUjmEQ5xuy7dH2JYr/lHvttZHOuz8az73qmmLFCUQTQNiC8RHDW+BWH/b47QWog+T+/tAgpyhnrAwUmNQfp0gOikwYLcPUU4lu/tkFkvkuQRlfNu/AlNXIUcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803174; c=relaxed/simple;
	bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVhRjLw8KrOGlCOsFjEGRiKrqn8ToR+SkT2sC3vtmBpqROMAvpjwwOpmj2lG5b7KLFeWapgFCVRjuLnHypZz68nnX0aHGZAwkdqxXpl5l0yq3Bu2RgZgbOMbSpks0D6japEcxgJ6PlOqqM4gjh9op8BC1zgFOLvAgNflrMYPmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj6fyLMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfGzdV/x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj6fyLMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfGzdV/x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8rC5i3790976
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=; b=Zj6fyLMV4Oj9ZjWa
	kO7B35dVsQ29fr/KD6bQkwsBBNFarsEh65TrDBlJ1Y+XRxAQE4aGFzP2tqzcspJz
	0dsTu1aJ82/UAnmPKUH2zvXMWSNeNnmM5wUbZ/53T1g3TyJg1i0xdPje4ufPZUXI
	fxt+CcOXSvfI3smxVUwqAdXaGqhL3hn+kqJJED2+/a99oMW/aNydMjj2Ab5sLdwE
	QfFqMNsDczk3ramMTBhkGaPjLFpudFlioABaTs3LZQQ8UjqKNaDfjBeh3tpvH5cK
	Nq87rrCl8Joqunq//bqLnKA3UpbLNsIpQ1npjGFVVVGpJsnADaLuWuggGnlKon/r
	LSvvbA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52c9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so955741b3a.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803171; x=1785407971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=KfGzdV/xKRNXVdxOdgkPVboPKGxejCPQOt6eGcGMCXgw/D18EHLUtqBpemmrWeofNQ
         bWnxyDjjQIm0BSvZ8izSS9LIc0ZRoSWCALax1/0jE4dN/R+nj/HkEpDwBoEVEnMQq7XW
         kaj78fFE+cosjSiF8pMVcdEic9fmQAA6sKIHSmUouQf183FQ69YHEX/WZo4cHjxc1QA9
         DhBncXOws/v3iaXCFq0lyXXtL52sPLGR1jNni4sOVsYYrfKHnlKuxZrmKpvEvTTm4DCp
         V/YEfQyPaev1GjdGucSdY9i8yjkK0rNmpjRqZJqLNm0xFkl1II9hrMZWvs06bD1HsnT4
         7+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803171; x=1785407971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=bqlRFDGtXdCumJQQH66IwMsHK048jA6WApPJ56LBHw++yjo/BwqulSZPGnkDkMtb3q
         W1GMcUXY6un/Mv5bByOS1ijRbodRdxuJCpJ9tkjdasIZf15edVjhabM4F4FJ9+0pdQdG
         0RbiM5gGFiDpMhemicxbq7CUgnAJHXkuefVDPsTQbuZLwgwsLI3Jh+D25F58bvlNllyI
         vttUNNHaDlJpC1BU0ttnP7Q1kUZxhZc4Mt98DqDS51E3P3HlhpeHvp2JwXVENWZ9NvSQ
         g2td7Z3NvSoM458qlPWIB+PKfe8PJcZEhh/E6u1cV6YYBuJT32HHqsTV8a+YIs1s/YJ/
         sD1A==
X-Forwarded-Encrypted: i=1; AHgh+RrlsL9X11rKgFKNOPSFQcXUueyqs4KOPoCo5+qAdjwXMeDtVRxpCirTSTpiQMqN6+9ChOGERG8GQ6DR@vger.kernel.org
X-Gm-Message-State: AOJu0YwJszyZoMsfJefRzKFgvQh9BWzNwV9nXgwAm/xHWDjKq/sKEbWz
	qJb9UdsStwaMd7lF5wWnVWfdxy921sMKAj8BzdCbl2g6GMjKdayWSNAlabipzphyCHT8gtNjfpi
	XmoFoZiG7ssRaXqHiBk0oZZThReFuymDizNoQF3gpBYh9bzMjH0P1o3kodJSeRvt8
X-Gm-Gg: AR+sD13VQmbTM5a/KGn9FoHVYDeWRYW7jQ2/C/NhpG3GW2akzID+Dq92SJzBBy/XJ8g
	2hIDGzKzNkMGIuAPX1UNe/HAEKgyDiVEUlwmqtAeQ+5L10fj4w3xXuBSe78kbZfQMj4JcvG+bOt
	mxPhIbSLnHn/EhDV76r5obO72lmt1uVqGVxjyigb7xa+/gIMdIQ8YTECA2N4ZSXkLMiRVSYkfHX
	XF/OUp85COLWR01HRX6qYT9yZJAiuJIrEymQ9zHunP1FGF8/91gILwdJsFraYVYSOSf/WYMGb6S
	uFZy1oqNe7Ca4w2deP6uJ3LJbMj1ZWeKr5ChaRpkeohrQ8M0mxF6zUK1w09+X5X6EIYDymTgBH8
	o8RoeAXGcANtWneLu0/Cl/W5nz7/jbaszfwzI3wNUDsstXEfIFp489FuiVA+I2/E3luBL8A==
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099741b3a.11.1784803170570;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099721b3a.11.1784803170118;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:29 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:06 +0530
Subject: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=1048;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
 b=IrTCqLlDsSng9czw0n3+5OOJ9rdmt9xIxdfQaiZt8bHlQYnXCGKX580gHG0QeUW2qyZBbxbJu
 /wbs1oEGWSNBQRK2lt9kYaK4oLr9Q0zxCxPMsucCeht7FKKTr2dU0HQ
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXw1uyFvYBwL3x
 ffJgYLtqsDRlVvO74Er2fk05yG3Lq1JANzAvJLUEYOiJzHT7BjmchQEWnqpJIPnNpGIPOywb0Ke
 7+lWaB/80x0eRpZUTmXuuATYwBleNraRrws3YT8SjVmEBPB5USew6Qa+KrzzEYzL3mRei+CccQI
 TzuzG6SptMo/loUoAFfEWGyjSX507chQ4ypSVHvirrOt6rjEIbqt43vs850fTxrRGpKwyyrt9HF
 g+GrO7Whi4uSuLVSaxlqpy42udqYQprcyWdq+CdzsOOjpYUOBuuG3FdZBJuaFCX8Lc+Dq2ZGKBF
 7oEEpw3btOKujbMC6wkJTtrcgUHg2UUhIV+Wtu9qRtc1RgXIFnE3E/gD0ckzWBkLhGgHqCQaZlg
 YK0uaSvlmlpdYaT0CgcvW14g5oVQR0YCLyb6n8eoESdAEtaFI5NwQeiCzo1AKhLFG2dyuBARocK
 kUOh1Y0Q6aEzgQld9Kg==
X-Proofpoint-GUID: Drx24IxruHK5r8HxZZfLaavpK9htwF0d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX7lkz6eSgLWRT
 VLd8GFt9ZC6LmllxW6tTaDUTPmaci3zaLzMp75QymU8X4By/5IEVe6q2cYpwLnw7m4EnNw1tHKq
 wKm1EytSvNys66EYMjc0a/+XZ5oOuxA=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61ef63 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XHtVRzMgxm0A3APenEAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Drx24IxruHK5r8HxZZfLaavpK9htwF0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..e139b17bcda5 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <dt-bindings/phy/phy.h>
+
 #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
 #define USB_PHY_RST_MASK		GENMASK(1, 0)
 #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
@@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

