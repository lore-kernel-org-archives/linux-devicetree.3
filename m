Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442184;
	b=4oowBDGEGYMHly4ueMUY+ZRiEHL6f9GarqEZ0EHDLvDUiHFbIUzDo1pnA1++OhulEzpD
	 OIZz6pElo9zLi/W9MlOt9A29zGnXdv08QHvTPBeVKBYvjLc1hQn9S0/wroPxyN+GnT3kl
	 YfIse4Hq5p//j0lLEHYXi0BCQCLYAFRefknNTgq70zuxbSwNSBfOYSoOjzD71ylIW4zCR
	 H4SJ3WwsTqLKGWPdss+8sI4nqhhQRrUQrqaNuxH6csnMVcrDCb39Bmgrn3lEZ2DBNvwSE
	 ugxl8jKzh8INytSr42apAUANenGD99niLGvFRZQ2YAqA4awVUfuZxORFDNe0EVFwkZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i+16hty/zVeDc8dRspK/Il9OPjPC+qWKo3Dn/TxDI2c=;
	b=I0fv5wGy2iWlp+fhzVPY684Z9MXdo9TOVYJMiFpNWob3hehvWpv2fgSV4ayj82LoM+Fd
	 iPATYE8D4N+JMWPQ/rNV6jR4gxYGx4AOOpnX1XOwPkH76/PTrsMndZoOhsq9Ee5Xr9nmF
	 sfDI1kkacN9eJhz4BJ/taT/jK1MjbNXRVrAB1FkrOjgz816rlzFKzYQam29/czx70x0OK
	 W8+9R1iUCuv9FFjMqSc2GNejgR73TzXkE03XSi5JKHcjx6oob4cksVJ0Nkhdh0XlLNxCi
	 PNMuvpdq1S4/VCPLpsi0P9dkZXAEXsGsPwLtWN5jztyvVjoIdOpOdAU8O8CI1ZsoOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDNo2l9w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WQR/m3h8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7160A380E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB7160A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDNo2l9w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQR/m3h8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLJ9k4030561
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+16hty/zVeDc8dRspK/Il9OPjPC+qWKo3Dn/TxDI2c=; b=BDNo2l9wrG6nLYvH
	yHuz4utGXidK0DaIUU6RkW/JfMlmATTuMYOfBsL2zgmw3X7WOiBDg/qtJUAus98W
	qSsGnErUajpkRmHulMijx8Bdru1hBmgTlQ+POc+wNWt23rd4vy2iNIiPIZibqhjc
	Qr6VPBXHYpI/l/+exCvYKHWz+TBQZEZWa4tTNUL0Z/w5WrA1eP3uF6itG4OsVdSK
	0muTTuIh8X7otblTshWkaYle30rezGrBiydtyAPso/T3wVtOJEiiTcGqEaykfeBi
	f9ZrlPOdrSiSJZV5qNoHPoFhelDWgMtttBHvM9DX8gjaiXrrTvvLNAG4tgfAt2xh
	2HoX2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshv81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so359789685a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442182; x=1796046982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+16hty/zVeDc8dRspK/Il9OPjPC+qWKo3Dn/TxDI2c=;
        b=WQR/m3h83vWZfOVX1PqAl3+lUbP/tMowHPxNsVW9nMZo03K2f5Xm05hfmU6OoUplFn
         IUKHSpetEG/FAol+TWxPzC3ALagCrLzeh53Dp3jqCxyHGaWS+L6AaxYPGxJh+Dyaa4b6
         5YPUVN/TMoW3i71QpiOiw8/5gIlF7GfuuSYG9eteOlqKFRVOLHxHnDlZprfzmlurK96v
         QLGjolgXETBLHO6Y2n7blJITyPIdKQCSrc17bhe/QXvOMBYfg5pW+RRNn8ohqWav1h7A
         SnSEXAefmeAGlnBptW5pZz0AxQC3t+BKCvfftS7/YH5s0RHy5aRzrLyc+vF8oLyTs29O
         fdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442182; x=1796046982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+16hty/zVeDc8dRspK/Il9OPjPC+qWKo3Dn/TxDI2c=;
        b=RW/w22+k+VBWc7VIFBohxCucufCU4cUGXWoK+kNv3HXHRqOCTS4f9dfffAoV2ReUxl
         PbgcD0KnrLYjlljMnuK47vOI3h0ulm9W9WzthxTh2bW/AuH9z37yactKqNHJlxhVtDHX
         hnFIn/26zhHYeL4YQURYqQyq/jE2hjfKF2Bqj/eZsPKnP4YPYZfabv28yPgRXEGhAcG7
         UEuvgn4Z40jwkNapgB6o2IFWoyC92PtKFDwYfPsCmRXC5dsqbDzApxy9jCHBo7TRIBJm
         ssHUpWiMnno4nusSqrEBjXL1lxWrwdt2GoyxPCffQUROJrY6oDKmB/7kQks1M/ZU7kZJ
         +8Ng==
