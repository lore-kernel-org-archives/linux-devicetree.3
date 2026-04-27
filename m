Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F63E275B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311350; cv=none; b=oridR4AVz/vbnciNQrCPi0HVZYAuJGYV1DaVASbn5+b4guoKoZJmHC5qbHdC1cJFz1miTM78yfUtnHfySTAQxZ7CGbSkmRUBWzYhpgbjXvlQV1vw+mxvuGsySuvTtkp77cqoLdaT5pEXx2LJAlz07t7S7lKYlhETC38odEF1XAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311350; c=relaxed/simple;
	bh=EC3OzX+vlwTXZBvlIcPgyWjHlhMJkLSif/QwxZigrFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ8kkNJe6aXzadPt5dJwNYktAlKuuM+QohmUBwUfRrF6cT8DmWPSJo2HyYcLSjeZwcdhQxgdokHegeUuxp5/aYPTqsjnOdkpJPYGxvVAjWWhMZm1kvCansBvXIAeyY/21ZxHTgamVgfljWgGZm6puWt/GiCVlydSLcK6Avw7hoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBKosTeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/Rqkd6o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBKosTeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/Rqkd6o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RE9ZSm2913909
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=; b=QBKosTeOF71N9QCt
	kLy1Efm3v4kFG1+wh8nkNK/kyONRsZ4ZbzHnfXfaLDMkcJKzDiF3b1XvZGzqzs1r
	85Zbj1DDir05ZpezCuH5kpZEX18cmOpIwQHSAuzYFX8p4kBVCcy4izHAFjRttx4p
	OLktxLV0QltuiBGEVbonzR0iTGZk0UsQ122K+7WXxX+n+nGL+qw5c4JdCSFKqzBY
	m+Kyq+EgrM/7b6GBSXhRBhdOkKs7keHAPP4VQl+rHBhC/baj0vZKK+QpjP/t1Bfy
	gG4DV4ITl5TpQidR94hNWp87dvZaMvqQD+CA30l4/GfH+W9rE2oQZ0WIMDYVqFOP
	0pI4zQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjmhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24af7ca99so144250775ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311344; x=1777916144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=;
        b=Q/Rqkd6oEKSpjtHhzSn2iaLC/Dd+NmWW+ZMEh49W7Xx3yvmRVDSjHuy8KfNZjgVvth
         YaGv/KmuTh7t7niz+SYFp7JuEtwwttnyC7BeqMiv09KRyKfBekolvYTZn/EoZsFChzQV
         IIgIncZzHshyav85VfkSLZimFuDQZLQaLuXETvESBAJhBCJl9v+bNjn0lF5ztGeQIODb
         VbJNIZdhwAOU4caCX6rNYRkJgX1H9k1bRSdyulfnCNBkzP7TfVVoB5tYfox94fc/H3mN
         VfrkHxa8dkes856iWcfkAa2QppaqtHmejEn0vznyvKjdOUKD0vLH0mvCQhMWUru47zhL
         GjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311344; x=1777916144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxZRWFWfF2A2YEPPEjNfyo8rVBY3ZeJbdzkncV/rJ3s=;
        b=P/7GxDSfLsnBPgAuvIMYmx5WYKYdUJJsvl/rkFimmBi5GRkoIJ6E9YoAEcCQUOa79K
         ebgQWq4qXRB95wElXJxB7stFeED9fhTuAYTuBfsWcyjOruhClH2UoG0TKybykKiqq2SV
         ee9cG3mzqQLO7h5e2UzWFAuAHV4fEmufvOdHrZ50IwYLNNIKGAbAKuIB7dz+zMQdc5QT
         dnvvYNz0qxspMhhzMMA0VzKnOlm55zA1GJcXmTq/XlYJZcFtTL5FhUZ7fnQdZ741stki
         6UDvVnNm+TsOgNi0XLLDjE+OFGyrRV/pUHumOeARd2lAne25gUVc1KKpF1v03cKhPXl7
         EIQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7Ds06CxQx8PBOPPJ+jfQR/bHIKT7lgGhvaqB45/X4Lg+VzOwgyMD1f+ofARvsobV66nmjQNqeAQlp@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUZ1cdvS+Fr6XF3vpjV+/CrH7LVyoyOa/3M+42+bsWZ93uy4J
	M003xGvgf6gFSY/PbchNiu8stR7WwQungTb2s++t705SrDdv3/wv15yEz+PM5MgonWOJa+eIZo9
	bhjl/kUi4y76ewDqBo+j5Kq6f6QWaAt24mPwdtyuWXGqyzAYkTSC878ZsoHt0U/XU
