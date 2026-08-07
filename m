Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF1450415
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085608; cv=none; b=mdu4CyhpkqcVzscW8RyBGmCE+iAUVH6I/8j6UrnOQTRMY2XAJkXoioRO7BM4MgYCbRBIWcHdTP5o9gGVvHP+HL4BMI+jvjZpIsjeFf1s/5H5ZT5zvL7H0njf/TS/OZN+uuZg8FlWBgRQJg4D3wRwhjEtaUY8wCF34sS9t6l/CO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085608; c=relaxed/simple;
	bh=jNuWv+XGpMyALJIAtJj9yL61d7ZOIi8C4yCBzoV8Xqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uwlr25GW6SlpzZxq5PpVa4o3IEUpCA+PyVbHX9sI9ubTXF/rIJfXy7V+TO3AfdNT9BCceSgA+c7hz9kQSf86uUivMysxh1LS6yrHOeXKZhPJB5f9x0ddEv7aPNpkKt/DwnQjnqKKKdoypZ/IbBD0VXgZRs+jrpb9g/Nx9xogPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKmaLDYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPMqtLUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKmaLDYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPMqtLUn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770HAI73829628
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ME6jZsmgzhkL+RVJA5JdVUmjxlyN4Wg7EqhkdNHZtMM=; b=OKmaLDYruPW5W9e3
	4wvRx9DXlkmS0ZoxYar7ZG0j/0ezlSp/vvhODwS3B6tp6YwnuwINPIWNirb4Q4Mq
	hX1dkY+zi1N5YhZzfVtK/r9TfKqQLjjY5Ak3Qq1oIVeFVg65TZv6sF4LOO/34c1K
	ePIObiSOTLfB1NE+rNnhrNOB7O1gB4Lrs+gHz0sBcIhtqfE7mmtJ8upT9ig0lJmi
	tkDboeupH+u4tJEoI81kdR35xLgZH1Hoj2Ub9ByTgHSvrmBtad+Pv8ifLeMn7yim
	+8Y5LICG8tukUVUt0DHaByGt/UmTA89zvp/F2KejrwApXYfNbrihooAAfnhhIVot
	N2lzqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gtrfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1956499a91.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085602; x=1786690402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME6jZsmgzhkL+RVJA5JdVUmjxlyN4Wg7EqhkdNHZtMM=;
        b=gPMqtLUnGS2cs3QX8u2Akt3ap6c8ToxyablRJsghMLQabEaEpH+0lT1H/QmJ/VpNqC
         cz0kTs1+LqaNySUIzHKWhp9gZFtnsvVIxLqH70cXJVsUuY/xuIm2aD0lQJnx+5PSOaeR
         UNBzJHdWkU1d6puenRfMlWy+/8KCRSyhixaGv9QsuWMQliosGKt4f/2DNmUaPd3Qdu42
         v6hfnyB6KkSUSTx4F31Gq+Anbh5mdgT1rUptdLZfEChFZdyDIhUJrgW1lnOmSWbqcA5+
         /ZGwzp6GlLqwjV0UAasJn5pw02G4NgJabqMQxz1W2Xh/AW/WL4powH7G4sDmlPwczaQ0
         mqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085602; x=1786690402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ME6jZsmgzhkL+RVJA5JdVUmjxlyN4Wg7EqhkdNHZtMM=;
        b=qpY9RFCpJFlthaQOnIAiTCzTAe1Fy2wFizdMOP6VlnAIKjqDKKskF8ZGYbR9prT4Ox
         5n0qch4XmSJz7yWnD3edJkDJClIcylNoavIqEV/5sUeWKgJxRROsqk9ozaP2hNlHv3DW
         eB7ymWzEioy2x9tpxIoiFnG6HFId4efzEY0FQyfEIPrEyhBDLlGOigUA9SY34b4Q1fQN
         KQGZA0kPYALVKvacF/1IYODossM9KlOtRtHlUa3rR5Yl71ktmlmZpyCWEToH1HDeUe4n
         Lpi+ClimyX8nYW+uQkHnA9CTqgNumMRK80GPYpI5pc/jS9ulBlV41a0JB88C4jLikRYR
         zybQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfyrozH3ukG0fCPNPeOMxTuj2vUhEKkrVuIzHi6SvXhVQDguIo1ySfwnC+Ppkm396M9EFRYkvQ7dYx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yOWABcpMtdpCgbxHLYT0tHe6+wOX9tbPalnQGfVn2H9YzTde
	rDAIDtVMIIyDecLWFyh3xT3/I7CdsUVUEJz66a67R1AuucmmQrl0F+/M16o7J7GqjsMn3Rz4ij9
	vCNs+RzQBDzsgfdUdIfMRxNgg7DBrocytIWPhgaB4sHeoer2jx8hhVtfz23uTJZgV
