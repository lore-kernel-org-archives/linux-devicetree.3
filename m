Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A15346E75
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627962; cv=none; b=CQ6vpkM37eWY3+IE2b3QUrgp6Qsv3MXJV2bjVpIawI8ne32/go+gyPm+tXeA2NpGHHvNaW/PDJiEtJIZdhwgVdtcP88Hh8wk/tRalIcJukCOTmv60QLJe99itofNEJzOSXDRBScUR9BEZvoTT8hmf5IvNvqcr47QyCmo9LpksHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627962; c=relaxed/simple;
	bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0PWwKxZ9Vbk+BWQcubRNcFkRpBtOk4OBm5Fagod/H9mYvt6QAhXgiFckRP1dJeZ9Id49a94BFkSP20LSGbRRYFGuhxYENBiqfPCd3DSqBJhLMsNcGmO2iHIIrhHoV0VI0fPBGdzQvSHeCa8wRsLHU+1EiqV1NEO8sKL2LXMfgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3cHS9G2L; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3cHS9G2L"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66abe08cdf5so3698205a12.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627959; x=1775232759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=3cHS9G2LqzlmXga/sudQKfvId8kdyE2BoH7vpwO9/aSmOBLhz9b1Nu69x0/zZ0vJQp
         0ZFZwCo3GrEHvr/FkT+KH3E5V5l4uQJQLjdNAHjg+tSdQC+CyeTYZDuFkhd9758IH4Ov
         AnwlbLPbezSXCr4OVDSCFKEWXoXutQwvS4qyf/UgQhyUzBZZsFN2/Qn9ldeUuLwK8CcL
         T5f400Mg8q0ZGzsHKGLK69nOgwAGLbhv4ypu4Z2CJN/0pUqGhU3xqhoBR+88VANypt5L
         u7JKO6Z4IJBwt8VdXDcOSFHKuo4MYRtMJMAvM//8qM6juyKECiHm4JacLkfhj4LNwesY
         d7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627959; x=1775232759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCn+lBmcgEXVlegTG5stGMNFyfFJRP/RG0o4ix+DR90=;
        b=ILCU8+rodRI1wBCzianqwbBHfA8jLAPMljLdPlIMJnp3x5sEfyrSKnYA2mJfjv3nDt
         TvZeKq6BhwPD8jOJOy7DFAnv9YGH5J1ZdxIi0fzbOK6xkrAzSO45oBPvoOgJdHHV/P+t
         R6CAoVwxZ0J4fXT+vd4sdsNCrEPOR2+mYGKDjfo85OLoVbzA3ueLMTU2F17wh1Uft9uP
         N7SyWAbHu8g1rxmgL7uxHVnkXA4m6WT38nFV3PN8qXJyg1UmVgGsVRuVNErWAG82/hsv
         8T4yKlqeNGk8KGJBrThleeC4Lc7KLj68/ZNmvVQqWq74ZjYWYD35BS1Qre2xX6ImqFyG
         akBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXq+apyDN3cGTN1VCiYLP1Zbuc8bbgh/T9QEHhl3PhZjLnCq3aWQdBMD87mSK//+682w56IH1N98R2@vger.kernel.org
X-Gm-Message-State: AOJu0YxRfq1IwZD0LoOui54cHCE2cH7tJNjqpD730pHzsPsTztjFFZY0
	kplSIdNEs6utw4EJkP0fXDcEq92rTt3+EvIc2XeKZ6S1qwajBuDhqe4nIF7PJ77kilI=
X-Gm-Gg: ATEYQzxIcXQwfsETa9miiCVJ/OD9+VVqUvYt2bNKuVS1UCWaTwODrAQ6g/vwxuqkDvM
	zfi7AwZ28/KO8BfUfCYA17yXH6EganzQA2thpZxr4xY73Z3DUaCDWopl33hPxkfhG1xtnQTt08K
	y2ZoCgs/sOWMGJww1KIn3N+ViSeBbwG11nBOqGknjlNaVcobP1yqGf0ozKlc/oufmk258b9YrBl
	gr63RKBtJVpjfpiCHLunHADG3QLMJut8R3iGDYxGs58tWA+M0SOX5JS54EnrC8ojiSB0XcSgLAj
	3a2pqfS8jbznHWYPd4pWdchXcNXLlKtiT7My9fk8kwXbgK9M1Shl61z4RX7hMqHuFR6xVbjXP7z
	XtT+8UEh1697nrOkdg/bsZ613YMiWZMrOAgzUC/dmQvQ6bIltqbFZsTpxVowvczbvfarZQXEFDp
	p+lN46/zRyx7nrlHDSg+yvxoX6ne3CIA6I1Ds4ruyUPkaX4X8+jJ++CcSko8HCq3TIVlkUKJr5e
	eXwFg==
X-Received: by 2002:a17:906:4795:b0:b97:2a5:8a48 with SMTP id a640c23a62f3a-b9b507b0eb8mr213828466b.37.1774627958502;
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:26 +0100
Subject: [PATCH v2 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-7-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=toygxQND4Dvsy39S8g07OI0f5dr6V9bZ0QRD2HmiADE=;
 b=MTo0qnVzdsDxWJw6LPXjTeAFhO1XjHbxDt9eTdhNKswtYL3oWLKUwMh414oCixoltSCdD3INv
 Ta4gVCK2Mt8Cy4DLoMIVZZLGJiG+ZtoSJ01hm9y9sRRduDaP2HNEDo9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for MDSS on Milos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90c3fa0681a0..754ceef38717 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,6 +550,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -571,6 +575,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },

-- 
2.53.0

