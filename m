Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66CD3AD53B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858912; cv=none; b=TGpwkJHEWHl0+q4bUXoctNClE6jUN5CyxTDtix6edyobKegVakeQ20OVPUgGXms4kIKd4S5vqWsBG5uzt6DMaZWh3wDnG0NBzIQLQx6pPDkq5DajQsjaca4SK9KFNZrLw9DDhq7JyahFUE5+VjyCNjKpqoSevIr5+SPvygSpaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858912; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVdLjlSg15C8oFTYEvwbO1jYbyAPtSQ5LwTMEoYKpdZ1sJpLhEJShRbzzZ3l5xXmTS/61PLEvJQ93V6qcbwMNzBTU183K7i3fOSP2hfsNbIteA4YU5CORRX2Z07tE/X4h7epGCcWTf/T3ypG8TVyt1jnz+Xfqwbfx4LssMbQ1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkiXiE6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMIFv9VA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkiXiE6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMIFv9VA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U43UNq584243
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=nkiXiE6HjUvm0ynZD+4D4JASgNf
	8fVBKoJ12qUSOZzoFWXl1gQgYHDXMhb8EDoa9MZ0G82UErRkCf8aEEC8nkFNyHaB
	2i+XOp8mvq8V+envPK701rMKNxjZZRExQIENt54aAXtjyYqPVljwx0TGQlFUxUTB
	eAGHwRZGMF/jPm8tLBXTP8LKBzB6sNpfZGeTv35R/4mysCNP6QKCqfvYSfYxq7cS
	ytpkSe2z1ZsFwJ8UlRkIj9WVodscvKadPGWAY0GmOK6nWx7SQopcanlZYw4KK89N
	wnH++l/BGJNPuiXbmCX+vf/aaC8XHzNTPhKc3DDoz04l1R+2Tb2P4w6b8og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso132744391cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858909; x=1775463709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=UMIFv9VAcAUmbDLe3jmE8jSV+mmHvO697dMo1JHtliTh03fLnGivb/hKCYW9vaeW2t
         2bJI8zzyDHrILNjVFM7kJWEg4WKRU7/7zT1SsrXc9JOa8hT9gKzJ/0OccvLIPL1DFx79
         jJNtBnUNSKh262fuhcvtrNjwngli6un5ynHlL9+Sce6Jg6l7Su0yhp0UigLm1Lq3F7t1
         CmMqTyvY4p+Uo7U0+Zgt1SQHXJoSqNJHAHUzjJulQNbXWgLcGKJtjGKq7AuQZTWnAKAX
         Eda6xrxu+Pra+mLX5uXo5Dk4JgLmMvdYsb/pyzfpcREsQrvkihaKuZb23Kk4lbMvNpZz
         6oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858909; x=1775463709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=Kq4ObIXzKCOV8n1XXFp36ff7PUwC1Nx9PH4vRTfvptUMGQcq6f5KJtz+4u/6MRex5A
         /2JG/xCwAZCoYGWrEPc/yD/oikSMMDZbCPNr2ncT+3vMBIy62FCnN6sLZhsAynWuzv+m
         fYHzGlFWakqPfgPifu5M7hDYSStn4RCaTzQUgZN4k/HyZdHfcSMLj2MbZFO9YecJs6k8
         AHT1gvJC5lmNA9liaHnkSvr/LvL9f5ej7f7zdlhlmQxFMDF+ZgwLytwbTuHsqrgt1MTE
         jeidFNJ4JFs5bq+e2rzZEVOV5J+njewb/01nkZKBxXM9gHx//ZfHz1t/Pl6YwCPXFJ5W
         0LHg==
X-Forwarded-Encrypted: i=1; AJvYcCUPFSKFr4iz8CypcbJOFR9ojDebhZjprK38BxMMx8CHH1o6WD1iryHPC7Vj9HUUkexsF46k5uX/wL73@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUM0ymMtIdZg7i09v8URxHUhafw5XJgRlJP384BpQTXynUruD
	C4FVSMvj+bk7qnvAIYeQcH3IePQDAXhH4KDEKGv3S60fCZC0XeFMSYd/OorF+FWCnSADL1Spc0f
	vk5P6WkB0gmtN+Xq+Nw0fetS64uYsCmrKqpeh9TxO4qRhDhnVKKw0aRHQQjpK5r7Z
