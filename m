Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12B3E5A29
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335332; cv=none; b=n8CzQzHOCm/+4br4G/6Ju6YJiJv/DHogQt1Fgxrq2bheEXQUyBILq7kIuez5SAZ6yc0DEG+1mcD/gVU2BP/WVLaXi8w/I834gpQnhBEAR0B8D84RTtGv4N32SrNj+PBEGyftCUWhGxh2o+218uwo2MwdWQvPGeCFU1m5ASlGjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335332; c=relaxed/simple;
	bh=KubqS9d0YGkacDuDdgigJavlflu99724o5AA5cuLn4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N520nKBuEUpkIA5Zwvh5wg8AvzbyJl9cLC7MrZSvqtsMbp05XTZAGYvUouxTkXMSZcZd3kxltBLYl4ci1oVX8D4B3v9tDWrB8I5rFpynobO0PsKLUXn61LwWi5xKzyeM3Fe1LGCyQAknScUW5brZXHRglZOADajTOcfTikxrua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR7rsXj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isUcarZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR7rsXj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isUcarZP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJwhp63871312
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lXty0c8dvBU
	OMaVjegXOvn9okysmin+BPLP3AA3xoXg=; b=UR7rsXj2+H705/dAX4KecZIPdgd
	Nt3Xr8JRjg8RmxDc0l3pMaCPV/mdMGjAOF0+W/+RpzUGRmdSuafCec8JGH1hvYyU
	6eyvondGiqNmOpT+X9EuPlwtWXgZZL9+jKy+R1MW6SoTeooqBdM8h1p6WWtr+zSM
	+Jnw/GXLTLsHLE8abckErPD0sHwNUbWygaBS1rOO50xG9jO/atn84BiQIxTpu3c4
	BLwt3fUuGMEvJR3MqIHrIF9CZBYeAOBleC1OvP2JoRBiRHZHcNV9ZdTEZwhjWnyR
	7KMzZyH607pDKiPpDjd1I/IjT08LXv6Lrxn+0DO1D8JBgPWBzmCi8YuGZ4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7g7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8db3d8c8c0bso39842136d6.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335327; x=1782940127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=isUcarZP9gN7zFWeGzfQQI0qfGKsX9X1HzjmSjZ5mjtZtGvdT65WmmcMmZN/wyD/5T
         M3EvPWFJcj694HKVIRjjP3nBtP9G+ay60AhI8sQqd+GIUphaFpzNFKZQZ+fNcXLOOXoX
         d8lyj5otw0IDFKrDiOX8+lB1dkjcJGewABCohnSJefzrjnOY0WnA8az+FZDNJ38d5J2z
         rBwiFs+m8QQdjiqBm0AH6mEAJfYjeOrgWoOFLnJkfqxAp6rWGa8GU69XNV1twQneukr2
         HzAEVsOtT5BpqEaU7E7vfHKyidvRqkrvLj2ckK+KsWeEzM6CHYjHMWZkbibW8z+3ih8O
         GgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335327; x=1782940127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=UZqesWaHvjRJ7196OcwSe5Bc3foI6g9YznN81qqTrsnJmMXgJuwAu9+G0In4giFHSv
         YfJWA1JaAoKpNd/Dq60QLZQtGRR88/32VH4k/f7sxGlmZfwNB0ApjgL6w6gbwvZbkEqF
         zdDfkSTsTUsUAXrhH+JtvKkUDBQFqsEsWZWNEzL8PS/5WWIyZ1Jl2JDp9hccdkSUXsPx
         7rt0HAC6j4TIVbyu4txnvLDqKefX3JwQ2H8zeIAahDdxTLArkuqfolkmFscL1mYBrMWW
         Z/7VNhPqO6jcsHqUHFWBdWFo1WnZOhv06cUcqHMQoXUz4VRhzaiEqPGhsCsvtgduMWQz
         YbZA==
X-Forwarded-Encrypted: i=1; AFNElJ+JovveB62iOzS2toikBKs/lgDGGqAnj55n70pG9C/8YDxGa4aVeM6+0GKxWPc/GTQd2gcg1ocKeDw0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFES0BHme9bBqZci9Kzzk1Ur8aMxKxXj0VapshPzBYlryvFEAU
	6zFrrDGqLJTV1LRh225CqEczpoRVQq9tTum3jrqDYlX/6BEMMerKiMv1HU5omvbQ6N0nJhvRec/
	9we3bOKQYJ8md0E6sH8xLyH74YoV7EjGsSKBqZdK9BNe2JswYmG9j6k3wYlVBe2Pw
X-Gm-Gg: AfdE7ck3frYvDqSnzjKfHXKa++hesfjU2RW30hmXPPj1eYE+UlYQruwBSu5zYs5VCrX
	cVbNl3wBXmKCyyK3cyefZb2EoMXN752gK5xiWTk+yb+CV6BIoj7Z0OCvr8LoHJdCrLZVIXOHV6s
	6XqVwDp8eBjuulHCMbyYed99iu+iEcNnIC3Q4NWZqxpw/EHFORUowntnk2SklkEU+XLn/GuupAV
	KIRH6LIozT67jwWUPWukByBjsKnrzwYo78aai92mHzlRD3Upg/Q+OGquDy647cJn/phEt1os9ju
	9tgC41dJgu9hvDO2t5EC+vZGEWfKeewcfDSXAD1LL/lx/4MOW6Ne3K7yEg3nPnUXtPCGFDzMu5S
	uqqxjmzbGc+gzZ74EuNpmym0OfxFBaEl5TqVTj2CY4U+pxQ==
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823243785a.55.1782335327097;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823235585a.55.1782335326522;
        Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
