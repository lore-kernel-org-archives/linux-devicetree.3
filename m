Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629F423152
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676557; cv=none; b=iAMK8UVPxO6bh1RIOEzy8smqe6rOwmOobv+sErktj2lPMZDDaQL+MC7esTmX5WvPER683tnwo9doJ0llHSHm7ng2PBfgMERWSUM8u8S+RLgx3jdoc1hy/V0QqHBDifNA0ZVDPJn00DxysZcEzuedkNMF5GWaBO74OY9m+XZJ9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676557; c=relaxed/simple;
	bh=NIeHu4ozqMa2+nVCwY8xC2WGYPW1YAI9tEryx993GPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6M0tGtfOjl2TuLx9zGent5G7A+NwJJ/TjUxsx6iVPUpNQRLszNKytVLMvwmLo+/vSiCapyX+nkMQcI7gB0JM2KnYJN1YM4lgn27/F/z5NcBAfR+oNRgiFr6KhYJTHt0ROU8trV56xiDrZy6Nc75V3OgOQADvsP6agYs5Dl1Yf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bL/L3bOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWFJbpem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bL/L3bOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWFJbpem"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVj1G1393025
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=; b=bL/L3bOgrSl0SUcq
	lQEqlB+iqOC9qFHNrorGnj+JkNLwMJWNgI/XrlI0e6rQvSAlThP0qkwOYzT6RQz/
	fpbI046CpIjYssPBn8QiTCHG6mOpgtMqBf4ubp/k/hG8hGwjvTVNIdS9RzYbmIuT
	hfKSNOQUYPMJDFFjFk2LVHytPwFogQnPeBAOhHAw15DhafSYSbz34pcxnHESFmXm
	IPUKBwsawWtylaqhllU977WRafkl0Dlhaxn3GgcYLAVysdOWuk+IxLtK9YOzeNb8
	wASLSt6zLJU3xbz3rjBbw+dr5I4DDZNOn3E5NVWsTpOEhgUNNEDCwzP04XL7PRjk
	PaYx7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261nyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso106584001cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676554; x=1779281354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=LWFJbpemRgfyhvZ5o2Le+CDdvfRQ05zn97X/Ji/B6JGN602pcZKv/7yXsWJCI+e0Y2
         g8Y3lLB+F7hvPsIr30RH2+i6I1SIL4qVNPP/eqZ9Iw4Zq+sTtx22qiXBd3lhM02Kp1PG
         IHXoe5EA6Ziqc/3aS9afjljHf3XXDANSC2EQbKgT2mA0v3PY3ix6JJWxI6J+CzrUlc5F
         Wbm3NV2mhm7V9VyTXaKcis5vi54AiVMKHkKxZejRnW3rNNn5flcwkuuAKq0wZVtK4tvp
         p07AneOHFoXSC59FJiouuYpWbXh56r6dpDRWj0QiW7NOPZLj1exi0FUiktT/S/tn5FCV
         jnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676554; x=1779281354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=eFCKLSV8HGCfyaZHPpouNsOeKDfGOpr456d0SPRb0S/aMOxUc9dQg7oOkA43JAWgeY
         vrpHrSUIeSBuCK579+NyjihfMdYGlJq+aUKBtrHOeRMgIwke5XX5n7CWhttOiti0MX4d
         OaBsf0Wn7c2N13R8sqvd9fLSBnAvPMEsngs16BZc4BfNSNS/u8Sy+hZ85WRRZ8kvOtzJ
         t5qYHnGfx0B6n5susc3C+xlH5inwD8BUqIlRCceCkjqyRuGZeJaltN+kV8gnvJw5tC0e
         Ai4ayFwnKCa+KmIKxuysw2mm8j41PcUkrDFrTBdK7AE+vMwSqvA0Se6ss6OMKo16VaKy
         Htzg==
X-Forwarded-Encrypted: i=1; AFNElJ82mowegiN0FA1QGij+M0A0Yx+ImtAMml4bTnx52Ynv7lE+BZjH8qkM2/k0cwlpQI/ALafWmma0Fl+X@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdHgVZKJaDqONY0EHR/zu6K+JNoG+OeSox/LyTuR+oOQAfJg+
	cjX+XkGQ4boThVke74AyIug7ZsJWUurcwrTxa/EcGZRwOGrWGr94B1w6yemHpOoi/HNsFLg3UuK
	Y3VD0mKbsaxsRqqZdW5X4rfw4uR2BIZBOaZikGk/2NXN8fiYsEzmNdVlzunU+iAxg
