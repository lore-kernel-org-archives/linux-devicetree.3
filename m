Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D639B978
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498815; cv=none; b=XSacnixarp0Hss4l3w1D5CSMMrONDM6JilGb6O6cbA+FajY2L2+8bsEY63AN4TTy2TGUUK7FBRIQmGgdTaGdmh1h/YlvJ0wyVTb9Jmja4zYxK8CKsGvPSSxTDpbSDSgOloe2L+c5Rbn4mXBszFEf1Zu5i6CFrGASFUxLuBVEu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498815; c=relaxed/simple;
	bh=a7vBq7QV/0yauiv4Qm+n0KSEd9tQP2btOuvl9/RRzPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXwlkzsuhsUo9T0kdeuH2yfAG/XJdyku4NeTDsJKPjDJah6Qj686mdXsUc/x/C6SG+YUxE3pBA1wR9dfNsiP7LpBEsxJLJxmv6lX+ilGnyMvRcEYAxAG5bl8bdRe0YIbtum8kTrpcmKecSELzAPJISIiuS5TmDhI/1m1xsvJnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sug/L9WI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0p12sD2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sug/L9WI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0p12sD2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Ebe0E1476743
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 15:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=; b=Sug/L9WINtQNcSA+
	VWzI4NBOLDJYWHDxbR1Q2y52ks5mWmpK/zQDBuk1kYiiuIe749UqP8HxcnCXSNfF
	+k4v1Z5ISAxbWErr5WJj3qbI83sK0npm7bm3T6/lBt8fFS/a7ke9CeXLBm0KUaTr
	ITw9IjYS2woEBFMtwqR2B4ZZHW0Euind+QTa160zVwp45K2jPM3h9ma/DBZDwUPl
	r4ZONSuc0YhF1FprECN2KA/DFYpRX7pLFZXHWuZcnTzLV56SVYM3fvcYiYIjD52T
	EeB2ULUr97u5snKtDVXW6Ig6esFb66y+3cqYs4GkTmfZzwazR/qiOlE4vd2mBwP/
	ym8XPA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nr3dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:00:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so799396a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498813; x=1781103613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=A0p12sD2BqbKTEldaryjvl/MA0S/qu/H+nKvBq0xXt3pL+wVikKwNVFgC3QKOvNHXx
         v+hMeb58qwKEtlP7U8yWpOu3zexUEkRA/1GxG6WRWW+t9fiMgJ1mCT3gmD2UBduupyx1
         JH+/Juc6cq4Qc4jF0XqVE9eKqjeVF7pRzcLTxoI+lKIuQ6WSlVESaQOUaOYkdoa7g/wg
         /2XKjPJLKsm1E3JG2bEvhIIAqYtWyBoe6FbtFXMvOXLtzwZzxrRFzHn6XnHZVi8d0Pm5
         9uBqPz4wbDPL/PXIeyIaRRWyw1/BCm56zsqK63/hIWjwY3fFZvAnFxL/uns1Jv3N36h5
         bUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498813; x=1781103613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=K/qBUWkbLK2Hm0xv4MAMcHoMimgG2solMhvpVvA3dwoScl/oXlDT0Lxnwh4QgZtSmT
         5qDd6IS31fbEEteiYGOMhyodIgz8KFfEClf2GwfmAJsFo75BkHaXTgy7vQBWCkrYMAr3
         Vl07v5MNg6jukfD1gVD5grSbOpzy81QWVJ2n+OppUJcHqWkg0/LI+zUrdi91KumXCLkX
         morr4BRURPQ4tS1M/kYDthrV2aElAe+uGDrhhMdaIjD203ekuHQH4YYrF8GKCO7b/4sj
         YPfu+GR3MzJgQoyaOsmo4RfeU66R5vZbmMy5mTD6vSPUb0LuWxKrU7pb9dch6oSiUZuf
         Nb9w==
