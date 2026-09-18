Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5FC4FE2EF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738322; cv=none; b=K1BNMpP9wgb+EAMOpkk17V7FZkdXuDryeudvHHWra+PkCdKSHmYKb/gwUyEeKVxTZV5KTgxmqh8alyBNeKhdtwh4twFtEFvm/N0va4p24fqpr/s6LI+uNG1U20xtg6nJkE010pTfq+3HlMhSFvvFeUkXKwnyBhI9Zl/Ycf4/K5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738322; c=relaxed/simple;
	bh=qnVsk++1S0X0GRg3DxqeDr6O7Yc+8TFQ9tDUsCjeKJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4Oc+hLOE18gdQ3SnpdLMkmtO9miphbMBAq9gMuynD6SWHen+Aw+7uxX4jGz3VOWSlYo5l1eaUJMDejuTv3DvMYB4Az/GFBjMn1ITv13nSz7u/J8ctcrXZC4RIGzkbvceDYI0vs//tXHjsoGXBPJbaC7d/ZBjfiHSZV7TF1g0Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg+7XDb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOaie41I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg+7XDb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOaie41I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORc01711286
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=; b=Gg+7XDb5Xspqh047
	dR82E4z6pFEdT/IzkzvWVNUnubpVxeuDQVNDICK8edyk1wYeEgDWPKkdnj/IIhzw
	SkzMcEm7f/zdz2lo2REwKtU5vOQc353ocbTRKjGm42/qdcqHahGt50N3Xq94LRvz
	e/3qR3FkrL8D5miWDGXK1fXrqQmw9LG3rVGZhl6pmp0+hc8VTWMle02WBLkBDHRF
	XHam/bui5hE5I1Sy2WwNoCohBYFR6orrPSrFXk8i6+kxCTPSivGUt3iONFP0iay9
	1HKLP4kAqKXwFHuAPZgxuBhBvTnW2xweOBD4p2JSyvboaogv6BmpPdCnvz+LM7Oy
	s1Xi5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43c8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso1011335b3a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738315; x=1790343115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=;
        b=iOaie41I4YiXw79DZmKg9GWh8LZU6W+Q57Ta+7LxB5eDM1NkmxGgqMsGRc/T1rqBy9
         xDgCZpltt06ZESfJg5CqUphO1cXIIM7Lva45g1KjAlgf7yMd4442Ut2arf9/DtGhlUiy
         tX7jiZ87ivZ77iPSu7nnOQQlpGVsz9nH0YTw7f9eAcoIFNJD4ua8HHixLXHU5Elqmvo6
         nV8CaBJP9kuNGatzCUADt/fb+DLXIhDMEjuTj2i5cJ0kWMEuJy1ftwEfeRK5FyH5ajBy
         fD5ZPAn4Pqk/iMMMVSOEkeroVetHdFwC5W7CL1f/qID+TEWxMXXPBcfFy5ulf7DT7GFz
         ifeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738315; x=1790343115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=;
        b=FIzhDswzlaoLlW224bRHrDeJWBwCpX9FlzIHeT4d+mcq3t5QMaRZLgpz/QC39YhWsi
         91d9gJWoC4ISqRnpm47Qa1TITaLKoiUBSpfMzGaVVhTZHRpBvkjyuxrI/A6XakgcPu86
         zJH2uqPvDKeBY/vizqtDQ49A4cFuRu4eif1H/fM5s+dxz+vCSnpzjX5fngm0f7M9sqmE
         O1Od2cCVh8sTF37rC15vzfcMxdkRIqS/AcDfPle/apW9PHQul52MXmzGIq2p131CKYm9
         ueBhAeJ/s4vvaCqyY+kni86rB/+N+Jk5K1Yp7HYdAzjRT1CuyMWuxRKrqFrGN3bTX5uK
         mgdw==
X-Forwarded-Encrypted: i=1; AKwUvBxv16QOa6YDla4q/B7833n1C5KAhKWXYNlO07Qeioh+ISlQ6Dwj8Fp2Iim/vcTBMaH8vfT8m1CFg7Zp@vger.kernel.org
X-Gm-Message-State: AFuF++nGAVdG2fUp/Y8toDFBdZIrYhxWnpj46vz5SZXTbivgslCbhNmT
	XfJx//Vj91rT2XIiahv2rAXGdgrrRmk35Z9E51JDX8mjf+u0ijv9d+tbQmmBFbwfYq3iKalRK67
	1s5hhYP3NRU+KtSIVrCeFxfYt0XtJVqWaHHqPRpa6nGUpqCnl7N6IKoajwKZo3pWtp1izljwl