X-Gm-Gg: AeBDies66JOM7s2x7XSAxWNYBDjdITU7wUbQ5MVIRDAYfPhK1WCAYK3Kw7wIuKCPCG4
	jGkZLFEnY+2jLkY6z/mg0mfPHo22iIDWfBeiyaO5YNsK99IShc3WHmmi6FBYf0/ubhvB16rxxQR
	JTybpCMDxyxyUiyCUlNHGOmElG1kXGYqLN9y5BQCracRPFl0zxqIrKbgdXP7PkXgT8iJWR0KfNa
	dtKRmuMl5Csf6OTo7wQsJqIezwWE2Xp339cTMFb11tkEd+6HIGxt+68ZxfXNCMnxhMqxoVYC9hQ
	WjSZjoOEQuHndfGULboTyDf2Zl7Idcjz/WlV0jQ4etOmpcwnAdji5ZCymPyCvPV1uZcCBTK/19P
	mLM8d8Qa5HGpxcNKzO+35Y41/ALv+PV0YL/zrZbDr0USTX/fHvUJGmBaL6aWi2v63UKgF
X-Received: by 2002:a17:902:d701:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b97a78f4d7mr1241705ad.3.1777311343930;
        Mon, 27 Apr 2026 10:35:43 -0700 (PDT)
X-Received: by 2002:a17:902:d701:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b97a78f4d7mr1241385ad.3.1777311343260;
        Mon, 27 Apr 2026 10:35:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:35:42 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:43 +0530
Subject: [PATCH v21 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-3-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=6644;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EC3OzX+vlwTXZBvlIcPgyWjHlhMJkLSif/QwxZigrFk=;
 b=v35u8Vt9MgTrbyAf/bRq2etw0DetCOIumFaOM7bzxAKqnOpnWiOGSWotj3nmrczUNvz4EL1BJ
 duqswEM53jlASaft5eijjxAoyI6ICnmXloH3LZyieplndeuH8v5S8Wm
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: _lkl_PAJwzoQmG9oyOvX2D88t8JKyETJ
X-Proofpoint-ORIG-GUID: _lkl_PAJwzoQmG9oyOvX2D88t8JKyETJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX5nEqdges+U/3
 ygPcW9VmpjkFWn4O/DPDHcxZ+PVff6H4SNPDJK4m9+YAM9aj8U8HVI3xR/Z8HDr5E5/kdv4BADL
 WuQ/qbGTfyzmcsghvroM+9KTWVEN4KZHKA4q1zgClHkj4+amcThZczqEpXRpWA83mlgFhK7bbiS
 3pebLKRb8YXZTCA9pbBgCnFYGmN2YzuIKYCLCti3TGWRBVAghWPhS8+fGOb+LLXzgWfzkqkhsQG
 jgwTUtX56o2jBbddEtYIjeSvqMys537kPOdG4R+ddgBwFQogv6RobbInZ+/P8B7I4AYhuggg+Ow
 8jwWMTMJgN04B0MMUqi0TT4T73XDGHvZjPx5wLeJxxEYncor/JGte2J4Rz5jtfA8RTzT7UNmait
 odkVe+GA3cBha85SjXjKTw1OkHFNp2CQNa2aKPgRmsgIdRLCQLqFmf5K5AHCrevTyFTnDf5c1JO
 J6Lmms7VSEer81tpplA==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef9e71 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z8KYaV7TWDb2btNTYxwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 66 ++++++++++++++++++++------------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  8 ++++
 5 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index bd05d660490c686b43134f82f1eadd7665403d20..83a8d80fd7d1ccb1b736aee5f2d675246a63b8f8 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -53,6 +53,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..9d0e3fc621a6173438c6da4cce38394199451881 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -73,6 +73,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index f1372dc700e48043320812c3d3619ab1539e1854..a84f7c67a4746d4d5c932d4df018aae10bd5518c 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,12 +20,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 struct reboot_mode_sysfs_data {
 	struct device *reboot_mode_device;
 	struct list_head head;
@@ -116,6 +110,33 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static int reboot_mode_add_mode(struct reboot_mode_driver *reboot,
+				const char *mode, u64 magic,
+				const char *name)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name(%s): too short!\n", name);
+		return -EINVAL;
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return -ENOMEM;
+	}
+
+	info->magic = magic;
+	list_add_tail(&info->list, &reboot->head);
+
+	return 0;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -180,9 +201,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -194,26 +217,20 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
+		ret = reboot_mode_add_mode(reboot, prop->name + len,
+					   REBOOT_MODE_MAGIC(magic[0], magic[1]),
+					   prop->name);
+		if (ret)
 			goto error;
-		}
+	}
 
-		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
+predefined_modes:
+	list_for_each_entry(info, &reboot->predefined_modes, list) {
+		ret = reboot_mode_add_mode(reboot, info->mode,
+					   info->magic,
+					   info->mode);
+		if (ret)
 			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
-			goto error;
-		}
-
-		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -226,7 +243,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..0218b71541a0cefe1534e306f956ae51ea9ee870 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -48,6 +48,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..f4518528fcc1fac49209de91cec7e050088ef8ec 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -15,9 +15,17 @@
 /* Get 32 bit arg2 from 64 bit magic */
 #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1

