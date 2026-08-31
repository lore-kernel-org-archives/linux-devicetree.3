Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301E3B0AC6
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145320; cv=none; b=AS9RD7QULSe7il6YcWfsQZgPkIGHyv0poB4Wm+m9vbgantDLdrGDvP6SZjy3RV+/x2+9P5fRJCEjemOsWIzjIHSIzHbX3+/vEhJV5F6b3cQH32pAYcWpnvXTPyseHoUzmuX999jd1a1DHHWp4cDVEbc48fkOME5wc8DFkuqT7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145320; c=relaxed/simple;
	bh=nkS4OyzZOkgIJyCEgiO8DDdg0IqU+H1YgFT9CPkNXic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BblkX5lrghwECv+63RTNS6MhpOs3SJNAWbgKZ0Si5dA7BgCNq+UByuXmwFh1a7PJNPxalxH1zMBGOhqhAjvJPgx1VL5z7WBTdSWTCOGimvRCPNNLPq3SaxvTWFpxlBRLc/51k79GvyH4S/f9nWzmDiGh21vt6LdtNJ5QSyfA+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c22JV5Qy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUFM+lVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c22JV5Qy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUFM+lVz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bc5L3239077
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2sd7Yaq8LYK
	WFa1rNtDRDd8+anZIsb0dma1UriPcrYE=; b=c22JV5QysiJEVOEhystbX8L70W2
	OgRPd8povQemCwVhC5uBBA7BRH5lHfLBZ7nES0IVJ5BP5dS0uRNZJBVceVRu5qOx
	xC3iLDG0W9HZ4m9Vr2sLQLtku1ZYyeaf08JhhDiwcTwSDESvcf4M2cC1y1bPcPqD
	lI+Vn2W2RQfmV0YYB1rJscTobFTBNsdJuRR0u0GyKYOKx5XWhWqBpWsr/4/HCUBO
	Rm8DAW9H8CY/5aTw9BYZ50+9ULtwly+zGNC05iqr0TI8sgpLVB2Ar/NnGVuwyDrS
	6pZL6UGcFjgmOqSDdGX2fFZXSMqUmsxGBFv/Mr98cQKbBLY9RnKxn+pbmCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0k3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4413524a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145316; x=1788750116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sd7Yaq8LYKWFa1rNtDRDd8+anZIsb0dma1UriPcrYE=;
        b=IUFM+lVzMD8HpOcDhoHtGarNmspj1ksANA2hRm/01ALC9pU43kaFw9p9/bH4Gd6G9k
         rrBdvMmoiLUA45eyxB1SKb1avukRix6uh7tINwtDicD+G1s9j0cBnOdcGXL75OYbiwuD
         mZecXNgwr+TS1hsAZuVO1zHLRR6DSp0TDqv676QCJF5Q9lz7DYJB6Zn/q6vrsWCLh6vM
         /zguMf8TFEa/PT4P2QjmR0S+Gi/+WXCq9SGff7F4PXeEjnVcSNNmlN+BdaN060vdaT3e
         vaFqkkNtQXtYs2ApmSBquJ2hUwyFHqyP8qo94nz41o8tiUNRCEuZoGEfNkYX0/qdDFY2
         GcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145316; x=1788750116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sd7Yaq8LYKWFa1rNtDRDd8+anZIsb0dma1UriPcrYE=;
        b=cJebAyeixGPbItDEDk9P7sQM0KUkptU2dnw9lmJcl5oL2zbHnDft2dDjt/+26LXUmI
         Bhd6fKdQrmEr2zw+rnZPXSZlODF64+f4KLc3w4r3V9otYixRwF+SFrJPkKtsSmeX885d
         Oy8ey69GFJVLAzZKCzIv7rgK0ZVL9tGzj5W6aXpRxrhBDpjS3lWGD2KsQU5usssVVf0M
         sW4iYxgc4bcSLaKZvep0z+662VvRlDjEdljk00haBEqM4EG3rI1YS8CduFjgmGGxW1A3
         c4VRgS4Ls1AcGt14tslXowakhUHDJ1/RPSXqO2jmWfBEtAgtb0OCZs+vRPBLW/I+f9CA
         /rRg==
