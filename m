Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25CC3537DB
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909466; cv=none; b=Hec4zNtoMw6k3O8UOYT6tu4PKvQwTLiNYCXyPDJslvdVWLYkOSRtehKO+tshZVT/e206brabtrg66+5OR0sI5lpH60ypFjghzpOvo/dvKuBgyc/LYaV5zELP2wnrpgP7nT3cyt71iIVSMcOQ4qG7J4/hrCL+9HcGr4LmDsQ98oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909466; c=relaxed/simple;
	bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHoAHtPGnSXXJq9TJBlmsU97eMQUBl5NNDtayyzglbO8t4Hx0q3PWq+bOWnOO8yST45hUHhl5FaAXECGFrGCZ8C+7Ab5kvnNpCt04oTtgDYhWWWBVcUM9NveQeNMZSXcYw3zW01TtjgMbwPVJTeh2m83L5CRniR3knqEGh/wFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQd9pc7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ucj/2+Xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQd9pc7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ucj/2+Xz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B40K0t3909835
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=; b=PQd9pc7dzAmvabk4
	0shXHW8K0qZ4q5zBOrVAHGRlysFQNVP5O1BWUvfoTW5GdUYqGPjr7NfGXcjg/rlR
	cxriMz3KVW9G6oO92ZvzTzrcWqpb1VfpVZiZ8kj9tNMRx+QXwIr8pQ5fYqCEkzMV
	MP3xzAefC1HPbHd6YRrcyFYycQez94N6Ptkqr7GXfgPr+avflvRHzkcvSiWUStEc
	1ga7P2DKEOSD8SSz5IOJlrgMXB4e49NDLuidkhw2rqhFRm5VdbR5ibA8RvlbU5Bo
	Y5s5r8wLCNMXPMr9uG0Wv6a8nm71fnTCBrJupCzhSeBkBuZ3dzV404ZEk7yHB+jU
	viqR7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00nb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c192b3fso49845591cf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909463; x=1776514263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=Ucj/2+Xz0XTFtG3NTFfdQP39v0Up21is3eKPXyGhmPvxjR9PXnZkRV82b2rz/MLupG
         v2+zyqf9t0Iir9Blg95epp2Ht1JNHs/WTo8x08djArTpiLcM4XbcB4NwouhWhNTyrABs
         I3OE9n/IJQyyFe1QNKYQS99alkdq6+iqspne7BqsBu6NUMw2/dKXoN5U25YzWbCrE9LM
         ZMjSdhGMXRasmJ6zOkfTEMfr3mS4D6vak8Bsk2dy6eHXaYeB2RetL8/DqKRqSdIKHY9C
         caq7TlZi3ml7mUtCaQTtpmsrAWsFz7R3WuB78pVj6hJ5YgpBDExkonUXE3q9c24tAy2K
         kYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909463; x=1776514263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W391/07ZMOVK4atGULPN5+Bm76UZpkvj4qbP9sDT2Og=;
        b=OQNfpP++5VkdAs86tzll5WNO59fUklhQRXCbCZHPLsczGz/dzc60JVSOSO7LLHFaSs
         HEEFJNj3yGspk3Ij1+/c5vRM512Nl7gKRz+ApseCYDfoqdGWDDxY1kVqzSwPIT2I47JG
         3zpXL2d+U8E78V9mfi5ytNkvgyjZOeOq2AkRoW2iNR3Y4aHNMECqtbqmN1Ig1r4QSm7O
         gIGvFmVjmyPO6OVYlaqXSgZGMBtQcaom6XTVAnouWgfEZcxNuDTcPMelbE5TSrIwP8h4
         meN/4Thf7mjnuMENuqshZ91ZU6BVVV2WUbu3F3EZVLhfShlAgRDMn7lmo4XLnKR+sm09
         ljlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdAXgxp9Hip6QiPNxr9AYEEWzhJHdrgjqmdBpxUlcCLpQMH9kx32/dSAI/sQykjzudN8lvay6bzxAU@vger.kernel.org
X-Gm-Message-State: AOJu0YzK4E2wU8onYTCxwhwNsXJ3d2Hb96KD67w9dqyHXYnr+Hs633t8
	IbyK2pS3I0lmWBkrniIpPRHZi70ERo9IeLQu/zAN2Wp5iWtj6Iia+SB8wQscxWwXcBVtlJvUlNr
	3MaRnuo+qBCBOKP1lDJPo3SzesXumRhbRejGyZZWydaIr3PyDc95eJEjQF4s6MIPF
