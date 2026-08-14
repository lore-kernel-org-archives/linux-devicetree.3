Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C134750B
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685139; cv=none; b=ViVnusCZmTKARXUltMz86f2EvQiVUgm0NBlU+XIQN4G2jSxzbsyMLGKBifXSNSC1z8UEIJ4MvpmVXK4y5AKw0BCUTZ6fxh9EpdYrulhLO8AKDtpVTTA1+hVdu8g9vqerPOFnI2PIGmSzGjeIFFsS9tbl4GlBujK9waHyf/VE1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685139; c=relaxed/simple;
	bh=IDfGdt05wbKpTqwcyV3ZKkZoOhDE/6Rs6DoHy4UqGl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmDV/y9jX7Q3hkyXx4othVycYv8x9jP20eSRXY3GhXhiudwVqJ2+tH4bqD5QK+I3W7P6MmKY7OEe8KFtYXVNMLBUvZKMHUYu4rGa4+MRSW0CXvBvZygF1QDRQfPd6P8okjyw+igGaQKHDsGai3tIaedhF0GKGhJXFTDh509GJ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGHvo4sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J16B2Tiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGHvo4sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J16B2Tiv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QivI308303
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ce0j9kqec2BozQCWX/HU4Au7T9oVRbcvVr4ZTiOz7M4=; b=AGHvo4sTvRIsxhAS
	g4gjjAERmGalPLRoiXaXfORg8yaHEHsAGB44ORR2UD9TUfc1D4qXDXHcsh5PzZf9
	9uby9Gw7T77JzmGS+xJ83RESCUBuDf3fKzY/21eaeDvleMi38RFbD1PICMHUOgb3
	fbs8SY9OnqzV8DvZBmoLK5pfxjvy2+UAlCiTwgGO0GBRior7IG5Pv06qc9zFkmO2
	HU3u5DYoy7Hid0lDgqwwjmHFnjXy1oZtwvQ+5VVQ17EUS6nATqEpvcJC8sdwA058
	5OGai+wJX+Dx17wx14VbePkkDkwVRgdeR9WWOQuUm7brsQy7W/Wb+sr2wV4d/HIU
	4sDbrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f2fd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d0458558f7so1663945ad.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786685136; x=1787289936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ce0j9kqec2BozQCWX/HU4Au7T9oVRbcvVr4ZTiOz7M4=;
        b=J16B2Tivi7jOBOFThqd4IlOqWWq5ABlpOIwBPVnWvewaZxendpgoZz4NqDwVT8rK5p
         jmDw9rmlvN7yRyjS9Xb8ln57cG5nzBQR8IcX26w5Ul4I7ERvqzhirJ6HcA/SIx+Qa9bg
         z+Baz2YmM8vGF8qaYF+w382FVPfVb6d7WQnjhmLRoFOi8nRmV+lO86CpkyiVD5Th5sjh
         vUd4x4UstkMhL3IKMQAwFBrlew2EenCqmRGEHYuD/dDW3mnppU00Zl1okhG7BxkkSekg
         KR/z3DXcdu22Q/cl9+IazFMklId9R+iEyuLZiOCgwfPdsLftYMsx2qA7sGLevs2JQVrJ
         A9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685136; x=1787289936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ce0j9kqec2BozQCWX/HU4Au7T9oVRbcvVr4ZTiOz7M4=;
        b=BzcpTcKYTHcNHLIAkNGUXbR2gAil8Uds3GgGiBdFJ+5pjsb+0i15gAFcWH9yPwtAhB
         veardrvhoblME5YfqGwHPXp6Mu5OgsaVZrBj/tbvO0EWyqNVE6MIWWQpZJo77CnPEse4
         J2Tgxj9xOF2q351d07culnhiKMC8OkCGnx3vYPbYpC0d9eKhWsaRYFC6Tn3G6SVNS8Mm
         2NcZASGtWm0qQZPHD6gnTOckCk1yVqvjjfyvNgCvfthujkmQAnuzkUn2LGiskQESzOOh
         eTjIfPtOfhj89rUApUkd5Z3CjIjuEuqHMv140MSA8KIBW1jNceSnqVhuyJh2CiqOEffj
         a4qg==
X-Forwarded-Encrypted: i=1; AHgh+RpYL9u+jUEuKT1GEUITJHjdXn9LRTa/GOkhMZr1/EQ1Ato35kcJLRfASwFXGTRZV/HTnxviAskI+9Pn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7yNA5j9xJqElmH3t2waG+mzeFVNpeFb/FdcjubiJAc6msNJu+
	ORDqyw84/f+dOEdcsxI/6Z8rNLaMEYnlaFQlFdWwJz6MargApJm22jNTPrb0QhtXlBcMTzY0Q41
	NXce0u1MaWUKBzvRA4LJiZGcWLnswSmvEPiNSidZ2kKGY55s/C82BT+8IqCHu0oZn
