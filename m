Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981788;
	b=J14NkaozXzm/wWJWAVjXUnkbnt8eJzGEcdUgw9ddsqGIIMvskyVd1g3O+dHOODn27anZ
	 Z5bZ+olIWTuQeoAFymyeJzdom6i+X23JaPG8npBajw/CU+joXtstUGAnUWHucmKxUx9Jq
	 FxAoGnkAjm+rufu2lk/Dlqth0GkaZalKZQ5gZaCcqbnKx+uANmqely7LaKzy6AyjO4Wth
	 qZQ1B6lmGRz7BmP23bqH2KMXuirHFUGzpw263DeSM/mjdm0LWjsYlJklKyO5XHvHF7hrD
	 OnGgk80hcu8+TupyFvvCKDO8nEGTVWNExx0R8tdEBKoaR4DND+OIQStMfmDNmpdc6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=Cd5/2XK8kP4vEI3ZxpO73zyyk2ygNisD6JAEqpmhBQUEueBAUuN2Yf5gmRSuFa+acHYA
	 8diYl1NcjHJ5LXL9p3rNo5qCZJoNn/PsQLUjif6W2qfB90CMsplSnPbD1L2uIS6RJqTQN
	 pSRse/dtmBNQn54SEqFJEW366YoHzGNizh03pA29HQ4Rv06J47ozjVt4vuyeuqS15AFmH
	 tihCYhd6X8wvXi/nuuSU30h7iYamzl/QqOC2WfPiAEHvuD6ggwZh7wappEStwjc9F1cPw
	 k8SXB73d7nuKxDqKYmTxU+RjCR2yqQ0PKSCHW6PRTTws0xeV9CnZ5DXDDEfoT/HDYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8TF4Gzc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8C606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pr1t6QGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8TF4Gzc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uxds1430528
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=Pr1t6QGnyFV/mszV
	rMAcKUoJ1E27zdyrXfPBhOJOKo9KLdYdWlmZY2B9yJFip7XDUl5R3d6YQ8aunJMe
	h5y5/7W9iA3Wyg01WraLCs3Q6Qp7R5nDG+iVc09NMxbqliThBVUQRjvih6aZ7wWM
	nqpu8NGcRnEobkwMbIp0xsP0goBMTkpB2dllYylIw+bNAiigiIwQH0C7+a+fVWKk
	lnlYswJN63L3rQiSetVpQlbMNiuMYxJW3awOb0qmijdRpGWjKqXWXPwEEa8Ohyji
	W2uFj9OSY8ie7uGpD4eZduRBdT3S+KbPowgYQK42pZDljyvivDC9OictKy/TGXcF
	tYuCEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91f88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so7691355ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981786; x=1795586586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=Y8TF4Gzco5F4qpAyT0Ry6OaJ2coapu/d5ZLd9hG0WjibzT5kCys4Ll9wm+JnlTcUUW
         vIcBgt/XXIe2eCawkBOKFmWXXRHaCwrbWHCZyewwkTNvaTN7BQqWKMwhe2GKWNUMpxhc
         WPZNwPby/PD+BHcyUTpBtg4v/3UOv+XtQvXxJ5oaFDUuSR4/TR4TmEWATC3OHSZe94X1
         qGIrd3NSykQnp3PD1gQaN5UN0aEWfH/5gl4+X0hhk5Kua2nWOJqqLLaMsPPcS/oR+y+0
         eA8L9yXissmvbcWmv5PbcFIEU6hoMkJipYnuS9ZiL5Y0nlyekbs92hJ5FZRk/HnJR9of
         LQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981786; x=1795586586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=LrXpFWC8Nfp8PGYXtazzELX95Omd0wq69gwU17PaYUguG+3/xqz1PIIz6Rv8nhOZuZ
         G28RpN4vpaCkahN2099K1hOXWp+GYSUMz9ZgiHlrWPLvN8YNowyaFYQ52u5YX9X2H6xl
         VmJo74+RKNz9e5Tu8rjAdYHx96VKMIQMO3uRVnxpmVnq+719jdxT6sDlbrjvgDAecKqi
         PokG8kieV6oYCFn4SlxuyqdcvPRlXjYlqV4pOCCc5fzdptkQ+UIAGunfDqqj4+DDhSLN
         vXCxtrMOnseCeIdpOmBWR7vvN1xEzqIlCCM7srEFl4TOUPG7gvE6+X/lOGJ3XBLlw6xG
         lUxA==
