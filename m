Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB0346A18
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063856; cv=none; b=OHiOpLH8WAPyxnXH2gy3knHc+tWwRzyiLkDqP50NPC+aCHfFAbpl05v8QZ79W1YlD+WKHF7fZZqNi2iaSesWKjp//4cTuzK23Sq4y9+YwEDBV6ZHOrY6D+RGTy82SAnJTvcaG8OqqsZtZJNw/I461Xnn4+M4vur5CFDavN0LtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063856; c=relaxed/simple;
	bh=Pj0dPoQ1Z36EtPpZ4QwKV/v8H3nhBNbYqOour2sGvPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rCwLEUP5QiaAyzOXjVC9++6atEMxdKpJge2cHqRdZm2aZGa8e+bzkuNU9wAMGIF3JDcKGAMKJOUMc1/Ck6w6ZqI4CI2+uNILvQ5dPOqXUQ/HbW0jBYv8jsF+KInRzx9Q2iWJrkS0e9JOTiJKZ3mCG78Gn+9I6oO8NUt+0Zc5zVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbG60ZMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9suyqD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbG60ZMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9suyqD3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rn2R3123794
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hzACdTCdcV8
	KGypXMG7VhShgdpHT5XPOaI591fMeC/A=; b=XbG60ZMveTTTr01Ib9pJtYgndBT
	ddEavCDTWvQD+vZoxk2MdglCfJl9uyzLBMK4Td6AGiA5YqhTzGXZKviX76c3qQ2k
	2iqNJpCHDP/4n3t3yO4jf0Mfyh2YYrbpaXXRfIVDGc0a3OCUHgB7jfEaE6Z9sO5P
	X5n9TqpUXPNlhFI9ha5sP1xnrRdNZxNakpZq1A23WnNCZnE2LkWaDJUQ3ejdYAG2
	fKqpyiIEVbAVn3bUtpcBCFBHhDS7ocaNGKjy8GxQENts3sCbm1ZjmeabBcJYWAFI
	CAS3TXWP5qMfhCBgKarLdNeExT7YTgefQFancXpler9IZCbtWZSPm48go6Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpc7m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:30:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so537711a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063851; x=1783668651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzACdTCdcV8KGypXMG7VhShgdpHT5XPOaI591fMeC/A=;
        b=C9suyqD3Zqi3/Uiigjy32RG663TAAoJDxoO2d2qQKlt16Gl9Ath2yEozO8o18nTFFg
         ZpkaVC/fO5V4GJGrRxVkylsWgByenDCJPT5zkk3WY2LUVaZ+ujyDnh5dBEACHj3I2UaJ
         dmztEB5qUOJQmfQ1DVIDl5HdE/a2oxEcBmU0rxa0AhP1YdjF4PLIfSP9HYvrGoUxzLwj
         W2zHL2tJdNawIfUTWqGYPObigvvFZ1mKA3QW25J8eizqjljeVAblswlV8Xw6SJW97tO+
         R63xgMKuhi/JTAQ2HBtmShDW1LW9g+qi6xzX2c1vqa0NSPEvqwbRGQqVnU29uUky/1Q4
         ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063851; x=1783668651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzACdTCdcV8KGypXMG7VhShgdpHT5XPOaI591fMeC/A=;
        b=A8mHzgR7cl+M1DNZED/5NtpCDyJlKdm/WDtURZdfOPmcXv0w0S3sUqrbB6JjViZ9HP
         59q7dcHTnBSusiTidCe7n4C1QaJU0eg1K6t/JdQXksvSelJQ4T12B8ScJ4FtLQyRvwYq
         JypoKchPS8V8mvvwHW3iA1+3Wv5ZqwTJvQ3FMEUTeMjRl9uW+JZo7K81kX+0UtkVNPpV
         zWvrUgwmPyM1oFX/8tMMT5acO3v4XcHKzyGqXL6FfNIpl1VQZ6cwuTib5vUEdWWHq+MX
         c3gUgJ3eeubyS/xuNEnpyGc5mOv4fSXXSWRRTcNaL/6sb75rXCNKkW0IDRLRrBhJHQKl
         mldA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8RZjuU0xgoj3XMIAabM4NNGbkEYCUVEIOPaQBbuRN7dNt0qi3CdYnsXHcC2oWe/ZoXw4yv4qO5do3@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEuCyyK4JfTK0gqWd+QRaPviI50mwKlRy9IgZuocBgZYvugO1
	enhRX2siiqeXldYnHjwVJylGjlPvJJ3LPXU5thjZCsojyqr1rwOa247xTPGV4mdJpj9pY07tnDX
	w4R8J8AdEqM7H8mhwfROh0AWoig3KBMPCapEltP7m28BwK6+crWaZgirNRsaB5iVf