X-Gm-Gg: Acq92OGYQYsmWBBxTy3/Z83f2R4rqJNZrAzXtFJQ2tMR47UREbeCYnX7kqtEpwB2Dyj
	fPlO23LFZkWGtqHNHgpSp5JekBO7PUbCYsU6CC3aUfv0FTDroXAWAHCjmo6RIid6oajmtCX8dSL
	+HxE8zQd4naOb1IseFLpS7DMe/+D3y77h/z7yWygd6zYR4rG3etqR5boFCCoz5byTSGn+jSf+I3
	Bz/P6WIPJclfDswlTkRJqIhLztrekRBQ8hQdiGhgGd1oKY46DJzjn0mTVhWbWC/3C3urjrNHqdn
	tm5VkJqO0rd0MkBhmQbhXa/rDf0Pe/PGJKnN11W4wrl1sIxXGkQgHkxfJ7aaQwF3rohQXnQBexG
	j7RkkSiA9DX0V2iBU4zOc20p3qOVXP3KKx1svZsSb0rQlDNzWdTORqp3FGkQu7Bhw2J33GF/vmw
	LKd/IAI+TXR15mVD0arAwaAmMvxDNBEm033OU=
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11792311cf.5.1778676554020;
        Wed, 13 May 2026 05:49:14 -0700 (PDT)
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11792121cf.5.1778676553532;
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:37 +0300
Subject: [PATCH v2 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-3-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLscP0l1MVnT4xK1wp0pdlXa59nnfC7acZl0q8c46eZ
 JJkcwjrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE1hpzMEwMfv/eYHtzd+CW
 Jf3Jzplib7v23XsaIDP19yUZFh+xPLf7pb99GL/rtAsF7pddkrjq7Of4z61rFeM4a+43z/329+u
 huqhfYayCE1wOetnGXC6rvTU9csbeG3qqIV3b2oIKk91KYq4scpt2q+9bSU2vYFbCnNOTMplUZv
 M8O2rV0KpySFrzb3ST4V3vA91JnF1uIRwuNU78Wcw8s66mXpJboWO+4DmX8XNtcaYLPyVCP089K
 1Cqtf3EnWCTVfqrWn09zouXhkq9fiRXIabefOuqg7Zt/pm9jmVvrnQdENro/urM93fhHg+4q37d
 eGazls+pdsqWi7wlQfN7vd884kg6YCU6uXqBALNipdVqAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04734b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX8m2Rm8WJVF7g
 xrgQ+dqKCfD21u3S6K83/wosir2m9Tk45/FSTR0OrdXqlUsjptFnUa5ql/HzFuIwDtty4FrlN19
 txf19+hnG+vg9MHeqjoRbmkXrz/hVuVRHlUgx3ofJTQnkPUXdjjOj2uwvTh5dRSSyy5Ras4anjs
 +IlFLCRyEQRlGWsyiJe7btLhUvDHfXCui9yP1PW4XE+ME/lzhPaXlWIlvwAvwToO9SbTsIxZESZ
 tbEAGfc4mhihU1pjrkX9lwePBXVlpx2DxG4WqwUCKJUWQruJkS/Watm0qV1q+l59ZKE9gLHgizg
 Tbb505Zby+47F8OY+o/kLKaAxp+G/GbzkRjDqNYhSbGvLz/48qJXdelu8UXStOBRnSo9bffNI6f
 AOmyJOHu/1e02leFMZboo+rQkUCchsYQRipcFEc0rRINUonmAkPl+qdbbSz6RmX4KW5ZofFKlvD
 FME6p8i62tWAUBOH2iA==
X-Proofpoint-ORIG-GUID: RPikz4sxMB9t0xO9Fe0Bi-V_ZKTJwi4D
X-Proofpoint-GUID: RPikz4sxMB9t0xO9Fe0Bi-V_ZKTJwi4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

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

