Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353030C158
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 00:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360354; cv=none; b=lygMX4QiHQvpJI9kyfnf5uQSu0eDzg4juEyD9DnmUbm+CZJHZEpyeNv8uoCtyPC3A52TzwmnaNCHnvetbPmfKa/TQzEfLDISX/I5H/9FBf8bvmn6rY9GssGkgReuA1jCfH2xYMujDj02jwBW8CdMQXVmtm0/ONAnuNGePcgyLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360354; c=relaxed/simple;
	bh=iPScbSltF8/cuPWN2KBgNJ3WGrtroA5TrI0yo46SgRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOyl92LrXIjX/Bw9AXDSQIkNLd7qU6I3OKYiKXSOuS5ECTIg33h/ZuCEk5eKOZxr7MaCWLEuIJ0vMjVeG3f1EdQ5WoePO7Xd7sRwYdMQgLSQi6rsOrrApkrDXnpXqpA5uMmS+2yV0MYmdF7bzLgrc4mRDk2zjn3M0balQCikbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovnotb90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MESZBTKX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovnotb90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MESZBTKX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520MW8d2740416
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 00:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mZxV21KQ3tL9oFzLvCHMLnrJSP5MCm1mDXaNoEH23U=; b=ovnotb90vGW0qfc7
	KvI7iTr0CFA6WQCRGewcxhD6b5ldHIOv1RHUTMMwUTi54LqPBX7TA6P4twO8WUWy
	KFg/dHjHp7x9xKNgmP7UjFVWre9W8lL6MXsPFnXdBsWxggXx1KBlIamJHRtOab2c
	ZDY+EA5carqQShjHrWAHNC0qxLAHEo24mLmgy20EfBCBryHB1wYiDqtLNKg/k9Lo
	FRcCNwUvffspEwTz9eijKCVneBvWeoAXCcNgtrsRDiAJZLXFs3ACdnV7PZHtz+o7
	uTUhXHAWVDecQdi3Eb+WDX2vixpYyVIgQltn+XzUH6gwpuPOi4UO0JYgMZBTaUzG
	kvB5+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqkra2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:32:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso5287416eec.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780360351; x=1780965151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mZxV21KQ3tL9oFzLvCHMLnrJSP5MCm1mDXaNoEH23U=;
        b=MESZBTKXWNj3BLyRKoTRtBbNzi34coXrBAfLXtAJQZ+BGLMybMv53kQ+TXfV51iyVG
         P9w09opWjn2oId5ALvofCPsVixNpVJdfVuNy9YICmx8jYbE2Qkv2LiIjhECxR9V5Ab8O
         iYO9YBW9zzF87iHcRHAS91TgcqBcUZsqKalbovfLjeZJrV273NQHfmm8oOGKWUsxiq2f
         ZXCMkf2GJ8AYW4hlkzRjPfWDgjCv/vuJqRzj2POiMtxI9GK7CtNJJEh+LFHu9JmOSd+L
         ozP40+eG/Y/gmEm4TTxTdzay/oegR2iYC/LzSkDrirHqKGySNhhlFsP5gH7XZYMKjZt9
         pG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780360351; x=1780965151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mZxV21KQ3tL9oFzLvCHMLnrJSP5MCm1mDXaNoEH23U=;
        b=GHBlB5kgFumas1/JnOaG2VsFlbLtivptOkFPuBs5yDpOQDBKDRPF/bAutVVzyGnlhW
         QTgFWSKrA6JdSpeC0vHsMJGxA7FdGw1dmS6r3na18S8XhVSjAMrO8VUw+isYgYlT2pR7
         AbwMKbDxqY1JF+/pb/OX097I6Uh8ouM8VQnQ7pDgaFlHlcqdjYT5umMih1/S/ALB11CW
         2JWOtTkcnhLkFz1NHr/FcbJLDxjOnkDPeYbwMo5LFaot9yf6N2lrv5ero1Stxj6kRgdc
         5bs6n8KIxQevYSmjcMon0H3Nf5m/+mWDtt+2fabUU9B442OSuwR9sI9OUW5OYmNDCyib
         sEvw==
X-Forwarded-Encrypted: i=1; AFNElJ9Nz4bcZbAnsERT+yTrbU17ozYx5K3uKVsyPSOuaLz1Y453eptd3kFq+CkLyfkLPldztxVcwDLy8Tz2@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhlBmbq4yr+Y0xG0TcxC2xlsw3Rn7SRmPUdspzz9U9x/aOM+K
	3NFjOQwn37W6KWQTWRhZ+5/HPuphYDh9WlDxlTGDz7MvrzTOKPdiupwwZGH7Sf1rSHfp2va8Jmq
	l1mvxLgGom9Mj37MKDe7rgsza7U+1dQuKQHJLnFWC7tImCg+6dyYPCEoOIACTTvpY
