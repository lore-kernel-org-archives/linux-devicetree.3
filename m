Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6233FE0F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108271; cv=none; b=CMnFkphB8nvHXMYJi+MbZs/7fBcICfvAopnCQkfw+bFhnvFXeU+dpznkqhrVU4VT5tc+QoYpy8UM3nfasqP+78KnEiSQddvWzlgDjTcmbuDJEwdXDYGuURfz4q9OKtCdVoni2c+MynG3U4CELSkYpWv1QI9dYXvX5lSWSjY5xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108271; c=relaxed/simple;
	bh=p+wmq+X+KaHWOD5gAzZaUE2WvSh9Mf7oodpAKuTFrxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP8uQsbqQaaFFFXxIYP+rxX9ZMDXk+DsIUNwCfTWE68XRakSYdjTCaVwn2Cytr/LC2GSavJoS4sPJPSuttOY84r90bMnYk4tIUV2ZwSJoQ3fzMpMUopL4dVufvH59bbeEDueBMBBtQTYLBHXr7COgnTd/hBtH4wdp+Qxt+ZESow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7nQ7zZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNfw7Mm1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7nQ7zZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNfw7Mm1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOEO676040
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 19:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pe8ST3hB3CC
	kwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=; b=p7nQ7zZXx1dyH2mXz3LmtPkSnUd
	jisvgy2NTifLo08O3O54R98wx1vDjNj0Wc6nkxAI5QmcWaDX4R1xcGtW8a7qUW11
	pP1Tmm1qXYe0QSfC3Y/udjscZR+Ph2P+KwbQihalCCu0X5gayaM/FZiuNqhKC4dC
	bI5fBbUqwcvvYugwPT3aaoSQw4Y+2vA+YENnTjr5fTDu/vYApw3jocaRRE8EBwwD
	shcNAKkygkP0VARnjPMXCY1b3eOOzmUQ/fIJHpQK5JTNcblKvr+H9jiOiBxFD/XY
	k9QsTa+kZLp8Khy1haYPvPKdydK13icOw3hF3M3xr1GuNNJUog1AC7E7Twg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 19:51:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so1251433a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108267; x=1783713067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=QNfw7Mm1uk6sIEThfxEtjitPvkwE+2ZW79Sf0DROdW30SdDmq5ZD3cj/JkRstwXqMX
         UImYDOL0EytZeZvlx1kaTfQ+U9fTV4B9iwSWdsAzyIKhQZQQ1jM6qhgk29aefDGCcirf
         GuXjwd2Lpz7y/J6fA624DnISepn7cz7kmtuqd0QUXOjG/j8+sOiX8NOn+H2FylKJtgce
         tTg0J7eeUozzxeCs+k9ZqtIxi0Gq7yodlVQydLWf+/b7mqE7KFOXJEPw30MCPOX+p37H
         UTaZNZ8B2LckQFH8LOSOWD2K7uNC0pAJZqWMD3wXcnkvjK8WADRbXsLIXxysSnso4X0c
         mkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108267; x=1783713067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=sPCITmi5aq2gMZxGtCXaBu52uRIEnLpoEwdMDxKInxeHdQyQfwWLzvMoTq9X9gVG2V
         6UYXsV+d6wML8LYURrEY8oPJtOPp1C/YaW+xt5ePOSESX+1tjILis4TpMviG8dmQlPvs
         O2iQ+Mn8I9VsVgYzGbzNHrimqnsMJRI6mJYJjEhjPNHhZyJmwQ2YmBo0QwnXm40UdF0/
         Wkd+E5ZJRNoSXOarunbofLRA3r+OOOlb/KmJITLcK/9u17+oUdwEH3PTr/R+sVR4sXFJ
         L+Lm/oJEL3yHaZP8OYQr7LWtYj6zCqbEFiRk2V6uW++IB5OdIDyiStK+0dzbT+XPnIzp
         fj9A==
X-Forwarded-Encrypted: i=1; AHgh+RpypAEwNvM9aOWM5rRKSTBXP7U0XolkcLvJ8Ty7IEX47YG2fuCEhseCd+fB3VSFeR6kEpUCT1/7hlcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgC8Fp/7aeWtKGAtPSO/dZgrSZ5zk5gtrTjarHwqxfmgm3CCuN
	Ej8DkTfkIj417bTTTfW79ghNzCX6YSy1LGreLlCK8Y74+zwQlhy12j+trgeSuhC0+skY9Y3jDlJ
	xOCpLEs/O+1E39ojOzUbkdO/mgLo87s/6WGvui9Qo7+UvMWNxYVOwYawhkmbFeZ5G
