Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6635AC0C
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909475; cv=none; b=PRUefANVHrjTT3O/CtjqiD46E89fPM1t0bDdX9+pIaWK8AjgzdrTaIiYgk2fYhQKG+XQb2vu+B/oAZY+iza6jQqqkBK1jaugBPVj6plJUu80NjVHQJPCZUIJbHNLJ84lqQ+kDReOxvl0Q7scUwZ6H+5AEkpjP/NvC6H/3LsgvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909475; c=relaxed/simple;
	bh=I07ADQdGhA6Qq6Cx74/dBgFSnA/ZPawbvmK6jOC9m5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QirxaeE/30/Xnz2ZRpKc4hi7H84dBP1L/GWmH5mXn1b7TBdr+EG4URcJABoZDKSIeAqmtV3sgf2OvE5My83/KRkU9zJZyLy8cIll9F6L8GKhqPiWQyyRJ5jxQkgVsps+5VuMQZQLTc3ZL/4fKmTYkuMFabdxUu7+pTX3ZDWWGss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPe2+g8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FceNxR1o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPe2+g8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FceNxR1o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B3xoSM516234
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OE9S4otYnPCURYdf3I6lpBBdzkvE6LfA12oEggiwvlg=; b=MPe2+g8+t8v7jAJJ
	a10Fz2mphFP7aU01O0OXBMLtsKWzRDEhr60GZotclbwXXOftB4l21FfK0zGGZFzT
	cuuGm0+sE7dVzax53U/LAxYxF2o2BB1yR3UXkPDDgybCZf1bV4Wx6nxlQrr2yjxc
	28ILevAzBcIatHZxK7n9UZFhFuuWZToswR2GqXzDLZs4vE8utflHjXvNymPaEy+a
	4g691nAo0ebKb5HBgxcE/28GpldBycM1NlI/9eSdmzuBaBwtYUsOELkNBXSrYsDH
	cDXad/FKuo8EBAecThEUpHmiODKY6tNC95I7gprdvem/BVXpS5z1HOhipFRPqhlu
	rBowGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgnh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so81399381cf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909470; x=1776514270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE9S4otYnPCURYdf3I6lpBBdzkvE6LfA12oEggiwvlg=;
        b=FceNxR1osTBIRhCBDWK8ahXiZvKUOdeT8IPQb0iNesRXeYnHxFQ432P3I3LYNfwQmJ
         f5BYap83Oe0LlxRS0RMQSkHpRx+M+icZaCMzKR/CZCe7c5/TZ5wKdJP4OTaaCJiJLrsQ
         V68ujV2ede0FnUqOtrhhfiX2ulDVnFMpGqs1e2gqQ+tg8Goz1aE+uNZTDZWBmOD3NUVF
         B0UsQ1SkqV9MBiTvZauZpwFQUKE1cyFIC7RLABOVVi6enMFPJHxsTAgRx0mSUgxaIbHS
         791hQQwjqeb95nM5EOtFwgF50c7LyqSaLQj5hHSh0BKHoBUTtt0AEhJq1BHMPNB5tiBu
         1JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909471; x=1776514271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OE9S4otYnPCURYdf3I6lpBBdzkvE6LfA12oEggiwvlg=;
        b=nXwbD96tVbrnWWb0Sjr3LJWXmUvdgdJi5FMchwFn3fQl5GBBgpz93PSSxYQSCgzBEQ
         ZE/aRq3funbBH2Rh0wU97RO2ofN8/HCFXZLH8eIeuBHSdAZiW0m00XdYzsoyO7vOAzxi
         T3gmdKo9XT0dP3KbBje4aiAtn6lSXsdXOZXh9yWCgrKf+EvXgz6NCgWByMu9Ogg/rBIy
         gxRkn0qhZBai5J//agkeovjHwQPegdXe0/oEyYSBl1JcJ1S72lTkicGQcw188Cww3T67
         2Ilu3ntQLSb6HWpsymbUSv4if763Wh21CDvjDgNJVN2o1Fbd5ukZPr4SYxvJqHxCuVFB
         huaA==
X-Forwarded-Encrypted: i=1; AJvYcCUnxA5MgxoDrpm8xS37prKD2ijMBDv4yub4Palf5Zp7ckNSQHB8b1HLkVQ5dqxdAJNfF2aNc1qWTMu8@vger.kernel.org
X-Gm-Message-State: AOJu0YwfVIwjFnwLPAL9w+KZ9PWlKmmu37Bt9v6TWWsnIvcHRRz5eIL9
	5esKUNQOV/d5/UqHtsvmTFOba4cqGcbjHlSLrZ9MP4St9PiIX64mJlQzun1h4xliC27rj4HsS0r
	E5K9/tMax0T5r06o1w7OxiK3rnrmItJRPwP1nnebDj86MomU4micSaT9Tl+LaH+Bm