X-Gm-Gg: AeBDietd/Cht/npIHUkXap5BCLPiXB2r1BgvhE1QVnZsCBpm2o3Z7fegG/yz86t6o12
	dK5TlGcaot/OzB6Rbz5OCwRTrNPWTAjyzuUnzms1B5ecQujLVaEGNPbY0IsXi9OwzKPq8Doba3H
	d+9HKIHxqbLW0xWEFELxbfen92omOeNDHwfgwvVUkFwsZRJTwe/4rGxwBaHTfO/+JD5NeYbct//
	I6FMIj0rbZvJsz/Jbeqc2KJ3Mo02RyntWqO9JQkd8/6GETJrFSnR2YFrWYODrHA1BTllci1AmZq
	lBN5uLFee+hS2Ex7cQ4khmJSRgNd1CfffTYCNz7B9UwVP6MCzoTmNWAqK+qBSohSoDz7nFPTuqH
	ubWcN5TK8tlQ8eQJkC21926kcMN73q8nXoGtyNf0zkU4KZS0sxN8Aiad2r2Cp8FVBf876/AlCr4
	hUUtazos1V34ERe41gm1GKXI7ur3xrBmA/4oM=
X-Received: by 2002:a05:622a:2b09:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50dd5b9562fmr92999861cf.5.1775909463320;
        Sat, 11 Apr 2026 05:11:03 -0700 (PDT)
X-Received: by 2002:a05:622a:2b09:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50dd5b9562fmr92999401cf.5.1775909462797;
        Sat, 11 Apr 2026 05:11:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:27 +0300
Subject: [PATCH v2 07/21] drm/panel: himax-hx83102: support Waveshare 12.3"
 DSI panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-7-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8981;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i3q+ZnanPV6G/1cXFp+xLd7TApeXEUOIHGf51LyJVuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpF8uTwcBObArCbTTBldsTi3CrIuMFueegoj
 HVb00f0jymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1Yn2B/950ZvwLklYqtNN0LZoJzkZQylRolF2pPKy2ExV1h102ubKyQYlApY1jO9xv0uz37QjpM+
 Sj0t1MJAlDUul79GmiNiVUD7fiLaOurr+vKqCJridTBLn7WirF2dLEqeeBiTzq7KVD9da34o7fG
 bbJpV6+j72KD1KAb/0mopkr42VmnzpXHSKQERCC4bm7TujRk4XmoyWgguFMMf6Z8A1kN7cKVl0j
 DJJoFjLw5ri8PSjv/n8zgiyNg61r9PobntlJHtdzDqT9KwlfE6Poa6yfY1WmBjsIqpb95C7NKAU
 Ywod4d01f7C9Pw1UtHpd7RjdPXeN3t7tNzATx07Hm2DSE2nu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXw8zUEnSErPlL
 TI1jbdw06cWcEln1kUH7Q0FgApxw8aI05v0iikjdq/tXV0t6WwDa/UN7+MrKR813VMhoB92fa50
 Q7elYQ4IPvymTzJC3qbc3PQSwnw3XXvhZHBIrEHIVd/RMXOXaUBWCJrTnYSB8TcblHVsJM14UOu
 0B7wHrfKVOQvdNB0xc+ranUkrHKb6dC1sfDIHKHpfdv9yNrIZ+6vz6GydL2bTnkw/9Z1WBmgFTB
 /RrzVSRIhDR5ygTzo9rSVUYpw9UDTPVHOmF8touavFyBm8X8StSEDaL7Ta1PR6fR/T4pguAR9Nn
 moJvz8VtgLSHB5S9Vt4pKLlEITfwjEeOf4LByiLB/AQWW9qWu7CNL96nxdRgXrMoUQtLmywfrcS
 zYOcZc0q2QTyG/DUrVtchY3Z31BMylZpqxs/nM1co50mLzjQNMBB2UZOF7w1whWrZJjKSOSeKFI
 tJ9kxM9pHwEz30tjXPQ==
X-Proofpoint-GUID: jeSKu0wYryA9alKwiUPK02f6aFjFsn7q
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da3a58 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6dGl3bZOZdHCWiLLNVsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jeSKu0wYryA9alKwiUPK02f6aFjFsn7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

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

