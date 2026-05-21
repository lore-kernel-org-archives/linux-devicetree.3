Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800923B2FF5
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352670; cv=none; b=PjOcLT+CUh2V5kvcZfLQeZ3WAjRkDZMbzDySA8NwDuqoXRGtpQKcJKmyGs7kzkYQ6pWUaPom7oa+5TMBBjeUfP07nzEL1PmkV7eSiNHTtDQLlqP98bmVWci0j8W0kJwHU0l1mGXMQ0rIv9U+fMY+cuV9zOfH9PmXo0BUR3sOD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352670; c=relaxed/simple;
	bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POfo+keWT67jFOGqKi5hRHn81YQiSQpNnGXE2C2mgxgzWOSua4aBTMKEcjRywO8YICPCxK/HlLpRZKijeFetw6aHdxUGK9APwL7DYlQIxwUEkyMHcAh3dVdRgkxSlgIly/aiPgvDYzfLm2zUoXXzL3bu2TtSwn4sTi5+X/bjS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaLgqQRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJBwIyfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaLgqQRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJBwIyfq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6mLbl1798539
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=; b=DaLgqQRJXv7nSfwY
	SocRU7aywBVODrbHtAfDYAcrqDXYdrxv4YfVOKrs9rMHPQBH4XhyoVJVj8+ftz+W
	l4heq1kv4t0PFEyXUsjQg5h1+NbAc3kQpTkfoR0eyax8su5UAckvnt10Ny/TNRxy
	la2aSjPWMezrt88xiGbTU0ba5+R4S/9lFdzfmKL5pDVL9I+gICRUoV3ToE+2YoYj
	AOLAEskzwK7IR3BZhRO8S6geG5/gXgtR35ZLGBFdufsm+1VDrT6EzeUwWRSFG4hK
	t+CU9A0tvODp85NkcBYdT3HGU8cZqxUvjFFKgDfUvu2ERSl2aaD/ycrVy5jDweDn
	/ebgSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4218-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso163321111cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352661; x=1779957461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=MJBwIyfquT9nC2ok4rKp8PQbqbBi8oIMZQEcx2q5ACsjEqVhmyEcHSZNpbcormGtH7
         m7hWHwjnv3QDj3dtEmNs3OEQFtaMmKcIQov/8w2rNUPBxQCayriiecVJF/JuOBlzyaK8
         pfR8TfQl2B6N2l2X4SGUiY4wN+xiaOCHXdjKrUj27pv1h9x25w7e5zxdHjTG9FIw6fOf
         S0Fmtul1Qi+K0xzgysIgOFap8iP8otxR/6vqfxm21Yp7KY0IKazcQRHWdazFACftZu9p
         g8DLNep6XZs54OOuB5UmOXnhlYklgchg1/4ombsUanMMXwv1U3SyafgQjpbZuAD+z11c
         MzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352661; x=1779957461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=N6so8sr8ZvyXWOfg4MVNWsFiZnL66Kt0oDUtOeDEhIAi1Ew38/pu11XReOjxd5D3su
         5ismG6QZpB51K/LQFwtyYMl8Qlw7XnmnlKmdFz86tqlRHXWTtoCjTZ5jSsODIBGCaUlB
         ZsoVRTiu5NzqVhHulbKtU2bVhIMid96fyH2EiggOgWvdvNwpfFJEntBFEamE+KPuIsK8
         nBFqdN5fV8FbAkWRJJeAe0YUHudkXMXOu8UFyKySWkAwyQVp5vKX8tuQNuEMutv605As
         dsE1HuzVnw6GURvTSsI+9YWbHHyxkCZOeueisQTJILAD0u0piHjWibF+Q1VLYkDxPKZ1
         LPmw==
X-Forwarded-Encrypted: i=1; AFNElJ+yW1u/QD7AZwwMH/NCVE2HgKtq3IsqbZrrwzoBYL8F3wcUmcBznrtV8ARTYic3b9NLjAsUajpxsG/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9grnkkCZXpImCYbn1Ar1/VRnHOVJwT/Gwe1G++WUQs0AEc4cT
	upJtDMMO+8Gph2DrwsviR2d0TI/XtKxYBX/lzwHFsxt4k5fUacWjpqdyUNgOHelfzjcip/goVTj
	fL2NDr5KeVGnf65uJw+en6BX6AhrPxKyp3V6g4VLQxYKuTcxqvoy4/DBYGwU9bJOu
