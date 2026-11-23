Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442186;
	b=EwmcVfJujb5+QV6cgSTQbuGp6QXKCzDiaFji8gMOtPP3TlMYaix2gDOzL/Mt/ayE6fUy
	 b2H2cRk86ruE0hoYKA046SjBdVtJ2T2X/R2vNsD3HD+VSuMgioLEv6uLLOhwjaphPCAW3
	 N5YAaUzLKxZ/HS09Ru+gTE/2V+3uaBmGCnjpH9c+LXlSAoI3KO1+si/T7hI2RDntBiXnq
	 np1WHfcMIaKbFt51XxkSJOd1E1Jbaw+RAdbOxfRnbsaMzvL8XnTJi0P6K3L4BPJKnjcES
	 PaOXMdn0q996htTdQySlo83k5FtaGpl6cufSC72akr2LGXp7gC9kkRzWjvfW6yQy2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kXHKc8OOrRocpjmaaow45fYGJiMEDLftASwJTCzOxfE=;
	b=XQxqOxlnONs9QJ1a5EKuTZY0o54i+z+fkjg6H1t03pmbjuGA8saCjpPkm5c4F+PkK5if
	 p4oUbfcSeL/AQnvd+JPQn2fdHoeBWnXbGe74PHmPtD3E258QZrQoiP9UJIOr9MMb8wW8F
	 uUAqDrTRJ3U7E5OJ6u7oPO+9N25w6hj0uZIwmCdSKdnWELeJCNZzg+axNh0u02yDxb7oV
	 AwbM1Jy3zfemMMAdNAdvbNPcIMyN2Fv6wFpxZDtLknZWKmgoQuGM5tXAPdpIetfrNbvhc
	 Ds9YdbY1VpR5tPtWQBeGaa9bcal8UF22LRMpLO3aiqnUCcICi9sSQIxen8mhsFGfHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e839V2sa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YXT7mQwV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9417F60A3832
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9417F60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e839V2sa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YXT7mQwV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLJdc4030568
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXHKc8OOrRocpjmaaow45fYGJiMEDLftASwJTCzOxfE=; b=e839V2sad7MGO9qK
	9UWgo7wvdeN6lcOmu+4iiizDGksbtFB5ktXp5oV8CWbkHkVYpSqDkf6F0+54+GVV
	GB6JQCCkA1qm3CDWD/WdOG5EFYj9bttK5IbB2mWfNXxBUQZewxRiiSZUiAfP3Dyd
	ji+Ji0ghm997NIw5gbCnwGEP3vSLhwq2+i0ZjB9i5VdxIl+hn5p1djwtaeyitlwX
	1/7XKC0gvH+/BOXrmZRMPETMvF0+pnvBUTcW9hbzB7t/MpIBP6mtybYMjyAQcSEu
	pakyle1nrTVOa5d0yAfC4PYJ0vxpHJH87fZmNzXcQKZIgueXggfz2LBOmYzLn0/h
	CNxvyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshv8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so854498285a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442184; x=1796046984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXHKc8OOrRocpjmaaow45fYGJiMEDLftASwJTCzOxfE=;
        b=YXT7mQwVLdaklrZMG64YdK7vvilsC+9gpJmO6z+zVXrfe25lhUxwkJVGjbwwJnr72x
         zcC/gGeZ23awwXvf+w8uCzh4KRLUlNlH1mdQGmmQ3w/vzuR+O8MLkBI1pSD+OrdZRDL6
         oiNO9Jxf6VOW+FCtDKbpLNjRIU+Vr7Po3BS6yEYaLCJ8iufm/sI5psPLDghveK8Zm2sn
         WMdZ3kNrygNA25uiH70uINWQpQGwBI65FLJZTh2dfYMv65tmSXCxqRpbgRen1xGl76m9
         AK7u9rb70i4TJQ7mlMK8vG7eJtqwnQfri65Wb6/FK5QWFftb+Z8cNWD81AKQIzFlnpGs
         MjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442184; x=1796046984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXHKc8OOrRocpjmaaow45fYGJiMEDLftASwJTCzOxfE=;
        b=Hwj8ld7ZlbLrEKBmHxaVMmMc4EnKOd2hH2Z9qgzgjMkOmiPjKke2bz5ntACTPn/evK
         ChuWKishcRuRR4lGebAiJZk7WneKaVjGIpSAeKYNN29qIkjQhnD5vVgM0Xy5kN5h1YSJ
         ItZJgi62ZUeuKNqOD3k9slDFIaFv8ubjzH3txU7GYYO0EQutsn70rAwdF9tNeVFj83Um
         gMSsArPowTGhUA+zlvB6uTiIjDzGxguCKEHqbQeaYn4rZgI73Clyn4vZz7z3xqCzUIA1
         lTw70z89tmuja/kM7MEQ5YWrASoKzBiTmO+ZmFHqLklIWMl5vGxqgAjNPjS2pj6EZqir
         GAKg==
