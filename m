Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60E03E92B0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312732; cv=none; b=JFipPvdVEvR3XT2RPELLtXTnmforksZQTvFr7hFO7NLyiwrYQS0HPmlSeVfl9gy7MFGRqgukBsX/arNBcJkjTojtrNt9UEf0ovLw1shHOh1OeKUzGY1+p5im2vV/gq6WZRThJv4BHKq07wSmB+MMMbm2vigCV1Uh+a2J2OAiScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312732; c=relaxed/simple;
	bh=/n90KONaiUk7JIMeCRq4mUrGxJmn4zHTMpFbTUT82XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnYYdF/np8o87wLScvGADHZgrIaLLaqRDpNFDnCwa1JATVy3G0y9O8cC/a/73jA4gMYzV+VBFG9iR24wXttNhS4ILJOvi7ow0gp5IviAD/LFSWJyS37eczq69nqdRm6LMdytCP98I6YXx3dY3qLSRpT9xgnDUloySDcsPnosWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZN5O3B6; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZN5O3B6"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7b37d84a6b3so108930547b3.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312729; x=1777917529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=cZN5O3B6EjJfy0OqhkDkSh0dRO+1NS2I3Tv2uXf26BbAHkfrQ4DWqwiiS/QwYxqn0E
         f+ROFB0gkUvd3Z/LWoWNgitODC+khdjTn1M/j5QlADkEQ3j3qloTQqYcDV03K/7Zs4G1
         H6NRs0mMEfIMsA+7EhsFKI4/Ar87l9DhsrUO7xy8zy9Ns/Tsug3gq9kBo/I64piZWqbT
         1vOUfXqb9Q6GpVAndrsr4Pu4Ndgidy5Z6wUKFrgozKyjBUI1lHXlv2UYnBsQXjBbCVLU
         qOu13E2Dxqij5eO2CfOakFsydVkaj/u8Rbe2HTGDFpVaYA4OFeZvinIcosmwFcvhiHyY
         fhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312729; x=1777917529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=IVnfD6qyhVW9eZThI4OkysXBXHTg5am6BedCDN1+gT3okaKegQyWaUXXYQ1TYBDyL+
         uia1DsNpsKfsHNHH5YjznEQWjhI5wpvd/ccSNiyznoY9FhWTdu6CLv6kHKakvtWwZ9XJ
         KP5e9YO3TosIoeBkhE/ZUsjjqzTLQmuwe4IHIza2a1hfkSxLcDiarYv6/8S4/6jh6/RT
         4lbvZPEd++3j95YA+B4nw4SnavQus8ozOr7sFclsRw0LczP8m+y2dBg9eBJjY1nd3uvE
         +3lumBXZVsuV5g6FC5gKncWKisP15L6hSdc7B4KFH8Obn5nzgWOc3mjcfgOF/ujflFEH
         7KJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nO/edqDADTB/KzV4tyF6GBqv7PrBKatSxiHnM4fC4GbKjFP5gyoZsBvOaH+fJAOKpVKX7qik3M1xY@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7KkIlTTZo04sCwDdKWBh3YJ8HrTe10rKNOuZSEPYkMvvVdp/
	EgVU+4cpaJIOxrchRLqM8Mt07/EpDxHRTVqMvdhuq4xhdAfVz/Lb5i32
X-Gm-Gg: AeBDieutP7pvmQc3WAjCeV4DTEkOHPF+oWcq9jzJcJG0DNzGjapY9+ocEFKbJY+QEe4
	jBbaUdfyt4w9roE5kULU/GZrkXGGkOT1gSU6DfgwdF6/F9led5AQl+KlwFLqbrMBCnoWJ9tybIe
	6uQXOm4h0bnZap7RrHa43FC0l6OjzXFMdnGM79P1OkxdxzaJes1CPHPL3nacuA5/k0aQVKmX0Ew
	UuxhGs+ZSuxyxuGZRPd2ijQOWehR4mAORzAasw/w4B9Jle5rctj0d4/FF1PWr8/Xj4fYATLy0kw
	mdtAY8lrTt/x4uqmjY/sfnB0GQiQjvbIRxKQeVY1plBCMHplUI9pn2fOs9mBZ96seSDSw99S2ka
	HPqlgSdSiyusJcFDmr9WEUeXCfRRhuVIWrU0WCy30gq2V9pGBmstxnv+CXMSo+Z3kHq+c5FIJ5R
	/vwnX27WHxZ2S28Q0GXjkMvXz+SlEqqbXbGVyf
X-Received: by 2002:a05:690c:9988:b0:7ba:f0ed:c5ad with SMTP id 00721157ae682-7bceddc8f90mr3208727b3.28.1777312728574;
        Mon, 27 Apr 2026 10:58:48 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:48 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:24 +0300
Subject: [PATCH RFC v3 02/11] media: qcom: venus: add pmdomains to the
 struct based on the purpose of cores
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-2-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..1a919439abc1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,8 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	const char **vcodec1_pmdomains;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +146,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +202,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.54.0

