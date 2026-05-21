Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FD3D5C0C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352709; cv=none; b=meQFJ1c49gTIMlJqCYLYJnjH13RZ3Eu9ngOskNkpc6zN7U2RzGhOFFkQXmH8NHO+wp27i64dppNJ/8ZYemI5Ltv9RjpqKIoeQ0XHOoiYC+KntHlF9z8nijEcQZAXZqSv2Iifnjy1TfbTirTwk1kteZJiP4LrNyhllKmtNhbH8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352709; c=relaxed/simple;
	bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9tZH8iRHedbzwamD2C4cadT3WVOjUWJRe7WMVadKv9uCnwPdjYzqxdvBhhdivX4dxI9hb0JsNipY9KSRJAQtm3poAhs2kfA1j1qRsIKWT/guDXXLHUrXMsgRBeSWK8ZfQwRNkwXG+9+XdUdNn4s8KPdsE9f7mJ2Ko2lB7jb3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp3UWx69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoResimV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp3UWx69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoResimV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L4ukg03085003
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=; b=dp3UWx69oG0Izzqc
	yeVxoq5UdBu7a2A5JsdE3LpwUghGj6zyXyNXxJfVkoK2mT6E0w7BUtcRNvDKJPPM
	TN483t10j4dVSOUPBeYIPB4OEWaWYKpPHDxLi9/U3Cu6Dv5xHACGMEMS/O3C+7pg
	ENnjbDeEoonWTgWTDsEHEF4VPpLACWr8LMfn9DGXinYJqT+0rcYYnGN2vr5rqGlQ
	vKYV2wGiM46rQucyBmu94NmsS80Q4h8NFk6PeJWUG+EEWF+skNymwcjQrsWkEcgG
	47q0scBNIs0YVcoJe9EK27ewNLcZmI2/hO3oXU0N7wi+I5HvNEYxli6o0M5m3zzU
	L3c9Eg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4f36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:38:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso182894751cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352690; x=1779957490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=ZoResimV3ItKVK98U7u6FR4xUv0yGXWc5lQPLYoml+PRqo2B178rg6JnHCV17lPs1G
         S0TRy6McdW3mUp2cP6iFpC3k4wTg+TULLj1UR5ksb/vH1dQViBYkYrencvjvtGPB6iA2
         2mqCzbGfPrWscBm/WobmkJS4ezmE7/cgn1sGFFCpzbHqX3iMxKPs/WQhAJqq+ForNWII
         O380Sq/86Cv9QSizFm1J5TzEmSQjT17f9xm3Ozl48fbIeU37ZCVeFhlQCrzb9C4FdKOB
         YnwK1c1SraB/QTmV2WuNSCgTwl8viKX849gNG/dpf10iWdp2oNr0IpM5XCMdfVPDkoLq
         BP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352690; x=1779957490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=IGca/MxUeVID037F072Oe+QO/KSjaNsyqLI7GUrT2QAY3w+qa0jGbNWUiFiFr60qZQ
         TMaWhMqyZc30GQdrRrdOJ8stp+8MA8COeAKUJ0hFf8sC3fPZ3EtptIfVJISXv0QyY1sK
         ktbW6PeOPTm3RatHdltmFnfWYNkA+MxPLtCsw5Q/VQNO/OltlF1m/K6hT0FrBI+dp3g5
         hJh69PKOCiVvL4zbLY7sIDnE8pDA0Xk0U6jqobIegMa/kw4sHty8fwBRCkPZKBIBQctV
         ON8pI2B8PiX32P5aPfUixxRxhffJ/wYIW8Y8yQcbgP25Ftqtbthc0RSFWIS7+pPwQk2J
         Eq2w==
X-Forwarded-Encrypted: i=1; AFNElJ/k1aQEeYYhKhfceI1u04ov6Snfv+OM2cixWMt3J7apOj3hbV7lNhD6ykloMq149uilOmOea4xA+NHu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMnmdmFLwmusHgGEbAx857+SlYDhsGi4F+jKt0XzbEY1ijGaZ
	hOsjlN9fgPDPBu/gM+Pu9yblU0s7EOmRP03w1HN1Y69GlgKqFjeOeTiOJzdu7B1OpiSbJAykjcd
	Mubvw+CLV1sKjAKGgwrTGfchhKdcadSZPTSBGAqXS6R3l0HzKH7z/fw6ORbZoE524
