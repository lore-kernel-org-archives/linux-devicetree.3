Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FAD37C902
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218716; cv=none; b=WbHdkN4Tz2UBfdjZ4worRvxMeglhHliaQY51M1G9rgAGolhRfKgSL65Siy4xJIA0ZqVfs2f8gcgj5v1Hexz2RjGXN9GrZBV7mEnN3soCAYta1iDkxbrie3G1Fcvh9zPHZTDKz+w9Etjw/Omyz6SGenv+YcWWBX1Y+Gi7BFeFZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218716; c=relaxed/simple;
	bh=SDP/HXgz4amfEH/BI3vkK16jvRVsmUt0sdawVFBJlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBJMAsMCTSE7lDTGX313U8kv5LH16ku2++3FrKtxjBuo1wy9FeYiOI/z9eo5HAPxgrb3pPoZ+L69aqF1VIAGQFN/4P6J7bnO2d19+IvVEVSg7T3xqAqrAJLmL8jEV5MDnvLTapngiNNLCp4BQLiHHA/jzoTYhwVGsMBHnlyLHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEdaw8EP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuuhFXz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEdaw8EP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuuhFXz6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwt22735155
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=; b=AEdaw8EPUB0um5rn
	QvxNivBNe7znLZRvXMtDnqg4K7M/EeM7+28mptmwZ52lT68O4tU3NvYuFaD8TU0t
	cdk/W9RXG/4wbGVYUkPEetDFYJAdXBmPZd2dmkgdhyJQ/FzyuS96LvrErh3nrjAd
	89TVSLvm1TzuueCvM1fpvkzmEzfM+txsnLJfJHx5NN6jDU5KEUbo4U5kW0cGcRbi
	7IuIgQa/6a2/BAoELavwshaDfmXkU/yzFLxCoOFZ5QwlRqF9U+PTRyRYY+RzInoV
	3IqMsl80hi/DrQd6+HnhPJzJxeFlq5dBa29+d7Z2imRpaEQRJSaH5T29AaRfAF/g
	wqRG7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1ufb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so90584626d6.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218709; x=1784823509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=IuuhFXz6CG28eNNMV08FxxjCNKBlAsseerYQyFE/Jffvt2g2+XSw1dJ1zNCfo4SZmy
         S9AlAevDhhvjH3uRB5XBJqmZ4G2Ogy4vyIyXb6gmMHwkbEWdBqNX+v7rMhvGQPtALY9f
         vmIrs/aUA42J5ON3KmXo/HRcy6DeJLZfyMU9c2WvWwSLyDUErzlnqZp5Vynq6Zo1z5Qw
         dnw8TuFhojuLPyjAo5aHDdXs5w9khEnd5uoQMrroGcT1cKFl3DaW0OokdBWfAKM75sIv
         y/pG/tGR6ZOnLrAFrRjm2MvH92Uo74ErMVLg6C4y65Iboot7jaXMbDIiieHGRe05oupm
         hTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218709; x=1784823509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=hXk7OKVf18RaG5xY9oSNUuNqrCj4zq2E9rudPfCcgTvkQwDZXO4WDL1hoZ1RbfUpsV
         sq+6V9rKomFtldtLrhf6OgYANH9M0qq6puqrMphQFZYKaUqIQ1N2NEeZ43YALZoVq5nB
         yfIbBRH+MUYpUJJb/nIgq2LSZ5+wftvLLMy+If7EPtNs2h3cMHfgjtDmB13Bh93B22W8
         mxwvOYTSZ64gzoa94+NwPhLT6t3GCeh8x+9nNYeVcgbyV4+yvz8lYaGZIbLdYcqA9Ae7
         pUlCmfePbf4Yx+GbemTjzLNpvozS+gIiJ56RtLVJTLghh/G06WRO9tBMvr18claTwDRO
         rqfw==
