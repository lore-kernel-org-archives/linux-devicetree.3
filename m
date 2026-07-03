Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77C331A61
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107714; cv=none; b=UujNp4m54qLxiYmxxdIMx09ih/33Z5I4DwJfHPGTkn8Zk3ksGNu3R8yz8xoag2QhrWGJkGr3rUIY/emNNDtChbhVYpmIbrCRtd0VVmWKWpaMZSvAVzDlyv/DjsRHVQPSc5a/B+YEfaF4c5Lzwuutl291fbFow9AT8xO0d6gjXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107714; c=relaxed/simple;
	bh=gDs4Oen2DDTezMfDmPJCSVtzQ+287D9p3/klzuY+bXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POlCG5zcxxd3gi+GplWcjmBerdRFD11YiIENP6N0ALEM0+p4D4lS7JjUMxEvkmw2FnjzctmjybptgS46lPBsXT2WVnnOJLM+Ndk70GaG1T+kd+NvujzU+OyHNOAVr4ezX0BCI3pLmv/trPNB9WVZbQNTz5XlHZUbbVJiKxem4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBbUqtax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJyszQSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBbUqtax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJyszQSd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiYuO662861
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 19:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgBn60HnIhK
	vMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=; b=RBbUqtax0OnhW8ww+r+abiXC7bl
	aoj2BEWb6XNcMTtnbQ/eZQQJxadf53YUYpMb9HDQFPKsAxYE+WHfUJzjV5P7b4sn
	+Z3ANHcjpYktEAFM1C4CV1k8NP88eUtR7krkUEhWjX0o5ZqGk+Yvz3NJ/D7Kg5gZ
	iLxwHLhK6rE6HW9etExXvSejbzzbzhvlqP05WbAXXc3gJ7C0dwK72SOv94lYCmOv
	5FQ0R2Vsu2aQgsQFeztF5gpUm7zEWsntIJWZB6Bx1yTiQ1unY38c+NcNI6Nd5Sl0
	RQ7JIvskzNJuclWDN805IAwFDfDq911B4kqC6csAGjbvgwL75Gns/PO/jfQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycex8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 19:41:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ab059052so828977a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107711; x=1783712511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=DJyszQSdV+93k3OboNxXH+ytf4+ZKkG37OB6QgjI0M+wVACb0CJfjKTnGLVLBDC+nU
         qq+YLIeY84Gp8H4X5fA09/GcGXdrBDxOYml/pB3CEurM6HB4ZLo9dKjMvpE/+PWy/AJi
         q6t+h9TI7cxJ57/tZb/z4A67NhLGkLE/bv+5lMVbog4JKmqMN+hDoEMuV/khP2hbC7/I
         5lJS90rc536FZPhLcqNNf4FmjCkNpelPaAC3O8GZcbGT1P1A/iys834f+7JNUKgs2osU
         kbFC09IEV9jno/7dmpMfx5tuW2VhnIwfbkPmmGukpOkdrQQk8aEPr+lpx9hPmBwdniSP
         QLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107711; x=1783712511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=W9plTeqPFgHp2QAxx2LKVBBf/CxISwgyX13OUDcM/C7pkvW2gKjko14MSpyq0S3D+z
         4TDX/CMOFPj1NRkSscALYQrDFBL4X8/iZj6pgfmzzM9BTZBabGUl7SlEJf6iuWgcOzye
         vwfhKpwiqUQ3rHZBNtgGuf3QrU12+3bfT3nEK0TSxNBh44ezK77yNubZyEh0lMed7Azd
         DYmfxPmA2ARudPNdJmHnvCfhZAzGT+lMkK9wJ25aXwa+y7fik8K1ogbYhVLf0PHaBSLl
         LMddFwFYPZsmjhEnauih7RskwgZc1iiO1FUtUQrpImIE/z3ZvAh/yVnswIw8CNol+93g
         39gA==
X-Forwarded-Encrypted: i=1; AFNElJ8NeIWSi5vdEW4v+VNPC+L+wB2WAA8mgCx+LK0hl/+3xEjJNEQflgM0n9eJ4947n4sFxjgHqbl0yzqL@vger.kernel.org
X-Gm-Message-State: AOJu0YyoARmswphT7SxC5E8ihnfJ4SomvJ9iu9VraPYoMI/Qxy18bzLt
	RkWojeZBVAUgcdIRbiJB0pkPdBFKKKW7nk2ndqZVh4uknKA3jpnxidTftv/LzshJWXQ7fX6Zu12
	qEUUe6SE58aZOTjzr/IyOaumQ2nnz6NcYd+7SKE1M5Zhk411LL+xee1qFzExvLr8A
X-Gm-Gg: AfdE7ckcZYyfJ3kULft563W7sIIFsephxxMOWTfT7WVlDp7WzRIqwvadE4ayH6Rovhm
	+4qyc+9gKCALRHmpu5eH6FN4nXZo9VhLNsxZJHE7/RKVgb9bJb1PYzh1ST4O3fNDQ7TmCvEZofa
	2IyNkkL8T1qG1ChGQXnJnhUCh2bp0QPq/fOI45z/LQm7bH3lHlUZpMs6DkXqtzpttoBruY690ad
	j/tskylERqTNS1ZGE3RF8n8VeCvZgDGCrgJRK8208IisV/zQFi7zo9fnFrOFBWhAPaAFpzYuh0q
	foNs0LFiZLd5XH0nieVbxNQ6CFOobOYaAXpc5th8/wpF1GKfaINzDqtoQfqGnsjkBuq4GO8Q27d
	zt5Q1Y0RPqZGYjtm+bZy+LzZRq6l4Qw05mDPuaQ==
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809456637.30.1783107710463;
        Fri, 03 Jul 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809352637.30.1783107709738;
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
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
Subject: [PATCH 06/42] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:19 +0530
Message-ID: <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX2Ts+6i6zDZXh
 BaMC+J8B1v1s/EOJwILSvfe6A1ayPbXPZQdG9wdArr4J5vMHQu774VHaiQtn4qkISGCX5XFLP6L
 sYOUmrQIGTAKiL0VlUChVE9nVhI07oYGEYbEFSbIdgXeph9V59nIkjYiC11qG3e9phL5Qlmllyt
 z+POnC5VkJ7IOplgztdRMphrwoLY1tLOTJZc7jrn5wNakJfI/w2t2QdE3ov9gRbcq5ddLrQFiKP
 iW4UcIFjbwWzHN5vDmQ45yoLGe5D8kx49+EcLPbhCjLRy8T182atsCrHtvmem/qGvlpQ/yjRy2I
 SDYv5Daryk7oqTkOeDWHUg1HNO7GomexEBF+g4L/EGonGdFN2bCQe9NFCvGFF7As4NYaZ9TbwzE
 FUer5rm3NdZt6p4kHx6/kG3vVFlYusLa4lHWYltQKptyuoKHGqfmy4KyEDi2dGYZSuKLQqD3wZp
 +t+r/U5RczDsCLDwz/w==
X-Proofpoint-GUID: gUP8S1AL17BsvbXl6qDAYmR7UlbVnUuW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX4ElnOcidgxd0
 iNONSRXaREBb/2GW70iz6jD1nG5pcKwJoJZnQ8jleH/VXxvIhTejRkmPDTVEZy1xuyhrQyK0MCb
 MrJteh1GsCWlgiO2MzMDrnZqgslemms=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a48107f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wxxTr_YEz1i4iFEBgi8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gUP8S1AL17BsvbXl6qDAYmR7UlbVnUuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.53.0

