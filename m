Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BE47FAEB
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202919; cv=none; b=VlqRIWSw4u0s2ufE289bvxzNS0aM/s/dZ+RFDJCOYcrhzJ/G/6z3Gez9e8hBj6x4jZ26PAleoLq4ASJujvqGpNFvvLsGAx5a70S/CDTMm3m/6SUH3XZboyxDicvFkpkrn+V6uQveaadKGATX02nE3X5jDq/rli0lJhA89u9p/qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202919; c=relaxed/simple;
	bh=BJBq8/An6MuV0GoyQYKZqS+8da/E9kOGbL2xz49VQbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYPF4gZibyv1F3PBVRKefV9tLKmpAYrzif+AUnnNtdxwyD4JUjD7PnzfQfRutk4gNphmifhTkAFZVQ1ZGJ7UABHrs0VBHwm5OOuC/hAvflvQMZC6HHih5y+XDk4nqmbs0uoW46Wqye1XoOgVt3fX89f8m16/pZYeceIdyxoqvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8mGxj12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dh8YrAWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8mGxj12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dh8YrAWE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFSmK2897711
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERPpaSnYHInL9kiFzQxRZVBFrQy2Ir/qyF0qmgZZ+MU=; b=I8mGxj12a4/u3ewl
	owcIiOIoUdMaLggVLASD+NUQhh/z5fw/Jz0DoMOIOhPln6po3vcmYDM1v0WMuPyN
	SAu35F2zqxlmNHxjD4Lq3ydSE93MaYGAU30YwrEr3cpxj27iUwDaINTQus8ScsjF
	gaYb7rhUw+7A4oYEd/ush0dSPY6dNA6Z3OCpTraHWulFpKY57WEj0uzGF3KbJh03
	UhcTbbiozS0w2nO1sI5MRY4egO5nhK3OKPWzxH0OVEnvysCyQvR2GL1+BeIoQz/s
	2gugV6kcjsFO6yeWqD/5f9Ye1cbKLj5+KmmVxkCvWJICYl+dL6AQTEtua3cNcMtv
	uQkhCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnra6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:21:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so291223485a.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202914; x=1791807714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERPpaSnYHInL9kiFzQxRZVBFrQy2Ir/qyF0qmgZZ+MU=;
        b=dh8YrAWE9bYPd4ZAlO7poubgTx1L5DLmaQZZb4gndyA2E4IpifdRX/uOduIAkE1Xlk
         +l6RSu/zDZET8winO6ldQ2xSgI+jdWmeDhGfB+2j2pz47mr41S10B3gTRRQCw8nRKcQb
         s4JGtF4Hf8jo4qLLX6ipLdoTSmuFo3HY05SA8J6XAPqUSz1ovmDbsB1++zVFsiU86ffQ
         rctyAj+y29ijGyApn2UlTBLZKa1bpRf9vBAbmDwhISJDTr2tiI+8r5TbAtw3XO7kMX1W
         iW7i2UTi8yrV8HcyXhrc33BEvLFLvvl/FG0rNThGIn3kHFY0sKGHjmcGdpNLkxKLDc6s
         qwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202914; x=1791807714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERPpaSnYHInL9kiFzQxRZVBFrQy2Ir/qyF0qmgZZ+MU=;
        b=PTkzzuU+iaeDttHfdb3S8agsf86Ws/DNiHg8CAoTNkW2ZWWYNVgu1n1ZO1FeLqYUna
         JmrsfBG2s0IGHqODK/7UwuvLCKytWILKGzExZsHSso/IgG/LuxQT9kao8CC4miWQedQK
         Qd1VMRPzgjxX9EawPEwHlVDcNteYT5MW958/ny4bWwHHiddUNdCpQx/fISRHqJl2M7Vc
         V5GUEynEnMZv4Y2dWEcNlbC8lv3cTENEfKWH+HDx+kZ8DeaDUGuDICULM+vsOk+9i8GX
         kxrrAqGM275h0i8vgNsiWQbIU6vC39bukqkhCZXLr2qS8y/V2OCDDCbGgp5fpZ7gqHxf
         TbDg==
X-Forwarded-Encrypted: i=1; AKwUvBwFA41ka8NUDw5Mt7Hww+KoPAbJ0f2SRcYW6tT6pouodYId0mTrqpr+ByRG0p61Z+t4wfgiMAjAM2jx@vger.kernel.org
X-Gm-Message-State: AFuF++lV92jB+orwyZw2vSWMldo9jgqFV+17WIz2x84YfHhrOVHJ+SE4
	r9aKCBf4uiX04Il4rjGJJ/k37U8wMTz5eipLDVNB68HpvXxgh8RWk341HIU7c/P+aSn0FYytLNz
	5rt6TqS7KRMp2ZLkcdijlJReBlknhDTEYcMRDkkyvIm6IyUKFV/Sjlf9TC16k0wBR
