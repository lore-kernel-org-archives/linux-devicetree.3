Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B183D9DD4
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274927; cv=none; b=rpWLTzYcUEDXl749IqcJUAFtsf6qnjAfbvHqxHxoZI2fX7sUgh+Y7g6E5hrZi7vbr4isfCbNnYb53LLfJl5c4Xo1RZNXaeZwVCppIYDXAc1yLF6Lt+CnuovpS8shy00vpX8evc3IcuA/ziwz2fbHbE/hB/vqPzp0JHb1tNG4pUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274927; c=relaxed/simple;
	bh=IwOf3bKBO2x+9q5gt71IHZnJfjB3imuDUZjTiln6iJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VunOc14VvdbdBvUqMWHS03+gMXHZ1qQGpiG7zSL19tQ3dUIDQ4Krr7139LW3h13/oAWI4PgsGXw/tqO2I5GjAbp8xdqPcdut1sc+tPNLPP3SUkfJQkU+FA5fRiDH6uVmnl5WKBlP/Z1sACL6dYOxm6UHuqTCZgVm/yY9llin2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZCEqkdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkeZpcyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZCEqkdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkeZpcyD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nmEF447958
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=; b=IZCEqkdpOmuOTAfo
	FFowHjttUxAGEL6dabmLFG5uG6JmVQGx+XH/JDks/TMnGdpG5sjS9jPt135PwXvh
	kM5fFIOafts3NfhPGblJstja8QPnvh+kV5dLlYv1ptiGnNrb4+a/JMdGJY0dCbeu
	QUhV50m0qOAgJPty5vTS9P0oL5xiCdoiEW9eA55XCXBBsMEsGcY1kVZEQBITBS5N
	25PCZ2uPQBMNUpMgaGZMbh0yy7uEhwpfEAJii60KgznRKtjH6CLVZd3E1xwvhyKQ
	bCUP7Gngp6u63mFxaXTSFzu4kq9FN8//0qECmODT7ITvORD1Bh+1wcQcjMlJh5tB
	hxBTGw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg8hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:59 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6853c2438b9so11550328eaf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274918; x=1779879718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=;
        b=GkeZpcyD8H5ng+rdRTPHFB9scks85AenwTKJaC2kgkASNUTLGPFbyzhcvv4KNSFMnX
         KPZoyzCEOeCZtgRBrqRo85O+UG/87PCae5vqr5/nihIiSL4ZtW6Ur+dX9PpDLWDckQCM
         z3ypEJjYGSaFj1kbSmD+e2wuwEKGLouRFYqJRaR3aY+i2jL4xnS7DN9WnQqaoFDr3oEs
         KBogR6zlFGQohU8mLwXxYNJ4JsPhP2IwJLzBOtxjRb95XAJeWBbkLdypdLv8z2Gps/Tz
         obEkrEaMWjOwZMt2GXPNcQxgB/c2TnkvAkxecxN1jsH2kMBPuGOvZdV2RQhE++xFPwQ8
         xnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274918; x=1779879718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GI2hbxpBYvrJsq1N33WhlyERapASJ5myJdAz+CdIXHg=;
        b=HYbB2CGk2Ke/tmyecZsUYYYzx+sysmsiyTfl/E2sJkwxM8J4pZOU75Rz6FOTTulg2f
         fIkMinal2/BrZS5zhGRJU5Q7/DnpqtDQcmDU2SPG8ualI6mzZbM9H534ys40S0rp6aD9
         pqdb/vrVz0jPRK0xRehDJP5jOk7iVGOvEkXIUbMLqJtTKYu1Uy4Hg0NlCZxB3mCQzaFW
         iUZ5TiVfznJIZmWMGDHC0siepw7h19SqGmKJBJYTeQZaSKJD3pkXpnlfMxKgC++kzrVV
         /C+hjmn9UyIBhQdq9Pb2/Kz8hU1p9YgngSLdX8H+0ExqsR/TQ4JASjaYaszUd93B9MJv
         N1Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+vm+3nQ2R2aA14gn6VGzTHNmtPgLlIAjSo09OX65z1ot8cFglNGdFK9MfP+EeplurdSvTjGtS06cJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxIojfvs4HNJm+eYpY/0pvReLv/sEsTVaMVwbsNiaMHKKJ2rY/H
	bntP0t8V4/oSg9c29zefFejwdh7uGMU7xHFgGwLYdhVf2KSLHMiy/hQpQM9bmQCNjQyMfhQSFMN
	k8+XVNM+iBYN61vjWHOmLyg/Eu3F/bVQYEh6aB21Z1eLBBe+EFr51+gey4SRKz/0iG2Cgtb8Y
