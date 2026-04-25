Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B63793CC
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141902; cv=none; b=kVZAVIeVgOUwIOvpC8IvYwFLac1u1G0GSDyZdeQS4zkcWFuJil/TqX5R7opPMiCYDsaK5YbnDTbGR7OO2baBMF6OqDD5PHHmPW0H5rw2xwIKgwJBue+8KEGVbP5q6lvTZHwVDuHZpix9m0KyY+Xo8fC9f4Swv/LLCZ13U4DSdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141902; c=relaxed/simple;
	bh=W/jdrMMOR+FvAcaLb6DCGvMLoN/HdffKmNBgDjoCT/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7NS2Wzhg4uJ9RTER7MOVSo0PwhSo+ij86hTsXwFHlf8UwgC8FVLpfmLDTEW6kCLMgMl/VIZhMA+pWWTKmT661wc5TDNdbMp70x4BmAbk29/oCtVn0wnbF+6Tv3LNshkd0p5VnViXD77pE7NsdnprfAPj6o3Vy51vN4gg5hFSg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diQ/aa5R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diQ/aa5R"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so147471195e9.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141898; x=1777746698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=diQ/aa5RqTpDkQMgSCyElAlSPA7r3WnXC1b7wunCfTqkWDvOOhkpGvFsg+iJ5f/Ia9
         +dmsMLioTqXa/3AY0CnDbVGsr+xZMMDGEOs47JXM35yC4fnd06eciVxagGwFtwN0BLv6
         deWNdMYZmCvl7ojOdlUlGkKRqImXk8xrXtBJozLCVeDK9EIv3Ov2ThvRJupIiZjHEnJC
         vh13RJPsPxUPqAopJ/Jzzj+yYMMffcXma+gXyBmnTCrovCIJUxV9KtUi4OgYdzEU6r43
         mnA140VcHdaM7gagye92k0KR816FuFEn6j/qGv/F3mq24s/B5sR9tZ2fa/xz2v4Tt3W/
         hLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141898; x=1777746698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=LO+TiBDeWb1OCSnymw0WK/3ECtkF4A82inG0/XosYN5qRBGnCZPbKbW2GDCGp5HNeH
         VHXjHAbJ0uiiffB+l+PyNGGQzrrOBgcRwVpZzFI1HeIogj4eSvCZDkln+j1rn92KTDgq
         7cBuOYozo0IysPHiQwy7WDXSuBZGfBLJaaWEEIDzehCgaI8FGz1IjmSp57PpL5Vi+SUE
         VJebe5Mtd0NfpgQ+nxMa8En11ICWrtLX7bcDU3LcAjWEzIreas3w3wcAMlBdjTmEIfjK
         ZEDYeDq3CNhRTvdczpAJtsXveMEHbmaIIA7BocJ6JUgzdaCcbCPAV5uJy1iPRdoViOWM
         PLuA==
X-Forwarded-Encrypted: i=1; AFNElJ+2hlLf4camwHHr1Pfna7jMHhSqH/AivxeiD8bBfG0DZDimI/NuiRR+1HALH/oE1VjuN4wD6AzcM7vW@vger.kernel.org
X-Gm-Message-State: AOJu0YwklSF30slaEcDS76rnAW0+fGm2POHkWTf3e+fwzKPtdWsbNdLm
	XN3WDljiXBZ6ePMkUePLACD/Nu5bmaAf679N1uh5fb19p1mRqbdhT4CW
X-Gm-Gg: AeBDiet0sjG/pPTkL/j11GDmJ+eYyRkVQT79BSVw249Yk96ABRygbEg+0oh7UipQESm
	4pmTU3TIm3u6n0Nc3hgv5uwi6Hz6oMEjT+wgwUPRn+EVz0j3KzoTy1Uwyh4Fd65lBTIkPxsdbOA
	wrTTzTjnge1XBh77JRklutlzc7UcuUXBbyvloxslYlMbQopqH0G3BKpeXc+PxS978lot5LO/Q07
	Nv+7FRLwyD+GyzqeZ/+qqTbZFSP6cYmMooSrCVCwKJUnqygSks2vCd1oOwL5SFqJzy4v3Z3K7Ee
	Mc3aSZp2tuSY6IK0lHX6Y6ccuwgf2l++W20IJ3/no625MqKOCjxpc60e/ZZTc9fxrlYVJ98vITv
	pEEBqipCoCnofkGQJcFYUkCF8ylN/pCFzGjmngzdWicJh1S8TZFi3K989ZDe5RkNlUil+zxE0dq
	xIElVm5YbM/jUfEGpKpEOu6BoN1guB4ZD5WEA=
X-Received: by 2002:a05:600c:37c6:b0:48a:65a5:750f with SMTP id 5b1f17b1804b1-48a65a57563mr105835535e9.21.1777141898345;
        Sat, 25 Apr 2026 11:31:38 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:38 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:11 +0300
Subject: [PATCH RFC v2 10/11] media: qcom: venus: add power domain enable
 logic for Venus cores
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-10-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
index cc21a4762188..41272c194a6d 100644
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
+				     res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_enc;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains,
+				     res->vcodec_pmdomains_num);
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
+					res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec1_pmdomains,
+					res->vcodec_pmdomains_num);
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
+				      res->vcodec_pmdomains_num);
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
+				      res->vcodec_pmdomains_num);
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
2.54.0

