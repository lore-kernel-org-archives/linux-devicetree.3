Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429541;
	b=uRix5iokSzsxw/BjB4jNYYSOBcoad01CiIsjGXisHo/4tx1UgYAQaghuwfKHJJE4i7as
	 Fq3I47uiiOlaaVTl6wEkyTfaCR3tinVwb0u6F4G95UwaVpKlKRqHRXnKpOq24jqEfayKZ
	 33ZRcd3Sh9fYPkQE+JpNqEq4c8bTeJZ7SJD81zEShu0SLffS/jeTJhqxluo8qSqw2Vsp0
	 pMUPrarXheZhs+8CJpWUp6eOSvLg1S5dJz2TVOv80bD0XoiJXj7ogm1bcq2sjAwkvau3j
	 4G2iAWnLmmZ2yS5YzWLI9s/PVV0xJ8CUhm3lL71/5HKZvuOI68c44jeU54f+IIne8sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
	b=zxtKQD5RNp30CROx+4L35HMi/aPvoyRSFYRBzBYU22wIHPFD3SIR9I+ndoIiBsobTiqW
	 KA2SXuIOSTFYeJpTMwjeHkJcET/J1z814MRpO1IgoREm3/ymrshIwLxy9Wqj6kpt8x5kC
	 ZxhT3rdwU3Uu2LDAI2slfKFicq8zjjihMwlTFGvJ+BVlBF4A+zgnCbi5f7yL2ZEbNDNfq
	 8EAMbonlss5pwN/34BJhblZTqVkHv+EtKkZ9SxNdZtxYMsjgFAO4Dg5YSALghucJEiqUu
	 emzcyWy4cap4wwFESXVdsvpdIbqr8JaDUH8O+7Qfr8kIQ+bW7sRne8ledn3vyeSfB7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/ne0YAD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9+YkpNs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE5606A691
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCE5606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/ne0YAD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9+YkpNs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GZfV150163
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=; b=K/ne0YADjHipBOMZ
	09MFX+mU3kfu5RkHbTmdid8Lg6K4HetP/hxZXxzAuPi4W0dRY3DLa7rsZmLR2ERE
	a8uF5xkNBbxMMK/Jwy1c6ckjbi8rs4UjrAo4KCmaE/DiPcnL9wSPn257fTWot4SI
	5/H1Q3xOG3EroJMiTnHkXLmk3iZlrB/3z4OhdCtcWHGgR2Nvd8gOu7mAP7U+CDzk
	xqgJyUYBreB3Mdz9zxBhPSmyVPVEGcDQMJYRSrLC7o/xNVNwljkro9ybdVOlBaPu
	agB08qKosIZITVjww1BLG5pwGeyDbSyX30JfbARFcH7OjRdlXSK7YPrKSJRWJ7a5
	dA2wWQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk66w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92106c98714so69351116d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429539; x=1796034339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
        b=A9+YkpNsoC5tGy5F4RyLdncegq3f6j8Wtu/1c9fIjO0jpd/WQEUTshjWo24WaVlUsv
         e8lhj7aBBQOaazwWMPAF5tFkahC33fcETXdP74KIRgw0mk8u8KQ98JV/Lyr9z5CB7nPX
         yTQdp2xAb1LNLhxmZ7jrGlt9rIXfhWriFJVgUS+6Fo7i5tM/Ut1NkzEDp+XxC7DS6Arq
         JxKMCg67XfBifxRDI2ieq4dMwBTQ4WSOXoRh8kMeS+l5UPPCp8CBZUNx/T29xeFkBXJz
         jDQt+EOpEJqmwOYHIIfShibbLr6cjAFjLDx9nd2ooopIglcHB/ujKYr5PBj/po8NKovV
         T+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429539; x=1796034339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
        b=j4uATr9nf4lMBIdX5UEP7O+4j9JeohjMdOJln8YgbBut5p9/wSMWl+S/XNGLR7ceFQ
         Gq1RZ0lMcs3vM2ixPWqedemfaxMkoiLZ/SGJbPUrQU/s+jxTX2R4qfSzStq7LFtVlZNv
         orhVSB9zjk6L51zX+EgH+lZ4gO+rJTQylHeeCDO+mtYLt6aNgI/EmIZS4RNtbbE3dxeU
         c+wvhPuSfvAHhD719bMAkCWjhRejJSbjT49ksn9msUmRuR3vWhogL/m0dariFe/BUbQ0
         Tg1VNpW/Zyl4/tm4J2PB51yeCtBz/kjNaom//w5m8Y38kc+ubjtfUCBHuGgDTibkvg89
         O/lQ==