X-Gm-Gg: AfdE7cmsAhfLKbDJELJFSL/nK5Oh1eHZM1aK22yK1JM9UcHTXaurRdYiYKyQH7ItGVa
	4j4U4lrnBpVeJcv3kSdFKWHyc8jP9kCbxMXDiehTkZXffSo2cbw4k9iodAo+TT73hpi2Q3Xj2fq
	voiVHFg/pD8FlpHSfoDDjoy5COzuHvJYfvR5kYCnLEoTd3I+/+nWrKj/pufVShsJQjGSPbYAThg
	BcTPdTe17RATIEZiKDF4sLlmvDQhC2GmnCrhmzNo4FYdzALxkicXi2LrRG0b01NkExqRTRZkaHH
	D8E4CTrGTyR8gQlL8CPhfUGYMthkepUHvk8Qhx9Sr8FkfGxfRPEyEk+sbPD0mFfQQ+nrKzg6VaT
	yIoAZwSIqstMNmDtNCU2yjvjlm7TQXP+SU1hv5Q==
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819348a91.24.1783108267245;
        Fri, 03 Jul 2026 12:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819306a91.24.1783108266647;
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
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
Subject: [PATCH 29/42] ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:42 +0530
Message-ID: <20260703193855.110619-30-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX6HswqRh0yBUy
 RzWOK5onOVG+LrdC4umXmS3Qzp2VXblYoGy7hUFLbe6UXhouwBIRvuEyZjyxzfAIiE622JY6o7r
 1CC0AalQhbe/B+UbROXsGe/ypTQUXJRPIzZYWqwTy7+VMhsOGnePoogrq5gMTUklDfbk3OcBv87
 +jOXJSYY3AqJX3Zjd8vsjj6KMxDbETBdRH/8nwWM6iiB2K+9fzkbJOQH3ouNMIkbKy0VA4Gwp+E
 MLDIWwy5iN7EOrvhWpk3tGTaSRe62+JYRbLIDo5qogavXShlwDPTHil4M23NyZVgeZffmqWBMb2
 /yOYoeej8z8odIGkX8UfYkEF0Mryv/B0n+hi4xohEWkQBwOmo92pW3YKCqClhAqQP6enCoUTelD
 aRFGV1L7q2viZjYXP57UXW04O8VYbB+rriAFcHkbnKXbjOTtDLSPgLNusnn+05o0h4/ZyKIfKA6
 JyRhqydngOIkZPq0BOA==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4812ac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3WP4xAbIaamtf5A8kHQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: La76HHVU14EPZb0BB_o5OtzxK05ZkBM9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX3tCqZxYu96bY
 Jskh/qq/zNH7Yt3sKhkVs1QTygbAqtJmuLDN0xv9tw/RW8VKBF2HGWP3JBvQB8Jn6kfe5PZ1owp
 M0LiruPBWbQgr5a6LVKt1uc5r1Z1JIA=
X-Proofpoint-GUID: La76HHVU14EPZb0BB_o5OtzxK05ZkBM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init_by_name()
instead of the manual of_reserved_mem_device_init_by_name()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/imx/imx-common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..29314022c11f 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -330,9 +330,6 @@ static void imx_unregister_action(void *data)
 	sdev = data;
 	common = sdev->pdata->hw_pdata;
 
-	if (get_chip_info(sdev)->has_dma_reserved)
-		of_reserved_mem_device_release(sdev->dev);
-
 	platform_device_unregister(common->ipc_dev);
 }
 
@@ -362,9 +359,9 @@ static int imx_probe(struct snd_sof_dev *sdev)
 				     "failed to create IPC device\n");
 
 	if (get_chip_info(sdev)->has_dma_reserved) {
-		ret = of_reserved_mem_device_init_by_name(sdev->dev,
-							  pdev->dev.of_node,
-							  "dma");
+		ret = devm_of_reserved_mem_device_init_by_name(sdev->dev,
+							       pdev->dev.of_node,
+							       "dma");
 		if (ret) {
 			platform_device_unregister(common->ipc_dev);
 
-- 
2.53.0

