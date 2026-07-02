Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7D3EDAB8
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989560; cv=none; b=W+ufgd8Ozc/c/hGIVYwvznNtTB4u1ehLEFr/dN3lo71B/sTFW3DtZtZv7d6yUguFjuAR3++gfzB0y8Wspx7k5IiieckvXnrhOCB4MbBbyO22aVRYPRO7SQzCTvSfHn3tiXXc83xE6WGHIR+0Xi6cqmIk8zS2fdVzXDDgpbS0wpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989560; c=relaxed/simple;
	bh=r2RWKItATogrFpCxA+Z7sBntBTRv6KdEdO28LsUvMK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3SwCNNPyvGTZaZv7G6cWC81H8eK5p7vBwbDvAiWMyHobuB0yUAHGX6YVUrzIUO0LmHCUdmgZOn2vV/WfF+u5zPlfxgicvRfA9c5IQPne9Z4+bA2VTyvEyQGc57EVrOZIBKoNSdt6KOGH/GFL4Y0JdbmmW9wq8SrO+Nqs8Ai+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZBAAwba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3tA5SZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZBAAwba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3tA5SZ0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iIEi3591717
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4+jth9ICifzPnHyut3VZxL6/kBiIZNW+jfYY9v2qV8=; b=PZBAAwba/mncpSRJ
	V7mn49kr6gMdAMbV3+QJFBT7VaxMlo2aXWPGYgIkOI85llX3zeZ9rn8BNq4R+KtF
	7PqS3vWQNwqDMCKmioBiKejmeRKP9r1vq1zbOhcuPXePuXdXjdmPj7J8aCWuBtiU
	0GgSdmnJTk5XWpHipRVdR0T0HeLbt3owDgc7WUbIX+Kv1qo0jivVp932iiJp/2+t
	mDymBnj/v9QU+6BSFuSnMQrvSCXfhzhUK6LTlpyhpjVEkU0kkEkFduHA9mwwcpt5
	rVM3x7JKIyNstPJojP1UgJ7DfuExmaN+8tXOnw5LT19URSzHXrTvMMKh3EXHgfku
	x3uYwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9b2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:52:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef81cc115cso4066456d6.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989556; x=1783594356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4+jth9ICifzPnHyut3VZxL6/kBiIZNW+jfYY9v2qV8=;
        b=Y3tA5SZ0/M2KwP7UoeO6sHLLTl0FxrWD5XKFxCkw5T6ao6qlpsXNNCisEamfJARgpQ
         wOvXQkbD6kWmR2gGSW5m2KaMrPgO/fUkKZInFQtg5wtGwrhyL10rUakFsaVVfJAZmCEb
         W34yr1Ng5SOLqhYP6HYU1a2NpHLkKW+OFMwCOqneMETtjVINd9kUTkuy4CgFXgX0wNnR
         vMzE33VFwi0BHh4wFXXVMwrzjdlnAqEjQ9aId4xyhJCAMX2rfiqUGoSU5cNRC5KnVTxV
         4AxbOmAouN9HK1YLmmmCyG1S3BtWX8DWRQfr//+6yds6QRB9koZpcahmNPcmA31xx+pQ
         I6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989556; x=1783594356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V4+jth9ICifzPnHyut3VZxL6/kBiIZNW+jfYY9v2qV8=;
        b=OL99izWlAnBWCX6FcWlBmCuWL3dVbXHMDNkQU2QAedERJkaQj1qreghnPCwMloUXvS
         IcXJUTzssRzPDM5IbLIhHgKze7BMo/s4HZucrD8ekNtBWJrc6QSBOUi3wEz+NkyryOh6
         gHnZkRe2T2LQbZ9b9ONUl000fZ7OWIFYiy2L2wZ3g8xChnM4eFySADJy0+UlqNp1pR4V
         2R/XYwnkMD3N90SKaX1Bc5+Adu2yebfwNhwp+zBZreUcXHeBNGrk+feru7NC3hqFyWpr
         Hhl9A3V3yh9Ickd3k3wMCqhG6K95AjxrdcuPssXfvVEiLuV0I7KVnIWjneiM8U6Cxo0+
         OOTg==
