Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922513D646A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089158; cv=none; b=pF+yoL4/vvyyHuIlFo993T6jrynsD/ML8I8yQyoDgUiUcpODWpFl4qjSs02+A021VtJ87nsrZehIgcX++ZqXcQeuRwReU4ICKVrkmaS5e4DjYEz1GN063vEVqoEv2GbAMsw30sR46A+shZZ8n0I8v2vkJGSotDWPqhtrDh95km8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089158; c=relaxed/simple;
	bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nyWmhRZ+FLlm3VQP3vwSFN74SEyuvvNov8/Q2FQT+1GMO7BGQzhsYnfUKu2ut49wfvQBwKV8i4N0nvhq95HzS+Mgpx8ua7m9vQ07e2uA6WnZWgkmskJbCzT481soIE1nF2/m2cV0zh/BtXoCB7wCA+ANuh0ay8FPjS51T8/0CfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGJNhAmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhCn8sCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGJNhAmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhCn8sCQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDDVoF3722806
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=; b=oGJNhAmcqUVZFoGz
	dukV8+oOCJGEHlwJWl9l3UqJgQXRa8iuPSg5HUUL5unko/EhOMc2x2YhHIrWO1XJ
	HQuXjlbeGGz8obla8hctdJwUTD9cOch8nNJiPthXo6ndecoepBrEg7uZ2BFFAnCT
	SRV3W977XmuyJUcWD3mYHtVFk4KmmqqUPeJUyZz0mMZSC5tqYZq2zJ4w04fdrQFp
	LTWyJRZ2XqKs8QxlgF8DCdUr3rSRnTONb5CWiVd3g6TBoG6IrZ5KYhHJlurUykpx
	ydVMVeDLAt4xK7/WzTF/2YfFQHsKaEgpIH2bDrwuUVJ+CgbuBDJorpUNacBnOT6H
	+mcW7g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpd9vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:54 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4723af8974fso3261384b6e.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089153; x=1776693953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=hhCn8sCQFaMVcc/zoPKzrPG696Ull7Zo4pOFEpB3Y4RV0Snqwo0rNWldLPoyyJ/SEU
         uM5DKRAcxluZ3mpr99JQeDhlrcv0Q0quxHzABFIv3GX9AOu5GZKbNtLpiTme7QzajE28
         cb3KqzVh92iOPlNONDeyH3JtnJDllRXH6kM90eKuO54jQl2a8L4ypJWfhH5/CHsTSRlY
         8XwaNP/2criZXZXxSRzK5TFaQG0+j9EwLPz3cytdjzOTcJ+q3iT7nWWAPZcnwcx6Mncj
         IEE9MeJoFMIqAiqosb/OKt6sszefEMPOGLImdm9fRB0cZftSTYhisVac3/Z6qukQnmGY
         cVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089153; x=1776693953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=K64N3J2cHbOeO9VzxOG7FCbwjfPrEbCoxpCQxnFJTJJpREqW3598KPjB6qfg8CF0KS
         Bwwn5ePLniDEYjlm3aPCvvISntZl4lTZAG9RmviKrY2nMmNqfVcqwymuT63D7b0kH78r
         CVLSgF2oU8LNvZ4XPkZ6cCRNrZqwS0xscNDGu54xbcBOsFTjmM5HgBC+ioLkCog554Dr
         sRnIjV3zYfFONQhVDX8bZey6ov0t/yKIKqaPu6RBNPfOYebPTzPEdMtCHyuJonAzTV8k
         seyk5QQsfmkAMjtWOkpBjpKTuzMtAchd5QV58UnMRK38EYTuHsckpcJa7ObT5QcgbQA7
         rmDw==
X-Forwarded-Encrypted: i=1; AFNElJ/i0GK8+Qw8k9M30rY4FoBo0yHfqIELKr6FxF3E3NCWkWJY1iikfuh+lLl0SkscOKYxpuTR6orVtP6r@vger.kernel.org
X-Gm-Message-State: AOJu0YxhLxXZe5z2JU7yVzp2oKfSWV6WbbujKidoEb5/Z70aO7lO0GdJ
	MIEmZ7Ab6Vxtf1Kj4zU5GTFM+YsfcEZJy8610m3iR7BrL/b3oLJuG4bNx/7fnM9gVeAQqUJieh3
	fnlkRi8C51eUFkS2ijjBpPfOId5VUX/x5I1OQBqwKsWhbvLFyauN0FcSmytm3Z6IU
