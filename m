Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561821FE471
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744189; cv=none; b=dkJfGUSWEthzZZ1nwkfGAHBl0GhoYBWWGHDlN8v7WNRYqzYjKq33NRMan9Y/vDj1S0ScROXPYhW3HxZNNjHKnoRThZlHhl7EaPtdlsbnusDIgEe6TpClYlNn/u5/xFkTbmzoC1GF9UzqrbEz3SbCrC/THaI89DN516+fP1l3Wx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744189; c=relaxed/simple;
	bh=YbqnDdanp7sGFYgEhwEG6QT+2b0bCUD8zYUBV7wuRdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUHrf4n5IM0BRtuoRCkoRyiHTLKcKj0TTLaAUrzoEyFjSD7CeAjN492UoTdSFiWHctarT3n/83LEgY/f1ns9sLclYRoNbatubC4DTQa6Ea9w7P6ewxqzspKSLaNVLSZl6dv/wrDN1+lv8sfeD35fjx6ZynPRJ8885D2+pm90oNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ke0TDXzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwkVyjW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke0TDXzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwkVyjW7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1j11P1600322
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=19R3RHdLoSg
	9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=; b=ke0TDXzSTLGFnn+Tr96Bs4Xkc1Y
	lcItqUSXZKrAM+bdskhj/AyyTj5AiRRDEjqGsFaCFYdeJOpazG7enXKCiauLE9yF
	ojcwOZZNt3tfdqD6ATV2qNe1vjPu5H90y3U+zyfwhvUSylWifim8DW2nZQGUrTgy
	GKBAgOGXUDTzDPG5+zJkNP7+927ObrOtUWp11Ji281dSOf9FtrqBLxHpA3/eCa39
	DtFtTJWEfiJHObWLi2dC6tTvvs5VF0edXvaZCQCnVApiQl+p6G4gGhKHUcplj9qN
	YNth0mg2IzY6L9qQI/TN7LD22q3uKIyeBBdm9W0BPQi/C4jomaLuRIqbhMA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89bkm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:03:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8de02a4dso2138037c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744181; x=1777348981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19R3RHdLoSg9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=;
        b=VwkVyjW7NrMfzao2oinEOiOH8dLSxxPeE1k9BFwS4VjaeOrkXKHo6VesMDwJL4BnmO
         lSafo9beNU8ZaVn9KDNAjiSpqfcvKKfuUitGqh9s0LbzYG5m2O5qZVc+mCX+GbBXhJzi
         Il6DDUChmS7iCJNxidyZCDMn9i2o9dlMcd0ra0/Z4rVdGQrvRoScMMCr9Zb3NKRSlhwh
         Wall7lV3ANIYO80Si9rb8BBH/NwODp2E2k/meB+xjbqa5gPm0P9Bw0WJe61fOga4dKr8
         IPGkZ6sNlOmAZ4e5PH7/yfGwkrJguGkcNZPPoJf3wpP7iSWbpESmp/sWwmD7oKfmtm3Z
         80zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744181; x=1777348981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19R3RHdLoSg9KO1lKx1Qv+Hh0Hmoup18RgdJgyc18nA=;
        b=gDsXuiYS5IGU0JApklSIqF9kY1SaQrmjuVjBgwbI49aYFxmmRVxYdfN8CGi6BbHJ1D
         JkOFNrLfAVEPg32IE5nazdInpF6zZ+aE07uPQ5BwHx28bGnlHprNmGXJKX0F76EWTDyK
         1/ZhZMcZtrMQhJ9cREQuoubtjERbBdKqZXytKef1FoKzjklz2CfZ74yCi1HhRaTG5lxK
         NxalcdSUJ9/7ugc3HmtYeOgyWEFov7O+Hz91SGXIlvnqR4YeasUlUVTsUHPYeNdoB8pA
         o9GV6r8zRmn+fn8a/WEIItp6Phlrb71AtSJT4AaOCcEEEdM3UKs+QYTi0/CLAPAoVtFc
         WUIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rvFi60CZ5Loarrbwnbeltr9RlOEwkk//XJw0kbIVwQcW96Qpb47ebT4Wn+YJ223BknaVFJN3HDmAb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLB9r6Eshg+4Vbg5OcgigEsA8ru3Gu0XtBDxuxeTGwVrvW8V8J
	lHUx1bDhhbGbEvx9Js4SMt+odgTOlCbc/RnIqpgXy0bfmF0eYI5vZ5w42/jFJO27o7UZ1zuKqg/
	dpcl9/lFXVU/DoRBfTmcIfYBIh60MgyWsxCbStleQThW6o8Y677OkKcpH96TDUWmR