X-Forwarded-Encrypted: i=1; AFNElJ8heuMD71LyFLaCM2Hij74FCKN3Krv5wjckhd33ZSMOKuUnyD5BhdrbhWhyqby2/j+8LGJukg/fCWxH@vger.kernel.org
X-Gm-Message-State: AOJu0YxJT5zWEfM7Kzlg/mS+wTZ8SsX2I31LHHrVMB8jo3Quaipdq9Gu
	pFdfYCnSdVccb5z5FxLN85T8NBMMhvdmvAcxWjT4sdT2/KQYwspnE1bkHeXf2LLO9KYOPu9xR1P
	/xfr8Jr/mmgtKu1xsgJyKhTJ/peg27Ju7d1pmKyaYAk92outQtmTcKAQbR8/2VGaf
X-Gm-Gg: AfdE7ckx/ggsxtxcDz/x9h0YUk+SAwIAKtpDlMpU+V7chnz9U1S/wLiUzamn/ENNiWG
	MWnUepa/igUKxXyvpzkLjgpEppzYWf3yyC1kPt0htNxf6rv4Vt+oOQPPkcvDKAMsKQ41Xj4WKc+
	/ScAlCpYp6LKAz8sGX/Fspss7zMp2nEs59U57IrCXeMW7Ary9VbjEqGDnK/sm9jPNgubGkxtiEI
	tY5TqQuQVb1F9PDV8PJEfTF3ztDprZD4lSbSPeW/c36DmK6OwZ10vwjzmPNMzywWHVkJ8bgmj2I
	NH4z0+Z2Xxq20OrRtIFSA/V91L3EIM7svX26gwq7RT7fl5+8uuWRpci7uR+jinyohyP6ic46s6T
	eulU1GGi+0iPFYHQ5JKj3ZvlcKhZRScfkCDEH4igeLrACjXUUgMsCDWZuGsry/DbvJltrlQ+bAR
	Yh/w8=
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr1362620485a.16.1782989555812;
        Thu, 02 Jul 2026 03:52:35 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr1362617785a.16.1782989555296;
        Thu, 02 Jul 2026 03:52:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 18:52:08 +0800
