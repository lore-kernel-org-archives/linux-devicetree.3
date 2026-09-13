Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E73F0777
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310486; cv=none; b=Oz8NDKNtRI240r/E8YysmuO6FKiauvLc8WnPe7t/iSV8dZH3ox1U3K4kg5em/7iPKSWrZyRpOiIh1axx8eIvl6WbbfW4+ZKicLFOHpxX7msTW8xawmNS/FpQgjZQiIB6IL0LilosX+HPlvsZuEU/z+yNsUqrJbxHDN1FMRYl2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310486; c=relaxed/simple;
	bh=ZxUNAsUxlczNYSQtVpJk4jpYB7XXII4MY97qOtw6FW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXH1k482aDbgdtRRtjNzyM0cJEgVCeaWnyt0n3iZGoRVMDpHtAf3v9Jo6xnB0G0ULzltaQvme0ZDC+2e5W1tXtKN7VfNtjb5t1OmRf6CTchBL1urf6TXeQNv7puNiEvo8Sux89u0o0dRproalAylc20aSYnMGNsppIW2oYZ6vyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGS6pZ/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jttdHpoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGS6pZ/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jttdHpoN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxmdk2785785
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=; b=NGS6pZ/DhxHc0z3V
	jVMxrLOMYQDK+o9rec23ltfYtrZJlknnLIj4jAR3/PpXc2z3xxDYK56a4SIsjw1A
	Wr6FP4CB2Bu/LoqIjfzTK+eXQrMam6Ll1Kuz/H+7oiB+2THI8QQSnABaF0kEa/tq
	uzi7EfmAdZ0sMg7EyIXPiiDB+PkZVB87Rs/ynqWoQDaowiOTDqPOUCNcX0JkrHeJ
	JcbBgCD0nZscs48RA13X2Le0JW24SF8H6DbuHoRGCN0V48Q639L+ru4RtWz6VhRi
	N1mLgdHUtrSw7LDrqi9AIajZliCcd069aSZdcQCIi5AhlqE9jL9pi+lYu4561H63
	3eHs+g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbh7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:41:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso5611980a12.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310484; x=1789915284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=;
        b=jttdHpoNpJ5uyUWJewUUF4CPPWh586kT4Ttwuzwr4ztv5nAAe5LNauPxHHll5jlcmc
         qOL6QIr+Iqv5PhLYfQ0jjhtjYmvVi+MZAJ10r0D4wLrmE1fZzOdJetEzCkTETgfJcrQ+
         oljmXXEe6re8rwXUGWfbv8SKxuVAM1zN6jZcwTI0QIkDWvKkOMKCo0CR+6ECaV3VmvG6
         +HC2vHP/D8zUg6DXml2tTIqgIkqDIO1XybRJ6S1c00M7D5U7SAnEM5q7mrQ58oVsSGd/
         W0X3lD3y46Qi+BvPiBpX0clXU60qLUN/Hp4cp+i5TFXYiS+P7UAwL0w6d850B/b2l2P4
         zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310484; x=1789915284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=;
        b=QhJtp7Hu95JM0lFD9tdl56+U13AViU86As+5wEdAAF5FEa+rpklXZMnuaJ4G+01bfb
         eR9IBMqpBOeFsXhv1af9+Oy5hRfx02Ycj7x5A/cR/c1LUfAuwFnS7krOFMPdRurJJ+EV
         0kWUu/y+SRF1WkrMFJEYPZ1hYmXSzHu9MtInhi4rMQb+yPERM1p4JDMe/fXDT1OZNjN6
         xNCVgIX0sZpcM4/u64mdSSjlxUrYrYrD6rSOlh12dVKmrZphgMxCy5AyEtHqVOsfPtHL
         PyRSoKxuqS/LhJ4OTi8pNzRkoe8m9gBkVYO1o64QulMx1qpZvs+ZgiJtw6WMgmnbeLyw
         VCyg==
