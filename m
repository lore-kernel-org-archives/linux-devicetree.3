Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D47301472
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649559; cv=none; b=Sv+KVM+uSkiA+Y+YZBABWUEKg+55Hc3f2b0EyZCfGIY2JyPT43DIm5ukSazapfbxNK2LhPhjfBdAZMzbg54NBcPRf1QkD4bcGF9Na/NTamsJhY3WFC9ypj1IZ2FNgawwnHH3dkuFFl5zFDPEcbiXnaGrPUhKawNo0L2BMnGOlXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649559; c=relaxed/simple;
	bh=3Oj2W0pEECsgpO0iuq6+ChxJG/Mvhptw7wJCXe06oJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3DTebPs3bHhaxC89CdnLHyg1UT9qQp37ru34ZZT7oof0JWrEftKiTUIQNDlH0IQv8s7fMkiYeoSrpogFejchpibZyvAUxwPs6xcY52wGoF/kwNIsNGS+N5L7at8L8LhgnO4f6X+BaI3/u5Qo93Q6MLcx9KRxAH2BHSo4/ogJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSgOxb7O; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSgOxb7O"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee7ffd738dso301350785a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649557; x=1778254357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=qSgOxb7OFBeZpF/zDPUpZQ6Q0x1YVhtFyri/uySXo1opYd4dTqbnIhbIZi7V43xUNK
         Iva3YLeecUyCMVQMw3uyGb9welUsJj5/eUckJF49MPUghiQRmi6ekDoIsmPt8of6J7ak
         qLvkjAHW2v0ivyYuf5fTaquJjbLfM713YuT/cGDF+xc/bE4KA6z4YCWCokZX20OXYw4i
         NnKIkAEytsN9OGGqtaaY5qcN/X5v9/4FiMnogL02IRPwFjb92qISXrB9/y8hkfVbB9I/
         aJO+UAEn0Y7r0ctcHh6D0PDUJhMi2P7LYZ41xlCNFT/34aPLSafJK2HGWW0FrnV3IsKD
         0eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649557; x=1778254357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=IAfJKtEHbPJn7XOitEcoCEotu7ku5xIjk9bXfDw1sTeniZtoM5c3jJlNpwcx/l4oSh
         aiRRTdQzphPeHXO0X3MxKk+KUfr7rk3TOyh1LyvSRDFRdfYtQ4emA4L+hYABipIEWnC+
         ps2z1kJkG8XUDDmQ3GXxir97G5fq8SOCdPf7lx9nEeXZuRoD+smHgiv98u0NftAKcQjn
         I/OLHPUz1IYkqvqsNUD0IqTgZ0wblEzUnSB5qDcbFM2FnXm/G2y86NQ1qy78DJmcPJSg
         YDgUk592HOLXlhqSBRMLB13/pScZ3ABaLU8JGwpzO2ZElbC0RPbI3BCIeVs1HYGLnRhY
         nAaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tLUvieNDHqIMbKrVNmmQiARkDkeccnmAVBVYF+k+xJiGR+6T0l0mTMlkxSTwdXLlGpO0GIQBIKbRY@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpf7U3csacfVsK4nUZQHkLZ4Zd8Dvw67ic1sqN3ORBNcdX8m3
	DryJUEHK/UbyB2U1mZcJzNpOb+0KO8uzRtwe3EYM7wIHw//vshb+7d+p
X-Gm-Gg: AeBDievJBS5Ntrs60AbxyetoZdzWSpT7bvisXe0P9HpmD69I0cY4JrINEaWeG5E7QMx
	OmGk0KNrNKQl7V0ezAUmQpUEaCPlm5hoa7fYnVIXM/KcLtr9fFGEiktPR8rlAbwGpCPPnmX3HgN
	hs16YfGeQFCJ+vWZNqzU+h2vRPQUUWcrCIyA/z+19LaOvXKLUfDbR+2WPl+0pGof3acVSzn+Plb
	DKTO95bB3W30BlDksprGqz/7h0Oq/dv62ISJAUAFBffc5tUXZmkAgp0iHxeQhJsOwOAVtfYtv5T
	oe4G+kDJlpsJ6mZlnwzEPXr63zjj78dtxzGygeib/nwMKKxnMffLlBV3tkdCtqS6suSc3vp9rYO
	x8Gaz0WpCb6ND3QFbCokmhSOOLDkgia9KOUyNU0cCH14bETmuffnaoc1LCby4DhEPKx7u7/SSiy
	ZFGqDliWjo3s0YNkF3/p0JkCKHflvcj3foBou0
X-Received: by 2002:a05:620a:170c:b0:8d5:e63d:95b5 with SMTP id af79cd13be357-8fab872d2c7mr1002912485a.2.1777649556985;
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186846585a.25.2026.05.01.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Fri,  1 May 2026 11:31:24 -0400
Message-ID: <20260501153128.8152-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..b8f1c91725df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case INT0_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case INT3_MI2S_TX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