X-Forwarded-Encrypted: i=1; AKwUvBzvuic362peAQE3de3OBabeCEsHVmVL6ydFw09XTTIXWw9mnhTBMcUx580SoSryZiWkiqAsMas5HbuI@vger.kernel.org
X-Gm-Message-State: AFuF++mUB+mDk70s4aI3sYDbmrdxM0Ee8uhsVb4DZUjBVKU+yXxyFBkW
	7FNA08sgNuJ+Tgc/FJoB88DaLjZP9mX3BLfPP7mkUH7PJS/Ji28nslrpIoL3xv5GNXOU1/P+Kpy
	1Bae6Y3sX+BowhB0SrJHGHJ8EnYvdJoi9BcMmkc/EtIM0XrvRsmjsCSQAPtrnJ8yY
X-Gm-Gg: AYBFou3RMsoMMsHWPmJhnYM/wO8StZc57nZ80peZg/MgeXPBOAoajQMArFdJ/kvvaPY
	yYs09f58NmeUKaSk+ux2KCYLgtZLlFId3LHNaVUWwkyfMtphaJ1zxRiu96lmjuQbdPK+PoU2dFn
	Pk8lnC9J6iQjj8KayfgxOZeAtDN3SUZBqrU5Y0H9xIcP35zCPgS97NI+v/qm5w1xaVMNXf5zomd
	JnppX/0aMVw+UM3NEq24arDdVZSQ0qD0n7B/vKUsfQQSo2r3em7LNHcjzl7iFtDJI1yfDggusmu
	5Yiuz56Fz6gUwPgLkEK1tEBSrvpVfrz5h58M0IHOOxlmx+kO2Qkmx73nSVcakw7O8ZRjtpyw328
	6noEYg7R9O3q+gPpK4pKlTEFosOngFyegBbAuckag+vtmIU6raB4W+w==
X-Received: by 2002:a17:90b:57c8:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-3989bd54c5cmr21269523a91.23.1788145316067;
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:57c8:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-3989bd54c5cmr21269337a91.23.1788145314998;
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Sun, 30 Aug 2026 20:01:45 -0700
Message-Id: <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a94eea4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4GSD5CdKrKcBI9kQVZUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX92CuIFEG+aZW
 87XszSqqsJR1Mzgvczx2ja8YWZKFtej968w71k7vcryUSZi6f3Hb5isGZ/DxcIuCf+XB6FoyAYb
 0Xj3kJ/pJ7izEW1rFnxKMS/KbszyDS8w4viwbfDQczwoxDDh4Yzu4jUyTKLqpQBvYdigz4q5aZ3
 ak0IQ65vMjNV8fxyipaybdFSjWcXdD69MrMo7LjNRlJ33POkqBlnZ1/JwJ0dcMHrUeEj+7MiVwh
 i2ugB614z1btPZzUKtvbFC5LlSEtmCc9A3nUNHnF4VXOk2ePSdBoUiE8UyYxZAritm3+MGdK+un
 hgI/euQxQ/Ub2s+4ifthBIO4hh4r0NzW1oUX1tpShl4BYM9jBE2hmsxsiUv1i9IKex5FEJREZbK
 wOLGj8cOrRRd9Og8wmLe0hrE9Vb/LQmvEiC3Hr+s7l6+Z8mm/TNoxlQCdZ1akdIAESWbkFWLQKY
 vM7+Ey4iS1Wxz9ohTWg==
X-Proofpoint-ORIG-GUID: JHlC4Bug4vzEZW74vD13fB_1tkD4GemI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX7y5w44T6Jcp/
 Rsy8rwhsuUlIDKfDctOE5seHTbosihZKd8HKd1qj2Tm6gY5CL33EaxrQ1L2teo5JCwC2Rcn3lEr
 nCy5b6ARCFJM5P8PPOCWaQwX8fmKnpc=
X-Proofpoint-GUID: JHlC4Bug4vzEZW74vD13fB_1tkD4GemI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

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

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 46 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 07522225a8f8..549c0d852bbb 100644
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
@@ -304,7 +323,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
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
 
 	/* Forward the role request to the USB controller */
 	ret = usb_role_switch_set_role(path->controller_sw, role);
@@ -433,6 +475,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	for_each_child_of_node_scoped(np, child) {
 		ret = eud_init_path(chip, child);
 		if (ret)
-- 
2.34.1