Date: Wed, 24 Jun 2026 23:08:24 +0200
Message-ID: <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX3QHrZH443Kat
 +6CUW7kzrqtrytlBqYmihoIu7Fhl2k1Ry2nCH9DTPT7aR1hFQTVisrAr2PEI3EEwKlDH9pJngpo
 jz+rKQwxR4cwBYQqtgSRl5tFKaD4emI=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3c4760 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ImW1d6Yn9UAQwwTZzW4A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: E6juYsGjg-o_HL-as_gWUu-Y0ed6TlDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX1AodkeoB4ATA
 RscDm9+wMqi258w8n8nF7taLhfNLcus6xyjQujr5PtfeGjetbeyD5TP7PyZebjsWaX+FPSbsSeS
 KAW7ZUs3h+ru11oocLxOy3upLOIH8gzoew33UxaZhOOcumQeIV/DYNs395OdstKpuMy72NjOIzI
 oexDAia4JChQbxAJpKToX2H+74mZ1p+stATH5WIgMKujMSPqDMfSe3atjILtTw0KZ0kfjrCSeK5
 CD31B268UU2a88YwtuFwoH1gi0w6fmA0A4ghy+/5Qc5eiilmZnbOE58rVZe9KZjPHc0dGnLULtG
 SmpHmET2I1OlC5NPqmZz43yaTW2Wtl/F8K4Z/a3yoAPk3emXMOEAfy5bU5jNYWgxi7IcSZStgia
 vicaT6pUf+q+ZZhKAxtE9oNWFjAbZhBq95Lc+Vy4Pc71KF121nQWvbLm7GEuoEaQnFWmKgAKI3n
 P+6mzqr0gZqYV6wu8nw==
X-Proofpoint-GUID: E6juYsGjg-o_HL-as_gWUu-Y0ed6TlDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

The EC generates thermal zone status change notifications for a subset
of the exposed temperature sensors. Wire these EC events to the hwmon
notification framework so userspace can be informed when a thermal alarm
state changes.

Associate each hwmon temperature channel with its corresponding EC
thermal event and emit hwmon_temp_alarm notifications through
hwmon_notify_event() when the EC reports a thermal zone status change.

Also register thermal zones in the hwmon chip capabilities and keep a
reference to the hwmon device to allow event propagation from the IRQ
handler.

This allows userspace monitoring tools to receive thermal alarm
updates without polling the sensors and gives the opportuniy to the
kernel to cool them down.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 66 ++++++++++++++-----
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 142464623f0e..276bb51da33a 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -107,10 +107,13 @@ struct t14s_ec_led_classdev {
 struct t14s_ec_hwmon_sys_thermx {
 	const char *label;
 	int reg;
+	u8 event;
 };
 
 struct t14s_ec_hwmon {
+	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+	size_t num_sys_thermx;
 };
 
 struct t14s_ec {
@@ -493,6 +496,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
+{
+	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
+		if (ec->ec_hwmon.sys_thermx[i].event != event)
+			continue;
+
+		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
+				   hwmon_temp_alarm, i);
+
+		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
+			ec->ec_hwmon.sys_thermx[i].label);
+	}
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -542,13 +559,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		dev_dbg(ec->dev, "LID closed\n");
 		break;
 	case T14S_EC_EVT_THERMAL_TZ40:
-		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ42:
-		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ39:
-		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		t14s_ec_hwmon_notify_event(ec, val);
 		break;
 	case T14S_EC_EVT_KEY_FN_G:
 		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
@@ -658,6 +671,7 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
@@ -676,14 +690,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ T14S_EC_SYS_THERM0, "soc" },
-		{ T14S_EC_SYS_THERM1, "keyboard" },
-		{ T14S_EC_SYS_THERM2, "base" },
-		{ T14S_EC_SYS_THERM3, "pmbm" },
-		{ T14S_EC_SYS_THERM6, "qtm" },
-		{ T14S_EC_SYS_THERM7, "ssd" },
+		{
+			.label = "soc",
+			.reg = T14S_EC_SYS_THERM0,
+			.event = T14S_EC_EVT_THERMAL_TZ39
+		},
+		{
+			.label = "keyboard",
+			.reg = T14S_EC_SYS_THERM1,
+			.event = T14S_EC_EVT_THERMAL_TZ40
+		},
+		{
+			.label = "base",
+			.reg = T14S_EC_SYS_THERM2,
+		},
+		{
+			.label = "pmbm",
+			.reg = T14S_EC_SYS_THERM3,
+			.event = T14S_EC_EVT_THERMAL_TZ42
+		},
+		{
+			.label = "qtm",
+			.reg = T14S_EC_SYS_THERM6
+		},
+		{
+			.label = "ssd",
+			.reg = T14S_EC_SYS_THERM7
+		},
 	};
 
 	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
@@ -692,10 +726,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 	if (!ec->ec_hwmon.sys_thermx)
 		return -ENOMEM;
 
-	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
-						   &t14s_ec_chip_info, NULL);
+	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);
+
+	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+								&t14s_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(dev);
+	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
 }
 
 static int t14s_ec_probe(struct i2c_client *client)
-- 
2.53.0

