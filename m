Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0E3FF1A9
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677475; cv=none; b=SvbRYDY6TtYf591NqirXx+W+/n0BiMqs5ZUFf2qlUKSTwhYDKIl9KOk62nP6ZnEDi4JZW930ABYg/ZjCZqGx009r5z5hr4vqYawNTqEwHTxCv5JZbQaRS9yNuF9uY/nEXuOqVkbpp9iu4MS95uAlz8vSvyyKha/TxTqs4IVbqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677475; c=relaxed/simple;
	bh=jak2vbWmlDxX6sjIkSns6YH/+A3MhzHcWj1aIP5tIEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rklT6iwM/Eevu0Q+9Ni9zPbtaEHB/liD254NGaWU+vLagkBErNnZY18+rSf8lrphyjPjIL9hp+RfCGG75KLI3Xqrg9CsRD/ICfntVkTryYDB+cNNjnnJUM9JpVIuZkILpVGG+u7oLfE5F26EBlZTZ45N+yKuP8ENH5EDaPuYI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/D2jK7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0JIck98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/D2jK7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0JIck98"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dILO172051
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPH+i5HvLekvhup2XBK3JToyvmBF7nw7B0CLErOBc1A=; b=D/D2jK7sp374QMHJ
	H2e42JSrk1/dO8Kfs+sqpSiyuE3CiQBaj9HLTeuj2LttAFge70bxeCQOpYlR/NTQ
	Lt8s96POUO/SQbTPmlTWJ8fq4yh3QkXhOYhhlLDpUKk0va4O7+1qhyPsnDQ/DMIN
	R77zdpCZvcD0ZVi9KdVVzPOK4431qfpGJ2vQK5WK9ShSdb4VJ4TIU6epjhvee8DX
	XA/tKuU/WJutt6ZopHZ7czglmITuroV1RXPu09Fkh73AkVguKRDh/QT6QJkgv5yu
	O4nY14i6IgpiIh7V7+fRG698CAEFfA/gqoTNJtpbBGx8t9MPPX2VIuIz5lNxedLt
	xBNeLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9xac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c33f48ee4so7624701cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677465; x=1784282265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPH+i5HvLekvhup2XBK3JToyvmBF7nw7B0CLErOBc1A=;
        b=d0JIck982Xf+61T8uTc5kOHM7MzsAJKes5RtNLuM+u7TD2lwQxpN6JQ4hWjLP/ZN18
         /f4i8iMGO1hK0y2M+eX9TSE87H3OTT/rXwYGpHJdR3sFTOoGrxKv3kZMRT7TLzm9Co0x
         QxUa8haEt8gINU6ZGNhK9PwvI2jUO6e/nBLo9rY+tstb7/bf4ntRmJC4hVb9po+JaLvK
         rhXp5YI89FOByMyRO3lEtdBXYUb0sGlHxD8vIheg9j3+gcAHCapo6EZpyaLpxXKZDOM5
         L+ZWLBXq5h26qBzGKHR7lmkynMpkilwXxFMQkA6cUF8jqAonVTuwI7hjIIpWMOgxVI9Y
         dshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677465; x=1784282265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPH+i5HvLekvhup2XBK3JToyvmBF7nw7B0CLErOBc1A=;
        b=YsxL4bjGBZtNHfT59EFOnDkP0TPrvFXaZ81MVKvJj6PFGSsrujOV/7N/8SbRLC4KF0
         /O89pfpfkfQu3TL6yUgHwoEU/rahh8elm1XilC4yPxKvTM+PSoxaLXtSY+s0xU0udBHX
         hnJDxgKcZ5nEsV3dS7r+hGKR8ZsjU1ikEiPvUgXrvqcHbQ5KrbBeiFMLty9VwSqTXeBF
         E3Tl2Z5Owp5Q2pLETVe4eX6PXCCDGN2zn5raYWqPa+UVpCNrXvMW833YEjYQpKhloynb
         BynyQe+Y3Ulv6/fq81QU/sDoqjE0tlxo89SMPI2WPnurDZA14xTXfAi6tCEOrg75Xiis
         k20A==
X-Forwarded-Encrypted: i=1; AHgh+Rpr5IB5Dzy/Ge2bLhNHWbRmeue3EzaTpYIk3rHWAvwqkCXKE6vPoFlpBeoJPmeDPQlOWTVbyj7IE4g+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8y7nW0iNCJbsBAUrfrrSAuZtViJgPSPwF50SvVDjzhv8WPZeg
	NSvo1d17+xt23UFrvVbsOQvaHUyHIjU23LzGEZzPYBGqJAL+h3cLaF5ZWukgnXVez0vDDqb71vP
	LnkCnM29iJXUaQgh10+isyR2BAzHmU1kvjh4o/Gazehn1aNvpfLRMe0qxo/Olhneaq+MPpwYCmB
	Y=
