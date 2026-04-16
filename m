Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E483CE4BD
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347099; cv=none; b=j0n4azBhod5OTRdoj9Ni0xtQTjkbzmeRW3gGuJp26WZZEDdFJhA1rzhNdClweE+MraDRr4SkkwVjDi5uOo8aDV5S5iFBzZ2AvUAACRwF395VwOZ4pfD2TTejNJFoBRUgCe/dDlsAf+GxztoG3/gRpexM3aojiSangbgPqUowbbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347099; c=relaxed/simple;
	bh=vtIGSIpIcd+tHQ1s9x1vDn3s2kMk6rnbl/B/P+v06NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhpKPFIneGRp2Adyyx1ewjo0eOqAT5IkIOdMqmOtp//kKVUrSRRkJ46InJrwOX9NECbRtM4ckLZ7Q4GDduH7Xxq8+7+Jp8UWTNyrOP2eTR0vCZ+vvPIYbjjQlc8jmp5iY/LCxny1PziLHZkwzNxt4/7zuVgNY1ttRz1uqHS7RgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykf/7IhM; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykf/7IhM"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7b23713eac9so51682587b3.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347097; x=1776951897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNIA0go7fCTzH+URKhqccPwj8Z2XEocvaUPiivg7nnk=;
        b=Ykf/7IhMw+iF89lAZygChP3vb0lqwz4e3+bi1GeyfRgjHFoTQgM9bJlImgpsbRu32B
         Cieql4PzZrzB0TEi4ytFBivTwPZjN134HUTKL/jwEhLR/oaLZtM2cic0NRbutERnh2G7
         nqrfxQBsjUnjS+lz/C11fOo8Cn8ZQOeLpii7Gd61RRBD88t1fnn0yh9DGGHQyoMOFSnK
         iBYmySJTYKR2j+/YWKsBQTPVwGQ7L9SuuPonx+qEPvvOgi5vtg/p3x5w+MB7mXgps+Xl
         QzPpfxaLPp0nlE2sk8dCtNAs+RIaK0Y009veTWwd8I0m7hSwR+zQSe+7WTBjVGblffi6
         OYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347097; x=1776951897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kNIA0go7fCTzH+URKhqccPwj8Z2XEocvaUPiivg7nnk=;
        b=CDWiJvfMSstZOwsNCK/bConantbyUWmqNDRl0J/hC4z1QkS23nsF8CvkpYqOAzQQpR
         1d7NLwOp2T3ZaIncXOlwpnCKVJnlZAzH6gFmDYHTfn45nqUmhweFhqo9zkP7E3vWUJnA
         JkU3Gm3G350BimXqNwV+rkcnHnSy8X2533y3/Af5vsQd3l0tXCAVeh0C2VMAGNYdmEId
         DyUfO3tMT+6wnrBaFvgIC/65sbBYxADURbScuRjdLt6vCC15lf5iP8xtejAqCU4E4IOE
         sqwinDjKyQ3Dp5uaq3ptILHwyX9xIWmMz7Bh84HluNJSk8PHmsv4dZTLNda2Y/EmbNDP
         A79w==
X-Forwarded-Encrypted: i=1; AFNElJ/a4jJ0HXltMZwtOt4asCuZKTkQoauTcyj/L89lPws/etxQQHGvbIpooy0hX6MiwX0rk11dC4peH7Hi@vger.kernel.org
X-Gm-Message-State: AOJu0YwXkWGaVBb45Lmues4vYeO+vgZ3Twu9XcBqxWzOWZ2mKt/dNC6B
	TUKccFEzSGEkGaSALKb309Q/mribr00PCCPe8osca/AdLEpBXt9xQNAB
X-Gm-Gg: AeBDieszAapbl/4edxRNhA7tRWpJ5AXHwQIpUmLh6C5wvAJE65lhNqmHVkZZb++m6zy
	+lID6jJoyU8xo8aFJiNGw1sZBiUPH1OPJQi8ke1xFIJTQKnjERJkq3thLAJSZvM2pTzleHn7wsD
	s+IUXbRU2xBOgahaZZYA+L0sJK5LphmmXALB6dfbGNnVGnDZcMH8PVjr3LBLXyZhw8LYvah2rbr
	pT29pmL+dlk6TmD0X2N/9gBIhaT4xyeaKrq/UJUGqB7OfHSSySEKMKKkaKEp6ZFkqmT9ujEifjZ
	4U5qGuw4fXmkzIK/CTakkLrZ05k9efckBsQkcJ1wuFjCUe+J+qJklHF0soLgDuZc3EsAFCloKI+
	gWsq8p4sulpj3dJSfgEFLaAFU88J1Bs5qBwjeqj32rtexX654JLHSy0knam/sV2zKSexm6NChq0
	Kj5WQrANSdJOv3pJU6G2DzvApnow==
X-Received: by 2002:a05:690c:81:b0:7b4:ad41:4831 with SMTP id 00721157ae682-7b4ad415700mr140405537b3.16.1776347097361;
        Thu, 16 Apr 2026 06:44:57 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:56 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:57 +0300
Subject: [PATCH RFC 10/10] media: venus: add power domain enable logic for
 Venus cores
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-10-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 121 ++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cc21a4762188..713812421c44 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -246,6 +246,94 @@ static int load_scale_bw(struct venus_core *core)
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core, struct device *dev,
+				 struct dev_pm_domain_list **pmdomains,
+				 const char **pmdomain_names,
+				 unsigned int pmdomains_num)
+{
+	int ret;
+	struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = pmdomain_names,
+		.num_pd_names = pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!pmdomain_names)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &vcodec_data, pmdomains);
+	return ret;
+}
+
+static int vdec_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_dec;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec0_pmdomains,
+				     res->vcodec0_pmdomains,
+				     res->vcodec0_pmdomains_num);
+}
+
+static int venc_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_enc;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains_num);
+}
+
+static int vcodec_domains_enable_v1(struct venus_core *core,
+				    struct dev_pm_domain_list *pmdomains,
+				    unsigned int pmdomains_num)
+{
+	int i, ret;
+
+	if (!pmdomains)
+		return 0;
+
+	for (i = 0; i < pmdomains_num; i++) {
+		ret = pm_runtime_resume_and_get(pmdomains->pd_devs[i]);
+		if (ret)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+
+	return ret;
+}
+
+static int vdec_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec0_pmdomains,
+					res->vcodec0_pmdomains_num);
+}
+
+static int venc_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec1_pmdomains,
+					res->vcodec1_pmdomains_num);
+}
+
+static void vcodec_domains_put_v1(struct dev_pm_domain_list *pmdomains,
+				  unsigned int pmdomains_num)
+{
+	unsigned int i = pmdomains_num;
+
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+}
+
 static int load_scale_v1(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
@@ -331,6 +419,11 @@ static int core_power_v1(struct venus_core *core, int on)
 static int vdec_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = vdec_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec0_clks,
 			       core->res->vcodec0_clks);
@@ -339,8 +432,18 @@ static int vdec_get_v1(struct device *dev)
 static int vdec_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = vdec_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec0_pmdomains,
+				      res->vcodec0_pmdomains_num);
+
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec0_clks);
 	else
@@ -352,6 +455,11 @@ static int vdec_power_v1(struct device *dev, int on)
 static int venc_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = venc_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec1_clks,
 			       core->res->vcodec1_clks);
@@ -360,8 +468,17 @@ static int venc_get_v1(struct device *dev)
 static int venc_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = venc_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec1_pmdomains,
+				      res->vcodec1_pmdomains_num);
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec1_clks);
 	else
@@ -905,7 +1022,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -1023,7 +1140,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.53.0

