Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01394459ACD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763753; cv=none; b=VYBmF0/BjMCfoamO6vdRdm3IlUP0QiLrv9G/hikBldKCCoxgRWA4BY6dCsEyOcTeimVOLRHDZVCsW5B37fX1cJnEUHLhphaxEeBIwPootSwAzoiRCNZR/TiLdUO8c9pwO/5dX4AJqjC3a7nxNWc9k/67PFDfkQIQ2kjH2PRoBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763753; c=relaxed/simple;
	bh=kklT4BtGmbxmXXl5fIL1oE0W7MuVDXFCHQeH+8hoyJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2cYBpb1Lryrd1pwEnH3aS9fw9F0HrLBXc7x9XDujLVMHjgIwXxEE1fnZp1PkwDEfpXZMyniFql3qS2X9XPF8ErPlpQsmrVQRpMpQFC8YeFiejas8M0ZRDrmeM6GEEm27KFk2A5DHAb3lXrMGx725WgYsRaUoHMuCIxlHibDQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5s9REBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxpUhsaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5s9REBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxpUhsaR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnmTY3313176
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o3eANFp8vRp
	iIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=; b=F5s9REBFpAnFfykmMX0iKjxiumE
	Lp7aLG6k74D+etcM9W/GRp4UhkJE5DSqXaWGUdT2l20vDm4NzQw9zSnhGaMF7HvD
	6grs8gG58yRHPvNCA2QaobMqxlhhlQgzNGd1lfi0hdYEqvoPcvsZ8//N2UG2PpH6
	LZLyuz+JR+YnFeieVbSJGu5T1goc8VoAVXZFRFAxbMMRdW0yRHjcrMgG7cUFXgpp
	tP61Wl1BNOAYLkf54vTbmNtbFHjJHPkfUlLJE17BMPzsgvGbzeazFoTAgel6lGCm
	oNIliTH8lsjH/jVj2BtwcoOCR5286lzk5SkIOLWhZ8BGTahGvBcntT9T04g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsate-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907c59bd73bso1330446d6.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763750; x=1785368550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3eANFp8vRpiIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=;
        b=AxpUhsaRvQ8FZXTw4IA/vPs1SK7WpPUcXloyCh3lef/VCYWw/WyTRne9GjDNdwRk9X
         dwWkxyPRXJh7YS094NZLCo8Tz7jX8IGtvHAGoUBEhUcmBF0Th4wUs9Xo5UofZa/oAubj
         7ouOKr4L31Km70Qyt+oP/8F97OPHFVt7VIDzgVRSbrCiPgvBxkqs7a1eZE9ejMsgprAy
         j26Fz0EpC4dDue0GjVOtKCOR4xbBYjqekmC3wZQG08LQXMSldAUEjTvv9vzWKb7GWadf
         RgM+uGVpn/6EU6YbGvOxHuQbEhHZo7obXQdVEZZv/KrPAj1ddl9FBFv2cvOWd0DjNIFC
         BQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763750; x=1785368550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3eANFp8vRpiIPxEwZyDYsYfAkwyo20ziwerf+wA+5I=;
        b=bFfoQcJWMDtsUIq5ULfksICJGjdBtCQO4UsKwjM3SxKnLVgujiwCSbYQhszDqyRsJ+
         WzuHC/ESmEalLuGQLXu7GybFa2CrHeTZZfBC+7Hp4YKPtC85HAF6jBOmhvTx5WkouoNG
         xwFpxTCpbKwdAg/DUJrkxf0YA5pN//C/kUPss10DmERkkk6yqK476GyPMVytrssEOg/3
         44fV1lUduqkC1DMyscHVIgr6YGTDSzomFwtn7Kd0tTG5umN7P+op/GpHx0rjyXS26uzV
         /6Q85ntKlY/MzocAONV4Vh1L63a5pN+R6Ey6ZtPssJMft7c+qx2UHcjAm0PL6zhL+n/H
         6p1w==
X-Forwarded-Encrypted: i=1; AHgh+RpyHH1ye8fmpUvL5DpTEIeD/WdnkkylFUfT/pnXIJnFAAyk7JnJHpemSbKdfQdINwWVuYvnp8KORzr4@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTRMGV85dVorMkjPk+YDeJiiQRuEsdAGuIYvXfBQqozHviAk9
	HMBe804SdpSvDyhUBqpq4nW6iOAsNC6MzPeq2wTnfIC9FXEiQaQU5yeXYqknsb4qaew9ULx4pg2
	z4GV8T6thqZcOJXZ4JFL8cR4ckr2kIzxGsV1diIj1CWZXhSXI3UwasaIZi4mKZz8/
X-Gm-Gg: AR+sD10M1ALaMsB9Rn+3IMsJbvuDubmKMvY2oV83Hdnu/SSLYtD+J8BgmwfKEgNHxMH
	7pAXmyeEkY787/BqlXYtl4iWqE1YqnjzuohAs00KM10/muhrsCgALX7gvRz0SZyPzNRQa20AIOy
	cU3Xnhb9U6vx0bO10JTWNnYGU0WnPDLl15cISB/DzbLBsyC3mJyExTvSbOUdjPS8YidfbgtRnxJ
	6C3zeKRx42fhtq+dAk2lC+WMRuUZ4gasNU0UywuTl7jBy8X19tixLYhXXZ2szO1wCAzLzDVwHKs
	OzczIBXYp6bNSh0Oi0Vvg4E2nh40zAq1khxhMqlBjYY1pnmf4XpO+n3d4QyQE8Hi00tqB0UPGtF
	87jG9uEnipiFGHA==
