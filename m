Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280035FF5B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763847; cv=none; b=thuf/0BiRssdZZUC2vMAlmw7nRbzTucIDjeSgvk2PwCCQbZS0yFZU3GHWSRW0UABlGKYTuobsqnnk14pnmgP+jSSub5ENjuXPxbz+SfWXyLcTH5jw6sQiBXcq1AjI2Kou4IYEcOsoA12ZyAx0plqJ2PT/yW/Brrelka1uDNihpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763847; c=relaxed/simple;
	bh=PbkVzelh3SK4LAGc90lyEYBKrIbo8m3GcRVyvC3k60g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onvZhr6Vx+zgSAj69uExFAQyWskzspqNJtOYVHwMm2V+Pb9fUDuHQ9c3p3wmmgcoAUDfJLHXu2TyxigGCVYLBN0F4547S12uwkWMFLLos9M7tdPlPHXshVnjludonZFA3NWFq910jc/Nz3i6RLr+WfmTwn4eJpYaegcNlLnINNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH8Ie9sE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1vYGtvX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH8Ie9sE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1vYGtvX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGvSZn1312273
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vHGWFIJjsAFGHSNQdh3TuFTld2bWKDMvUtgnfDOI5g=; b=XH8Ie9sEiyY2JJK9
	nR6U3yck9t4ZaHsN7bRYcTAEnVpnoKWwHCJylqws03gl7PBdKPOz/yM276a8m088
	2cbZxg4TvGcqSQY4pE53gh7kVeCTttIfhsrzZylmLfTRByYRCC1Fh75Rq9BXozua
	dab0LxWGWOM2mG7mPWkn4LbNnvct9xGjuzvXFyBOdSm+cVdW9OeDbY4PNs0nllE3
	VBEavzG1thGbJhJyzP/e1W4Lt/mesd0blCVNCDXnk+0Z24VzINADL9tS+/CLSJap
	2reABX1gm7qN+nHXsGUIuPKJJWk+ZkPo8fYVzpk8D4DqzysK06TMV7Bun3nUjXw1
	gMWd6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a94xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso25879695ad.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763822; x=1788368622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vHGWFIJjsAFGHSNQdh3TuFTld2bWKDMvUtgnfDOI5g=;
        b=R1vYGtvXlrcDFHb85UXXxRpyEFznuAafcrNMbTRQ3k04yu6w+f8WkWCkzwinPE8Ib4
         laaES43fuyavItLLQEDBnnplFzkE2lGKnXXl3t2xdannwARmdZREYPEhtc3wd6IPTjsU
         xVu1P/EhR0u7av96GpYcA9uhVxMdwtuDPF3xSEiftrlweOmwlRocMcB+m6JNSx6SztT5
         fJRpGqc/8YE9tueea5SQBuKWJ501yYFju7Kn+DhU1h6pPJc9r9jepq+T9QZmQD4ZTJ/D
         SsXkhJeKKS4t7/+el0qMDQy/woJmCB0J3+8QGsQs/ikWBeJdWqM/a43CGxGcxjLloB45
         Iflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763822; x=1788368622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vHGWFIJjsAFGHSNQdh3TuFTld2bWKDMvUtgnfDOI5g=;
        b=E72RcDCsESB9tV8IouZdzua5ZMOYR5f0WYhZfcKU4pFPM68/cZfKY0QR9ejipZR2+h
         ZfdCQAIEyL/iEcA/F7c7W7GvsVyoDcX2uGROvpsZ+sR8Ymn0AfA2f+rF34zkRLcQU147
         KMBCAWNAd4hFb4bqXW9FB0RjvUhtL9arq/0iiSDe2f7U47yTj4C2RHhXBrACAdHFmuWT
         jzNZ+NpoQ5G/8VaGAB8ZYPFXfZhbKMeVGPaxo6raM8+DMIkScjZDFwUWVir88cq/n4s2
         76Ld9jNUqF/dFLPv7SpcKiyAjz6VKJCsCkE+pDui4xZhIFaGhwKxfcVlFS4PN4R0/Opx
         nYog==
X-Forwarded-Encrypted: i=1; AHgh+RqPoXv/wuob7BRyP7NE9yHds7f5PVn9WRGkZnUxB4cbMMsirvzxVjDRpyh7wN73X9NDacC/Zr4JXFRc@vger.kernel.org
X-Gm-Message-State: AFuF++ny4DDpMiX2y63FoHmJQNaX0Wr1wPzsYr7fqnKpXWOIwU/pQiSI
	D5IRY7mc0oDhsyCzkE2Imhr8+LrkvATXZpwJtXxkpnoZR70u7O7Jp0IWmDj5NrLsgoaNbc9Xvbn
	OL/BhH5MhopD2zDeLn6EwBymDK3N58NHj2HjevB4b1vQPv9HNXZMEcdOSToF0Mj2a
