Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923316;
	b=v2vKgq1NPcB6/6tOn7x0a+LjZLt8pheAv4nmu73ADZJNEnoeAmfusBq/y1q37vzzANC8
	 pVkZOPV6tNP+/f294kR0GMtyBhqAY4TNqnQHpKBPN2xlRw137rWqryT2qkBe6UYgRb5Ft
	 RxmVLBnEB6/8/gARMwC1FyLSBoX6gkZ+7NSzbTFvPNRseyHsButttraSVkE+kMtvnZDRQ
	 ybay63Ogrtwzfd+xtsKRxnpXrO/PHY8gxaejkgjrDR3QZ9CLM8KntJEufbqFRtLQNC6YU
	 OeXttXQsF/62ZWTVED04U4DkfK0IpOraVZO/rEF6qzqmDLg2oIf9AKQyeMf20VXV8ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
	b=QQb09DnwRjkcaL+FpEN6hCQkMlrG1D1APfrHT6+ofXj4XXqhrnpZZeIf7Ex38VlwsVor
	 AClRrCitWz2+OXFKj8+9Z/WRtKej/kK6rxVKYFI5kkZrHcdITBODQzcWzqUeo2Yim6ECi
	 anwA1EI/5iuUDmztt4CYLwZuOb4IfiKMcKYeJczGWeBnkF7JUOHvMw6Qu90DUcuTIJdM8
	 9GrB0Lglo1eYKPCg5M3nFhFgR7LkiwVzFyZX22Jy0EvSN9D0/+xEVVZEXtGNfOTBq4TF+
	 vyX3S8bWkklkXLZj1ECFTdDUvdIFiuUgCyOeXmCeKI4QLN5HyDH/O4HhJIkb2ddBWZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC3606A33A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BC3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZgUrSWq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayLlW6BJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1MRo541716
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=; b=YZgUrSWqkCLAZaPg
	4+FjV+Kr8XEnzH+fVgqWR94jFN7oMxPtrlpyJr9012PiDh01BIYpK7mJBBZtE+z3
	yXAO1px7B5HRXTQvw64Hh+uaNyrYe7w97pIVIo6vpp1+5t/V4UVBGnK5ZdHQO2oY
	PCZRNthiOkk+uTnWVbsNgkWwTGrzLR++fYvXRukuVkvTas9zW+pvNGSuLevhJWk1
	TRGZRk1uKbMpCBpKsvZIfvbmhATNU7pJeztiXhExM04/w2W3zy8S2lj502cJ/nwk
	KwJIXMHVPKbWUecxtPRxEl5pryOmzRQwHoglkWbXlYLP9CBfXAHaB4Qafpl30cgS
	NxysnQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1pjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso4173391c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923314; x=1795528114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=ayLlW6BJYShf6Yu9f745Li09PskP+rVLqr51O7LjNSTSamGHjdDI3gwH4h0pLvmUQL
         IaOwDoir7vCgCVFWr6pjPTt/ERe1ZO2OgYvn2Jdg3OEwgbSOUjMGk+SyF0L6HW+rXeJS
         FiMKyhNMak0+u1WsMQq76K7VtGfYUBfAAh+vqKoNrpJD93n8SFMokY213CESe2e/Ck+a
         UqXk4/QeMqNVUk3yqY5mvXHJSMN6aJqIYQAtAgFyf3AKurAp4ctbEW2eHV3CYgbt6loZ
         9uI5vPtbwlvkGQQLFV8QvVHlbi1QMRwSsDjwW1sZzr+7fJ1P96a16VBgyTSVgGdXAT4N
         Er4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923314; x=1795528114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYxycVOdsHRJGStV+up+VC3v+D3DGUKkc6/2y4XwqVE=;
        b=bKguEmct600sNmLLcLCtVqlHry8kFaT9LaOYVAeQFaKMfHfbOD2ogpsoWFO4e+GBoE
         vmuYq8HwvxEUoiAxRIIvCLcSFITgOuodnJZcmh6agwoIF1kz4h8j9aaEpftS3JvPE49J
         rvRtR1UAob3HMW9b24SLv3zQiI0pWfGlA31HZE3ae/ImytHx7qrbDRN1beOS1sGgRgOx
         YHLEhJqZPKMeDgts0hiWFbB3qb9PtezyGL2nqnL9lTZkeMn23pLW1FPsMsyJUHiyP2BN
         c38N/+cEdrF7jr2ERbQ2EslCxcedFwnqgNBCflc9dvSqAOAXIDfx2vDbrS2LvOI36Wxh
         dWCA==
