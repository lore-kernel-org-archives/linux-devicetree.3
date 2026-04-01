Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D68381B08
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028419; cv=none; b=fdrlfogqWr0kTnUNLjRbaejhjRtqtPwJRlkN/GjaFsO1XKmOsA0bnh2+TpRfNDeVqhqK6FVa5mc9nrm18uksUdFMldHw5GKF7OU//iYd0bB+9d7F03ppKwmkAdUZiEqz6HCQXGsKWyk6x0InVWFXo88bntBkOD1D9MgQ6sqvbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028419; c=relaxed/simple;
	bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChYl5Wmm/Zpf7RPRCpfse0acPvMa8H19RB+M3qylMcWXn50hkMiZKpo0r5Y2b7hvUaHEKtiUnEQU9iKQowk+OGMxFLRLhnRJgQmtSYpOUADnUl7b3XRipKsQgQtP9fkIMhuy7cp5PbspcHb42NQ9DuE0wA/gwY6f/l+O7KP+HUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdocga/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUH7XTU9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdocga/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUH7XTU9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317F1d34106992
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=; b=cdocga/0a23AXIQ2
	lVhFHERbCVZzy6XoYxQChcN+/0hVgmn5cyxJd2nZcEYqO4xsY7CFoWCYKS8qZoF/
	18+P47WvUSebiSQiyGETxSMGtp+de1CqxKYyM+TY38hh0SIa8+/Ks02Jl1qwp2E2
	3i0uuZWR2d15YUKJ2ygYQD9kdek5xzIRLNh40ZQKrLZCZ6tAqqoM/+EQHXbeguGm
	i4vYIyVqOnRn1wFWRSXdEzYqvaGbJyK+i+ogkvgeagTCAAqEOP0N7pvwGvj6adTq
	pr1iUKqoxOOzfzqcmDaE0UGP/t4OKFjfTXVcMFSKkF8IBMDXbqSdFW41vptOOkoy
	tNo0wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so21744801cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028416; x=1775633216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=CUH7XTU9SdI0Nh9sWmc71rfK8m24GHHl9/LkHDJRqVvZmxbMQwoUNEqw0SMuOIxp3f
         KeYxU/CAHx9Qkzccuj6JoexveZvoOuXhAZxE9kAqOITpddUrgaA3yWjcpXgXzp3Ja4nK
         pO0v6rhcdaY6cjT0SQimkrLfh+rsJ5vFScte0UxSVMJvjaHzpoz8pCyMvc65RI26wuos
         usu2nl+4enK7HVaf0NRcP4nYWi1i7gI7x8nQGlzinTess3DXd6mNjYiDTr1F/NcN1mox
         QKyFKIhvzFVCCBv9aGR//qu9cULMfnlWB2GrF36GxcdmKGAW1PY6fYqD4aKTbB95k7it
         Q2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028416; x=1775633216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=GhTa9IPnaANZ1dcMlZM83I1gT3JNFt4/VGnI9Mz07gvdcZpoZrEAkjIqM9/MiTL7Gs
         HjgrXxeklZNCBLENXFf46s534KptsXQuc8kOUoFRfOoaLa/r8as4EpsKTjaWAxFyPQzI
         ciaj+aGNtj3E3k6CNGNpMHLQVqHe3B5MMiKOG8Qd8vNmAVf3eh9u5wik14XQUBMz1E6F
         I4LvAq9BCGINVg2cfCGuYwmKxCYuUZfQGy7zWNMLP8W9HGvAyoOHuOOYeuOhoEaISvNt
         GCgRvTPol5FbmBSSzcOWRXYY3wZOwuojK/m/7TbD3fM0q8fBL2JeIlMcAkyL1Q2pRTNk
         bUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZwbNPBwp2J8lfPKdhUcHSmkQ5DohH2hFd2MnJqhZc8ZeArLMxuMMMkhCZJ44WRW/L78HQeeVnmBMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHo1U0LijqRtF1YP2stzI0nUVU7NURzXi6m51YFRHU4BpbQyf
	NsI3pEZgZFPWNaOnS5nyYsuPADEkQDzKVfWkI0U7QB5awrZwRlujYTEgM1mx5xp3rNxIeUtWJFo
	opY3XMd/NhTgVVlWWRKyH06hPEyHn0GRpsd6MfRZDTh03LS79Z3YTlq9j95jPrgWmygMZF9rB
