Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBDB43D4FD
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831218; cv=none; b=OfF1ItkRORrDFWV7gVsOEpCo2Al1ZRcQp36doeG1OILh9A558U+QEFcq0Zn4Ns8tDhkQAObuKeoNs7CyaNellEnx8NiSFTGMspcN0lLiaGvR0WBjhKXEZ0Xs9GCQUCDpzAnomv5uhz+eJCG+tPQOdj8n9Gy8s4QREqjPtkvgbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831218; c=relaxed/simple;
	bh=KSct5FWBTf11Ab+Fi4g9IVWXDzyF9yFCEg3JICKOCMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSpeUN02Odtx+sChUnqWx5kLLzPB5O/NslUDE3F0Qff64hcucbD4Se2RaXBPI801PHh1VOQn5V33UG5YgYjHFltrXNemFFWA0JXKw+hy4CCcDv1Dx6a51EyskI1lyaCTC1LKHgJYWVJqHcJcdJEhA/NlN75ltG66UYHrzwXJU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqpbLbsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPrqIFV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqpbLbsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPrqIFV3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDBQg2199035
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LWbNQLPYU8q
	OuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=; b=dqpbLbsysCeP5iv7sOSjfLPDsux
	GttqwCmBy8N7MZ91MVsce/hzeumrERSXqSkXm4uG7eDy04DKqE8hpJFGA8yXH0wB
	sTL5n1WfNvlXxIxbF2ZYYlbsbT/XtwP4dfuEqjEPYDFHaINVmwEjtr0vhPjqGPcM
	GmPcpjPKV0nLXnyqHt7XBFWJvxMWok6gTvwydhnW19cMi6EIkA8GujSswICRD2mz
	y6iF44JUS77BfbZ71pHzGaaKj2+t3Gz8id4mz8RSg6C9yDxw079CBG7Jsc/QlrIz
	sVSEkDX082Ao3kSzU1Icsa8zlBzf5H50FQtG4Ye8zmXJJKU9S5zk2SapGWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc085gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0f45415cfso34539806d6.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831213; x=1783436013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWbNQLPYU8qOuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=;
        b=hPrqIFV3N7fEQYr40oXD65JP70ZEei6zBLeIx/vjqRAzn+EGXll+mGbHCaKYdHHXl0
         dcAe9qlH9EAVZ5JonmuT9h/tWfoncJ/Bkf69MRIalIIePShPKM8R6718kJ9+yFcBiRdE
         Pd/mC+vFfeZbB609X0q6rvfcK+QtTcE+VH5oFggOLuydlNpwEJdEWFAr9pmIdhCnKmy0
         BxKorWbYf9C8qaTkgdC9P8oB5XdRshRv22EU8fj1ZCA0PfYBLqUMqIGC/R3jowvfr48S
         igmpjbwR33Rwy4mjSf1kaWBoZn+83+pKqbQpjOLXTA7EK9H/18CN9TfgE6/3R1DlEuZJ
         lrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831213; x=1783436013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWbNQLPYU8qOuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=;
        b=KiHPKL6wCGq6lq7z8f37yfijXZCqZ1/nWSpVtdVXIIi3wRfS09FdWfGJXchbjQSu8H
         uX+qOhwnjSWJ0FwZlAnQENNQmQRMgAhxbRkHHrAGi/541Fcx6js/b4KkHQ39vkXC+UQX
         bLYo5+zvBs7brVQK68u1NZ3JDNo3AX8yoenhkXpGpdpeqrf8XD/jnkJW+l8QEBtc7hjz
         tUGqY5FO15Wzd9Et9XFpNNXoxuLya5QJR/EoM16TwkO3dJJcYsYgogXxPxuxC2mG+I8H
         TQES2Lsj63dIrWMMumNuasSujwcUSNtuq0gtYUcS+UvZjs2VErHJCkp6IOC7aEMue3LY
         TeGA==
X-Forwarded-Encrypted: i=1; AFNElJ8R3S2O8ai6ZzU40+S+HnXbUbhP/BzNR4xpfAewycS8FxV3mFaHI28Bv0nAlksSTgOBbxt1nPbLPDuX@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJt/DE+fwSJbcT7N4IndIUuTil9xQYJKGOYJQ/yh35fOCfTWl
	PxVIb5R2lOfLCjcK+OaS8p+thu5s4jTxdZ28OHOl9RcbpXRdoKwQt7bQ2sCIXJ43JgoMkZIcAoP
	Y7rusClOTO7mtZZ1uK5jiZYZ2EPNQlecIdE3rF84Ic778+Wygg4rBh70SpYU7k12L
