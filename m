Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70879375AC4
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264590; cv=none; b=W61PX5YXYd9/PhD+kE+W6rfl3scF0J1+2bTujzgL1/SLhzqEpsZFWa/cm+y7qgLO8w2pMkIbBdS8l8jD5BBENdVbfmU4l3pi9z7SJJ+xD31Nywbux9qB74ckWE4+q4QhP/e52TKhCQIGN8mGPHp8lPJUbLxvl0Pc+sxgawZRQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264590; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvuHCTlz9LTsdOmgdu08S3ZrAd634DGthry4Siuad53MzY+Ixh6Wi96n3Ip5MeaG429NVDObA0R+Rug6Nxw31c8A4RluSkLOUcoXQMDThzE2O/F+fuxpTGDLvrQyTAEcPotPBqnwBaO0mP2bJAy0q5ysAzf/IzAa2xSW7Ovj8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IggwAbbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp652PEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IggwAbbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp652PEX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963ASE13450561
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 05:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=IggwAbbWmNdtGWOt
	NZC1t16nsCCoDYvnR8PWijwHWTARmJZ+I0kKybQ+YJCfNg1nSkJxG82NM6NlUsKz
	/5XlUuoojCMkS38u0RPhGQOLVPGDdN9dfVtnf7J1eqOG2HzEl9NA1jesG1giI7zo
	4ZocwQoE+kURRbfyE7NFOaAKEEXPUKKp6eRVTCaZoskU/DFehwxGMwTEIJef2gk3
	KizFKkyAj+qnlcu7LqARfzlnUydr7CuGjlS7IePVT24pA+8ngb61nlgPXFwBke6T
	SDxovIc3xEaHOiplc7CKH79NheqISOdu22BNHhFgkdRLSgOGWFSMLdq1X4KE8EuH
	V8cRfQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7durfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 05:29:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5504527eec.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264587; x=1791869387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=fp652PEXkDto/ckwNul4l2dS0TT3arp8pVyRsxnfS2qSmEHonPtxzI7mPnJOKwAS7G
         FiXmeujWbj4FIvGJ3hurllQfErxCkEXwmCZL0JYU1I9uk7t1myr7eSuVDy8lAfDGmFRD
         OUaGwLGJzbPE2g8JwhgGmMJ3UTfKpiWUahObWnvzuUj5OCup8hmSJ2TCqDqHkZXasRh2
         TDWLCnXyEhSmPv51wPmkXMcOpeC6xlD/gZ9ry1/lwuNcGqf6jPlk+Ud9aEtQJ8gSvHYA
         XeUVz/+IeAJaPdSLcuCYIcBF3TN4nCXUj9Z8l5pPvfc3ImgR/5t27ewkrjiWiFi2VQSK
         JRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264587; x=1791869387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=yhZtA5PHXOpCPnj3P4hXJx85+J6XEUWd/YNsjvm2Z5OF4eIU5sBoyXydgL0HppUs/E
         kXGc8W7K9/Aadv0/5j8+5gLr2+e9LeBGG50LofBj8uYo4P4nsQKtYtZiR2+l1M0W3No7
         cGppJYE/Do7D53s6k3/T+e+BoOMQWTbNbAW0Tf6OdHsGkuae+FIrbRhIEya9ykzxsDXV
         ZdS88Jh09ttbsUjmzimU+POJ0TZCi6d+vnCk4mdlueDv9rDwwEl4kYnyaOKMNLL3Sloh
         l5ui6wCXDs4c/VYPiMSR2pNhqFKZrzQhZ2pYS33xGzOu0NdsRE688KedbIExNF12F982
         6dUg==
X-Forwarded-Encrypted: i=1; AKwUvBw6T1MAoBm/OWglUf/nHAsNkjIjQ3fhyMhH71uMbd5x6mIoNat0thtJJbyDbTpgG6VE0Nk4xjwi0458@vger.kernel.org
X-Gm-Message-State: AFuF++kBvx2qtEkjRlqvPw+MWNXiCSvPK+d2knQH8oi8EOqHTL4ttCib
	WsC61oxrBMKn7mw5oxWc3jbppADv4P8RFNNPY/tEoEZQHAPJzDAtWsPtNU3dbpz35hluRsR7Yx8
	HNM0yO8lqptzl5h16CNiHGwOt/gqH7D508QFinlhBahMv/RQqLEKLSuNoPOhob2Rs
X-Gm-Gg: AYBFou3vVnwy1IcymjseDaWwHOm7I//GHYvIEdbWuJwSIRp+f0rKyrATKslQPfh5nCK
	EHioYEYTeoIDIU5PPi1ndSfBV4DbFb965q0lF1WacSh/OSccvGW4DYgzN93WddExKHi4zJhK/WT
	Bra3xmqhHhkItr8R4uy0mhNr+uJNyUbfqBbeKTcaXAiL436tYsSOVN0t+I0u7X0LEgFjPEMUo8n
	f9PJtNY9n86jrzaa+V7RsgrN0o9Bvi+hUYmtVBzjaL3qPX1Izr1Pqtjlc2+0qa6wVTtqGAyeFj5
	AFAjzA05A0Lfad/xs9oi6Sw9q1EZO/dwby6kRyfzS9/w+wDreY1isaordRLw6jhA5qDynfDF5iY
	XCdSyEpYOJC0C6VL5RajsrF41HsPz0UGNYWUs2akubB9u/d98Y5wH05n/w7JAUygo1Nb1cFUQoB
	v0Yozi5MZD1m3ZPF/aQ5BuBE/X/W+g
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586317c88.27.1791264587423;
        Mon, 05 Oct 2026 22:29:47 -0700 (PDT)
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586297c88.27.1791264586924;
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:18 +0530
Subject: [PATCH v5 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-4-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX1bGdbhwiWwZY
 3BR0WV0XYb4odGKmprwbG7DUTepho4kfPiyQusdl3Lp1twz6pU5Lcthb60Rja0qhb4grwhOsBu+
 G8oYCvNNiLlMwkqTPZfiksF47BowzVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXxGLBnN4cY/dj
 gQYBPlYRBkfHxfWxTx1tTxOdDKTNn7jQ7KTYP4GyAmMXiP8yb3Ge08axh884qbtd2zCU8kkiNKZ
 /TiOeHN2MEXtzdnCyMUNndoxNik6OvWiPgHyL035gXD32Fp1Hs4jGB09EKxaDxh5dTRqE6RyMAI
 cpOJ+mgc6/5nYpuZ/Fyn0+rJhrxEZ4Y5R8XrC0h9qXMX7Vw1BgoSSfliEEqFl0woeluDPiLnz2v
 yr7nV7erMHc+0FEWKcJjL48pwsa3kyAKUAXkGX9P/8tq9lPBjSJ4yyIpdrvopPNHR+4NsuylZWC
 TUaBP4Ot3LCjIBxLHjk0Jw7LqMX/7SNhuwTExlrGKh3taVybTODxI1bn8k6AULHrFqlgGwvhJG+
 VpS5yH/fGYxeATebsH8uMjxxDy0IDuQDqsHHOwS7pdFejDOOUAKfWngbDwTK6J5EPDGkBq6Fd+/
 +/+8u01II8XillImoBA==
X-Proofpoint-GUID: r3bjIdoPTOMIqRYyQXxLq3DB-D31y7jR
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4874c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: r3bjIdoPTOMIqRYyQXxLq3DB-D31y7jR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