X-Forwarded-Encrypted: i=1; AFNElJ9t0g1bTsMakGfyfH6OdGnQyUC/aYdqweBXpCvF/mgjApf9gdqSgsrMEu9K5TAhLwvbsRor/oiCRzM6@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJA0ALoQ1xcxoY8J+IWKbyEGkzWvg1C9aWIcVw/0/oP33OChR
	9zFgsjOfDhGir1ImqekXhydYWcDpECHQesD1FECtoT5h0nIYIkaHXdmEVgJ7Wk5iGIYee9Qd6O/
	n5Wb8QkcD6MhneTpg+shCWNHXvhn0znHUuhF6Og6BHJL1J9VaR7qBSX281rBK3Dda
X-Gm-Gg: Acq92OHyQ0d/WgwlTHYj76vNrRb5NL2z8RD+USQUUTX+D2hsL95EkCmSvMdVVKO03zp
	2B8F4YNWWHImcEJC0xwKElgc52JLYvJOv3m90izWlQT9TU/dwhTYyem5+nxs28za0EgrXLdQ+Bs
	nxh9fOcLsUlDUCvox1bIcd/j2Kd8uk6/vVXc8w2uuuvSCtUvyxBM2le9NOXBducMH+/Cm+7P9lu
	i4fv1CB2L0Cv/2ti7q8JGr2kjEfNKuB8pBDGzUkoIIBADAy0zatKWkyNbR5Rjk83IhisHLYyVSj
	Czd4gloRqP6u13uUXi3Ke0yDs4QS58cjYUzH9tTPqJHN1+GXkO9xM7LA6QE+o5o4YDevZB2Dfyo
	hT03Q3Az+vtu/jxR5QzynhKUwVodNaT6OE3Z3mYgksM3ENSH+H/Uq2JzTXi0=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771738b3a.33.1780498812807;
        Wed, 03 Jun 2026 08:00:12 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771679b3a.33.1780498812312;
        Wed, 03 Jun 2026 08:00:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:29 +0530
Subject: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=988;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=a7vBq7QV/0yauiv4Qm+n0KSEd9tQP2btOuvl9/RRzPk=;
 b=LODbReeosUf6ztstgUJKlWgizfw2G5LN5Ygs4s0z7okzEppVrZbtrF8DieJuyRHJDpr2KhVsO
 X+HJ7VKFlFUCz+q/m7DTxr52OcTpVegvlvq5s18YKs1fSb0RScsxD/X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: Kidv_Ac5GqoC75UsvRks1nwSVlf3nwK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX0G0kNUCy7vp9
 vXA/oRWwyBOSUsm2FZlvBSVUK6FS0SixbygnMSFFt6d/o0uR67ypY9QQP8gWW325CgHgBGliA1p
 OGnskvm6PhAlBhsZGyUzOenDWSVs3pjTijYR8X7m3XKvTlESbNtmOsriooHfJUSq35Yn9eFlQp3
 evMRQeU3vbJYt0Sz3eeZyj924peJPdXHUOB068bpBT5r7W2NF+w2F69uwD4Cf32yo04XOylH9i8
 OQmOX89ADVyD2Lpearmdxhc3/pZEUgoDCsLdCskKk69B9TqSGTGIV8JDZKpfAbKzPnuwTQQixvT
 IBz/nudxGs+gUY0dgm5bE55cBYQ3TKYI1g0i6iNABiCbvinIgZHaYDwoWfYdfPCuvDi//TDbZLy
 c/TEZ0tLenwoqKQosucBdRNDd5gAdHCHxdXsmqTz3KF5f/pnzOTyl5Yv1B3fxDGkt8MgrWLaEQj
 gd9rT1ANZMMzS8zcsew==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20417d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4nfEs0z1Wzubab7DKycA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Kidv_Ac5GqoC75UsvRks1nwSVlf3nwK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144

Add UBWC configuration for the Shikra platform. Shikra has no UBWC
support and no highest_bank_bit setting, so use no_ubwc_data.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..01dca97e2671 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1

