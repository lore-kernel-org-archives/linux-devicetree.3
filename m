Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981825;
	b=TGxcTBrWEH+sVoPKD5sXXW4O8i+jvwSZVtOgPk/4sATbZqCG3g659rJhImOsuiKXp9qt
	 TCK8jEIZoP5axEwH0UnjrOwhNZ7gh6E7070DigrTKHTCfUwqu3Tn0irMW04QcM3RmYI/F
	 zYMKKH9LD+QSrOBSB72OfSagaGs6lU5U1m/LCx6mwZtF75siKm5P0IDH9qCXpRiz2rjvX
	 oATNso2uiy0Sj4SkdgXXVO8DKY2wylgCsgychMh971IIEcyw9lUpn49c4P31BBiSGPj1r
	 +QKxXkonA/IR83RB5F8LZXZtPuEHOc5FNeSLMQKcQhRumfJ+eLL28zmo/ociOaf54kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
	b=HeHSjFbn/AhnmyuJvoyqTQtCNHH72Yj1VlFw4YFBF7+tHKUK9sGgIiojG+r7i6hoDi5i
	 kLGlHQHLj4TKPZVKe5RYLZqECQ508ONAwMIxxTy4Qup2n+d+giPUVwNr01m/uttQSLkec
	 Q9XzFQy9T6QLcXe+xl1/zP39BdhZB/W9jiA+H5YrTkNP4yUhr1GqZ9kjUVtnx3BonPDY0
	 FIv8dk8rMU6+kCxFI8ENgzvGfApWdFAZcke8ngK/08ccGlrbBCp2+fs/cnEdPguOtqrX3
	 5nYhRvbV038RH+valTN6iiqxMRYgyouFw61lpPAsIRJP0H2oY8KlFFbgq85+wC+seGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C3606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529C3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ur882383089
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=; b=aNJMXADihIjrDUgZ
	Mgm6RCvO0w5BkQeqPTUTyYZ2DQokogfrClf1EnFLlb8MaBhcvfh/x/m4OY3rBZky
	Lgmqy448K12R1ragzJ3ZzS6r7474G/Gpj6QA/Kfxtz9quslqRhTp45sDyiqnQImI
	Uz6OA5lyXlacBLJY9nZ33Fj7Y5ZfdvfeWy4Zb4M3YaMxC/+X+GFVVBymrDuKJu3o
	2tBA8UiuCpJnHod+qNCcPlgALYlF0kEWiqT2wDfoye1W0guh6Qha8Vi47Dc5zvqf
	liyCajOmQ4wDsIy7vein2St+LJymr+wanWHfpMLVXLSvtNQK32yRL32roorwokcO
	glhCUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasg9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee04c49451so8265275ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981824; x=1795586624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=OtChCArWhFcoQUBO2vUjXk36o+oHIWBnh1hEaWJIcH7/OoRy8n3W1j7FLPwROch9WF
         9/Xj3LEZwbgVAEb0gdOQThRpspO0MgDPKLsxCBkQIdIRwCxb7hpu9EUFDL/Wmz1uS8Q5
         uxqq72WBPz1R54bCpgtJsODBf5rA5iVIEuy1fGb2m8mYHP6p1TOVvZBScIgYVO9lagUI
         sKZIwY9MR/YE2Yedoihks6L2/ceCNAswzOHuqbppSERWlqo6F4P3ah2hcQ4p3bRDjGW/
         xwIfdfEC6POS+9jMJPQQcaXM5BfyfEg6wzVGopzxlwLRUQp4w8EOUYhIi0q6g6mpB0EV
         ldmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981824; x=1795586624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=FozK7zQ7C03f5poEVwr6MwxrmUa+tTv6j8F4zV1meXEjz2HotjBb58GJj0jH6WHOIe
         KDQO0Phf5KD+mvuGK2kPh6uwR9H1XBAwDOlIlPsKi9UW16rBN3Wo0tXNUOZkRlfyyr0e
         0jQEBgWAhbA+5ThMTo7BzxgY5L8dFxvVPjQGJCCf6jinwY1XBs30yFCLe2wwk/KeABuL
         qlKvZSwSJSNraK1fmIFcXtZgjE6duFcj+je6ztjrGM0cgI3AOmlHrh33XtWN4ZB+H5xQ
         9KfMuZNBbpwz12WKphVpLmVKmibbDuinSq6U0eIrLZnifjrMxxQD0VBPaVYch3A6bYIp
         5YOQ==