X-Gm-Gg: AYBFou18+WctB4j0XU9bU3OnT0xNHCOSEmNgKoCBwyzAxJHyq2bV72COm98AX47iAsb
	CAnKIORbmSdOwzkA1IdvsMtpmVc59BrrogcUy0v9Yjn3am76mXr/5w9VEbm0bYKEKh+aHh0/nqb
	HFVNwtn11VgAlTcA2SWXL7NvtYp71bxROjR1xXuPKEJ2at6uxLS6MIpsSfQYL8Mjh6b7H1HDmQS
	FStF1FUFMRAxp8Kjs9Wn9jsAfIIwPLOxavbAYgNglAtmpr+WUbgxyvWdKNfNb9y4MGMIPBaSSVO
	9RgpLwEopSd1NbtukDAnx2r2JC+OHXDeGnYwHBSEDLrJYbpLS1jZYZse6U+KIqEmEoMFBhtHUGU
	c0QlqdS4XcB1csuecc3zkKzD/iO/aqFRLmX+h+wzs/6yeWW+gJ39hPh+rsxHJp82BVDHsQ7aKQO
	JI1zOLHOgJu1FwzPz+RTLRbWw3iIkyTou5hptEywizsY0O0fIXb9C3ZdaG2DViOWui9B/0Yg==
X-Received: by 2002:a05:620a:7119:b0:939:a9d4:7022 with SMTP id af79cd13be357-93ce7a9de83mr1837636085a.8.1791202914199;
        Mon, 05 Oct 2026 05:21:54 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:939:a9d4:7022 with SMTP id af79cd13be357-93ce7a9de83mr1837631485a.8.1791202913547;
        Mon, 05 Oct 2026 05:21:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:35 +0200
Subject: [PATCH v7 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-5-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7+ZVmu4jOsRk
 PxBA3dGo4q2RVfvK9O938k7LY/gPkvDhBZvOQVG+L9qb+aVWsIaSDqYpYFJm0XFhv8VgxNdUySy
 GYkKXY7r4WJ0ipu1QqXma5mEMxWdleM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/7rAdrGUN/K0
 NK8f5N2dEVs7Ct84aFw0l1JKJEE/q19VyTGbMHweEZB02AXBZw5jaFUgWPfr97OjLxHjvBK4j1q
 zL4f6ixq5ybUa4yktKCSxee3bBa6xkKST6zaRAtIYeAIrQX7e8meQFI2MPwnVE4Lcwvuout/yKo
 oDGEi3ZKhwrjALJK4A04ulL86NbDFO9laL3wXf59ftb4fG6fu1JImNu/+52VWnUIJFH+nCKVwA1
 sF0gsSYGsEUSeiVMKuUtfdNXqIhUVMW6aSF58wWMfvMWdYphGK3BeVRBfrV0GPzOzzMVLcrNW0U
 M7ybdaVMfKWrvqw7vpN6gf4JXNvBQnM/rC/+bzlAJBVlg4ATr5JvLQ5N1FpIwbK2R5iqcM1tYp1
 kP9G7eRoWX7poafwPX4NYuHRZbseux8q/d3KAR5aJ6iAI2otJ0s0cyBJB2jjq+otrWqjbnfGsO6
 l92B6MftrBuibOoo1rQ==
X-Proofpoint-GUID: JaD5hMnlVRZeyy22ZnDdkQqrfXyF56fj
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac39663 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=reVw4oyKNVL6WbIJD7YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JaD5hMnlVRZeyy22ZnDdkQqrfXyF56fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1d27ff98034ba99d0783e48db5c605f3b31117ea..b6ec1a57248e2cf4bd138898ffc5cad45b1b4a8b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2396,6 +2399,34 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_serdev_put_pwrseq(void *data)
+{
+	pwrseq_put(data);
+}
+
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct pwrseq_desc *pwrseq;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	/* The pwrseq is looked up on the serdev controller (which holds the
+	 * OF graph to the M.2 connector), but its lifetime must follow this
+	 * serdev consumer device, not the controller. So acquire it with the
+	 * non-devres pwrseq_get() and release it via a devres action bound to
+	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
+	 */
+	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(pwrseq))
+		return PTR_ERR(pwrseq);
+
+	qcadev->bt_power.pwrseq = pwrseq;
+
+	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2426,6 +2457,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2435,17 +2470,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								  "uart");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*

-- 
2.34.1

