Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978483537E5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804630; cv=none; b=bIS6hyj9uDiqiinxCzNvlqKxiBWuV+RDHjwtvV1lPqW81IGmJxGINlK4ACqF2fzmhIVOd19MqGOeskNDxHPK3hvAiuWKb7ZQodOsBwD0tzrmnUrgMWm4PQ4IdOeRnvDqAbms21CGxyDAsjlpNQDmWyZT13qRqee1JZ1+pct6LVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804630; c=relaxed/simple;
	bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNkulzmmHpW3NxYFGNEuNcTVc8LipOcSpIvGmTZplH2NVEK86XoGP/DsA86upNb5xaTKtMFbtRkgNlkjFyFSANQs31lgrah50nXrgH26Pw1l5/w1QnUEmYXWfHwbqE1D05rXXOkHVisS/5Qc49CrefoAkdz4iXT9TodE/ontRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q64BUtBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzRrZ1tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q64BUtBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzRrZ1tg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7sTE4015922
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=; b=Q64BUtBxTRFwPL8P
	plsoZg2S515PfXEVHzJVpgHJsCXxE7Q1miZRG2CdcDvPYbsSQD4PLLFTjI93KcMz
	4ROHwm3fzRHqCkkT2xbHuIj4fpxizv1TCEXOi5zRq1pNN3drVYcvsOqYPrgN6o8y
	4904kfTO0yNPDpNyb9t8Xz8TU/UfQ9j626I3tfVXzL3cuygXIGaDf26jwtTEX8fW
	bicRzUi/6i3YlEQqPdCq1eN/tlbhJSE2AzNhIjBwXiN1FjuFWx93RyN4+n71Ok1B
	H3oXCEQy56fK3p01oKoJ4gjAbpf4h6xMnqRjpQMD2rC0a6vkXZvoT9zluQju/4CF
	uXcNtg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw224rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 18:10:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so5190025a12.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804628; x=1789409428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=CzRrZ1tgVG8VZbg0Rt6nyuNzFeLqkg56ZVHTr7Ck1Y44XwAU14TK31xQsbviFjvQ3q
         dGEWx02sDmYkLntgqxLsAoYnf36y0hB4aivO5MSUNqQmWj0W/7ZCbEhyCQReBvNYH0Bv
         TxzZJ+GOY1vEJxYREabMWT66SFjWtQZ+bXc2jHNpzwIE9RG3WVSpcMEIgSomUFoNRKXS
         Ap1qyVJwYvA7+VAhU3+3S6LoiTDeqDgk0jTtGrOQ/NOP2rd9iK8tCApTPljPHnJWeHZ9
         qn7J0BeJNHatwl+2UQNDxlFaU2X3HQjRP0qA50uTK3r7Xt7fvobtcz1Fc2JgV7oRJQt1
         aUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804628; x=1789409428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=C4LbiZoZBRp98J3qCJ7ylvkengvndQZ6K76ZtICLB1qM2hLM9uR8mZPT4G9IGshmAR
         rSI306JysAnplpXhCP4mUeS4EjTQkjM6USIMaUdUfXyXUaDXJiJku7CQLrt9+iN8cssE
         OWg/mfxsHA8sH70Qd8ROswG1BNn7u4zF5Yic/XzW83+b3nSbrJVsFHmFQr5WT4ClRz2E
         eeaidGu/fCd5GW/zGOZE9wZ3Twcm/d/iBxipVonhAqpuR0I1JbwNua5aDsh8Rd6ryfuD
         2J3jIyhYozMtyqmVzN1W2A6uWwHfefzpTrefd6fN1K2yB95YIZt+qp5/exyV8uF8LJ/V
         C4cQ==
X-Forwarded-Encrypted: i=1; AKwUvByfwsOhbhE/VXlCAIypBIRFb8RoJgcE62cs0X//6RvsXUIBZVxH9CTrawl3Swd+axN9neq2P4qFOXgz@vger.kernel.org
X-Gm-Message-State: AFuF++n0OjtBNKZ/7BgrktsD4gQ4dAjcDImnQes5A5BJasc6RMevoP8r
	VbBKAlGDrAqp+8enoTVJkTlWgJvHQNoeHBJ72/wEzaautjPjGDeI0r/lV3H/ZCM54JUkMDbcMly
	1+3KENzZWq3V1QJ+ABWUoWVktrjreug69zxMqm9IncXyNcp7GXQAKCSt7QUI543NP
