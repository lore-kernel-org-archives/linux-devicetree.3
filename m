Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429547;
	b=36ymbFHG2jYHzA9rLkGu61nMlbS7WmoEGxZ9gninEU+7MJ09MFpjf0kJKqhKJAby8T8H
	 q1oZ63vZaHRqQ/wXxl5O5azH44iUSopAp2w0fNjC003cBQT9UeCtGMRXaH1NJCtOCUMs3
	 mKfUR0uJw7IhntkCVJc15B0qo5LUoVxZvUxu32pSL23lFbJnrh9T/KldfB6Fyi2YsjhRG
	 UmTT9AS4peG6fhseeb7lgx/brYhUGy60q22EO3TZWiLfa33KqCGBeFo0z67SQbAksx91c
	 +X52IRWA1EZtza5l32jB6d7elEniI9gBQfEFuvKxGykdByCvgsaryeh7wpESlNuq/ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
	b=LVNnYuULp26ExBWystHqPVRygzGUYX/HKIQf2yYTr++vm3qSKItuaCcei77bNXwCKKZI
	 +rMUk4ThMFOMaH6+ZsdLQfY32nDX0W6ZnWrJJ4XK0G3CTAeI1a0R9UVySjP4AySdyn0dZ
	 qTnDY0u1dviOsweS29x8cqYV+I6SssJjpElqhHNHeTD37zuygLoj6BwtNxSICTL8Voy6s
	 R3DnbRpNHjpFf1TETQ6vC/cmkBgu4tgxj91mcVmdJg6Un7ArcU4VDSxgYvr2Gva9dxLBY
	 3QtfbdPpg1st5wXQ3z7XLw8SjYVpIpc37mLn1tzARfCspUBSvEW2Chw33RbV2ns7ZvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQMJUnok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdCCE2Ia;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33B60A2613
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F33B60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQMJUnok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdCCE2Ia
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuFX1543949
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=; b=YQMJUnokdQqqXjQQ
	QmNUh1wJ1gG3fVspCItRgIloefTGB1mnctBdSGZ4q+6QotxjRyY8ofIcB249WSAI
	8mm1EDiYN5YDDxkImKVwssrXBW4jMklrxIJo/IuHoYR973KZ2RDTlwmL9NPwxE+B
	W8bmxqm7EpCeOLQrlq0rAYz1uudJtT8DBkNXR4gFEtzPznyptMTImFxrfPqFT4qL
	PICxDBfXZRxxG0IGMc35U2XpH9w8G6AM/Viopd+ziIqBzCz32Vty9EuCArHxRCzG
	A9L6cupAw33u8vYlHTrvqGpC8zpvmusOO1F/cC+4oMW5hJv+IhvgnZWvCCXAo5by
	wFzHuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy00xya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-921246186bfso65150086d6.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429544; x=1796034344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
        b=SdCCE2Ia9lMS24lOVRB6IPL1wQGjR+31eptDmf0xKdvpRE4yTk96meZYlOGf9yyS4i
         fKw9VvFHFmG5rELWJkLVb7kcwM6DeztQfRxUAwdspX6IyFwhqGi7gASuZzQEIHtBG+Qt
         0Wk7shylj4U4t6L1Q/5aQvXSSYRfs0U2LZy2MVM3u4TK+TuZX6/8xA14k3NR1Fk1hh7R
         73saZAT9heW3kui9oHUvEzgmxW+fjPROsmPSMzBA84HgPJm4Zly0oYS80ZlKBSZjLZ70
         rQG82JMe6zBvLvxfv+i6oMcSpPMFnmOiw67gPm38VPh1ulT+BaZAEcPuPy/ttKM8lL7l
         gajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429544; x=1796034344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
        b=nLyzW5x2QhaQeOwnLDo8hU31ijpXYXTO+4PeMYPATrlC1P498az1SXW7aSmwXP21RD
         KpshF0Qc+bfmlBcoi2yarLpsxnB0BJYPwS09Xh1Jr8LTUakbvLkN0O8wXsHgocK++WlZ
         Z13nocoD5YE2WNHJoCPfWw1LWhhW+N+xMeSDYebankk7GljNio22wFfn+vYfm+o7Ercj
         il3bd/vb25SYrSWuOyVXy0yF8Tul+hIA+XjAVyS5UKccBMJUyrwe3a4G6vqbGMXwa+Fg
         Wljz3G2FaNy69rIQiS40Rjl6YLrlLdR14yImroHrMxvWqvwVy+hwwk+RFArFc17YPzi5
         kBkw==