X-Forwarded-Encrypted: i=1; AKwUvBwAvpN81R0Zlbusc4felpXzhq1TRDXYBOoLRa0Rb1/mowhgBr5HHh5VUPhBne2EHCqsX+4H+3bdZSX6@vger.kernel.org
X-Gm-Message-State: AFuF++mDQ1KivEY4BdMWqzJJx7HkzWQCn+W+xqF9iimhqw+aFsmenBeW
	l1T9PeQhOLHViEx+7kLYhVx1PupDOqJgFk7bmoQxMUTSrFGYjIjJj+cpARBxslFgtIU2yhjeEgs
	8ktMwkzCdaII7lrwN38gtRB2hKCbD29Nnsdxg4+ab5dc5EbRXSTCuEnS+gHY9kC5n
X-Gm-Gg: AYBFou0NOdSjdP9D4H32dU8lfiuroGeJ/zMkMAGZ/NeH+8mSUyFkrwFG1QobiZqBJ7C
	P6zQgC1nLeEaxb5OGe/Du2UChMdfrusMUU6JwyKecJ5nrUwD5D3unAszT/1jxhF6IB81NsrxTaG
	AmBxKKPEFtNeLjdBmN8J7myrGc+iheMihvZfMPaSpJfqY3T3tLJ0j3TlvbKLMvJnUkb1bVLG3Fw
	sRzPTuEWTsWHaahFrHUiMii5G3U7bvh7pgQ6qoc1M3B602S11WrKzGcma8fq0L75YXmumH9Xwda
	1yLKCeF0Oyd62ppWvK6sxSv5wAD0WQbmul8h/mP5fVDNpC/Ue+3bkQkL4lKDshZApZalDv9r+a/
	tz6GwrWbW6HIQ+95H+0afR2VS+SCUSNJGyaTxWSHYMpgizE3GYSd+NKnE3BkqnWT1WbllIg==
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr27525198637.24.1789310483543;
        Sun, 13 Sep 2026 07:41:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr27525141637.24.1789310483159;
        Sun, 13 Sep 2026 07:41:23 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:48 +0530
Subject: [PATCH v8 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-5-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=6358;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ZxUNAsUxlczNYSQtVpJk4jpYB7XXII4MY97qOtw6FW8=;
 b=c0ptxnRcLFIuw80x/cdK3JLwkGCwrUNYbYwWIuOFuebHYUTSwpeeiXbZqx05wICe8gviolqNu
 EAKX09K78MoAZT2m75YoZKeITkyw0hW0IZXl48Uv7BKVB8WvSFzk8/K
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX0CX7u34J3fHx
 wqiq8/nTO3uBK36euwbJ2yomZPb3wtP6+ScmlhOUgAoXH3E+fSuQ/ydUHJwglJy6Sh0PFaVf5LJ
 a3fX+FdSMQZKnFh9fbMsn3pcPNM6vA0=
X-Proofpoint-GUID: Pvw9W2YON6RKl1_K4KY1x__jhtZElLDM
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6b614 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=Rua53wt-LDCXJtC3cl0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Pvw9W2YON6RKl1_K4KY1x__jhtZElLDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXzLJQTxDbOE8e
 32od2tNNiXsmMuDlUb1/LQSyj/9BLgz5o282xqWJZ7nJDHURtem1EdwkhrKsPrLj54DeuLTX0Gw
 izJ44CxEfFxDUCDPJakCIGHPqKQpJ6nzjKzDBtE0j7lKyTjqmVJ4M/XjyjhhAF3Jg50CFkIW5ws
 4wEppQ6wSQQi8c9+RAN+cQpvJUF2TcEepvyen4wvQvA4enI7HPJRkYDYqhV38Z7yRyoRWR66fBA
 DT6qBQhKLGmW/RVOGy6g/59JHbk5NR+bI0bgYq0vb3lQjNNtcZ8itwPWi9e8lPZwkHSpS0JLqud
 54nHH+yEtgkfgc8qebwUbvdVRsX+PyxnI82LXOeUyHzhpIJno1atWWX37LvGf3Fya/9pK7gheb+
 +HOssQ9GU112JS6rlgfvZYUEAXqTY3RPCC0e+ParqBi/m3vi0xrsfA5fWXEzLSYd3pJsTNWisCr
 vh2a1zfCI9V07IgFX+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 63 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..e6b6beb38fcb 100644
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
+	qcom->has_eusb2_phy = (phy_get_type(phy) == PHY_TYPE_EUSB2);
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

