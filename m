Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107885;
	b=CVa5Swe2myThri6d6g3FmfRZKWUFHbaFYZ4yGKGjgItKRqrycs5fShTaQAxISZlu7BaP
	 Y4xbAobc2HqMYT4RBAwbur4Lie4SCHagwX+MRH78/LYiZYrUPMuJ/yXQAMNA+OV2b9m/P
	 C4wZeTF5EEhIPIIXmTA905igLs0i9oIz2RS9uI2/QnSV5lOX4gMeR/1e4RtvAlU3+ocmU
	 ggXN5YHXIYT9+6yAqVXA/KJeaDTYYaMslPoTfYyu2osVrG/9XnBgCFy+LL//MzWlNJlOe
	 k8WrH/bXK5BSO5jRE0dCwgNtCJGQnwD1BEMv0U+wSiriVt4lTuyUPip1S65VodeWHaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
	b=u5yp515/q4thAQ1qYRzpYztI9eAvY6gpJuf+FH9ztRxsmMKhIvIcIDX2bGharYz7ftm5
	 kraEzebs9W8SfPk6EVPrlIHOQZnYX574IgHwALVnTiXl4WtbK/KEkKzQXbVHerkwWeeNQ
	 zRWVbvwBBD++zffvazwABZKxX0NH4ZqXxV6oPWneYXq354JD/ew5vy8fVYwJERFUBQxiY
	 ogBxmy8JUHjiPXeExpTBXrfHW+kO4fhmk6BnHTVOJLAXhvRCyCR5sXw/LvglZWEseCTRI
	 KRBrZ05wMAjL+Kx0fYs0MeaRR+j/65vnKlNxBYhQbr3KLw3z2scs+LxNL6db4vGBZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55260A261A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A55260A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Vk1GxX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4eOZYeZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGra3W2334339
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=; b=Y6Vk1GxXG1cDwK2I
	Ay5onzAoA+VRchaEdcN+T2+HmJKW1e2Mv61Zv1YiVeNf1fAAzpVwKf6Qcszwgjeo
	8SrfWy1No0eHTBNs5qsDwAFVPwMJ9YzhPepPmRWfJExpm96/7OhAQu/lNAbxlwuo
	OzRN0FOH1Y3j5A+J17CDSdf1kTDGyHquIxxHC6uvG+BsbTYmgoGi64xIpA6oL209
	Ks0rxNRakP5UGPCXPB/Mt/rHgr91iQ0gsoiX0qWKUAA15amMIlvhB2fxpR4yhugz
	cuBbM+WdH4xY1EwilCUIyJdxFK11DU8TwMkQIj1yg5WEb7mdX9/szhQQ5OiIEigH
	1/F5Qw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghhm41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd65070d3feso715156a12.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107884; x=1795712684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=T4eOZYeZs8XqlzJWEwxtKKBfHHAm2TfYOpEVkafgc06bxHjR8/gCrb2KlhVV7wRKP1
         FMb8uVDJAD5g0xp671cnt6bZ/rfd3Q9IJUjcbCWJKH/LPPE4pQlatGRuuwvdx4gJCfFP
         6ZqwRHgcZ6eIkx9/EAn3cnb5sjqA6CFzycrZQh8UOni2bmRifsbxAGJBhHPGoX6i56bJ
         DpS0OdBrMyeVEzwwpaPTAd2IGPAI5fFcTVwAJGeX8b13FUlJ5Yg3lKVJHxttbtTYxa29
         gOnz/LzTXrlbKmNwf/3yT9xuim6ESopOFBQ8h55Z6wMlFcozzP7vq0FLvdj6JaLuL4fB
         matw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107884; x=1795712684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cncjVnExA6bfr+B+E0TlUndLQSnD5TH/elcwECuRNDg=;
        b=OvVMnTQslISV/2mdPKhd1q1gbumk1vKyZdfBUyGL3QWCluRDoKgrmguNnA9BsVavc4
         W673Hr/Ola+SsM92KiPBVK5yh3//7ndyKztIvJP4VMrj7xosiMU/f7lCHde5ARRJSrf4
         vbbNax4oNcOf0tqqVd2qPom7PUuMmfzS9MKhndOdeOg/F4zZeusYA1YWb1haxsKchNOM
         AqFZxsATRDkPGNS0nSvzrthSBmRtfzWjvMsg+8gmzb5xeMApkOpBQes4FGMi7AICGivy
         kugzJ3+qLHSHzvaiYoK1mv2rHsxnRNrQVC1l7BAXLVDNg9owj6GirtEHsPdZ1UCykiWw
         MFmQ==
X-Forwarded-Encrypted: i=1; AL+hErF2roSRY2NB/xtr6cmBaT9Fgdk7vDvYHTVxgLJ+PifElpoH4uXzmA7hNMvE32xA10C7LFrfK4BXcEHu@vger.kernel.org
X-Gm-Message-State: APuU4Z8oSb5LOY2aBagtPhboeCsLQICOt/OfndU8dAg3IcKJdG3c7CaY
	IH9QSZfYwTcJW0NItOv78ELFSH3xhZMET1hhDzYBVqU/6Kmo3X5gOwjB2xGtWQcu26YvFpdmG/c
	/MksaawWFYI7+7cdVmEwvVZfg5jd9FI9bFChITzo8JPtSkiSpTeYEO+wUTdXYDmTy
