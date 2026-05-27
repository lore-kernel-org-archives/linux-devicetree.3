Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3693E9C09
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873813; cv=none; b=RC4K2QzZ38XdmuPXfGw5hvZGfLloZIJ0qSxlbpL5Pytk1D8OuNaO9X4gJusJy/VhC6dlWGiU1tte2tZ4RVNtSM0mIoEkJimic0fZ0BA5+2LvMseBNnZbF8FPwkSR7ckTh6spX/QeGVOdXXwBY2nEr3C2xxKydvRWkr8ghcuMqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873813; c=relaxed/simple;
	bh=bZXXxGK8ZOTfj0Acs1hXgVfv7uykaSOJk7ng2/VKxlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teC/CNevw9YDisj7RKlaTLTivJNBi5y05kmxV2aKhQ/tku7fObei3LS8oWQCgvxqx2CrQab3DiZGpn6wbBCYFgGBM4YarVoycKqbFbgn7Zijs2z2WaD3Vc4ame5f87P+Ke27e2d87WXReMoIDqva3i38LkxvE+ypHOgZcsb/SOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5tAZpgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEFlOR8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5tAZpgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEFlOR8K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mR6n2282521
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObWm1baL1QFt6fMABPrl+AGn01z1W07BBOFckHaRfGA=; b=A5tAZpgs/iEspIed
	JAChTQKZYZqnLBb6nXqAc8CAoKCGUKH3LoW86TGVImwXzJ9dziAjrTqPsGVS2Gch
	oGT+TtJ8sejFQLWQLk+Uhlv54vY0iw5Nyo6aHU9Tf/3Rzj8/daRh7Vk9wfSJeQRW
	S78UQTpDejEulaQB5EYO02Qpho0Z9+Brfdrluj6pD7sSgqVx73EARkEbu6qqDwcb
	gBUbolKq5B+JM29bGymKO+LvoOX0H4EPTo0V+hLZmZ1YIqdpkGzCIcs9qeAgCB7Y
	PUWXptKmRObMUxi96Eua3nbiQsU1uvL3fURAiWtRaa5g4NkHHroyPWHIQc0/CmMt
	cg60Kg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrs4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:23:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so737461eec.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873805; x=1780478605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObWm1baL1QFt6fMABPrl+AGn01z1W07BBOFckHaRfGA=;
        b=VEFlOR8KtcOP5dMtbTr7KDc2JSRxez8TR2QuIibNJvYWxxjK183L0xAbjC/ohDAzEh
         crKoD0UMmbAbFYbbcv2BNQbHnqMLGOVDuPOp7d8nc32MunQ0AbvrXu2hSirBLC5klb1I
         w0cFufxFoII7CU4LQhIuYnmlXI6v1tLwGnHjbAKYfy0J17tVmP2A8icfiAsV32BE8pmt
         pIROdeTxHcZCaT+kPSnTdO6Z6iW4DwlQ1C5z5y/rajqe1+RWfbT4buiYN0mZJ4OWMHST
         jV5or+kaNAjU6Mwb4rloAO9jaRN48AMfqr01NrM7kEw0nIfUw8dyuJSdUK8jiUA3A+gF
         JzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873805; x=1780478605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObWm1baL1QFt6fMABPrl+AGn01z1W07BBOFckHaRfGA=;
        b=VfIx9UowqpshAYHmZhNFMNdU3Ecx8Hn1Oxhc84n2A60U6Hd3sxs6XtBa76OpNYpSgh
         qV/CxIrGY+FYrOHLZ4CfqmnASjZNO2yY+C7iPjw7uEQn+cWpw4QqbSAM6jmLUeBq88TB
         RU/l6SaLUsMNzNC9VsYs/A7qFlRiWKWu3KHeAImQbQ51ZPuZV4+pii6MpUovfyHEdT7r
         zkiGy/senmDCV5s+q6boqDP8PEHRZ+gOapbPbeP+ocMQuJrYBkF7Nz1SKkQ80C9OEpwr
         Gt9R0q/zisfSuVy56G0I4lhDVkwgak4sTn8mQh3JQ6nLAHPegzbpqcwU8FOrHQK4Uh1G
         7/+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Amaf5/uou4DMDnXxke+38kgKjMvC4Wk3cLuntBPzk54DYLRn7eG/Fkur7VZfd6sn8/fLkBMqPLxd8@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQVXKg6OYVMGpgvxb96sNmAVZsDo3x55iavg/creSDtMkdsTe
	l37DYotMRJME5kn1iqONgfmoGCxT8ye+9qSpTp+xGnDn/A+q6/qmMxJaoLRxHoIZghccEr37bSI
	BS9wrNbqKertdy77vtQb4WJqiBG7ogChRS1SnWDeapZZAJ9wGLZ4UsEP22QDwgoL/
