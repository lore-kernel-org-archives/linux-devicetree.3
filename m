Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB87481ABB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845703; cv=none; b=pHrcuThxcc7mTYVVriAsMFVly2xYrTd1g+BbAxcz/dV90f3AU55Xk+8bmL6m4gexnwrfKg3heqRamLkaLTSZ4eVyZ6XxrqX9yYZD752of29vOuhznQ68mmRJy1VT/lxe1is+bjHfrB7uJxiknvQ6sDbHl3wWOvZQ8jswVNacETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845703; c=relaxed/simple;
	bh=NIeHu4ozqMa2+nVCwY8xC2WGYPW1YAI9tEryx993GPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVwzjOXa/7/3dPi2M88X4K+TI52lbxpJydqFIE6fa3eDJ/UcdGBO2gF5GLEXwi7hkrfhey0nRL/zliawaRl7K6f+8Yi3x4ajVLvWSXxdu1w8Z2DE1ZiyIuM3SPOV0z225s1PJ+cQv6gCY0y+m8WtVKE7BynQtM43NiB3TcfVkDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn1iwfn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAwX6BC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn1iwfn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAwX6BC4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBVFJf4022529
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=; b=fn1iwfn817mkcyyF
	OyIvxwfSxErPuUBQn/iGAhBvT+DoGrh2RixQSD8krZHCV+x6Q2Eqy0OJ/hsiCBkV
	zho8Zq1Gs5x8H5SnaSLmA5KS7ro/WJdWta9ZPKJgJZFfjQaUceqpjIsutbXM38Dw
	8lKWVvfI+MynyhJ4kKwlXg/mNG+kkaMnUbQJQi2JfbflpAkmwHwHnsBgITqiDjk2
	v6NK1Clw+dCxo2pkhWrfuySqaZsd+OvqGpRuEHnI8bq2iTvnKbWntRHb5U892NFA
	lGv5Jm3Pe2mMtcAk/IAnzr5g5S56DfrE1p2CWycJvypxVS9H06jbWqDYrajcKZfQ
	uSdi1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru3w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so113706011cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845695; x=1779450495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=HAwX6BC4r3cZazlr1uZ+oFMQbjEC04NSjEvZl6Sk1gT6B0GO4lFa8JyxEu9415fjvE
         ZdEZ8H6DrHM0+QY6rLmFopFnmW73pGXOxIvnDsR4jYt9iGVydqQbnpOi848/aE2GeSZp
         K1cjG6zXsfJxVD+wZGGvZ1Lzff3El1oWk+PmIdm+gKuS/03EPq4BlA+uU7PuAAuU49dO
         G37vXs6RTqX5C8ybZgNQiCvRjF9Ads15s/KwNot8KYmL8BHDVlwIp6Vq/x8MqKLuKS03
         Hfhic6iYqXwMGWACZXM6StmWbR0s9dGXruyi+rxo9wPhI3PRzfmaziSgEPh623zkFV8x
         QjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845695; x=1779450495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=QRJ1kKQn/FympDFtiWV6qy1hkzE61APHMrrFzOchIsVFcOavVTVsvZ7UJuGlmc1kT0
         /FLSzUvAcP25YKVveoBVFxZbGrtZK1sYqwhy58HtH3HO7DcYsj2LyrcvmslQ24C6JIrl
         Iolj1EGyCwvfDNE2zx3biBOHVTVobp/Uger25tbsEt5CbRn3SGLxRROLrdG5hTnN9Mf+
         OFXz+IKkK+88V4bbMNNVpx7YMZBQLW5+n99Srdcf935Kci5ZSjjCQfqN/FFhal+93zL6
         TIT9XUiJu2auQgr4VyyjUxLjDJ4gEEYmkuuV64Q33hlV8OhZnFOoHQIm6IxvTpM3nlIJ
         canw==
X-Forwarded-Encrypted: i=1; AFNElJ9uht0Xyd0ri+fjslzSJVc7/ubXDaUFJHbHDpiOVjJTzHkT3bhI2gK0cPjPyndh6bX+PZud9HKs54VR@vger.kernel.org
X-Gm-Message-State: AOJu0YwpK1/zixmQCb5TkzhuE3lkjVlKgLGGfxHkZVnes1/6sadTsVie
	NM4q2trsav6wvZ57ub/Nx93pk+7ST7E4WboL4TTPy0o8CDMB4r8hGl7VDhyjkbQLlg7/dYWpK+U
	QzjDAOMHU78B02LAWR/lGqX7aoMOJfYsmvgRqWmZdYoH5Wd6ib6HSV8H8IcURalgQ