X-Forwarded-Encrypted: i=1; AL+hErHc7VPe7bO/JYO19mUdyS1MRyz4FEDdmzntOC6MXm3dc4Lx4N/nLhQntSjj5hynpU88/ONjUpvAj/LA@vger.kernel.org
X-Gm-Message-State: APuU4Z/clifb6+bYJShbJQKuYoBWVcrLve826yeVu0Bniw9D4xHONrBA
	DbZVc3LI6mbmOJmG6RFLFSxexOOH2gaMSzv+Yxuc0lKf81CexBTG+sQqmIKZsHeuC0topYnxzsQ
	4941rVtbBCEEZGs00E36e1vsJ4ZuSdAc2VbFMpbTLf7avcuhV4x116srKpxFhkj7S
X-Gm-Gg: AZFdTZdrgRN4/sBADJXPOSBA/xk9okbs96asihx5aDRV1OtP+N6mzy0kqz9aVcj9CP1
	Mmkv1pXApT+3UqWpn0RPBMUOVmAAjKdLkBtaqDY48ZgaXR/da9Wgm94qUUISUik2QWdThP8I9bj
	uJwrRWlfYUp8LAEA6mG1ObqZhPFjJbqX4VNcnHbJwByZiob0liZ8KWVdMBWg3K4rbzdNetJlowW
	WkYdnug5zZP6eGRLIT/gynSfuXqTuIbHudvODc1JfrpCmQc0Zi/ZH3+olXDIYbubXurZBkym5CV
	8q6TeNgi9u4PGCXk8GL0m8h2QtfiFRI6qiMhW92J4RE+2tw5zzUy5vfukYxb+VKaUnhGNkGk+lF
	JQ54vKPE+faHFIyPJAgqKsrBx1jFl8lKa/MX32JAf2IkETSfDv0jTodxoy2RabRoOanS86A33Li
	6Y5S/MVQ/Vpkc3JSDQ5YQwB2dIpVdERBe6hL4eSTmU2TUrcca3CduYt+EypcLPru4Q/xmckmU4I
	Em75ee3D0f2cMU4q7qaAqrdZh6U
X-Received: by 2002:a05:620a:a403:20b0:949:c967:eb68 with SMTP id af79cd13be357-949c967ee7fmr965737185a.1.1795429544391;
        Mon, 23 Nov 2026 02:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:a403:20b0:949:c967:eb68 with SMTP id af79cd13be357-949c967ee7fmr965734785a.1.1795429543925;
        Mon, 23 Nov 2026 02:25:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:36 +0100
Subject: [PATCH v8 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
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
Message-Id: <20261123-monza-wireless-v8-5-a8b38604be6c@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX3DFVsOnuWy1c
 01c/+xAFS6HY2P1Kos5QU+XR9NmJunDId/SnmbkddAheY/lnvTJc7CA+vlnMA8Qk4R+eCUIdAln
 QD4IcZf9zOJAmP1sjLd2PcRvAzBeLyWv3OhPb+VGi0m+Ad1Ufl7NEb8sPWKEsvNhbsApY43Qqi8
 UGbdeLJlSjN0k+Y74veuc5Y01a4jhl8GWJoXMCdpwqV2Tll2ckTr9Ku2v5fDzrTn74740whHwq6
 G9f9nfS1UVdo7YurBAcODBt/nwU8kKzrG3beSYnghQAyqjuJAI9ZaU+Lxtr2+N4a8Ly5dxxLqTK
 DZ5XBYxRhkqqCeSbWtDtmD98w8cWRrOamDfhCHisqkdnIFmXbfsK9RljPvilHKdO1XnFLgeNnac
 gtBkQCRds1NPgg/9a7Ctm1NtTpk/a4iKS/dHGM+v8GcurkqZ29uusweaue9bZbckzlZSmbuiPba
 4RimQ9mxz+BLeErN9zQ==
X-Proofpoint-ORIG-GUID: NGrc9q1HWi4bzvL8KZ3b8kGPjHkE37le
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0414a9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: NGrc9q1HWi4bzvL8KZ3b8kGPjHkE37le
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX3XRAYpzwA8nd
 kJkee7KK7lWYvBo5T1ptyNkyzrLE5KXMB7aQO/YGymSnmT7LmQd/pFTIkF5EZoHSPkYUCdqgNeu
 YCfVuQ1iKMehp1d3F+cB8o+VpSIx3Jk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

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
 drivers/bluetooth/hci_qca.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 08efce663eea4344db8dfee2a92eda686d7c97e3..f8b572a5c3d2d373993c49bbdb7f7ae7c9fb9b84 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1907,6 +1907,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			ret = pwrseq_enable(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2456,6 +2459,9 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
 	struct pwrseq_desc *pwrseq;
 
+	if (!qca_serdev_is_m2(serdev))
+		return 0;
+
 	/* The pwrseq is looked up on the serdev controller (which holds the
 	 * OF graph to the M.2 connector), but its lifetime must follow this
 	 * serdev consumer device, not the controller. So acquire it with the
@@ -2501,6 +2507,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2511,13 +2521,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (qca_serdev_is_m2(serdev)) {
-			err = qca_serdev_get_m2_pwrseq(qcadev);
-			if (err)
-				return err;
-
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*

-- 
2.34.1

