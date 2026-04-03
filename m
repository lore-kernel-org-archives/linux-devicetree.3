Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25F3859F8
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210709; cv=none; b=n8Pp94cG6+pAt6R7Jg4yVihC7ay9yzGmiVc6GORlQuMNa6qyzLEgy/qaOZtHNTAaRujmbfqKYZaYz+eLDRPsL12uyhnCAcl+Yke1rzcirlScIIMjNgrKRNk4PLNktd9LSzh/A2bW2T8wPZoZ0KyxtQuHN6zUZEgP/bSQs5oQ30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210709; c=relaxed/simple;
	bh=VypqrigY/IvoRkUzjoWyWyWrNK+puRHMIlpuyfFo7Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=knauA52hBBzRm3vZLyUWen+wYs+tXSkvx76B4nPJV8gcbKqXoLT59M0wkH78kyfm46rNEfb3HH9z5x15qm+u5uy/s6UL8ysQFeTU5MWuPnFaKQB8sIO3K9rMp1oAmcmUTHuQjNmH7BeEpQ0Xrm3CESyDdmxZQvN8GBcN/WNg9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyLynvEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Df3mevHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyLynvEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Df3mevHz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336F86B141943
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XtsyijHJK5i
	Pr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=; b=GyLynvEGNLqKXw5rFRqEvSjNo1C
	hAPVlkVAH9+mZ7uMcB3j5OjfNP4CVkaUtD8OCvKL+WtXxcOVAT+PVKz2ZfKeHcbd
	P8v+Om5fizDb41XJQIGCYG7ymgoDv/WG4k4pQxqMzo+jcg9nY/lO9f4FVB07ZBMh
	4dpLwukzKffSODoItp6iaDp2uuEgbHEiw08himusHZzisDOJwgYnjTWEoa/77cK0
	1Wch4Eea9yqgz4PyfIrYJiqC813o/mi4B00kt2pYDEwuRz29xC13jRSsOU340EbB
	ql5lrtTMEKpXuJNVSdvABLcmPgp6XeOK/pTtIjbybKF1YOeq0YxF447X0Vw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0nvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:05:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a88a2704fso858628b3a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210702; x=1775815502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtsyijHJK5iPr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=;
        b=Df3mevHzTMWJdLXAekR0xRnKi0PQuEULT/d/m6z+O0+H5aUpO7mDnlTXIJ9QVHoWLF
         6b1f5RmGZRQPOLsM3GyckC0Q303/edd2TBGVjmSAhuUehGbuuMoJ6Y2RQPRJXpwPq1z7
         2C7ZuYPcBQvgNGEwZSOXqUp4y8Ju+YiXuQ7WiX+4RFJgTM3Wr3YBy883407Y0jVCmTMU
         A1GU2Sbk5INO7RZOS2okPi/heYTWCg6Zv6ewA6tBk+4u92rl/vaR4cruEP4dfr0OZZym
         eLEzMpByu5PxPOi55YLF9gE48jS5+7nmTiFyw/T4+cyoWjbk+l/kxGD58Hjf8RQfsXGm
         j8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210702; x=1775815502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XtsyijHJK5iPr+Zr0qa1HiLkSDPYDHag4nII/9rEeGE=;
        b=esqZMoa48A7JKLdowFStnsmgmJTZBHzbWPoZVmkKTItHiO5JfoqYMhyqeg3yyzhNcw
         bzSJ5Wsc4gUU5aUqbY+Om4xkW5EQrH8B2uc5Y8s7Jn1sy+Yyw19Grzy1mcAyScEB1+n4
         EEzx+2GxcaHcp+d3wE55TD7q1qoUjh600C/qSMt6frDJlxrR3TU276cyF45a6xg1F2uk
         l+mDiEy9RK+ZEFCxBQrXrT1Q+fosWc3yS59V3Wy1/1jI7yAyNb6SDqPR+RMELXvYmMBv
         Ql1hwssj6AdgkvrKsAQPjtD0rKwgbDdC9xTwdX3oj9riEl0AqOnVchZy279Q6P59a3NR
         SKow==
