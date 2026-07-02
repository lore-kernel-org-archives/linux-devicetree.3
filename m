Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446223C9EC2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989199; cv=none; b=uO4j4fU2yts1nNkWBusIoDmcXGxeWvSUhp2lZ9F3D2lcMYQ8eigTCizQzx8PmtutSmnyVGsnKxgggMoY9xba6dPrLlXmJxnDp9Wy04V5HMqEW4CaEtrAgoSe7UFHWgpKQyj2fJsRIX8myqOZGbQ/4XVuCXM4wtKIE/oOiFvkFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989199; c=relaxed/simple;
	bh=d07rwEK7oQJoMCbcs1syF/OQ7vSvilkVUT1OidwjI6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXeewK4ju7UCmVgRl7gjTMaqkdihrxTlfE2rMKMCo5S2z/T/W2KuYdiUbpcheMwZFgje3Dnxg7Dcmy/UADif4kxYnKCFk8N4E3xRfBzpPXg5lEHkP3QvALMTnCx1NhCTmNQzcPkhL8F1YtnKOUd7DGMq8g9tcGhjwIGnKyWuBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJfkgl4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxjkZVxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJfkgl4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxjkZVxq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sTYi4172791
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=; b=bJfkgl4M2QDakoT0
	XRsvV2+I7igkZ2PK/BBbrHCGfeXemJxB9WcQVw2vZdxrfpKvQIMlni2NBiBBirXU
	bz7OqjPi+jNXuJEnd4OUYwYyqqxwvmZ8EYSOkNqDbpwPLJok0qUiIpLFiwD52MGI
	OSstWGI3+kYSFzljg5SbO1St07D6nRFJZWJF4uHTZGpnc6Fqne3ntWiwK8UUQlzk
	LY0JmZPNKEo9WZE6dzT2dwnGTz4yfD54dj4g14Nyd4r27GLzhQlRrH5uGTXQEsks
	pFJESnrZ15Uhea/h3aoiRmMpw/ANO5UEE6+74CzS4VtWvBPBfldtx40shDZCW/n+
	4qWeHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwre3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:46:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so54676385a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989195; x=1783593995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=;
        b=ZxjkZVxqYKVocXysIoeXo0Qh5dl/WnrjunFTaOOv2DIDp0ZXeplG9B5jq61TvWM0lF
         W3sLzC3p42ok3nXRmPOXs2SYlrPAWzCrdXRB3bzbJMMkFYspr29XuDFTs/XrF6+mZ1qd
         5L1j1fokatTfyyzVH4BONDwO8J0VB3mJ9xZua4OkIk9bX1vWRHh2T0mLSAkKxsiT4dhz
         BqxzsQQgeb26xhjdMMn5EsG7E3hVB9bsdx1e3oxpQJsMkLXa01Tk9vOAel5/m+i0Zf2n
         IkgAzd8++epAiwVG/jBgU4+Qgzr0k+v4NSnFl6lLFkkK7oGQAmJCAHi0b+TdnwsXbPxd
         ujAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989195; x=1783593995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buWuqZv0wJYcIIERzVOd4NOvM7xnqG9f4H+KVXab1/c=;
        b=iS/+rzKPRctxqQnfy01pPaj2eMxrNcb2+bRxnX10lLNCrAYS1bIcXZIn/j5gzc3cid
         IZK4xO8TRJ0a4HjEb04M+bNUHvho5hIWnOA9h41DfX+F1T4GqHHly9uVeSt/uI9th85t
         UBZuQ3vFy+z4yrqr8jxlxwu4UPvxgsbUUIxu7IYyV93m5qc/J0FEQfR5c9ZyfSOfVCJG
         ZLynsheuZUevQw65ejIuH5HKIN2b4jNl1zA8JcWffR3qzky20jFJG0ZPDGVS4vE87kzZ
         hqKfMNUxscOWjnacaFZtchxSjF2sJIk38RjCzmeh7Q1YmvnQ9kBNuSC9zZiMqV760o1W
         almQ==
X-Forwarded-Encrypted: i=1; AFNElJ9go9jhkD0Hanw8eRi+kLeSmtrAXIDYMAxJIlJVTEjgvpGndsB+Xx4rX/sFWXHNaHQNtrR0j82yPGq2@vger.kernel.org
X-Gm-Message-State: AOJu0YzKdC4CrqgzUUXmfe9rh4db4dEnqOOAs2B0moBIcs0dRdhBws8N
	pG9O87edTbH3sqelFuQGCUvytvvwaQfPYQAAzh6a9AXlcruAeYFwrTalhtwm23ZiBzfc0Xx6Nco
	+sX4QbkH0MTqdBpeSqr/AsFzTawbvY4GrKDr1UGK5aQ0gZQS9Q3KUSnfQUNTunj4o