X-Gm-Gg: AYBFou3UviKOTXtDaL0aiGo1qbXHhALJrKMVVY80ibFZel9mj6+q4BQTjTLnSdWH9zG
	CAiC/Pf3VZt1AcoY3gf7a9zoyTCD3hv36etk4b3z6p3s9qQrdR4u5t9G6Jn1zPWqTzfT4C1Zye6
	vpeg6O4Gbp4cbBbYbx4RayEKq8hzXcmbw1lXwO/ZqqhpzxnSF6Wc9Jxm5AtaT3GHtIpR1KHshx5
	dz6og1b2PtkFm2GT0ck0ACHXsGVVkK2r0x638ga0VHOu9HIiBChd9K61dMGAx3QH1fu6iJJODDw
	dpk/PErB/uK9L7rPVN4jywTbq/trxrt8o8k3gQG7u3igBury/Oy1M+MW6vM9bZpqqs2/Wqyo8bu
	6zi5LexoDiHPsDkT/hbJjsmjIehKFm5McITk4haPk5e0urUaAEgNDd6UFMa3volDbX5aICx3tHg
	==
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173038637.13.1795107883657;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
X-Received: by 2002:a05:6300:614a:b0:3f9:3f64:9b9b with SMTP id adf61e73a8af0-4014ca44ac4mr173005637.13.1795107883151;
        Thu, 19 Nov 2026 09:04:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:21 +0530
Subject: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX7rzAJxgFNuXq
 stcZqQxpGecBimNkyc4iUROCDmqyRiePX5MI75BhXysZc1/M+XLj1/KLhO2g/D/a3pSGCj/N3cf
 PLIMeUqih8lWleRuVe9YgdNZNh1LoqZHivwKRH1hvKAdwcnQoud1ZLvJTlrx4CCcMSYyxv8Ul+b
 T6JToIRGHcQMVgGEwvNX6/E2svL9w0bld/QfarIdRkorMXxvsZSah9Zpbf+i/eKSSiR8fG2bz31
 tIGdiwsfZR0k1uHOMHgla413tMUVSPVOux1ILXnX5vpxRk1oLsjSqUn4l8LU0IzeRWf1cVlzAsl
 laG7Npyp9rTfgpAYWWtMOU3Lr2F6Ur8KYlBzzBzhRMMXrLKFMMXb1Gqp/pKIneqh5jGqaBKN7bO
 2fxfdakrQLNEDzCVuejOrqt7ReP86nc7N/xopm8PooOJ3VJ7UvQR+aHmYHzoIVRkaiDzJdgCxw8
 52bqSv1nAaffMKoRqfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX0ZJ7yxh8g2IM
 gCh5Ft/pcq2az1vFcszj3l0mc7ztwLv5G+gwTkjDvf/uSTJaDZNGpI9uY1ul9EKaddNuX85Vs4S
 bPCUuztdF5SVjipVMjdl6+PEqX1cbPY=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6aff2c2c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dmjuMl4sYXMLEaQzlHIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SxsO4IonYDZQcXG2d_nIpwu71ZDo7FKc
X-Proofpoint-ORIG-GUID: SxsO4IonYDZQcXG2d_nIpwu71ZDo7FKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190067

Describe the I2C slave and TSC subsystem clocks, reset lines, and
parent PLL needed by the Nord SE GCC. This permits consumers to enable
and reset the hardware through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index ef97da3852e3571db5c34676a8f08b9650d1e4c6..256d3c18201b4fd0e48bef9293cdf78fb329ebe2 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -29,6 +29,7 @@ enum {
 	P_BI_TCXO,
 	P_SE_GCC_GPLL0_OUT_EVEN,
 	P_SE_GCC_GPLL0_OUT_MAIN,
+	P_SE_GCC_GPLL1_OUT_MAIN,
 	P_SE_GCC_GPLL2_OUT_MAIN,
 	P_SE_GCC_GPLL4_OUT_MAIN,
 	P_SE_GCC_GPLL5_OUT_MAIN,
@@ -74,6 +75,23 @@ static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
 	},
 };
 
+static struct clk_alpha_pll se_gcc_gpll1 = {
+	.offset = 0x1000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x57010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
 static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -189,6 +207,20 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
 	{ .index = DT_SLEEP_CLK },
 };
 
+static const struct parent_map se_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll5.clkr.hw },
+	{ .hw = &se_gcc_gpll1.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
 	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
 	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
@@ -670,6 +702,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
 	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
+static struct clk_rcg2 se_gcc_tscss_clk_src = {
+	.cmd_rcgr = 0x2a010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_5,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_tscss_clk_src",
+		.parent_data = se_gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static struct clk_branch se_gcc_eee_emac0_clk = {
 	.halt_reg = 0x240b4,
 	.halt_check = BRANCH_HALT,
@@ -1079,6 +1126,34 @@ static struct clk_branch se_gcc_gp2_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_i2c_slave_ahb_clk = {
+	.halt_reg = 0x2c008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_ahb_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_i2c_slave_xo_clk = {
+	.halt_reg = 0x2c004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_i2c_slave_xo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
 	.halt_reg = 0x57040,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1456,6 +1531,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_tscss_ahb_clk = {
+	.halt_reg = 0x2a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a00c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_cntr_clk = {
+	.halt_reg = 0x2a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_cntr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_tscss_etu_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_tscss_etu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_tscss_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc se_gcc_emac0_gdsc = {
 	.gdscr = 0x24004,
 	.en_rest_wait_val = 0x2,
@@ -1520,9 +1646,12 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
 	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
 	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
 	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
 	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
 	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
 	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
@@ -1560,6 +1689,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
 	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
 	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
+	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
+	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
+	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
 };
 
 static struct gdsc *se_gcc_nord_gdscs[] = {
@@ -1570,8 +1703,10 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
 static const struct qcom_reset_map se_gcc_nord_resets[] = {
 	[SE_GCC_EMAC0_BCR] = { 0x24000 },
 	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_I2C_BCR] = { 0x2c000 },
 	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
 	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
 };
 
 static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {

-- 
2.34.1