X-Gm-Gg: Acq92OFDDhIi98KGlQdWzWRoYul3MUzVjsUnMYlSZwUUF+cr5u8CucnICvChpTCeA5g
	pEsAp/XTWsATKkGnGoNH6P/+EwZI1zpv//3C2g6VPdEGFc42kv5XfeGQUDdK0ePR4o0+u2sLoNN
	A3VqYOVlcz7kPGggyzZzqn8cpeSPwTGqsHk1KOk3l5N8ZHRM9s4lprT6msV+NN6sFa2jQ0JVTTa
	5d5EGCvfxpYJ9ep6YwwQHFTSrg3sXObnVGzruzN02jGLHIM/4V0k0dAGKnP+vOyoLUZan93HT7F
	Nu/u5DmwhgIYkUR49QcjbOFytg/VoAZFGfvKO9I4G46GjFsiONX/hpGKkYKsK3fAn1xJZ6a1hXX
	FsdkxGl8YhOL/0RFTvriGYGSo5XzX8k+eRexKRMSUCmRQJ90xIbgFXpA2NtPe3nRpELHgVTGxLC
	u5jzfaiaXG
X-Received: by 2002:a05:7300:80d6:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-304491d0badmr10433531eec.23.1779873805189;
        Wed, 27 May 2026 02:23:25 -0700 (PDT)
X-Received: by 2002:a05:7300:80d6:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-304491d0badmr10433516eec.23.1779873804600;
        Wed, 27 May 2026 02:23:24 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4afdsm12598732eec.5.2026.05.27.02.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:23:24 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 27 May 2026 02:22:44 -0700
Subject: [PATCH 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pinctrl-level-shifter-v1-1-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
In-Reply-To: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779873801; l=8940;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bZXXxGK8ZOTfj0Acs1hXgVfv7uykaSOJk7ng2/VKxlc=;
 b=JIIMAMWdD6M8aF1L8hWlPDL5MrWpnon6g7Uw0IeR0mHCVMMF+KEth55s7+BsmN7Pjx+YylSCe
 gC9KvgyYxw8C0JCIMXphBDXwDC5HXKLg+EiZYDzsllo8bRNG2YvimJa
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: Z_gZ600Zr7bUoSuHeYkZex2IV_SUDtvD
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16b80e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3W70XLUb-i4rQMzVbXEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX3BYbcdB5IfXk
 /mdGp/uhItrWKRSc9KX5BgpaA+AKJVIkj+0JGXhaMw+GzADYkyJGAd5pNKwH8OOdQXvqvZK2L2l
 8jQs5t0iu5WnLd2WY/YNAvtY3IkK9r0pH2H1iwOo9tBPhAYakxugG8XooHJ/4d7AbTx7JWSEaOw
 S3wFi+6D9t6WvarrlMahHnafTmTFrJDZtVarVkxkDGrgBiNydGWyEAq1fFlZbBbGX2qSFOn2HY1
 ywly04QF4nX6PbSW0rYsfLHKdmc+K7vkRSKdg5EeaEX+hN2bwaZ2BkWLwzPJ9OoOpUloIIEKKo5
 y6MS4yqXcDWJiNdhjuGDbfNe+n+meTEx7BvA5BE0J7uYLAaktow88IDyIoyv/kM5hl6xJmAGxOA
 lClouEzP5mGhr1e6Q40/S86ioWrLpMcbpZDnXGofL5+AU5+gEmNiFOcjWlRyT+dT6TK8nrHcNL+
 DKKmLyXsnI9Ydem9jwA==
X-Proofpoint-ORIG-GUID: Z_gZ600Zr7bUoSuHeYkZex2IV_SUDtvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090

Currently, the RPMH driver only allows child devices of the RPMH
controller to issue commands, as it assumes dev->parent points to the
RSC device.

There is a possibility that certain devices which are not children of
the RPMH controller want to send commands for special control at the
RPMH side. For example, in PMH0101 PMICs, there are bidirectional
level shifter (LS) peripherals, and each LS works with a pair of PMIC
GPIOs. The control of the LS, which is combined with the GPIO
configuration, is handled by RPMH firmware for sharing the resource
between different subsystems. From a hardware point of view, the LS
functionality is tied to a pair of PMIC GPIOs, so its control is more
suitable to be added in the pinctrl-spmi-gpio driver by adding the
level-shifter function. However, the pinctrl-spmi-gpio device is a
child device of the SPMI controller, not the RPMH controller.

This patch extends the RPMH driver to support write commands from any
device that has a pointer to the RPMH controller device:

1. Add rpmh_get_ctrlr_dev() to lookup controller via device tree
   phandle "qcom,rpmh"
2. Add new APIs: rpmh_write_async_ctrlr() and rpmh_write_ctrlr()
   that accept controller device pointer directly

With this change, the pinctrl-spmi-gpio driver is able to issue write
commands to the RPMH controller by using the controller device pointer,
and vote for enabling the level-shifter function.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh.c | 161 +++++++++++++++++++++++++++++++++++++++++++-----
 include/soc/qcom/rpmh.h |  21 +++++++
 2 files changed, 167 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b1..9c7844434e9a 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -12,6 +12,7 @@
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -76,6 +77,21 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
 	return &drv->client;
 }
 
