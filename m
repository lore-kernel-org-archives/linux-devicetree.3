Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68D3BB9F8
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439077; cv=none; b=UQUVnUEvK90LvwO1fXslZAGTHp7mdtAPkshnf4wtx7RPtwaOBNdO+GszY702XpM+TK3DugLknREVPRGWpYy2MS7I7lBjVv6tsMZO/aXZfFvwOUbzKH+dSOra5Iga96S1S14iSgWjMh//hUZLKzdg7C4Ff7RUNdpN10QskQaPbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439077; c=relaxed/simple;
	bh=3ucCFxqVSmxwv3tYV7K9HtEXpSVQKpaawldrvOaRdUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+eU4wt50HH1pUDDvhiwJCjcdbJxNTr8XpbzhFdTUbPGEH7me0ZU+Rzkz+pBu5jpX6xqjrMuGyAL92z2d7zRXqYsmg+A8/NxlFfB3nyZKe9+IVyDjKWsy4p6RdAubCIc1JRw6ohnyRdp5XtDFFWbzXvJowDfDMmlcNYtuGYNz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvbwE15D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/AjUwFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvbwE15D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/AjUwFd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EU8nw1638466
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 22:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=; b=CvbwE15DcR4FVPNY
	ZTlRJ/94ycOQFhIpmvmufYfd6l5BOntLQQ6kZm3W73/a8Ngnab90TMvfT0Vd90hB
	WJfxX6lJFShIaSecHNZxVYldzuYypbo5tYnClU8T38WZ5kWyw5ZFcy40gpdmiYbc
	5bPabw8sIrei4+0+dO8Zo8ETuGqcD9XeVWQAYpX9CylU7HtHIBMJdIgFLm6ScO2u
	G5Rm4bM18F4vhVRcAGf2HrnVWRBz/fmoxhqEQsmXoqKYcyRAO989ZV/wtrK757kH
	7X3oYw6cj/rgS+k6IYbljBL49TIvJsL0bLa1JRXjwXkubSmUEK1Ve5B8GYKA93XP
	whYIqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1ckhxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:24:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so54268315ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439073; x=1781043873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=;
        b=P/AjUwFduwh2DcFlnfmwssU7UBrXx6y6zY9M/CcIRbP25mhrtaARjoGTl8+RWSqG56
         FT/uVlqs1IbGmdccUuf6BKcIdAgrBBvWrInYkqBkpOWz3Y3AyGVacYTVdbfA+TdVmX/w
         1MBJduq0pSoDGXhTKaAzQIphHjlS6wyrVSeNlsoaYT+g9+WRTSUcoJMvb+tXvwefLSo0
         TRSlAYvYG5B8soTOkJmrra/m8POmDMVGzUfvE7kM4SLhc2g09ApGO9lSKYLohtVmZaLN
         bJUQbrsOfWxsJ6K1dXCycbohqVA8KLGCUUeycweZRZ/5bdJ6IkrQ3aLU4Is45BWGrn+/
         42oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439073; x=1781043873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=;
        b=UXmY1lZOj+SQKZ8kBphUZHiwo7BicFmh2zJSt5vOz9cwl32pfsUXFjRLXUX78/WX5J
         9UpdVGjn4yWvrZSIzTyrBjktyfHKmG1Dxbomb9e13d58jA0MEaQRuRwwqiGyyrx2pLH6
         k45QrqC9sABFGZ3LBQKVofzfTv+V2wVI1tQR/X5t9RlHEJazbcAFQNZJH+bNaZvu2xXT
         RsuZ+AFiV930HpgX3Lunc9P95gfm6yx1vDsusJPAXO9uBrKziv5pHDDAL7vwXWuIcVTG
         O9zhB/aYQUK3bYFGcAzy+fy3X3dtub4LxQsrSQIaYqItDffI6ZVdQdkrBkMXullH7ils
         aWbA==
X-Forwarded-Encrypted: i=1; AFNElJ8l97OyG1jRGB0cWa/jClyhXJdXwXeXj3rUyoVGhcXTNw3Iick+qDxGbbK6J+i/y3X4C3o7MQJwvPgK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJDar0eQXfO+krHZ31U5DUSeucfsTTIsfTzvz/ebsEdOKkxh9x
	KJiPJpde4o7Iem3m4/rSYMyahZRlS3loh9GuDYFKdBfElKrDQsdvUIUZaV8H3/HriCYni0tKXB7
	xyWfSSw9ZRkpibIgm2X0o3lE0kBlK9LsxrjKkm+rySvGelT7IAL5rDY6X8yPMikFh
X-Gm-Gg: Acq92OHhJgDEz/K0EV/Kin/3KZ0+XUWGXFeunlGLnZnbCKy3P0E5+IyXHfF3oMPH3UB
	6tcDVjdd7R9OEQlG7x3CifVlFOONewUbITHIWgzF3+tWOOPDn9wf1d5gr1tVwFPQmDx72bEMQ7a
	vbQjEOqxF9vZhtN1S00ekQ9mQhR/1s7CKkzsuY+OhTbNf7kV7FKRFVPpQrwCQyGYUPXGYNoTP4I
	pPQO4lOHD7yWTRrZByGjlPiWMob1x1D0oAje8S/kYApG7LyRMAogD16FX36yDscD3N/3bd0K69m
	LgZR1lB+RD1I0Ey29gnq7q6AZ/EkaX55Brhejpsm76a9U7n2wZE3kzDifHjz83GA6toWOwZWQVs
	+qX5wh9nAo+IGTXDGuG6xTmgHUo/PtDAW9MmAtsmg3YDvhcX6UutjxSjvYTzezlsZ4tlcLw==
