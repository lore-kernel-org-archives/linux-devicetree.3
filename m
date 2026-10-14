Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1F4DD3BB
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969245; cv=none; b=Tgt5kzBpaMafcNOQEdQ2b3HJy2gQhx6WvnDdU2MEpKI1s0orA/GpOtqDAhdv7AMMgcJozhe/cp41pZ+lydUuLLkOGB+WeYlPh6LKy3uHA6lo/Coea8paxqDMonDFZ4B0W2DwaKXL2WcO9MjiW5J08+6H0+Hxnu4HxNVIxSeUqyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969245; c=relaxed/simple;
	bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sACaeKRoTiu3rtoeHUWzIoyikRJAdTct6av9A/UcG5P9k/WV7/9wwvD5bQuw113uPpeHUx4vjwM3GVfv65hG8G70urRStJVbD4bxuJtFd8aTqGY7KyTq7etoJOzFgxpNoWn/J6POrCJKcwHmMg1lsll7hyQjQJXNy3LlPs9wmvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYc5CdcX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1qHvTev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYc5CdcX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1qHvTev"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7lpFT3017598
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=; b=CYc5CdcXpKqwx2LX
	m9aHXErRCSg5SUGBYN0hLSYl9jxTIv35/IkMTetSdvYjCfeGA01Yor0uy8amuc2s
	piZhkafbfQVSc0+g9jQgLh2cMOPTbKH3aUDt5hnwc2F7d8eLaVh3OeRtecw3taj4
	8jWy8ktfkudE7EhoBx6gY5DG2LPBSfnGRCctK7/MgGe9lthr5eeyPDDuC+HcmDAA
	3Dhl1/qxzWeFRLy0ClPXo04ZbZ4AGjQbNNHXvjtKgBJBAUfO34XXce+VQa/kAaol
	EW6NoSiXh2iCcnYogb+86xpABJMHWxfRk/2ZsSy3N/kNN/9BsB4fEvs12MGCQmPu
	CF0P1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3g4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e80f7acc67so40858865ad.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969240; x=1792574040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=d1qHvTevfWn9N5HrsRyc2DBxYriTissaHUhc2uJPAuZdB1PpAb/K5J9TzAWYZQtvNC
         LCZADoU4a81XT9kIeC6xRMRN0GuNguIxOoe2zV484PYtq4TaiSVHyAMQVDxLqS1thcCL
         pI+yeB/V4eYPGBFBCyHV7SkmxP8NOFk2Mn973EAkJc5ZOcBc0iSWONWvUFjHiDemLZoR
         5gQpwOmwcOAv2ypK6qYhNqijWHKb1e1s5Bmg4FmDKiNSJtYqH2HwmVgd9FFstJsTLxe5
         zyBpFkpJTcPcF73DiOplhwIaqVoRNsTXe2/z7qozYoMAvRKBMyRUz+ukg3lg7382W1+V
         RQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969240; x=1792574040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypr/81MA1en+4T6MDdNE7UBWj33JC3lzWIfnwCPJ6Q=;
        b=W9IND84qD2KZwmkW1RlzKeL1myZhfCw+w6k9QHJktbG2NdXT9ruPjGhVuZJD0Bj2rh
         NjEBCGCBcoWStZEYKIEtutOqjkfNWyVqMEGXGz07otKFB4HnVJJcRuNkv0vSoRb98r92
         7YcFRiF0M+J5gWtLRWlcRikCJo4Fr0F+H36Qg60iidh0uPiA12h6tw5iGJpfMOnb2RiJ
         fgrnczLBJXXdPT7ZoTOVvKWB+1Auo/pn4Bj99tioTHF+fLbD9awv/dfYyTcBd/LTqx6i
         y03TjCvcppO4HMNSOlqUvRxLEfiWN3LmyCXqcImJJNiOvxyxOsCsS08w+WrkBOlgGek7
         99GA==
