Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61843F8A5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803183; cv=none; b=f9Dlpo/XuSF2ED0cLGpB9toR90XIhraF53Ymnhio7ZDNDd07xjH/SOXHJxz7Hix8DyqOHqKnYA6QhPTt1EOLrB6lE1lRXrBA8Cw2wihHQVwAJrZTlEEN4/PF2/GFJnXTL9GM138MFGkwJ8qRh+I4K0CehyyVnazvIhZJoy2lV4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803183; c=relaxed/simple;
	bh=/vNSx/6fYrenbbzMg1/o8tyUB/wub5c1VyoCs/xcSIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWeHfjgwdoe7CUeJQ+trkU0iIXMGuYLVGfluQO9KTCMoMlg48u/jzSZX2JfvvGs3YZXzfNRs3nteT4MswXqTFGEwixMKzoGnguZuEbqDMSFLyfVQadEvyrZv57xsIYHiAzEkcjgGrl1e+Jgd9kQA6b9hA9lFSWm457b2Q0XQoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQsulRy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7xFHgJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQsulRy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7xFHgJq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qxSa3789687
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3901XEGmQiKkhj7Gt79p/OwEJfMNBnlhSEeTs6H8Ci0=; b=nQsulRy7K3OQxKmt
	aOVmytkEB9Qof8xZMkjokIZLUwVOWJtpAw2RcIU3f5ArFInM8t3CEDh4tWQTjJCB
	eq1U/uHx9aiiNcDIiGY/Fzs8FmE/xweUJEiSjLRp4NR5DRhTErubPzNZ5qDb/tyy
	K11MUz1gmpsmVd4bODdjLYIY/LbDChJguyACnIkKaV5CmXsb4ulGxwLC75OwF3rA
	i2axHpLAMIyRoA7cu4T1DE9LtKPLpWq8S0mMFq+tena1INnWDVsO65djd9qROeso
	cw+EaYQDb/1A0b3lJLJ2OoJeUjx98LrOcc4u4yExYqVlwb2n5FB60zFJlxt8DPz7
	jfREvQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52ca7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486ffba174so955100b3a.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803181; x=1785407981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3901XEGmQiKkhj7Gt79p/OwEJfMNBnlhSEeTs6H8Ci0=;
        b=D7xFHgJq5ttvyABX4lIjKpa5Mk+mKN8ORfb1AEI8RlIYg8RJqOW9nLtHM3hl8FvK6v
         cKiDJlGAWX4Aey/RZ1fiXDkoV8yDDfY6VC5qkArVRGuckFNiIWFxhynijJKwoRyegqGy
         lfV2csTWTOZZ4kc0sxikMBQt2Dc4xEEcDybTWRFnr2Vdrr21+bTmkU/ZeiEnT2sf+YGm
         MTeXy6gx4gR+fKk64ENrBeeNiMR+80RkxL6tV0coJ+yKyhRHu5v0NES4eAvnh5SQdk3E
         WnmvafqJxDlSRcx+qtiJbFco07woqJKbDnvF6/aR6Ni4H28G4wC2UlCf+UgI72kn5ljj
         MZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803181; x=1785407981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3901XEGmQiKkhj7Gt79p/OwEJfMNBnlhSEeTs6H8Ci0=;
        b=i2Kdsg37iwhMj3r1p+y0LdHFAlNqTBLtGe0JZEqOX1UiCd+AKhmsPW8pVeH5wmhVha
         wC/+UhnD6nbLsAOs1uzYntKyjY3ItMcjw6gU1MorelQIOGPYGnzLkYZf6b2cb3dIcV+d
         dyGvzDRFZz5qPl1i2QKMbDvo5C0/oBMX3L/L5dRShIRJoauyoDriWo5gEcMY0ed1UInW
         K/crOyN9Mx7dacuxiIpoN7jciqttPD1v0j1ADWda1hWOubuduvxLXVjqdptstgv2NYE6
         gzdeCPfl4EkoLTHBeSF8W3rs4MdWbJhdYy0QrhE/9uHpUYOY/nk13rThSkX3WHJ/qSXk
         MpGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/rXC/3kUDREKqm92hMSAHrKR1PRi9fYl/ry2fgZGzCXZ82T6PM2khUJt1FBbc37SI4a1oUmLE1zcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAHGQQe/XLdsf6AQsneIps+Jya7wzyaPQRLQL7eV8ahMmwMgSD
	Xq1HLh3riWcKeN77xLYS21UncwtRitxXBctZZD953dhkgg9lQ3Mrlg/pKmyXx2J/UwA7pUdqyKc
	5zmzK+4csorzhlN7UV2+yYN9o3f0ue8OvD7xtlakNEPWd1EdmQ0oOJuh5biPdi4ui