X-Forwarded-Encrypted: i=1; AL+hErEIkOn2S3bzlOjcNGR3+FiMVc+s8MCBe5vQkLfwFFh54P2VSUemBnqOU1J2oDcg/1gPZL44N0ALgG6+@vger.kernel.org
X-Gm-Message-State: APuU4Z9qsjAK7gr3t23Q3G2QSVUsFNu/QDnCprB6kze3pntPCo5RsiDP
	/yyIXvfjCssIr5BERTsWNc618ZfLpEkwv9JYFuTyGoiLgW5AHGfNlHosQXOu6DUTo9fJATf7xxe
	CWUTH9MUmxLcTrSn6/CYvnLEhCFQfPDSEtDvzO0yTMMZDWXEKUFT6tLHyC7p/9+p1
X-Gm-Gg: AZFdTZflnHl2XrloW6MDmHe+VxxfqHFnsPGnDK2bzj6fiHRp6UBxc7gT39Q0GG6wxR3
	D3fkvgiw+yZwFLvihu1ot6eOAjmTAqpvtYmNkBiWpFDWnQ6o9FmXQDB9PG/OJqYh+wv+xYeiXRN
	vV4Y7XmIYMqORkfol4rgj2ufG7Ukm5trkkujKB1arfSI3oLh8nuCHauwPYIHlwZAkTO+oiyj9MK
	k7dQ4LdxO75vI/8wRBa8Rc76ris87USFtXFl7PbQJIyjxO63JiEfubMK/DKzJGNv/0/KTD98gMM
	dbfQm+q7PbLA7VjoLEVbV2X7LsB9R6LHQxg4ti0vNKbB2qiEl5iY6sKM8cAAHq9+hSSwNwhZVDV
	3fyFgp6JpfPUInGCO6qp//x5DjJwDRkjFzaBuePZT4vA4UqMq1j5Aj9ueEIbrz7AbhyolSNNQkt
	vZEyI5ODr5YKsP8F3ts9vHW+UG7CGZ0WXbuY1llMyAFgM1rrX90EweBExxEXSOzch/Y3bHaEK3A
	mXvkKxY5rqJFEKKDvwkHChU/4pY
X-Received: by 2002:a05:620a:460e:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-949ba9e51e4mr1827496585a.31.1795442182026;
        Mon, 23 Nov 2026 05:56:22 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-949ba9e51e4mr1827490885a.31.1795442181447;
        Mon, 23 Nov 2026 05:56:21 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:20 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:12 +0100
