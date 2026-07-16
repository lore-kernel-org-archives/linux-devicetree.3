Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98CF37C907
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218716; cv=none; b=XWtjbd14hGXeCbwTRsL3fU5yFametU41S6bBQdmKB3h3NkS8VNbv81Uc7l8HIzoxKXjKnYPqmg9pRWBnqwkEUWd3UaZyzVpn7/ZWtZfYMT7gM9fVEKaIP0CQ8U2uo4hX/NoXRh9jnBfanmU0TBqU/e8m2JI2w+KQw0J2k23OT+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218716; c=relaxed/simple;
	bh=KEpaGYLJg/HFUQ4VCnAAAa4/K+FU5Ww1paHM4mUD9UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4poBQiZK7j+l4O69VUf3O0rayizpY2xLAvkTkl8oZV7UBQA/ULNouEzPH0+yQKBH99qkXEzl6cQWRx/zthHf0TxDbxK1zZwLJdZrsQwbhCqHTzBXqvAhOJ5II/fTbkGFmI/gxY+sr52Nfma+kt4xG+NaP94o1md+9pQeZjWMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOXqOVLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAzxOuzu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOXqOVLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAzxOuzu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJpun2972580
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=; b=jOXqOVLZC6BBHj+3
	XLMie+g+71G9u/wYEPDYrJ3KKe4zYFaauBBV8N/SmJsnKitT5CT2VUecq1mcCWHd
	um/6RrZ6wvAw4iTGGChmed0ie0RpdXigKmiabE+7Lkp3RnzRArloONiBnbL/JLcl
	GBHQ+mtFO5m81hFdr8wH1JH88pDI+0FWeVHV/3A5AUvynHR6ULBhxjLxBwMhz5/H
	gScdlUkHFPFMBUToCkgWmH9i/dt8bwP311Qm4zuS2mGfMRxTPhOHAbYVJW5CSQXM
	VxCwHmYkPLvmDoPrVJ1v8iRkIE59KJJzcQ3eFWtBhNI3osy2GrpBfn0t8vrH/kyO
	zjl0gg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10aa35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so90583706d6.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218706; x=1784823506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=gAzxOuzuXgVrE2WxsjQyQGxnU6sKbjC6yCuSrsXogOxf68BZwF+psvgBI4jMpa3tkk
         bvuIGIeGvOG2puIc7eJMjuSENfWZPmwaXwrufCDPEw7DWARmGw5nul7IFeVqUZ95VzaI
         dly4Uv3PiLOqlnMYaSBy02WwNRd5ab3CpCQiyCC9XCCn9AfvDe9CuBfkVhMv4TMVGOlq
         pk3n5EPID2ipOoAya3E0249bJhFVEG1ky0mAwDDKQgv5LI8hfCmi5750UdMlYmKG0qAP
         EAdGvRMGsIxzNCrEXJ8vXYOSLoopVScZPoSAOrRyGZADrtiK9uLMz2/U5f76OVrurn6C
         GkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218706; x=1784823506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=N9/tLeh6vOGXVN4MdIyIDA1B368aGvPsTFC3oiOp1wPMz+VBgPwgjFYNEACBAHWv8M
         4dPaMTP3ft2fmV40BayTKxuiX8gIfzN81bRHEe8K73OipUeGnpHIbcv6g5/PJOxEEhxW
         w/ia9Ykys6JKzkcvD0Nu7uAu98fCpf87CSlbqAS64zRfZIjIdxknMwDmNbfg+3y17qxO
         DENrs0JGZ+95PFRFj50x5hpB5j84cy3RgItJ5hOaRSFqJkjkhnc7TQSAzMgXYiLwHEaY
         UgPjGTqqHKUO1PM0JuGxOPn+zcU+rBMyO56ERzXtkpd2k1Sqk4WVHCIftzIhsLMj4at7
         8L5w==
