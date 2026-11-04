Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768920;
	b=rHefnpVvsAaXWqbS78nPBJU0ACB4MtbtS78Kxt7JLEFkLlopA91cwabkb+YC+0p+uidq
	 BD9caVcRG84LpUckV1X1PtHNfhrwCeYt4nOtzTLPt8MKIyUGKu+TE7J8sPPBYKHWiaMJ4
	 FwC2W5Fwat2sX1FHL4tEYgvy3P9p4CZ+IKzU6kTxSIZD3MWR2Dn06uN+aYk/gQT/TSALL
	 hqOOZ36q6bCopiuohvlrm4HWxU5YWvD2G3LqYUTZYxx3V3RY3LCRmyIJn6xem+Ca+WdTg
	 wZso+VLRwoGbKJF88G8Brt7t/nWd1GVLy0/r2GDY0FlfRoq6bkCVEviyaEU4r7kCbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
	b=rgLrSfRP2kub5Lq1ZWHWlCcGZjUIVpFSmWS4SSIhN5CZ54phzucKa57chFW/X4GCR2La
	 sLJjcwCUHWQcZ/tW6c04D0JfYOqXMgbUv+khaEjL0C+LN543E0r7Z4t7J+mvddfkCwSZv
	 iJ4DfwFYNXsdiag6HNM7a1ZFaDwCl+EGcOrSWfG2edoYYZ398wwIsqPFCFZTgDpka/0n+
	 8jf6TsC+e53vB7hlbS93Ff7UcybOK0ZpsZ+yaJe0K62axMsSz8LvAAvx5BzB7lGa3M9X6
	 xxzLhbpMysPee5eJlipH5n+Kmjgzn+XZ7T/RFTkG4FHSzBhfgtCbQe1BAnDP/B1z1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dApBqP/z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd9NGKhE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6F606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 05:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dApBqP/z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd9NGKhE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7lR193439
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 05:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=; b=dApBqP/zi35tWyBL
	GnwmcjMiUGY9Ml/e2dUMzlQdO6JiAx7f4Ia7kPSN3Twv3LhKRhMh0fYyGoyTQjjk
	NVrc5yOLsHFbIRUsQNHrkxuS0SntNVgpAYlq8hAV/mE1atV2xGJIOWMHB9i7MlLB
	0d3I2NDaZdEw9uj3PyUi+f3CfMthwPv/U90HJIaN34EDeTVH7KEy3EqgyrYK5rV4
	9Thwyx6iHTKrlnTrlXKBMR1DyLOafcKeVTiXfvxi9UNGHgEubnxBp1IBVQTNSKgO
	2hKuWvApNqeDRR+Ou0z9YApcWGvn0E07eJtHd2nzuKdukXb3hA0cjvxTjfJraUw3
	iKBQKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj1xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:08:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so438989a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768918; x=1794373718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=Bd9NGKhEcppd7kWKWohbJngaUbDTKHtWzUjVD17hiD3+3ShaJpSM/0H2lLCVS0iJw4
         81TNf1NuJzjCtv4VhAT08/PIgk4L133+yzyNoHYCzWNS1NvjWIelYXmKNJJ/ciuHaCy1
         4zVDYMOVdc17/cgKP6vTG02GEUSqry66t/q7k/6M5Sp1ij2d84IC82uG0uKlyeRZeBX/
         yexMbxt6NmhLKPqR6XA97DY1IYdw4pm+VJjQpbpzNgtjl9lF5N0F45v64F8nuc+9frYh
         PWUIBHW93fIE4epsTWV8P1J2NDexnwhIJy1owZbq+nji7rvGQnf8MuLwV06KN0LzFV8C
         o3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768918; x=1794373718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=2F2v2xsV3rwxn1lkJZO7wm3sIvEKWeda6bTczPdDzeQ3HJ36i9jcaw6CLh1Nt4e3kp
         tNh5uOIEYQHmSRG2UupKrB4bt+6cCWk4RXibxjC6+Y2QJxSOxfoWF2OgYuKZiELwa6a0
         PGo2u3cpCSvQBWu3WB6wFz/UT8wxNR6ESpQRJ7fHbf/PdjJo5GxQjp3kzeMdDgh2/eet
         aLwLWIwQIhiwUZktX6ehoyaA5ptmKHoHanB+e9TEElTbGj1bIHM00LJMU3yZThft+oTN
         0TMvCUC51JCxcC7lsfeqJsygZ1pp8qvlhZCoq/0pawd+ONN/05NdMV9f2Hjbr02o63WN
         BF/g==
X-Forwarded-Encrypted: i=1; AKwUvBw0prYwUYJ5Oy+MIubelz0mmQLgYJ3IznyjiiceyAi5AKza8zBnq/I9q5N0tP5yviF+1Z9XBxFdtlT+@vger.kernel.org
X-Gm-Message-State: APuU4Z+PqKXDjowzhvYYgm97HhOeDKF54NkolOgZlASwqeAj+DHCfnIr
	vJL/bEzgJLobC98wwNnmfhaqtvl/vitDaHigivqRHOkJCJ0p/07EO6FezuaIM0E9g+TFtuFCb5/
	zPFhlZW+yaQEc5AII6NwdL2xHvl3N/8amenwTHsr0CX33NKpJso6SxYvELhhVUQG5