X-Gm-Gg: AeBDieunmjLqyCbDlqPgdxdZwY1tHF8htp5s8Upb61V5mk7eJZVRkROQ+QYLXtZg5K2
	349Fpb9g66gji5FmX1ZMaP0E4dfpzztswYFHqsPp7uAHEbeI8sJKS4EuA7yNdcmHg4ULElf/YLG
	MgOWMouiQhvB/BJEjExf0TXuXmUPvLCP8pUZnUy0r5Q8cxL/xFvLnR3JJvENGG2JFShwbbjCDVE
	0mNhBZm6IOBBFkUGL1xZJ6vpdp8OBKIm6A180AENv1aKPFgPiFlFvFMPOaYORhCMnaOw+XM6Ch2
	EMrNpVyra0qMyjmCQCLbkk1EiHOfPhaltGtrPVZN3YbqVZ2AdPztasNWpyRW17VItNrpqHvOpdf
	4Bbz1qKnwmnFVhuGX2ehzOTzrJEBevYV7hRr6/DiZPLmaFT8fV2R8hEF2lqnJYG1k2ESckWOC7l
	miOu9AzbrxAOKL0Rduieek20PtUIF0mjS/Rng=
X-Received: by 2002:a05:6808:23cd:b0:468:48d:806a with SMTP id 5614622812f47-4789c6495e3mr5922020b6e.2.1776089153215;
        Mon, 13 Apr 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a05:6808:23cd:b0:468:48d:806a with SMTP id 5614622812f47-4789c6495e3mr5921957b6e.2.1776089152744;
        Mon, 13 Apr 2026 07:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:32 +0300
Subject: [PATCH v3 09/21] drm/panel: himax-hx8394: simplify hx8394_enable()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-9-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgnq9wrcj5XzE9oVZBrEZ73tbhQ0/6I45ZMe
 5cGUc3/NSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1QBSB/9KGQm1y1KQajg7NwOIhHN8WXXzrrS0RWTsSDRmNGY0j0OwvgRmyzjEYEMlApcJG5cGSW+
 MA+QpWn5TKdgsx3xafMHT7Mn4rPdD2MoT8RE+NT/v8ne1/0vBgFzeZ+FVz8Rvr6c0HAIXrO+nIy
 +zj6bEkP4rGqq0S4E0El3RBA5FH4C6GWsAXJCIZ0Ym65f4KIomZJcJ5Y05xNq1ZXxRAc16XYUNo
 Z7Xb9OUE8fD5A/4ARm7uWcXinFOVqhYd69y89t8OPZMmqr8/WaQvDaV/Pdyo+pyZWS29fKprvci
 byYPvo0iwqec96IDG9c0HZAx2dL5BzflsfNu46HVuLuVQHfp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcf842 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=jj6w_h7ptVUN3La3dRgA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 58DNJz41YnoqrbIu4V9Rg3cPhYqf_oLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX+5Q2kAY2g2AU
 Z6S3jLAQ52pkjeqfJYSc57Oi38ha7wIoJKAXz1YjlpBUplBFN0CcM2SM9LJxKewKX3dYI1o51uR
 WB0GzDUy+wpSCxtWcCY8/yVyjcrLPi768ytyIIcabypg5QU8OYWScURhZK3IORrVfPRkoGJhqaV
 ZVJotcISKKA2QfuJiWj+QQ/JjtMX/jHYqxgx9UfjOAotlc/nZEqjy14DEAlmuuj9OZ+DSS5QlfW
 7suoR/MPNA4EoWzIFIH+s/+XIRDNQBZqHii/OugekZhGyBOxBMbPwbhh7wwEGbXR7emFryfNn9l
 tbgjRfqZTZ02Y7o1oReojEa0R1In//XHGQCZBFlrMAEnngwgwYyP8pXT9ADrAhcBBoiSo0pR8f+
 B78f5ENL7yAeAK0XKZDJRdJkuy7J0o8DGAcIvbwAlVoODlUW4UIcEthrpR0xgCU2tReh2KDnhsM
 rClttV13gZqpQT0ylsg==
X-Proofpoint-GUID: 58DNJz41YnoqrbIu4V9Rg3cPhYqf_oLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Simplify hx8394_enable() function by using hx8394_disable() instead of
open-coding it and mipi_dsi_msleep() instead of manual checks.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 41 ++++++++++--------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d64f3521eb15..1f23c50b6661 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -618,47 +618,34 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
-static int hx8394_enable(struct drm_panel *panel)
+static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
-	int ret;
-
-	ctx->desc->init_sequence(&dsi_ctx);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
-	/* Panel is operational 120 msec after reset */
-	msleep(120);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-	if (dsi_ctx.accum_err)
-		goto sleep_in;
-
-	return 0;
-
-sleep_in:
-	ret = dsi_ctx.accum_err;
-	dsi_ctx.accum_err = 0;
 
-	/* This will probably fail, but let's try orderly power off anyway. */
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
-static int hx8394_disable(struct drm_panel *panel)
+static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
+	ctx->desc->init_sequence(&dsi_ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	/* Panel is operational 120 msec after reset */
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		hx8394_disable(panel);
 
 	return dsi_ctx.accum_err;
 }

-- 
2.47.3

