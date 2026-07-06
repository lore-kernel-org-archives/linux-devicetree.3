Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228342F71D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341940; cv=none; b=c6kbNLVRSsF3wQsC/YKwkZl+ke54DQ5eFgiRHp74HiqbMvrD0MyIQUir9/LlrkA05DIklhAPO8bucWLYusM5V1zEonciS6wjNZQT/FhnS2nC1HXe1ng247kTE/zMGkb63ss8VstY4b4To0Cg98eNIIXGiVGbOoNt8XEPTGhe02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341940; c=relaxed/simple;
	bh=hK6KuPL0Fkp2tcUxylzP/EXq5M4YtzoXDw8O6icggM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3xN93JmbP55YK5/Qc7MlDx/oa7MBE8Ed6c7UxFZOW3coLN1G5rWK7XCud24HwzpWMbifs0bpnbOC8UIpTeh5zZe6EBYLePc/nf0c5f9skRcgal/yLChH/ZPSenVGoP3TDqmDi5B1un6v09OSe//H/CxBzeYjLAvmP/05X8c7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwyNy+Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RivsvKQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwyNy+Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RivsvKQq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPab317026
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=; b=iwyNy+IhGsX+O0T3
	2kGvU6ImOgg8EjDd1o5sbToLqJ+h+J42bWw11oOKHn2iza+sGFzhlFcYywkcJUBy
	HeSBI+6jTPzl0z0WmeufrDDA3k5b/geFNZabQnp2CL+Ab9ynYk2AcTRksJQ/+rYe
	E8Hctc/S4ThFCUuD1dnULxTglMrmx1+pljFRLfA8vCQppBG+3/6+TAL73/TG4DsL
	cBQEsCgQEGltOsP0Mr8x83YCo0df0mU0GDYCtse3AL0b0s8CO2JFE81P1yUgB4qM
	HoK/QkxTOUS1TNlrlhR8hFCSBgrY6afF2PMam+drQNByb/XsozJ0CPCVjg7gkHjq
	5vYUhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h93c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:45:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92d1cae5740so342811385a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341924; x=1783946724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=;
        b=RivsvKQq0L6L3sRTgVl6jWUme2WAduC51rOSMIPyZR6qI2u+9fsukxY3ycnW2NNaWW
         5LIxMkQKMGJFqLep6tPQNn7Qy1hjHgj9MIpsYlRMBTC2oOphcU/Xtj2Km3Zpk65ubsSg
         1fPQvo7+bSz/OCQYYtK0BkQxD2xYAkLmSWGdZXbNEnEWQFscXbS2UL6KzAZvIfczzKgA
         43DSUgKsrjlFMr/bbw0cTmPC3szzlO8X80ueN2+GexMcB0SQVGa8vBA/0iwLbRvIlnjE
         m96Y+j/cjXU3893uKyH5Em4WNAbXYGDt+TAJhG52xVIfQkjuuEH3YERswyPYbNx5xKMX
         KV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341924; x=1783946724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=;
        b=B1YHnARkQy6D9tb0PiYBygrSdF/gNiyEF7PfpTjnw99J0+H48S0JEhYI+UM2dkVPRp
         RNsZ5I0RnkErjJUUrc69yMv5FZJM2IB6stURHlhypJYKKgHdRpBxPqtTpClTSPyx4hRU
         cabZSGPkRu52TNy43fQrtaL5vAN3vuTnwEqSBHjiJlB8xEcuA9GQnjQc2Q0bRP05GgVf
         i1wOyx4LLytBwQR9YsHMoE7NwlKMvtWwnSuZttr+GSFqH/N6fefVPLCN07gUhn9kNo2U
         501KZUl7fy+SQzGTqao1qnBKFz9WqW11tUoahIz+uzVbjwQ5QazUg+aS9XHvxjnJL1MX
         yMHg==
X-Forwarded-Encrypted: i=1; AHgh+RrtqOnDgnkEwAQqtcMbPNJtuLP2o3iTLYBerNrowbSKbdB2ikdXetGoKq66EpoviF3tnZMpOdY6K+nB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0atyaBOf23uMv36am8CpgvTJ3RZEIETb+BJFKWnzsoUJ5oEhF
	EmpAWLM2Ocm/5Aeu3rHfsAbsmEGoE/Fa2iUBe+qXv+QZILpLEPh9E6A7w4myMMwwkNUNOrxc3xE
	VVOig6tY/h1skpDHe5HaDUYSGWTQaqrH0KDpxag5rKvyxhQOUqwKvZMxHBAU/lPr0
X-Gm-Gg: AfdE7clUWT+hgJDgWXV+AqtC708wrtpeajSdZDI+SWw1xdT360bP3EqiRy9IzmP74rk
	QDxH2+HSpVj9NGjgkXWeaJs8CC6VVodpy9UMmDe7LjTepdfPxJAEwZuGjThuLMiVGehQ++1vzjw
	YBltEnwQmDVpRy3uaey02GLM/c5Ct/PWUVsE4da0WsAN+03QlUzpgRdnOY0/SNVJwXk/6uhIfbq
	1rxccIk2BAGCN13iGjvPcMxscgNwTFaKKrYkRoaSEY++V3iY3rEGRWYFaT5ZDzhyE3VomFosteU
	y+kDeD9SFzMIwnKJIMLWxp4ie3oE5mjgNIs2F/BfJ5lMBtVpcVQsvAZgd9jfE+xiSUC5QKdWOBG
	nouoXWGgacHeNBkP2Ic+we9y++EGGR6lIsYfkM8/l