X-Gm-Gg: ATEYQzzb2Sc9edyf7FOxkwOL8bfljknDRHnfaedHJ1zrW287Sm3pXwm9y6ExRQdtAzn
	0MOhoOuLtDiYj5ekcSNItjiC8Trp32ap8qxXWxKwS7G7zUpPIcyVjCVaaRbynHAfXaoEDLSr9qo
	h+wZVuqddfnoN7Tckv2rRNqn5hqilX9wPiUUJtVy160Q+Y4Kd9IOD7PfpCtxH5c3VoEjDgn488V
	BHgbZZET57k6KZXyCuzJwTcBVkkc03MyGVCS0y+4jpoVhlp7tWflk0lGqm8NHdSy/77RV1lSV5f
	cfXk5oF61w/+Yh0KZYFmURB9G6idjS7Vp9iPdwD487bjElln95c9bD+76LUs2LfMaGqFdFsbERU
	jEV3mj/Of0mRGsWekI1Dq2b9kPU6mqwiJwnZOHvefqzPBgOhzeRaljxOCp1DnqFilo5UecpOGd9
	yO/AtCFZhKqaFZt6QJ6UJHCZ7hLP1VvqYZ/yk=
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr16263241cf.11.1775028415553;
        Wed, 01 Apr 2026 00:26:55 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr16263021cf.11.1775028415084;
        Wed, 01 Apr 2026 00:26:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:26 +0300
Subject: [PATCH 07/19] drm/panel: himax-hx83102: support Waveshare 12.3"
 DSI panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-7-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8981;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisSXSCfTld4bLflxxcey5rqd1L+NAg6jKaA
 QkCUQH8aaqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1b9FB/9/CN+nLC9tP01kjUxAq7Tf2RyLpQ8SP2zcZVFPKQAF7qgOK6GKZBv0mTTcGS/vIQzK6yL
 JMX34XxNhQU2O68eiYgKXERNQs3odXgnlscER/oYtTtavjR17ESaWdH8Yub9WjDotNf3llqrzt1
 /laYNbzHuWNdDGZ++GsxOdC2oD3qVKb3im2JDVwvt1xcoMUqCD1pHb1fZOK239KX8nV8UOXUHbx
 +GZPojMMOtWiCHrLRSfWqDI4YBIaFze9SWzT9aSLskIJOzs/WIt7h4WOMr+veafY2VJuragHY7A
 Rn0QafbgbSh5lAcWMYtuLkkDU/pH1ajp1MAMiu1HLW7gNo00
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -_gzLEuLMeRbIrIp5vK5fwZJoriwXsi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXxRyBwjAYDs2e
 DpsXnX3px8J3C7iSlIOOn3+Icm0H6uklWHcOREr9F6gOHNLY9ug9kyAM+OCzi7fszD8BfbHEBMj
 EGlCv92SAgxvFxkfI+1GfNBFB3/vW5fXmGAAn0zFQAUQLc7CdNHxPbY28Xf9KmHvwgvkJJjIIMo
 FATnUuuu+C5IEVAnlQ0k8lLeLWQMGOWH7jwk30z41rlgSld9MBTH2Vr5yD520m/KcxDvW4Tra1z
 BRL6xUGkM18xCUfTjZw5CucF6TqgrW245WGQx45+daUzMlG4HF133OadVGBDCnR3pOJ04mCj3dJ
 Juxe80s5BnJYqiQY04qX2xGK04ZWZZpv1nsvLc6CTWIfe3HCUZW2DUzYEpeLA/o7JWFaXzgkMZ4
 csKtqO6Kion7oXrt3YOjyfqoxCtMsa/B7j2soQqOf93+dG7wdEmvXMkIvZcUO4rYTU4PPBndrVb
 6FzCQNQBNRDQCCglGVQ==
X-Proofpoint-ORIG-GUID: -_gzLEuLMeRbIrIp5vK5fwZJoriwXsi0
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6dGl3bZOZdHCWiLLNVsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
vendor driver, it uses different mode_flags, so let the panel
descriptions override driver-wide defaults.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 144 +++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 8b2a68ee851e..eab67893da86 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -29,11 +29,14 @@
 #define HX83102_UNKNOWN_B8	0xb8
 #define HX83102_SETEXTC		0xb9
 #define HX83102_SETMIPI		0xba
+#define HX83102_UNKNOWN_BB	0xbb
 #define HX83102_SETVDC		0xbc
 #define HX83102_SETBANK		0xbd
 #define HX83102_UNKNOWN_BE	0xbe
 #define HX83102_SETPTBA		0xbf
 #define HX83102_SETSTBA		0xc0
+#define HX83102_UNKNOWN_C2	0xc2
+#define HX83102_UNKNOWN_C6	0xc6
 #define HX83102_SETTCON		0xc7
 #define HX83102_SETRAMDMY	0xc8
 #define HX83102_SETPWM		0xc9
@@ -78,6 +81,7 @@ struct hx83102_panel_desc {
 	} size;
 
 	bool has_backlight;
+	unsigned long mode_flags;
 
 	int (*init)(struct hx83102 *ctx);
 };
