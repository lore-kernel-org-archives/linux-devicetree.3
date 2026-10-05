Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EB35E95F
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182234; cv=none; b=JBlJtNex7BQSarFX3iVOJ/qOQb3fQ98z4uhJ/XZr27tNXr3NGCpBrksklk6kik1kMwwwDGcbx3AM6oELFwSLpj2qIbhQ9WM7Q1LWm7KRMZdDlzC9WgXmZl1Udv3TqBSURJ6oRFmt8M1FJeTFDJiHvP6yKyYFFGygsiZtDSoN4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182234; c=relaxed/simple;
	bh=3g+p/+TLsOgWJR/fZcC79lC3qyFtFEfuh1Chjww+45Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NADC42110ItYFYNbE6YBaW/coi/twrDm+ucdmEYS/Wv9PqrtSxT7se98ZJ+Nkf71N6JiMs85ecjcTd79NtEOxe9J6NnrInvds3gFwFR7twFxWthhFgPZedL3yF3MsApYoyvsP/DxuaoSFh2wJRO9vrRksSRyo+PhwdRwGDaWyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMIkyNKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXHbplpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMIkyNKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXHbplpD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103eu496788
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=; b=DMIkyNKo2Xp2unci
	+gf+e2aWEBV7C+TcF9ESV56tGvfxHbriFDDVPX7HoBZLPKSMDFv4iygFhyn0ZnXP
	BCio4aO7pNDbbxUUB20WtWzsSop4iOKq3GzUoVV0jXj4kxsR2MtlD5HrnHFw/PrF
	1NPZbXURF+bo50E+Dx8TVOAltHLstStSzF1MY0o6WmE0NuYqqNtBLTbWS6rVUuBf
	WJfGY6mGEVaytdnba61UgndZuMcoeGbhE27pbwfC8VwQsEaVKd3nUSdbdZsz3ZD3
	v0oDr+EAw46CQncxfltuCduFsxcOtVcPN6NnZZtqNq+EN2gnuYD/qLSWd7Ixr+Oa
	r4KFGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgys07k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:37:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510562ef98so1841058eec.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182232; x=1791787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=OXHbplpDd20emiR2dxrBm1Iu8mwT2FNlUE0aM98EjEdY5dTOlufTpGzLgyvlTVwvWN
         jIKFyeYODjyRg8rg+lLBl+1IKx+G4GY1jrkmoJnDuoa237ifAVI2vS2ElMl+ZfkRHegd
         JZ84kMsuGHN9d6+AVThDqkLzAzGc+JySJBI9SW962fUkq2sB5cPSXnisi0/09YllWGoP
         H4LPKxnfLTdx+4roemTydQdUM4P//HrLgqiaKzByaeFP9jt29s0h0Jp0DVY2r3dmDQwY
         6iXM4v0Z89FNUPw3CovbnmAWTLAfHUCJhZft78lHJj+DKRYoSSf7/GkstB+PsCEA2rtB
         jkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182232; x=1791787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=gkyZ2QqsZI2PyCyosJgB9ZdhPESoEZrttYJsxZapHuPB1YGpcUltPdowDWCq68wnEw
         7sxwft6gKzY+gnj0BxmCpT+aAVEfPULmEs/M0ciPzrPzm0/ViYTBsFEuu0s7ymH5mxC5
         tTMVmD0yI+QEMwjadq43dJ+iJvT+eu/dXMx8g1bkYe84nDJDQNds8Dhy1k6q/yqSiu0l
         oxLd+ZFFchB0TSwGK2juM5FogA2aUo0Q3RfbL8tyxlUkrCqkFv56sfABjHARu9dArRxc
         RnSsVX5zaUZxbTUjdNBkCc0manp7IEUcgIDLZ5O0jUtbWMbB4EmB2ZmXL85TbaUSD7N9
         bY3A==
