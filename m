Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7133D4E2
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671879; cv=none; b=iFKb0ul5iRJ0WaF+/KQ1nh65ZdrwOCI2VghBxoctvxge1O8VBmhsqVD2JWraCSCEuxrApWgJConCmDcORXrSs0c779ugJk1JO01fXGU9+k5gHyisMWPV8OU1pVa2p1BDOxkrQjkHSK0ODUqDCDjiJgcQFtlXvIEvABbLVRbH9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671879; c=relaxed/simple;
	bh=4n6dn6i/Lbu50iXsvDsgw2Z2Ze680qElqnviOJCdZSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZDmQ0sSbwt3+0wWm4gCBlSTVGz5vfMQguLynoEq11Cp72tcG1AyM4dVawWeApgc+BcUpP1bdO4ikZSrsEijNog8CPQREAcUNNJSDFN3EVpXQXQ+s74xQHfRo6zjuBSx1Lldwb4hXBDDeJwicr6PsjOJQJX4wIUmTEsVUOIzvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHm9k3kN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJb8Tiqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHm9k3kN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJb8Tiqo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTatC833770
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=; b=YHm9k3kNWakKHhnE
	Z4x6wgnmFW5Odg5EaYa+576N4YBrw138wwPFe8HRCahc4cNu7gM6C5ijeekkdetH
	tibkIATVDK2YDj0iTq/oV376rwS9jo0jzlQt8QTFAvCphy63ogwMw6BBIxD7i60/
	CzlNYuC8O5su/4IjkajWN0nkZefg+k35F91Tl7v+JynATmYLQWEwLaeVHUqeisZ0
	BMcOCvh4AOKoSpS4r/8pc1PgglGPLcVye5Yq3ANNY9hhOY+B2VW5zBy2R/JWo2lA
	6lKKzWHScwRwbTHWSX0oKjjorjFU9ve0Q3ckGVtCBQqbtrQ0WtwB3zECa0tx60GN
	WZAKsA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevheb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422f987f2eso8558724b3a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 21:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671870; x=1782276670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=;
        b=dJb8Tiqo4og0I8NqCCXs0UhkSxBy3eCVABPgotMIsnzfT9ZDFo/HySBmriZ63lM5WK
         uK7lIG9urZXNMznpgvay4BHxPDB8soPULOHysDy4PsVlLsp30MuvYHHAxykHOiXQdv35
         quXM8MZxLwSsp/48d6bOhSr7QFMnowZkMnjixXAgCFLha4VmXNUf0+6iTvQbhJBEeT3c
         N2V1QhsjkBp4+kjye021RPHj09L1Wu6jUYpAVr5kTfx2EYZHWTpxcjw1ys7+CwsLdivP
         QpVX0i7/O38jgp/sJfcu55D5OknIiiGazOhyMNq8A3WScHhGsgfVFO9QK76tPyVAYMgj
         vesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671870; x=1782276670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YVvmntp7p1nnGPLLGkWWmVa56JfsmVkcCJ2HQy83Gc=;
        b=oF7tPDk5436h+u6YyW/SzKkyIJKbbGme70Q9PXZqulJdgfa15g33qawiXSFwITXHF0
         nzCQsgsnwStJml9uvrhJ+upiXovyhqW5xlvk7J3UBxpelKdSJ1g4kTGd3smN6oMKU25o
         MkQ4GNN6mCg5eu8As+XPEr4OvX7w6p26Ks4W2gIZJViY4x5/bRYFshuyZerm77vJFbzP
         16f2zMLJ2O3RxeVfAZ48hP8CPKpusHeN8Bozw6o2HG9SczYhOLnpTBeOsyNnHY2dDp1V
         4fzkMJuzr8iG0d+zFgbPQr1Sdqt3K/cNx8SGjjDyxeZyCsq0NGMAj393WpcSV5x3/SFm
         S+nw==
X-Forwarded-Encrypted: i=1; AFNElJ8b9ycW9ixUc2pfgZYBYx3wxvX0LM7t2qwtxoxrPUZdpBrUR8G4xGZu3yQF2UMLv1bnnQxku4IGwWr1@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrMXeg8E6OV69Ka2Rc0REZqZV6g13NVR9oG1Rycp/z1dx3KsV
	0qIPtMLwKFcWySb1kmOulPLrY785Gl11q4XFUY8nHra4MvoPxnZoGTDKwe5naiAHhqrU1KQNMhR
	3tVTXVdqnW8ebN3O+uQgc4gCLAan1Ng57XwRFMx1hxht+PNcGZ+MHbcTG39P1WwGh
