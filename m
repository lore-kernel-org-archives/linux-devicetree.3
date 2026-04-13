Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0DD3DB64F
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089180; cv=none; b=lZXjIBF1gddpqxX1xZDap0YvgrI/C6yhMMHIyRlSjPvq1nR5aRzfA/y/t2uuOzumcdzPXlGW7C2k9KXIqyblpBfR6/pxAShdNdg0t/Kxle5QakEK8nglgTIrJMYVXFx2Xy2bQTvlkGGp/flOeROdrcLORcbNYt8RisZNFM3PfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089180; c=relaxed/simple;
	bh=JpdFVjFOA408Dyve5igXEKyXmePeVuQuHMaoR/cbAbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9EkG9c+OKnvfvXTs4dKMXVX8MP23s2carwVVfgDjYjXJbPaxdz8HZj8rzDuc2BwW3O+ePshvO2/wr5QNpt2KVRwX15sC8zcak61Mq/hgqDGnFWXno3qHrINs2SWVmGDA41et3MhlH859Ay2Jjy+8Mt0lVqfOYnA6t9nvgyKtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwDHjlwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gA45qspV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwDHjlwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gA45qspV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC822L2187721
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8EtGzpSCzCfnODMqzIYtparaXQEVDZmnCBL+K33210=; b=CwDHjlwN6/e0fNBT
	IdYslY0Z9Tf1ElAMbnIRDy04fn3wW2as0dl4oEcrt38dO75LByfbVovW7y524fA7
	iyn10lN/SUD0uzGIzwSG97EWogVkyg5i8m7UDiCZM/Sg+K5dod/G10X6KQBK1cjd
	3Geo44LvbFdQ9BpxJD9yolQN8lDxo0IiwSv3fIEFdalqVt65qLBEHV48iUeE7dmv
	UUkiaG7725GQCt0ZUWub+qT+mDP28bS/9qOc/e2wnwdEBgwGmQ6L2gIx8dZULPHK
	0mw4VsoJJL1GRNnnXIpPTwydsSUsKbfIBGCwUguGuzXkpSPGlXDRaO9vDt7i7v/m
	4794qQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgdaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:13 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbbef3ff5cso4911110a34.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089173; x=1776693973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8EtGzpSCzCfnODMqzIYtparaXQEVDZmnCBL+K33210=;
        b=gA45qspV1jD7XT0ZfNPbnd6AS8lDqRXVwzAZ2dETlNEgvSV+rR0lexnP0oVWlNqJKe
         ub4Ns2dZnb0SzsRmRSvY9MIZeMYYm+NUHBguBXkErYmmuKUxVxpWX8D9gzm+DI2UPZ1u
         feDAP25qF/dTPGR0ovvvbwvO6jwUHh3B/13rrP87wUYdXAvaLSwgZi1MwceRnMO50x3w
         izpJGQ3Sx0nNOWesGCyZIazjC98y89O4rREgHj3GuZGZLEPLY2MO6xL5CAGXkva+4//z
         gvl9gboMVH4dsm88Ziv0nmkJqom7kC8d+EdIFN3qMrsvUU6A+ZR/donnI2MMwLljcO/C
         Xnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089173; x=1776693973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8EtGzpSCzCfnODMqzIYtparaXQEVDZmnCBL+K33210=;
        b=AOByIlITf14KNyPLFa9Zs+GaE+54bmwLR1z7pnSPhc8NEEpBS8nO+hyKtj6aq3/gv6
         ykfo4sJAP7geHtyahqtu+7bMLy9tR9ZPqvDgfRfdHt9A/ttHgoysMB/4taR1V3QxYlDu
         5rcXwOHJFLxMLGnddufEI2mENKkXxTFyxOlP1u0nc2Zpn+FKwXCo3bNJnj5hVbct7ERK
         0k8KOs4s8AP7lizSgmXzlljq/eN43tty7CGGyesjuJmZdpekox4Vwi32vBCR6vAvXq0E
         wCLaqETJTNvBAuKKQjPDbhfbDt0EvciL/B4oFktA+53E3J8WYLvpKti9Ok6GWLCDhZRx
         hFlw==