X-Gm-Gg: AYBFou3QBR9bp7tj7Z148qFEA3T2mWHQnBGxSa7AYrDEmI6XGG2fFaFqStAvqfLjbP7
	a+6KuG9N7EeYOxsL8nthRCGMikuoKYIfD4bvYxjQFWeddswHPxbtG0PaNCxSeFcg5vdgoa84MjZ
	tboAi6kKBjexMhklS/6NOHiMmr4uwU7EpjkHqWRf3vLlrokZWXZniFjL0Kbv+v6PiuJzJgsraka
	ThMWjgDyCIJtPYJec651/DpuTWmY6blQBlbRLv6UqlKog2lmhDW76vMICh8YfM6QyujTCXyNUpL
	eJIWYZvvE3VOSsuTyP/3vNrwxwrQ/nqoRFbZn6o3OJi884TZ5pAWzg5ztRrSlNGsa+HjxIBraaj
	/GuVY3n8154DzO+kRVy6FQ1BgSfeMt5lYVyS+
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307970637.12.1788804628247;
        Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307902637.12.1788804627806;
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:44 +0530
Subject: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=2155;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
 b=tXG6U5aLLaHjGg1mY3KIPnmf1ncikfJ7KkwbNwcX5EkVTX9x8A/tFB1OgeDoA9wlPWRIgmICk
 EyqlVwHN3DyB7vFzQFWXBWRqx6mtRYhgi2Ytm/Lv2QERLaGNKQX+Rxe
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: ZRNMzLKkM-WMGLHO0H5h8Ha2seDATlpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX/kdQdcg8L1mD
 +Gi6ChQQTOAiok8lHxPbYq9foqkR7+DL7v02jRZN2231Yb3eawzvdFchGhIdTiBJid/BWkwakvc
 N/E1VNshcITf9gXL7vJLjdVVrQ1iRHs=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9efe14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cGfOUKfoVt3f02dCv40A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX/fQk0WC12Cmw
 NlOGSnDOl5N0hPxDf0mRcSKHwTNSQ776QNiSXbNFbMg1I0xAnQPVzgpK5hB0Dd1dkqI6ZSYi2EF
 6lOIDDHx/nGKzGU4cBsTvrHCguT05kXqon6xRQP/ItPCX0kT/PCftDEJy13gEYCIhJxV3WsmmJ4
 LWAKN70ibMNTky4Wj/6KC0vkcO3OLATg6szvlrKEjGqZfrJ7n2KcnPocLqp15s9oOFY07DLp3I0
 L34wW2kHS25QA/iihR5MIZNg2QKGKp0bRod1Lwfz2IHlJ0B/ys2SEmmuNyh7i67rHeMrSYJeq4B
 qqmGIWpCuZD1dKUO6an4G9mSL1QFoCorbxRa2KnrVKyfbBO4nEe/NaIFTFWilW0nlI6qAnIn2PG
 jgPaAM+fL0LusDwfT6g58hPitqoiedNmgBpp7j66vYgSA5hjS5HpuC7YjR0rNiYCyL2vRSiIxDj
 0167jZExYLcVJcMu7Iw==
X-Proofpoint-GUID: ZRNMzLKkM-WMGLHO0H5h8Ha2seDATlpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

The PCM1681 DAC requires the SCK (system clock) input to be
present for proper device operation. On platforms where SCK
is provided by a controllable clock source, register accesses
over I2C may fail when the clock is not enabled.

Add optional clock support to the PCM1681 driver by acquiring
the "sck" clock, enabling it during probe, and registering a
managed cleanup action to disable it during device removal or
probe failure.

This allows platforms to model the PCM1681 system clock through
the common clock framework and ensures the device is operational
before regmap initialization and register accesses occur.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 60fdbe5c4e05..cfe549176d14 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -74,6 +75,7 @@ struct pcm1681_private {
 	unsigned int deemph;
 	/* Current rate for deemphasis control */
 	unsigned int rate;
+	struct clk *sclk;
 };
 
 static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
@@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
+	if (IS_ERR(priv->sclk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
+				     "Failed to get sck\n");
+
+	ret = clk_prepare_enable(priv->sclk);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable sck\n");
+
+	ret = devm_add_action_or_reset(&client->dev,
+				       (void (*)(void *))clk_disable_unprepare,
+				       priv->sclk);
+	if (ret)
+		return ret;
+
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);

-- 
2.34.1