X-Forwarded-Encrypted: i=1; AL+hErFaRK+r0hWTvymJUMJxXh+j64XTfzX4MKX+y/Gz5MDiaL2nqbE6kV3vnopWYg92Al/kF7B0IOs/zSgK@vger.kernel.org
X-Gm-Message-State: APuU4Z9C2xPyoeBegdcyjaCQieork9ZOVluP9phPV9SogOJxFq8MlCq2
	Dnq7CRZHwuKRX2KV+98QtCig7Agg/4gBBjcqOWq/NaJhLDhxxQ4eojTYP6yIHxSlGkT0UkvIZZ4
	yzLXisvjhSl/T4751OL06HPkXjQ/lHBkr4GqeOqC4wi3bJ7FvwUViuMGS3aeMNRpo
X-Gm-Gg: AZFdTZcmOKUXMI40Qepo9Mz4SAgWqUFM6lZ89xdC9WDibOMldq2LC1PpY+mNmu+AH5Q
	+SxqUPF6tq3SAy9XLoUzCP0WTv3cFBkJ5YeLCGJXrdzIo6tKzppg5+47j4ad+eEOa8T9TbMi+yC
	oocir9JsvTZrYmwlhTpgnI7pSjdIa5zlEN+RajnYgCpYZNxc9a3ZmLJMtlN8NBa1APkQu0Mu8Wx
	YSLbi01Hy55pHuDEeV9WPvIrj1HQR7DQeH93sPFyjbGd4pUXjCYOtr3ZVKIShTlqDamIeDDEOSn
	BXhmOPcTvyVyuCc1BZcJIdbq1HnGFuyBcWN/HsohplZpjZ7CBPV7sgPvTeb0xMmxOqDylxvP20q
	AAHv1JMY+TEPnTQsK7Zn4h1fsMCuTy0zBX3bu7jEJcNnmuFtBk918FfdhjcJeo1xm8FAB/Y2ytw
	==
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16730215ad.14.1794981786522;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
X-Received: by 2002:a17:903:234c:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eff72db605mr16729705ad.14.1794981786017;
        Tue, 17 Nov 2026 22:03:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:35 +0530
Subject: [PATCH 04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-4-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX8QMR3AiV4naB
 uDgkeBj2pMXJ38qqxGynQes4u7rZ3ebnRs8NXndkPN5jExDMUQyRjAMdzDK+20zev9PJtjrdneH
 oxwMtq/oSh9bB4YHlIwNa/LfD7ztG2HAYAEmVUsHbIt8I+TPTL7/E22ZfZfMpFDdrTskDCCPotE
 0a3ItMzE/GjmHtNel9jyA1XtRMWBOGXLTrbtpW/zZpmbLnzK2jdZWDl/4/OJBMByquqBHgbK0ea
 nSh6unR0jO5kPzP//lUBCCFOsyuZCU84v0o4cI5jUFSRONIfl7JWhF5KKM4zneZ92O/L/J44qh+
 EYog0nR5DSA2LfKbx5dquQS1oBszQ4FHpLjIEwu3oZd4tlKXl4UKSgflT3b6/3p4ycIH2jCitA6
 +uE0zOqncHU6IBHe/Z32UN6Q5BwkhnTd8oG9vhdxrUI55CD5cAUppwRyZRbHHGeAbbJyVCTcmRN
 +FRarkUnU6SYX7cEy+w==
X-Proofpoint-GUID: 4ZLLdY_Dgy6A7ChLPAeios5u6DqJEefR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwzj0uhL5JV1Z
 031d3+6ZYFlW/bFlDL31JhXXn7paSoWMPuG1qlA8i0ferAfh9+N01i/KWkgKF6om8BQUJIm13WB
 AjF4bBqtBEGK7bhtzX/hxCQwy6xC/QQ=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd3f9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4ZLLdY_Dgy6A7ChLPAeios5u6DqJEefR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio35 of SA8775P. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff008a2605876eb329496d305735700..d299f47a0bd4ab1a0cd0e553ba50f9ec1e035686 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -480,6 +480,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -828,6 +829,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1230,6 +1235,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1361,7 +1367,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),

-- 
2.34.1