@@ -765,6 +769,111 @@ static int holitech_htf065h045_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+/* This is HX83102-E, assuming commands are the same as the normal HX83102 */
+static int waveshare_12_3_a_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETEXTC, 0x83, 0x10, 0x2e);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BB, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x67, 0x2c, 0xff, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x11, 0x96, 0x89);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0x04, 0x03, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER,
+				     0x10, 0xfa, 0xaf, 0xaf, 0x33, 0x33, 0xb1, 0x4d, 0x2f, 0x36,
+				     0x36, 0x36, 0x36, 0x22, 0x21, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP,
+				     0x00, 0xd0, 0x27, 0x80, 0x00, 0x14, 0x40, 0x2c, 0x32, 0x02,
+				     0x00, 0x00, 0x15, 0x20, 0xd7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC,
+				     0x98, 0xa0, 0x01, 0x01, 0x98, 0xa0, 0x68, 0x50, 0x01, 0xc7,
+				     0x01, 0x58, 0x00, 0xff, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B6, 0x4d, 0x4d, 0xe3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x85, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x64, 0x04, 0x00, 0x08, 0x08, 0x27,
+				     0x27, 0x22, 0x2f, 0x15, 0x15, 0x04, 0x04, 0x32, 0x10, 0x13,
+				     0x00, 0x13, 0x32, 0x10, 0x1f, 0x00,
+				     0x02, 0x32, 0x17, 0xfd, 0x00, 0x10, 0x00, 0x00, 0x20,
+				     0x30, 0x01, 0x55, 0x21, 0x38, 0x01, 0x55, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA,
+				     0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64, 0x69, 0x6c, 0x64,
+				     0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85, 0x9a, 0x97, 0x4d,
+				     0x56, 0x64, 0x70, 0x00, 0x0c, 0x1a, 0x23, 0x2b, 0x4f, 0x64,
+				     0x69, 0x6c, 0x64, 0x77, 0x77, 0x76, 0x80, 0x79, 0x7e, 0x85,
+				     0x9a, 0x97, 0x4d, 0x56, 0x64, 0x76);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x9b, 0x01, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK,
+				     0x80, 0x36, 0x12, 0x16, 0xc0, 0x28, 0x40, 0x84, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0,
+				     0x01, 0x00, 0xfc, 0x00, 0x00, 0x11, 0x10, 0x00, 0x0e, 0x00,
+				     0x01);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x4e, 0x00, 0x33, 0x11, 0x33, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2, 0x00, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA,
+				     0x23, 0x23, 0x22, 0x11, 0xa2, 0x17, 0x00, 0x80, 0x00, 0x00,
+				     0x08, 0x00, 0x63, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C6, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY,
+				     0x00, 0x04, 0x04, 0x00, 0x00, 0x82, 0x13, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x07, 0x04, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x21, 0x20, 0x21, 0x20,
+				     0x01, 0x00, 0x03, 0x02, 0x05, 0x04, 0x07, 0x06, 0x1a, 0x1a,
+				     0x1a, 0x1a, 0x9a, 0x9a, 0x9a, 0x9a, 0x18, 0x18, 0x18, 0x18,
+				     0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21, 0x20, 0x21,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x1a, 0x1a,
+				     0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x18, 0x18, 0x18, 0x18,
+				     0x20, 0x21, 0x20, 0x21, 0x98, 0x98, 0x98, 0x98, 0x98, 0x98,
+				     0x98, 0x98, 0x98, 0x98);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1,
+				     0x00, 0x34, 0x01, 0x88, 0x0e, 0xbe, 0x0f);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_C2, 0x43, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x80);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaa, 0x80, 0x2a, 0xaa, 0xaa, 0xaa, 0xaa, 0x80,
+				     0x2a, 0xaa, 0xaa, 0xaa);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xaa, 0xaa);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3,
+				     0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xf0, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xf0);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+
+	return dsi_ctx.accum_err;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -920,6 +1029,30 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
 	.init = holitech_htf065h045_init,
 };
 
+static const struct drm_display_mode waveshare_12_3_a_mode = {
+	.clock = 95000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 10,
+	.hsync_end = 720 + 10 + 10,
+	.htotal = 720 + 10 + 10 + 12,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 64,
+	.vsync_end = 1920 + 64 + 18,
+	.vtotal = 1920 + 64 + 18 + 4,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc waveshare_12_3_inch_a_desc = {
+	.modes = &waveshare_12_3_a_mode,
+	.size = {
+		.width_mm = 109,
+		.height_mm = 292,
+	},
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.init = waveshare_12_3_a_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -1168,8 +1301,12 @@ static int hx83102_probe(struct mipi_dsi_device *dsi)
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-					  MIPI_DSI_MODE_LPM;
+	if (desc->mode_flags)
+		dsi->mode_flags = desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			MIPI_DSI_MODE_LPM;
 	ctx->desc = desc;
 	ctx->dsi = dsi;
 	ret = hx83102_panel_add(ctx);
@@ -1220,6 +1357,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "holitech,htf065h045",
 	  .data = &holitech_htf065h045_desc
 	},
+	{ .compatible = "waveshare,12.3-dsi-touch-a",
+	  .data = &waveshare_12_3_inch_a_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx83102_of_match);

-- 
2.47.3