X-Gm-Gg: AYBFou2k62OAppo6b0YfS6oR2sD/VGlQrebIEG7nvpnlzHJz44QQoiJCdiViPbwO3eF
	bFd2OVBGh7i0fD0JRYXsdn5ycC5a0tM9xTUBcuAWCryn+3baK3B1OwHNhyZCItoXBrSoJIivORT
	GwwxwqoanAlQYgfrOGlJ4bUCB9E8ms81/tPs0UBORnF8p2QnuvIp+VboxnpnXG9ZMrChQZqKSLc
	UxjzkNiBu1hdItkIY6KtXwJlRbZpsf/ovr2oIDrSQMsDlZsBi7MOpdQN3u1PHscigmOZKdrZ67n
	MD4ue40U561P2pV/WACLAauKss3naKyO0keAaBFS0t+oi3R7wBHGCbRcPgVIgMx/2WLTIpWbP+Y
	c2MjPTrm6vqwv0wlEkysYnkzWpxsYYf0Lp0rLP1LNu6xlBAj5nh5g6Eafwcz3AenmlSyOoM7BBW
	eZEMA=
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245281a91.59.1793768918384;
        Tue, 03 Nov 2026 21:08:38 -0800 (PST)
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245255a91.59.1793768917849;
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:33 +0530
Subject: [PATCH v2 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
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
Message-Id: <20261104-glymur-av1ecc-v2-1-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX1lWhcTTxufQf
 jbm7VQhyF+ALQpmBuYs3JpSpS+nI7G/WawfM55v/F/brkAcHHUQHf1p/l47NE58Gt/r1EIhXA0v
 RG/mq1dp/4AV21scYy0adFY3O38G/+xkdE0+4TrUvmIlpCFSRg08Be0X8snWxbs4eIszWDLTbWt
 6QDhjZf+ha6wvCjOXL9xNEof+SJFzZgDFRIeb8kkka3GAon30mrqBC2w+0HoPotRPGKi44LvXZ1
 PIFWbASac/3xF9GsVOhqIFJr3yBJa0PeKKNt7cE7B7F5y5ZX27KRLA+h6Z9RpFgyGqwlpNs4KH4
 NiAM7IoqloNB/vdPwX3bDfD0A8fZCcgkzfCpCpkpkpRWra8xAqZoT+HCLPxLpPi35gJ/tE0zo2t
 hY/iK+MHveBLAsftJn5QJWR957xz/XuWZvKZDCGKJ5uxOKUY5qrmJ6vkqB/O4G75jjHQuYeJbOv
 /wJdm867ZGILU5mIAOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXwig3xOOomWX0
 BhAjBoPJwIqsEEPJ/iyuk++BzyWVflcO5YHUvaKF3UxE8XZdh0MDeq1td5x8CQaqVwsBbzl/vaj
 gwUAlR6PAKzW2R9Ls+bphU65HLkgAh4=
X-Proofpoint-GUID: 2GkmxCJ0cGElTVEhw2Q14Bq6vsX8b66t
X-Proofpoint-ORIG-GUID: 2GkmxCJ0cGElTVEhw2Q14Bq6vsX8b66t
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeabdd7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4K9S_alWPkThguqFwX8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
Hence remove their clock modelling and add them to the GCC critical
clock list.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..9418a9b2bbde4be8a28b6ba4405baa780de654e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3373,21 +3373,6 @@ static struct clk_branch gcc_aggre_usb4_2_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_ahb_clk = {
-	.halt_reg = 0x9b02c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b02c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_av1e_axi_clk = {
 	.halt_reg = 0x9b030,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3403,19 +3388,6 @@ static struct clk_branch gcc_av1e_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_xo_clk = {
-	.halt_reg = 0x9b044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x34038,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -7915,9 +7887,7 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_AGGRE_USB4_0_AXI_CLK] = &gcc_aggre_usb4_0_axi_clk.clkr,
 	[GCC_AGGRE_USB4_1_AXI_CLK] = &gcc_aggre_usb4_1_axi_clk.clkr,
 	[GCC_AGGRE_USB4_2_AXI_CLK] = &gcc_aggre_usb4_2_axi_clk.clkr,
-	[GCC_AV1E_AHB_CLK] = &gcc_av1e_ahb_clk.clkr,
 	[GCC_AV1E_AXI_CLK] = &gcc_av1e_axi_clk.clkr,
-	[GCC_AV1E_XO_CLK] = &gcc_av1e_xo_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
@@ -8483,6 +8453,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x32058, /* GCC_VIDEO_XO_CLK */
 	0x9b004, /* GCC_EVA_AHB_CLK */
 	0x9b024, /* GCC_EVA_XO_CLK */
+	0x9b02c, /* GCC_AV1E_AHB_CLK */
+	0x9b044, /* GCC_AV1E_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.56.0

