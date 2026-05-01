Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A29421899
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655207; cv=none; b=Rm9TlVql9O3+vGPM8uIOSjFLO6T8Vlxk+P56t+N/cmMyLe0pVpRrLjqAqj/cSaYXTXQoUmxfImU5Y4Lo+ID0IjidogbI26S4CK2hHNzpwBZDIg2Zw+KydsvGCqSSZ641RvGkYfycQX2mfcDzw3EoNcTcAa7zqzUNp47Svekw538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655207; c=relaxed/simple;
	bh=2vWMBTTCgHzaxP8XjeM/vaujyh3P+bvBSvyTQjbeOZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PiPNYKexgJ80SECuqlkyGU0o/ZKcacLyiuxzCWD1QLO3qinICO/OO3nCS+JSLtaXVhTXSyOeiHAyA6j+peFGFJgi4bS0d0QDto/k61IY6jALafSKRA8RWC723b5XjrhO/eeEJBkhuO+tFrNn1s8A8EDzO6VTEjcKbDTzjHxv+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikgjItW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2krYwRt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikgjItW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2krYwRt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTZU4047696
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3CNdC0e3Md8
	bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=; b=ikgjItW07aAOUm0mwXkWQX+hQC1
	1h93JWUsEstk64rsmGIQgeffkxTYByDpa4hDgkCgWyvTZJHbc+JdQpH7U/f3p1jw
	OF3iHpM6nD6cD6Bzt3cQlwBWXF1Ck0FbUFWaHCUNb/sVYa5N49gGo2nN93JxCTxe
	9C3jfBuNp4655Yf0RrmFV1gHCooWTZ9xHaC5UK8wHXqL1inwpmh+5vRbX1kv9ykL
	Rog4Ywnqd1vdhwpg+2RbbbzXweEAYZq9HVG5MwE1Bsfmc/M83YMovulcSdacL7Lb
	S+c9RLNya8XMg2Bd4yAcJDxH1PzFEtYXxjKfi76rafe6JfYj26R+FNIERcQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7wuvxgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c35f2c09dso2904972c88.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655201; x=1778260001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CNdC0e3Md8bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=;
        b=b2krYwRteki3UnSlDXo/Z4Xmd4KFtIN/a/tYM7oAfOD1/ZIHSFA4mpAd3Iadf1chVI
         g2hGZW32NJt60+3n4IpxyLp0Lw8LiN7ZgUvVYFeo3F0DWUGvIyH6X15EROJF0u7Tyw3q
         Q24FywsQ0F7DlcFiyZwjNGnDoilNwnN2+KqyuKv5YC1h5x9opRDjV7aky+zRJbk7syxu
         gZmC1H6Osdvs9uwkOZv+TOIOVP2CIsL6r3BdpBtEv1PUvQf53UjNTqDqAswYXUh97Z5R
         Kpmg9bLqXZG9YDPGKXnlnQ78S5WmjuBdfCvmCGdrpfPA8sEjTfqo+HoKZNz2B7L9HkhR
         h2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655201; x=1778260001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CNdC0e3Md8bYeWXZIY6PP7X3JYtt0X4YEwWO24BnJQ=;
        b=kaT8Zi2Hrzd5zUqNtyvdAD6NW22OjkQ3Mf90A/4F+HNiZGx7xQZcaXejQ52uH5zSkM
         V42dYJw0uVKsLksCDs05Ldp5weoLtfheZEbkq+EXAJpNegOt8r1yWD9rlLdjkvLBEb6p
         pwSM1XK2XUxmYFFxWXurBfFARvgxwoe4MTafDuSgKt3SF7j0YZOcKyHqBmug42ukMb6m
         yX9xq4yUYRfNSuuKOsQGfia7AKRdjHqHOoBiruH6hiZuTIHWQUa6VjbcH5OpOtvPC9oT
         fTC6OGpHwjLEeA58a4estcEtn7alYyHn0QXun2wr+CWhifX80xJP3qDkkE9LQTvLRdkI
         ITQw==
X-Forwarded-Encrypted: i=1; AFNElJ8JT0vwkvTHFtqlKV99HaXF280nrIivm4qN4VWcnNX4bqsRTrbLEvQ8/oop2S1CG9zqxd0GMCiPcL0y@vger.kernel.org
X-Gm-Message-State: AOJu0YyMT7vyW4UxmmBewTBzaM18yTI8FsmbI4WYMxNcB6HH+1gVUb2k
	xFQtVfd5NkthP2c6CcLtBDaLq7+oZbYvvEVqcgAX4ScPvmam/om4qf/kNb+lY0EX2cIeuDk1Snm
	r3yZMGkpapXnokkB8sV7Ujz5ISKc3ITzHQV7ryvLbfH1nHxznPt85ze6v/jiTSqho