X-Forwarded-Encrypted: i=1; AL+hErFIz5y0E8W1smVG6ISOB5ZY+xAh4iBzJ8/xEIt6aVC4yAxKMySqtRrRWodwIE9UII0w4q4HHUpJ0icI@vger.kernel.org
X-Gm-Message-State: APuU4Z8E8aZLIbFCdMkCnsYht2i6LtuKaRif87fHMxfGC1GacKiRoDjm
	I/zVovDjIpks+Zgiw0oAsGUTWLF0idi9AH8OLxxPSRPZYjiXjV8ZginFN1BaZwzGp0bvD4e5LMw
	gF+gncWlW3PVFLmsrmZyA7qDZ5sGKMZY+ZdpuyMUgLohyCdjGhB3IqfVn/NZGAdQq
X-Gm-Gg: AZFdTZco5y19tKqT5r0RNUWGZi2f0/ug8bHuOV6n7AA8lcESXrqMlo2jxh2DnmpF2qb
	fmewBphpkF8aueHsTwm1KEWUXgxlI5yVFDEcC/ivkIh14pY64qNmZTGvwG/xmqvIwmLNedZ+3wg
	nHoeIuWpleGD5lXQgYCT8l/C0VuUYURD0XSk8xgH95QNl+4vXYfXD5kxVNVM0ueZl0cgbJ+OscU
	nRUBEAggzPYMgAtR7BNrei1+AT0vg2/uyB9rmDVG1kibCmG1EvIWU1VVpcT3G9Of9puvSuGqpMD
	cEtvDOwT87TgYhm/LHMey8/bkljxCKoYtPZxKgTeh3XNBEZ4U9P1SaxAd7lMjflfTpLi/8a8k9J
	1oL/kwv2cbU2kdxiUY1tN7069FvXPdZdpBeLAz3yxdbN7ht/STQ9QG2fm2UkRqlB8rreATGWL/M
	0ZQTdTHD5mqST4w/sjgLe8Om5mPvEV/rhFWedyVQtHI7AMazn6jf9SI/ulKVMNIyA7gCqYdEMQj
	diKFwqlHLAtJ3ikW8Q0Okgcgdhp
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id af79cd13be357-949bab58cebmr1771947485a.59.1795429539502;
        Mon, 23 Nov 2026 02:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id af79cd13be357-949bab58cebmr1771945485a.59.1795429539029;
        Mon, 23 Nov 2026 02:25:39 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:38 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:33 +0100
Subject: [PATCH v8 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
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
Message-Id: <20261123-monza-wireless-v8-2-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JnpL-0fWz4i4jr2yZ9x4rFjQipGkbKDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX51eJ8+UoM7UY
 LK51Gyv04nOMhP+kHQZdsbgHdSSDpD9ZiXzx/+twaa0qvNvizXc31bnGCxT/rEvxIkYClyMcbJe
 jUipEMmz7HVCqI2wgkt7l55PkzVee6YuSbDUmFqioL6pVsWWz1eEtD0l8JAbarATBj0LFSYAQ3Y
 vIRc73PvhYorXyrEsD7WA2spOVwDDunVDRbTpeRV1KegAlsB2v3Z2ehEK7z0JVYQxyhiKr1EZQK
 hEDL54/suIQQF8/8McrpZbQM12eBNi0ZyTYe12jx+lF1cCijbl+B2PefpDIPA0XI9gwOBA7OW/j
 ieXf+myy30+6OHQI4s6azR9x/JKw1LMmRraBHJiEfzOL9FYR2LJIxIPrWpxvvPU/x8VdIyC2HDt
 yJORaNSknuqJcOCXXATA8BtpeGh+aGZ1nrKRaVOi+2H/dgODLuoFMMb3Uqc6iMpWH+T0pICAhvs
 bPjcl38OJAlphAl5gcQ==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0414a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX51s1VcVZjKcx
 1cx6crkpB4HpyGCg3sZ3D3ZgRciQv2irShR28hc1Ns/Y1eN/jGXkAjH0GP068rwBN6jRbtNiHbL
 fB94r2PvYbmwUAAp6nI9mDyHawpzS0E=
X-Proofpoint-GUID: JnpL-0fWz4i4jr2yZ9x4rFjQipGkbKDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

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
index 998796ea618822298d7f956a00c6c50f14332363..3b2792a3639cfbd9ee7a781b6e4c26c660495391 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2477,7 +2477,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc_obj(&serdev->dev, *qcadev);
 	if (!qcadev)
@@ -2583,7 +2583,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		     data->soc_type == QCA_QCA2066 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2622,7 +2622,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2640,7 +2640,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