X-Forwarded-Encrypted: i=1; AL+hErEH4ZgE8IsG1/yxTSDXUh/MDNyz4pAtgxA9btbqoGL38GEBHcM9C9UnIWsDKxqJhpI7/ux3KYbGlhUW@vger.kernel.org
X-Gm-Message-State: APuU4Z882mWfkoyigft4PXIk1/K+pic/xSI2tOIWQ9fI3o8GSCTmDYvS
	RamtIy5ftcaUPBAARvPGk6lZD3Duwv0K1aJrJCTSCtF0o/6fxro2P+J8tBpTolrYLQfeCdc/wNi
	oXv5dHbpzdDWwWNK2swo8+3T0qgQQv4ZhAFQCtqfq29lSN/LuTT+tnDotX+2STK5q
X-Gm-Gg: AYBFou15eo7ieBO2XFCpHx/FaGFEAYlCSzNOtuSKe85QLKOiqo/tw42zuZcWlOYR1pl
	jDWwyUodRwG9HdXCFxjJUCUeLsHd8+Hxhj+6N6sNJhfbiDGRqP34+fhw5U3pP/1qUSWTT3OwgBi
	G4cBFspfxaSK0+eBy9i28BXA7XT7aCtRqnzKpz6GWWXMMMYFf+ay8+1dNO93PxqSed63bEIxlxF
	p9Jgl0V2xdbELS6Kz87lx/v0/Fak8wKu5PuqyQBtSQzXSnGXpSNVqwddjoVQIvLsumrAS2GK03E
	8gvKTCBirahyNlIOf1nQO7olxnfAnodNJD+GmSkBOCQ/ux6yDml4MrBgu1VGE3dfnpTKCdJTR2A
	9Q7zpahzh6BFkKlCcPYJzXTAGozf9NcKOUyxLjJW0h1StGVRJ8RALeRh3k432Uir+EbpJBXGHxS
	HUDA==
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282445c88.26.1794923313576;
        Tue, 17 Nov 2026 05:48:33 -0800 (PST)
