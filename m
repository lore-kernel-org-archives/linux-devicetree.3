Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1FD3D5241
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226374; cv=none; b=Afxwm/+5ypC+KZosV6+qtZcvqFfMc32T/IA6+4chHp6v9YEJOjDq2wZp7idhZ1S1IJniYBhxuMFRws6I+rYJGcqwIhCA+cf6+0i86IJhYvYeHr3YF2U2gqYpa16TaVzgCWmHwmfcyz4rsR6Fo2DSTBsLScYcC9e34IvfELVkTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226374; c=relaxed/simple;
	bh=qz1R0fc4ZtSZbGixQFSfsZn1O76p2On6dZ7J6oiFRY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnIpoyU89yfhhr9PaetS2LWDEWD//SYDBw8QFsJd8TjF5VsvPrXg4HVh3hKjPdJ8UZ4e5RTF/uEWKTrArplYKIgEQLj2G0ALp6pHB1OWnsx9D+/VRXpC4a8Fx2p9ywSH4WJhsfxsmSSs1VprBuanJ4l42imeoJt8pz4K5qjvKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0q4Y1R3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XU3cEllK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0q4Y1R3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XU3cEllK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYkuf113506
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zCrxoN3Ecrt
	yDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=; b=l0q4Y1R3SlUmadE6Rar184Lg7iM
	xNrKLYtAbLZ2A0VD/jsRZj1e0r8OZTbJTiyAmqv1VigaPZrf+x5jj50r6dVMShH1
	sfBDEncV1S8ybsvKZgZAP0PdAwvVGLwHkRr3nZ3YbB/+q3w9wcLHKd4LuKwbfaNz
	HqXYDhlZ+kNlLC4xIW/NVf2TAH7/ZzrueOH6EbyLVlvHgyQEjzTEzaFyHhxIe3al
	JMfWvJVIsORxN2GAEAeAgn8GwuEA5fNyYWgpg4eVXoxeOtaq61od6QSlPI19eqx7
	PXxTR1nl6LVyEjDUGwQ5rNV0VliIExUosErpP887k4Pas+Sptxil9OxAFJg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvt3aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9670f220557so4103830241.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226371; x=1782831171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCrxoN3EcrtyDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=;
        b=XU3cEllKSBsU9bZ69z0cftaCGYgrTMV0qJanOEdkYBMIcQvVTTVnYjUBAMKIp2Uhd3
         Tqv/QEzBYYQ05FgkR+oBSXipTNTeyW9exfNaHBUncAgUTkCmFv5l6gZmPu/gCG3y0i58
         VspxhVVwCnPB/cZtOUPAE8LEXPnedWp6vW4glFmL6FKeoWp+PBZ9U86SB3Ulhhqp83Wl
         i0UwGsq3iNa5jraLUeyGQzhqSMfSpfUA8iLCvn4qXJD9AaNS0yuvkJ7Yyr4LOaVRRFNC
         MVNdhUqRVHSWiaiin6WBgPzQq8t6WGF2/9ZdX7SDTfnLBYvMSBftdSWJh5/NdBq6OZWt
         OSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226371; x=1782831171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCrxoN3EcrtyDTN0qwQ7dQRoeDYaqf80JwfgO7XBFYc=;
        b=ajlvXsA3M8P2E5R4xkp9qY3V8fk0KqIRy5XLZVvgHuV21HraCB71gkYJjZoe1AuhSF
         vYpJJqkOb7JO5NijMQJi6DdgDCEdY8tGZjt6vfGaN/e4RVna02Q5mmjTOXrcOqxJzUjG
         C89ZeEiOYyQDJnQWTWuo62udmkYDQlmNDuLDZHNvv/9L8f5aEWf2oD1MhGbPz3NzWEoK
         j0T3d0OmWeWL+d0xfDW7sNEJfYpPOIZGI/iZdH5DlLbQM7xOlMqM50mfJTVanc1dUUJA
         Nb2bZ6VIZidYsQ7uYR2sb5nfJmOZEbtId3bDNYe0HhRCEsGZhlLNMIXdHGuIHmjuavuG
         odVg==
X-Forwarded-Encrypted: i=1; AFNElJ/mYNV+JuY7y0Z84nv0xF8GqafZD6Ngqk6nORU/M8H1FyPHwCDldRIbjlhNRjYXRMwauFLDFYfAj1JU@vger.kernel.org
X-Gm-Message-State: AOJu0YytafM6VxnAs7liJV3n1E8dCr0SNptQdZLhcJbOxGz8jW9KAUXw
	wckYrhJFpIchmrNSp5zUIsprISshzflF76sEAkYkop1KfOotBFqOlgW5OqiA5TT8gsSK0lknVr+
	KXwE1xnTJCVT/OSdVvw/BB0KAup7L091WA4EUAxqDS24QVQX6kB6Jrhu58lgLcE5n
