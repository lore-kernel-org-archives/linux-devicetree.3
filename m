Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C53126BF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604535; cv=none; b=TmuIE8f7lK299wSCqR4kzLSXQSxCgDP7ScYwnFLet1000r/kxjxfRjZbPdTm8/pYxMx0gwyech/fRgkP443nMmhfpaSKFFDRNyQd7+fuQlXaUlyKiAtBcWnKVw6iRitGx5HQL4VoDUa0SwJez4uEhRTYxKNAb473Z+xpkWIec0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604535; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKEYModnaBOJyrmtv8VBJqdTuSMue//12fDi2h0z8kw/0a9GEBiS5TWYqEGRMkVfIbJPWAps3BtfU8UX0JjE1X0uJv9UT3roOQXKCsCIUIvmEDOIpxH4Xt4xLjsW7xP6xorAQfJGPscTErfElW1/7XXoKkeHsJ+4tewnoz/5mkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESCveSmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIcmx78V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESCveSmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIcmx78V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DdhHr1930354
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=ESCveSmDD7kS6hwR
	I45kXnHodLGoxr+aTTQjbFv/xgGo0hrXEheMHq7d8Ugc3VrGjcsEL9YnI68khvQX
	HJrMB93i+Th3Opf8mZpORyJl83BSp8dsd8b1XAJIw+Mh9xnaYR8EzbPzzvWUZYIA
	Y9ug3CFnH3qKYtly4docwRLxH+QuqKamyRgyrGhtdMKqyNfQlRKwHj0prQjuxHjN
	gyI4Zggj2n+l/boSdbxwyRWUfJ1Zygyb9bbudEWZFa1bAovmtSFtYuXaXXxdev7j
	pL2Q6FE+w9ZSNaaTVWrLmtb9DE/yrdc3AwcYyNlSc05Ohd5U+p3svgyAY/8EO/GU
	CuI5Ww==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg09w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso247633137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604532; x=1784209332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=hIcmx78VfN4inSFJkFVE95b+0+lkIQZoeAud/Ay2k+moIgt0u+fBTRnxZeYGdit2fA
         6uNXThN2mVqN1j2k+HDe68BaJzad+nvStSs2lNh2Kbd673A4WBGed0RiQgP7Q5XTApZM
         xwdPEo9gbdyrEtlnfPXJGaTcVaiPLJ7OT4wz4l6SF2622q9qJvA4jRnVGADTcO3IDYQn
         sTsFQd+izTHC3aI+eSP26o61NnbpzHpv5HvQOh9dYNQW7f7Nn8N0ZiLdt5GssC/lTUJ9
         1vjHpe86f2HPujmuQJz9E9aGQAmWgA0FETfo9o/lsDVeIrab0AxvpgSVETRAedJ5KX8r
         WWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604532; x=1784209332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=BCSDENpJi1ECiygkh3w3lVNDTmrd3N4BOnoAjFfG8T3oKlhLvZ6sB+OveP3a3W8NZ8
         TY/NJUCL8XUfLZfjVStFDqI9rIFlWiV5rzBZMmfu8LoQYYjkdZfYiDuO+IHJbGDlx5aw
         yammjFYC+JgiO0llbNtPkbx6ASQvsWXQgLatwGkfu+4cD+6UvfPA0f2dm0jFoEwKGeTD
         9JZgYqQISvFJ9MY6uPsNlJoYBISPaFliQ0MxKwpTezQAgoGrYWgj6Rd0sgD5bh2WDRf+
         cH6/bkcvvFZG6HmtXcBgtFXI+ZG/rDtpAspP6QAcuyrC/j61x0OVm3cj+B1e8amYxjfV
         jzNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6BxXKia3o8JA6+u5VfUxVNEf0Y/SIWwWBmiqcJXdm9N4lQSqHuF0eL+FUc/JtgxQVUWe5eeBgS3/r@vger.kernel.org
X-Gm-Message-State: AOJu0YxmxcK8Wh7DNLVU5XMgx7ah1CiD9vBbi0deYOyNokBEJ8Rdwffe
	VY9BPg1EUcnhs9ZA5YTjFj5iu4IUn4RPOWd8ogNlZsd/NqvgsQbuGeNbh+6OAcfV9+cNWhXaXxC
	YPtUcSWGZ2cBos5YgPjxAInilYcUcDiFIpPtrIh6lIHh27jnHwnCwjsUM0rhy5HwU
