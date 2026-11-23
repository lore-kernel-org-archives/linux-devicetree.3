Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458539;
	b=J44UKgYhEFYpvYDQKFC7vV0acYOEmqAT4nEORqwBJftDmVCXm11SGvjpr4eWvbGXopEp
	 Qpjmsy8EDI879Mu+50gKQhofzH2HQA4iX0B0kxZS4T7KYZzbWDd01wEQ/BB1mPeb2jH2i
	 x61YJ9onHmokb6ldGgn6feOHfDto5OMsoissncN4D68NNIloTQOjYosgg9y9Q+Wzelhgm
	 7NVPHUmYTTUEEydc0YL/WPiicZCNkie8PqikANo5Xx7n3n33GgRZ+EXRRHN3Ccsu2gCtN
	 FaMyxgOxHnGsDZJZgWpuvPUmsv2y7XR8cQlBfhqq0xllhM0Gm6/a+NEZuGSqr7PfeXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
	b=B5KTs23yorR98IZpSYIubn9irSBHHLq84StfB8W/wpgGjw8yeB76QDdGpZruG1Q6iiVi
	 mZYNaf0timksCiaJgTA/E7CMr3rs34/T1/lOLfijAIwarTRVCrBKH7hFkoPCEFEyZvopS
	 7uB3zVG1SdSgAGH+myzUGHE4ahpdxFn1WN0t4Q/DMTdDYL9qtpX/7jpbZomXX1UT1+jcs
	 S2eYAjHBQxjXbvg4sUtCo1vx4YfaK+LUGT40KXeGH2uTIsD7esm95N5h0exoEWdxSTpxW
	 H/n7awW9p/uZFDut+gMPDolKwP1ngNctGLqDZzyUVqLIzwYG6CgyTbYS+5Uow6fWsoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ox9I/lp4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMxIRIos;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778460A2626
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9778460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ox9I/lp4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMxIRIos
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGs5j846532
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/JIMNzd1d/P
	nQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=; b=Ox9I/lp4PWHFSxmIOZ+GxV80YH8
	7L99/xEhj0cdIP3C68Qaqbe/rqXO9+uEBnPJp3TyGRk+jlLHF0tgI79ttKvpKrSF
	iSAMOIS88CZG/K8DlfoOcb4FzijuTaS0JBnA/5CDuaC6dxezDfMv22+xwhFfqKmX
	rmm2ZEI7NceGgaPomiNnLZky5IZadDA+755q8QX2y0r5dPHmPFdVlEhCUTAegAwv
	EZBgokAVzZ+Dvpc+eSflfYhQt4cyPpmibAszRB36NRL5NGfpNqfBHJEDVF8mm4Cz
	yVwLKg2xHd7vDwsQHPQFP6Jxa1YMqMv7/cTKeUvIIPnYH4Ol19KhNoL9oLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742uup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a7af8b94so1636610eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458537; x=1796063337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=LMxIRIosMCjDuYCROLVgnVnLXB9cVntONOsD75/0Lebvd3lUkioSkCq9Jhbuqt0z/k
         2TfA6I1xay9oVqfOgv/iSGbWemrVMgbW6Sm3gcg5i/vgDqzeAENWNO6Gpz/yJX0L7z2q
         Yo2ceG4/wBDmiBA2hZJ+nc03eVO0ztjp5dN5iiXf9BpcuoZXZyTyknBB1wrDjzpFbkBK
         VTodmr/V4mESGdB7tKu0+j3wxXSDcUBFI4qdfEtNqPCa88eMvqK/sAy7GWB6R1mGVDKm
         vWm+N3WmArjTz2fCf2c0vmwIV9SjCOOgQC9iX8ZYTXkOXVX+2cWEuJZ7wke6dRisZXSR
         7oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458537; x=1796063337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JIMNzd1d/PnQF2mlgIJ7k4900jCYz2iwph5AnTrVXE=;
        b=ZB8Vn6/mdRuyx93KoR1r/Z7qT/JPRPqjd3m4BjRLWHoG1lPIPgvyoqf7Gq3fyTMRXm
         KutKSO8oRDW4uxTY0X6DR+sZslKCXK9F235/YTZUDcDQNc0j0FwHroQYitU45QjXDg+6
         I7F82ont0Tef1Y1ETpWj8Zx6NwHytXFTXexpQYoWXzRmglspIrVwl8ALpFaiZQ7qm3o0
         o45IlEBjnNVRhn9Sa3WFQ7ciCJQ52Xq3Op22lSVmU7CSPcG4QJCwNKfKcG5Dg/S4Lfur
         TH691oajs2t0xPT8Mr4ZiSz7OV0VbbCpNYKa7gJZgkRIj1vwcu3G+bhrRxOMmhwrfp+3
         +9RA==