X-Gm-Gg: AfdE7cnBFU8mnkqVutQkCDzuNH3QU61ntbh86J30lrbAxWWItBc6Gw4T89lwOT6Eo5q
	CS5KeZr4Og+kvyzJKi44WsxhgoRGKCyVYQZKp0oGH4PVGR2Y7uA8RBpyyPeMscgnENjVQ6usdaS
	eSOLAs/8C4YgGuTNTo5rf/WIrdIB1X7P0FQ2nCr/itbrwV+Tf1QA4lk+UqXptHlKNGZL92nuosm
	w11JnX0LABuy3ModKs+JhPQQhefInAFO5FIJj+onkvMPCaRngae83Sy+0D+UmP3apYaNi1McS90
	oN1NTkzhArOLTauJZ3rzxPi24ipGs4J5oOpi+zCB4BHidh9k20BHWyjzEbU1IKAyCn3sGaSaEW6
	VLRGj5ybwbgN+uEPVdU9A3s65tyRVT3sySlcse+7e
X-Received: by 2002:a05:6a00:aa0a:b0:847:7f38:27a9 with SMTP id d2e1a72fcca58-847c0acd325mr9804375b3a.58.1783063851083;
        Fri, 03 Jul 2026 00:30:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:847:7f38:27a9 with SMTP id d2e1a72fcca58-847c0acd325mr9804344b3a.58.1783063850562;
        Fri, 03 Jul 2026 00:30:50 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:50 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Fri,  3 Jul 2026 13:00:29 +0530
Message-Id: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX9yf2SoIRGxk2
 EP70hljI/DB70qAEyGWsZh/8p4YQmpc4M0d1cHSMorr39NRP+wfEBfu6Vje5Q+p7ByOipMK+utB
 HceCFtTo88SA7BtAaA9/er/PJkfgtlA=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a47652c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXyX86sd33i90m
 C44/xXNrxTirSb14UoufWVbIfh0yBXV2BJjDvIlAhDnTV6Tl7e9QW/6xE3IZndPHCZRfUFyzpmA
 4mIL7pymSoGBzzdXT3vHAowYvWmywF8dwW2/xk7Kxs/EuTjViAc4YrozJ1kUCX5Eru04k2DqjC4
 P1Oi9FVpVgaXE124pWCogcJh1kYbhwxKiDr91JhP0IDVXM7pDY4dQgsu8AwrAkcdlDoPRXC1qk4
 2BN3SWVyX87oh9vxf96ykFB+abApNehvPqwAWg9/+ScHbpID4j9qHaeyfjPZdagd6Cn/H2qO9gl
 glGBqEYhjajNPjU0dUTDGPcyST/HdB/ynYLzmerqvjvhGPO4qyFNAnfVB18lAQDVndVFnC3YkqP
 pf+tH0k0E8y48Di9yOyZqb94XDZkf9r+xSnsglDSeK6XJHuVbQDGlXHCGlxoCYnuMnDAw6xjVkf
 DZdCwzE3wZECVerhsoQ==
X-Proofpoint-ORIG-GUID: 3p3UTJXLN5f5Mj7OfouGt4pybae0hrhM
X-Proofpoint-GUID: 3p3UTJXLN5f5Mj7OfouGt4pybae0hrhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030069

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 72b8ffd97860..cb4934cd6f75 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -148,6 +148,33 @@ static const struct lpi_pingroup milos_groups[] = {
 	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
 };
 
+static const struct lpi_pingroup eliza_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 11, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 11, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 11, _, _, _, _),
+	LPI_PINGROUP(16, 11, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
 static const struct lpi_function milos_functions[] = {
 	LPI_FUNCTION(gpio),
 	LPI_FUNCTION(dmic1_clk),
@@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_lpi_data = {
 	.nfunctions = ARRAY_SIZE(milos_functions),
 };
 
+static const struct lpi_pinctrl_variant_data eliza_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = eliza_groups,
+	.ngroups = ARRAY_SIZE(eliza_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
+		.compatible = "qcom,eliza-lpass-lpi-pinctrl",
+		.data = &eliza_lpi_data,
+	}, {
 		.compatible = "qcom,milos-lpass-lpi-pinctrl",
 		.data = &milos_lpi_data,
 	},
-- 
2.34.1