X-Forwarded-Encrypted: i=1; AFNElJ+Xw/eR//1J/VMrSv12rmMfb5OW2MLWSoBqdA1Ke0QQP0zkSTCEyocQXQF0FHKu/N8j8IIVze2cdHd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yynw3AvIxhyYRrvbMjJUWFVFnrboMnbqhQDLJaTvlBT3kp8cuv/
	Qk1erZp2MeeIVFiGM12yLmAWRULvd7qCaVSQuHMctahK12+LVr0OVlYRr7VEBvLg7IgdHZJgmsG
	CRjZK1gGELIVcV0b/VvABXdDD8DV72NnH85SMNdFNkm5rGG8ggyR/nPGyPoTWe8cX
X-Gm-Gg: AeBDieuRUSaOPEg5Wyong2qbPMX0JHH2bRffGYmK1bj4VAx0LFkHSvP9+p8j3356neP
	v0XNVzcohP1NAtLBTOroIee0fODQ1eSEvXMSbVxwbPYmidioTqaeQOT5JyViU3ezPltMAje55VV
	4Yp6ACagfkh1SQ+PzsFSaIy98VxozzZFAvhAHeJRIO8hoCUKL8IRJCa1CaoGWmjWF/hsGiFrpvx
	XNxh6J1F1mz++jS6ji7jATAKE29c7J3XCd9mMcaQDV3Jnqpeiudgtwj5fVkynL27Es2ibx3Vkdh
	O6q2OmDotLxu+kuSQldvyUE2tNkyPX3+KMiV5J7yqzJ/nf8zTUsRSAHGezH4ikj87+h3YHn9Abs
	esgXcEBVPFZprI3FqvKBiyPJgPer6a7Pb3TrM0/mzqX94NdUIK9vzm3w4Kuw6M7F4HGPU7koaun
	C5omIeGKFPQdOSDB1HzTZNXNYBPwAHB9MQaHU=
X-Received: by 2002:a05:6808:344c:b0:467:bfa:bdb2 with SMTP id 5614622812f47-478a0400607mr6863761b6e.25.1776089172668;
        Mon, 13 Apr 2026 07:06:12 -0700 (PDT)
X-Received: by 2002:a05:6808:344c:b0:467:bfa:bdb2 with SMTP id 5614622812f47-478a0400607mr6863706b6e.25.1776089171948;
        Mon, 13 Apr 2026 07:06:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:38 +0300
Subject: [PATCH v3 15/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 WXGA DSI panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-15-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=27749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JpdFVjFOA408Dyve5igXEKyXmePeVuQuHMaoR/cbAbE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgoKNPynlErXs4q5Z05hQZ+IWKSE9WfoBhNC
 2RLi1hwqaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KAAKCRCLPIo+Aiko
 1SnAB/9yyEZ45QALzIXQlpL7s5VOSLneUWQ86B+cMqrLq6PvkcWKD2vhzlbADurkRC+J+Uilkq6
 wZLU4U0Hn5VzWd1PDL7C6t5nSEDT/NjfZRVdmjvqDH7VY6gbBPkz/gSMI6rgVOmAMarx+6nhbVq
 ScNA5BHxRuQOzEzNYi/1GNXVQ0EQ93d6ULiMtSMoulUzYksyiRlKndPAKcdpwD1YrfESibv4wN0
 NnmM7OTAsIpPHMWX3+WbuTANGpBtBmgFqxbUnFOfGFnrQXbzr63O/OMk48qFAcJScMQnPkgwa5b
 8mR2WMTxGMhWHZ3WwffHF7OIE3u+DvHRyEK/wHjhxoJYf8QD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GgYmyz9WaPjcFr0FD9unA815DRXv401r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX92SXj0+heXmP
 9Z3w25SLgyx8LHk5COJOix8kDSVMx372FsTWibgIuVprRMRwc+S+zCs+fXqfrvPE9N+h+VirLrX
 JHslcQa79KpLNsFttZG7ukYIeh/ig6fRCDXSShukTGiUfkyIiycbjU/82hN3rC0vc7/KJMML4Nb
 Q6w8sfZ+KBdL3Q7bOxdWNmvYJ8OB7FGJTBK3T8AARj7xvfmOuM+RRx5dgU24WJyIUHbrnQEyE3L
 n5gvaJmYRQhhBza9KvtbDARu/xra4uVKZuEQjvpEtlDOIF+mS3FEi5qhaPrXeZ66GioaLQ5Wsdn
 dUA3It91QmggiKxd1phA6ulbeHOLkoW+dZR6a41zuy3P3anMeL1Zz+UeQ3gkUpCwqZs4LSm7sLU
 liukMIrE8jPd53Eq5ai3EOInM/4LyjsoKi0W5BScsvmXpIh8tCLp9Dh5opZWpn1KV6Oym+3GGRd
 esaG7jwy5ruthqQKlbA==
X-Proofpoint-GUID: GgYmyz9WaPjcFr0FD9unA815DRXv401r
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcf856 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=apVvwWDxUfMmm3v5wtwA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Add configuration for several Waveshare 8.0" and 10.1" WXGA DSI panels
using JD9365 controller

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 568 +++++++++++++++++++++++
 1 file changed, 568 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 61d67efed379..7744c66514c9 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -2067,6 +2067,566 @@ static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
 		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
 };
 