Subject: [PATCH v9 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-monza-wireless-v9-5-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b044606 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FvA3uXTk7I3rYI6t6TkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tOH3tVydcukZx3erCf5n8ywvyQSg7m9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX0nh+563EkTBL
 7jlCa0T8uly8HYvr185XL8K6dmrclRVjyhIWB8y32c4BZwPCBWArleelovCkSMmY7MIFXcaHP0U
 k8N2OIt+8P7w3mrkX/2t+sRG2OI41J9wwSXaxysh/Y8tMmWgRWW8+ABjUUrrUkvhmi7lGBE7uxA
 tDwZgSyfxabIoBhbiFhvHiDwCDxUZ3A79tKHhNq2X69Z+dG1CF2SX/MJ++O6Nfiy5pJmtrt58wh
 GBf0JZRAKNj5zMohkTu0VIWHbki9QFVmt6n9sjwC0L3+2SF3LGG8lsdGBATBwrrbpQIEthcSFk9
 7Y1/dHfvQXJ/HLUaBIutFZ9Q6Hr+RYcA22JxG8mWBPQ9YWcgO0te+caQ08geDwoJcXYMFMql+ee
 D5msoDjVNqzgGebxjaSmNEwq17woKWEGqovqjKU1HWt7Ozr5HCUnaq0XxHCBBBIzO9np1u0jXol
 ny7RuLAIdW3P8agBRNA==
X-Proofpoint-GUID: tOH3tVydcukZx3erCf5n8ywvyQSg7m9O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX5NojBWpvBLXt
 VRNrhE0q1uWFX59W4OcP144BYjo0V3LcymJtQCIyt9UigJOB2LgyIc8RSfgAvssl9sQWmoJz6NO
 46ljwn/a8hG2Ldhu/GI9SRlDIQ+Zh+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

The lookup is done before the SoC type switch, so that a module behind an
M.2 connector is handled identically whatever its SoC type: once a pwrseq
has been acquired, the per-SoC enable GPIO, regulator and susclk
acquisition is skipped entirely since none of it describes such a module.
For the same reason qca_power_on() brings those devices up through
qca_regulator_init(), which enables the power with the UART closed and
reopens the port afterwards, as the module requires.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9246abd3492870a6867d12656056d2a5e6490e10..b9d77628d0cede0c75da134d522476460c7c599b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1886,6 +1886,13 @@ static int qca_power_on(struct hci_dev *hdev)
 	if (!hu->serdev)
 		return 0;
 
+	qcadev = serdev_device_get_drvdata(hu->serdev);
+
+	if (qcadev->bt_power.pwrseq) {
+		ret = qca_regulator_init(hu);
+		goto done;
+	}
+
 	switch (soc_type) {
 	case QCA_QCA6390:
 	case QCA_WCN3950:
@@ -1901,7 +1908,6 @@ static int qca_power_on(struct hci_dev *hdev)
 		break;
 
 	default:
-		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bt_en) {
 			gpiod_set_value_cansleep(qcadev->bt_en, 1);
 			/* Controller needs time to bootup. */
@@ -1909,6 +1915,7 @@ static int qca_power_on(struct hci_dev *hdev)
 		}
 	}
 
+done:
 	clear_bit(QCA_BT_OFF, &qca->flags);
 	return ret;
 }
@@ -2456,6 +2463,9 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
 	struct pwrseq_desc *pwrseq;
 
+	if (!qca_serdev_is_m2(serdev))
+		return 0;
+
 	/* The pwrseq is looked up on the serdev controller (which holds the
 	 * OF graph to the M.2 connector), but its lifetime must follow this
 	 * serdev consumer device, not the controller. So acquire it with the
@@ -2501,6 +2511,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
+	/*
+	 * A module behind a connector is powered entirely by the
+	 * connector's power sequencer.
+	 */
+	if (qcadev->bt_power.pwrseq)
+		goto power_ctrl_done;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2511,14 +2532,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (qca_serdev_is_m2(serdev)) {
-			err = qca_serdev_get_m2_pwrseq(qcadev);
-			if (err)
-				return err;
-
-			break;
-		}
-
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
@@ -2612,6 +2625,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 
+power_ctrl_done:
 	if (qcadev->bt_power.pwrseq) {
 		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {

-- 
2.34.1