X-Gm-Gg: AR+sD13wi/dGbd6xU3V9wCIpuxVjo4f4U7IyQIn98koLFvOhdYLlQFKCOAgeQFEgosX
	1ykQ8/ZezlGljZPOtIvwPXLPNBO9i6/nRe5fN34JznlPYCpIit6ZFsKSiuZSQiHd73FQAEfZj+f
	FdcgvlaZ2gHJx2uf9IMzCz0jx6MNBlzd+aA2XHsoo8WU7SHeydZ/NUzPGogahu6+45zYPNAx+cn
	680w+/qyrTMmgOovt9oWsmFV8RJhlUq5oXuTdYdIji8nSE/2IQuFNupoWdEpTuLu0EbNq0nPW7s
	1+fRutJ7GiU7maVAshWDfoLA43cHkOjVNa4guZTV7WWwcNfc2FY41DyBea5fN/YRrEutCFA32of
	dyJ6pFSsISwrva2jI+Ixth+zNjkw/UbkxwijquRcnEwK15vVJXeTI7KL/915yAxwc+JV9Ew==
X-Received: by 2002:a17:903:8cc:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d707aeafd2mr161456445ad.9.1787763821658;
        Wed, 26 Aug 2026 10:03:41 -0700 (PDT)
X-Received: by 2002:a17:903:8cc:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d707aeafd2mr161454565ad.9.1787763821007;
        Wed, 26 Aug 2026 10:03:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:55 +0530
Subject: [PATCH v6 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=6255;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PbkVzelh3SK4LAGc90lyEYBKrIbo8m3GcRVyvC3k60g=;
 b=sYeZFTG1MwrPBNun8Ymktc2hgHEuU4v83qe7dOLM3UnpKF9zK4mdDCQ9dM8CnsL7b1fV7xH/D
 Q9HrZa0GPNCC8lFTZ7IlaFzHeDlBz2ym8H/IgMX3pQW4ih6a3E91hwD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: lPMPorYQmxL0Y3BX1ShuYr9i2hXH2E9h
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f1c6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Rua53wt-LDCXJtC3cl0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: lPMPorYQmxL0Y3BX1ShuYr9i2hXH2E9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX1egzqQL60cZX
 Dx8pDjbU9cq1qoGJ2Sts+wdtpngrNVXTZFdwTgyaBPKmUEw5RIwJPlrr+moyP2734Znzhdx0n7o
 c7R8ll5/3QXCWDVFS/ryItoHg5mQdD7qZZY3N7MprzHmdobNJHphT06VYtit5k7psM+ywGrysU3
 sHG5Bof5k8ZK9JGm6HOAsLcPk8bPgRFhlFzMPLNZFbYmwIElA0rowcj6jk60Hpuu5R7IB3pvMes
 hDmd9U9pfJsYse2ifu7tHGGrr43JQkBGAxxTlvRsBKQrrGvJBJwS0O+2gZM3fSuQ0CyCnRl+qAs
 fdOkeAAxs5LgTMI6VUUHsGRZKFwdyWa23Pn7xgChpQq0kLENGrYXq9xvBGd4UxtFciO3LZJboAt
 +nKHBFvghd+JiFhQgK35nDk53XCwOKqxpzXuYQ8fgSfbpasXGKjHtw7YjfNHRAZIALn/FIgXTyS
 ECPEsfvo7yTn3mSV47w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX6CBQX6IQ7Kv6
 HVbxdK4+50Dx8Djp2by63gHWikS1RRIU2Aqp81HvYioUdXJNTBotmwrSRPdDCaVw/6s07AFA/xA
 5GIwHDEDpY7uONp6i2nYsB0DCKNZ4Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260141

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, query the phy type and configure the wakeup interrupts
accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 63 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..9ba7ea31b524 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -85,6 +85,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			has_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -272,15 +273,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,26 +298,38 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
 	 * Configure DP/DM line interrupts based on the USB2 device attached to
-	 * the root hub port. When HS/FS device is connected, configure the DP line
-	 * as falling edge to detect both disconnect and remote wakeup scenarios. When
-	 * LS device is connected, configure DM line as falling edge to detect both
-	 * disconnect and remote wakeup. When no device is connected, configure both
-	 * DP and DM lines as rising edge to detect HS/HS/LS device connect scenario.
+	 * the root hub port. For non-eUSB2 targets, when HS/FS device is connected,
+	 * configure the DP line as falling edge to detect disconnect and remote
+	 * wakeup. When LS device is connected, configure the DM line as falling edge
+	 * for the same. For eUSB2 targets, the lines are swapped and rising edge is
+	 * used: DP line for LS and DM line for HS/FS device detection. When no
+	 * device is connected, configure both DP and DM lines as rising edge to
+	 * detect HS/FS/LS device connect scenario.
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
 					    IRQ_TYPE_EDGE_RISING);
@@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -617,6 +638,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct phy		*phy;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -683,6 +705,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy)) {
+		if (PTR_ERR(phy) != -ENODEV) {
+			ret = dev_err_probe(dev, PTR_ERR(phy),
+					    "failed to get usb2 phy\n");
+			goto clk_disable;
+		}
+		phy = NULL;
+	}
+	qcom->has_eusb2_phy = phy && (phy_get_type(phy) == PHY_TYPE_EUSB2);
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

