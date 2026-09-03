Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C83D093E
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461703; cv=none; b=tjWEaa6z0RMbuM9s0yJJm68tb5naxASPsuFuBTIsQsW4I39lAfPZmxjowwIxQZNOXdKSKF00snWcZoue/KzbgiQW+HhNLpOv495PEzbwlGktWjv0+aWN0nfrVO7hL5srAX5lB3FC4Oxtb+TG4b3Ft6FtP51YaeZXEBgHjVNKBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461703; c=relaxed/simple;
	bh=NBTqBhye392K1VYn8d0VzVca9aW2/O/mLmzqGu6EcfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwwQ2YWqyXOyUeqsok+D7661fZDjGIyH7nhiZHwpSi6GWjs01YqBGpxLDnB9PITWMBoiqIRTQCjylaSNS0V9npCvL+ToDgsWNW4AabQIt9QQ3/fF5YgPedDaDdacAuiRoBzhs1YcF/8mJVdyphV5Tl0Ig6MscllQiOW9vV5cgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmhM9tdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QosA6VjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmhM9tdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QosA6VjN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3eIp1209692
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=; b=bmhM9tdj2jqm7G6T
	27Y3mutqMaRxG3zMDedlThsxvqK42jBaeaD9ofSNEXZylyW7zziij+p9sQE3W6qa
	4Wre5op4L91Ayjk5OmB4+dQ/E1+X1Yypho6rrKkkuh0zxl14mOEhvjl5NAqDt8UH
	atuN85rTsNEE9Y1uAHfKrT1zCnQaG0JvNdVvF0MwlCFtyZNhaKcTxe9RR9MXezC5
	bpMc1zzdJRW2cwbmjKQJlrd9DuxFNDJAEQzPxhkWb20a0ofy6G6oDn/IW2oYwqd5
	/yMN7fpuXc8NOvw9h2bXUFATvqW5CHGcEW+beOTI/9KcrhtL1HbUb31S9Kw4m1YZ
	5flx7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72e6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:54:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so195640a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461691; x=1789066491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=QosA6VjNaN36A6fJD+yq/rOLQDoCW11SfWKrd9YF7M/Xnag0H2emuzjcL9b8T3ZXm2
         r+8Ol458C98jfyxCklZXKHOm1ueb3ThPTPcMfhIrsQWG3pCIGCVq0PY3HXk46jnz2fk4
         zMsjNX2qSVXZ6IHdw2eepuusXBbu/AKEjF21ALJDunagAOeEAZuVJqMhPWpOSK5yKOsq
         rnpQ9VMsEVPXlzOXxWoGoGtU03FBexTfCQclL5Oub5j9nU1fZQrGYboMNsKFu6p2JSmo
         AqO1EvMvOQVtFul7/ct43SZ6EzpsEiiX03Mc5SFt4Elap8nF2U6zPeqrXyliofU6rEia
         f+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461691; x=1789066491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=jStaAl35tE8lVcAAjje0sRMgrcf3QGWB3325j5kuLox9s82V4b5EG95uBtgT4R9qWi
         X0i6tZayA2KYN2DMarQqgedOytkA5/TlXtNB7BkOwUnZo+90TuiHsEzYtrtAn+RfGX3/
         UyhwykbsLJXHcYh11CptiLMEAJKdEq6d5nZITgTdeJw7IeP2tGk1KdlfSPX8GIg6qkEp
         DjkGjpzLAQPGpDRsH1XxygBTiXc/QeS8mNDs1ZX2A1IwAnDrWOQUR+80uZ1NsKFJkrdv
         fEY7Z2Umvj8W+j2+DuMZYMmrPFF22fvGsdWugT2ParhBnV5q1vH+k2OKPpfGp9N2k5Sd
         tS1g==