X-Received: by 2002:a17:903:1a4e:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2c163a58d7fmr5515915ad.14.1780439072690;
        Tue, 02 Jun 2026 15:24:32 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2c163a58d7fmr5515675ad.14.1780439072166;
        Tue, 02 Jun 2026 15:24:32 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:31 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:53 +0530
Subject: [PATCH v10 1/5] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-1-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: syCg3LsWXDqQ97Khq8drLRa0vWxMiNma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX5FEkKMnH4cR5
 RCECbbw9VqtbgbWGHXCo6b0/jqxv+H9tbRaNiFYvBdR4XhXEAHvxC0mIwrF6HVqXNxA1yLWelnR
 HNucyAOJzytgkunr27CUE+Ljbfb/emhcM9QjpkRHBpdSAVqPLFfw3kgwBmvRQcT7efJYkZ+IJCs
 5LuLBhOXs2sOtmKZdkTM6kExn2XcYepsTCQypY8eEKzjBNzSEFL5AaXrTRKlAZ2TD6varyDtwuN
 69V0bbbl8iuJbXZavnegFCAWAlv2YTvrYzZlT0yI2F9HGqM6ky+OsTVwE3PhZ7HtGaELcBCLqwx
 ++Belajsy801y8z87KHVISpidI4EWxbZs59zyiCI567tUgCA1LSSkQwxaQbA7UC8jhD2P6UbU23
 HUqUCvdfWTOjZcf8xgzEa+nL1hqI0KN0p7/s2vyCo8nrMWs96PDeqhmKiOBy3Ytm+tz/A8sJjYU
 b4/rirJqUgUHwk2Rwng==
X-Proofpoint-GUID: syCg3LsWXDqQ97Khq8drLRa0vWxMiNma
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1f5822 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zlodBCVASgOsPZHI1q0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217

Register optional operation-points-v2 table for ICE device
during device probe. Attach the OPP-table with only the ICE
core clock. Since, dtbinding is on a transition phase to include
iface clock and clock-names, attaching the opp-table to core clock
remains optional such that it does not cause probe failures.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock based on the target frequency provided and if a valid
OPP-table is registered. Use round_ceil passed to decide on the
rounding of the clock freq against OPP-table. Clock scaling is
disabled when a valid OPP-table is not registered.

This ensures when an ICE-device specific OPP table is available,
use the PM OPP framework to manage frequency scaling and maintain
proper power-domain constraints.

Also, ensure to drop the votes in suspend to prevent power/thermal
retention. Subsequently restore the frequency in resume from
core_clk_freq which stores the last ICE core clock operating frequency.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  2 ++
 2 files changed, 95 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 5f20108aa03ebe9a47a10fba9afde420add0f34a..519d08c4727a6cb2dc5991216a2c042ed6218857 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -113,6 +114,8 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	unsigned long core_clk_freq;
+	bool has_opp;
 };
 
 static DEFINE_XARRAY(ice_handles);
@@ -315,6 +318,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
+	/* Restore the ICE core clk freq */
+	if (ice->has_opp && ice->core_clk_freq)
+		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
+
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
 		dev_err(dev, "Failed to enable core clock: %d\n", err);
@@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 {
 	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
+
+	/* Drop the clock votes while suspend */
+	if (ice->has_opp)
+		dev_pm_opp_set_rate(ice->dev, 0);
+
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -560,6 +572,51 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+/**
+ * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
+ * @ice: ICE driver data
+ * @target_freq: requested frequency in Hz
+ * @round_ceil: when true, selects nearest freq >= @target_freq;
+ *              otherwise, selects nearest freq <= @target_freq
+ *
+ * Selects an OPP frequency based on @target_freq and the rounding direction
+ * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
+ * including any voltage or power-domain transitions handled by the OPP
+ * framework. Updates ice->core_clk_freq on success.
+ *
+ * Return: 0 on success; -EOPNOTSUPP if no OPP table; or error from
+ *         dev_pm_opp_set_rate()/OPP lookup.
+ */
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil)
+{
+	unsigned long ice_freq = target_freq;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	if (!ice->has_opp)
+		return -EOPNOTSUPP;
+
+	if (round_ceil)
+		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
+	else
+		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
+	if (ret) {
+		dev_err(ice->dev, "Unable to scale ICE clock rate\n");
+		return ret;
+	}
+	ice->core_clk_freq = ice_freq;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
@@ -738,6 +795,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	unsigned long phandle = pdev->dev.of_node->phandle;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int err;
 
 	guard(mutex)(&ice_mutex);
 
@@ -756,6 +814,41 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(engine);
 	}
 
+	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (err && err != -ENOENT) {
+		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/* OPP table is optional */
+	err = devm_pm_opp_of_add_table(&pdev->dev);
+	if (err && err != -ENODEV) {
+		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/*
+	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
+	 * -ENODEV when no OPP table is present in DT, which is not treated
+	 * as an error. Therefore, track successful OPP registration only
+	 * when err is not -ENODEV.
+	 */
+	if (err == -ENODEV)
+		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
+	else
+		engine->has_opp = true;
+
+	/*
+	 * Store the core clock rate for suspend resume cycles,
+	 * against OPP aware DVFS operations. core_clk_freq will
+	 * have a valid value only for non-legacy bindings.
+	 */
+	engine->core_clk_freq = clk_get_rate(engine->core_clk);
+
 	xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
 
 	return 0;
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1

