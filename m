Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B901D3E5580
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311328; cv=none; b=Gp9YjWcoqEsZ1lDuZL9lQKTAH/0FoqnehBvTixHuzcx8a9KNykn33SoG3fT6VwxqPMAMPhUcatL9hfLyqspGjFcGT1lVFdCrVtVJt8M5632DkrdJj221hj7IbZnvtAMiVMXZllrgKOeGr2bVb8jldiOHYGBgcCwr/9yzSaPGqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311328; c=relaxed/simple;
	bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezuL8uPTyhZnlAqD9ShMeZ5Lh5weFWxqEJJ0bAw7KTqPmOTW5pMCn1oBV8n6/DA7iKwR6kFdzGs1NVQG+Z+9zDm+FKPssT+0JfyxfCnBcfVcgAgpNrkJaGVgTNZljfBT5Ze0GnmvSn0xTsmIl4uFwriqVsFcOACZ/9xlYPtA8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRZIIfxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTMXl3ve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRZIIfxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTMXl3ve"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNePK662935
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=lRZIIfxyLmSdHEI1
	2wK9QYlFisa7A3/TZfGTApXbHOkOhRixgMzzkZh0Xm2+PiAepXQeodVY/tFdNGyv
	7ll2LzC/ts5bywDNMKoUoYUWqjZYM2sBaXVxodQORlohMBntTinYX3OGr7W6thoW
	fd2Tag0MhgAJmHZa+R3MlEdBZHHpQ4yyDoPXzImzCeplEfE9JT94AQuoaGg40jji
	3lMrkzm8BdsNhzyymzjBZCTQKE0u9pDjG5ZrwUU/8B3UDUczpEDxkmFqbRiLElEt
	Qs701sG670k2PFWgODLGAbzf/6coazRSyiBv4s3Q4aSs0lxiguBLaT3xyWvhQz2M
	Es8/cQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n01ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so95788075ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311324; x=1777916124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=jTMXl3vec0vsN1SEiKS0ISyxyVVktn3Rchh3FIejGqCIrUYlKouraWGtnUQumCYF5x
         lE0z0kH2x71SPouyLdYjN6/wA9yNWDj7k6wIDztLyXJGaRLhIyIGRL+kJU9+EhmtUE07
         dedOFGs2PUwqShZaT7YsvX/X/cdvZWoFmw6heT7cBDthLGLfwRnEd9yOUPwFw86gJPBF
         N7T3B4BsojVfucBm6j7zXHAmoOsuCdpbzy5JHEeS+f6me9/SQNG6oS24Ml37/zsLwEUY
         l8jJZVSG/UD+u3l6N/jnsILfSv+JgDObFJ38B0mCeMPgl1BbVklhsPYTTCJH1BvOSVCP
         ah4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311324; x=1777916124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=Ek2Rtfwzj9bzfABMbePIaDVYBwpKOQo5JHuowWAB6zm9n1uvKqN3+zLqRLaQNvC08Z
         KWeTEkVj+7/CLZv9Suo+2kzey0ybFQvhRPAAfEQl8JRUBQHHEMdkRw51OGKqqCCcLvKi
         P4x3WuVMCr43rAmhyEOQoDAbQIylcCKqQy+YbEjoeCh4NDToZ16k5NE3MArTIX6W6oX8
         +a1zR7bAvywDxJYLjLzTYLTN1i63PJk0dfm/sEZSPhD8kVAQDh7blDm0xxyVZ+X1oH1N
         d3qnWo32LMaLvV0tT22TFMGXwjRhcPbPh7NkawX10ANFn0uayKkEIr4ze3RJ8WNlGPpT
         Vj6w==
X-Forwarded-Encrypted: i=1; AFNElJ/Tu6AiGk/IyKFshE4DJMjEfTwV4WaR/wq2aTEnvqB5Yi+OcADaR5DEpBp6P1SqxUQlCvhpS9AthaGo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JJb5ZFy4nCYDmnUPgF/9UJIirr8S3qylkUfiAizbXu2nF58j
	872JExNsUoGw1vqzcG8DC2ADkkbuvrpyUV6wOsnOF5NUzaFHq1rwFdV73gkEYJmODRD8JYvYOLX
	XeBWwVZs7dkE0eqh5QBRqt1jcylV8kxl0bvcyZ2Q2iLJHWoTPjhh66chxb4zt7IR2
X-Gm-Gg: AeBDietjhPVtwS4rOj7afGD/bH0dPclH2Fe/NdGw7by/D/iNVMZxiXOOU0FM0FP2atq
	XMkp2EIHaQdmSeL4gD8osf3dxYeWEIaDvN2b967felU7vsC8XM+XF5li4C9XcgK3m/i7Vorrne+
	n7sgVx4Bn6VbBz281bzK8YprZLM9wQVJVv1uj+pyS71IL+aKj/PtfPCioj1A/DBfRHh3J4dIFmq
	h6PeT8Yw/7GrzFbRTgE9lw6JiGZdmsDl7uG5pmOgRqKsmqSR/Acu+UyEw4np8YDqtJ2hXPtPCyf
	+3kgXGr0FN4FXnPvgCreUtpCsyPZYFow9LGYoFs04nJR/Qt8jzloYw39J+IM07OzwbVJ/wxQbej
	DbTIEz/dLpedg3qSs8loTySqJR2EFwv03ABr3G9wdlc5XMvApaXEKVh7U4wuq6+BdNdyB
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1109985ad.41.1777311323437;
        Mon, 27 Apr 2026 10:35:23 -0700 (PDT)
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1109465ad.41.1777311322756;
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:41 +0530
Subject: [PATCH v21 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-1-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=4001;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
 b=32A+1VzoGWg9FSbHynSX81qbLupW/hUgrYzIQsaZuSIHuB+n0hQE8ta4k5laVXIaKpofnQnvs
 +fICXcpyJbnAy+fAxeBYskqTifNlGwo64pkQbTOArzTafR9aiuPkzPz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NiBTYWx0ZWRfX0RByj/+AavJL
 papfbDfnUSTjedmxs8kuizX3tM4tBBm/TdzPJ+qPpLNuyNDTDogLmej+FXhPcRZVBTiVxuVN3OG
 iFA9EhTlk3PfXSsSoMpZ2kU7kSLvVRYTHQzgBW/lLZlu52hUjju2RtWpY+OkjpmF591kRVBhpRX
 wgpQMcOPXXIRE5UTIFOj1sE+aPiXqNkCTMLdm/6IMONZQNiLH5HWWev61ayHeQPBfWSfzvZe9h2
 b2kOykeSSZ0kwI2ss32qoAfXr2kJ6XP5aL8zN7a1J2ryCxjMWKonNSvB/KxafCKtbxIJ1tfvQAa
 42f10NMN4eMwbKFfHl+BIQlreZyzZO9+QrF/XfIUMb1Ph1Z0SEeC6KCXGdjoBTJNFaAn/bfuJrN
 2romXGGMti5/3XeDSa369/X6FViHilM1AvshjPGTcd691VuTgcRpY23gtIR2xPxz7g9skqZTu8V
 sHALGNOclo952jWM4Gg==
X-Proofpoint-GUID: Tb3GQQMuq97GckwtTlKK572N3x6Mnn76
X-Proofpoint-ORIG-GUID: Tb3GQQMuq97GckwtTlKK572N3x6Mnn76
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69ef9e5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270186

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