X-Received: by 2002:ac8:5807:0:b0:51c:7b12:1218 with SMTP id d75a77b69052e-5283e0419dbmr6401541cf.86.1784763749840;
        Wed, 22 Jul 2026 16:42:29 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:51c:7b12:1218 with SMTP id d75a77b69052e-5283e0419dbmr6401191cf.86.1784763749318;
        Wed, 22 Jul 2026 16:42:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input Terminals for OT DAI
Date: Thu, 23 Jul 2026 00:42:11 +0100
Message-ID: <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7cX-Z0dZVaqoHBifu2b4rPNhnqFqT8qG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX9RTod5vvUte1
 o+O6EC6DPlwtxrOO1jicY1Exqwk8At0tNJCD0x/SVq7cfzJqhL9qJyv7QUP8eINouVA8iB9qWPm
 x+/MNMg3GojAWYlioHiINauobGFcKXA=
X-Proofpoint-GUID: 7cX-Z0dZVaqoHBifu2b4rPNhnqFqT8qG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX9QwyN5uXYhci
 AAYQxQ/DmngPy5yktuPdaJYTTPoqwox3zIpB7KbUovptj/DTcAH6lJ1B+fcj09KBufEQwUAF0/m
 H8mdTQJV6+/HMr7xjBjednXUca0xA+iGY9ANio2RduPtGwDSQt18vvWonS5BzzuY1gIrSSwFA1S
 CnjQJYlFKzRMO1M84G8p3L+RWCDuh3QbBHXjNxBFI2Tqr+QOKXrFS1qVi9KM2SFq7s+nCIRTn/p
 /z8PtkD8ogTUn3uW+0heAy9MR6YhpVdyavDn1iMQw8Ir9NgCwnTa6dlrY7WI+FrdvV4vPA7FLqS
 8T86ClLz6BvfHKZuRsM1s84nImzXAnhKQXyJHC4i+PxcW5fmh3h+CAN3TGhlFnZDD8o6h0n5Q0y
 5R6YtVABGSwuf9QrWbugWSJXhSGlxhhyuVQUy9EsQDZAhi68k7jyw3Yy2/xY2NrwprorZWCE/oc
 YBzjzu//Owbs2Qbqbxg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a615567 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uD0j0RXNaZXElQmVNg8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

For a capture stream the DAI is the Output Terminal so
sdca_asoc_hw_params() only programs the OT itself: cluster, clock
and Usage.  The upstream Input Terminals that actually source the
audio never get their Usage, ClusterIndex or clock programmed, so
the power domain comes up but no samples are produced.

Walk the source graph from the OT and program every Input Terminal
reachable through it.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b4dedba719dc..ac688cd62970 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1726,6 +1726,51 @@ static int set_usage(struct device *dev, struct regmap *regmap,
 	return -EINVAL;
 }
 
+/*
+ * For a capture stream the ASoC DAI is the Output Terminal, so hw_params
+ * only programs the OT itself.  The upstream Input Terminal(s) that
+ * actually source the audio (e.g. a mic input behind a power-domain entity)
+ * never get their Usage / ClusterIndex / clock programmed and stay inactive,
+ * so the power domain comes up but no samples are produced.  Walk the source
+ * graph from the OT and program every Input Terminal we reach.
+ */
+static int set_input_terminal_sources(struct device *dev, struct regmap *regmap,
+				      struct sdca_function_data *function,
+				      struct sdca_entity *entity,
+				      int channels, int rate, int width)
+{
+	int i, ret;
+
+	for (i = 0; i < entity->num_sources; i++) {
+		struct sdca_entity *src = entity->sources[i];
+
+		if (src->type == SDCA_ENTITY_TYPE_IT) {
+			ret = set_cluster(dev, regmap, function, src, channels);
+			if (ret)
+				return ret;
+
+			if (src->iot.clock) {
+				ret = set_clock(dev, regmap, function,
+						src->iot.clock, rate);
+				if (ret)
+					return ret;
+			}
+
+			ret = set_usage(dev, regmap, function, src,
+					SDCA_CTL_IT_USAGE, rate, width);
+			if (ret)
+				return ret;
+		}
+
+		ret = set_input_terminal_sources(dev, regmap, function, src,
+						 channels, rate, width);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_hw_params - set SDCA channels, sample rate and bit depth
  * @dev: Pointer to the device, used for error messages.
@@ -1762,6 +1807,12 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 		break;
 	case SDCA_ENTITY_TYPE_OT:
 		usage_sel = SDCA_CTL_OT_USAGE;
+
+		/* Program the upstream Input Terminal(s) that source this OT. */
+		ret = set_input_terminal_sources(dev, regmap, function, entity,
+						 channels, rate, width);
+		if (ret)
+			return ret;
 		break;
 	default:
 		dev_err(dev, "%s: hw_params on non-terminal entity\n", entity->label);
-- 
2.53.0