X-Gm-Gg: AfdE7cn/F+f1igrYDAB8wJA20IDRuxx23YKEJzdCamLq4QWYrvG/zcZMyl5cZiXYdg3
	YHvCCwP4hbRrql88Cas4Y9M3PM55jL3834TKCV1PL7Df0FXgf/aS4O6e1Uss4EFFvZBKTjBMfHT
	UDs/00OmET40G2+7qVMzarhkmrJVmOa6oKroWEcr31S1/clLwQALzprSEa14zsqAzO9qhdJS19f
	IkuujnfBTfxm5pkj+NW2v8lO+cdL9SXBbL11ZwCSR/49MqBIHuTACLTq8a2mTCJOEquw15H7BUa
	OcMsT4l/lb2aJQ655bAmNALFmsSEfDyfJbQg42ZR+xM2eldABe38rWgU9ocCMzXst6ZkXPhM0Vg
	TwTZG2czzYObOAS7MdoM+Dxhz7yUvMWTBrhhA1rqK0xkSwA==
X-Received: by 2002:a05:620a:370c:b0:915:a811:1707 with SMTP id af79cd13be357-92e6249d7bfmr627846185a.5.1782831212143;
        Tue, 30 Jun 2026 07:53:32 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:915:a811:1707 with SMTP id af79cd13be357-92e6249d7bfmr627830285a.5.1782831210336;
        Tue, 30 Jun 2026 07:53:30 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:29 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] platform: arm64: lenovo-thinkpad-t14s: Wire EC thermal events to hwmon
Date: Tue, 30 Jun 2026 16:53:06 +0200
Message-ID: <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX50vR2abUBZ77
 uv2UqxT/4wS99BdlUUf4SI5xaZOVGz+cC7EvZ47x33qeAh5h1xszZDEv4eEEk5w9KlOS5fFMrqy
 oRf0fNYtPU9BkNOUEWX7p+LbP/YrdWYtL0qQ5h+Vhp6a+fhOty6km5zQ7qpfzOenqYxQ4Sgo4rm
 qm4nRBXH7AK7+n/EsBHjNkmSyGrP2lQxsyay8SsniT6NH5Q1WAOMfjLAin/GEoenz5Vo9ltJOi+
 ls+XGL47MiFZCcU4/2fiuQwl/PcdcrrR38/vgJVBob7WyoY2wGZOlQWxfvc+PRnELgrZRGCdV6g
 kKcg/tT8ZkNkrZSnzm7q7X63aWIlqsv9SqD5RmC4BehfddYdIa0y1DOq1Kpwly78muDqHfxkGPy
 SqNeJUw32LVB/Pep0Haskk/kDP15HfawHas7hSBpVCiIVaRn5dD7j28aRtEM8E8OtefXPb9uwDE
 Q5vrw//dLnp/wVmp0bw==
X-Proofpoint-GUID: qGFyuTWM_s4vhZ1Y8LNlK_FKktjSXkXW
X-Proofpoint-ORIG-GUID: qGFyuTWM_s4vhZ1Y8LNlK_FKktjSXkXW
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d86d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Or7PZLYpvbLXL6tJY5wA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+cQpbg9gFsNe
 NKQmOvtilKT3zXLOja1e7uwnXx7/RPvf8Jt++7XmYIsZ/4dglmAOur1Sxihr5oFLWzinizlREVo
 G0BjVj7p+43r0AZ0fVpzXY2fpvkWTjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 78 ++++++++++++++-----
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 35a6f8b0cb6b..5fafb01a2b33 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -104,10 +104,13 @@ struct t14s_ec_led_classdev {
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
@@ -490,6 +493,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
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
@@ -539,13 +556,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
@@ -640,13 +653,14 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM),
 	NULL
 };
 
@@ -657,14 +671,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
-		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
-		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
-		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
-		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
-		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
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
+			.label = "charging",
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
@@ -673,10 +707,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
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