Subject: [PATCH v2 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-og0va1b-v2-3-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
In-Reply-To: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=11146;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=r2RWKItATogrFpCxA+Z7sBntBTRv6KdEdO28LsUvMK4=;
 b=iedm02lq4kvB8gBXWW8JsbSyUl5HickXc0Cb1/KXXSSGlWzkoft/zqMGZxPcljZpfYp9MoXxQ
 NESvHpFeunbBNJAfLNTs049yriBCA3pOTkF7SA8vD4p74bSnS217HBy
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfXxjyHedoPmJa0
 VPQVnRBkdwYG4wzbcrHqTdxJ32pBPseGXRM1zhUU8XHr6kcm59klZthumb7eztnN1aOQbFUascw
 uN9JL4C65BlpPJmnNB+D2anBtlNypQKcTPeZZ+uM4Zu+DjyS4SNpl2Qd+1w8+5ZpRew6y1ptXx+
 kD7o3SvBrFf1NGNTwrdJwmwvbRX5rmzQ3nRlxGxhqKfdk01YoBMjIy+2mvEf88J6KlT1s3iFADn
 7UeVpqBzcbfSAcS6/k7eUbDMhvh2zE1J0PbohwhuGq+SB5Kkf8P8e3i1lqNwWdJ1WAuGazQuJ3d
 mzMqrXExPQbZ/IykfRe/Fafi0DQ1npXYJQv5XjNboxOsmM0qPBkzLGzTAXcTAyJpADtYSlYtUJ+
 uHEWVxMcDmlWMd4U8DLhAUhdOjGqGJy6+pj8xTl3DkrDzf7KfB4oMLvL2dhtvcnAVDGyX6QPO2T
 iQwlONj6K/mP8jQ/03A==
X-Proofpoint-ORIG-GUID: 3ypvTz5qexIyOsdqPPH1ycMHeNPHKUHT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX3HGiZJzfL8BV
 aIcQ2d6MOExYINCjy3TZgnvlplf1tpshLHC6x/VtL3c40XyB3+WLHO8Djucm+F5nR07p/BzmV+X
 30t5GfvSWeVKkYcDSGJUKa9XwZC0GUA=
X-Proofpoint-GUID: 3ypvTz5qexIyOsdqPPH1ycMHeNPHKUHT
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4642f4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=26-XJVdKKoQnq0B2FOoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 234 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 230 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index acc06b10bf896f734926289099a70fbc2bb628d5..f1f4fcd195c4e2dd69f78ba3f01f768a052e6c5d 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -17,8 +17,12 @@
 #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
 #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
+#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
+#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
+
 #define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OG0VE1B_CHIP_ID			0xc75645
+#define OG0VA1B_CHIP_ID			0xc75641
 
 #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define OG0VE1B_MODE_STANDBY		0x00
@@ -45,8 +49,9 @@
 #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
 #define OG0VE1B_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VE1B uses 0x5e00, OG0VA1B uses 0x5100 */
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
@@ -55,6 +60,10 @@ static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 struct og0ve1b_reg_list {
 	const struct cci_reg_sequence *regs;
 	unsigned int num_regs;
@@ -72,9 +81,14 @@ struct og0ve1b_mode {
 };
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	u32 test_pattern_reg;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
 	const s64 *link_freq_menu;
 	int num_link_freqs;
 	const struct og0ve1b_mode *modes;
@@ -272,16 +286,223 @@ static const struct og0ve1b_mode supported_modes[] = {
 	},
 };
 
+static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+};
+
+static const struct og0ve1b_mode og0va1b_supported_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 752,
+		.vts = 2096,
+		.bpp = 10,
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.reg_list = {
+			.regs = og0va1b_640x480_60fps_mode,
+			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
+		},
+	},
+};
+
 static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.name		= "og0ve1b",
 	.chip_id	= OG0VE1B_CHIP_ID,
 	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
 	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
+	.exposure_shift	= 4,
+	.pixel_rate_mul	= 1,
 	.link_freq_menu	= og0ve1b_link_freq_menu,
 	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
 	.modes		= supported_modes,
 	.num_modes	= ARRAY_SIZE(supported_modes),
 };
 
+static const struct og0ve1b_sensor_data og0va1b_data = {
+	.name		= "og0va1b",
+	.chip_id	= OG0VA1B_CHIP_ID,
+	.mclk_freq	= OG0VA1B_MCLK_FREQ_19_2MHZ,
+	.test_pattern_reg = OG0VA1B_REG_TEST_PATTERN,
+	.exposure_shift	= 0,
+	.pixel_rate_mul	= 2,
+	.link_freq_menu	= og0va1b_link_freq_menu,
+	.num_link_freqs	= ARRAY_SIZE(og0va1b_link_freq_menu),
+	.modes		= og0va1b_supported_modes,
+	.num_modes	= ARRAY_SIZE(og0va1b_supported_modes),
+};
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u32 reg = og0ve1b->sensor->test_pattern_reg;
@@ -334,7 +555,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+				ctrl->val << og0ve1b->sensor->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
@@ -376,7 +598,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
+	pixel_rate = sensor->link_freq_menu[0] * sensor->pixel_rate_mul /
+		     mode->bpp;
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -721,6 +944,8 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
+	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
+				 og0ve1b->sensor->name, NULL);
 
 	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(og0ve1b->regmap))
@@ -853,6 +1078,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 
 static const struct of_device_id og0ve1b_of_match[] = {
 	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
+	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
@@ -870,5 +1096,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
 module_i2c_driver(og0ve1b_i2c_driver);
 
 MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
-MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
+MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1

