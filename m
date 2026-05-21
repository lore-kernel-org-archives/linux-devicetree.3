Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50A3A6EE7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352640; cv=none; b=g25dBe7vshoCrPU5Uwcx5MkiTAK5aIOKgNRjMDadNAa1CKIgWAXCQB+tDM252FzQW0SNMCjf+ndqLFfe0AwCmcsV1vmaL+MtJfIunvUSHIRcnizDhfHb3oskmhVLIn/LI0SA+tlZF33WYVCrzh5MwvSXLlSr2gsc0GQbV9sUpsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352640; c=relaxed/simple;
	bh=kTQKbm6eRN9ag0Un2nZCXzTW7BV3akk7azahbn/UzJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFg8h6JQHltXfw4tDFOKUZNsn8//E6q3QOa09om+5Xs9uYK9r934P8IT0GG+QSZQqepAMz3DjZUJXjhGHniDsZgNXgXZ2+aedMoNtOQbM1moeT+2IOqGEHCHVQ1jK9nbLtFFykvZc+S/xxUs9Hlb8/nl3EPrLm3n2kWsjD5GFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/eaP3Me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoYoy+Rc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/eaP3Me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoYoy+Rc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L61HPF2157503
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=; b=L/eaP3MeOWaUpNy6
	L81FH4QqV7eTsVlLcALgYeu3AEzESKyGvBjdCNPdLjd1PyF2SZVs3J5kZTQA76LG
	QAa47beiYQc9Iaw6z68RT6nfHwSlw1VWGCNvodnNl5e5mx98F/WQXUOooyAvfe41
	b3H9PAmUsIdKxVaoqWwTX+LLGAOwmbUEcGTU99iXRSUjA6qlWiUdnfQgGXUXA0/H
	Vwt3MFFN9p8ZoaDcqYEwJO0s1wJqUyu79HJCUM/WGg2ypLhk/ox6shunIfuY3U7q
	oQa3n9rDYxnEdqImbmWMSdsWdtVcy9xeO8cS+TWKP0DDwYt/liF/85jDISbCqOhP
	bmenKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma428uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5162ee45a77so153543181cf.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352636; x=1779957436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=;
        b=LoYoy+RcHnuCuRGf4FjPJcP2Hbe/MFLqBz8fzuUBq3hAFi6ZAA26WnWeNjYsqCcAJf
         y4z/D8tM1lbVn/W6TJuPZp1egz2ULdr2BiyEPQDgpzJUakPkV2+jpPUQEgfZhsXQd6Qx
         i1yuZ1zHzGgsXNaNdd9N7ggcWbft1Q5P7/MmcBM/UQCpUcBZhWTjeP4OGcKMt8SxaxR/
         BnKpDvtEJm4u1FbY+cKGy1Rr44KMjfiEpKyOHO9GpLIy1OGLazAYXSZ6ohxYLKooChYU
         e9MCXBsBu92vgGO5EtKwdBxQjQtp+/iGwgGmoeJVvYpmd8NifAvGPxQtzpkh09BPJbb1
         kDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352636; x=1779957436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=;
        b=YtBZJIM+Kfao4SVZZaC83UPa859dKh/JFa2lpO+G04hQ/6bw7R99ZIhIqrOxGyICLT
         EdmxxzyBs3H+W6n+70IQ6AYXSf2TtRpJsaZ08GyP0iNtCsY8/pEKX+72jeMY4+Hrbe38
         EauVIWXyO/x7sCZ/BPzBj0A5qs0wXo31q0nYcNTWEg/eE4K1cAmMO5lOZCnz9aWFShdC
         pfKXalaJR+dfY7uG2I0hCrX+z1qWsv3anQQd2eNUVPX2xxyzB55Y78kdlhCkWqWlgUWM
         8dnlS6CMahC5XE/x/gBkolZj39jJEJ0qi4pAFjWvBaPkFDmY7llRTT/kaINv+JuUjimg
         bYnA==
X-Forwarded-Encrypted: i=1; AFNElJ9BKOvA47TnJVbKbxCVA4uHCTNHmbHq963egVkwu91/MMUmJHL+VW8ItjUagnAb0b86j5cCzjCQilqG@vger.kernel.org
X-Gm-Message-State: AOJu0YxnFcJ7CZ2KRxqIuJHXXmxYmcOXJcUx1UYou3NvpXgU7uc2MHz1
	Hsm/f8sYs4KMlSbxpLSQM1u4rXDAP0+by2plJ3YM+jIvYYo5LeLnSS+EZf4AWW5o3n6UYVwzmZ6
	JgYaK6TQJjYoCAGdT2HWqtDx04PgUSxJIl3iI5rtLKDQFwuySeXzaoaUDcqbuqX22
