Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429545;
	b=ABIy+0RGzoyuwZbkZqvfu/Zjk3M+ofpS5jYK6Vb051zuSWLEHLXQ8tGKHS82D8DBaYyS
	 oFn0bpkrDevivt7mw7a675s6l5bImHY77y2S6zuL11thOcjzM4Mm0U2jf9ozhM5agCaTI
	 1XnC+2WTT+33c7WePHVv8fHGl8bFsBB6ENgqpydMxiRvD0GE7BEvXTpxSwOnNCB7pC3wW
	 /8xo0epoWlfpT1FELYFjwaPi66dUEwwexVLMlwIHQ+qHpQvSCcEtHYx2gPc7bPMLvOVi+
	 jFRl20jz/LnGtHLsjW1KDOpEe7KTmiMAEEAzO/40Ly1xrpZVnuawiMSMoe9EKN1Mbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EJp9xe7nlEatQPMG913EEg5BepDvGN58Jsz58McDDoY=;
	b=uXQmslPCemlgelD94a+hQiVzDdb+yDk1xB7dKhsGs5dIPt9bqQGAFN463V1/ROa+CA1H
	 anpD2H5atw1/SwBsDPWW1ZVPeAUvogx8gxs/I8fHJOd0tPF4W855GPsU8PQCZynJ5+uIp
	 7FSAM5FjnAARBt2QiirH8ObpCbVNjNzncpzr28YlkX2G1NzwA56eWStAyRdahS+2Drl/U
	 ZrctEqI8Wh/rAOnZefHMMMEgnNfRTUEQb+cVWxFP/h4Q5715qBIT7UOi06nagw5HdFBsV
	 tM7oSKIXZ7u2FVLNWkxYFXw4ousKfJXPUeiv8F416aYSxenvj5Fh6bizJT0SxsoRsFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Akf2tX/F";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y75OC/Na";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805DE606A69A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 805DE606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Akf2tX/F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y75OC/Na
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G6xm4095700
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJp9xe7nlEatQPMG913EEg5BepDvGN58Jsz58McDDoY=; b=Akf2tX/FkGsMQcQZ
	/evhKuGfMwldfeo9eyyIC8RKvkzyOiYMVXszJnCj/Ic+ehbij6NrQopmidDo6QcO
	NKh8cqM7gSpGzDecGG+L7q34A89x5AqRor8SJx8QschBC/nIkNNOc02gS1m4ocsB
	J/kBbZkAgBoG7u25Tmpr3bPrz5BiBEVtPfZ/gM3144jdNTlfd8XbZUbVpG+U5h2m
	yO5EvcYqZPAsMOVdGPudpwxceF//msbNY0KT566PgC4fu5TnK2L2zJHTlF+J/uB0
	h0sxK7QRkARRvrNu1DZxyJpLCizakHPhfWEMmx29dENfTowLeCTHLzvRGmuD9FOV
	YypJzA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740x1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92134f1eb00so46554676d6.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429543; x=1796034343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJp9xe7nlEatQPMG913EEg5BepDvGN58Jsz58McDDoY=;
        b=Y75OC/NaZGmPe39o1XJeZcLayqKPu8dGE0mjbYO0xHqTIIRu9kL2tBjy9J3/SEKFMS
         8yH/cSe1FstKmrKeDwr6sQ1+B8qKLcvfqda2KWxRmclPP68qc4upjKlkhkfYlQS/3wCM
         MpU0NVMUxzhclEqSyxfS+fJ36dp4o8xmg9cnIGFMGeQ5XzFeFir+pG67XAHNyhY+8PyM
         1IPFJuXBMuWrX0QW5fZRn7KHfCf4nnDmtuGs6jZ61GdmWOzrImGeSH5koF1pDsE3fG04
         jP76dsuSvVYmtyTsOyDsmOyhGr6tWmx+PYTrpFJkRISjYzR+Kyg4MEW8VCi1dg3s4/QU
         Nj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429543; x=1796034343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJp9xe7nlEatQPMG913EEg5BepDvGN58Jsz58McDDoY=;
        b=iP2DjgH5pLyfQHonU8MstzpLFf7IOqV/bkbibEk5bY7J/m/hqNhwck2MityeDH/mM1
         Yr1VhAGvepWqySBgLYLKKDDDlbot9Gs8yBoFBD2n/QWcKMY25O+viycMMYScm/yz2fSZ
         Y1dM238RZob0+vp4qZ9MJA9ypSobbB6kcXaAfDaDyyttPYwTXvK1NQPPp0vTdQ5uxgnM
         yYBL50QYOkYrpJzA0Flh8iBDh0l4d6S6qIF0TYWBTQhLoxheSDyivzJiA/g1vpA+tsrr
         28g150sQ21T7sRv/LRkov6rFQLFm2uuyNAhsYBVsonwWELZL4bVbME362wK9x/RajDi6
         nl0A==
