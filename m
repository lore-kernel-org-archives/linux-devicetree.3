Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5962369970
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311398; cv=none; b=gzs4P2b0VvcNbxbySgbATpo8zk8q6I0+Q6VTC5QKFN5YBuhVF1D8er6uNoWw1gSEpQvLiW2RLKV2Buj2oK77vAUwo7/lh2ohrtfs5gn96aM54IiDJflzA7WMwz45mv9wwb9WLopW+lrcD/OwNnhxqF/s+/vb4wwxR3d9AvFlBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311398; c=relaxed/simple;
	bh=fNH9qCYe4Y0NmzftG8HGe9p8tkk1iIJgMKEMMVyfJQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uuNrC5cG/3M/iMMi70ow3e5XVMX5PlEwGrUvv/TImOyWYW+v4yyToMLzZL/ntIObhxy0hRGCclK5x2HR34NKR4ou9iNseRxg27i9QY3tpMI/iS5VOIA4t7wYW6BCBs7gb7HInIN3PN9m1qxqAui6Z2OIxzDTBHHMM18/yVRl4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T12Xypqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOWHG9GV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T12Xypqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOWHG9GV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDte8v241140
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=; b=T12XypqnQnquQ8mC
	ng1tcHHYGf3IDDJ0HFnTlGkA0m4XQU3DRNKv8t+IFWYJJSaA8EYdx+pQKyJgIkkb
	QYb+aTcPHcmLzZMN/+saSCSmi8+bAa5wu//Xvpq6sECD4pgbLPw/zBavv6wc6AeQ
	gojy27n40JkkXRLDuqf/HBrVM3HGIntDvAeyAdTDXGF5OqEUSez/FB6nR/5oOGAA
	QEt5bTJ8XiTvoLLXBQ4sMF8QVFf+5tuL35rJF2OjSvM0jo0QDvJfPZ9q1o9VFnl/
	rt5RZYkzo2NJqlxK38YECYUl6WzlrGcYM3z7ESuPPl3YHQPUjDnqaaGUNg/jbFUU
	2WCB7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946rums-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242062308so195443025ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311394; x=1777916194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=JOWHG9GVEQLyz41T7jjOsUpXyE5v24UbowPqvQca/XDDos2I0GLoobJCx2EEMdyk2y
         c9adcnSr2B7Osn3EuPjAkRb5owr47cHcclW00UwYkbB1PlaC/61YQLkHUeDVyBLXsWUC
         JdMKecoZqHHuc2Z4nBkwlVGDKCOZNvLvvdHm8NZwOc75+sUk9wARk9ZQxHMgx3Di6uai
         e3W4gNBpgyBmzTWHK1mhSWch75sO9fxfD++aG/GfQa8butlFITqVBwcfb8bd9wTYj77M
         L0djfrfYyHkdT/LozYfcx8gAkYhEG7evKevLPAdKRWr2xZp6018iCBsOmZE2SzkQnKYo
         rLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311394; x=1777916194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=kSfbYr9Mhl7/mWgiiBoqeogpsKoWYR6banGna6+FBPzSle9n9VP2eGml5FtL7nYDr0
         wTMrsoa8OnltikU242LWqXbHDiniYAoYcSw2ee6/xnnt/wlss9xtkWk+U5NNtzeGPOHq
         2+Kb5iIO3ZgDaVbxwWv60/UpnAYzhc8qtX9NVAgFEgFfL6MU2MRZrGn0eC+SShOJMFmI
         dCGHz1AetCZmVkOUQk9twxvdetXYTktYe/LWIlQ5H+AZn/nkOUehn/a3G74EWguhx0Hj
         3A21STWCLbWVmk1//jLetIWMczuQRD6F6FAZF+bKDbaMGAaZ6Voi6KTP/Lu43TrnL5o2
         8r4A==
X-Forwarded-Encrypted: i=1; AFNElJ+0ZVMkhiLApZDt2eXAw9Rx+sVufZ2vNS75CguHBZ9sHISwXNvH7xg8zmOHEjU5GKRQJYeeA9+OxVBK@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJl/2Rm5UZh0Rt62paYsj3AHGIV/1pGYjaVVS8FN5U8ZZY5ka
	5971hfWlQ6N0Hj+Gs85uRSuN2ft4a1eiWaQf3d/zpNkZgFHiuHUXPAD4ErJFfjt8U/Sn1Zvids8
	00wc/4iptINeINawqbJENt7ejXcl8OgCbS9y3LUbw2nPVrha3EA07YRimYQ3sbO4j
