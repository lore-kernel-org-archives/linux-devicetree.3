Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074827;
	b=YYAe7lkBXMwoVSfE/afq0/XtKQIHHO6p8nDbl92vFGpq4h60JDuo9hhOoUW4Lx7J15UE
	 BTTfn0cAuqCJ7KV4XukFt7tcF+sFFsT8kN+kuXH3+PolZMUjhTLex9Vq7AG20oYWffyD7
	 L4njzYn9lnrwOUyTlhbTTCETW3BbB0cMVosl9+L2lDH9sdg0UxuYURx3hsoj0X6eccrpX
	 bQuv7jCPKIMOcJFBvNDOfI133TZWkUvAfFCGAkyd75Pg9d1ndiPjMlb7+4H4ytFcUQAfc
	 7dxnSJ2A6euvFs99dZ9FORNRQjOl9TMZo/l1TFRVaoWuRrmErbJuNw1dCjh5k8xvuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vdjloCR+w+8en0L8L6hZnpk1xq7kxKxd8LqFhbCuCA8=;
	b=xZfA+vyofY6Vz+gTGA6udx8kLp++dJ9IIGTG6JEQpbvewCoaqyrJQm0GpF7hWQW7dyX6
	 FdxB/LsmEbrxmfMOcha7gmFFj3JcHejpghWeVMoFTYudE3M3BVnuF8LO/sQqKa4Kp7tJ9
	 cah9Dzn8jSjizAVpyB3X3fep8tgLp882vWk+CsuhmfsEd8nH5TDLhW+I3WQtzA2bkw8dr
	 1ZPhXp7MgyxkZY+aDs119+1OiCOOh7bDz3NCRsnWt7QJJssGxlEFRfhUjEDsaXNUoo5qA
	 hcsejIIP6nIBRGMT6Z/k2wLzFds7kXe854DWL11hnvM30yp3vfH/RMy05WekFRSd60Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJ5GFltz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZZuzz68;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196D606D804
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 18:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0196D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJ5GFltz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZZuzz68
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Hu8OG276513
	for <devicetree@vger.kernel.org>; Sat, 7 Nov 2026 18:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdjloCR+w+8en0L8L6hZnpk1xq7kxKxd8LqFhbCuCA8=; b=QJ5GFltzQaXzkmqb
	tA0PucKSCQQHKbEXIX2YAaGT3WaTFDkTn4jkGYFehEQwaqPMpwpU2q2IonB1rmPs
	Pjvfh67Oinlt4WYSgBvqCwVDdfvJJRkG4ER8MUTiEL8jKcTaBNsl1OoSum4fFKWb
	VPSzkVw4qVprRw00aQoRiOULr4ep26LCMXrpt7PzDLVsm0JtxuuSThE/oGFwdHUP
	Ouhfc+WCGXf8OjjOZq5D2Cn8giKqKBPTXfsp9sKfzq/iBG7idCst1xpy4vNEPuZ+
	79NUbDIgs4q6cnK2pPCjLdDXoxAlfG5h3Vt2Ncs6RaOVbz9EwSNSFBNPREy9HvLr
	b+PT5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxs9kdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 18:07:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2093024eec.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 10:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074825; x=1794679625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdjloCR+w+8en0L8L6hZnpk1xq7kxKxd8LqFhbCuCA8=;
        b=AZZuzz68UI/jYsykQ3g768qyNYUJNpGGRBNOZn3/mfVh71GTfHWgbCshj+hqhoZLYR
         qwM0U3sRevCg8pqOQGhefYVE7Nq6mSKKxpLZnozWxUjlyCK1jK66pqYEaVtpwoUKKW7/
         eqiMciiaLitdoACPh9d98IpvBhK9Tb1RkSJiQ/VN9y2gZ8ohEWdgmwXeOyy93Ie1JvRE
         DZEYanZGsnb1KkjKm+YQ9DBGGYGoY3OkZFtFjwICcZLgX6udy+np2YehvpNoOpD8ta8w
         KAuPvamJfX33xUMHXJQA1vC8tXQ6lZhJJ+cHlTrfuu22i5zorzsW0p2AuILGpkKp2Olz
         ud0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074825; x=1794679625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdjloCR+w+8en0L8L6hZnpk1xq7kxKxd8LqFhbCuCA8=;
        b=nEdomwVsU3Ty5nqabExwLr00mSBTdKB1ZUgvxc55eug2iDLW1Q3xLNGv7oNaj4Gh6a
         l0nisqrqc5hIKE83faUNkCaRwfZudb3lPpNTag30xykiw6SHbJmr9ArrpTFRgOtIPPHm
         tQKJCGXhRxQh5iawkAayz4//9N6sKEHV23gP6r0/TmUuNSnue346jnY1O/r7Z/2GrY72
         X3fY1jstzOQEsdE7fjilgfZ9Bz8xmbMwOhE3FWydNjohY8BpaaFdqHegXxBBtReDkxcS
         zrIS4Bxiri7kANn3HiJ5Tn09o76Hk3U5J3RPxwXwjbOkaALzFubfE2qWyULkr6sJU5VO
         kvjg==