X-Gm-Gg: AeBDieuKNkbry7rsyKoizxLjJnba237QKjcweN9MA879kRDHPt9okdyrWhlPx0TImp9
	xemrr3nw+YjkEWyQ3Yo4OfBOWj37brtLZUPQicZKp00pFeKEVQil5vZjM53zsKGpBwXD06WL+lQ
	WsebpSvvcpDtxC8/n2KGS7aOe8TqZjHt9mwJKgWbaIxXWozUHyJAhcOIG6lUu6V9ULW9cmm/I2t
	oxZ1cDz80766mj7tC6jMhEfbMvScyPQzI2aAY0BIo6zgrlPK5H2PWoEw4ftqFWhzI6lfU681hVP
	VXxqyYfuU4vy3fLZAGHa+VeUofWg6MNQHs4innjBgMfr1f2KlnAfPf1SyI497V8kMtf/qP42frT
	QmPTaGKRxZM0JbhSIeHthqJruKTn2HunyEsWCzviC5NJZ3uDv6byhAgGXkaR/1pM4Hc3QTcOIAu
	DKL8R30THKNLnLzRHi
X-Received: by 2002:a05:693c:2b04:b0:2e1:f72:3f2a with SMTP id 5a478bee46e88-2e4647d03admr8639872eec.4.1776744181227;
        Mon, 20 Apr 2026 21:03:01 -0700 (PDT)
X-Received: by 2002:a05:693c:2b04:b0:2e1:f72:3f2a with SMTP id 5a478bee46e88-2e4647d03admr8639863eec.4.1776744180691;
        Mon, 20 Apr 2026 21:03:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:03:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:31 +0800
Message-ID: <20260421040231.1256998-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfXx9otqAnlRxnS
 1/FrSMb69T2E/Eg6TFJK923PH+685q03m8S66EkARrsPDKd3r4WOBB4qhhsLwABH+a12yQ/tm2N
 zaqdGE1zgHRvTWWJ/KX8iAh4OD90ATNJYalmxcJa8W1URtbjsjZpvX31A1xQMox5fQ3TAiNN/Mf
 QNP+gSzQr0PPnQzH685eBaHtgZxySyz34c7FGZoaFL01pfui02W8viIx6QII5rwBpx/9nXlw9au
 Rqex3199VQ6xfj8ctQ2WYyTwhK2/RwIZVCEZ6WQXtar4ma+SWNCOEF8wjAjbNH/Lp3wta1AIDi7
 fRiS1+mCEjD40jByGYNvJgG+c6+q3Htqo/YX43y5sWh847Pu3dV8b3rhlnf5vD7qPwB1D2O72Pu
 T/cDtQdCzLHc8gdNZLt2titsCl3T+PEUae2RNO0ZH8Q/+kgqKU0cKjKO/obHkjU+o+GPDb2z1xu
 gsP9fXoJf1/l0p5rI4w==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6f6f6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qdfhL6B64FGM_Lu2SakA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 7S848KtnKd1rNPweWm90BcLY8TUd2Gkr
X-Proofpoint-GUID: 7S848KtnKd1rNPweWm90BcLY8TUd2Gkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where
the platform resources such as clocks, regulators, interconnects, etc.
are managed by firmware through SCMI.

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3a35f0f6898a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -526,6 +526,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(IPQ5200) },
-- 
2.43.0