X-Gm-Gg: ATEYQzxpI4TZ1RBA1LCIIumElBDP6YaoUo16l1Z6tvi2Cime+1XgcgX4vMnxkGYXuoR
	MmlvYWevb51z9GHvJOrQs7UohU22SCutoctQ5X5ErVpOL5nremL7S9jEp2KYuZQDSPhyMTdvzAC
	loj6lXQB8K14NW+0GaXLGOmgYdqveYeOyDYOguEiIRNGhiG/pu+Ee2luGfc3omHoH0FHBwwhtp9
	vjVloKigzcSmgxldXdeOApOkNH+FY7dZ8WI4L8Ubm+luCv/gilqrnuTp/IwjWZSxEzkBkUN94Aj
	lc1DlHuZ0tVM7strTghfXU0t/wqMuBzVohk8PT/pfInsL+gyYje8cDak/1s8SE2moUeG+hAwgYY
	KCzPBUsTwqvGLczWLPg+DM3WYzznG9pA2xQuaura2F/cf5XQapPT/8DU=
X-Received: by 2002:ac8:57d4:0:b0:50b:5507:f0ff with SMTP id d75a77b69052e-50ba38b11dbmr153012281cf.43.1774858908933;
        Mon, 30 Mar 2026 01:21:48 -0700 (PDT)
X-Received: by 2002:ac8:57d4:0:b0:50b:5507:f0ff with SMTP id d75a77b69052e-50ba38b11dbmr153012051cf.43.1774858908433;
        Mon, 30 Mar 2026 01:21:48 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v8 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon, 30 Mar 2026 08:21:01 +0000
Message-ID: <20260330082105.278055-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PN3bUHYn1kmVOYezyJtnQuAGon632yXS
X-Proofpoint-GUID: PN3bUHYn1kmVOYezyJtnQuAGon632yXS
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca329e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX/MWSAXQ3iS0T
 8j1eua60BYsgw89PgO9LRaHVFI7Uksfl1UnYp7taskiT412c0MJkLZog2lFY5u2jOAEn3ciFy0P
 1SWwYZsrZwRw3YTC+OKUogCQGtBzIRnkU6C6dO+dgBG1JOtpNFHXAo6I0TFOrVdojvXdTNJdKwS
 kMGhBgXH+u9wtAijS1fWDQVRBXI1AraVMJwlo9pfATsb8SDz+elf9OVPktXig/L19F4kwYG+YHg
 E/0Hq9J1TpxAXDdvyxPAkMP/g4u85KIeYcrwyZFZ1L2E9POv6Arx9MyfshbLh9hGry2A6q29pM8
 8f2yU9IefwUaYwbPzK/MrllqLK/h1cxzFxXk+Dbbrw3s7dFA+eeJsklv/T1lAAr8+bhu8qG+cQI
 hz64VlOtux38XpbZ2EHZbFZq228VhWFiNldhcxdoB0xrEW9TRWHKUZ0dbMTDT1U0dmgQoNlvfss
 mOWxeFS8xEaqDRGuQHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

lpass ports numbers have been added but the afe/apm driver never got
updated with new max port value that it uses to store dai specific data.
There are more than one places these values are cached and always become
out of sync.

This will result in array out of bounds and weird driver behaviour.

To catch such issues, first add a single place where we can define max
port and second add a check in common parsing code which can error
out before corrupting the memory with out of bounds array access.

This should help both avoid and catch these type of mistakes in future.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c      | 6 ++++++
 sound/soc/qcom/common.h      | 3 +++
 sound/soc/qcom/lpass.h       | 3 ++-
 sound/soc/qcom/qdsp6/q6afe.h | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..cf1f3a767cee 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id >= LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ee6662885593 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..68b71039b981 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -14,10 +14,11 @@
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include "common.h"
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
+#define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..0b8c3ec1315c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -2,8 +2,9 @@
 
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
+#include "../common.h"
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		(LPASS_MAX_PORT)
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..5cf538397841 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include "../common.h"
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		LPASS_MAX_PORT
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.47.3

