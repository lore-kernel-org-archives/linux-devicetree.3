Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458537;
	b=akbRgWudl6llNUrX/nqD+s6R/kdHtLehI3MWbFjeqvAPV8khxlTie2m82PEDonV/xk7F
	 OOUIhaUfiZj1B39xj9r/6kpiokPKbn9n1P4h7QpLCnaCBCyx4SuJ65RZZp3CWIrUmHX6O
	 mSS3lEXwqA8WVRzE5PiZriOjweYzkoVNlt1LlrcqyKCliQsJCt/Uh8ScTcEzPAI4COzDg
	 FNBxxw7qubM7SjDHR4VsVw0j8OLcz3k/BIyMqTNKvP4qwK7SbgDiXGUCQCoISuoPIFQQd
	 231WNz0rv8HADi6J79mEibHuL8gceh+6Hu/aMKGkvALWt5ri5SJnuwE8EyVlWcmiS+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
	b=T4O8+sm9vtEOovp1czcdWMN+FXcQ+HN+hp9/ht5A4pkx1qquG9aWeKDh2LM/geVQyBbO
	 q/m4LZlB1HTc0p0RlbXRFd2sujX8aDcv5OTLCWMmMpm3KLIzSYMxCnwShnVGmd1y2EgKo
	 w66FDt9em3aiJAMyUNnW9y4U7d7uvynTuGEzTCd+TdjQ9q1nejNqehy2/1lKSZS4nlLKv
	 +MoMUOL1Iz/wmXvypp1nOCX+ECyyuV0CkWR82OaiMP+rkJcKFrbdW8RH/vOJbhJtSRfuF
	 RIXc8SP1DMfhA8eo+rg+mMgY3IUPgKVGTSg9AoBzqeMxOWfDgL5pVu5ut8V1qMFdlMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+1jT3ii;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QppwnUDk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E8606A682
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4E8606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+1jT3ii;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QppwnUDk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1I52844425
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aa7OB9HEV8D
	+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=; b=D+1jT3iifaVHiQAkCPuNCBnVaZq
	K+khS3asIjvpXDEoJ38583Pwk491KA9v9PPudCxmYkC+mW+A2kqgVxme3FF24dB5
	ZBFtpbl3bUGvdaPs+9Kx/FWN14xll1nUHTQIyqFVIXiNeaQijkmrY9XfbD6KW/mN
	mwQ2qqPZwy9S1Dig4i0cJNHxbDmySlBm9bq2G7/Toty4q8JAJQasNIBxyl6oaKln
	lMotTdxigcmspQ87TUr3LhvNV9xJvdsnBjlTthXBE5m7DUx5mCdM+DDIof2TmTze
	y8whsIbfQ2aEEQQyFwIBDfwJA6Vlo4FURGyPPbc2m/jjXtI0dOYE0Q4cVGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2v0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so9766240eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458534; x=1796063334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
        b=QppwnUDkS5f9AEL5lm6M5g+/YJjmA/eLFTUzaRAztqRRUUPYPJHggUSkaZJza/cG9I
         P2pNwYAnTRIDOD/W6R+4lP5uUMANaIjoxwePuRjZFMi2AREN+rVh2Sktb48KyzaGbn1q
         fMFB1+OuwODfdEMEhuLCjq4md1yxG26GFzB6HPSR6GzdCv84XK8045tSTbDD+Lduv0bP
         LxasFJGQWPuHSkmU957TbwrIwief1q/fjcew8qnl3qkGLNVC0aOK9UIn0W1DlqnkIUPY
         SqH6KuWd/C0pvJaSd6hDb1dhXWjlwyOJ0sVA7LQIpEV08APGQYr95F7UAz1jZqQjT6mI
         IAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458534; x=1796063334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aa7OB9HEV8D+Gu4UfkUF0JaU4DkwJz3OCjuYsIDpC3s=;
        b=lLk+9FTdO613IVU21S6rq8ODpJljQMSfmBvcS2V2DNED7+oJN2jL0DQDdDthyuxOrk
         sRSLakhT6bH7yTqC3Jvl4I3AeS7z3ncrznfeLxapV5SJKKodGB40/61Mf/pfonarNrqL
         mHpc29Wv9SEjr+Xzi2x8+QXoqZHoIZ7JeGSyyqQn2w8EEkS2w4TIxUNaXT7zfTnZxtfs
         fXCR/HM8oOqEQIU7ul9O4mWpegh5XPxsZ7ehk7gICPm+R3QWQ6BipWN6/Mmetf9CNQGa
         x0M29ZmAOseMScHT6YiEBQWzk0rfgea96k7igxhrPSynMzJg3QeriBmSIlDeTttQe8Mt
         jvZQ==