X-Gm-Gg: AYBFou3wetAmhvQ3uxELt2Gm6a15sim9h2K6Er6+Z95pIxoOs42ZZjTR9T4mXEjVSxQ
	dN5Z8vLHJOWhzaHBkeZ6duNhIWBLVoCd/l/Qy9p/MZ7EIOTihI8vhAqv7ZQZ5vP0LQFTl5qRln3
	DDAgVG0gixruCU3eOdPTGfFW2tVQMzk25YwjxUe6148hxChm34Lq4y1g667SYn83fWLzjW2enZs
	iDhn2wKeYX8TwsEkuq6uqHL89vkZbJB9SYoYvYgNbn4815kCItpheO7Ab/420bBKOkmUdeNum6r
	W50YQcLeUxuMc1dTARuwieXx0idPatopUBsOTpgMxm6xP2mexgfRtBMMBIVxs7NOZdZs9lcKaPs
	1+/8wKWI63FzfURUA7WONRxBYwnHXfpWwEp4=
X-Received: by 2002:a05:6a00:7702:b0:874:72b6:7da5 with SMTP id d2e1a72fcca58-87472b68141mr4605354b3a.32.1789738315460;
        Fri, 18 Sep 2026 06:31:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:7702:b0:874:72b6:7da5 with SMTP id d2e1a72fcca58-87472b68141mr4605289b3a.32.1789738314774;
        Fri, 18 Sep 2026 06:31:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:54 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:14 +0530
Subject: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM
 interfaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=1593;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=qnVsk++1S0X0GRg3DxqeDr6O7Yc+8TFQ9tDUsCjeKJU=;
 b=wIVV2/m0aMbOA2Q3vfmIK9vkB2u0NWHS6RsFoCIzhFT4x7tqdMzydnmf6e59+k2Sdq8EeqIfC
 EJhylQAuUDKAbhTY2pINc0StWDnOP9lCoa8P6cKm+gfIpXVCLv80vGs
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: kITzNcQjq79R8_6OH3cz2kvCe8h6v_Hy
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad3d4c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qGtJ1NKCSgfaheF0IAUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kITzNcQjq79R8_6OH3cz2kvCe8h6v_Hy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX7ixjNCzijNri
 fKl8v5ha6HWBd5+4m7ZX+GRGl3MJxA6lkPgArM6Usu3yETBWIi0u1UC4m0h/GvmPilbYSwg/gZt
 bpAVC+brgYCFhP9J8mLzhXq5v6JTYnJAIdiBJ5eaoBjSamwLoxC3Ty929bicif2lP25zYz78sNc
 KjW4sqKWusuOq9PHOSceUaipub7G9GneHIlT9nnTTFnreoC2QkWkkm7/NnUU1wMFfHdgbflixCP
 gQTEx6/7yNwvQRwRxRNVouuFPz56i0IhBCWKOcjivGSKeS32trbi55r71w2BAuBD3BpHAPeu+p/
 Dos8Pnpcoo+1vurXKmkN1IMTkxHEjdTU72bOVhhm1ACkjdIbWuWGii7UViIQS7YEClhBCIxeFVY
 SZ1nOpjdUiNAXt3v5n2hLKC+rNZA07qGJ8HOBOpoCi/T+5VS+kDWezbjs06aRnkmy6YfgKqPTjT
 9n1yU7koOk6eO9LkIbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXw/gwmv7YYWqy
 Q0cJ1YiYf5Vfug44z+yt7ZMgiezyu+hHDt5ZMZkt5pqks8bD90FGMb1Pce8g50KjMouapnTFDbM
 Aqee22WFSQXbe/cfFKHTetz/iG2kn8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Handle AIF MI2S and TDM DAI IDs in the SC8280XP machine driver
and extend LPASS_MAX_PORT to accommodate the additional audio
interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/common.h   | 2 +-
 sound/soc/qcom/sc8280xp.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index c1deac109f24..18171656408c 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
+#define LPASS_MAX_PORT			(AIF_TDM_TX_12 + 1)
 
 struct qcom_snd_tdm_slot_cfg {
 	unsigned int tx_mask;
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..0876b9be136d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -260,6 +260,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
 		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
@@ -296,6 +297,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;

-- 
2.34.1

