Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E03EB80D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039100; cv=none; b=eqBaFpR12LiLv2EQ99xQKy6RvPDG66kNEykxiYv1Cf1qvzmz7gDHMzwKpPpGBlf0CwCtB9XhThEoxO2xdgj+HWyj/Dl4tPFku7BADp5UKEyPr2j9LsRY/T1AkAfasqM0OIWcudfJ8o1QuiszlC69gpTCI6xpnmIGBqk27EFiL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039100; c=relaxed/simple;
	bh=zsfwswlQ3m1rrBxd+JimmXRbTnuQ2uja3PrneN8KEM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaCv51ausS1f98d7NG1hlliDyk8Gea5nIyvfkNdTKCZbMvtTF176hHf8W+GV1aqGn3pQTNsUFrxzbEaGN5s3VrWtUmFCHPSqK1jSKBX2cJ5QBvsoX+9WMLdtKuvR/nWEgZOt/sJeo5ajrjwvjb9sENMcsBWESpEUxv6mOdK82P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHLHMbt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKVeyyc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHLHMbt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKVeyyc+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317CcBJ3103857
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=; b=LHLHMbt64++b0jPN
	qRk2OPoqIuILPySzYubQPLUGDbuJXZ9cddiSWMpM+gV0eLVCGJ+7+f16qUxkJlNZ
	kpSIm7FnM+Tvi8xLx4onYo98lNPY2BtOQwtqfM1ZUVhjYoKaEkGOHeL3X4o4y8kf
	FIKPYPGoLPo1uJoEjxtXiHwZ/Js+Lwl2KUPRx3ie4I93AMKTf/1WLzXjMpLdGHz/
	xTQwQ220B3MghGK4WsTRXjtOm0ZGIhFCVXPiXp10IlX5HoljPLbIqsiMrtz5fm56
	3MTFczTByaw4wb1QGojEDc9uiH6rxVC3xn3DcyDU8ZjKBFx3w4Rn24TcNns5zzVz
	SXhF2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23uuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:24:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b15a3ccfso1199006a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039097; x=1775643897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=;
        b=OKVeyyc+1SQ4xEXWzOwNJ5/BCqMyEmhNDMSAd0SS/lzUFSdsQgnol5UtmFPIk+2YLP
         sdF2yEwYu2Q3c8zK6AYobYntuaRa2HRX/Ys5Rmqm/oU9nYpY+2qYnOy4sBpY84bbc+bf
         EauopNYmTxUarks8B/Z8Aj1km3G0TMtlONluaw0JzN3dxA7f8aYB/iM/bAg0TXsjxNk1
         OKn7YOzfuTjPTmb6DQtrupvl82PRVaB4bIr3/KX+lKjSJjaP17qrOddjCS46MX5s+8J9
         JLu6ISSYpmDneh16j/FBtzdn13QdVbY+1lzfLRXPJYjh8xR2zCEgTQ0KjAh+3aZ/ISWV
         oRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039097; x=1775643897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=;
        b=aKmVqNneu3yO2vHWGlC1SUcCvoVLMnxagYM5sb0laKd2XigH0yX0baFFMKBoA6yPqx
         L0AczDNrTZIj9xF5/adqdyaLilmt1zq8D29HgHgEdcNUTVmDbEicvTkyLBvYoywE4zIn
         +q7cYlkaWvBRLL73amRQ2wkm8HH9ZLQC1zaT/R3uzCWd3q7MH1mIikPXOuDrwEj2PFIj
         pTsezWuXkE56l3yEQ+Bceu/ITW4gZMVHT+Y3ejMSNN9nVZd63SYpiyaAUw77fe2hCePf
         30C/E/+SuS9G2L+Y3I2FJAWmvhgX2PEclkBPKRWVHhbx+DiZ9fj/Czt1kmkvFOSI/Ykq
         5rSw==
X-Forwarded-Encrypted: i=1; AJvYcCWJHj2KIGYmR61IZv+WAAW9jb8gpXJYhtHP7JfUQBjuogtfFEgCTkijrCn9ATQpfbIMXi+JKoXwd0+o@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4Goy7UqaDxKEusuC0HBSNa5mm4u+bsgBtiolL+BfRKmu0jr4
	Fs8jyfDaXTpnYokxRGinciBHDI1+x4WpZWuS73aI3HLtEWCBfI59ab4ZDcjA5xlFpLEjVoL1kkn
	HoGTRIsqF1bDB4lacjAsiwyaDJ/xXC6JG3xcVLJr44OeaHp9slE5mexYw56Yx8N7T