X-Forwarded-Encrypted: i=1; AL+hErHV2/9q+jyXga41BUEnPQpU4sGDeTyb1zW+73L4e/wMhIv1XGpZEIp0KP+W170ylmLzz36O3cqe3EWA@vger.kernel.org
X-Gm-Message-State: APuU4Z9KWmLDn/tKvq9DoZYcsD/LBZ+0b7Ux+v01b0vKRsJ9msvybkVB
	c1dho+vW1RDVT8H6KCsPJmjsW+WS32TsvuDQP+7Zdl5WOD+Ulyv+hZWhQj7qU5C3PjeSIRmvvsu
	tkl+6ebHTkSQ/HPFY8YZhZTirIOq8AvdOetKH+PVwCPdOjkc95FYoLgf/hmzd5Jdd
X-Gm-Gg: AYBFou0R3t8mrRxt7cibW0q9PXG1op23IVRfS+csQsh8em58pLUeSCTs8Xf5L6+CdW1
	KOM0tBivL3CxGgOu5b8d8RLDhD4D+bynAcb4RV9zbQGTMwjAIo0PBP0kbDEsXslx7XxEnkHPXrg
	OpQgg2SykBBoGzTlQwZnwRupAopNo6jjoiGxLb+2HIzy7dKZcUNNttfOO2SlBLEO/uEV4Is/ff7
	pObP7+iW6HmVuDwJMPFqOT9WwBrOxbtUhXBTthbWtDI+5LSIUFm881u08oW1d5RM1+aeJfoh3EZ
	3abavlkzp4MbAYYYKUsMggmsJornBzMt/8Nt7mm6VaPsLtlmv35ESCsA7yu2gy9R7j4Un4Zuucl
	hWyDUQHXZHeJoPHcBaCYkquuI16S0pCmfT9xHLBxD5ZvGZvQd6C/nAyi09fO7F6cOXn8J6iyn
X-Received: by 2002:a05:7300:22cd:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-36f784c0a40mr8604464eec.39.1794074825177;
        Sat, 07 Nov 2026 10:07:05 -0800 (PST)
X-Received: by 2002:a05:7300:22cd:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-36f784c0a40mr8604399eec.39.1794074824514;
        Sat, 07 Nov 2026 10:07:04 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:07:04 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 23:36:37 +0530
Subject: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
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
Message-Id: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7LgVWKXrRA3fw6IpGyk_lVjwyIWpT6ZP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXxZsZtGqUr7CO
 DPuKqV0h/kXGXUYYtyFsEnyOsVyduvtuhmagwLg5r/UsdcLAYJR9WwtrwT2zrL56NcGt+eqerCp
 5HR1I7g0oa0E0zwiw/jqZyWkxEGtFPg=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6aef68ca cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M72KzBWfZs9jpyMiLIMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXy5X2Lcw+LaAc
 nMLFvsqqABDwCAGfVo1hevktngJyBWi7yAKpQ2hlAMJpYfdqfq/JzTybj4fQNQ+ov/imMx91u2x
 4PocMRn8R4aVDLMtCGNjLf4WM+cK1EzM6DYJjk9ca+DfFKLU/gie5aHh0iv3DVgcexWgMYwlLJX
 RGNwwmCpyaBAXe2jN07zDOtqR0VmeRo6GvXrruxhwLNMLSoMef8G4Ob+kJeEoEfbheTZ6KonX9Z
 xjJXnhZ503/pMeEF9tUdrsllcyxo7Uy6v056p7Vj8BxbMvbow4rUjpCxvPKyizJh3BBK3Xq3OPk
 RDz/VnEuemJGzY8hm8hotpWe6Ay+9R3ReZ416pFXjr15RVIG1JHk+rhtuN5+jD4OWZxB9byXFmx
 LNk+ZCxR5XWflm2Q7/zO0xPQiCR8ExJzSpeIIju7ufj11Ee+qDEmuC2vchNnQMWL2rGIDSzzA9S
 yFUd+scVNYP22WPY0Lw==
