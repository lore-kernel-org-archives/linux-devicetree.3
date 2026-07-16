Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53AC37FF68
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218733; cv=none; b=dsw3bl/L9wNIe5BWtRrzNQr7B4RhG/IHqEfdFoOqS0a5u2giCD+8++FFDBK2930jxFkanGHbta9Z0aGYvx69N6g9K7HPRzJZaQLvoqpQB4Q8OvnCb57tE3WjO8fyYj1SsTkJCocqbVrAtv9BKiVui39hg9I16Tw1SBmfMtN10DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218733; c=relaxed/simple;
	bh=Xp5FK98F4aXVm1IaIUQg7a8ZJjOswS0wCMRvU+2daPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6jyVulUE6y2N4QsaysoRD5LQ7EUYijDRnJEkW5r8VaVvSGwKnTi+iUWNQPW4zEDPquWig5DEzIPMA4jcu+VVJmjw0jiEOw8P1OltmnIRO6l3d3wcHUfbhCH+8VjZws8wSyPhlQlCZcGfc7lxGbh4Gfql4yFfUOpfhupaBfSb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt9HQI1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHUgnpi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt9HQI1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHUgnpi4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwHe2946935
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnNGLFZg8KBKoCKQkuNws9wP1R08Qecii+OaAbhSdTc=; b=Qt9HQI1vaCGtbfBA
	SyYNQAwcyr3yHQqJVYqzqZqd+cZhHgb/Jl6W8i0VtNlkGJY8npAPSaKcyuAigC9y
	LoVjcmqvwnqbrCy/wjM+VQ8JfFk4VDCHrF/1d9uXZzWvadgFMrZI3mrpwbpH+uLU
	YQMX/zShurTmpUekIIYcDH8a4byUacD7taKw7LTF+HdHSknXVTA2QGsYQYdJxvLa
	P3g+mKHbdufnTaHjARHtfkWhLBHCYXllDmyf7QC+y0D/L2AuOFz8DB+KfotvAhuy
	dAdMUBaCv2VvFCwCwRdlYGrJ4JOCvDSHWWcVMFr5w1Hh3qY7oUQT16vz/n+Igab0
	VfSEgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso38172781cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218720; x=1784823520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnNGLFZg8KBKoCKQkuNws9wP1R08Qecii+OaAbhSdTc=;
        b=jHUgnpi4Ax1M1gjwGwOgYwezwl75AI+qTtCycIkTSJMTvAAVWT+LiL1gblTXTt4Mlv
         5RzOL6Orp/F2xErGOpkpGqo6yG4xMkCgV206Q7d5qfUqGJz0AfZ5NL21GrrB71bCWHrj
         hfT/VIBhgOraWFpjpy0M67bYiMzCd0WWwTBSTGNX955J6HF/PFR9JI7CgAw1Gzt/vjAH
         4ya3sNEtNytA7qcKLNhEt3ADEKs8MY80qgOyImf/fe+diyKFvosxmC/Mp74Ta9iKF2s4
         BPJ+6+Yj/WEEIKCNchhXxWAk7WZLQrFL0e6ccDmJQd4c2lXe8mGFBPOLjhdP3/LPtPdd
         L4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218720; x=1784823520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnNGLFZg8KBKoCKQkuNws9wP1R08Qecii+OaAbhSdTc=;
        b=esPZWoFNKEyQql0qCShpUTbH1ioMMW2N61A0BF9Zp/D40VbAvVAhQHLx2mLB5scqnl
         KLFSu4uwy6PcXdne35rEh0VwIOIPE2goZDrZt/NjVIa2t2hHSlHb9m/YKvO6c+MPFc+R
         saAbjWgK30bkpXwTdDyqru7ubp49RtWbQzs/4gnNchOyW9+8/9VGOxOyy5h5Zn0uUerZ
         8BQBdrhCtgkpI3fD5+QwN9Ux0XGI2mJrYzPGEs6eCdchtx53XSoeDitK6gP/1r4aViWv
         Hbr0UsI5F/7phm8ZNmUERFsRy7QhUhoVQE7LvlVuRF3hjb1ZDUwRkaFefVzS10u5JsbZ
         PeOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7kPd4SUwk09yi0hpdolre0pWBWIAZz/wiXDDlgrepvLW2qS5mgNAk7oEYrmpICQkP+H8N5jMr5NZv@vger.kernel.org