X-Gm-Gg: AfdE7ckFPClFNUWl4KRKpQ4M0GWiqY4mtxSCCifY8nUI64KfHKcqFnjF/zHeUXVvuBK
	eTqjunwai/L5NdZRFZKJIEqUrpX8rg+ms9vv1moOhTBUQTa/gIAyFUqj6GPGqo9wYEEK3ypqhBI
	zGpH9BlvB4hwiQNp934ncjjhfNnyw9K8EixzrMxL5rTqkMZaGtkx+bJIqb3WiPyFpbsUD9r57QJ
	SOR0Euz+1Q1hbWwDH0BCxDMIhATTSxjgzyEN/4Z6urdiQD0ySemqtdoCoAciNQ5Xhy1cDfS8V5R
	EphJXU1FcWxZO0MI3DwTcaH7JgZ4B/oXQIXSqDFf25TSLCIQC0w2uu0lIOT25eQFioP9cK/xaDn
	BaRXIVzWVvc9Heg4OLTVJTxzVERRrSWvXN3uLoVddEwWUzvvKfRj+9+w82J1XM7XswjJ2iGu9K2
	87mSjOGVjJ5iFmo+M94CdH4cSMGg==
X-Received: by 2002:a05:6102:3ec4:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-72ff3f837f9mr1545408137.8.1782226370023;
        Tue, 23 Jun 2026 07:52:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec4:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-72ff3f837f9mr1545276137.8.1782226366816;
        Tue, 23 Jun 2026 07:52:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 10/12] i2c: acpi: Also register ACPI i2c_clients for adapters with a secondary ACPI fwnode
Date: Tue, 23 Jun 2026 16:52:23 +0200
Message-ID: <20260623145225.143218-11-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a9dc4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=6UeluGelAAAA:8
 a=EkjFkVpK6-r5im3n5xMA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=4zb3YkFaRy81KIeUJMwT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX4f8qgpsLfyhL
 ik6vBcrL49rs64D5UBrLD1WUj782/gIvHCG3ezjSdcMRMT7Z/jTcZPJZqOKNc1r3yRNCAu8LMJE
 5A6EFd1zWA9saYEUcKrIwkBQn6EmcXw=
X-Proofpoint-ORIG-GUID: VCzvSeIJPkwSAC2-Eb-DxXZ9kFWF-PSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXymZsDx2sY3q0
 kjGIuysVyf+CId50TdKE4ViZwihR3HqyAZyucB5ag7Am+0Oh5YfybM4yb0JVN/AbWveoDBVjE/1
 /9ObFXem6h6hDnpBh9ftDpyJFaZXhgKLm+OInOsuiYd2UDG0UZkOLW91bgdtkZaFRNeudM299bX
 DO9ly30jAoIaNu++vXUIkmzEsnq3vd7OCPG2wX6VyPH1kw1pCGB0UVBNLRGdZyxgWedhQU93a4c
 S0jfEqyHb7HV3pCOAY9cCNt4w+9eZwonvdUH5ycA6mCReAhcg0bb1A7AvuPMftO78IfZ0nSJm/T
 sm2pyqB2smorokGtY4otgRi5/TfpwaZdkV7nkFmhRx1M0ryzawP2tJR/B4hPU67m1s0heA7aV7J
 sUXzmnIJbbnaMXNVlu5foY4Zx0vq84lKSqmC0Ux+YP1IIRwdIeErsuTO6w7/tXj4cFodJffeZzc
 aNSE8ttHW9p8VkNS0Ew==
X-Proofpoint-GUID: VCzvSeIJPkwSAC2-Eb-DxXZ9kFWF-PSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122

In DT-ACPI hybrid mode the primary fwnode of an i2c_adapter will be a DT/of
node and the secondary fwnode may point to an ACPI fwnode.

i2c_acpi_register_devices() exits early if has_acpi_companion() returns
false and has_acpi_companion() only checks the primary fwnode. Switch to
is_acpi_device_node_any() to also check the secondary.

The rest of the code to register ACPI i2c_clients uses
device_match_acpi_handle() which already handles this correctly.

Also adjust i2c_acpi_find_bus_speed() to use to_acpi_device_node_any()
to als make it work in DT-ACPI hybrid mode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-acpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 28c0e4884a7f..995bd88ad09f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -322,7 +322,7 @@ void i2c_acpi_register_devices(struct i2c_adapter *adap)
 	struct acpi_device *adev;
 	acpi_status status;
 
-	if (!has_acpi_companion(&adap->dev))
+	if (!is_acpi_device_node_any(adap->dev.fwnode))
 		return;
 
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
@@ -413,13 +413,15 @@ u32 i2c_acpi_find_bus_speed(struct device *dev)
 {
 	struct i2c_acpi_lookup lookup;
 	struct i2c_board_info dummy;
+	struct acpi_device *adev;
 	acpi_status status;
 
-	if (!has_acpi_companion(dev))
+	adev = to_acpi_device_node_any(dev->fwnode);
+	if (!adev)
 		return 0;
 
 	memset(&lookup, 0, sizeof(lookup));
-	lookup.search_handle = ACPI_HANDLE(dev);
+	lookup.search_handle = adev->handle;
 	lookup.min_speed = UINT_MAX;
 	lookup.info = &dummy;
 	lookup.index = -1;
-- 
2.54.0