+static int waveshare_8_0_a_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7e);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xb7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xb7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x7b);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
+	if (jadard->dsi->lanes != 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+	}
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(60);
+
+	return 0;
+}
+
+static const struct drm_display_mode waveshare_8_0_a_mode = {
+	.clock		= (800 + 40 + 20 + 20) * (1280 + 30 + 12 + 4) * 60 / 1000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 40,
+	.hsync_end	= 800 + 40 + 20,
+	.htotal		= 800 + 40 + 20 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 30,
+	.vsync_end	= 1280 + 30 + 12,
+	.vtotal		= 1280 + 30 + 12 + 4,
+
+	.width_mm	= 107,
+	.height_mm	= 172,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct jadard_panel_desc waveshare_8_0_inch_a_desc = {
+	.mode_4ln = &waveshare_8_0_a_mode,
+	.mode_2ln = &waveshare_8_0_a_mode,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_8_0_a_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static const struct drm_display_mode waveshare_10_1_a_mode = {
+	.clock		= (800 + 40 + 20 + 20) * (1280 + 20 + 20 + 4) * 60 / 1000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 40,
+	.hsync_end	= 800 + 40 + 20,
+	.htotal		= 800 + 40 + 20 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 20,
+	.vsync_end	= 1280 + 20 + 20,
+	.vtotal		= 1280 + 20 + 20 + 4,
+
+	.width_mm	= 135,
+	.height_mm	= 216,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int waveshare_10_1_a_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x3b);
+	else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x38);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x38);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xaf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xaf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x81);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x14);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x23);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0d);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5c);
+	} else  {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5b);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x4f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2b);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2a);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x43);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x63);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x44);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x52);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x4e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x20);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0f);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x59);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4c);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x48);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x3a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x26);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5c);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5b);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x4f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2b);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2a);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x43);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x63);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x44);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x52);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x4e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x20);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0f);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x59);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4c);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x48);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x3a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x26);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x02);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x02);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x37);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x37);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x77);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x77);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x49);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x01);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x01);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x37);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x37);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x77);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x77);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x48);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x16);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x1d);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xdd);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x3f);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x82);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
+	if (jadard->dsi->lanes != 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+	}
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x0c);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(60);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_10_1_inch_a_desc = {
+	.mode_4ln = &waveshare_10_1_a_mode,
+	.mode_2ln = &waveshare_10_1_a_mode,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_10_1_a_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -2198,6 +2758,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "waveshare,4.0-dsi-touch-c",
 		.data = &waveshare_4_0_inch_c_desc
 	},
+	{
+		.compatible = "waveshare,8.0-dsi-touch-a",
+		.data = &waveshare_8_0_inch_a_desc
+	},
+	{
+		.compatible = "waveshare,10.1-dsi-touch-a",
+		.data = &waveshare_10_1_inch_a_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);

-- 
2.47.3