X-Gm-Gg: AfdE7cmjjo/m5ppQWUq/qZULFW1mYEtw/RKspxG+ZsN51PGGTko7koYUx7KqPyd9GZA
	p0e6SZx4gU3Pl0z1cxbMzktH4vzXz6WXV7f9v9OUWUx01ssXkZU3PQWdu/fWnsHhdiTyuTxVt8j
	QaDD8azGFux0l8qFqgYciZ1vo5a8Uy9BWTUyjdYjTgpXvk+uWElZatmFwYRpZ2F+Ilhc81JoPJd
	JFws/X/XSY6YFLlvw8ahS4w5sOQSSw46FAg6kW+zwOVwkBmrDhJ22a/VbyjPkqZM1lDgeICLUrx
	zPcqdfRxQUkaDM0KFl5eTkMKcyqweT/l5QQVMr3xeOGurrFmxDYE2DIOcYgSEljG+5OUwCKNcsR
	FeKhn3zGQ1KgBSc54ZNrxeHZoeKAO9OoMnybGUzTNYVetCTskMknMoBGWOr3SGhKEsf5JQBXfyz
	42QSAFvCC5fw+gF8hLXAPK5iHEkR8iOeF3VXqejuqHIi7fhjnW5CqdgAg0Wbg8J2g=
X-Received: by 2002:a05:620a:4592:b0:92e:57ea:8c8b with SMTP id af79cd13be357-92e6955cfddmr1240420985a.0.1782989195280;
        Thu, 02 Jul 2026 03:46:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:92e:57ea:8c8b with SMTP id af79cd13be357-92e6955cfddmr1240418385a.0.1782989194692;
        Thu, 02 Jul 2026 03:46:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 12:46:15 +0200
Subject: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
In-Reply-To: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: zTlAVvvBIfvbBDfOFL5t6Q6fF87Orhlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX0N+WWQI4D/rk
 yOvqv5wLL0XiHFqtZgS7px58a1CBN7d7uzb0U+lfbRuyho6RCUpylUN7DNoZLwl3etbvNdSxlFq
 adpnlb+vtyY/auseB4QfXjePw2OH6wLuqszIV7cYwcY0uDlFqb5S6CsYwm2amoPRtYytYkAYCf9
 TjuY4LyUryHjuQ69SKiubEw5SBvUgMT1ipLaneUKvxeh1A5ksL/EQ4PEtx+PmlxtlckczZDLFaY
 65fiOUU8XbtQHdPbyhj8mrABCBWBFOjaHnYv8pbDyS30lGWerSaTYhIlUeWWd7gB5Wdjn7m/tIQ
 3LqUwGy5MYsQRZaM/bLeC6odf9viXqxH7IkFsUV2o6Kse4G50bLoG2JP+VT5o+ysSPiw8P9U6kw
 no5pG72A0L8A6qKSrdibZDa6Mj/GulnjrOgi4zm/y4cbNZtLMNAA0IbAcStkvAqHjq2jIAfDsxL
 QWS6PY8pYPIXJOkjcGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX6/p0nKC/r4zG
 +LxYIsZ8p5EyjMDH5waPnlo4FTZByXMmz3XQO0yypU+51yY+DVgh7CRtBm8tbhiNkHl7DyHoYto
 6ZWS4AHyTUtbXVQ8wVX17sbmloKSKqs=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46418c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=l-ki6R0DwxtWVe0rcmEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zTlAVvvBIfvbBDfOFL5t6Q6fF87Orhlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
sequencer rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected
to an M.2 connector), acquire the 'uart' pwrseq target from the
connector's power sequencer and use it to control BT power instead of
the bt-enable GPIO.

Also allocate bt_power unconditionally for all SOC types since the
pwrseq path is independent of the SOC type switch.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e87ae76fa00eda308e81dea25 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power->pwrseq)
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+/*
+ * Acquire the M.2 connector power sequencer.
+ *
+ * An OF graph link on the serdev controller is only present when the BT
+ * device is attached through an M.2 Key E connector. In that case the UART
+ * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer instead of a
+ * dedicated BT enable GPIO, so grab the "uart" pwrseq target from it.
+ *
+ * Returns 0 if no M.2 connector is present (nothing to do), a negative errno
+ * on error, otherwise 0 with qcadev->bt_power->pwrseq populated.
+ */
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, bool *bt_en_available)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct device *dev;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(qcadev->bt_power->pwrseq))
+		return PTR_ERR(qcadev->bt_power->pwrseq);
+
+	dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
+	*bt_en_available = device_property_present(dev, "w-disable2-gpios");
+
+	return 0;
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2417,25 +2449,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
-	switch (qcadev->btsoc_type) {
-	case QCA_QCA6390:
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
+	qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
+	if (!qcadev->bt_power)
+		return -ENOMEM;
+
+	err = qca_serdev_get_m2_pwrseq(qcadev, &bt_en_available);
+	if (err)
+		return err;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
@@ -2446,24 +2466,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			struct device *dev;
-
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								   "uart");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
-
-			dev = pwrseq_to_device(qcadev->bt_power->pwrseq);
-			if (!device_property_present(dev, "w-disable2-gpios"))
-				bt_en_available = false;
-
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power->pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
@@ -2545,7 +2550,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->bt_en);
 		}
 
-		if (!qcadev->bt_en)
+		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
 			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(

-- 
2.34.1

