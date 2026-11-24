Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=urQ2YiijBavCygcnHjnUTmgSxdS0hJXAB1SgLJuhTOjPkAqQQ2ve+3OTXOSv2YEJmQq5
	 kA9M2zqQc2DKS14KSnBArewfMQa56XTCyyP/gblsJ0FAq/2gQXQ3wGTioR232d7DJXmyU
	 r78hWOebpZMo1qVE0PBA3d8Pk2RSz7TI6wzJ2yW9uify+ngWFX2xGbH6mEeIbY0SYPI2f
	 y8PhHll+UYjdfca905297gbUTn4SIwdgdPNBG7Q/W11U1t3vfE3Vktl4vT4YCeh33PI59
	 3EjDodxNMyAKdwgmYf8AbjArRT53aPzop22Pi8lDG0onNcGqsg0GPgkXdqc8tipAlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
	b=eU1WPxdoT2cxSU7BDMsUG3w+o5ToLCRnIe49rIMylPePa8WDIS+jS7hczjIAaAXXd0BB
	 CBAX8fu2EnHTJh66aRyzNr5k5F5aPQl/ByHfXSq0IgoWTEg9sDbz4JI5l7DAYPIL6YE+5
	 eLz3rEaBGIlz76Upr7MsbCbsT/00JKae0M4rgInvUPskcUaPBIHpXZsBf5aCPBSZthr0h
	 BAShmkfF8t2UzPChUlabQji6Mfe+8mMrjGSDttkoNG0dK2zaEHp5w85INiXtyO13QhBDL
	 GG5BgRnJ/uMej68GLgyypyVp3IfYvrw+jJE9By9uamqqfO2ZdIE21z/Gy6twWXlJpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5jwhpik;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341560A2633
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8341560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5jwhpik
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so37782245e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541548; x=1796146348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
        b=V5jwhpikyXwu/TXPNnfM1qHbIKLQKEJ18I6Jyetz8ioEGjyMvttJvTbSWpw/1A1DWG
         NDYufi8CWtHfwzVQlxOdandaoeuFnriX1OfXZPdPU3bIyjBjn1V8dQAq4ys0TzzToR6V
         WWuxZjtS6gERJiarHRLkD5ivF7rIxvZs2rVUvK5ZSrXNZjpygkYmecGofV5arxMBVBWL
         AHXWyITCruLEP6uVL89SIi/rTKECXyml++jJ7DX1+L5abkSyedBUsm6QZwF+a2KcMVFK
         BRa7+KTXs336rqdTq9W7+NNpMddb0L8D82GWM/yfePbuOJEnM9KgTNrgcHIn+98iyBbP
         FCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541548; x=1796146348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
        b=UwakmXizLM1ZlpypJ1tclYWwfGKozJex7w6yoSnQxyxZYb/Jaofi4/T6ANDEms+FnG
         7WJm9SiKAZx17u5w/fAQoM0gYErtV3R3GWnNEPGBtcj6uenDtrZ1ORZAOfpRb0IKEpK1
         Q5It9Yfcrh+V4+xmdsq20fvmuPJvAIivL7LB+vVGa2GctXbMuNCikUZ9v1tizrHT1Q2z
         Tb7+X5pBmvZL8EqIGyrzv3FWb9wPcEH+xzoiDbuVMrNvP+WhbUcgAkS+EC7OGfyffrkY
         ONTceZwzymLdNsxhbRdnxN7vqhbsfGoQdJx9SMe7SMbWtmz158apqJ+7HtovhZBgsXa3
         B9Fg==
X-Forwarded-Encrypted: i=1; AL+hErHsKnplMoXHhfhED/wteBFx/nlGzCQoiOH55+SmROk//tHzl7cCS3glEbdRRuemJCO0hUS3viU8IUhn@vger.kernel.org
X-Gm-Message-State: APuU4Z93RLU1Ga8S9apPSVqm1JNYdi/6wDq5/pTcqIS0rX3hzQZlO6Dl
	Tnx9s+E0Z5kAfW26NNnRDu8WqHbmS+nHn8E6e1qq+Xr7YQ7b6G7fa2J2ekaxRUbKSHc=
