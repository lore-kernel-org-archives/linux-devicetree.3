Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124534;
	b=mz91F+4X7wePJnhKtud9gTqUMaBvU2oT1S3nTc/KfRVc9NoLZJfzmBQa9GCIrSUAAy50
	 0oBuDd1VXB7tAdmqcJYh4qNbs+ntmN9mHryAKZl4XoMsmQrGAU54xf4TS0TnZGXNreA6Q
	 szlFyyDd19AR5R+bupErDjcS3OhQjRsVX+y3Rw0AK4OtlEGy9B7Y7UxEEMpTthHh2Z7NR
	 Qh9lttjjUbV7iDjwznUnntJf2idqCbrqNsZ38UFrIiDBere5KE+pF/128VB8krljiO5Y4
	 1Etk0JBtK1uoTTjz3fi7sFg2Oy3XeEFIX1Z0jIBxJUUvkG75YGiPahNR70FhVOW47YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
	b=YMbdEn5sEs9Erpk2+DM1dOKZjQC3g+k1eQZxh1GrUuX/t3A3kJpjlQWs/e7soJrQ03Cq
	 ulfRde8MFoR7AofsyMfbhMdmvlMrx3v0eYu7jIPAuxpktVKRpntKlDYUUkUis1SVYncrX
	 60JgvaZSyyQXYN0eLJA5btJWS60tjxH4taJcF//NYbD/duqMP41IU7p14t/GCMnK1Ul54
	 5UOezhFVwcrv4+3QI08eDPT2eTYuOmDpfdvlxkL5cTCxvqkflGcR6/spXxviwa6yhaUTJ
	 qK0ULbpziZzX2PP5yIOFvGNiuWIUWewfeKQ1romqDciNn/I2dMVDUyK/N+pAk846dGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mkai6JQa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CP/eJwSl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37591606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37591606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mkai6JQa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CP/eJwSl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RGxo4V2786474
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=; b=Mkai6JQaqO3XSNUa
	7CPrRCbFfNGMwDAbLD/eXeg4FuUwhQ7JPdSNS9RF/8XiP9FePlGIP5kG/O+KaOEB
	oGKzV6QKjZfKJMzalvOlIaR5/q7Kg4PT4kPy3bdI+wPDqWo+s75mhYGBAOTBhlEj
	YOUx4p+gj9EsXLTOdVL4svDlOAD9yRNTQoemaDTe6CxpzR7dLChMppkOGaQLRX1N
	EFCpZWHXkYP1qWrcfgcLTXyKFAicARVOFKbZiWyrgXDxhNDDTbOawp9J4qjGMFoB
	j4acTFAuI3ywQoJtUcbO2MVCF7+vndZ6Kd0BBBiEMiBAny+fB6bz4ymLdMKbgQUw
	qqEfdQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670jtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso254238eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124532; x=1793729332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
        b=CP/eJwSlHQX9kFp8OvyUGPmwa8T6X2FcJsT1WpKXpMvMwK9qd4mblEv5z5qaPV5nW7
         I7fNHiDFWpsff3k1ZLawtTqZ2NrgkhxQzYb0CtsovYyzErbzPy+07AHhBnSlctunkk7O
         Bu0GvT9B3HTA46Ww2UsZypFdoZSrumIPeK1rjtGAq5oFfyyOhEkqk9l4qQHMRTPNATlq
         AutWWLBsBv1Q50iB3RQtvyi07iSY59AThNMRHCrU6YjSj7t6wmn4DACi+xSoKcoXtjyy
         uxL7O4pxRN55m6f6tSmAXTf3EjhkYg3Ap1Ifk4SFGyMbV1ur11wFk61+5JhqqRJZfe/k
         PRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124532; x=1793729332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
        b=IlGVwgMfJKj/Qiddt9orxFCTeykUf0q02q8SkHbNOPe1aJpbtbLQbz8HobU3k1czz/
         UNJPaf1wRK3Dr0QkIVIlRSk4vvyQc+OrmmBNHMI+qztIQiEQlzpyPCWwnT8xb9Dnhvid
         cD5rl44NRVPq2DaGgWsuWdCjD5T5qocO4KoxjSxhrIFhxunbAlTe10M8Tp2VJ+K5UczA
         d/X2u+XTgTDu37etbAXWfggwE0FER5ij8j2x8Ua/SfHQ12pSUzNQxMJIZki6uC5fVmXt
         a/zPK0twhfLIQUyYzYAllEg6WrBA173ziDrkszkXW1k0Eva2mqwnepfI/kS0ABJiUEwG
         dksg==