X-Forwarded-Encrypted: i=1; AL+hErGX6a/kwVVvnWxaHj2mW6T6OJ63fAiZDV3uOlKQI8dnemGLA7U96A80C+gTtJurXo2ISXag1V6rS5lE@vger.kernel.org
X-Gm-Message-State: APuU4Z9baH6g60H/uri9/8sTj6DgifOyvBoQT8fbsAxsy3+85+f7bOPc
	U2T51XK8/R2SWCz3gHe1gAppSMddM/AOsO0S/RsO3Zd2e01Q/6c69tp/aZFHU3WEHgphK/C/EKY
	jX4Dn3NAdZcwoIqScBFG9CQhNLmOOvKVwuqnaKLcPCPKazJv7PU34WQzz+RtCmcjy
X-Gm-Gg: AZFdTZfpHmRXjGPP2jBRTd5eP5jY98t5uT3ySHUQ+TzvoIZRz/YqxHof+MRfX6DFtgj
	JAiwX5ID0N2nQQK0RsvU+zP0SMdMHCScjikwsFwtW2Wu0VJ4F0pXVCd9r2WjmMJ6skzBMOIg7ex
	Qw+7Pr2GiWHycZRPfHZS90X2mSESBEU0D9p7T1HuPvy8hMa3YMiKKAbfsXcVwN3pAEWDQ3c9X69
	bg5tHqbZ8Qx0OkZEza3HW9ersHrZrBjIY9rXfxdlohG6cZZQ4ILuFnnus1dz1b51FFIXPAAie/V
	/UUXigPpzJ4vVgHL6l/D0ge1uaDaG2P2c3uMWiF2r57N6/BmwEvyNluwAmg+acyp/GfjftPDNXs
	o90GYRV6za+7ZqlhLJ1ra00apDJryZ6FpstLmiTIwduA593PErUvZE1gRFLzv0JoUeC2vN0noIW
	TxjrmX5uwWA8Jna2wEw+fz3aSuPAwdyml5voHgqxBvJqk6SMIeZL2R1Ut109j4iPDsiMIc3FPB4
	Am79n7DmfURzjV9Xj8SNHE9mHdw
X-Received: by 2002:a05:620a:2605:b0:949:9f1e:d8b with SMTP id af79cd13be357-949ba99cb12mr1925646585a.16.1795442183769;
        Mon, 23 Nov 2026 05:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:2605:b0:949:9f1e:d8b with SMTP id af79cd13be357-949ba99cb12mr1925642085a.16.1795442183198;
        Mon, 23 Nov 2026 05:56:23 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:22 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:13 +0100
Subject: [PATCH v9 6/8] Bluetooth: hci_qca: Flatten struct qca_power into
 struct qca_serdev
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
Message-Id: <20261123-monza-wireless-v9-6-450d7d764aea@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b044608 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tAWmpyBk72D6OgzOTXEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tdanhzST4P261uoG2QFBi2aPCYBf6BzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX0rXNaU0wsp9j
 ShHyHUgP0Syi6tMd4XdhS6I/om0vWPHATHv++7UXszBlZwWDV1v7OPSS39M0BvVEUJOQdm9QzPt
 VNyvZRiU5TmW6iJhnH/WzXJ+M6Mfl7xnKKQdk41C7PFX1SRae509y35fWPq8LVdvCPAilz0XDBC
 xz/QxUoBReH6DC04/3V/fXvyzLlxxt8phaFXBWymMmnFUodO4aE5mIZqejL6cLDTDokBhDTbWA/
 r3xtltWEMXYQoR4AUb7Ni1vC0y1wRF9zPJ8CNydY3mxE4TrsQSbXXtyjalnrx43QLcemQA9Z1e2
 bTj1HKEkrVVdg05bhMUpADMFB3h1bGTyOg9k/V0fq6eKjGk40FI0KZVkwHZ0YfMcK3ZXXYtVnig
 gIwbJAhohHD0v1yig+lX4Yrs5ZPA83FXXUia84QpYyfq9xvSgVJ2ob7Put6wOJTC6jycKLtGaXr
 OuU7DJGetIA/Ge/lG6Q==