X-Gm-Gg: AR+sD10wQmiA904m4Yhf3rsoHcAygXoqy4ZCgLornGXzi046no8Hd9srtt9ZI73Xjrb
	NmZ6Q8XfoxvhTM8LckyAlcC8Cl2cOo/yZV3CduNN96UcWsRlRKAhZsi2bZBG+LWaoifL5VnKdOF
	WY3eyrM9+Bq8YklJ5ntXiBcWow4cYqpCEzUqgNAeidADwebsQpOlXvgC9zRxSHgxjmVe0n3EJAr
	oyFzs2T63rKsEPzTc96OrDC1zu4hS5o3va7aaqEky3pCMWLFToU2lGHEnA31NBBd+7jtvcUzNRK
	NK+1pHkQX9W/S8qoyGD+na1/RHp654qDx6g90kLuIAukEmx+QTRctzDANSpoMhw15xFhB2BT/Ab
	dNcOLtK9sichLT/eEEcCVc69dAUJcCMP+GPEl/zIx6t3K2hF9f1HFuhKyRUJ8kVrtYvt9hA==
X-Received: by 2002:a05:6a00:2906:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-84e2bb37382mr2679177b3a.41.1784803180650;
        Thu, 23 Jul 2026 03:39:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2906:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-84e2bb37382mr2679141b3a.41.1784803180017;
        Thu, 23 Jul 2026 03:39:40 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:39 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:08 +0530
Subject: [PATCH v5 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-5-f32ea6c1a318@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=5394;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/vNSx/6fYrenbbzMg1/o8tyUB/wub5c1VyoCs/xcSIY=;
 b=eIShKgSBJrXNqQbYNNeuoHpaucLc82HIefQs74oK1Atygk+felV/GUSMi3bCnf4yFP5HV1emJ
 k8W7/h4M4wZDMJ+ZySP5mele8rkRmhxydy31S2p8z2f3vg6Dmr14NNl
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX0aTtiRDxMHNp
 4eeGdCYeph+RNtNTlpU2hLSncf6sMSsLMCLfvgwUMZNAnPS7PHjrd2r0jqY5Q+F8MB6qNi7TTvQ
 ev0JTlzo421BlcTZKXTI2FoRx5MlzEi3waKhhhVLRyS19imeRqZtIHukRXWJ/42Y30O+E3HFD5h
 lY8nJUNVV6+JLLA3/ps/idG3fG1ZWNG+F9GjY7eBDjpjUSy/puVxzJdn32Q/ABwXtE05qkTlnUW
 Q6DHweANN8VUxgRCr4H8I9bsp+U927eeawO9Yfa9eGU1SI5+6meWEEacA666qHQrouKPTBh36PY
 7KrOdjCbcciK1OoUSGNyzOWSHOpTCNk6B3FyQyxozAnYPuEW6mf0945joZXcZThtOcIKdTqOnH2
 in3W450Gvn10NFGHtsMgooLvjHXgHMo113GkO2Iu6dEcwDValQz1IkbR9zo5KW0TFaCIp1tLTfv
 ys2XZmpQdjupliq47Xw==
X-Proofpoint-GUID: vilzDRaiFLQMLCSSOGrEVj_yXM4mhzdN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX6ost7MNPZiN7
 UWEkZuRo139uu277JhgLRXjQ11FuO2C4ayO22WYrFwAb2/PtxbJa9VIHW2wAUIX+dtR0PxS+kcl
 Z+oSB4Ijk10gAEiLBdsRl4fYdhbnVEM=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61ef6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DHBbv6Y4lRnqcSD3puQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: vilzDRaiFLQMLCSSOGrEVj_yXM4mhzdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

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
 drivers/usb/dwc3/dwc3-qcom.c | 53 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..4c559b97c627 100644
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
@@ -289,8 +298,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,12 +314,20 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
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
@@ -324,7 +343,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +351,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -617,6 +636,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct phy		*phy;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -683,6 +703,19 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	if (qcom->num_ports == 1)
+		phy = devm_phy_get(dev, "usb2-phy");
+	else
+		phy = devm_phy_get(dev, "usb2-0");
+
+	if (IS_ERR(phy)) {
+		if (PTR_ERR(phy) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(phy),
+					     "failed to get usb2 phy\n");
+		phy = NULL;
+	}
+	qcom->has_eusb2_phy = phy && (phy_get_type(phy) == PHY_TYPE_EUSB2);
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