X-Gm-Gg: AeBDietfUmcoWHX6ajWEumw+2jglvnnKF+XtbPs/iPDAVyhkXkxEKTR542pnMr6jxf1
	O2MFoBOenCuxTil2ubwrwrZLrRzI64WE+RlTVrqqr9m+gbBV/StEHmU88ItIpsTSyMdqiSa7KWe
	vASSyw32zAe+CeQPym0oi6prE/Gj0QCRHTgsbZMF5+MDp1TpN6o7jVpIu9pPUyMNCGYT8K22/D/
	QYQcMcYIdoPeIfJcszUnVfI424FiSJTVKDhr0r+Z230AUsuAi9eKer4+F4XU/NPfHTIUochyWsr
	5Emnp0+qwHiog/oqLGtphttOYjeQKOHHKBOABEkxdxxVGGSfvXkCo7ZAMXzzS6hYKp1krSf4xEF
	xuRUYlLH/tHGg18Mm7sa7FHuzpcUMTlQ4njz7FLsisEwBXcwRtkfRaEshMP95d6NFKtpv3WwLGK
	WfS3kAZ7UzlVYHRqLE6v72lSDTUpIc0ZxfUwk=
X-Received: by 2002:a05:622a:512:b0:50d:8afe:6424 with SMTP id d75a77b69052e-50dd6bcc99fmr84557901cf.26.1775909470332;
        Sat, 11 Apr 2026 05:11:10 -0700 (PDT)
X-Received: by 2002:a05:622a:512:b0:50d:8afe:6424 with SMTP id d75a77b69052e-50dd6bcc99fmr84557521cf.26.1775909469799;
        Sat, 11 Apr 2026 05:11:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:30 +0300
Subject: [PATCH v2 10/21] drm/panel: himax-hx8394: support Waveshare DSI
 panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-10-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11490;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I07ADQdGhA6Qq6Cx74/dBgFSnA/ZPawbvmK6jOC9m5A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGRgkiOpJEsyGxxgIflBnhTVBM4I+XBxHAR
 77IGUFCGSWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1TApCACE00N2xcVg1AOmc2dNa6N0uv5TQjoCs7/gKucEqo2ljoz7bb35QgEpZx83id43YirJhpX
 CGK9s+9mEJtV9KdIsaX412r2Xdvo9YPaioMRoGTOo1ktvb0ygSOLGd8YOazI06bg2uvpxbA1jbI
 0Xs5NjxayosMfs5OcwqQdzFg2lPbFzh/+L81iTMIz904OIp8IKWS6RTp8h6WNbaO9I+pysT3MEm
 /ruxishbB9/XDReT7fHaClejCt9bd+jiZTfBXbm+sJq9o39382Z7KXixuJZQeGFXHn7cBotfDjV
 2TuZ2Fcv8ag/lY9Hdk+iyS/shO62GvfqZ8HgwLSmxLdoVIUR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da3a5f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=8LC8iulc4pHAooHhkrkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Q6SJdWj1n2pu003CiN7CHPbLSC3ofMbA
X-Proofpoint-ORIG-GUID: Q6SJdWj1n2pu003CiN7CHPbLSC3ofMbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX49PM0Qi+3v/R
 5UX/RfB/lJZy6KIuNFX/ZxT1NihkfnS3aJnRrjQx/n1cY7owXFU6sx4aVEqEVQVEYnk0v98PBTp
 vGR3QfLi0IhDrpsB6zpp9RCGJ4SVx4sL2dfZzZm720qV2Y9eVqKr+ed0SwZPaFsOog7Wst3vP/u
 U7GgITlum4bXgt/dg/6TNwaTdxv05PKeZNy8SSrd1aMZQkf71ohR+6oSmAXTxwoYOknomcbbjfv
 DKYjP4Cv+as41mPt6QDXx3jwfEg6/r45GQvjDl1w3xOZkaY45QoNLZx1F70/Qwh7Qu5WjFNQYca
 cpBH4s/ff/nB9QNTq6hmLnELcZh8//0+akeLfQO6VW2/pL0/N3zdyu6OGPl5M0nNa/ynj70WUHX
 P3LtEXRHDGo7mePF3KZ7pHWN3dX2sIzGNB3HTnAV363f7NuUIECxLBoMDtgcUGNKzXATjfs0J5V
 lQjnyndhS+pETMuAh+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102

Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 244 +++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 1f23c50b6661..bf80354567df 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -44,6 +44,7 @@
 #define HX8394_CMD_SETID	  0xc3
 #define HX8394_CMD_SETDDB	  0xc4
 #define HX8394_CMD_UNKNOWN2	  0xc6
+#define HX8394_CMD_UNKNOWN6	  0xc7
 #define HX8394_CMD_SETCABC	  0xc9
 #define HX8394_CMD_SETCABCGAIN	  0xca
 #define HX8394_CMD_SETPANEL	  0xcc