X-Forwarded-Encrypted: i=1; AL+hErFL4dW7v8/g4J8T1se5oNFNzh9ujS/H1WWXoNxSMYZR/Gow6kj1dveOgY8UFco/6MCO/Q4H67QjUC/N@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Y6jdn757KCeSjQ9xt+xERm2LOt47wXbvac+kZVjlM5XdPL1o
	nJyfHeKx7rNeJj/e4FMUaxOpLUBd1e0yDS7nunPpLiiUuB5FEGYR8MEVt9yULXw3+m8UWTLolDD
	cG0eXO0610b11WYFEhq9kQUV1ptfUZAnHo+pZsSIy9YRxDGOhZFgIUih4JeQjyNIH
X-Gm-Gg: AZFdTZe4gkaR6YksYn2DBvEKAUg/YUTm8nBQczKM4V4qiBivxhPLyu0E/Htnwf+GSNg
	MbPyHH7Vs1I6xAmSGoEqpPVMId3D5OUbG4ujpiKwTA3wXsYRkvnsXYAPBXdLM6OnJ4QAR7MAlLF
	wcxwlYrNB3VwkGvO8SIatoD/CBzpmgyUrGMRwY0M7/293mM/nA70QvmwQKVPs0Yv31yx400cCvY
	Kp41gdK4rwWIS84NvV259LJoD7hbMhflgHTvvTqJWp9tlsVbkefl8hACQIF7IWA9LbqMvMcPG3j
	WczyCXFyIwKA345UV/JvtpIakcwm2lggGnvEKBPwk+1h2irLKOwQnOqav8x0idI3ZuFH8ZwIjdZ
	gTwfGiVg2ymzKxsZsAgOWThG8s6402d8SAeYAOOs8Z5qT/nBbNSTYF1WER3Ym5r5gSZdNLLRQNG
	f1S1718KYbRqxHRn1tghQ40JQkpg==
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr13527198eec.9.1795458534278;
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr13527176eec.9.1795458533724;
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch support
Date: Mon, 23 Nov 2026 10:28:44 -0800
Message-Id: <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX1gqgSBfu+vhc
 kaJnSDEwydTkStn8pEcGQUC/2DqhF+fekTT7omzWy77CWp2xXV4yDh0EGYpHO/U3Si82P7ZRNKl
 QhLGh0c4Cr6Y5EVQiMKko3W1a86D3/k=
X-Proofpoint-GUID: NRPiijxrmCPXlHfffyW8b5gPy32PYfi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX4mVqdPF1WONd
 29q8EPoCmCIHe164u3hFKsSgrHGEKIn0bdERFak1TyD/4YAZDj3m8W3aj6rHH6avbrUlLmMwdSR
 51abqOuOFKgqqzlzM32sBxFqmamvxXD+TfHk11hXgOImHB14qvW+P23APDItUNoswpuPlDciZZZ
 Gjt36CUWXRJKiEJ8DSBNy8jBbw70EottjW+dVadzVQjmWTYoHbgPsgh6Fz8Zg0GLh7AIjOqnQ99
 2Xz/uJ5ItUVb7eOPbKEtbyeOHF0aCMX4cmS18UpHNiOUDjr8atr57Qj+sFDX3BNnlHITeHi5JG8
 5hYA6HvPqWYoEr4UUJy33fsrWTCFfTMyn3dg3AsVduvtCj2kASqvU855zjYIUsUzaAkb2gGFNeE
 73jMIlN2R7FXsV4LHYYm/kbuQmdmI6l/I4WW7cCFK8IFA3PWxNiDjRBYPCVXAan5G0a7PBfgDEt
 Ud2FgdW5MmNH1g7AMzQ==
X-Proofpoint-ORIG-GUID: NRPiijxrmCPXlHfffyW8b5gPy32PYfi4
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0485e7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KEXfGuhMotGc95kIUyEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

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

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 107 +++++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 037b074318a5..2304402fc90d 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -45,12 +45,16 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	struct device_node	*np;
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
@@ -124,7 +128,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -271,12 +275,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
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
 
@@ -287,17 +294,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* curr_role tracks the role from EUD's point of view */
+	path->curr_role = role;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
-	usb_role_switch_put(chip->role_sw);
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
+	of_node_put(path->np);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {NULL};
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
+	const char *dr_mode = "";
 	u32 path_num;
 	int ret;
 
@@ -328,14 +359,61 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
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
 
 	chip->paths[path_num] = path;
 
+	of_property_read_string(controller_node, "dr_mode", &dr_mode);
+
+	/* No role switch needed for fixed role controllers */
+	if (!strcmp(dr_mode, "host")) {
+		path->curr_role = USB_ROLE_HOST;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	if (!strcmp(dr_mode, "peripheral")) {
+		path->curr_role = USB_ROLE_DEVICE;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	path->curr_role = USB_ROLE_NONE;
+
+	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+	if (!sw) {
+		of_node_put(controller_node);
+		return dev_err_probe(chip->dev, -EPROBE_DEFER,
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+	}
+	path->controller_sw = sw;
+
+	of_node_put(controller_node);
+
+	path->np = of_node_get(np);
+	role_sw_desc.fwnode = of_fwnode_handle(path->np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		of_node_put(path->np);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -352,15 +430,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
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

