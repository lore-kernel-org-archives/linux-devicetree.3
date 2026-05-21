Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AD3B961E
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352676; cv=none; b=UygROXrjGs7ELGZ7DyAIguHzOpXB2JyO6ZXX3RyZvSwaprpB44ZW1MzDH+FYlCkYNp3exVEc/rseO3/nO4mfYZwAnHRcahZPA7iL+Fj3JIVE6uzikyFsJ2kYVag7zfEip5TtJCYEzk3AD6/SYv/wDprDj0wpxFsKvF8DeqCXYqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352676; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfQPCVVl+J45f2LGQbyx4pbbPztkr0gv3/HAGkCVL1JSyIqPBxqEeScdMOFEuf29QNLgd7yhDVVk+57lBB2VXKDyyspPeYltuNCVO9PFk/Io60JnjA3cxvEWjwsFapSm7y8m4Gvsd+zVfpN0s8I7dLUAR2lYnPge/CyR2E1jPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRPupizu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAHnnt/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRPupizu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAHnnt/8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6grxR1797792
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=oRPupizuUBUdYvM6
	C+TBRXWoDqeq04lMT5LC5gnHBmWkZFvkLch+YDhkUB+DEO4i2vSSrV1JDPGbqNxV
	t1PSwfXiomrcuy9ojdXSTxgyhkCwD2bRRvyT47pfH8NaYPZpchnAojnsmnyAb/+W
	A9AVuQTJ05rRYqB0I9TvxUhiIofA/ww3vBzm4nbKp/IcA2Do4b2fabK4nhXKfVMs
	d8YzfWA7c0utoGv21YBxZDEeqwtPVng42EXkDBjGOAQUrZBVJuMbbE24vFeuSdua
	kgqySIUA52PR235UhK2Ioc/mPp+u1RK/AYUpwZ3Do0aHFh3nUBh34KaaDeHFCVr4
	9JaSgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu420m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so163889071cf.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352658; x=1779957458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=NAHnnt/82X2tENfrO9RS9rPgrDeHB4EmmlATrWY0fkgRAUDH/ZricgpQNyaExld1fX
         6qDt8Tzk9IRZTN8pBNZd5iFWu4xehHYzKRV5fPRvJKzp7wKdap3XScz7YMhCbmcxyfYt
         KJB34qGFLEg3SqzA3ywbH+Ybz8QPL8FqP7CJVE7jgHEmPv5t04VfgEXLEHtcsLjM72aw
         GRQE9LhgVSHlU/sPSLMgBg/+FQulK76gnHHPY08RWTQqXJX/ARidUnYuMI+J4kw23zFs
         K6R8Mkn7Dpo6iTz+MY3Q/l7+BtunIkUrhXVExnEYJkXnZf9MW9/mPVlqy60BgBVGu0mn
         UctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352658; x=1779957458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=VYkHrrAhukZHaGA6lUqleHnNgP37j8bWLJVERQ1dSyQvRTy9yuFcNi3ITBpFsX40D1
         1zFnmig6r+iLkP/5h9Oe9c/1y6ZKC6kmtOuXFFelD97R86+M+0e78rfwMfSnTbIWaxN1
         FXaK/6N2Dh6nr68mi1xNcsAgvX7nI63AujpKfIbGcI9zI1km2XFjEP45NkT/R7Dq7BLF
         1Mv6GT6PEXIFi2f7WySoX24qXj2UtHpoNhIxhRKHHIGjeUDGATKoZhLFcKZMTDt76RLy
         nBSP+kcEHe1aU3ICwZ4gemKIsKhXvvsR9Hg/r83iXmeiaChz0KyLWEGbyiBDnMSx4BRm
         7vZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cEtWMUEr7u9JpKlIG/VFLAzFQRa27gtCggxs/3L2dZMjzslFwdFj06Ygngom98Ikr3yOxYF6Iih9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4oLFVy4XlRQCPfstNIknlXe/2r4RrxhF93JRzpo9Xb9TcdNct
	GwLOPWrOKpkH4It+wjpsOCKB9TxEZqRs+s/hV1OaMtREygYgBPcAqgWdodghOw0wUyR9+dfohL8
	lHAyD3SOQzxorQ+qm4H0dWGBvxKx8sAMXG282ga7qeNMBx6opOiiZz6dAEEBEN38i