X-Received: by 2002:a05:701a:cc81:10b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b534179cf4mr4282417c88.26.1794923312883;
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:18:06 +0530
Subject: [PATCH 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing via
 GPIO
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
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-2-a0fb052c7fcd@qti.qualcomm.com>
References: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
In-Reply-To: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc5b32 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MKUcqzDF7wo3NqxITeYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXzQnDb1Aw1+du
 37iAVHxBRago9LXcoKow7T2d3Mx3wF0lN2fhU+Z3XaZu74g/O4Uhmw7mm18xML8ZuFw21D3tBSW
 Tuw+crhPl9A8yL4Kgf6dKAODq94JB9c=
X-Proofpoint-GUID: HW5oIZdlO8FMk095toub8tFohogrIEAb
X-Proofpoint-ORIG-GUID: HW5oIZdlO8FMk095toub8tFohogrIEAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX15M5+eJAYJRf
 Eq0JcG6DqHmylzJkrby1o4K3JDhSOXjIVzOpveu+iSZk8S6bLIeQft8BwfUA8xXc3TMWYe63lYj
 mFJchrWWZPh3oKXEdbigbAvBcCsouRzAOjhT5c0MUym7qsjP2h6z2B+LZrUX+U9JOdDDy4JwIpJ
 0L/PyerHMTWaV+VWLYOSH1v0OAKVa2LB1+ODvdpzvErf9/gSVT2TYkao0hETlwtOzltSsT5/Svt
 Q3t3tIq0uhfBVwllWtc7NYXRi1xHWIjOn9Ff0qP+rToyUowrg3DWUwsFuG4qcpACUc7TVl0CHgJ
 ZcMBviaddRtZP0te3zQPSjw94C/7m5roerYux1U2xnUTJyOdKi9BdOm8tWtb8T+58EmfdTjWEKi
 kFRUGj1r6woU7y5cFlAZ9L3IJBUnaLA3PYvdafDhEIqlXiz7YoEJ8b6sjIfUxNwFBXHHrz6YFLC
 LXb5A3OG4LL9zzdetjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

From: Akash Kumar <akakum@qti.qualcomm.com>

The CCGx chip has no HPI register exposing CC polarity, so there is
no way for the driver to report typec_cap.orientation_aware or call
typec_set_orientation() from UCSI status alone. On boards that wire
a sense line to the connector, pick it up via the orientation-gpios
property and use it to report orientation.

Acquire an optional "orientation" GPIO for each connector child node
in ucsi_ccg_probe(), indexed by the connector's reg property. Add
update_connector and connector_status ops that mark the connector
orientation_aware when a GPIO is present, and drive
typec_set_orientation() from the GPIO value while connected.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 76 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 34fde72fe0a6..c6cae20d8602 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hex.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/typec_dp.h>
 
 #include <linux/unaligned.h>
@@ -201,6 +203,9 @@ struct op_region {
 	__le32 message_in[CCGX_MESSAGE_IN_MAX];
 };
 
+/* CCGx can expose at most 2 PD ports per chip */
+#define CCG_MAX_PORTS 2
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -235,6 +240,15 @@ struct ucsi_ccg {
 	 */
 	spinlock_t op_lock;
 	struct op_region op_data;
+
+	/*
+	 * Optional per-connector CC-orientation GPIO ("orientation-gpios"
+	 * on the controller node). Not part of the UCSI spec's connector
+	 * status - the CCGx chip has no HPI register exposing CC polarity,
+	 * so orientation must come from a board-level sense line if one
+	 * exists. Left NULL (orientation_aware stays false) when absent.
+	 */
+	struct gpio_desc *orientation_gpio[CCG_MAX_PORTS];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -694,6 +708,36 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	return ret;
 }
 
+static void ucsi_ccg_update_connector(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_ccg_connector_status(struct ucsi_connector *con)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(con->ucsi);
+	int orientation;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	if (con->num > CCG_MAX_PORTS || !uc->orientation_gpio[con->num - 1])
+		return;
+
+	orientation = gpiod_get_value_cansleep(uc->orientation_gpio[con->num - 1]);
+	if (orientation >= 0)
+		typec_set_orientation(con->port,
+				       orientation ? TYPEC_ORIENTATION_REVERSE :
+						     TYPEC_ORIENTATION_NORMAL);
+}
+
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_version = ucsi_ccg_read_version,
 	.read_cci = ucsi_ccg_read_cci,
@@ -701,7 +745,9 @@ static const struct ucsi_operations ucsi_ccg_ops = {
 	.read_message_in = ucsi_ccg_read_message_in,
 	.sync_control = ucsi_ccg_sync_control,
 	.async_control = ucsi_ccg_async_control,
-	.update_altmodes = ucsi_ccg_update_altmodes
+	.update_altmodes = ucsi_ccg_update_altmodes,
+	.update_connector = ucsi_ccg_update_connector,
+	.connector_status = ucsi_ccg_connector_status,
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
@@ -1506,6 +1552,34 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
 		uc->port_num++;
 
+	device_for_each_child_node_scoped(dev, fwnode) {
+		struct gpio_desc *desc;
+		u32 port;
+
+		status = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (status < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			return status;
+		}
+
+		if (port >= CCG_MAX_PORTS) {
+			dev_warn(dev, "invalid connector number, ignoring\n");
+			continue;
+		}
+
+		desc = devm_gpiod_get_index_optional(dev, "orientation", port, GPIOD_IN);
+
+		/* If GPIO isn't found, continue */
+		if (!desc)
+			continue;
+
+		if (IS_ERR(desc))
+			return dev_err_probe(dev, PTR_ERR(desc),
+					      "unable to acquire orientation gpio\n");
+
+		uc->orientation_gpio[port] = desc;
+	}
+
 	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
 	if (IS_ERR(uc->ucsi))
 		return PTR_ERR(uc->ucsi);

-- 
2.43.0