X-Forwarded-Encrypted: i=1; AL+hErH8tp6E+b3M9Kmoz+pIAIQGJPU7n99goKTwGPPTsSDGM/ueojZkGujvZOE3lA97lpUjby0lz0Py9mQp@vger.kernel.org
X-Gm-Message-State: APuU4Z9kIHbRICfiF2dmmIJCcy3Q3UFRxExaAX49SU+in5Z+LAMpTD2f
	YHELy+SIze1TGW+1HpQG3C0aLlUWvIaJEwIVP5IXmc316tnB0EwS29qFbKKq1ZKAUEzSVtEosNn
	8zm29Yco8m9q1/Lz4l3uQxAQIiC2KFmmHmXSFvNLoL3B8CYvSgzJWN75LnaA1xWwS
X-Gm-Gg: AZFdTZcxLCFIn8jgmEaMbpydh3wSXQpo1t3vHjhUdYSneyWiREf2H6pF/t5dDNlhkEI
	ohMm8PLoectXXvT15fv0+yBahrlATzJGow6GgaxsO4Vc6GkAQsGLnnr3i5g2W0zOufZqXI2swr2
	i2u0dJ3HmRpnFg86dRUlfTCSr04yRqccfiAKlp2sN/8nMyZHGErv0A2r3r2xtEPLAY5oV4rteP5
	pvr5AW6CJ2Z0/ZnjY3aZwOj0RC0Ai/kfC4U7j/pbPl29v9IWjNy+NxOVeZrqa6jwS6KiM7gQ19F
	SsRs6aRjMJqb18TqGvqdM+1LMIlgbJ3la8hf9uV28jIYOQ3tQxTvr5HoaOwQEVh8yrtK5+2TS3K
	KQjfmFoBltYZTpS8xpZhltJr6tkvnuvKlSix4DGWibqyK+F8hf418Bh5hkpU7fYz4eJFSDVsvkH
	opi4FqCkgK3R9DSqbK8gSsPjlpkqvESAvDIZFdZ7DllEjPVAEZVmnC5ePQoakoHWORsxjo7Hou5
	YvJUOrEkCB3HJ8ilAlKDukX5mE7
X-Received: by 2002:a05:620a:29c8:b0:949:7270:b95 with SMTP id af79cd13be357-949baa0b256mr1815421685a.32.1795429542823;
        Mon, 23 Nov 2026 02:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:29c8:b0:949:7270:b95 with SMTP id af79cd13be357-949baa0b256mr1815418185a.32.1795429542284;
        Mon, 23 Nov 2026 02:25:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:35 +0100