X-Forwarded-Encrypted: i=1; AKwUvBzFRZhcubOeiwg8VoyFfnqHNbKCzyK8g0phsEdLa6KmAijqEBXu4ZFHapFejXU8taaVROk69yRqo2Io@vger.kernel.org
X-Gm-Message-State: AFuF++n6+Liaq1VuBfu0LQxU+VC0YT7rzqR0CbIeRJQrPnm54fkSs1JT
	dhutSZTjYglbwu+IRPbmQMGh2s/fLW1KF4ORYf+fiKTvTvDiRxdYP1//DA3qC8Qd747QqEzK8uu
	ucweFlJpg1MJzSSvMDOdCcVXxZqz7Wkj3qN5/iCdljZXgazcBRZsSCOJV+zzSHYzCiVok8CEQ
X-Gm-Gg: AYBFou0+/Da8P82jY8s6phqlhwHWI1kz0YyyqqmqNlUyBTPpAmUaN8+VNJB8XKtwWpm
	YFgiPMHLj3HkS6JhisGgWKO4Gd4M3MMDsHnZsab2bVIzEBy20keaXhBElv88SA3BqkoFyceNYnI
	rMDns89cqGJ09FH3rYjPK7N0VVqQ/3q3YGKNqr99mSCxZjrSB080wa/HElZhZSAbZUCIB1vMDy2
	Gb5mqfy9Bu8aZWzXQtKQaRyKyQOrKHw/fK17x/BGFUlREmX2Te4wz0nwchBtspLiPN4fD61YI7E
	oWt81E+JStP2MidHzG+JQXJM5JWkjlpK5IHrn03v3vxeG8O5MhJJoFhWhD0BW27QsTNGQr4iA7O
	QYND9/BDIgye8Mgm0rtz7QxZ8i6/pFRf97mMt7z8+qF2UU5RZDgs4h4Bbq6kJn/+gqXlPOoQO5j
	8FLyOJ31RqRq3L6sQVY5xQXBX80tvz
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761600eec.13.1791182231778;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761566eec.13.1791182231222;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:29 +0530
Subject: [PATCH v4 4/6] phy: qcom: snps-femto-v2: Fix
 qcom_snps_hsphy_write_mask argument mixup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rThIgNSymW_NeLhdEgDfDrLCZbKBW5le
X-Proofpoint-ORIG-GUID: rThIgNSymW_NeLhdEgDfDrLCZbKBW5le
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac34598 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX6gkyJIcVO+Wd
 wAZ3ahC9ALyVpf8O7PO1wIkrtPWynEQkE/vlQP0qcQjrC/2gBJB914owmRWvcaCFJ+moRX4rqQ1
 UOsfuSzKgqsWJPrGWIGlGZClXGaP+5+C21FvhxiKCylVdTFZV8RZuQz3D1a0RZHoHvCe8Uwj7Rs
 PFpZTLyREnHuXHQCCFUzFTjX5MxBK6hPEqDb/7awj93/OEfvB/XEjFD6FODGWAB/QqtmQoDiNai
 9l8D8VdLtaSDgeSYyP2Fotzqw6pQZAb8M8ZjmtmVcj9IaffNouIWtCH4cboxu7p9/90MBqRVAhi
 XMS7b6N5beKKmX3K+ozOT6F9VIQWuBUzZHA8O4H99fH57mEJaUuuStPMNEKad4ouPolQOv9dxKk
 V9sgKXhysvDs0e2GE2FENk6KD+dqTpFXkRU7PwGuLJ/va1DkYPeLTbia/tqXGFdODePFYhOskcZ
 kzaQ9d6POwy9CDOhWQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX4BBImL9m6GzD
 yToL/3Q5kKo9BSqv1sRNK7bvbOtnwNS/2N0c58ljVJivksMNWj12A4fmD9nBlDJHIJ53PIL9bsF
 VJXwMB4zLlFPa6xR3OFfggYWwWovBYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

Fix the register bit field mask & value argument mixup while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