X-Gm-Gg: Acq92OFr2qGlbLmkCwdIoC0mfO59iSw2KZmLicL4p8Sd60SeyIQNtjQUXuLqhlOBr2A
	M+59DUrTtrO/EnC+kwfZVj4x/AHEgjOl/L/0K2E/CeD4nMMqk05QaG6WFag0rBIvKQBUZrAiV8A
	lmO+rd967kt7SEAbVtRr8cJpY6HMa7ZbdyvryFZZWtYmpyf7pz5K50u/dqP4Cp2D4vqbwcexWJF
	ILRxKmgrZKwE3OhPV/UWWVl/bL/+eLHboWVqOOnMLJ7w+Kuk9GUNUe5IIgcdntszJBI7XSLHbJg
	/23lhMstMTsFZQV57m+cNQfHIKgDiyGLM82m9hocL8PWBRbrYj2Zw+XFr69c47R+isPbQrg0Weg
	cBcVAR6Imq3SIXsWo+v71zmTAfFHK+rEGJB9VYmxZovvF
X-Received: by 2002:aa7:88cd:0:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-84524555db7mr2246693b3a.23.1781671869606;
        Tue, 16 Jun 2026 21:51:09 -0700 (PDT)
X-Received: by 2002:aa7:88cd:0:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-84524555db7mr2246666b3a.23.1781671869060;
        Tue, 16 Jun 2026 21:51:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:51:08 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:20 +0530
Subject: [PATCH v7 6/6] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-6-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=5789;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=4n6dn6i/Lbu50iXsvDsgw2Z2Ze680qElqnviOJCdZSg=;
 b=gXxIqPWNVLPpuiR7m1MmYY5CjS9pZ7DlPrDZ4nZW/XzeqwFJ8yzykR5HFK2L8beTLwMUL+0wz
 5krujsqnq8GB3+FYDwzmKCW/YQSjLvADOq5mcqmjy4ntgefwCtsihHn
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX5FjfVTqtPyxn
 1UxnxqkhnCWg16H8qAl5VaC1X28XUq9UaqqHlI2g/oWYdzzOFD2aKkxq7d2cLE/F6fxZSSGEgk7
 AjsBakrw5XFK+3+PqIhWc2fP4ePu5GIRgN+7etQ6G1mWCGn5g4rTeWV+GFEb0Vt/arrKRSXbGC4
 QJu2ARobLBrk4m5BINeNE50EA5btZvKoO6pNt4rdmJI6YY0Ko9KWHM3WeUepVf2IapzVRV+sSWP
 qCa6i/Yb6zwxHCjzrJS0/RqpQz1bxx1silDzpO4g+StNxKB4oYAxLLEVsbNrcKzZRAdSGhj5cRN
 EDMcOP+C9ZuUDyEue1Z74LSRmeMiTMTXuUaGqP21pB4NGjqTqVQalSVqPovHQa4+DVV8zpi/0KQ
 hvh76d/peLcdCUXaok2klLsChG9WsEomX+vdgJSA5v5iwokN4ZNuOOG81SYTq6LP9Y94nCI1WlZ
 j2AoF0HoRnXIstm6eOw==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3227be cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QliftMXiwahQIp-SbzD6HoKHGeLMgEma
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX+EI0z0sLe9W9
 onaoKA3rhN8op6x2g5x2PiaK/XJt4hzSj8tmt06VP+rEkFRuPt3iwCENShT+Kc7vJZATfRAbhxH
 A59QrdiTkWDHfl0CCm3TrAo2Oyri488=
X-Proofpoint-ORIG-GUID: QliftMXiwahQIp-SbzD6HoKHGeLMgEma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7
- Added Reviewed-by from konrad.

v3->v4:
- Added Acked-by tag.

V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 92cccb1cce69..96dbf04138be 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -80,6 +80,10 @@ enum geni_i2c_err_code {
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -200,8 +204,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -214,6 +219,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -919,7 +925,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1045,8 +1053,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1101,7 +1110,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1159,15 +1168,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -1175,12 +1186,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 
@@ -1220,11 +1233,25 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
-static const struct geni_i2c_desc geni_i2c = {};
+static const struct geni_i2c_desc geni_i2c = {
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
 
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI
@@ -1239,6 +1266,7 @@ MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

-- 
2.34.1