X-Forwarded-Encrypted: i=1; AKwUvBzHoUjdXJRWpmZyW52p8FD4Uu/xANj5Qd64QVVFlB9kBhzZKVZUGdZdNpaYFPJDZTmNiP5zY7TTKv9j@vger.kernel.org
X-Gm-Message-State: AFq9FYIJM8JJLvMZhFRKbSnOCsFeI7LlgXPZVbLBS54/iTg+txJL6xSC
	BqF8+Nc2GQHlLiIPFPnTwNko6786rc74ay2d/bNXavEaJbV3LbY5QM2sddO5ZByZDANbHCgknp7
	YjRkNw/Uyp6He1kPsJ3L8a097tbZpXi82af21+zbOV0cV4CsO8K3/GFfQziMKv9lsihhslmKT
X-Gm-Gg: AYBFou2ih6qCLTGM1c5bU3TI3xbS+7dO1X1ipKWvHyQOTrTBCAz20EgXxa4h1QhopBE
	yjD+B5i8G+T6KWrBn4rnF4AmpoGD8D/UFYVEWybs2sSmB5wdh2aj8Eth8Zb3Q8l5pOrKAgFij1O
	gC5BBbNddiHL2CjdOyAE8MENpMyI5EHf2ZyNEckvu2Tse4l1NsClMoOqVQRzp/E7XxE9Veil/ja
	VKAXWFAEKJDQDNwQL51JNgTSIRzovAd5Ccnxddt/ibLWVMTxLivyJTKXQoElKa1zsG6yeeybExq
	I6dXqH1KZEbrL/HfbCiFqRacJWAVrbB3LNRcI9gtt9qlbBxuj51OcszrvmMmcjRtyEVUDZnvGna
	5VgLwbiv7HDI0pw995q/e8y3ucDf8t3lxU+0=
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675605ad.58.1791969240101;
        Wed, 14 Oct 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr103675355ad.58.1791969239582;
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:48 +0530
Subject: [PATCH v5 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-2-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=1032;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=oUcG6hWiHKgVmRBsl03kZHtJ+9y4PxAqvuNaXBrwIjg=;
 b=Vd4dWRz1Z/Qkp94btMwxQ80xUaetQniWi4DQObCli6LiUTplYj+/SVP+6PNowZfAk+6X7UthW
 APfUQham+XRCOT1uHGxWRUz0BOEOUhq+R7aoQWXQ754di8XWBBDarl0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf47d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YjHJVI_mqO-O_fRmLKiy6fuy-TlxlEID
X-Proofpoint-ORIG-GUID: YjHJVI_mqO-O_fRmLKiy6fuy-TlxlEID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX2KUSDAGx0Kxt
 BgJUQROX3gG+zYiXUI8qVXTs6dLdIoloPEsJwwq+uWNppwyzKIvFQ9zgG1qGtMPNAieOIZ1uBNM
 +nk4msegBiaeJqeflcinhMDK8jloweu5oPVH1FdhRk02XNM/q/00UAdagHD2hj9krA9KIWirlkg
 +xE4CiAQxTa23ET+sSQsQcqHrrsMvfrtjVbLczhQLsMMWjaqj7VVEWA4vbIkbY3/08nAFKTWK1r
 iqtcqv8W2kSGJnwdmbCJUVwQEeiOnltMrEcUHIakd7+nIZFTLeaCHAfa36hsQYFnnlIqx2pYJ7L
 PwPJTL4a0/5zkrg+4y8cDtW/a2RxdjqnS01sPn3aq/OnygvvnkFv45Z1glJzlu1rJTP+50AXbQ8
 PTE/BdLS+8SQno8K9wB148J6EaX9kCATR9QJO/euewbnS4fmuBMGEXMh0eSHqHZ0i+5sxRNYMPp
 WnN1FQoj/bv+85CPOsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXyL5I9sgfF21i
 J+MCACUx9n7tW5d0r98j+UKCv7TtVm0sMbqYWFGcrmqzNwU/rjtaXkSniYfwQQk/tQblHv9x06s
 Unj/ttXnr/YYtC6id9MhntVhl+uvH7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