X-Forwarded-Encrypted: i=1; AKwUvBxrFZRzWSdt7LbG2rrRxoUYYkKBsJrDZUOSlaYr+B9HozfT/IpM4JIA/lnwiNXaoh9NOirMo6hN92uh@vger.kernel.org
X-Gm-Message-State: AFuF++kZx+dDvqC5UqRLyuzOOhRbA3Ozg94L/ECrKMceCIGnH/ODOtAq
	NyuEyVjD5LVIQ0tjXAyMh864EmIKL3VGOwQOmgyitw4Xp6OQa4UOuBFSjZJOMIc5e4cwTZsaUiS
	dNgOuBUVwRZIjPxWsdrvCkAEWiDhBOQkOpE8t8WwAyrWpn+V6fOZfKDd0jWPshV+x
X-Gm-Gg: AYBFou25PISiiGAs/GD4kF3w/ZxVl6frd1EsZL9oCNuboFglqDz3fUUa8As4UvWGlon
	B9b/r9PPKoo2uVX5O1fEbHK5o+OSueP59plUkQeX3b1AKo9bEJobYzs9rnOJ+3rqJpTl4vZAlYo
	9CukPcx8b7yeMak16rIVasJeKGamPb90tUzHQiZ7hzbFeu6aLzLIRBKQbRYWOBWDpQsp+/1I0Ph
	ZBrHSN73bzKAiL7uJlR999G6iuHh3xyjXM0QMSN/qIXAhkhlAxfLFOXCSAZ301ev99s7URfemAy
	sL1yaWFViOf1uha+7WeU43IWZXIMBKOLRfCjhd9sLgPbRbcy3EingtvLq6vw2i91am0No/JUi8W
	/5C/O2ZxFe2zSnQKtNXJDXpvLEEaggg==
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773678a91.6.1788461691048;
        Thu, 03 Sep 2026 11:54:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773621a91.6.1788461690575;
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:49 +0530
Subject: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1138;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=NBTqBhye392K1VYn8d0VzVca9aW2/O/mLmzqGu6EcfQ=;
 b=XG6OG86F6AP75Xr/1HV4kKPEVE9c9n7Ucn6qBz1XILjvZck4+RuFYA28UG0ao+qFKjm8Qgtgo
 YOhobDDsRmVADfjFTp8bHa/dwplCnyCgS1YL5fI1Vv81CiN51J51n0j
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: EMSGj61_u-5g5DWGI1mulqbuLmm1-zh-
X-Proofpoint-ORIG-GUID: EMSGj61_u-5g5DWGI1mulqbuLmm1-zh-
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c27c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dsjofxfk3bnWsHuiCQUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXxQmsS/y/PHPv
 9OxiVBSA3HBTbZZxnz5HFKy6vVzXwFOa2I40n8GPsBB9ABnMgjD9UYq5oJBIOY/0d5umNpkDFUU
 hFR1P/opa7bQrRWocmu89WkIouLjzEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0GHJL2aYowS6
 w5kXciSWl8FkF7w2D6pX5YgvSX2zZ/1dFUtWWMQv+1f/+LCJQ7M5QJXbQAbN3Cv8tnIEbaeJZlk
 FRVll54+pERcgqR6g3bf98UWEbCQmuRlxBYTrIXGMSJR85ZSFQd77PK+53RRu9l3B6iCUDGxZJP
 mv8267CPpcNMTHOmiMQDkhNEODgq//lZ31+gACHzhQPbr7iSxY4hW1Xy/t8miyY0j2UwfGcVJg1
 iEKVVARsgqpm78M1rWOp5RDDhBzlBjrSsRJXxZljKCh9Z/aUhLtKhhV2f52plauR+7gm4mlCHIT
 fj5IniyFb0O1gdgQXVrp4OMPQ3VtSDXRdFJXORQ3Wt93hMpP9QC7auRzg7xk657HAlncZ6De1OX
 k9GtRfxuQQxOLuQxgGWHyOGwb56VbFp5JGqCkn+jY3bsHNvtb87HONTl0lcN3Ns51s1AlbNYYjM
 l1zgnOzdPpCT+0vxsGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2ca2f03de30174c9771fdc517c0e21e3b392ad76..4f9bef662c5796ce3cca64b19a595bcdbebbf336 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1

