Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4143C2BBD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352682; cv=none; b=dn8P7vCd9nd4uv5O+RAMH8nvr2d+y88YcGMdTG9ORDkEIG3s03SQTITmNHGBd6/Nl4M1Wq4VnTEOM2rVv3TCeU2dbA2O1r8q5sR85LLY761/W6nYdAGvGKYumXfCi4nvo2sZFRgkBLf7WVIFSQlxdXQya5HOdfaA692aJ0eFtUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352682; c=relaxed/simple;
	bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nz88GPrMPHAoZjE/RjgeUZ+wHcMUEt1R5Qw/arqACL4nOe01J2QcoUP0Hdwk6hYJDrCF3241QGLnuhsmsV0TjQM5JRCyAutrbg+S6nCRVwwuF2/vr7CpBb+VmEyWJg1EGZY5Qo5AJHOLPiAZnEalaFKEM1ps51nUUOaqcc1IAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8AqoLjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bA5szK/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8AqoLjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bA5szK/r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2Swxm3815917
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=; b=i8AqoLjgiIkq7GcJ
	lsjiR0I4WtIojYGqtVtwF52fR6iHWOrGT+oCUty/GufZbKg1DhFJDfWVn0vJe+k2
	ofk30wp/PmTLE2YxNMSy+M499peRN3Ix32hLCyKX2PqL54mJ4UQ4B7BapeUCkf3u
	oQWGLbTVnQaQhCzmq+IXJuEIC+nlDoW9US9uoJvmozj3/boYnXNd83U+R7S/w8eu
	SKRCBNmW1k206+0pxOW21bjP2ZUCfreImjrKLvY1IEZhxLn+IDe+EL44FFAr/BDX
	Q/yvzzbeIQnIWmRf5SYA6WD8oIjvbPeAEmAhwYIQBtz5Y+zD0dr4ThCpzw+Msqui
	9un7Tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:37:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cde13e8cso223811cf.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352669; x=1779957469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=bA5szK/reHBuCc73zRvM/MQZt7s/j0FcTmS6DsTiTAx/ENwvfGCquBiOGV0uiqBWjs
         yrvMIJf2GIh0YYCoYmW56KxMz+mZtG+mgR47FFcM650lFJ6BBk7PZ96k8TLVTTVSNukn
         VTujWNbheW5FHzLfEQy//N81632lFxOuyP5o+z3iLYRd63Abj+gqi671XzQ5/fzn5x0R
         /HoXipCu5EqKE7IEmd7QkJPM4NCiyyiEyYgDR5J+Leu2vyaCkSi6Gh7U7x+ftcBPDKp8
         acHCoquF3Agn0bVbqTsVbUo1D82APPf63ellzT1rEhKrk9uEuHgw64/pWTW/zCD923N7
         SXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352669; x=1779957469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=LD+mp0E17FoD5kN5+FCapG5HHSL4+cera+Sm7SE2rYcn8rq+WEhQJtjhs8+adFQ2rT
         TgwHsMyBqnt3SEIpr5iksz5kJHXE/V2pqblxLR2oM/o3BcjummT1hOpZBz/vAMiOx0ZX
         8py05CUxXz+62tXPU7CmEH6TCOzK4l2RitYNhQZlZNoYPcSHIBIE2+w8b547wnTzsulZ
         MY1bp61JDSM3+U/RAc5V3oJYfIhP2zlL9T7DjrA7RwBmJRCtuVQ0d/4WGDwqKGfD3SRz
         3ArPeaNgBbZ5/Gc1Mz6Wi/Qvg/7KFUcmQTpeH0haYMMIVa8X1tZNqUgiZXCxZVeZhTWZ
         aEhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wEYx6D27OGbZ3uqVens9Fh8IS0M/6pWTAvIwg+3iPenwXyCjdxr1NvpaWJtEfnAu72SitvdEXp5q5@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLtDb23nXVKdTl/I+z+dViWhGa7i74QNgfn3RtgEnvQhV7kRJ
	EJTTAIgM8oZUbXQJLJ8wQdBuI1nmBOfobN8iSSKmdPQQDU++269zNKRKMWQPUiO94zRgxtu1CbG
	1OFBGX/qkdz0hxj1Mq+1fdh17TKERLBnxtnpANxuS80bRGEHq9Ti6SJAuo1hNYeM0ka+fCIq7