X-Gm-Gg: AR+sD13uvXkfNn3MnLFLQr7uPUQ6Uj2ZpeVO4rQ9Yi5q0TlsU4L6XjI6i5jQbnpB546
	LrP33gr+9sRwVS0Dkzd4q6Y9jYxCaBVxu1rFm/cUdxaIyC70t1gBLbLTNwyQHMDrhB7/ByLFrVz
	rESMk6BzEUUr5gfK1ByQHWDUe6LWEFRGCC8WE/Gv1RDZ6xGC5X5/0mWL6xvLkGj+5MqQrSWYWW/
	44n11/uIvGtafnzEHUG/abjAd/BH4NayyUeRw+W/KpFObYKRv26Ko7DEoVmNBuuRZHFX3OapLG/
	2U2vVVZZkPZ/2/ncxEb4sXZ2p1T9DQ+k2mIRZyKe1q3IBFslf0oZzTYAVofuYC+h9tsPr3/ZdD/
	jT3tuPgMqsmEgGV8JMONzYeNaYGhMy+wUblGUOQat999Rz4vFvxrEjUHQwowPJEl3NokW1HUcR5
	w1/mY0Zg45VpJsXYnLH3KI
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d3b04fdcb2mr28534965ad.0.1786685135846;
        Thu, 13 Aug 2026 22:25:35 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d3b04fdcb2mr28534395ad.0.1786685135117;
        Thu, 13 Aug 2026 22:25:35 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a0b4sm4545835ad.53.2026.08.13.22.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:25:33 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:55:14 +0530
Subject: [PATCH v3 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-b4-lvds-panel-doc-v3-2-1ad152a4d3ec@oss.qualcomm.com>
References: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
In-Reply-To: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786685115; l=1815;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=IDfGdt05wbKpTqwcyV3ZKkZoOhDE/6Rs6DoHy4UqGl4=;
 b=Px9ZZvPD2msFkzIyxT52YmJ/GV7f4w+8Q0kG4oLoyF7LpDRhUIoupdm5dtgRfecVHBkJR9A6X
 CXIQB+079fECSncKXtc/wawq6cTLWbgnF7GADVMoFSjdwM0jZiF5GF4
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7ea6d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bP93rsPOkRt1mgqf1Q8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8x4_qIrvFNAzKlNeoDvaqn4EMgiQV8YE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfX0EEy5u/b5ZDd
 V7Zw2P700R+uWy2CgaYnbEdI8gm1utRjOag5OdtmM7YBdSc1C9l1GA92808Wq7EnrsmuCLCu0jx
 azlLZwBuNhU0BmgQDW2U+zTdWQsqEEkNUrOxsD4MympOdM6JqwBpqXd3vhV5N8de+tkRqcgVA0N
 5eo4Bw2gVZhEUSUgiZVAA56QmvgDGa0o49G5mIc60Nhlgry/60DiYqz+XLUHVMweKHtBqTxNoiG
 WUEV2oa1Cwr28gzvOfR9r2i99cK+Zpaki27TSHlafESa+5i6yjHo+fWHlCqrOcUyXX0dw7NIrxF
 7cAASxFUwXOCd3kzvPWpKTvrWFxSmNAI0TM4BE+prTkFQ1KeohZcEK5HU1s65fcEBmwNxsEmA7Y
 pKO9yuVP8Tbs7sC9+yokKgd7jlRz1Zit6MvdOuSrIz5ZcrVylbEByQQhI/Dcs0PDO0edTjpxKBt
 QcEhlcsHdno7xcrI8WA==
X-Proofpoint-ORIG-GUID: 8x4_qIrvFNAzKlNeoDvaqn4EMgiQV8YE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfXzqHfXssPmnMC
 0FyKuBxatR/JZT1TNaG2bcyC0ZOLMFIqUIfbdIrPxc2cPfFBicpUH+pNqYKVa55E8QVrj1DrRXG
 mS3wdkF3wum9C7XR5ftGMLU2JuXBZeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140039

Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
LVDS panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5c169fdf265c..d95f842c8980 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1563,6 +1563,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing boe_dv215fhm_r01_timing = {
+	.pixelclock = { 148500000, 148500000, 148500000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 88, 88, 88 },
+	.hback_porch = { 148, 148, 148 },
+	.hsync_len = { 44, 44, 44 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 36, 36, 36 },
+	.vsync_len = { 5, 5, 5 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc boe_dv215fhm_r01 = {
+	.timings = &boe_dv215fhm_r01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 476,
+		.height = 268,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing boe_ev121wxm_n10_1850_timing = {
 	.pixelclock = { 69922000, 71000000, 72293000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -5726,6 +5751,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,bp101wx1-100",
 		.data = &boe_bp101wx1_100,
+	}, {
+		.compatible = "boe,dv215fhm-r01",
+		.data = &boe_dv215fhm_r01,
 	}, {
 		.compatible = "boe,ev121wxm-n10-1850",
 		.data = &boe_ev121wxm_n10_1850,

-- 
2.34.1