X-Forwarded-Encrypted: i=1; AKwUvBwXvjLR1gLgUTcbOw1rf/ivCJdSW2VJheUQws4AcBKAwksRi+sepx2ZvucdftlE7FrsJlE1GCkJHS3d@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4k6M8ef6XFY3dVE6Q9ovUFtaOOn8WIsctz6iizlaDHq64y1NQ
	4uVGoiNFb7xlw1PD/DnnbN2q/0mqDm4425XUDp0u6Nnl2lsP6W7wl3CjcgwJfS+ZKfB99FB8oCA
	XDZadplbbvQ1Up1/Xc+DK8oNuLZkDV6m2bUKo1ruxNKSyStokGOq1pWSZHw1J9hMY
X-Gm-Gg: AYBFou0oClXAMB40xtedWX/hbJ3g8Q0IgbQHN4YacE2A3YOtMa85I38KavoWD8GO20V
	x3XpNpvh6hiMYsn3mEvbmMMkGYEOGw6MmL5T1IOvQp8X8K4eDJlIl6Jpz8TD3dbLyUO1qkwh1/G
	eneMo2LXDs16WemJ0giaV5+98iOpLZKCwaPAh0SLDn0nXMn00gkUasL46OkSrDsaNo/Q9zt7ukK
	DF8skQHZh/0KsLm0Uxa3MzDXu/4WtpsyZH19BBB7Y//ClQgRqsbB7IHosSadEZPF7qIq1R1+E86
	e0d2IYa2UL7+UpHs0An4itCt5WbEZoNMww19N3BerkUUHRIxwG7T07v163AffGVKvhBaq5Nob0F
	lkPWWXaUTYejI+wMX68jvKkuG
X-Received: by 2002:a05:701b:2908:b0:169:bef5:f445 with SMTP id a92af1059eb24-1a6c85d145cmr41485c88.4.1793124531740;
        Tue, 27 Oct 2026 11:08:51 -0700 (PDT)
X-Received: by 2002:a05:701b:2908:b0:169:bef5:f445 with SMTP id a92af1059eb24-1a6c85d145cmr41445c88.4.1793124531116;
        Tue, 27 Oct 2026 11:08:51 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:27 +0530
Subject: [PATCH v3 2/4] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
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
Message-Id: <20261027-nords_dprx-v3-2-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: PkXyAxMeWrSvattOgvyMIdOmkolQ-xeY
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0e8b5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i6vi37AUFhTFFivpSMsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXwpVZ6LR+hXs+
 23H+gDrzPTskH2Bna0V7kvVvyKIhRNSgs5q5vVfYlNVQGbP6e3sg6TontRPmsSU++lOaY+/89DX
 fYIzD8in76dCCxZakK06AzRbs6Ims8s=
X-Proofpoint-GUID: PkXyAxMeWrSvattOgvyMIdOmkolQ-xeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXzDO9J0oCisdl
 ObFO03oPRCCJBI+O5ROxdTG/oym1hxziSAMYm3EszFlZVDBvGoioXRE+UWMRPKQolkqSAuNFR71
 8kv+yIpzW1YTGdZUupGNZfJlmOhOUo82cI7qm99hzebD+qlpQr0aJdZE7XxYumYEtTiOk0SgatG
 fzu9Yw002cw+c/KUHX5X78mhAuvAEXFiV3PTzVyN4x76bflztddje/lJJYyUhsLvT/bC9fqTdBL
 G9xHOmXkuKhlZg12gp+DEq6uaU5bZ8HMGrN9aJSy8k/42fkRLi5KzOfX1/eSULSx708RBchEKgB
 1aYTr35i+KdyJH6zIibn+ycUDX2QzWfEkOQfZzb/I+8MQkSwHiXr30Vg8S0EVrHRKzKZgo5aQzt
 KY3QWAXLRcXnKcwNY6uvqxCJdxTI+//Bg6MqxEcQ1xedKpG5G7hSzc0IFHyGY9/+YZ0oaAnPGhk
 7Wdn23O+OYHzaCT2SkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9782fb062a58a26daf3e911ad23c5e1d805b0c38..9726e6ea7f5f80a6355aa58c345657aad8c157c0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,7 +41,6 @@
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 3, 0)
-# define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -382,8 +381,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+		  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2290,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1