X-Gm-Gg: AR+sD13kxsogw+9sQZiIPUnjiqDgk4g4IUJLvvfVhzHIV7ldTrtX/wdv1zbKuEU8QSE
	0rI2SpJVPrrIhQ0nUjlnWDZM6tbWoSNSEQbY94lKXMr4PbmT3QcZzXGGkhKzgTJufvJg8e9oCe/
	PYV6I6+IVnVcmrFBc+PHUt8dh9bMjFblBEw5bEiy8XnYIL8Q5zM5Zq9ABdmUeJmVW/G38AzEC+1
	ztzFwHd9ywbktOuDdW95FKNQJOfIVpJpuh2DaOtAKt2S6wAaqdaYEGbwCOOZitBXteVD5eCdR01
	Fx3WuGSy1gT91KsWdOdc1O4ZlUyh3dHl/AX+ITTWYKkvpCVMe4Mi6lf3kVXWaw1HgD176+8l+H9
	JhCICWGGdhGCDgNo9DnyKI8tqEWa4Xxp8U+Tc1KPlRsg=
X-Received: by 2002:a05:6a21:7105:b0:3bf:651d:fee0 with SMTP id adf61e73a8af0-3cba2b5d6a7mr12750111637.19.1786085601544;
        Thu, 06 Aug 2026 23:53:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:7105:b0:3bf:651d:fee0 with SMTP id adf61e73a8af0-3cba2b5d6a7mr12750065637.19.1786085601099;
        Thu, 06 Aug 2026 23:53:21 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:20 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:07 -0700
Subject: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=5259;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=jNuWv+XGpMyALJIAtJj9yL61d7ZOIi8C4yCBzoV8Xqk=;
 b=x0n6y7n/nwQbD4vnCCEHQxz+2vroumwMI3r42ziSL9lWhw8OFIwCQM3ZcY1RSo4LQVZb9N3g8
 u0MUJQ5QAe9C/UTktvoXT3K2OSMCrL16/eQbpRNTR739BwuSGvSTM4p
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a7580e2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sASEB03DHn1-PaNBISUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: spCbCnHhtCkJ8HiSz4Nu1vGwHvWubUCO
X-Proofpoint-ORIG-GUID: spCbCnHhtCkJ8HiSz4Nu1vGwHvWubUCO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxUEpXCQhUL7U
 CfEG/rRzR+1t/TheQvEU459hw0c1QOCDFdk/rXqueXkZQXv45t5V6cH6BGzkinNg4rtnvotye4r
 WIcyNOQzJe3+oCB5tJ29XdonPFkuX/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX+W+dEKkFaRnv
 BiamC+IxuxCsdKuTDKZ+4+r8KmCrJCrSCB4v/V/epw2Fcva3zKAmhnw2FYDWHkONkOioCwvLoQp
 TJriuuypKsBlpD4DC8dBQCn2Cn1V+0/8Un4qnjYLDkxUyvyrkbi3eQoKcRMK8NmxNolNWawQ3j9
 K8XYg0ipNXS4ybxKHTjKmeodOOtra2ZRmsnVjZk7gUWYUhrK8h+gJFz1922acF5MM8bOYgde36h
 cO6eNiLYagYRXmbaDQRC0XuKuDM8yAbKnqKotrQLQrxVDC4nH0XZNT9mWEdjkcZHGkV13D7eY0X
 e14GMvDAitoliEGdnM5yL/PfXpjEBz19jZXlpBwJ+GRdJ9GHtmsfDOO7Kmh/QIpzESuDWcWtZ3F
 Uglv7VWxR4n+afSjeWGK/4pQjAMQYUqViHG5DHTUxWOyEXr19OHkDAoMplZ5s6OQR7DzufnmJgv
 DotvQ37hVGjAxmYemCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Some hardware dividers derive an even divisor directly from the raw