X-Gm-Gg: Acq92OHUqi+zb5nMn4GTitXVM0JOozdymivMRhYHD88EWFdf/xcxrXdhWVQAFjdt4DK
	JFzHeyEs2iWmsYaaVrF4tTdgxD6lDfhkHsjWFa/GsGndv+1SGUGjQZOm8/XJFedOkB45ETUWEDn
	tMhszWwHq1o73nWOHz35EOzipwemvHbEetkQ4/4X4+YZ70iMnJ5XezXZHUdlu/UxD+JENJCqdEU
	QAw30wEacURTLPsLXfb582Lt/vZCxx+iaZB/cdgpHB+jn+8o1Zzczrdg/mHnHCU2r8Z1R1lqbC0
	S2Tn280/3AjIu1fZiCSSernOWBwlAsXCmHNQmq9cXEiELCS2uhrJCppMAUwVp1juBIrijxiRq85
	n7TER+vqKIgB9sPfzOSJyayrcqzkOJaEpKvtAvv2B5mR2d9sgOKU=
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24203871cf.22.1779352661254;
        Thu, 21 May 2026 01:37:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24202871cf.22.1779352660361;
        Thu, 21 May 2026 01:37:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:34 +0200
Subject: [PATCH 11/23] i2c: pxa-pci: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-11-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQo4KNVL307DNwR+/EfAcS03uVuTfyMcVo5R
 Ddt4Kdh/uWJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKAAKCRAFnS7L/zaE
 w5nKD/jttCuRwjJL5Z4Il89d2N0A4tqyEE0nA9nXREA+66qoEbjqQyieTedDwGD7MsX/6MSPxWV
 5CG3DD9FTc9h/ClROUNg/GH2d7w0kmkUywGwm9JyvBvlzAtQWqhuj075sIa5tYyeQQyFKPC34Xk
 RnsOL1rVgTEuFPw7IDDHaHI1wZ9tgnujchxPW/lP3+3NQe03UfCKxaQCxAG1ynKA8raoCqq+t2k
 tDuwqhRGAwWDfLmmH+F5oJMBzQm1CP16i+5iXRXocTOr5qSp23nOk1Z0Q3UloRClQzplCgq37L3
 K3IsTU3OSaWhfpVZjZDVu0OjtCMJSs1504goCjTXsrMMAehTj8kA5H2Q3oCJ1ybTPTXCrMu/8zx
 w+UhqGCrcQOhqlnF0W19dC/7abRToVks9nrDn5Nfe/sPPCCMCkx8LdnTYZg26piql+IHqJyhggI
 RkLs/3wvevoUmIlQEEGS88N+eHstmcvVdxGfGKcsK5B24XL9VaFYBNJEgnodc32ODuzo+Syqaku
 ZvCejLw5tSb2aNz/ngtwFBWmsvToRd+AshtUjUtEull4jHEwNa8fuhJk1yBf1zRRFEGMAvVSQ9D
 2oogJMuOeGt9NYmDMDCE4lV3vTJHw/hkkS0pvxsEB3/vQzc0MTZu850MXdoOqqqDJ26YedDWmog
 ilIGvILVlz2uM
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX03PyhbVVItqT
 B/Tt9XL89tMHsA/RUZPIs1r6xPBq1HUSYCNBA9mpWRGLatWkHLuj22IRD9NizV+dHDH77HYvBhk
 Iuztf0gxk5m+jithTl+AnCT2b8S0aVA/1frC+ske5T9F+CfcR31wCiv4/VvuHauKdstKTLSgkVt
 BypzWRvRmJif1AWgcpUZzFXguK0Ipysp3Xee/Ox4vTERe90rxFk/6X4N9C/y2b1g+xtD4VITzlT
 UwXDi7h/kWfA+ej9GT+fqZY+it6+xddvAHfhXYgRMaOmsmJ2iks7VU4lbzx7CpXdQiwtzA8CFGy
 E7sKBe3NBjeeSB0K1esatvxZCCkrI6oskp3SbO3tmoaZCGG5xVZcbeZq2BF/8JGrJRKhVMeGHjl
 g8UQrAFP3zR0NSr/LNiYiwz49Z/LruybZo7Gyw2znQmd9bxDVb5OFKvkQzM39R51dOvNv71BYXS
 cpVlvhlaz9m6G9tF66A==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec456 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dkyE5aMralaZliUUdOgZ9MJzxUthWIKm
X-Proofpoint-ORIG-GUID: dkyE5aMralaZliUUdOgZ9MJzxUthWIKm
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
 drivers/i2c/busses/i2c-pxa-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index dbd542300f80043c6bc65a69fa27ca7b3d5fe787..92a0647f08c69f841ca99caca757c1728b3f6fce 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
 		goto out;
 	}
 	pdev->dev.parent = &dev->dev;
-	pdev->dev.of_node = child;
+
+	platform_device_set_of_node(pdev, child);
 
 	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
 	if (ret)

-- 
2.47.3