X-Gm-Gg: AfdE7clCFlG7V7+FUgB4JfUyAR1BgRrKJhEbY/PWFhDDzijSTVLT2HIrH9/aEVRnXNF
	z6NgdrlL3jdDFgZqC5bjRQcUtisgMOLv/8EqfMJKwn6jv/kY3qjquh4T6AY/eY333TkjsGe7X2h
	7wV9Iif9gQu8lsoQKBopwrT1l/fWR3KGtHSLqWB5axUslN00x94mAZRSasqxAbiMBJkYoqFS9Gc
	rsDeUOkY8Q7/BwHTj9DjcmgH4npwIQszJHuMC0mQGJmodv3uzhJpPMNPpGsFtcFNodIKvTPLINk
	WgyEwj47secdgYar1DuU6jquVW374oyJk0oi4jku2BTRmbhRCGzPuj/f2b91W9hW3oBhM1AVEVk
	l2LDWcTElg+6p0VCUQXLDnEKDlgudxNkTHQXOqQXBSaFkKWAoHU6g5NBLkP9gdAOYiHcdkTGnxb
	epqchXtOcVUsZEpA3SBo+92q9B
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686461137.1.1783604532078;
        Thu, 09 Jul 2026 06:42:12 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686423137.1.1783604531438;
        Thu, 09 Jul 2026 06:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:56 +0300
Subject: [PATCH v7 05/18] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-5-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UksKFRgIX9Lp+8E0Hywq+my3Nx4lnQEZ72s
 drlAdiRqgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1cMNB/9CYfpwvPpAQTZSLJYikhT5r9Xf2JcNfNqTPaoBCR4RYDhT5jdRW2YdM5QhLnGe5YLVTAL
 TuwcJSCZx6bcZX3Zjapk415QZfec3lG/VAyqjXry2uhWytNqCfOOzx4gd+i3P5EsPZBK802z8GE
 ADjnM8cVN4p2F93gNZRyWSPXYjDrBlc8lG+0MQYv48bFzYSC7p8jFjFld7hHA1fQWf4X48GPLGC
 FfDkSh9PJsgkX2XlRs2M7fTtVX6nzw7chpXDanr9Pc7JMqZDttGGzSNYtLWUogfecXLW2+F5vjQ
 bfayvt/OtjZMumNbLMpLKwE7TOsADbBMhG3ebhiWMURmNKes
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXxTgGz0wXYij9
 LjDJoKERyVVwYIWkqSvK8hrpRGNJlpn07M367UjAZPscGdex4QzXTpVP5+oIQGTqSqMwHmIyGwF
 B/igFY6NFT2R9iqk6wkHPvEl8zJgRp2YHLDauIOp/0OiNHdqUf3lXVe058AQCJXkKOq5Utlgkqa
 61w8+LAAwn/hA1rp5zQs2vi8kLcj/Qqm1vqwP38xI2oOobLPlzu/lHwQcKo3mS7mbgck3eCtots
 IOClBnOPgNbwaUxhIETQ91NgWlGx/DHWq/elRRqyQ1fJmL4rWmoJoVXqXFS/mdGsIjljBopUZA4
 glwF7fPoRQrXehQvLqzeKo5KNQLMr40g7+nzS6dm394m/2DK9/+IgZAHDIsNatrfYG+UR4e7Mtq
 L0CYoIITgxHCa1JF7574hrujPQ5lG1ckZM7ZOkz80quruLzNsFRiYqS5yUs2Z1+kww1ICt7WUTM
 5rshc4o+a8OSVuae4WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8knwb1uEO+sh
 /wFnAvLmwaI6KEcuHH61wRbbl1YRIzwQngaXbZtp3J0hHClSnfPu5KMwK3Uaa4NUZQkqZ2lhZx1
 SKOkU5wec7NJhPCPXy2y0Beq087AYV0=
X-Proofpoint-GUID: BUIg8k1GMSEe7GBhNvmM9KmQuUxx2IKv
X-Proofpoint-ORIG-GUID: BUIg8k1GMSEe7GBhNvmM9KmQuUxx2IKv
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fa534 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

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
index b8714dcbad10..2dc121a3f5e8 100644
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
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
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