X-Forwarded-Encrypted: i=1; AHgh+RpMArKIJ87VAUPpM1J95slEfhmV+FyXSWIqqhczxgkhhHh2pr1zl5VMtrRrNQKfzshdG48OuE4QcxtG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UxzF05Vapy0ro2JAO6E8TbRpaVsPYJY/HddpwdvDO5YSlxvt
	UNCkTh+XEl3druuvIgNhN+7RMrkIVFe0Q3BpOUUnpwhdMMM9QgDVhPZVCZvAsY/H1pDnZYWSOoM
	D2NvW6iG/2ITfhiTossRUxox3Yn6rfXASzZH2jGnTUIjZ7E8FnuLe4teF/evKJ1ce
X-Gm-Gg: AfdE7clGpOvPsWxOCH20boLvb4zdXHfhxED9rkI8W03TzF+Iaj2ipeiq9kkp1ZRzeDr
	pS+v8LI+GTYqWOCMj+uimt3QhxcJuCSAZ479Lw15n8QJy9VxAuZE5sJc3xsK0weyQ8r73O5dDx1
	2hdm7c7bwSIRqSQXhCSKxhPIJTx8JoJyTSm7HyEb/pKugW4YFNPSZJt2noJTun0rhz9E37OgNMB
	dd4uQ83Xa2G4VLbv/YZG0q/j7Id0bhm+5ybUuNDJhRwbB4Xo4ins7ZlG16HeA2YbZBEzG7Y5LyT
	Bntp2K+djpejEu7zcMRGtTVS5kqmH2csmSACZUuhfB6fNaqe7ud3N6pYCgIhyZnaMlovzRjWKjx
	+XpJ3URL7I7KOEbK3GGUyPakLrRy34BISP/bh1F5nYWO3NMnFayg3E4w/gydGXwzNphIMdDaaFM
	56m21cJNGAHTbncj8NKsbO27KLDymcuSZHHAF1/gj5Q0nLlh1v+Rk=
X-Received: by 2002:a05:622a:2c8:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51e4239fd84mr117366561cf.35.1784218709142;
        Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2c8:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51e4239fd84mr117364701cf.35.1784218706689;
        Thu, 16 Jul 2026 09:18:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:19 +0200
Subject: [PATCH v4 02/11] Bluetooth: hci_qca: Rename 'power_ctrl_enabled'
 to 'bt_en_available'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-2-9b02e6f549d7@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX05VLSBRVJNNB
 yfFCihh91d4oPAFdLHcM1UX+x2lV2JpA3fzUCqB3ccSgg6KBRU/c6bKXTejnpkD1K0fiXAJf1B7
 PEJq1R8nhDJo2YxzgHjkiILbdDO3Gm5Q40/YL9mHFx/1ydck3lvVdbELtEInEhutXbogyNrrOHW
 ueDymDiZZApu2sCLcUY6uIse98I6TIuuIt9JYdvArrhk3J2jLao6weXMksLMlATxEUcPIGXFfzC
 XsILQt+1Qyo9jGyTe90uKJRvuAyK/BVzElUQZGTPleTMPcmJ27MbOTfcl9CY6GHBuZbrv3FllDR
 94vUFU9gWZx1LL76/K4TuMFCqWkG/0TAWqeW2+eHeJUyLoqrlJWjKpP7kOk9Sp2zaAWx4zAMmw+
 KbOTXkTbLOn3tj/8u/n39QbdiPM9NCJ8iFp/LrEjBuTTe0/5livHGgZA+eux+35OojdA3XFLDXJ
 JFJaDdtMs71F3hflQMQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a590455 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GkjeHiOwVUe-z0K822vfMi1maXucYwUK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX58iRshQWxNA/
 J4rx6amMPWDUUuLL3U9DvhywS/X0whNcOc4cRrMfKonYWv4fmJ6xvebjQpu/eFs3QpVyjbcCZZI
 T8umlzyc/5UC8CfarcjEUrGlMVBgmK4=
X-Proofpoint-ORIG-GUID: GkjeHiOwVUe-z0K822vfMi1maXucYwUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 135c79e696aefe2b37ee7a7a668715360a1e2d75..17f436484e1e74d1dd690ada22134315abb767c4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2393,7 +2393,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2501,7 +2501,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2539,7 +2539,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2557,7 +2557,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