X-Forwarded-Encrypted: i=1; AL+hErFGo6Hm1yQDLbXQ7CH85anGqp6PwpA0Fb4lpZCBoGzzhdGb6EiW4vDfPX2BlFbkLTvxWWYBnZSPUKXs@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJXp4bs5j/freZmsZgMz15xQg4q9p7bVBz759lb++64Sn/zxL
	WmqoFw5CjUg3b1+026eJfj+60Riw+dmfsLuZzLShkXOcbJkSi+f1h71cQS19SslMAIzTAv5SNiH
	MwnLSWptKd+wfSV/KFyT0W0fb7L6NQEuK6VECIT+osfoFN05cdE/axJMU9d4oxxjD
X-Gm-Gg: AZFdTZelnze3PAdUsFW+YgkYyJYytLJcIPTmWHkp2Y3IvVAkgwNPnVgH6XYRMyenFDP
	9QBoEipMpV3t551nTQRgHKv6hmF0IaJMit5+dWE/rsK1tdm7EYgWdrHQe6kUJVZ6v89R2SSU97a
	yDXbcBLNZbGVwcMLAqp0iZZUo+aIP8nmtb1I9Wi8YPib8PuXUyvhubqTYsWNVABAiX2VQhfvZwY
	A33rEf+jpEtyN+sjRSE7En0MZbrTHScbIko6yG3tUuD7mb1QNUvOg8eArq98KXvrM5w/c6siQwP
	63HXUfxHMGRrdXAJvQDQgfsM1AlltvYhGD2VZQmcpKQYV0bsHbwwijhryuSwoHu3SRZ1RpV2kHe
	ZN7WtYFVP2aJ8/s8AStbqoBtZ5t1yIOtxM4LyZ3m02ibfxCfgtEriWpp2ToGodt559P7MBoZwUw
	==
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745535ad.33.1794981823902;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745225ad.33.1794981823454;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:41 +0530
Subject: [PATCH 10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-10-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd3fc0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AjQNEpg9l2QmTmGhayZ39hv-YqkI_tMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5YIf5O76eixW
 CH4B3P7I6qNnw/pylfvvg94urIseACg4JV6YgnE/n38pBqYJP4ihO5hfdrmvZbjx9IG4+/h3Nk0
 gu7/bv55anzink+EQapVpKoc7RPL2AHOsGFlQ3A4p6L+sHD6A5tW7KIMLBygKnR3HuHCRLDqgAz
 PbfZWrl6eOZLic+nswwO3FZrCDL5xDqYQdBwxuh/IRsfnwh+4+hF+a7QX9N24SZSRf2VD/HXEEs
 uFBI4KPAUbaY9Z5oow5WP83upEhS+xbQ9gkVM5y5ul27mEyG9Rxc3zOh2TP5GAgoPSm3s3LIxJQ
 3zXCzoCaXuORtHHHPPAWzjPYFGKEDKZgsMStETlDwB9MvTNqHfcJ0zzaSs+4Svvx/w3Tuoi7dja
 Ajh0wx8EN1RATxUVayVwXes/5sssqcJaUjJ/CQejyKXkpqphPJXFaPaPnioWG3MZuZ+kwxoGlQI
 rs3F3ph4DdeRhCIMdcA==
X-Proofpoint-ORIG-GUID: AjQNEpg9l2QmTmGhayZ39hv-YqkI_tMW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX6Vts8CjBt2Z7
 VPozfsUuvscTZRlm1U2hj0MD9xYPXFiYSk4ONqZuHGj/hVp0ThirhSepM34tAnaLCzIWk+4R5PZ
 qhgXOV6uX+/GL/zAb5bU0U0MmnsxJrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of SM8750. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index f27e55c088d51becc98d78a87b25e39da565b3f7..9bb280876431f6b22cabe4e9b39780f10494d738 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -584,6 +584,7 @@ enum sm8750_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -875,6 +876,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio77", "gpio99",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio64", "gpio65",
 };
@@ -1322,6 +1327,7 @@ static const struct pinfunction sm8750_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1485,7 +1491,7 @@ static const struct msm_pingroup sm8750_groups[] = {
 	[50] = PINGROUP(50, qup1_se4, aoss_cti, sdc4_clk, _, _, _, _, _, _, _, _),
 	[51] = PINGROUP(51, qup1_se4, aoss_cti, sdc41, _, _, _, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qspi0, ddr_pxi2, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, qspi1, _, ddr_pxi3, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qspi1, gp_mn, ddr_pxi3, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qspi_clk, uim1_data, ddr_pxi0, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qspi2, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, qspi3, uim1_reset, _, _, _, _, _, _, _, _),

-- 
2.34.1