register value, i.e. divisor = 2 * val, with no +1 offset. This differs
from CLK_DIVIDER_EVEN_INTEGERS, which is one-based (divisor = 2 *
(val + 1)).

Add CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET for this variant, updating
_get_maxdiv()/_get_div()/_get_val() accordingly. _is_valid_div() is
extended to also reject odd divisors, since _get_val()'s `div >> 1`
would otherwise silently decode them to the wrong even value (e.g. 3
-> 1 -> 2).

To avoid regressing rate requests that previously computed an odd
divisor (which used to succeed with a silently wrong rate), round to
the nearest even divisor in _div_round_up(), _div_round_closest(), and
_next_div(), mirroring how CLK_DIVIDER_POWER_OF_TWO already rounds to
the nearest power of two.

Also guard divider_ro_determine_rate() against a zero divisor, which
can occur from an unprogrammed/reset register, the same way
divider_recalc_rate() already does: WARN unless CLK_DIVIDER_ALLOW_ZERO
is set, and return -EINVAL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/clk-divider.c    | 22 ++++++++++++++++++++++
 include/linux/clk-provider.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index b3b485d23ea8..f062d77ee106 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -74,6 +74,8 @@ static unsigned int _get_maxdiv(const struct clk_div_table *table, u8 width,
 		return 1 << clk_div_mask(width);
 	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
 		return 2 * (clk_div_mask(width) + 1);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		return 2 * clk_div_mask(width);
 	if (table)
 		return _get_table_maxdiv(table, width);
 	return clk_div_mask(width) + 1;
@@ -101,6 +103,8 @@ static unsigned int _get_div(const struct clk_div_table *table,
 		return val ? val : clk_div_mask(width) + 1;
 	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
 		return 2 * (val + 1);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		return 2 * val;
 	if (table)
 		return _get_table_div(table, val);
 	return val + 1;
@@ -128,6 +132,8 @@ static unsigned int _get_val(const struct clk_div_table *table,
 		return (div == clk_div_mask(width) + 1) ? 0 : div;
 	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
 		return (div >> 1) - 1;
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		return div >> 1;
 	if (table)
 		return  _get_table_val(table, div);
 	return div - 1;
@@ -181,6 +187,8 @@ static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
 {
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return is_power_of_2(div);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		return div >= 2 && !(div & 1);
 	if (table)
 		return _is_valid_table_div(table, div);
 	return true;
@@ -230,6 +238,8 @@ static int _div_round_up(const struct clk_div_table *table,
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
+	else if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		div = max(2, (div + 1) & ~1);
 	if (table)
 		div = _round_up_table(table, div);
 
@@ -249,6 +259,9 @@ static int _div_round_closest(const struct clk_div_table *table,
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
 		up = __roundup_pow_of_two(up);
 		down = __rounddown_pow_of_two(down);
+	} else if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET) {
+		up = max(2, (up + 1) & ~1);
+		down = max(2, down & ~1);
 	} else if (table) {
 		up = _round_up_table(table, up);
 		down = _round_down_table(table, down);
@@ -286,6 +299,8 @@ static int _next_div(const struct clk_div_table *table, int div,
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return __roundup_pow_of_two(div);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET)
+		return div + (div & 1);
 	if (table)
 		return _round_up_table(table, div);
 
@@ -372,6 +387,13 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 
 	div = _get_div(table, val, flags, width);
 
+	if (!div) {
+		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
+			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
+			clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
 	/* Even a read-only clock can propagate a rate change */
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
 		if (!req->best_parent_hw)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..368970d6a12a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -703,6 +703,8 @@ struct clk_div_table {
  *	big endian.
  * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
  *	Formula is 2 * (value read from hardware + 1).
+ * CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET - clock divisor is 2, 4, 6, 8, etc.
+ *	Formula is 2 * (value read from hardware).
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -726,6 +728,7 @@ struct clk_divider {
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
 #define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
 #define CLK_DIVIDER_EVEN_INTEGERS	BIT(8)
+#define CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET	BIT(9)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;

-- 
2.43.0

