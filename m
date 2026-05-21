Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D537D397B06
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352712; cv=none; b=OOBDDsfzXaj9CDbazbPKQWrkpc8huCcIoIBeZhlTPnOhPBfupIH8WBtK6vEvybwDofPOJj6y24WVbX4FkheNGho0XahMz1pchMKjpwoxNiNEzXltzftiaAlWyxx7pmF7R8Ag4zZ9YHSIf3lyjUOtxR1xuIdMaCtcaJwzkjkQy1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352712; c=relaxed/simple;
	bh=wJdZb8+vj1m+b+x+FZVXzS56tnroKpQQ8wlBgMpo8tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCzEXWUr/tdc6w4EMSEx+JKJ6KKnuOFJwigxDvr6RPde6EL9gG77lDvGlG9XaPj1b0ih3LamY7nMqlg0a4Zqj0fXevwtPR8nWfMQFh1t95j9ZV6tyhvRxN7qmIGZX3T4dTik9dG3iZHbV+nqdw22kLvExdPlHpRetzidFDiFdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWDhCsBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKL5OZUm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWDhCsBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKL5OZUm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2waiX2180433
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=; b=GWDhCsBLIGtPgv2W
	c9gVxkym+zZjL9O4PUuVE0sF3TxrrJ6W5P3YbWhFCYzbbTfeqiCKQ+7SjTWsibzn
	nNNxjDvPT7iIjQZ+n9MfKwkkhIzayMl54q//AsstKcgDfnUZQVuOxCMKVlGH9lw9
	PZiM2P2RNKg7Gu4ga5SI8yUCy2o1Alc/GuZ6YDxT7crfbaT4vwtm/i9bxzxEocvd
	fOD7lEaiVoCth1jh2crUqVtYTKIJ7opGwu8BeVmYBKATumsB560irFMWUIIgRWfl
	Qi2+v+b4ajc9hEwmmWkVKbwJcgRWW50ip1+KMSm14d7jLWoHZoTZz3V+xv7FD28u
	phe18A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr317f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e423a05c8so160886731cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352695; x=1779957495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
        b=CKL5OZUmK4Hln12OCWjDVk2MwmP/wJb2kWEeL4nKBM/SaU5qzkR0CuZ29/cNR2Gh4z
         zNToI0X/leevukcXXQn5C/UWQkhCWE00a/Tgd+ZHtK+jX3ysV+gM5QoXAhASZZBkCmrg
         IIR/VVQIFuABkbcXUQeXl9qRWqotdf6YwnQJO2W4TNAurDyweOCS5zpChC34n/q6O0LP
         41MiHrHJ9fNjo+Q3H0jBNsi8vhMhVRJM3mc9+l1aVDH0ZC+yhK9Zw7QoZW4rtzmVzaKw
         ifPK3YSrx2LgXvd1duzqmOuc4E7JcJ0th8IfhkXlgdtmSEoB7DAQPs+pcRUGgI0B/6uq
         x3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352695; x=1779957495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
        b=n3MSiDD794S72yY7WA8xkUsWn7MPb5LYyIstm6xL8ZoS8y/06XGeOFoh1w4FqZYhEN
         VjYFn4QacQNnY+keKkY1YdOkFUccy+zbc72q3itN+/fvoEHIoUingcp4mh4mrIM7q5S0
         9L9sKcUW3yvfNZ+l1IsrOCBvX6Se/+aDsjvz5G34pdolrw0KE8RoICBhhs2hWaEJrp+i
         mkZoUh2Q0nXye6yTbg/JnUA/ibqMPIq6dTugqjIONVa5YiNNfE/3Xpi9wIOPJ7XT2wKK
         PvLLt28vZFZUCaKSWEAYbrJVBmwMzgRz1lRk35GagdvOAuCVqzLzmsw1PkSzRC+DQU7g
         5Ghg==
X-Forwarded-Encrypted: i=1; AFNElJ+h/iQXSepPOaJWcLRgfFkZVabPAjsNHfByGVfRoZZ6WURFjADjqIGkQ4s96/z+bMVL5yr/9RBtpxR8@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2CtLIVg7VZ+pcRIZw+NSLRv5qKIS1vQfx7cxZqXiGubD9Nc3
	jOtqBDJfdlMK9blvxP0TF8Msd2buWFwd2j2uvLH7iPpDe+s7VF5VJ+r/FH6wA6BtRNM52p+8lr7
	v4Y15WPSeOfX1Rvdzj9iUb8aKUcEa+SE5t9ptFAmr8+tXGHMUWrUYTeiM6jPrNBXH
