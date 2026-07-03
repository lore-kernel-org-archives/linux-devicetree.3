Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036FE3264D8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107785; cv=none; b=hn7W40DBT+mvebq2E7pUztcEtOTOnbM8vhhhVA0e5M2bshDy/ZplvBu6226I/6Fb1hixPrY2QVoCYB486zfgSmc8JRK4eXPYtclrInTGLXysR34y3z7DlIz6hKHR7fjdo+qRC5RtfkT7s8BuzBhp0mqUYuGvBKLgWrC5ImQfxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107785; c=relaxed/simple;
	bh=EDsJOkMjiYiz6OkhRTOBP+Vv9glaMIUvzF16vJsaLys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pz6T1XlT2rgUgAmBK+W31FA16PHRFZ0GcX0ZMGJQEam2KS+AKLsn+BRq2rhp/eMFrkpRLAS3tbaXC7P1prUzjD+dZ1iAIxITn9fDzeNwROccpcfYemqhlX6yOqlejPgPw6E/xC7E6/Uet1YyL7GMGiHVbBU1VloAttLzL/hGWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBy/JQfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duQr2h9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBy/JQfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duQr2h9T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOWv684032
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 19:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1EEVIKsLJK
	Ugc5TxRSkb+8QfAsvTDn+685DsfCzyOg=; b=dBy/JQfo/vmPcUgd+SG5C/HFppQ
	VQPpo60m5XuLLe8IZz9VmkujdeOWKORaedTIbeEBXY3MrqaFrb5buG/dtNw1flVa
	gmLIGrbmt1RBL2AacXvRap654MDBA4a6SeaUuliy+gHrr788pt04eMSI9xpgs33+
	R5AZgG4+5VHgVaE2/+1DnI3BIA5lvOsSyAeCDfw9UMvsglqVfpNNovb5N7PeoTwg
	ln+ebK3WQ+ukRC6+S/3BEacZiLuSKmeNDsLRfTMLfQIiHJVlcehaxynQlPbJBxiI
	lA6TlzgWIpcuF6cQsHlG+pIWLBg20HuTazq1cz/Ht4OmvhKuWxEpUIEngyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bs21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 19:43:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38096521198so1450349a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107783; x=1783712583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1EEVIKsLJKUgc5TxRSkb+8QfAsvTDn+685DsfCzyOg=;
        b=duQr2h9Ticy2uQDCb8Ub4gcdN31PT7fD/Q5vPMc8pJPKHPLwqotNqvPS+yJbzss4sm
         symuZgxGS23uqjxGs2o5RP+K9iaOXnPsfOUVCJPC1NrwdiMPSz/jODGif0SQG3Xp9Sdo
         S5EB1ETlyP2xgwHVoN6gebZWJGGtLE1ZujzHspyReMewOR1XPo8kGHHmCPGo+kbG0FKC
         U/g1G8vCDKdTG04Hgy6t9R2WlvwY8JNBTq6bmnQx15rwWecyAktn09SQBWbV5ifoIrrd
         o6wbhuDfOnx9T9bQ8SN0CgYbbk8uNe7K/3pQ0wLDeI275Vl7vaAKl4g5xOjui7t1+q1S
         Mn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107783; x=1783712583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1EEVIKsLJKUgc5TxRSkb+8QfAsvTDn+685DsfCzyOg=;
        b=Lym1QA2eR4JfA4P8TaVudKAgw9D0jAqmefNVf0nXVyCjutgc8nI3Zuv717WuPZrqxA
         LQ5QjgjTo10XeomYEI5UUqOYRzEhZu2X3XLOC01jH0uOUQudcTvOD9/J4iAfT+h3tc2i
         g6+9BlxVYyMsDNa564rIaJ5OKWlZIVsxtZ/1LU2ZkStlMyu1wG7oNvXEYnpnRUCD1c9s
         NWSh2zL8LuJR+vtc2k8xkNjsfSdmO+6aM2v9tUfYtEl2wm9xkOlpEVs1H6s0siMGclm9
         bUdr0Lg2XULSuRgzl2NwjHPRwdLTIx1CmmL77eA8wpgtYnaE4HYGFy/lFR26B5HD3qbt
         nNOw==