X-Gm-Gg: Acq92OHNZ0ZesAnpAwt5LoBI+FDhZH6BxRjw8rym4miBVe6UHl1eL+i0RYXxw0ecd/B
	RqFX20lYQ6to4v4wcZY2ugYDAqUTEON7SizVA7V9FSSPxupnjkypbRBZEDT2k0MPWDHWBuh/HrK
	1IqlMmHfcynKyUYeOn0CYojkiJrRqK+x/rap5ncIT73GM3b2fF4/O3CDqHdlNbZMZ4agCWgooug
	YLgzVPmgcDxoTB5j0fb19LS1Rrv7CGj+AxXObPgSkhxI8TKRFMReCJ3o5QsRMbLdKM7ZwM850fT
	0BAqz1MjQdDpdr35YtEK5Eur2ab3O5ee6aT+op8bdv7mpMjUvV0ln4mNQNx/UDoYIkEw9WT/8eJ
	RAsWpZzDCzobqowLmL5xyBVUZ2VFurWf+w9XjubJ8OnC7v3jovh4=
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id d75a77b69052e-516c55aa333mr23589001cf.50.1779352689563;
        Thu, 21 May 2026 01:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id d75a77b69052e-516c55aa333mr23588731cf.50.1779352689012;
        Thu, 21 May 2026 01:38:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:44 +0200
Subject: [PATCH 21/23] usb: musb: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-21-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoOxC6iyQxs/Rjohg22JgwSDvEJ4Zjh10SaAJTOCBC7F8EF9
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqDsQuAAoJEAWdLsv/NoTDzugP/i9A
 ryldFb9FSAmLemEO0qiGBJZcIslmI4+zSHLUyf3mJErewenQEkrJ67YaF+/3EQ5MKNyh9GGap4N
 HtGBX+rVKJiaLObdha+gBxpyS6ODT5vek1/ttYbafQUROxyO4O/xUTmjpefynxigMDNr0fgL1I/
 MWZCvQgTDxHHhtsDCDBN1+NUaRZxPWR+JJL1w8kNd4dDzckYCA58SP9ww5I7ra7aru1xMOrrwGl
 gs7ae1gcBWZ8xKrE27WxLDTib5j2LSaEH/HzjVB2moA+g+rRDXavYwEeiK5D8TWPW9yL8zD258S
 zCxRfgNNv1zSpQWkB8N8I+VinrR92PjRSlXon9wPiLEzKpKNC0nINH13V5/sg/3aHqKNLCCgyKI
 b8aSrCdHIpqpUTfORHm9i5ite+y9BjPMj+rIMrXi2RUGIsI994PQUL7w5QFe6P8YPwzHLJh/NGx
 /buuLbTuDArWEIxlY7UzZiJjOApMS4cf4UOi0dqDtt7b2z3XxceszldqYh+NVfxhtU98dhFizvw
 esErqQwHHDTfVZUB0S9c76YGbrNCfYAx2dsfizUx6MiEPZhYlZzigAfT3rvXR37GSjkWEUP9YMG
 2ZTKMdi/8fO5AG36zxqYmmFE69pEP1X1dEk6R0yl6Zg7ycYddoesnbfoQSrg+iX/XgrEqUYYUz6
 XAXwV
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ec473 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-E7rG7sKBpYtUKygALQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FXVmgcGKRw2ZznNqEl_1aWadWwlo-XXo
X-Proofpoint-ORIG-GUID: FXVmgcGKRw2ZznNqEl_1aWadWwlo-XXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXza2xGWfpdVFq
 8nQlyrfKC7l6NiPXgn/TbjOi2GwG02VpQ/IXDuVb6xM1voPFP/irVLlyna8GtNOskNP59eo4Myh
 xrSoWV3asxLGDK1KkOQJw+VUUeLukx3vNQAbwsqg3j0jFaqUyWabLZx7ApIpPS4hyjCGKOlNlw7
 HC3psazl0F3nDvqxdezeYPBWvrifaoadlKdkrnL0Nw1i2EGcvOW9Jw6byGbwGJNLWVG61/uC9Or
 HFZ4KkvMFgIt5bFu88bq1oGMdLQ0QFN6xrv2v6O3LnSDIXlH0D/k2+IA41GPiAv/hzw88vJhXIf
 A/l52C6LEcTllrL8lf5xNa6wJI7pQVYpP5kcsJYkYsJCiRNeFshao28qZ4/SYIgQ3NA/zN2ZdeT
 ZOzTs2VzOTHfYl952XPTNyVbx0gZeiS0W5L/uRboQCNbsxtVoO820t4Tv6b4nCHzBREvJR2p81V
 MjzahSpVSdZ21QuNyFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