X-Forwarded-Encrypted: i=1; AL+hErHytYLeEZ+gxU/B9xDEEPctWnD2kVgqTgyzL2zjDE0oGCLSwwxBIf8JebHuF8AplFSjAqt3uZHFuzFL@vger.kernel.org
X-Gm-Message-State: APuU4Z+hLnWIdNxkiKx6Ai3pBmmCG/RT3U381W7J9ycnX1XsxTXerAda
	PC0WzFT941CF60ozA8CQhFugGpoGIP+PJxNsTcXfKzpFdDBaEYKLaVucMjP5PwCItwd09jeFWPg
	dFgQLJPhQGQVYq4Vrt4babWYLh+JhpQEo4yVCEO6rbj5SPPZC1EGHSgVk/SzesyR8
X-Gm-Gg: AZFdTZcmcwoiPd3S4SGjDk21qqhNjyw4CAT0vq0zxMGxitVIJxepIf5875DgKrJL3hO
	fz5jp516QfCvU3wXlILjVyXbvXX5Bk7De9XlcHouklkxu/eGvjKDk08tMmdJxDxksxHeEzhq8Qs
	6h40y/IwzAmHqiFOt2lH1dNhu1wRKZEBrL/AJPRuuFxojjs7DlfRrHcLBaWvdz2leJBdVoVtAiO
	oPjsjr6k0APE/vPC3YeylJxQce/hHaQPHZ/6zTvJ6Xf5VGP8ZquJAz/AEAOMFBME18UdgMiL5SR
	eqRqQvZdcHev1N0AdczvGh9HT9HMd0DoS30686u0/EsmxmpBSkAVQZP5+VXNzVxO+zYpajVWhg8
	uW366E9alDLYZU608cU87JGAYMLksC7RYmz3jpnF+PJFvD+BDPRF9LMqyvQ22NY9bsK4rRtrOsS
	RS6IvPxh6c92HKH2ITSfcyzGIxgQ==
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795679eec.22.1795458536466;
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr14795656eec.22.1795458535965;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 6/7] usb: misc: qcom_eud: add role-based EUD control
Date: Mon, 23 Nov 2026 10:28:46 -0800
Message-Id: <20261123182847.143892-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iKtg1F-2j4JQdgrySLj3zsO_i46CsTnf
X-Proofpoint-ORIG-GUID: iKtg1F-2j4JQdgrySLj3zsO_i46CsTnf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX6zi675Pfn/CF
 BBzomF8WhJf10OTMlOdmP9jHXQIw5uOFtshLKAgVEaAmAoDxNqNQLCoWwIRABkGWracbhBlhFLc
 5c0CAnPeSV4IKvtwErsUYLFTieRju5M=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0485e9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX3yrEj5PVN8Vy
 euRgaANHItSrIy1s2myQip+51nTjK66AW8QPHg3ibtXM9IhS7cbamMHmfOOWGzmyGd9BuTsuBqP
 l9Bq7UvDISCHb6b2Rwh6SoQjuXoRjkddebGaFiiXB7FoZPtpKdRuRlNBxMvHg+zx60xgBgpqpbL
 7dONvY2txoLPseK8ttJ/uz+fXZaAgU4gJenyMD3yjTYdYm44cVP8THPpXfM7VUGi2HLSrpf3uGN
 mEWd1BKkrQ3t/Lbz0pKE9cXt7s5KscZGznGJJ1Qv/+IgvIl3/2OlNj3oaO9g6oOhv8vkDXn2tvj
 MavRemVso3RCiTinu8NBIKkt3z9qBB/iOtELGccY8y/jOuQnBpJRHRZk0PUoq713h0yeYW1dRkc
 3HP3JG3GjvgMUKmYIKUoaY0u85+muw4BMGwhGd1uNCl3dYnAz0iOol3KcuyiPnGkLsk7Y/vXHXw
 91FbrSlO0oPLbPJDD2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

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
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 9f26231b6648..b434b0447613 100644
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
@@ -57,6 +58,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -158,17 +161,33 @@ static ssize_t enable_store(struct device *dev,
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
@@ -206,6 +225,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -287,14 +308,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
-	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
-	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
-	if (ret)
-		dev_err(chip->dev, "failed to set role switch\n");
+	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		if (chip->usb_attached)
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
+		else
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		if (ret)
+			dev_err(chip->dev, "failed to set role switch\n");
+	}
 
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
@@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
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
@@ -439,6 +487,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -485,8 +535,12 @@ static void eud_remove(struct platform_device *pdev)
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