X-Gm-Gg: Acq92OHNeX/ALNAhyvD8sQFRQtV9LwTcu6wnGWBVjwhfCcRfHRey65StpRM67CBoqMI
	vI/IHbj+Vj48Nv7r+KncGv9Xgru/DuL6OxfN4H6TO8IBN8gN4QtYWKcenztjychyq5tuEB2zD/l
	YrzWiAFnCNq3hvNzP4XnZjqsXugdrC+Ug9OnM4Zq9kFZPvoTCVe/RSvAJ3mjWJKU89oDCCJRyP1
	r5S+r0FzSIg6AEKjJa6rwkQrH1FtqAouDxfAjmYFxPrfSX7OpXjBpsVqGmQT8SWA7FnRWVoAtPs
	XQ/HNKeA5FLJEcgO/Kdl8zLgefZgEt3XTU7bvU3D/Pwo9+CzZWYF7ybjawKrtcu0sHB95Nq4cWe
	22EVjQNVO4VKGPoQfVWuGjMqkqifypBv/xDyDNhDtSu++4T0bfAKLbDeruz2NK29lB5Uud2blAS
	UdtlJzm0bnJVicOHrSR/BRtu28amVwQTUnEW0=
X-Received: by 2002:ac8:7c4b:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5165a022a0emr48351711cf.14.1778845695438;
        Fri, 15 May 2026 04:48:15 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:50f:b978:82e9 with SMTP id d75a77b69052e-5165a022a0emr48351271cf.14.1778845694953;
        Fri, 15 May 2026 04:48:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:02 +0300
Subject: [PATCH v3 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-3-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yjv3YSjey6H8VPHigK1PHGPXENr2QgLaW8YDZ/WLE3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0grR79YTEqtux1xHVvJisDhvDATyliQ8BX
 e93M8/CNXOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1ULSB/41CiUjd7G1MgpWsJcX+OdLldopRQ5Rh+PTUoHjmFyuqnK/BmFC9JIH+yEBGPamigEzZgN
 0Pt/qD0PYq0GK3spYRduyeZAzTTEUGmhWrfY69mdLoFGgQDUCPRr4pSuJYwGTltu30TEzspmqQP
 aXRoWQf8oAzH1165C3M/dr2Eg/01ZbDYc8HvQhZQMzVytpDGfi0PwwOc4tRNE2dWeA93a0z/56f
 7LeFpCqexk6RzqnWPYU7+ODQ8Pdzv8ofPxy9BXtzoIyfy3fnkJYVnt7q2N1wU6TgK9VGx+7RpNO
 pw5VDy+j8IqVIeW2QG5yEYqdPcAntfGy/aHcrtJXMybLYP+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5pEbS8TpC-IoFXAPywBW_QtCIRU0-0VP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX/5j6U2y1VKqK
 F5xECoqvzc8KnQvra/aD30TI/QZcRST3AnT5awJdCh8XvdoNYgiHDhuRX4Eet+5xJYFE9v+eumK
 qAirYHfaAfYBcfNEge1kJ4qNg+t+MB3mg8xY4NGfsKzWO8izzl9y28nRIYM7an/GvkGZPItI8Xv
 dtIUO64d4PGSVLm2O0S94iZO/Az6wKuXv/XRt002rYMHKMHsri+ZpdBYqteGxSQ9p1o0kU1OnRG
 TXC6DMG8SF1uExW8aF5MsmVIs1j39g13d4CcetvsjEwF9DEdnMTicCVveg7ab9hlcKYDrT8Nfgn
 a4xzG9Qn1G9/2WXQlUnXrq7eewHRzYteeJzEJnhJHgRqU+XxErupjx/7IWJTEM9l4pltOSj2S3W
 3cnqJnNKDZNkix8XA8A31byYVSNmmeCpoPmq8BGXTsneBT1KLub09ZwlfenMEP66clqrWUm5vbU
 xS0rQqJGgW/Vh99OHAQ==
X-Proofpoint-ORIG-GUID: 5pEbS8TpC-IoFXAPywBW_QtCIRU0-0VP
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070800 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 01ef40f38957..d61902c9a213 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..ff0070c85ccf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