X-Gm-Gg: Acq92OFkaFkvwqedDPTwaPukVweWgmxISzgUavSKqMNuFxGJkno1VRyjSMwzZMqgHdW
	9/4rlxtbgQyeIHqWHfQzu0p0b/k1EFs2XcDh6Nh7K6tt95VuXhEiJnyqXHxwWqFdEBuIi2idndp
	botSkuH5TUJwD8qWhM/760/pfslSTYmmzGx1Dafcf412E6zr30/0Fh3G44Rm69HcHuigQGemYO5
	fLbKxLo8l8V1pSphwNy9ooWY82jsVmCCC6XEcPpxzC2qe/G2kow+NJiNgiTvMm8MZ8HfJHBtm0F
	+FZJraL594e5pxpoGwuNPK0/Phqa4gq6bPcZKGuBQf5GjFATmAvYqrdEO6EVeLxwailqdDBFbPF
	CDkDIKmWOCAqsrJFlLIUzNFUPTbo+07qaJHIMTawaCe+F/v3VFq/x3K8W85rkaw==
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr16055581cf.2.1779352695392;
        Thu, 21 May 2026 01:38:15 -0700 (PDT)
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr16055371cf.2.1779352694912;
        Thu, 21 May 2026 01:38:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:46 +0200
Subject: [PATCH 23/23] driver core: platform: count references to all kinds
 of firmware nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-23-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJdZb8+vj1m+b+x+FZVXzS56tnroKpQQ8wlBgMpo8tk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQvywAOqGOhQtns88s4FBMXaMUo4jbwN9DyD
 kRRxvjg7imJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELwAKCRAFnS7L/zaE
 w4SGD/9+gwveQq+/mlMfCiUitFiJRq1flDEf0vJNh9aBWt149vNSL1T8VDY/lOW9NDE2gZ1k+MZ
 JdADhVpNlL4M9I8vqMk/LDuOM9lz0fB8NFhRkPH1xW4zmgtjdYwt+13FVlDs/IBQH/Hm7ckUoSG
 huJzETXgeWiXzfa1T7R2PdUfzVp+UKttU9KJ2EdakgnCyQt0lSOc+wM22TMQRMtX/mJW7CWw7QO
 sUVAv4Al0K4BK9tKQhdd1KUp4kJ4F5ZHrJeF91QGJdhdcRGQne3vkE+fkflalspO6rd+fnSCXaT
 dFaB7eD4PFEFbn7OiTETNfps8uMEF6sz7P/CYX2u7Fu/x9VHXGuLhHe05rMwNi4cND/uNbxsoyk
 kJb2aBlDNL+QlF0bKrv7s1K6Yqyr56o9gHv4tqjc5avOoTQbqhhJaEhONnXha8/kQUB5ye6tPel
 6AhL2jn2ZBKdNJRSbbS32aWWlLlMF6GnoUUBF3q4J7akrmXxbJNBoWUC/g4H/PM2b8QWJoSTDWx
 ObAX2bZ9TMgCFdvJDlPIZrQ/7RhHM4ySdHYIx34eebl0A8224pPJoOPzFkT5dvf7MTfHvmZsv5p
 Ayb19s0ChWVPXSppfxym2p/f8ro/874bWyD0S3JyVxkIeRz2d+Gpwqty4SNJ+8NJn95l8/hU4xg
 3BVRH8Q1h4ZSD4w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kVbvfLqeH5Ys94Hz6ESWG96urnSmHBUR
X-Proofpoint-ORIG-GUID: kVbvfLqeH5Ys94Hz6ESWG96urnSmHBUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX9ZaKSkNankJo
 sST70+CUYbMMflsxj0+GWOBbKRSe+bAwFvABoG/pP0yOBqDps7+UdcNDKRFfPrUYlcpl39vTcx5
 mxWd1lg3PITeYgSSAOa9iFBBe6ojKKwNx8V6+iQM6nt6ASU2MfrXg4ql0rX+fDAkRTL3yojlkzr
 fgt/7SqArVl5flowaExAUg8o+YQ+W6FmFGj0NxJi9mvWO9UmmUARDjP/L7nYecLdyvllzqcsiAR
 49ZKc3UzyCEjfJYizHI8C9DvgoK+BWsXf6N+VPenEEHvytVrRSgk0fpd9VprYcGs+XRXqCQXvkI
 05LnYEInx8PMorFwnMVXtXPJmo3bKgUuthAk5irj1lFEN5g5USxyGld+xGfXOHbcsqaq2dP/9lB
 +EulciX98xSxxbAN8piXAJJ7jzkZ614TPsYYpgAA4nh4v0PyOVGSbBp1V4tIZJFTlt9Idd/ZbZw
 p5UeC85UjmLJKcL9k9w==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0ec477 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b14f707f077bcc535fff9484d1ec904616d0a1d1..2a99162263e95f026830a437047dbf9fd347a27e 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -705,9 +705,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -723,10 +721,9 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	pdev->dev.fwnode = fwnode_handle_get(fwnode);
+	pdev->dev.of_node = to_of_node(fwnode);
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	pdev->dev.fwnode = fwnode_handle_get(pdevinfo->fwnode);
+	pdev->dev.of_node = to_of_node(pdev->dev.fwnode);
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3