X-Gm-Gg: Acq92OGtX+gaaw14A1OYybW+tf3DMGOJ84i+tm0DRbR0vYQ/twibXale29KKBoW3P81
	iVUuyEqNwFJDjGWh6fEErf0dB0v3Y1B5nZntGIE+XvxNCRWfvrP42pzpQUMik2+CVPAAhYP74ZB
	gwNfu7U09OmN4+dZCaUpAo0Lmm8oyqFH2z7Vac1JWpQAl3aCCNZeh6wDWupq77k9PQqJmkWswPm
	Wlt/RITJObVhqzHXvbdyRKPhVdXyhVns/rZPCW8orPcsdF5hsey/8xSd5iaSU4qcmTJb0rWO8FI
	DVn8xycEzuOy0VPuEEUuPFYGctFywJU6QwK2z73hJlz+uiRJB2UOfcvzSnCBAjtGxXAPEuv4AdO
	NMUeEWPsHa/aZjO+LALM4PSCJ52rdBZOgKS2AKtkSP06dW7b/aBI=
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3051911cf.11.1779352657784;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3051531cf.11.1779352657364;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:33 +0200
Subject: [PATCH 10/23] powerpc/powermac: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-10-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQnEHwHhZxOm6og5sHfREaEn3pVgemHlMmE2
 Ln462RL3PWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EJwAKCRAFnS7L/zaE
 w4YED/4iHLiHraTFNT8eTjPSn8I3ryTe/Zd4SzuN5PRYsUIg9SHspeWL8niwLubp8yoGgz1/xIH
 mgqX+8k3YyBoruzZHfbfsU97pVxIqztUPt/J3U/ND/wGvVjm02llmMqEulqZ1EgJ6G+LANtbEYj
 rMysNF197bf7mmSPH2FODOw4W9Gsl4Yq3+ICTVsgy7RDyTu4l1hebLzYJhxDn4dgUR2z1NK9W4l
 qzPmq4YDWFZhPumNaH3HaXzTt9NFXDJPIvCe5d7YHkngQELPf6MIO4nn+c5XXG+DqsX+8iTJLP+
 dtYp3uSsjNalAli1B+mULXlt6uzCo8M59zrPN01SPKz8oFPkGUdu0+gTOlYw0tlfJKNfwExn7Ku
 XjHd1mfDAehACci7mB3Pi644ZwR6730q24pIE/1mY05HKUHjU1nOghP/dDxGjeFKkmE842FNzv2
 CZTZqE3yiWV3bEh7BKyGcskYnVOGJv0JhDMdj1CiXCtSPerZVQuw/tvG90ahwqlUQ6U3u8WR9zM
 0uJaaumx3vqqkKd8NOyBRhGEoPlNbxoAJyiegjzu17lKqTb+jCLA5EO98/dJq3EfI8lgxWpL9Bv
 MeOYehAQ7eitsh9mBaZwqpKU97dJTWkzP4HCc4KLZm1PFyGSdHodKBldbDujP9SsX5EnRFjTN4l
 fU+hp0jLFamhxfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/jJ+rlzI9tvs
 6cX7yLqc4SoQYFYQJ/IEQCpvrfV0lCX7AQhKd9BESjFSMn/UoBtP6Wi5Mpun6t1g9tS6F0eXRC8
 p0jgTf4dQ+gwgjFqo0SgG4iHrhxHme/nvk83XHTdg2E4hteOwDwSs+XxvEw1BEwBAAY69NUQL2g
 70MyXxHBQ7sLNgyqBYBM0zruFlmn1E6uLBehNFzECViibzq9n74HjWYQWyyhzx8553DYJIDVpJt
 nbnFaaLUuAac1Y/tP5bwdm4NS1aDSJvqMuK+5zlzjQhm95p0uiZ8I4i1qe7VaZOUSFW36yLcl/F
 XK3nFb2NBRlcY4mzDY4r6keo58iddz3EWOqAOXSUyTYVLZ95/Prt1G8kwk6EOsCLEhLhuOCh8mn
 9/P2AWKYeOwSYxNEDhKivDm+3TfJc1xRhaMXo7ZlkQChXNkXwok1YjViFjllOaCu6daElcqmwre
 NPYVKZ2qjPUbz0yrQ/A==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec452 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Z1u0La8sgwO16-P3GcKo8K0HrkYH_Vxd
X-Proofpoint-ORIG-GUID: Z1u0La8sgwO16-P3GcKo8K0HrkYH_Vxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

