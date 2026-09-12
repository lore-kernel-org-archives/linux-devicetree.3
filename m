Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518F3F104B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253599; cv=none; b=H0rP2wAXDp6+8FA5TH1PG8pvFa5E1umC0FYi+CLZOslyWeDiMwMJ3ljApDiBkORmds9QXSb6lJRTEuBzx61jnRjiYVzBuFjoyiL9Go3un9TqGuE6UYslPzftWVPj7zPyG+dgmHiLSqd4nl3Ltb4hg2rfsLZDJ7R/vNnIhRKn/3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253599; c=relaxed/simple;
	bh=tEDXH/Mz1x1xgdKZ0nHNJm+M2OVWIRMxRtOBeC2FqJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kCxZzoubcDJmXHF1vdUjbHZZXQKd7NwCglSFPdLDjXHs7pHn5pevtct/gu/6PVDyKVF0qmyQ7iG/ENGgEBtSW5Vo4Mb+8zjlrALGcH1kLUUVn7R1VpDchn6D+iN7YmcL/fronXPdF6VQ+lLuGNaTSNWaNtOjLsZUVQuClrAu248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvRViK84; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbWow06R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvRViK84";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbWow06R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnXjI2945325
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=othrSyv0peg
	1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=; b=WvRViK8449yN8wrD2DALt0xVL+7
	/ZzcUbsqdPskpOnFsxzIs+u3QUkLGS21N6TLUb02yWX0QThspoRmRtTbbUfCqSew
	4zEFAd2MeazbriG0c5Dtm6le0ZJ9FiatVdyQoUaS1CgEYwcG4utq3ZqcZg3v12qb
	8qvC4XfOyKk8xjhLX0h0mfkLWfKHCycfCR91Tso6J930ZQE64+n6sLlDuveYmiat
	/15G99GrK7oryRAfwv8lbBauojaSzCYNmUKO3AaywM0I8W5xUx2q2LzydrhtdLGx
	e8xHWeVva2kh94zx7/f/osbIsR6GjkdWu1UOjA5gmXJ+/BT/mDOkq29Z5YA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh1yc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4176109a91.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253592; x=1789858392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=othrSyv0peg1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=;
        b=jbWow06RjhD/fc8Tkz11IfTDzY9NrjExq2CSia8OVtK88Aqrz+G+GfpfNojVf5W8u6
         jEaOG+HgVV0WloSoztFX951gpdTYVvqZbvLNsE//SaXafi0UIzxlfFdLPfjxEWDhgQKy
         Q4p2YVIZTxVXUzu3NrJK/a4O+jl7kwZqxSF9omJ7zBLvQ+gvOA6aRWnzos2vN1q+5crw
         jSACQmz5SoZMDubhK6nNKax5LxafqXGjU7A/xJJQtI/IKGzKrhBpFdilyyoccKdwgNPO
         Aw8EY6ocH0MYPbgRPoFvyyCAgffYCZIltzvJl2pkO6tQdylnngWfSYFhhOOhsC1I2llP
         THDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253592; x=1789858392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=othrSyv0peg1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=;
        b=apOrhkH0lDe/oPCEv5oY8M8whaYBUNOma6e9YDo4exZPE+k7+4KPmm8Mz2Qgcig+dV
         Eh/0hwad0FkmJNi3g7TrKDK/5WezcS8SxXv4YQpS1xUFn9paMkSyubRae+vU+MmcFVxA
         Fh8NXRN2TuxA+xz9tZUmsTv7FydBUQQnUQx/7DxcBTq3iYd8T7lI4pxiVkZzRqtDgQ/K
         gSCT4D1IUr2LRFlmDflJ4Bs/qb+bCGLDifn/RV7PvY5N8Xe0vrt9bdGmryBTcxVOZrqV
         +/og+Yxm+kNPuP1MCr0e+wH4CVwAt/yUue1b7ecMtcHS/U9J4K6kyjRN/NMrB8TRYCGK
         DvQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSMfzWeXqn3iwDVb2M+3u8qx0uYiV1io3AIivgupFK8TY9IDTAJhU68/Cp9nwP6bbUIE7atPNW7HNH@vger.kernel.org
X-Gm-Message-State: AFuF++kSNN/39W0hf8gJLXFVesECt2o01oY892igPXML4KGnH3SGjJwa
	3bpPe3T5MpGHlk/+hCJBQx3vEbdxSHbpVWFEY9MQDnQ8I/Qspfehr6g6zTJRqjwo91SNfT8ypEk
	IxSGtfy9XacuXPSracUDJmeIE0QRhcfSA2cSpv3plpesPCWf4dw50b7rcdfLMi3RxYX38SKLu