X-Gm-Gg: AeBDietssfzEihWLNZcVzb6cypqsbgz9A6vAex6xbpKdWCCJAsDNqx2WI43wxEUSr3Z
	sDv/v+HN38EY43ZB1TUH7TpZsxTdi/W5KD+PWO9WTa1N+RuqvAv891HPIPyqckS2WH0EDdm9IPF
	AvxPhh08xhAG6LLDKInL7u4zkYH7hoetMRdlkYe1mmSUKrIoubg/JtYmQDv8hz3GVmezWl4+dpH
	4AvdLYuKci907XOV869iNMr0T9vnNgTG5UcrWmVgRiTvkuVTMGY7l445IsYSwSrApyma6c0aZOs
	NWRzLJruevg/aUldYG4S6GDFIqe+i8NUYPP8sjJmzSEh45DmAQfwUIMziNWX20OYBqjN/pg3MFB
	sHswxb2yvpB0xYYg4B6Fr7UOkcRXEUxl1AoPC7dOsqAHnsUhbwikGTtI03Nix6mJj2NMf
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052305ad.41.1777311394469;
        Mon, 27 Apr 2026 10:36:34 -0700 (PDT)
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052025ad.41.1777311393841;
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:48 +0530
Subject: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2427;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fNH9qCYe4Y0NmzftG8HGe9p8tkk1iIJgMKEMMVyfJQY=;
 b=ZRQqaXwPk9eM6B4nM1bogpDoTT6JjboYi/afKdttQA9pSYuU0vd20Tg8Ykkl7Zc2sqmXOR127
 TjkQY84p39bA3wuq+0W6rtvlHbI8XeqZqvU4Lvz1j5Jn7/SwHMWXP5G
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef9ea3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JnGLTex25XOQSkTSfOwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: f_NLgUcCZxR79WY4HtUAuSM_oTXf6bsF
X-Proofpoint-ORIG-GUID: f_NLgUcCZxR79WY4HtUAuSM_oTXf6bsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX+7tXY0+rhv8V
 HXLLGXLVbPwPISXzaItUiQhore1bqnSjw7hEmdaQrChtF7oxLCj/rnEmZp28cV9qeMn60j7bOG4
 PdrnJ0ugEvvoQ9dfQeWxZ50di7s87VRDGbwmJ3yishC5OFI6VLHM5GT6veysPL48ce+Sq1g1rds
 SvSW6MAnqXj09PPu1ttirewkeZs3Xg7T0G3VKzFqdp7F/cs2QEvUxPFqmej9TQVF5fLzAAGJH8b
 ruBIeku5IdYRKz9Qj+cNfJ7oMkv32Hq99JZS+Lywr2OCXDlPDgS+7O91kKThDCanqmBZw0lrd13
 nmAtK3adrUazLML0f3av36mudldR0rsPbqUXuJ+ADDkxOutkn05KhnUa/PZTExIw9PT7OpBzKUK
 xKLVDRwP5mmiU0I/vDdPbHqBbUhP4hfBSnTA7nv1yOv0pKErc7O4gKDGk+1XRDjZa+1m5yT9Qj8
 nh68wDUDS+uyARbScYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with an optional fwnode pointer and attach it to the
child device during registration when no firmware node is already assigned.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 10 ++++++++++
 include/linux/mfd/core.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..d2153d9b6dd75a5f55d232ba87bd9e4abc93c8be 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -224,6 +225,15 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* Use explicit cell fwnode only when no firmware node has been assigned. */
+	if (!pdev->dev.fwnode && cell->fwnode) {
+		/* Get a refcount if fwnode is a device-tree node. */
+		if (is_of_node(cell->fwnode))
+			of_node_get(to_of_node(cell->fwnode));
+
+		device_set_node(&pdev->dev, cell->fwnode);
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..8a461b43fac360672a489ffffeb8d0e1acd193ac 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -50,6 +50,7 @@
 #define MFD_DEP_LEVEL_HIGH 1
 
 struct irq_domain;
+struct fwnode_handle;
 struct software_node;
 
 /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
@@ -80,6 +81,11 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Firmware node for the device.
+	 * Caller owns the pointer; mfd-core takes an OF node reference.
+	 */
+	struct fwnode_handle *fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1