X-Forwarded-Encrypted: i=1; AJvYcCWxtT+CXFzWjRRAXmUZOz9UO05heLryv/2PvuSbPBGbYBQwmnPqeltge3vhLOXFr0nctvRuF5G/qlpD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+mzRD1l0kBztcwhnjNGgo7A5LTvZVJxZrvHVfGqwQvh+9DHi
	Ngagrh8AWgReqgOrrIMkhguqUJTlhNEf2wmhxvH+hc6M8gYU28j4rAoF+9dmLtwxTCSgbMDGGD2
	BRob22usXKJ7ymRj5R+LEScRiZIbF02Ueo2uksWjljaOLKNvgrN9FnnBCa5Wdo7FB
X-Gm-Gg: AeBDievodXlIgFSCHXF/R8lDSErmWfc8gF3Q/l/u8yI1Psxnh3eS0iyz+Bf2LpEaqjQ
	pOzFaJ4KFwE4Zn5mGtRS+y4CRyhvoJcm2I/hRwrAqqc3MI++wYSSu7th9AhTQvXHbLL5bxgo3Qx
	oUmdG+vX7f5ziTlYm3bdcvsORxzrbfj8BcWLG0v+fmfUcZ3xBrwHqZ810Bn5fL5SAOSx5aWh8Vp
	4i2Z/YpQl/u1mvtYZ0ix+5Dz9Sk2yRCj2p5YnUM1i8g8iZQc2n14ptEgwNUSkF6qXVfxC9FPzwl
	Z3t8BS6vjlotGzhV6RyM4pCkMrUY8sOr+4+qzwb/xrG1lrAg4wPjpglOgn9skIZDGO4cqR79BMU
	v3F6d2WZztsIFIihiTDk5AzqCtAW4D9ZKUdPUFgYa/uH7En3VgJKpEwk=
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr2090053b3a.22.1775210701794;
        Fri, 03 Apr 2026 03:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:278b:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82d0dd03d1emr2090031b3a.22.1775210701278;
        Fri, 03 Apr 2026 03:05:01 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5012644b3a.23.2026.04.03.03.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:05:00 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Charkov <alchark@flipper.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 2/2] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Fri,  3 Apr 2026 15:34:35 +0530
Message-Id: <20260403100435.3477729-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf90ce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=k-QuRK_TgsIVSdvBErMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Tbp2wcLucRcnnM4TiOwRdPtylpmgGMeK
X-Proofpoint-GUID: Tbp2wcLucRcnnM4TiOwRdPtylpmgGMeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OCBTYWx0ZWRfXyW+gk7rHOKaR
 gPGWxpkXwfTDKgRBGtJJOaD106lA+cvG7QMbz91g//wYRDTJmJf0NMBNjN94/3QZrea8tWI7zHJ
 c2r9+Yi+te+jN/Aqw+eIRxOZs4Ce/RES1nGs4+aK/4v+dOVnafVokCSVzQgr3tK6lZTiFw8asm+
 a4clS5CdQpi51irgWl6WBE2uJMXtIMT8pKC7IPXwHnXDX8AkPEaxuXhtcWF84sHEBYLojBc8M+j
 zkQYxzN98fN4t66rXSKbw/+Jw9Ft3famSWS93iSFG0CYmhIb+cftccRWwlhY6OFpTPuSxBSfFIK
 NSg/I9A11cNqgraMFCYKbViXhYCAPdLIOPY9wT3pgVrB0P2NysUpODSi4N4wFQ+heGmrxY4/Yy3
 Sd3dnEjnA16RlkxzUzngjigFxLZfSMX2zmJS4Rh0TCvuXVwBl2FPBtarpbEKPvIRCvOOkzUuNuj
 xCpO56zY6ujgiDluAHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030088

Add support for the GL3590 4 ports USB3.2 hub.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 7cdbdfe07a76..11508ed4df25 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -665,6 +665,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index ac1aa3e122ad..3523f8f8a149 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -101,6 +101,13 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata genesys_gl3590_data = {
+	.reset_us = 50,
+	.num_supplies = 2,
+	.supply_names = { "vdd", "vdd12" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata usb_a_conn_data = {
 	.num_supplies = 1,
 	.supply_names = { "vbus" },
@@ -146,6 +153,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1