X-Gm-Gg: Acq92OHkaoQ+3mRLYb3IUXnvI0RZ/T6mPxgITyFCxZtLagKm5M9G8W2fpTJwyY4yAnp
	tulylHoIwqPskvKzcSMNReTVCPMFUrwRwn0KoquEhUl+AdOyf6Ke7o6/BNWfW5U/L1zpCcxgELG
	C1j+C/ohJz/pfhdhKaRVyISFjA2YAdjdpJ6nW7P2pWPaiDUDIotmrDzWB7S0OEx0R9+K5ArvSIa
	CC3p78qCu/t/TLUUuKrB2bkvNH8Nu27vd7jl1NMT5ZKURoEbNUlKGl9i10f897JAmMcGgW9z9fG
	teOsp/LWskBFAruEu+SifeNMi03Yo0yn32ts6b6MrY6umrvpRVkR+CwuKKQmwwgcE8VIIhehDlJ
	4c+VBAqILfjTH8swBRr1Yl+pj4Zfpa5AUJbR+BkSOT9LCzGmlUzURtwcFo7iafOiPwI0+8nBW+m
	A0O/9w499lAPA=
X-Received: by 2002:a05:7301:1284:b0:304:8361:a87e with SMTP id 5a478bee46e88-304fa72372emr5489904eec.33.1780360350780;
        Mon, 01 Jun 2026 17:32:30 -0700 (PDT)
X-Received: by 2002:a05:7301:1284:b0:304:8361:a87e with SMTP id 5a478bee46e88-304fa72372emr5489887eec.33.1780360350213;
        Mon, 01 Jun 2026 17:32:30 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm10070412eec.15.2026.06.01.17.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 17:32:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 17:32:24 -0700
Subject: [PATCH v5 5/5] media: qcom: camss: vfe: Add support for VFE 980
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v5-5-dac36a190de8@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: I7TBSmBMHSCIbumVT0xS2jVSH0MuoVaP
X-Proofpoint-GUID: I7TBSmBMHSCIbumVT0xS2jVSH0MuoVaP
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1e249f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3rR15nC7HOTWOJgZU7UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAwMyBTYWx0ZWRfX9UbBKtp1WEMH
 mkoIBTMQkV0bARTgJV+A/233gZ+0R0tK5pwb5aR5ZyyWLv06wMiL6Ika5vdms48jIeGJSB9ulvT
 qk/iCwgfYftp4I//9nSjp47GsAatGpVAkGI62WAHLZ2adwT6totCvDk8/46mzXPkSVPNLYefvjQ
 +CR2jf/QVd8sQwyO/b/T8/gQOCDh6uvW1ITW+hWI0ydQxaI715qT1i0LkgmruqwcK0w9fogIS1q
 RbOLHb3DgOhiTao3rNtOut6i7+JeFG/bKOuiJ5VKUMl7tmNH1Upi2ap62IHGJYjbIhok4MQngTr
 YTvCZVD0fXcT3yqKSImFf6HjXuZbu2RvpiXXWOiPamDGo3E4WaZMWPZrFPuhfLKpOGkyzuq6o5c
 vgm+44Oe/4C2kIcjrcoT0zNTkyILAYVrwsCNTMlu/J26cJmPwogRYgy5zrPTYO2y6DJNW64dDMF
 2RkbwVOsL+D3w9mS8oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020003

Add support for Video Front End (VFE) that is on the SM8750 SoCs. VFE
gen4 has support for VFE 980. This change limits SM8750 VFE output lines
to 3 for now as constrained by the CAMSS driver framework.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 135 +++++++++++++++++++++
 3 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710..46d8e61b9bac 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 826ab85a44a1..ffa61ce021b4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -352,6 +352,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2016,6 +2017,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ce1a9bbff203..f262a5135fb1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4729,6 +4729,139 @@ static const struct camss_subdev_resources csid_res_8750[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8750[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe0_fast_ahb", "vfe0",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe1_fast_ahb", "vfe1",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe2_fast_ahb", "vfe2",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -6297,9 +6430,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
 	.csid_res = csid_res_8750,
+	.vfe_res = vfe_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.csid_num = ARRAY_SIZE(csid_res_8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

