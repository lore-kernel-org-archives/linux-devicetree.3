Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D803A3834
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117514; cv=none; b=NP7ibLV9kbm5YQNLULf/mos0E8chXNStpPh8TWf+ieTI2445Ap+KIxNZwZMJWVjLc3/DPTNuZasBUsmlw0aagP5oVKbzrCK3GqjkIUpvptLPaLacAv1VfIMCeANOxCHSJc30yBxPruCtc8ZZ/FKgQsc58ingyzB4uoyD1IKb0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117514; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqOw1HAVmfLXbbrb1SwoqFHuTY1eBHm/P2HJlzTHta7cD7jgmywjcT4hRloX/IgPla/6YYxTFIyRK0AEfmywxmA7yYkkVQxB56uepF2h52tYtambgxg25/Imm3GjE9yoS9+oXoqR/E5SIsTPHoAVdEuOf/g+ROnFWs0M0QAo1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nu/TB7aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es4JROTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nu/TB7aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es4JROTC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327J9IK2904396
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=Nu/TB7aMzjP/3OXLNrNULeF2mnT
	v+eTUU8pyh3TRGll0uqoY4XQdDMFoGT30QROIauWhhxVVMU1vUcYNNOlMCumf3JP
	sI7F3dqQkluY7eGKMG3nbuHGpormtghUWH3xRTNrWLc7ElxXYsqWF8A3WrQiQ+5h
	zopFFwREfl6TlQW+qxbFeKVwJRkofz1v3tk46FWCzdxzrg6vNUVMKPCvGLlZd/2U
	C64f9lcUkCdmU5lB4nlLc7d3h/EREq2tmcaxA/ZZtkGmgZHR6+yy5vjULROASM9i
	j+LTTOxFOJd/0gNxezd7n6H1GuquveRGvuq09H0YLpwxRsUbRPd+u1aJquA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbp0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso15245021cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117499; x=1775722299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=Es4JROTCG9IuwrflzNkGMB9QO+ZMJmYj/tzI0tZf16wPC3j89qDaX9PmS+CfzFbTVH
         SP+qiSNoafS5RUKtoOSVHH/68IWDMcjBK/k1jWxqmg8KwJKDBEUgXWjWGPYHjA2JNMpc
         VT7d092tye9pUaay4LXOFVk0EpoEdtp0QdARMzI0NOr9lCcesw7MpqNbChiVZkOOYf6+
         pEOTt060jGvF64z+bBfIaHkGPQFZg19vEKhmwywscUo05nrYFHAKlIJTXI8oRJu/1wBa
         aWs0tdoQDmR3eUNEuvL0uxVE+d4yUmL+H225il16qT6RPmrDJoUQ5uS9ckBXTLf4afci
         1IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117499; x=1775722299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=V0U475z2oGgea+4bKdflZ+oOxpb1Ikgd4dKQGYl63Vs+tnyJXOU4DPV1fQ/XWjTxIF
         v1gx0MNGdLK0JV50Pn0JuRjJHIlcO9a9MgnYBn8A8L7BPHn/sIJu6h9+6xgfYZs5r9UK
         MAJqRx3XKFAAUSiXXGAjUD5FZ/bUrAlnXEhJ+/lYG4qbdtyJs3Je8+JQjt/tWHggB1p+
         Xy80258W5NctC0CJP8HL+HQPCze1CrN/Gd+hpZLFWDanJW7AAk/+8MiZpMYN/6b+CFMJ
         FyeMGHOIzTmmRlBp/ZV+AVLqkXRch4TzTIrBtQkYT/J+qgA2ewaPP+4TtENNZYkosZor
         fnUg==
X-Forwarded-Encrypted: i=1; AJvYcCVK8Bbvro7ZtLKVtTQt7EL6nKFCkgbJZSeg5RsRiE21UmZtvkLPCW0JaHecwVIU5unF/NFuCPByW1Hk@vger.kernel.org
X-Gm-Message-State: AOJu0YxaA5Fbn6p13itAYnvxI/SBWQTA55pqGGqwSilkysyWr1LmX8Ul
	8RbImTUS7gLquH8zB39yNeEvuFro5SEiqAS/xq3NrhSXc+yquPJNhUu9vQCq5e4r1KZGGaXXVq2
	LKLdOVfmGKoEpPmpzEr8+RDOmLoBy5/qHXoza6R3bO8BW2YWEpV5d+B5RaZJp2dXw
X-Gm-Gg: ATEYQzyyreTEyz8joNIUZfRGv6cfHSReUN5x3YI1uER9HsMHs4BDTPxFsItUB2qAbVq
	B84TOcpQwMyK2NYDG1QAZiHnc/9jgAGld7Vcms8mdO0o72ZofJoKkVWk6VTWo19dMeIXCFA+Mf8
	ATVjbAgeiyi8AF9t5WdqsHF3Ebn9HkcLf0WMBIMdtxjr7eP9eML6/dnL4J1MtfRz3Kti73g6FPT
	mnBcIQANRsP5+yaKXaWLiAZDxOKQYzaY+7CQVgwwZKR+IEc9U6qMNLwMRhpSDlHA44hJVlujOL2
	x+JicrosLnrtbQWo/4NcsgxN7Ne8mwXBi6yaaDok8dYRCAq0bZiR3LmifhxoHyBVFb7h/fh/3XZ
	NMU77TQoqo7fIZtQj9UGNgoDjwLMpewoC/UxlJ3+lJcP+79YHXUCVNZA=
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr104809181cf.32.1775117498933;
        Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr104808901cf.32.1775117498517;
        Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:37 -0700 (PDT)
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
Subject: [PATCH v9 07/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Thu,  2 Apr 2026 08:11:12 +0000
Message-ID: <20260402081118.348071-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xgnmnAT6cNuiY9fNuI6Ub3ly8Lwgaud1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXzf6uX2ExK4x5
 8Uox70FQWS8N/7Yc4hWrsTVZtERI0xBfBFtcsBAcnGyKo4V/FjA7ycMcL0/BhafF57BgLWwSOvy
 DUvT5qiUZ2I4LdyyUfT3wr9gbzf6Id94Bf646nhtF0vda7G1pKI9mgz4xeFzzzFGOPcNOfpSjGi
 6RbfL5ua/XFyIEJ2tA2QBBsr3HdbM/aBKU4aB+oOUN5BMlM7PuFz62SwPAr3Z3Mweo/RfVfbFFU
 W8mlhIlqZarVvBtbNLfd7f+XV20YlNDbAGmwRqOYWOefQqQf/q60UktLI4JSKdStFrJph5pd3gd
 +tcB36+axqr9DkwK4ZugH7upWJc3DsdCNmPN9LFc3IyRcAnHMCLHk92awXzvwck4wOrbLzfayA8
 4D2SKsqaCteYHy2fBUcqtH9ngNjtkZADYUymhWOKcfvdYmyote92PK4UgnsgVI9ZH5AGiEeM/P6
 WyWuyKwgnayIaZcY7Mg==
X-Proofpoint-ORIG-GUID: xgnmnAT6cNuiY9fNuI6Ub3ly8Lwgaud1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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