Subject: [PATCH v8 4/8] Bluetooth: hci_qca: Embed bt_power in struct
 qca_serdev
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
Message-Id: <20261123-monza-wireless-v8-4-a8b38604be6c@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: zlSeNzSvQYl7QD7cMBbqUBPsAw6czMUM
X-Proofpoint-ORIG-GUID: zlSeNzSvQYl7QD7cMBbqUBPsAw6czMUM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXxiFGFDkg/Yr5
 P7gLV6nRhFRVz9/Q2iRhd4p5k9GU5BBaptFK2sy7nVv9vP19I9JcWAtA0sP5p0rXIG9CoLOO21i
 mg89H1KSrLqCa6iCK6JaNRg3kuTpPhc=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0414a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_i6oeMK_y0MRuiu9OnYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX2HIUV/Y9BJ1C
 aEqmWiT+uDMfKW2sJPiY62mJfaZJ2pg/vBGOhMnfvhzYeD7sN1k33sY2HZvCE2ayz5VGAi7nkZ4
 mgCGo0w8sNUaYfgFVXAknFmyhVd3oVQSmypIZ3sDAy/EAnwGKFLQqF/JC9xLGyQC9DAfMY6m3aq
 Hn1f/yUwVJdW54sVlwn8uAEFo9cUufikqmULIKSudY62Uyrp1BX63AGOUMcIWiuoI/uvk/gSMMV
 AYABbU4Tou+6E7Dp1c8zRNMK6cBwOlIDSFADt2Z2+eGpkf0lZAqe2Da206QTXmtxhQZ5LLpNfjs
 cJKfdHQR79lHXw5SYdetwJW3wXp5Y0kzMlhH1Q4rzAQh9jNlP2dD+0eRqZAW4grOVHyN47aGBmm
 ocyx6N2XSAodHydJqmb5hcsWmX9IBsZRoITcEP782qeg73exBEvTToOS8agytFX65ZtX18jeaBT
 22irtfDTXlHK0BWIujg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

'bt_power' is allocated dynamically only for a subset of SOC types, using a
switch on the SOC type that mirrors the one that follows it. This is about
to become pointless as the power sequencer path (used by M.2 modules) is
independent of the SOC type and needs 'bt_power' populated for any type.

Embed 'struct qca_power' directly in 'struct qca_serdev' instead of
allocating it separately. This drops the extra allocation and its dedicated
SOC-type switch, and removes the need for NULL checks on the pointer.

No functional change intended.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 66 ++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1b7b011cd6adf682677a01bd8d501a92ce896ec7..08efce663eea4344db8dfee2a92eda686d7c97e3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -226,7 +226,7 @@ struct qca_serdev {
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power *bt_power;
+	struct qca_power bt_power;
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
@@ -1810,7 +1810,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power->vregs_on) {
+	if (!qcadev->bt_power.vregs_on) {
 		qca_port_close(hu);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -2279,7 +2279,7 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2299,7 +2299,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_disable(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2357,7 +2357,7 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
 	if (power->pwrseq)
@@ -2389,7 +2389,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	if (!qcadev)
 		return;
 
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	/* Already disabled? */
 	if (!power->vregs_on)
@@ -2466,7 +2466,7 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	if (IS_ERR(pwrseq))
 		return PTR_ERR(pwrseq);
 
-	qcadev->bt_power->pwrseq = pwrseq;
+	qcadev->bt_power.pwrseq = pwrseq;
 
 	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
 }
@@ -2501,26 +2501,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
-	case QCA_QCA2066:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc_obj(&serdev->dev,
-						    struct qca_power);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
-
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2546,8 +2526,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2555,21 +2535,21 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * through the power sequence. In such cases, fall through
 			 * to follow the legacy flow.
 			 */
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				qcadev->bt_power->pwrseq = NULL;
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				qcadev->bt_power.pwrseq = NULL;
 			else
 				break;
 		}
 
-		qcadev->bt_power->dev = &serdev->dev;
-		err = qca_init_regulators(qcadev->bt_power, data->vregs,
+		qcadev->bt_power.dev = &serdev->dev;
+		err = qca_init_regulators(&qcadev->bt_power, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power->vregs_on = false;
+		qcadev->bt_power.vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2605,10 +2585,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	case QCA_QCA6390:
 		if (dev_of_node(&serdev->dev)) {
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				return PTR_ERR(qcadev->bt_power.pwrseq);
 			break;
 		}
 		fallthrough;
@@ -2632,20 +2612,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 
-	if (qcadev->bt_power && qcadev->bt_power->pwrseq) {
-		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+	if (qcadev->bt_power.pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 * The descriptor itself is still released by devres,
 			 * so dropping the handle here is not a leak.
 			 */
-			err = pwrseq_enable(qcadev->bt_power->pwrseq);
+			err = pwrseq_enable(qcadev->bt_power.pwrseq);
 			if (err)
 				return dev_err_probe(&serdev->dev, err,
 						     "failed to power on BT device\n");
 
-			qcadev->bt_power->pwrseq = NULL;
+			qcadev->bt_power.pwrseq = NULL;
 		}
 	}
 
@@ -2683,7 +2663,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:

-- 
2.34.1