X-Gm-Gg: Acq92OGoceQ4wK36bAkQ8QNfi8bFYJ2iAnXam2t1Y2XPp1f9BYGaVAcbMcRpA0WRDmH
	F3Qo8FokA+EfSU3s5lCkway5S9Zh5NVOEFMRr5mBCHOnL3935Kpxh1jwo8ryuLgdTzNiRJa3Ktq
	2UNWOWd2XSiUm1NFh70XzSNjSxCrjK8+xdVcpBaAi1iTKfwShb4KpcVb0quli1byRIraTQED3cp
	98r8X2K75fct/GwoxaELuDbpDFkea9f5ZRX9PdbbEqS73UULC0vmn0wC5YjP9rU5MCo4fpwXl1f
	Ms4lptOFimwfjENV9rFP48z3/WgGMUvcHJEPWWyIlnwLWZp3bL7r6u7REHvjImcAylPI9ScaeQJ
	FY6abV4uwKue6GE0kC2Egd4Kx1LBBnnP/Xt643Q03noG2B6oSmL4=
X-Received: by 2002:a05:622a:130c:b0:50f:c109:b78 with SMTP id d75a77b69052e-516c56114c7mr25055521cf.60.1779352636286;
        Thu, 21 May 2026 01:37:16 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:50f:c109:b78 with SMTP id d75a77b69052e-516c56114c7mr25055161cf.60.1779352635782;
        Thu, 21 May 2026 01:37:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:26 +0200
Subject: [PATCH 03/23] slimbus: qcom-ngd-ctrl: fix OF node refcount
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-3-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTQKbm6eRN9ag0Un2nZCXzTW7BV3akk7azahbn/UzJ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQgIMxfR+Vbirqz0SdcKiFdhrIvHLFQpLiZ1
 CS8+oZRD2CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIAAKCRAFnS7L/zaE
 w+/+D/0bfM9BBNs3PkNDjV3H97Mjk+BxEtuO3ngB9aYBqCWAj5QNlt01IhjpA6JnwDFP8fqCIyv
 vjkgxJM6sX4hv38HQ37w3/3e9w9nT1pEO8Z+vJO4ioacKerKf2Q0pDqYaIvMKRt/6v7PZ5F/8Qk
 F0oK3T58PSr3/oja0fGdyamleQyFBi3nxqx0i5pFUhtKOPDLB2JFMiF/Bc8z1Ao7b5/iH3mCRqw
 t4xceOWbqkCGcjrQwrwQuaQSwOFDgpuuNyxmj1LqEJaU/nDLivdr0K2cDU/9sLO5YhX1oEhG2nW
 XOO37zyMEA5NZH4QY0XDY91U+LIW+AczElBXOp5HW0hZ93FukF2Jykzc3pqr+4YnbKGcomK+0Yf
 q9nt12I/oL8N6u17VckldD5ZK4oqD6w1sf2nwZHj8W0dw1+L7YHzf9FRkrLonMvjMF8CzU8u+sy
 Jy0nFN5sFXOEVUkaOM7w5NUOXxfk7efn4VYU+BlGan6tS+++PJdEI8/oFCt6Y92Le98zlLOeLaN
 4okZNZe0VbOfsGZ7C8aYV/L5BdKwVRPIyxpJ3u3CgaMyWDH4U+OfUQIYpUzUcMflrUDECYMZMEr
 P5YYEoi2xgk/wmO4H3kPlxxCpOwXpXqfE9cRHoxk6WbFV0NB/WCqRqm8xGakOeDDaQ4wKiLTEBG
 Ah+8HIb4q9OvlZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec43d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: DOW5UZpWgPekDb3JLlP4uacksUkiEQs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX7S4N7tTI57ms
 9oSuDP4nQgc+R2ae4fQu48/O0uMCEGqFPEcOd+zCELt+7YpCViGiv+Gp8fzepBrpzqC3wciLXbu
 P3sz8R5hCuTo5z50QbApdGpMoMtMdUmkRH8NgbJFDDMEPyHPfam32Mq8PQ6o73ePILz8LUJpTNh
 YpI/C3IQuVFiPXf1TDDvEmCt/rhh1whz6tWNrzqpwp7DzHLIenweCh8JeIiZmdgrYwwUNNbknHg
 1RVD1ONJ1vPfKLeI0ImDBJnTXnanof9n9LYMWPh20VAgkz3noMmJLUOHJNf4QoNSW2DIdXD6dvZ
 to0GxvBvRE7zRoPbf44WxGHtr+2cVfusFJbLSDKEJh0X2Swhct+OyRs8ZZKRNdrUSsASo1vcf83
 2mwi/Kjg81t8xdf2mRZcyxoYWwhEo+7WY0G+O4R6s+3vBnqpxkYV/AyE13KOVHXvRAmAnFpOEAJ
 y0G+FFTEs2HyQnjJ07g==
X-Proofpoint-ORIG-GUID: DOW5UZpWgPekDb3JLlP4uacksUkiEQs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 1ed6be6e85d2cfc0a2b65a5ae24f666de922c89d..428266949fdd07ac13c5553bded891225c6e1a16 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = node;
+		ngd->pdev->dev.of_node = of_node_get(node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