@@ -618,6 +619,247 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
+static void waveshare_5_0_inch_a_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x0a, 0x6a, 0x09, 0x33, 0x54, 0x71, 0x71, 0x2e, 0x45);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x61, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x0c, 0x06, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x1c, 0x78, 0x1c, 0x78, 0x1c, 0x78, 0x01, 0x0c, 0x86, 0x75,
+				     0x00, 0x3f, 0x1c, 0x78, 0x1c, 0x78, 0x1c, 0x78, 0x01, 0x0c,
+				     0x86);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x32, 0x10,
+				     0x05, 0x00, 0x05, 0x32, 0x13, 0xc1, 0x00, 0x01, 0x32, 0x10,
+				     0x08, 0x00, 0x00, 0x37, 0x03, 0x07, 0x07, 0x37, 0x05, 0x05,
+				     0x37, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x18, 0x18, 0x18, 0x18, 0x22, 0x23, 0x20, 0x21, 0x04, 0x05,
+				     0x06, 0x07, 0x00, 0x01, 0x02, 0x03, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x19, 0x19, 0x19, 0x19);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x18, 0x18, 0x19, 0x19, 0x21, 0x20, 0x23, 0x22, 0x03, 0x02,
+				     0x01, 0x00, 0x07, 0x06, 0x05, 0x04, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x19, 0x19, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x07, 0x08, 0x09, 0x0d, 0x10, 0x14, 0x16, 0x13, 0x24, 0x36,
+				     0x48, 0x4a, 0x58, 0x6f, 0x76, 0x80, 0x97, 0xa5, 0xa8, 0xb5,
+				     0xc6, 0x62, 0x63, 0x68, 0x6f, 0x72, 0x78, 0x7f, 0x7f, 0x00,
+				     0x02, 0x08, 0x0d, 0x0c, 0x0e, 0x0f, 0x10, 0x24, 0x36, 0x48,
+				     0x4a, 0x58, 0x6f, 0x78, 0x82, 0x99, 0xa4, 0xa0, 0xb1, 0xc0,
+				     0x5e, 0x5e, 0x64, 0x6b, 0x6c, 0x73, 0x7f, 0x7f);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x0b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x73);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x6b, 0x6b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN5,
+				     0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+};
+
+static const struct drm_display_mode waveshare_5_0_inch_a_mode = {
+	.clock = 70000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end = 720 + 40 + 20,
+	.htotal = 720 + 40 + 20 + 20,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 30,
+	.vsync_end = 1280 + 30 + 10,
+	.vtotal = 1280 + 30 + 10 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static const struct hx8394_panel_desc waveshare_5_0_inch_a_desc = {
+	.mode = &waveshare_5_0_inch_a_mode,
+	.lanes = 2,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = waveshare_5_0_inch_a_init_sequence,
+};
+
+static const struct drm_display_mode waveshare_5_5_inch_a_mode = {
+	.clock = 65000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 50,
+	.hsync_end = 720 + 50 + 50,
+	.htotal = 720 + 50 + 50 + 10,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 15,
+	.vsync_end = 1280 + 15 + 12,
+	.vtotal = 1280 + 15 + 12 + 4,
+	.width_mm = 62,
+	.height_mm = 110,
+};
+
+static void waveshare_5_5_inch_a_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
+				     0xff, 0x83, 0x94);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETMIPI,
+				     0x61, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
+				     0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
+				     0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
+				     0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
+				     0x86);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
+				     0x86, 0x86);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
+				     0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
+				     0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
+				     0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+				     0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
+				     0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
+				     0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
+				     0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
+				     0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
+				     0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
+				     0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
+				     0x00, 0x13, 0x21, 0x28, 0x2b, 0x2e, 0x32, 0x2f, 0x61, 0x6e,
+				     0x7e, 0x7b, 0x80, 0x8f, 0x91, 0x93, 0x9d, 0x9d, 0x97, 0xa4,
+				     0xb1, 0x57, 0x55, 0x58, 0x5d, 0x60, 0x67, 0x74, 0x7f, 0x00,
+				     0x13, 0x21, 0x28, 0x2b, 0x2e, 0x32, 0x2f, 0x61, 0x6e, 0x7d,
+				     0x7b, 0x7f, 0x8e, 0x90, 0x93, 0x9c, 0x9d, 0x98, 0xa4, 0xb1,
+				     0x58, 0x55, 0x59, 0x5e, 0x61, 0x68, 0x76, 0x7f);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN1,
+				     0x1f, 0x31);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
+				     0x07);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN3,
+				     0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x02);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
+				     0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
+				     0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
+				     0xed);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN6,
+				     0x00, 0xc0);
+};
+
+static const struct hx8394_panel_desc waveshare_5_5_inch_a_desc = {
+	.mode = &waveshare_5_5_inch_a_mode,
+	.lanes = 2,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = waveshare_5_5_inch_a_init_sequence,
+};
+
 static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
@@ -815,6 +1057,8 @@ static const struct of_device_id hx8394_of_match[] = {
 	{ .compatible = "huiling,hl055fhav028c", .data = &hl055fhav028c_desc },
 	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
+	{ .compatible = "waveshare,5.0-dsi-touch-a", .data = &waveshare_5_0_inch_a_desc },
+	{ .compatible = "waveshare,5.5-dsi-touch-a", .data = &waveshare_5_5_inch_a_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx8394_of_match);

-- 
2.47.3