X-Gm-Gg: Acq92OGzK93cyR/+kp84Bsvb1sgD4JYWU8d6/VpNJMNMOd+PvPNNVXC51IgvwxD5ee9
	z5FybZAZ6eFWS397JMp327yD3tRCr5pkI5Y9/trxQQsOyJ4R69PlHj80wbg+SNeayUWkwaKTBtn
	jN5Fqr2GrTeV6gYNWhiIS/VSmAMlBtIjdQXmlVN0i+KkTs6C34ykO96FaWyEE8Roiv9i3QTPdrO
	8eI+qVf1bWyyFinyQglX2btcFlQqP5nfqGzr8R/rrylSpKokx2EgCMkezvQqrGpUwHIlnfn4eyi
	4Z3sIvL1ipvK+qCeWbpNoEAcalkijiM0LYPdkbHNnGoTsg+elavQYNy9etNBxIJjZAbzC+aQx9p
	eyXabYf2L7EzHY2xkh5ipKWpohYf0+M8LWEUVsmdlZOJGaIAVoQfAaHMR8ZdZFRHG1T7XvpYXjm
	yiq5bkRyVo1z9j1oep
X-Received: by 2002:a05:6820:858f:10b0:69d:50a5:5c48 with SMTP id 006d021491bc7-69d50a56172mr2610305eaf.21.1779274917964;
        Wed, 20 May 2026 04:01:57 -0700 (PDT)
X-Received: by 2002:a05:6820:858f:10b0:69d:50a5:5c48 with SMTP id 006d021491bc7-69d50a56172mr2609995eaf.21.1779274913931;
        Wed, 20 May 2026 04:01:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:01:43 +0200
Subject: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: zE_EPNMEFf1N7IjVP16TtAHvOfX_WvLK
X-Proofpoint-ORIG-GUID: zE_EPNMEFf1N7IjVP16TtAHvOfX_WvLK
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d94a7 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfX5HZdZCtlr5Fk
 sjOe1XTogcaw0FEsdHyJmlAsbLmm3wPTjYGKWpCsPE0H54Mh8YIoRoZgBom2y2Jy88/pr9YMwW1
 3C40korrc3rcNLtrqPZasDv0kFLPjj8PL+lNHb5mpUoP+D+Bt1gEOs09z6FGm33LN7iHcwNjYXS
 jwZk+u2JfScj1/4evrtONAxGx3HvbWjCPyEjtZvlv+CuYNM+ftesIWVfKDnhQiGLs5TA3HFSDUw
 hMxsRddCoOk3Z81ySww9ee6DrNgSpWLWfnaGnUvEgt8Sk/DYznDyg2ZxQvCrs+FG3SFp+cqixKg
 6HttYy+rwr99xdlVy45mf4eKLINCxd6PHBd+4rjJz/q88LVXu6C8WRUqTIVWykik7lYXX+oHPJ5
 YtcDx6CW19bZGdUwwzLwI9I7qThqX3khiJElCiAtakBBGnz6c/7sbLlrdG5ZZKYzo53STQ9y5gx
 AOYPJ3c1oaMuI2wzvvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200106

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
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5d670fa2758d3268d0 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power && qcadev->bt_power->pwrseq)
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
@@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->bt_en);
 		}
 
-		if (!qcadev->bt_en)
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+		}
+
+		if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
 			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(

-- 
2.34.1