X-Proofpoint-GUID: 7LgVWKXrRA3fw6IpGyk_lVjwyIWpT6ZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

Describe the I2C slave and TSC subsystem clocks, reset lines, and
parent PLL needed by the Nord SE GCC. This permits consumers to enable
and reset the hardware through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 187 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index ef97da3852e3571db5c34676a8f08b9650d1e4c6..7fdfa44fb10360650e1bd59fc973f990788d3ed7 100644
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
@@ -189,6 +207,43 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
 	{ .index = DT_SLEEP_CLK },
 };
 
+static const struct freq_tbl ftbl_se_gcc_cnoc_i2c_slave_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data se_gcc_cnoc_i2c_slave_clk_src_init = {
+	.name = "se_gcc_cnoc_i2c_slave_clk_src",
+	.parent_data = se_gcc_parent_data_2,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_cnoc_i2c_slave_clk_src = {
+	.cmd_rcgr = 0x13034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_cnoc_i2c_slave_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_cnoc_i2c_slave_clk_src_init,
+};
+
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
@@ -380,6 +435,22 @@ static struct clk_rcg2 se_gcc_gp2_clk_src = {
 	},
 };
 
+static struct clk_rcg2 se_gcc_i2c_slave_xo_clk_src = {
+	.cmd_rcgr = 0x2c00c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_emac0_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_i2c_slave_xo_clk_src",
+		.parent_data = se_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_se_gcc_qupv3_wrap0_s0_clk_src[] = {
 	F(7372800, P_SE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
 	F(14745600, P_SE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
@@ -670,6 +741,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
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
@@ -1079,6 +1165,44 @@ static struct clk_branch se_gcc_gp2_clk = {
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
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_cnoc_i2c_slave_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
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
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_i2c_slave_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
 	.halt_reg = 0x57040,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -1456,6 +1580,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
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
@@ -1481,6 +1656,7 @@ static struct gdsc se_gcc_emac1_gdsc = {
 };
 
 static struct clk_regmap *se_gcc_nord_clocks[] = {
+	[SE_GCC_CNOC_I2C_SLAVE_CLK_SRC] = &se_gcc_cnoc_i2c_slave_clk_src.clkr,
 	[SE_GCC_EEE_EMAC0_CLK] = &se_gcc_eee_emac0_clk.clkr,
 	[SE_GCC_EEE_EMAC0_CLK_SRC] = &se_gcc_eee_emac0_clk_src.clkr,
 	[SE_GCC_EEE_EMAC1_CLK] = &se_gcc_eee_emac1_clk.clkr,
@@ -1520,9 +1696,13 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
 	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
 	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
 	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
 	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
 	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
+	[SE_GCC_I2C_SLAVE_XO_CLK_SRC] = &se_gcc_i2c_slave_xo_clk_src.clkr,
 	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
 	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
@@ -1560,6 +1740,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
 	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
 	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
+	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
+	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
+	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
 };
 
 static struct gdsc *se_gcc_nord_gdscs[] = {
@@ -1570,11 +1754,14 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
 static const struct qcom_reset_map se_gcc_nord_resets[] = {
 	[SE_GCC_EMAC0_BCR] = { 0x24000 },
 	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_I2C_BCR] = { 0x2c000 },
 	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
 	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
 };
 
 static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {
+	DEFINE_RCG_DFS(se_gcc_cnoc_i2c_slave_clk_src),
 	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s0_clk_src),
 	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s1_clk_src),
 	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s2_clk_src),

-- 
2.34.1