X-Forwarded-Encrypted: i=1; AHgh+RryrNroOzcq7t0qf8+2AqXIffej0Q3eLvkTP9nDTbN+P6liuzXJSWKE9P34gky0nzsEd6Wj1Po2cVHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgMqyfnmpKAN+2mC//yPpSMwLNhH1sksl7Wk2FE9JiU5PHJVM
	wM5+FcIlE3e0wr+viNcI4YQJFuqkF4bWXZMryQ3Sqt/k6X6KpB7aFBCOXq83A700o9HTdwDgtlx
	e92UZooKeH3kwoWB1Z+KNh0zb/GeegWwdig+YboKxriI92OpuWI52sLUMht7o63fP
X-Gm-Gg: AfdE7cni1lFd7HwqURNHgxsMJQwnJQqj8kpYCc5TBGdC/FdjWVZcB4XHxQC/vamDZA3
	+AiY/5Z1N6/9F7YDYCKig6OLFuf5iZLC7R6tzXeBJKvPYhDXG83YtiJgFzmIt3spaIC5Jkv60xG
	yzpt7V8+w6ADvW0+2RDXPJJwHUg+h2TUU6VYsr6QEO0ELUPvlcMtZdi7JI8D/h/cWeJSnSQMmwf
	ve51IPdGRJU5rrkConcYyZdMX6BSCuPOvuOqNOwWQxFTbl3OoBaL62A1MSJ0Se8LQft4EEovyUi
	wKNz28+i6uM+Uo3jFJ8yOffjWI9E62Sk40bY6OatH6YzBIxFBE3ag/uLFGqedgb8FCDPPW0Ags+
	yltkjNQK20BQZLG6MPlS5FpsRlQMzEP+Bax0+cg==
X-Received: by 2002:a17:90a:d40f:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-382807aa1b0mr732954a91.7.1783107782573;
        Fri, 03 Jul 2026 12:43:02 -0700 (PDT)
X-Received: by 2002:a17:90a:d40f:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-382807aa1b0mr732847a91.7.1783107781822;
        Fri, 03 Jul 2026 12:43:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 09/42] drm: hdlcd: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:22 +0530
Message-ID: <20260703193855.110619-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX5pIYZWM2xNqW
 9Svctfqv6cROF4xKyS8YOoPj9ZYhFtVi518kqe1twpr6L676sZiVafiBWkuYwob9onHJhx49QgU
 0ovQV5ldHGylEmTB0B/livuWTepgOmg=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4810c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zu8Q1U5i7KxegdXecekA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dVUBbECbUArxDmWgyRGgBsDPDSCVJ2rE
X-Proofpoint-GUID: dVUBbECbUArxDmWgyRGgBsDPDSCVJ2rE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXzNt5upN1EjRi
 FYZ6bCVMkSMm63tboTiNtfbuEivguOaZUnZJgdh9eUZYwINBJXf8WUyYPF9d3cU61VD9BVvJcQf
 S0a85z+TxfLzOUfcx9fueJMWqpqcO84MBzYe2RsUuEdnhQ3FmFm4YjpdWoFXsEcEwuwkMPo40aa
 EQ/EATj8wwsJmfjVFZBqGHNxPF2Qu4J8PvwDWRh+Ww+Ja222onp8Lm7Jjjb7PU7cDG3FLhmFkfG
 tWaGS0DhbVqHE8kNW/KuqsD53lK+rmJB8U9ArQuv3gs8mVUklhjf0Hot6SK6VCBsa/BPp5EVz/S
 4U1cdT//xj5d6nxcptv5vsVbvjdKJJpqdrQClyiB6ylZHHaC2mNE6i5HbtgwUQuVA4/szmetmYS
 Nqaxc43RjtmYOAwxIivnSY/qROD3QxN9JPopD6554e1BHnyPAu8D6efEDuQg5YVe6fswkSJXDGo
 uus7w61qrE81ZInzJeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Remove the three explicit of_reserved_mem_device_release() calls in
the setup_fail error path, the bind error path, and hdlcd_drm_unbind().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81d45f2dd6a7..67466fd441d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -134,7 +134,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		version & HDLCD_VERSION_MINOR_MASK);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -164,8 +164,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 irq_fail:
 	drm_crtc_cleanup(&hdlcd->crtc);
 setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
 	return ret;
 }
 
@@ -316,7 +314,6 @@ static int hdlcd_drm_bind(struct device *dev)
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
 	hdlcd_irq_uninstall(hdlcd);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	dev_set_drvdata(dev, NULL);
 	return ret;
@@ -338,7 +335,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-	of_reserved_mem_device_release(dev);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.53.0