X-Received: by 2002:a05:620a:45a5:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92ebb715eedmr45289485a.63.1783341922252;
        Mon, 06 Jul 2026 05:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:45a5:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92ebb715eedmr45258885a.63.1783341920254;
        Mon, 06 Jul 2026 05:45:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:22 +0200
Subject: [PATCH v3 10/20] net: bcmgenet: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-10-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK6KuPL0Fkp2tcUxylzP/EXq5M4YtzoXDw8O6icggM0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M3t0pRyIvWtZ3y9/kmYZJtWQnTZ1JwDAy//
 CsWsDHHr0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNwAKCRAFnS7L/zaE
 w63wEACOGysngK2nm0QicOyzdn1brppnkLrfHtIsrAcQ6K/s6NderUhLDryX4rcF0Rlw6HmXmNg
 epZ48Mx4J3UnU+PRjfDrDnU7GawDhxMjlqB61QqqSdtHlPaKbywufH/xrDNwSFspkipSNtateGL
 pbsRAUIsu1IhDvDMuRPtomMEHwKt3wvaMhy0QEkDyZF4RLJS1NjqlqECOHe0BRxBAP+OmuzQTpa
 oMxis5dLIqamCrsgjaweckAFttguLVhpVoRa35V3tgqh6G8gMSA3vYFajE3vVwlk9P5ts3bhHFz
 tSISSzP80joTF3QF3/3hyxGvP1lF2NUBgNAJ5TISmI2kZoyGmzcZ2XDRgjMtgfxjq6xpnwDjRIG
 9nKCfeqppxo660tr7LATQCxUco2jllbHz+6ma7aeybYxfpCvOfBoanPl0fme6v2jXuG0kA7S0cg
 Qig0wTZq3jZ+0WRSOK769hUG8E8M+56X+vajU1q/woTmsvsIhotoZ/IPu3Q7pTh9TZMfRHz5tYg
 JfQANXNXaMH/V5XUAU4mzYNu7cq102DojDBd6q+pQQOUvFmIsFFHwxAPS2aUMGWPa1Cb/FdACap
 rNKF8e6iN/oRaSKbqvIh7KwkYlPtsbqdUYAP4dxlBT7SznOUKolCzhD9ioxnchcLdrjasucBuUZ
 iHW2JM94Uq8jnbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX1HYJglhi5NT+
 9XR14YCBnFwWXS8cBDHI/IiO/pvkXK24QbFWn/WlrV/8YGHISeS9a1T2tOxvh/I0w2o7zFmrJ5H
 o0S1u0Aa42W0jw1Wj+JZtancwGh2bC0CfoM8ZOC1AeKME4nCFkkYnIbu20gloR1K+sgHeZ/mXql
 vGXiqfdNcvG6ONFG3xWud1SMv9/xg3ci1nng7cE2MmEjGP5+uIamxTIJG34G2mqp6MCazHqwuw/
 C3nAGlkfw9kR/KBMBVEEAUIFGu5IFgPc7CDWbuuh8ihL9m9tZbTqO9Q0mRJe7T4TFPtXZJSDZtO
 fEgoXLqwT1Ms9zr45ySV53sooFPYoZ0pO+smN5ORVKG+SFNJJiqNTxo/pppQEVymSropl6Wr4rZ
 3HBICgjx3bV5Bj+6iM9QEHpR3+imdNtjcIOkIAo7qnckk7QLBuL8IYux1GMt6Ufue3736KEbKds
 Y8LEJWm+8aetc3MUh3g==
X-Proofpoint-ORIG-GUID: 7TyHXAohZZlxH6PLWRRbljw9TRm3mc6N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/Lrlak1gWlTK
 PEwCyEdO55P1sdHF3EpWe9zAt3VONNu/9LO2x7NT1f7bSLV/VajZIQW+blhf2eL2C3mOdQvtQfe
 6QlohHoLnFQwLxbWarY4XB0e6MrHiow=
X-Proofpoint-GUID: 7TyHXAohZZlxH6PLWRRbljw9TRm3mc6N
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba364 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=S253l8tU-mt40G6jxkYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index a4e0d5a682687533a1b034ccf56cdb363d6b7786..0f0dbabfaabbce3469de79af91d7731b8476709f 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -490,8 +490,9 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	/* Retain this platform_device pointer for later cleanup */
 	priv->mii_pdev = ppdev;
 	ppdev->dev.parent = &pdev->dev;
+
 	if (dn)
-		ppdev->dev.of_node = bcmgenet_mii_of_find_mdio(priv);
+		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
 	else
 		ppd.phy_mask = ~0;
 

-- 
2.47.3