X-Gm-Gg: AZFdTZd81uqax0wMUlPS7Q1O+V9fmQSuoCBDOl881pEIks3A+BglQlRSomxMcNjM/Iu
	7vuVmtVec7SN1d0udVm2dOkS9GsG3SJM+681qs1x91Bj5dmXHjcbGwbv/ddzAtpxJmYE+5GcYt/
	Y/qPLLyGk2nK3NGXEuMt93rpJAcnw/8fTJgbtMb7yy/dqIp/1QlLEY2P0+tV/WUhebuvxsO5oQE
	SzdQLr/V3DAQFyPIyZiN37LR2h0Px7SjKzArs6b+dGwFjZKev+JYJrRj4mrR0r7P0KRIrx7qN0L
	K2bz6Mb9GRe2SbPaZ+LtJni1g/0CfhxkgWZJVrdZSaVmQ8IuVsQJaNFPDbln9VKn75C0DfdENuk
	TGzkbq5KONXKSQk1GPZ8n5eAXzrB6A6l39yS5LknQSFRHQ0WpI6uhB5rs+xvlSd53xKHHcv3pg/
	7hafOjhrKO3WpAwO4P/yZPKyL6FzXVgJxx5kbYh+WPwuj9n8HYVQzQaElK0M2yGxmT8Mqmm1acl
	/v0PsR2flCwW6nV6XUo36/XTrtH07qJO0DjiO3J3BGEg9jyNlUccNmFydsZHT5YNwSLBSbezFUW
	bSmXZ40erqIQ++zjL9E4M/sNCYYcZNkC9Zcq/rwIphfPEtYJsA==
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr372919435e9.23.1795541547810;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:15 +0100
Subject: [PATCH v2 08/19] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-8-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pXnTVAJqMJDc+ez9ePxnZpJ1MFfUD+R6xCuBW4vIYFQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcodGB9I7riwXAp+aGDB5k5XeXbhAbXlGgaFTIGg
 Y8+JTsCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0bc0EA
 DI6fycJ9LLgLoXLvvmfraq+keh8lyjQzZxIstq5ye/jBOGLp4pgPnXytFbeYtLpA6adA+r2sp8k8+b
 53Mf9PGjhdSTmbGRsu7WTatMN/ubrQ/OpLXx+RXA2DI6CDkktohBDjuQwJZx69OhJz7U/ARceMTegG
 Fa3cBO8PEe3ZnbbIXvBjK/mkEWThwoCaYUbJpbi+s7HpU4yvNxfT0EIje1JdhV8wxxA5odSyIN47jD
 5Rjrc131gWsAL0ReaYhiTNUxg0ITTSV3AtALZTVwSNulyi9y6mCCwbrtwZHEbjkzokny4TVvdy3g0c
 8xFMV7prfziCH26ydAS+sooH+uO/m1gRe5ILimo8zE6NiIylzukT0jIQ2VtTu99bG5v3NIONVKxdXe
 +R0x2u/o6J8i5NXMIhLK8TIHWvIWMRourXiGmQXCzpkS7a54fMBfFuts8AzvY4qb577LKFpfjZ7Rje
 Fg6Q5Eg/l8OxjHyBXxYUixHFb/bgIF5OukAuWcILTLbVzA+xKJKPjm6aTvntvgAAcbL0+RXzA57jbQ
 53ddUGCeTxh48msDKiJPRNtctGxsYH5mM8l1l3oXH+Qo8Il9psuiGqnIH7Zw77hYKXjULKGoDc9jwR
 Z4NmIDfYYqQoY+kMcT/0C9tsQkUs+jOFNmH/LLdSt4mIafAHu25hWgU86SKg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5fb20e284afe..308910744223 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1072,6 +1072,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1