X-Gm-Gg: AYBFou0lnIujJidd08qmMWUMvsLj439RT5+tiw9/ympf+7+R9d/0q0PscSohbZq+cEP
	9l0xTBraU4GxoDw1cledVeB91TgOKX8J3eVMhUfsf88Rv45QNINf5WA/m659tlc1j2pCQ2P4ULS
	EkMmh3ZR/uNJF06OEwlTpnDn4L++NM6dCzteVN8YUxzCwSTh6VAnfuT2o+NvvtCUI0dFoxTGS8e
	82dMNnf/JhloOZIffWtGF90FfeC8+YOgxFsGz8gbxF4Kub23KMmFmlbo+YMPzvMUAMvminBfryI
	2ka5HzmJ5qwZ25zhHuzxONds8OGsvst5mQIUd/MIy53AAmSvAisHMYUURCWli21ZuzkHZjH1GaT
	7k5D9KGXw79L1qwTtN1vYEKvAW1L7hF9D+Q+1cVlkwsF2xZoudOF8ZQ==
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr8913969a91.23.1789253592022;
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr8913953a91.23.1789253591626;
        Sat, 12 Sep 2026 15:53:11 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Sat, 12 Sep 2026 15:52:59 -0700
Message-Id: <20260912225301.3396556-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: I2HjrGgw-D8OJgnfsdLA-70ByuDQU5Yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXx7uWovJwkBNv
 FmZvIyUasgD6/bNFF5kGuhroyPAfDOs88Sp3Gja0ugySOI/8cTcYoiS+mK46dnuHPqpKjJ/NP4z
 1XMPp9AFYqUdt15eKSY2wi6hyXH1Zohz1PHwy27QsGYjIAEQxCXTkBCyJScwaVtHo5OyxiPxdIw
 kKP9L/ArgcvxK5a39jFxr91d0hsWQGfF8h8hfe3yWu1wjW2f/U2QS26pAVT+wvtVadlshq5RUlu
 S1yvgzPmoiGr+ORlBCSjwMmatv4utb2/6vnhC5ITQg4Nmal/aUhjwM0wZIopiX+Jml6HMkhWHB9
 E1FjOTat0AIf2KdVvM9yGf9pXXedF74pbGllYrfLOvF/d5PSt5QakbfzGbX5yOj1igY0NGVXfar
 OAcrJ4kZEE7XYA8/tPdmxascWrG/XvoRZ4w1yl8og8Ay1IeG3u8A+mQLytKysSkN/VxDE/Zfd4F
 pD7h9xgwMkyT3T7h/HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX7EWmu0EeoViO
 diw7vMCVXL75X8SoFEdJ9BadrO+iODqpiUlC40LbdmXf14I2DeC3dkPKaMI/scvy7eB/PlcOT6w
 kSmRiq6GPTQuJ1x364btpZtWo8nWDpI=
X-Proofpoint-ORIG-GUID: I2HjrGgw-D8OJgnfsdLA-70ByuDQU5Yq
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa5d7d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. Keeping
EUD enabled in other roles provides no benefit and unnecessarily keeps
the associated PHY resources enabled. Furthermore, enabling EUD in host
role can cause the USB controller to misbehave because the EUD hub
supports only a single upstream-facing port.

Address this by treating EUD as usable only in device role. The
role-switch callback enables or disables EUD as the port enters or
leaves device role. A sysfs enable request made outside device role is
recorded and honored when the port subsequently switches to device role.
Additionally, synchronize EUD state management across different paths to
avoid races and maintain consistent hardware state.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 60 +++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index d280628370e4..353c45dfd328 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -55,6 +56,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -156,17 +159,33 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
 	if (enable) {
+		path = chip->paths[chip->port_idx];
+
+		/*
+		 * If not yet in device role, honor the userspace request and defer
+		 * EUD enablement until the port transitions to device role in the
+		 * set_role callback.
+		 */
+		if (path->curr_role != USB_ROLE_DEVICE) {
+			dev_info(chip->dev, "Deferring EUD enable until port enters device mode\n");
+			chip->enabled = enable;
+			return count;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -204,6 +223,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -285,8 +306,13 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
+	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
+		goto out;
+
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
@@ -294,6 +320,7 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
+out:
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
 	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
@@ -304,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
-	int ret;
+	struct eud_chip *chip = path->chip;
+	int ret = 0;
+
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD is usable only in device role. Power it down for every other
+	 * role to avoid keeping an unusable module 'ON'. chip->enabled
+	 * preserves user's sysfs configuration and is not modified across
+	 * role transitions.
+	 */
+	if (chip->enabled && path->num == chip->port_idx && role != path->curr_role) {
+		if (role == USB_ROLE_DEVICE)
+			ret = enable_eud(chip);
+		else if (path->curr_role == USB_ROLE_DEVICE)
+			ret = disable_eud(chip);
+
+		if (ret) {
+			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
+				str_enable_disable(role == USB_ROLE_DEVICE),
+				usb_role_string(role), ret);
+			return ret;
+		}
+	}
 
 	/* curr_role tracks the role from EUD's point of view */
 	path->curr_role = role;
@@ -434,6 +484,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -473,8 +525,12 @@ static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
-	if (chip->enabled)
+	mutex_lock(&chip->state_lock);
+	if (chip->enabled) {
 		disable_eud(chip);
+		chip->enabled = false;
+	}
+	mutex_unlock(&chip->state_lock);
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
-- 
2.34.1