X-Gm-Gg: AfdE7ckjB5izUyVciSEMNHJPAoAphaoJT02yzCFG1XC7radJ0WVSeB2rvhF8mtemMqN
	6uSw97drrOTiQu700BwMLXhAynh3jUt+6st//a6OTefUg+VYmjLkD3Hqoer39X9o9AcDhQSORnj
	SkxJ+9b96Yc7CQQ6XixlaCH/QWEh7SKxX5BYq6IQqjeTNwl4FfPhvIfo5qOFbhGxN4GUA+PkFEO
	apqXoZh3F4xuGNghnXtXbIXF3KGH9KjfXAPIPC0X9yRUO43L+Y4ou/NPrdnFV2imYYLYHP8Odyx
	aO+Ed/e0yO324q23NRbmZk0HkdV6lyFY/sACOYp/nq5Cc5dDK3PFkD7bBOSlFk4srOnl79WaXNP
	8MDj5CVsuyuvhC1xR45ETsDtmXPwDIs8EwtmJtNOK7+2Nfk87ubBYxC4OHuzIiORI/TmK1LsOo7
	+ppGNF/GTu3I2oTXfpA5ig2FmTsvmGwCg9L6MNDkjewRuXCBMvHz9OQeC9sE/GlbTSU03FBKAaf
	aMqyXU9Up9rgQBvELEm
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr113377771cf.74.1783677464631;
        Fri, 10 Jul 2026 02:57:44 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr113377591cf.74.1783677464091;
        Fri, 10 Jul 2026 02:57:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:33 +0200
Subject: [PATCH v3 07/11] Bluetooth: hci_qca: Embed bt_power in struct
 qca_serdev
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-7-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c219 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z5-lucBUan0SmjtTDS4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX9k7mMEYf2/KX
 so3VjKZIvX47J5p1yHiIcBlTlaaYmh9OPEH7fHe+ZFiGobjDMtQ/wViWheGs8xSNK9Rnu7dAJKA
 TszJl3QD+7b4ciVrSZy3G3HBGCOqDSZP9nQiv0CcSSfR/9GRrutP1gLjQej1NgdpTuSLWLso15f
 sgzDvmdj59ie3jony9cxaAKkT4U7TsGtQtXJ5QHChY7sRaNCjrs5gSuwLayFTziGESUgF1ff/OX
 RZjLbD3Na7GyvT5Z1W9MX7hA+35RIJ42POLyffJeQ6PSNjcDDwIfqjcdygX00f5fE0fKYKZYmdB
 y5zGAbMnQO+9BJJWIKjVJ8OYDL/Kj0vsMe/vvC4LUIa3OQbfvMufS8faAbm7KJtUww2FJllM7Qg
 6FhFFmqNOKe9por59XU18Bj0ZZftGfHyrXuXue5I3XEtHmSBOGfbQVj4y0g9Aw57nunFsCd90bU
 pWdgO2psheCVl2pH9zw==
X-Proofpoint-ORIG-GUID: hOoUBhz0u40P41O3q4K5665qdcRV9qP2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXy24j/3YDDxlD
 lZPAeX9LsQwKL1vxcmAsLwTH2PqRT+8vpmINH6/+vWBEAhF6kDrdljn7VuqkxpMzutq5+ufCm2p
 ZPlB/Y4yVOKAdIwHtQlzwdbtdK5vWow=
X-Proofpoint-GUID: hOoUBhz0u40P41O3q4K5665qdcRV9qP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

'bt_power' is allocated dynamically only for a subset of SOC types, using a
switch on the SOC type that mirrors the one that follows it. This is about
to become pointless as the power sequencer path (used by M.2 modules) is
independent of the SOC type and needs 'bt_power' populated for any type.

Embed 'struct qca_power' directly in 'struct qca_serdev' instead of
allocating it separately. This drops the extra allocation and its dedicated
SOC-type switch, and removes the need for NULL checks on the pointer.

No functional change intended.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 72 ++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 46 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4a1ef316e715f4f1f0c8f7deafa971887af040f3..24dc5bf6d192be7e1d500df6bdf36e6184f9eaf7 100644
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
@@ -1776,7 +1776,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power->vregs_on) {
+	if (!qcadev->bt_power.vregs_on) {
 		serdev_device_close(hu->serdev);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -2242,7 +2242,7 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2256,7 +2256,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2313,7 +2313,7 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
 	if (power->pwrseq)
@@ -2345,7 +2345,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	if (!qcadev)
 		return;
 
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	/* Already disabled? */
 	if (!power->vregs_on)
@@ -2417,26 +2417,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
-
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2451,10 +2431,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		 * the M.2 Key E connector.
 		 */
 		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								   "uart");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								  "uart");
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				return PTR_ERR(qcadev->bt_power.pwrseq);
 			break;
 		}
 
@@ -2465,8 +2445,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2474,21 +2454,21 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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
@@ -2522,10 +2502,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
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
@@ -2549,14 +2529,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 	
-	if (qcadev->bt_power->pwrseq) {
-		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power->pwrseq);
+	if (qcadev->bt_power.pwrseq) {
+		bt_en_available = pwrseq_power_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 */
-			pwrseq_power_on(qcadev->bt_power->pwrseq);
-			qcadev->bt_power->pwrseq = NULL;
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
+			qcadev->bt_power.pwrseq = NULL;
 		}
 	}
 
@@ -2594,7 +2574,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:

-- 
2.34.1