+static struct rpmh_ctrlr *get_rpmh_ctrlr_from_dev(const struct device *ctrl_dev)
+{
+	struct rsc_drv *drv;
+
+	if (!ctrl_dev)
+		return ERR_PTR(-EINVAL);
+
+	drv = dev_get_drvdata(ctrl_dev);
+
+	if (!drv)
+		return ERR_PTR(-ENODEV);
+
+	return &drv->client;
+}
+
 void rpmh_tx_done(const struct tcs_request *msg)
 {
 	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,
@@ -156,23 +172,11 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 	return req;
 }
 
-/**
- * __rpmh_write: Cache and send the RPMH request
- *
- * @dev: The device making the request
- * @state: Active/Sleep request type
- * @rpm_msg: The data that needs to be sent (cmds).
- *
- * Cache the RPMH request and send if the state is ACTIVE_ONLY.
- * SLEEP/WAKE_ONLY requests are not sent to the controller at
- * this time. Use rpmh_flush() to send them to the controller.
- */
-static int __rpmh_write(const struct device *dev, enum rpmh_state state,
-			struct rpmh_request *rpm_msg)
+static int __rpmh_write_direct(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
+			       struct rpmh_request *rpm_msg)
 {
-	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
-	int ret = -EINVAL;
 	struct cache_req *req;
+	int ret = -EINVAL;
 	int i;
 
 	/* Cache the request in our store and link the payload */
@@ -193,6 +197,25 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	return ret;
 }
 
+/**
+ * __rpmh_write: Cache and send the RPMH request
+ *
+ * @dev: The device making the request
+ * @state: Active/Sleep request type
+ * @rpm_msg: The data that needs to be sent (cmds).
+ *
+ * Cache the RPMH request and send if the state is ACTIVE_ONLY.
+ * SLEEP/WAKE_ONLY requests are not sent to the controller at
+ * this time. Use rpmh_flush() to send them to the controller.
+ */
+static int __rpmh_write(const struct device *dev, enum rpmh_state state,
+			struct rpmh_request *rpm_msg)
+{
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
+
+	return __rpmh_write_direct(ctrlr, state, rpm_msg);
+}
+
 static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 		const struct tcs_cmd *cmd, u32 n)
 {
@@ -271,6 +294,114 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 }
 EXPORT_SYMBOL_GPL(rpmh_write);
 