X-Forwarded-Encrypted: i=1; AHgh+RpkHRcgo/7jn6+pRtuZLJhaZUcZRnejqHZDfk3xfYC66Hs6rY992858ryefz1MJ9y0FqntL3Z3Cx/DX@vger.kernel.org
X-Gm-Message-State: AOJu0YximcjwDSkIIJmLVxuwh0fylYbF2/jaRKeTioe95yxzalGukYDi
	ll8ICxUfGjf3U90Lg83io4H093N/WnSSnE6wOeWkbRa0ZYPT1q7Fo/4b/+tGcStaQudGtzYmSFl
	9AhIw7LbzKjFc7b+crQOy7/cuiM7XZFsf+XoEWTrYJzaHp//j5UQ/ZFkNzPWGQi8h
X-Gm-Gg: AfdE7clakV54wSAmZxoILSfA+LxSoFGXg5uj6OYjICJ2lBiyDGoPV4slPVu7EE/+K0r
	Sm03RBSub2UxTyBhZLh+kUzBRcIjqrkcp9xG78G055A2q1mknH73skfwp5s68ExcXFHw6Yjmo8n
	OqxTOGslnQXxAUW2hG0/mQF1BLNZRx3iodPBM11TbPpamBkZwEVesfRVtoRdwvXuhXnvpGLEHQb
	w+ATZ3SH+I+atbPLMK655/WZeCmM9nrykTkkMo/3izfzzY2ih8nU5dbFu3pRLlTo98ucXxxJRc8
	18ISldZqZPAZ1B65wbH4kzR74a3rOqmXQDn9N1sxj8LhNIqTQleDi0K/WIsJOUm+esNhFAFjBxy
	9zqop5TBqtA7hdNyiUr2Q/HBSP0b/XFBD49EmRkL0KFJ+qZJemg01e9+7OTq1CTDjNoy00eCxS/
	VXqxrAv577Wt13iRhZSPsInqdFptaW/koz2du0o6mJaRTfASuLLPI=
X-Received: by 2002:a05:622a:a888:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51e42453df2mr108398381cf.51.1784218705804;
        Thu, 16 Jul 2026 09:18:25 -0700 (PDT)
X-Received: by 2002:a05:622a:a888:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51e42453df2mr108397371cf.51.1784218704675;
        Thu, 16 Jul 2026 09:18:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:18 +0200
Subject: [PATCH v4 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-1-9b02e6f549d7@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: J9AtXo5Acn1YvygUtk0vtd4zyVFyvyBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfX0Byy04VRDJ3M
 k6Cy5fsKOw4XCEdD1N+LURUxurm2p4LrHpS3BE3tRSBjPTeY+okwmD4Qqq9+wWXz/zlZO1RJuiO
 /s1qaSwka0Ll7vEb67hzVAbq4eqOE311dD+eg9nrKiAo5zXH3OLYTBlwhoxnBt7zCSYCgKg+OcZ
 TdlZxagbsk0tCUYpvHhz3I8fctH/etQW8GQaz8IxopiN7oAC4Ux3YdUmHtCJyPCknyjfWzOgRgG
 qAtHCgmIROzXec1Xu+jwY3k39h5BPk+s9SZ13/JyS7lDi1Si/Z7Qwu+unnfHjPJCn7DYxcjO3oK
 ReABBl5EJJbtmnsoH17AGpHVP5f9jW+AVmKflHC1mzRFNes/Wqw9+018dATW0R17FD3ZaFVsuZv
 dojAdt6ZpM7qLv3sU9xkTXMrqbp2Mk/0pny0jzhByaqQuNr05L+qCXhFiYHZ/MfjpIRaHu5kwaR
 /KL4XQ2xaXSZd543sxw==
X-Proofpoint-GUID: J9AtXo5Acn1YvygUtk0vtd4zyVFyvyBo
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a590455 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfX/RPq68xMZYPU
 BgB28UjCXTMYHh7Gy809GpBhqH0oawazrXzSzJsvWM1kmMauoI/d6DLL/atLTUgyzBJ5d0vImNM
 tdD4+KFVGknAaOoSijmeW8RGAGMg1I8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160167

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2444471956197bae62a1c4c3a776c5591780ec02..135c79e696aefe2b37ee7a7a668715360a1e2d75 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -26,6 +26,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2445,6 +2446,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