X-Gm-Gg: ATEYQzwPuCSrZYkvXGrqfvtYz8F5KC/6pzN6g0g78z5SaQzVoCAFhZ/4wprcFqevYbe
	J/7K60eRfgx9JZ24zkNQ7qEIAhfe60NeFAg6AZN41N3tDuwiPcf00O/3VcxNUdpBVyvETfrfvLD
	I2IbXTv/xlgB5VHzPO+xpxLAXlYpzI2TC9BF0Ul857r5svpvUYQisQcsLyFioHifHER+/sD0pcp
	aF7MAXB6o5FMJDWyiMaQ8ucCSnJxEP8ooOBN+Uq88LQMmgWyEYkFiPAIb/MYfDDzJBtTVk4Ou1Y
	Xjs502KeUrpUMJkGwC3+Lh1rtSw7pSMdKiE4UcUwVuNCtMThXN+rwVYXCTRgKwVrd/6WzK+ai7y
	wvdvTCsI3kW1VwGvA7HdoRWz/m/2dcW9I46Z9XYJDzcGDc0OHDLKRRHzW8bWP+DwNtynNso4u58
	qcXAZKS+L+S+f4FwRgDpFi
X-Received: by 2002:a05:6a00:2e94:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82ce88e809amr3176926b3a.5.1775039097542;
        Wed, 01 Apr 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e94:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82ce88e809amr3176885b3a.5.1775039096934;
        Wed, 01 Apr 2026 03:24:56 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:56 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:39 +0800
Subject: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=3442;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=zsfwswlQ3m1rrBxd+JimmXRbTnuQ2uja3PrneN8KEM8=;
 b=ouAzJs/qhwyUO7AzX8pbS6btmScPc6Wi2z170U9E9YQVFG1WqjaOpBfMm03EQk/fS3WdMJ1zq
 5FH0SLqRy3DCkZqcWoIDgETqN5o1VG7xUQm2tgz8RFPUoiquoHFe+MC
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: _gZ7TxfFwY10vmvwsUp8D-qLcdtWO741
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccf27a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=41qbuk9xwJvO8P9Mh2cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfXww4zqZz3yTpY
 cc8FOZlVEJAEcXocYASe5OzHGUSBxk+Hp99n/QLa2iWGepUz64bPWAhGMOB5Zy5AwCVVAPjjes4
 OuQZf1LLoA9E2AL+C5NLOBb73vVSsd3vzBLGT1ecjMWSuq68xZb6qBuMNa5P8F02hdBqnK3ClJ+
 KoeIUddkstOZla+JJ9BgpRllrmM6JSBp/R76nzFvifz+RM9jiak0lizuHxaIUMbNO+dhrDfJK14
 4P95jcUpnRoJHcqKV/s2R6qU5V0M4vf1jbUYvoDiLCFOEHNWYdMY8YqGehdFW5KnGXrUQ0eIShf
 9BwrbeBNJKzO/QnEHaCVfcLAum7RSSR8p9cVR6cXP2rxbMwy7Q2rkaY7TTDFmeBZitv7qval51h
 OgUsZk94DR+Uku0Bs1JmpRuySvwb5GT6b29q1CgraEi88+YG6Jnb1RFFILP7Fn35kWH574oDPtb
 yRE0XHt434TMf6vOvPA==
X-Proofpoint-GUID: _gZ7TxfFwY10vmvwsUp8D-qLcdtWO741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010094

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_bse_hw_clock;
+
+	return 0;
+
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
+{
+	iris_vpu3_power_off_hardware(core);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+}
+
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
 {
 	bool handshake_done = false, handshake_busy = false;
@@ -268,6 +306,14 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
+const struct vpu_ops iris_vpu3_purwa_ops = {
+	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
+	.power_on_hw = iris_vpu3_purwa_power_on_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
+
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu3_purwa_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;

-- 
2.43.0