+/**
+ * rpmh_get_ctrlr_dev: Get RPMH controller device from device tree
+ *
+ * @dev: Device with "qcom,rpmh" phandle property
+ *
+ * Returns: Pointer to RPMH controller device, with a devm action registered
+ * on @dev to release the reference when @dev is unbound.
+ */
+struct device *rpmh_get_ctrlr_dev(struct device *dev)
+{
+	struct device_node *rpmh_np;
+	struct platform_device *pdev;
+	int ret;
+
+	rpmh_np = of_parse_phandle(dev->of_node, "qcom,rpmh", 0);
+	if (!rpmh_np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(rpmh_np);
+	of_node_put(rpmh_np);
+
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ret = devm_add_action_or_reset(dev, (void (*)(void *))put_device,
+				       &pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pdev->dev;
+}
+EXPORT_SYMBOL_GPL(rpmh_get_ctrlr_dev);
+
+/**
+ * rpmh_write_async_ctrlr: Write RPMH commands with the controller device pointer
+ *
+ * @ctrl_dev: The RPMH controller device
+ * @state: Active/sleep set
+ * @cmd: The payload data
+ * @n: The number of elements in payload
+ *
+ * Write a set of RPMH commands, the order of commands is maintained
+ * and will be sent as a single shot.
+ */
+int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
+			   const struct tcs_cmd *cmd, u32 n)
+{
+	struct rpmh_request *rpm_msg;
+	struct rpmh_ctrlr *ctrlr;
+	int ret;
+
+	ctrlr = get_rpmh_ctrlr_from_dev(ctrl_dev);
+	if (IS_ERR(ctrlr))
+		return PTR_ERR(ctrlr);
+
+	rpm_msg = kzalloc_obj(*rpm_msg, GFP_ATOMIC);
+	if (!rpm_msg)
+		return -ENOMEM;
+	rpm_msg->needs_free = true;
+
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
+	if (ret) {
+		kfree(rpm_msg);
+		return ret;
+	}
+
+	return __rpmh_write_direct(ctrlr, state, rpm_msg);
+}
+EXPORT_SYMBOL_GPL(rpmh_write_async_ctrlr);
+
+/**
+ * rpmh_write_ctrlr: Write RPMH commands and block until response,
+ * with the controller device pointer
+ *
+ * @ctrlr_dev: The RPMH controller device
+ * @state: Active/sleep set
+ * @cmd: The payload data
+ * @n: The number of elements in @cmd
+ *
+ * May sleep. Do not call from atomic contexts.
+ */
+int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
+		     const struct tcs_cmd *cmd, u32 n)
+{
+	DECLARE_COMPLETION_ONSTACK(compl);
+	/* dev is unused in the synchronous non-batch path; pass NULL */
+	DEFINE_RPMH_MSG_ONSTACK(NULL, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr;
+	int ret;
+
+	ctrlr = get_rpmh_ctrlr_from_dev(ctrlr_dev);
+	if (IS_ERR(ctrlr))
+		return PTR_ERR(ctrlr);
+
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	if (ret)
+		return ret;
+
+	ret = __rpmh_write_direct(ctrlr, state, &rpm_msg);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	WARN_ON(!ret);
+	return (ret > 0) ? 0 : -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(rpmh_write_ctrlr);
+
 static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
 {
 	unsigned long flags;
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index bdbee1a97d36..90ddcd7ca2fe 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -22,6 +22,14 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 void rpmh_invalidate(const struct device *dev);
 
+struct device *rpmh_get_ctrlr_dev(struct device *dev);
+
+int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
+			   const struct tcs_cmd *cmd, u32 n);
+
+int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
+		     const struct tcs_cmd *cmd, u32 n);
+
 #else
 
 static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
@@ -42,6 +50,19 @@ static inline void rpmh_invalidate(const struct device *dev)
 {
 }
 
+static inline struct device *rpmh_get_ctrlr_dev(struct device *dev)
+{ return ERR_PTR(-ENODEV); }
+
+static inline int rpmh_write_async_ctrlr(const struct device *ctrl_dev,
+					  enum rpmh_state state,
+					  const struct tcs_cmd *cmd, u32 n)
+{ return -ENODEV; }
+
+static inline int rpmh_write_ctrlr(const struct device *ctrlr_dev,
+				    enum rpmh_state state,
+				    const struct tcs_cmd *cmd, u32 n)
+{ return -ENODEV; }
+
 #endif /* CONFIG_QCOM_RPMH */
 
 #endif /* __SOC_QCOM_RPMH_H__ */

-- 
2.43.0