X-Gm-Gg: Acq92OE7RcXfWF7Ol8JJn480iFTqcjlIJgX+4sDMl64qYzxBq3aXSoRDhjHW33GypQK
	kuoCqL9L7fNKRoLkn0A1yEsM1k7IerGblwreknBmVKRR6d7F2xfRTOwRJF2eL85WG2A+vD8ErdY
	zznqVT/xasjD01+Dd0Ts8JFMzIIn+FD6uWjENntx2IWnI41va0w9gtKReLI4RQJcwaaqnR08pcV
	oNojx61gKsBVqtBYVKWlN/brihX3hBkJDuVMdtJcR2jblkWXwPltK9q8Rpz9EsNWfcLdJhziT4k
	X03UAWgVnQbqC5VqzLEhyhPs8JxlwgZFTmaMXWlfEyQ0/7FnM/O+KuM71VWu7c2W5GOx/mf1zqp
	P64zDsi2LgrjxcomIeGbOpObIMXWMCvv3BMWT8XJTfmrbb+yr14A=
X-Received: by 2002:ac8:5a95:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-516c5489cadmr25665051cf.10.1779352668991;
        Thu, 21 May 2026 01:37:48 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-516c5489cadmr25663371cf.10.1779352666534;
        Thu, 21 May 2026 01:37:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:36 +0200
Subject: [PATCH 13/23] net: bcmgenet: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-13-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQptve0VPcHpfn+e8CyDZ9KcfXURx6hUsS4v
 XFGh941uXeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKQAKCRAFnS7L/zaE
 wyw5D/42tCVAUl2uN4fynwbhyfyAyJgpscqW776mT+6TzShiQ1UGxlOeIgCoWTORPdoxwAORBgi
 PPFLgP8bYFnocTq4h5weZ5vNP/hv2g/J9Lmb/zt927UW8vXxtOottjnSBfTm0u0U/GJ8rgc88T9
 mpUOe+BfoixY7hzEMo1fIyF3WIaT+57oPDmyTNSED0/c4zBG0NtfjvfR+gbfyw+PuIfqaYcqeJk
 tuNS1ok36qM3GOUcpctRgzg3Gcj1c+Iom9FxP0Bxk1yxox6RfTH4YztKKst7Mak64vyUiHCbs8M
 cE6y1P6VvOYN9ijA/4JECYo7OgRJXtVQi1bQi2sofdLn4SkbV9PZe5fLALG3ChG2z+5CM6DLxnM
 ZTA0eltoOvmsMrE2KZKeX1cvWCqDNo1HP2xCCVBojp0pJ8mz7D3yTBHU0hPu6gxae8kQbUK/6PH
 xu98r6TPU4z+Rqt99oM/SiN9eDH0DJrtNLwXfnG3TvI60P81jYDEL0d3DAeVHomaowjoVNIef+L
 drTrKdaF+coQ6GqegTUdvOp7QizyZZfUuFufo6Io50ykK1jKebxa6rHDPedMyGM5//lsygsV7ZP
 qrz3VtMmHLMLX+azIV7Z/k3f6O6HZOx+2rpYF+AVt8E7wZbqRkNX3nvyQt+iEqoBKw3npAZOhCa
 vgpklhyoZwDkrzw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX+0JpKit19/kS
 Oj6RWxd7mXleS6k+i4BUX5U0ixiVR2pyoJ8YDy0R2F+MEdFYOE9hsqzlv+UAD5SO5H/m1WAxRDV
 lW/lOxGaawdkYz68P56JWg/N09bjm+nlGruSflFTFyjWTJAmTvGEiWNLO6/xjj3dvwKLwO8Cgdg
 KhoR8BvDp4prbwZPsQnAGRfQth1M/D8JTf5HQi8D95yt9ITJY4On/OcwFlyrbMoAYdd32G2h/OC
 e2Dn5hEBnNsTJwVm8uhRhkcvCVBsHeV17k3/huxqgC6OhCwrxRPARm1wO40neeWdcV7qCwHw8g/
 gngDh02yUvITxNTxHpsGHCiP+m5ViBvkJiaquWL4Omy7oCS1Af4aRrWydApBuplcxncc3HArk9E
 0bp8isUEnw37/+KFJ/EyA414gTbcHnWE/qDvt3rJgXIYygKkZ/fBIfrNdCwiRlardYWZSnA41pJ
 84vGefiBNilLc6LWD2g==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec45d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_l4veLwUkFW-k-pZneUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vE6vGOiB7xRdsRYawL10zkgOONPlEWg7
X-Proofpoint-GUID: vE6vGOiB7xRdsRYawL10zkgOONPlEWg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index a4e0d5a682687533a1b034ccf56cdb363d6b7786..451b23a039cebb777f356f64924838230052dc45 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -490,10 +490,14 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	/* Retain this platform_device pointer for later cleanup */
 	priv->mii_pdev = ppdev;
 	ppdev->dev.parent = &pdev->dev;
-	if (dn)
-		ppdev->dev.of_node = bcmgenet_mii_of_find_mdio(priv);
-	else
+
+	if (dn) {
+		struct device_node *np __free(device_node) = bcmgenet_mii_of_find_mdio(priv);
+
+		platform_device_set_of_node(ppdev, np);
+	} else {
 		ppd.phy_mask = ~0;
+	}
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