X-Proofpoint-GUID: tdanhzST4P261uoG2QFBi2aPCYBf6BzU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX/021leKn5MnO
 Pq/jOoQCxs+qNZReDMsf/+7RGioGnNEAdxIsZI+cMs3DQST8zx2CCfOdA5oxaBh321OtG6U9Tlo
 z2PUoVq42gFxN93BFFUP8j/rFMuSChc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

struct qca_power currently only groups a handful of fields
(vreg_bulk, num_vregs, vregs_on, pwrseq) that are exclusively used
from struct qca_serdev, via its embedded bt_power member. The extra
indirection level does not provide any isolation or reuse benefit,
and just adds qcadev->bt_power.<field> noise throughout the driver.

Drop struct qca_power and move its fields directly into
struct qca_serdev, updating qca_init_regulators() to take a
struct qca_serdev pointer instead. No functional change intended.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 93 +++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 54 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b9d77628d0cede0c75da134d522476460c7c599b..d51db761f5a6d0112e6e4e3e59ffcf6ad15198a1 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -212,21 +212,16 @@ struct qca_device_data {
 /*
  * Platform data for the QCA Bluetooth power driver.
  */
-struct qca_power {
-	struct device *dev;
-	struct regulator_bulk_data *vreg_bulk;
-	int num_vregs;
-	bool vregs_on;
-	struct pwrseq_desc *pwrseq;
-};
-
 struct qca_serdev {
 	struct hci_uart	 serdev_hu;
 	struct gpio_desc *bt_en;
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power bt_power;
+	struct regulator_bulk_data *vreg_bulk;
+	int num_vregs;
+	bool vregs_on;
+	struct pwrseq_desc *pwrseq;
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
@@ -1810,7 +1805,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power.vregs_on) {
+	if (!qcadev->vregs_on) {
 		qca_port_close(hu);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -1888,7 +1883,7 @@ static int qca_power_on(struct hci_dev *hdev)
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (qcadev->bt_power.pwrseq) {
+	if (qcadev->pwrseq) {
 		ret = qca_regulator_init(hu);
 		goto done;
 	}
@@ -2268,7 +2263,6 @@ static void qca_power_off(struct hci_uart *hu)
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	bool sw_ctrl_state;
-	struct qca_power *power;
 
 	/* From this point we go into power off state. But serial port may
 	 * still be open, stop queueing the IBS data and flush all the buffered
@@ -2286,7 +2280,6 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2306,8 +2299,8 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power->pwrseq) {
-		pwrseq_disable(power->pwrseq);
+	if (qcadev->pwrseq) {
+		pwrseq_disable(qcadev->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
         }
@@ -2364,23 +2357,22 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
-	if (power->pwrseq)
-		return pwrseq_enable(power->pwrseq);
+	if (qcadev->pwrseq)
+		return pwrseq_enable(qcadev->pwrseq);
 
 	/* Already enabled */
-	if (power->vregs_on)
+	if (qcadev->vregs_on)
 		return 0;
 
-	BT_DBG("enabling %d regulators)", power->num_vregs);
+	BT_DBG("enabling %d regulators)", qcadev->num_vregs);
 
-	ret = regulator_bulk_enable(power->num_vregs, power->vreg_bulk);
+	ret = regulator_bulk_enable(qcadev->num_vregs, qcadev->vreg_bulk);
 	if (ret)
 		return ret;
 
-	power->vregs_on = true;
+	qcadev->vregs_on = true;
 
 	ret = clk_prepare_enable(qcadev->susclk);
 	if (ret)
@@ -2391,38 +2383,35 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 
 static void qca_regulator_disable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power;
-
 	if (!qcadev)
 		return;
 
-	power = &qcadev->bt_power;
-
 	/* Already disabled? */
-	if (!power->vregs_on)
+	if (!qcadev->vregs_on)
 		return;
 
-	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
-	power->vregs_on = false;
+	regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
+	qcadev->vregs_on = false;
 
 	clk_disable_unprepare(qcadev->susclk);
 }
 
-static int qca_init_regulators(struct qca_power *qca,
-				const struct qca_vreg *vregs, size_t num_vregs)
+static int qca_init_regulators(struct qca_serdev *qcadev,
+			       const struct qca_vreg *vregs, size_t num_vregs)
 {
+	struct device *dev = &qcadev->serdev_hu.serdev->dev;
 	struct regulator_bulk_data *bulk;
 	int ret;
 	int i;
 
-	bulk = devm_kcalloc(qca->dev, num_vregs, sizeof(*bulk), GFP_KERNEL);
+	bulk = devm_kzalloc_objs(dev, *bulk, num_vregs);
 	if (!bulk)
 		return -ENOMEM;
 
 	for (i = 0; i < num_vregs; i++)
 		bulk[i].supply = vregs[i].name;
 
-	ret = devm_regulator_bulk_get(qca->dev, num_vregs, bulk);
+	ret = devm_regulator_bulk_get(dev, num_vregs, bulk);
 	if (ret < 0)
 		return ret;
 
@@ -2432,8 +2421,8 @@ static int qca_init_regulators(struct qca_power *qca,
 			return ret;
 	}
 
-	qca->vreg_bulk = bulk;
-	qca->num_vregs = num_vregs;
+	qcadev->vreg_bulk = bulk;
+	qcadev->num_vregs = num_vregs;
 
 	return 0;
 }
@@ -2476,7 +2465,7 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	if (IS_ERR(pwrseq))
 		return PTR_ERR(pwrseq);
 
-	qcadev->bt_power.pwrseq = pwrseq;
+	qcadev->pwrseq = pwrseq;
 
 	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
 }
@@ -2519,7 +2508,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	 * A module behind a connector is powered entirely by the
 	 * connector's power sequencer.
 	 */
-	if (qcadev->bt_power.pwrseq)
+	if (qcadev->pwrseq)
 		goto power_ctrl_done;
 
 	switch (qcadev->btsoc_type) {
@@ -2539,8 +2528,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
-								  "bluetooth");
+			qcadev->pwrseq = devm_pwrseq_get(&serdev->dev, "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2548,21 +2536,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * through the power sequence. In such cases, fall through
 			 * to follow the legacy flow.
 			 */
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				qcadev->bt_power.pwrseq = NULL;
+			if (IS_ERR(qcadev->pwrseq))
+				qcadev->pwrseq = NULL;
 			else
 				break;
 		}
 
-		qcadev->bt_power.dev = &serdev->dev;
-		err = qca_init_regulators(&qcadev->bt_power, data->vregs,
+		err = qca_init_regulators(qcadev, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power.vregs_on = false;
+		qcadev->vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2598,10 +2585,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	case QCA_QCA6390:
 		if (dev_of_node(&serdev->dev)) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
-								  "bluetooth");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+			qcadev->pwrseq = devm_pwrseq_get(&serdev->dev, "bluetooth");
+			if (IS_ERR(qcadev->pwrseq))
+				return PTR_ERR(qcadev->pwrseq);
 			break;
 		}
 		fallthrough;
@@ -2626,20 +2612,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	}
 
 power_ctrl_done:
-	if (qcadev->bt_power.pwrseq) {
-		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
+	if (qcadev->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 * The descriptor itself is still released by devres,
 			 * so dropping the handle here is not a leak.
 			 */
-			err = pwrseq_enable(qcadev->bt_power.pwrseq);
+			err = pwrseq_enable(qcadev->pwrseq);
 			if (err)
 				return dev_err_probe(&serdev->dev, err,
 						     "failed to power on BT device\n");
 
-			qcadev->bt_power.pwrseq = NULL;
+			qcadev->pwrseq = NULL;
 		}
 	}
 
@@ -2677,7 +2663,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:
@@ -2688,7 +2673,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (power->vregs_on)
+		if (qcadev->vregs_on)
 			qca_power_off(&qcadev->serdev_hu);
 		break;
 	default:

-- 
2.34.1