X-Gm-Gg: AeBDiesrg4BmNGr2GlYhvEX72P1M3lag2fDapKXOXdM/F+0cN7n+BtZvkCjIudpHYaK
	/Try+MnXSNwE3gQdGvZe8DUTtLiqJsfBiEHcOymyp8YUeUu4MqMO2gMDlfEG7uDBRMs6oT4AP+6
	U7RyIXxJeHH/r45z9bweIgT4BolTs2T4c+6MvcjEEQlbZUpGsxK7zT6lR3oe/lRmxgPKglOm5w+
	Mkvl+wtyc2go5HdGTq9z5UKHlsBfeHTcniTNZrhCp54rs5GZW/lMW/E5xRqUWmBj/gqpn3eADeG
	SV8R6wk5t9KR94OvpwfbBEwr66yD3+DQBXyqc2Z91xK6b4RFcIQOW89lPnYPBkDZ3oyUvU9cNar
	Zl6NgufU1g6wiC5W0B5VbEZ01e6+cGGYxvRtvNyCg7Rp6VeQQeYrYjN5D3HA6SrWO9kUvVnQCjZ
	TMX8oOGiqPiA==
X-Received: by 2002:a05:7022:eac3:b0:12d:b654:8176 with SMTP id a92af1059eb24-12dfd7ae517mr78333c88.1.1777655201326;
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
X-Received: by 2002:a05:7022:eac3:b0:12d:b654:8176 with SMTP id a92af1059eb24-12dfd7ae517mr78298c88.1.1777655200583;
        Fri, 01 May 2026 10:06:40 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:40 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Fri,  1 May 2026 10:06:30 -0700
Message-Id: <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX6up5yS+vap39
 4ic6QU5pen+fgOHTAPk3recKFco7iro+Iv3pd46AcCqLcelKRhxFDPI4lSp0I5Jzx0a0RazTVFW
 /XuZuw8B7qBi+BUeX9iQI9jQ6oT/q94xilzLyOT+HJ98j+mD4FBPQnHVoNfhNxcg3ErfVmuA824
 XiPKTID324N1XgAAv16dzkvYiACabCES0ix3QMf/s1Tvn9jusPDtmHd+y0blGY4lbkxSdp5k9tr
 HeVrPCOf+gMrMb24MUCcq/AbpHxRQi6jKklFa0yAL6rsxSqwdBu1QiQ/LevVUgD5n9slzQbb3c+
 RHooz/4BuU3m4KnFu/2Ae66Hazu+0LNBStO4XVwSuHlOvv0myAoTutyhDG6ZR4PczDZHZw2QPGt
 nyGV9LT+uYm/XmKskjCbUqdTPKYykBdGWJgqIK67APVxq60C5IroseJqYJl2ozctWhLEgJSYzQ7
 7dcUyAqrFWZ/JO2kLDw==
X-Proofpoint-ORIG-GUID: u5c9T3f2j4xiYw4s6X7WbMxih7zMkrLu
X-Proofpoint-GUID: u5c9T3f2j4xiYw4s6X7WbMxih7zMkrLu
X-Authority-Analysis: v=2.4 cv=GMk41ONK c=1 sm=1 tr=0 ts=69f4dda2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3maAJ9QWEdykmXBQECEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010168

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 89 +++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a624c44d5d59..7fbb74bf1599 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -274,12 +277,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -290,15 +296,36 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
-	usb_role_switch_put(chip->role_sw);
+	path->curr_role = role;
+
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc;
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
 	u32 path_num;
@@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 				     "failed to get controller node for path %u\n", path_num);
 
 	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
-	of_node_put(controller_node);
-
-	if (IS_ERR(path->phy))
+	if (IS_ERR(path->phy)) {
+		of_node_put(controller_node);
 		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
 				     "failed to get PHY for path %d\n", path_num);
+	}
+
+	path->curr_role = USB_ROLE_NONE;
+
+	/* Fetch controller role switch if it is role switch capable */
+	if (of_property_read_bool(controller_node, "usb-role-switch")) {
+		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+		if (!sw) {
+			of_node_put(controller_node);
+			return dev_err_probe(chip->dev, -EPROBE_DEFER,
+					     "Failed to get controller role switch for path %d\n",
+					     path_num);
+		}
+		path->controller_sw = sw;
+	}
+
+	of_node_put(controller_node);
+
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
 
 	chip->paths[path_num] = path;
 
@@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
 	if (!chip->paths[0])
 		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return ret;
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1

