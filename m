Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B4367F21
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619741; cv=none; b=V0SjtdQVf6kJFHmO2jDlpc2h+yB5AWJwe/HZJln3haiSRikIV5LlNfS8nkZbKpG5uYXJmWzRSTgtbGZoXw/pJ8sSQjC49CBSEmpf0qFSr9dhavkw0S4mrssYiFGYdtdWj3LpMw8HweQXjlboKbuTydoBn+UU7jrXB1iNUucvv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619741; c=relaxed/simple;
	bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avnQSl0mwG2iKXcM/hqewSLg9Vl/7FUoA/1MfZOqOHrfQcs61A5Gl0LhPULSmSBjlV1dYseeTFgApBxsneWMRKjl3h2AgWMPZAt7lH6SiBGO3YdaGMUnUDxDxEURERb1ljicFwbVkICHdaxzsV6O18wLwnIZVjO90BiFzK9oVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CiZxJz0+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CiZxJz0+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so16322275e9.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619737; x=1778224537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=CiZxJz0+43I2lr87aFzDQpqO1wbMvk4y0PAMyB6d13ywDOpqR7Qn4xmLDv2PCnwKwg
         c4TpgH3UaZCtgVhKEggnhDh9btuWfbZLl6RdAzDo6c8jeUFLLeTPXNIIJ78Bu67fgJ8d
         vqQRWH/AwWs63qEDiYtqcIUXoZSdAHeuwZsd5z7ssp1y9gQxK30O0x+8FrZlYx/6LVpl
         1argW3M38W5268SzUqcjJgcFp6QE0SVgkSejlYTyTyYAjrRKUhWA+wY7MuU661g9uGSB
         5/sByTJfrW3jzSOiYVDY2zdEwFkfn3FdVTL1zcL8j8YoeAHHc/nJ5InktEXlJurTtUn9
         sw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619737; x=1778224537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsX2W4L4Pc+PK+L7HBoqtgzXsJuoR5ute9g48CW5Zxo=;
        b=NVCveJJ6LsquIVxkxlOGIHj1GllvlFSwxz7bgDV4NbKuFBmWg8a6yqGuCMqBK7fuo6
         EMEKyCsuf+ZPsYprK6QNv+aIIgY9WjR/vTdAiMI1fuXBcsbPScrn2bcyQH4pFcHQ+ov7
         nVYjcLttgX4Hco3/1jSVPk48SjxRHDEfpmeSNM5uNDKMGJVdPEf108coFAqL8RzH4B5/
         fZ68fwHpuVdZTx74BpzJuglBuG6d3JOPIKRKHJt16GD/7FXVOpgednqAcSMmQb9eHGnw
         SJwFiVOh4Jzn10PlYrl5y5DBnFCSo7xUAxqz48T0bsqzZ6zX+bZu5noeWRokaUWljZ72
         7iBA==
X-Forwarded-Encrypted: i=1; AFNElJ9XvTXPKijDg09K+4OPs/92ttx5gLM8RIpcgk3+2+y/IJ17OOT1AF1pM1FunTgFR+qk8JAbS5S8dj29@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0nyJKLt+/46pm/SVGwNpNVqxlirsVO+TBP3rw3RAZurgNU3H
	vdtSummJBU1zA/ZUqryhGKnmVg5Iyr+xq6rgi+7Jz+F0KRlgIdg03q3hl3/Z+B+RF+M=
X-Gm-Gg: AeBDiesWCaJmrLHnsHOSo3Uspm1kwtMUBY3QEFfqy9p/Vf2BG2qVIXdBfRS/K5taZ/B
	/6HHuqQ1BLMvcAoKOdtWiLOAgR4dxZiLb9QwZofT66edE+DFJrg0xDrhjlbT2gxrl4v5iPXTzM0
	iC4juFk65yDI5HdmoCwcEcHz2tXK3bMukVDFDLrwhq/3Uf6IdBBycnrv0/iYptTRO3KjfOorkj7
	n1L/zNIUs7syFNXOW3lJMTW/8l6k87v3VmPMX5As8hznj7Kv+wWCSqYDNr/xdnhqoHW/goYy8GL
	RqwCONFcSgu1iRfWKSmfs0zhdMC67IHbP65Md1su0waUK4AA5YV4LEEgMFRiB6gEi5jvIUA5a5f
	Vn1cT4Ap1a3UdWVgGBhR5YL2OaEpMhHz5MkFmBB1Zmo6TqmC3rzcnyoqPF+WYfTS7tHBl/yEV7P
	C9rRMGP7kjWdBlRqKurAZNX+/UiWZZunawqenQQkbC81aYGWOjJ2cbcph/0q1ZQsA6Y1OIOAWUY
	8nihzB2
X-Received: by 2002:a05:600c:19c9:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-48a844526dcmr98733175e9.18.1777619737268;
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:49 +0200
Subject: [PATCH v3 7/9] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-7-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Z9bS166QYqGuxxGdDpSdVqzIGY06OJ66UfzmgQnotbY=;
 b=JpEHF1l8ODIp8MebnEB3AbFVnv0KVA+IcJJ32Mp5KyhODYhgLLQWK9Ht4vJGZz+QkWSZhhF6T
 yXb6WAD8kMuDqu9cW70IpWCOT1FDTY49lbMcQvuFFZ1fa1WcLUnHuMw
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
2.54.0