X-Gm-Message-State: AOJu0YznkMgttiXk9b+6T9qN3v5bipjf7CCU2ra/WURxCEsmkV73Q4KG
	pVOzY1aOtqXnaabds7wHMqEFccN3vCYMW9G8kNr01dO/EBty1ZZrkWFCGbmKISdq632ZBInTXCs
	FnEFUhpfMt0fACy2c/RV2XSFwRSHGoCbaCTEnwOU4z48DGk0ENtk2wS478uGqepnW
X-Gm-Gg: AfdE7ckbDOC7pxVYJFKciLNc7nrDSIT1sp0FIZ10DtiY4vrlmXtEkfM2f/qAhZqnsUe
	WRS72GgRegajHD1jogcB2JYKcuG/GzyqFuwblOojijMrAMyoibwBUzJT0NjNGVQq2urEgpDUsvO
	dKneXwFcKcmqDVogIhsLVb2GiczmGV4HY7kp5xV85tLHAQShd86ZjwILYQ211tRJkT692meIk/b
	mYSSmoMEHmrYLbYw7zkmPhMHa/4iLLrh5vyFCNZ9GIYrR/lgPj/HbrgsVAQhCgfDdRhqd3FRtDo
	CQA9MYRTtxvhwOFWwKvs4TvUySGZo34tp+eObzjq1IZPI/R+9xO7j8qB4hrBjjd1yVXI+R0bSCQ
	mE21Oxr0e/nlSMFcDMMG33nnn9o+9qMdPzt86c4ew8ilF9nGyO0yaFDhqyPAkQVBPra55G+nUgS
	/4pakMv+x8CdztOaEd9QU7Zkb1L9fPedlVmNAhInlA+tWxiwV2xWw=
X-Received: by 2002:a05:622a:130c:b0:51c:1b78:b044 with SMTP id d75a77b69052e-520be7934d6mr2443331cf.61.1784218718639;
        Thu, 16 Jul 2026 09:18:38 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:51c:1b78:b044 with SMTP id d75a77b69052e-520be7934d6mr2442971cf.61.1784218718124;
        Thu, 16 Jul 2026 09:18:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:25 +0200
Subject: [PATCH v4 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-8-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a590460 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 95B-8-EL425hT_NU4hO5xtvdhDKziFUV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX2WOk9kSaVMI+
 oRDSOhyb3Vido+0uoOW4vvLOSh3ju4ZiZ2qCWltKSeQ5gnlLzpo+hg4lsQOYqjS5TF4EzqwV7/6
 QBOaN3MAAu72fvCGmCYTF11PSDCP7hk=
X-Proofpoint-ORIG-GUID: 95B-8-EL425hT_NU4hO5xtvdhDKziFUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXzNFFM9xg4htb
 gpDhKwwS1gGilaEzKMKxkQ6rA5xj9CXDKbqwjrCJcUWR/ftpz2kb0iwuHWAzKvG1rJB14ggy04y
 jovcfUKJjbmW1KnfXHexTUJd6s3L4+TtdddX/IejA1AV5QrZLwxTnKOX09bkH/pVPssd9JG0WAW
 EVmxb2jgeQxkxJzqbIRXrauEvZG5jG71Bbz4E17V9hiXX5TwcMlTf9LtYUiG+X5+1XLg2eRIFqt
 9YLJuIfMJOibFrnIiLUIlWuLjICdLNJNwOJVpoPZwU8QSSKZhWqRfmN0VK5WZMsbyKN+qXzr3Cq
 LSQcL2wKirwMt2o5YnOqvETT6ABIcj8XGS4G5M0agqCyKg/RMQrcSjB+fYHCAM2HHhLxH7I2TUu
 A4PjTj6Gj/3XPVRmVchCVTwR5qhIOx6w6YU6UI5QQ40NBuCsDUnl65H5Dyq97k/TJ3TMeGRoRsR
 pnwvV8vQJvIbQYzUT8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 25c4387136245fca25e375951f960d7240116781..22f6185a946ef04c45e41b2b34126e3f58d603ca 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2387,6 +2390,28 @@ static int qca_init_regulators(struct qca_power *qca,
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
@@ -2417,6 +2442,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2426,17 +2455,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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

