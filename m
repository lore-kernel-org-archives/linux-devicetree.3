Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639963E63B1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768831; cv=none; b=qGKjQRWJ0WGaAX4NRJPwFt5l4XF4NEH1LFRTU7cn3WyIbREqjuqvmGlNwtFuVKyEOwtqsbh/Txi5dqI0Y49r/XEnx0Qpz+ZqOl+/hrunhllkTX/Gkb6QvMmGfo31I7fjrjPo9D7wFcMbh1Fl8redpoli4FErXhymbwRgEW8Urn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768831; c=relaxed/simple;
	bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhJk7CrPlOj6Wa7UY6G2iR/bsl9qycAgi2SoY66FxIWnXzzhcxrZJSXV5BXqRzUTUqMR88XD00zDFh5EsitS8L6twFC1G3L5b3nWFyF9u66wQSuPB3Yt3YEU0wZouECis1JuZUj2Mmzq4KxMCssti9OBuaHeEDNB/1ZeDyKuxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jU57Hsc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH7ooRNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jU57Hsc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH7ooRNU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRwb2713163
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=jU57Hsc9Cp+8w9s0
	CGvG16i8lIutD7VhNK4+CDEjGWZRymQ6x1co06YI7nnSqkdKIs/HiNRRLEO7Pt9E
	gOJKvbpQR2B82eB7NA39SHqJAXDW7IufZ5hH0LiscTGLub6A66gnxnDqgpTOk+hj
	56noyvHc3WSofy0NjjnrKxSlfT3FtYVUy/ocxi2P+Vsaq1HfCc+u38V/4mtAI2PV
	vaelzXd8V9qQ3gilUk0FY/4ut+8epEVdYW0I5CSwFPEEwDmJZNOk76TpfmCR6ptc
	cOTHx+aHR4fG/xNniazrfsvpZoumzpizZ5Rll6cAmIHiCMYPyaLJ6QI5+dKEd5vX
	WQbqtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89pes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:27:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so85986605ad.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768829; x=1779373629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=hH7ooRNUSMcfEEc8Sp87Mez6HdXqQvSCzAquS2/c1zwI45RjGqn0oUZtt85wPAJ60t
         8ptdeQF207QGGXVXbG0yYB4OvnXne5s/vSrTMlIFSFaroDVqG+/8gj6cG+oejA0Vlsgw
         XMfUB0zVbmsKj8FrddPKruohUtskgswrYk9FSIRZVHyb3hGwj3g5Sx9t/X+IdTwb2QA0
         IyVwzDz8Td/gNIgp7/QN/0MjBGUEX9L/PLD/2OB9hY7Foao222asxGX24G7hzUXNCOWl
         gyUFZE2jUud+SUvq9sqe/jvxb4/B93dshiO3qf4LUGl3A++RYZzZCC4Sg6Pbzvt1yQiY
         t/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768829; x=1779373629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=tSbUsAtnrY+Ai3NeD9ITTWZCuw0zw2R643zoYcidrKeQmu9Ocn56iNgnYgRd5oKBct
         hEGmC2Kh8b31jSsxm0upjsRWmHu1J7qfDXJH8Am+zj/2SFm4c70ePh/HghRNXwYume+G
         8NL+FmUMXls9k61ubjntGJIF7LKrPU4krjQIcTl4e2odPUhaHECm2ewREVAWEImbF15q
         V/PoKo7EeJWpiA35qdeoYJxR4ZuH+T8b92EEWOULi4Ab9/LtOU2piCuk9Z+IUZ24mIYl
         CGjzmvTncxOwE4pjgaQyZ0r/yqgnYZJnmWY8IpnkePDur1X1NuyxhjRI04M4umt0hBTz
         dnzA==
X-Forwarded-Encrypted: i=1; AFNElJ/OwywpnvXhQs4AAaffV01ooLgzZXh/eTqlBZ9xKAuwLt1mjULoqsTLOD3VUnw4OwZmminNfm6ouXx6@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+GLps0kxXTRnYTDVRxH/JUccYolx5sB0Mad6uvmVRNvWtLKg
	Vxim5Jhal/U1VKjD6qyPvI7qkIlUtv/ETgygw/3ZI/z4I9KXsA3Qca6mQohC43nCijnoxsV//hU
	qKwEoo+Ox4nCMYzXPTq2nfGn3D6o7F14k2L8rBLc8GXjk6z0xlr+zmwI1y5ovtqMZ
X-Gm-Gg: Acq92OH4jx312jFCaveBHFe97eLcAaoGHtUG5MiOPaIspyot0mQT7qARFPESWYEBpHt
	qOj3O0jsJt18T5UbMdZQr7e0U/t19lfYuK5BLkYS7KesWULacO8lthqqCJqpgFxHVJP9V4DcWAT
	OmzAlc0SXYZz0KQ3DsqLcnsKX3DWIlRE9W0kObDopl/s1KzpJ4Vq4P1xfbu96rYunkVPd07gymS
	9psoOotnS0hfULFqJ1g5ZrP518ZwbXSEw7Vm119emd8YRoJreSpPlqxpiUZt9PdePzPBgXmMCdn
	mZpFaTnWI078Q9zQGN05umXLHNLjSNJPd/eOdlsaWZ+rzH8A2eeWsYtI6cBnw+S6siLWhV4bWqo
	AGPOsbrfm4DxBOc2n3EMb72NY4MiTBxPOUT5DJDkBn4Uv0FKfZ3INxl+x1A==
X-Received: by 2002:a17:903:1aad:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bd5026ca9fmr51787265ad.2.1778768829046;
        Thu, 14 May 2026 07:27:09 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bd5026ca9fmr51786675ad.2.1778768828397;
        Thu, 14 May 2026 07:27:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:42 +0530
Subject: [PATCH v22 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-1-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=4001;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
 b=YkzrmDnT6IWVQWvAsPWyXkGv3PUv6QacptH7QqP+Tjs99Ct+BZ8eqQmoQSIZra/PQKUTaAkUh
 swxtTXMqMYBAPyIh6JKWAQaN49fbiVTXcCgIb8O4A7VKn2jvOAYjvG0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX5LlSo8XABMVu
 kkqXZGYd3mhhPR2LuggDyeGcyOkGUrIuw4sifczODCkj/CqI6TSvKGh1DCr5qmDHuYaM2p2xNip
 midzAiO9JMW5V9IHtOlysnYZLgnq9+MIv9az2PlEmlyDIhJE1cUWAM/LSvEGuTXI/qluKqKgHw5
 nzYFCPCg2CrSl0ABvtnvrm4N/CZdDRFKFfxNz603C3LxLYH/qDy1onUw6MU5fiME9aVruTvK0hi
 1NWQQ3NRGCaOoNgMJL4g972KKc1dkRjLoW69GRa6DMyE1uyzuqd9cKdKkei71ndGRN4vB703x+W
 JMQNDddRI7n1zSEDexnNaJ+PITcm3n3Y0+PSTsbu+9stP4VmSw0W9XiOmoc3fWv+ijWtEXXFlvc
 eo5jYK3x42nBBGvgDieBR/n/EZYxhwo/4nXxnFVQk2biii26Uaq50YnmM27vkeg0jqxaT34q+4w
 C9mlaVY0lJPl2eTCRHA==
X-Proofpoint-GUID: MkuFBVU0GWrxqOp-eCtBL6547lDGiv4S
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dbbd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: MkuFBVU0GWrxqOp-eCtBL6547lDGiv4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db053256d87ad8034ddab233e49d36072d..7a74f72a8313b73c3e0930a426ebcf7ef6eed99b 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -10,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -200,12 +203,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1

