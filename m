Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043E47CC71
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984716; cv=none; b=CnBpRCwEaKAkosBs24glmo4V0TcuH0XGfUUkZtChUx15xQjz1pKKMvn6g+oWE/4PX0G/jCeu0rEPSqWAAZLN58ATa+QNlZ7NKyaxfdLheV1gG/7sxZNBZbZM9lFao4ruUCJqMkrZOFzX6zoGaj0Zfx2vv77Fkq+Uvi6ZPQxmkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984716; c=relaxed/simple;
	bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaDezIYfxcHUd95ULmoKKMJpWGoMR+j9AmVwp/AIk2nCXAkwvgt4yfXAs8J2BvslGISZCKZqGiEZzG6pWHS6UFzEE0RgX/8Yk4TklrN/k2b+i+IupRpL3X+bTKiBs6t9xCss8SFxrKtiGM/E/jSFIlhDgi7jO5gFxyVe7n65hdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqGS7k8T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqGS7k8T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47122683cf3so1176651f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984712; x=1783589512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=ZqGS7k8TUJ4zj0ubR5D4n9EiN41zmLUCRcEjxVdsnv0tZtAPTovzDGWbWHyEHjwqpa
         T8VyhestgY7tC7bIaKN7CH9InPmFImkBoI2cMmcMFserBvkwNdkiZPAFuhPddG9u/SB+
         NsjZX3Nq/lJ1CYCsCEB8ShME1jZES3kMMgcIxFXCBMEosSHxu5gaebTHi1pU3HN5Md8s
         4kDZGfA6uEHzVLkvfAPR7/1hb/fWT2yzykqoHC+9OLtw7go/2CCZXglgMN0UQAs/0XFx
         R8W+iS9Lu18KZ4OR35rG9Ouj45j3vYD/J9I6agbpngxv9d/qsxL2MoppFt7J2RKBuUZc
         L1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984712; x=1783589512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=OmPHU53sUpNaTsb6PG5NhFlB9eHQsZYrrEzi5i49X6lUf8UFUwFp/VLACehY/5Xr2O
         LDCyzR7VltVmXwqGv3uKvFhjofUAOhgR+IpuCmgt6k3PTlh8sPP/3N3xykfi5UUmZzhN
         VJbTjdjV0itrG0Une0ylDIw8zV1GvT1FQBVfaxoqgs3rWnYxHRh9YoUjuxX7kDxV4wkV
         5IFWt31Y8mI8CQSg11Ge/VKjua57rOv8ml+5CL2rdJfw3HdFDoWzCQLB6PvQeNrBalTr
         CeJxvSv9qKQjwAsPL4lfYF9DdfYo19Yo5F24PKUB8cKKtUI/q20DykkE+ilQwShg4bze
         CqSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro98uP1X5JNgbSZmEfFr1sNC74gSCxRHtr2Bc+YhgnWL5KwpKAhp4cTraX6n8PHnnjc4CwofvReAeAX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy62rH48OHzP2FFfkMoT7Eh4QPym1peYymgIBavH+YI9w9tQR6I
	1aA2uwFNhovSUuKTJqgGLcdXoCJSJOcKHswMYF4D7hp7ptVGQHGf8NlFMkaJKE2TM9U=
X-Gm-Gg: AfdE7cmB2CYq2+JE8zzRak31q+ixspE0n03cXs56idM22KO5K4FFtz74n7NfubbZqUf
	2+Iwty3XSBASEuKaulZ26NLDpZOe1AVcKuMY7Xn3wuVJkhfm/gdvkNKdlYgz+8163zAhD6ZPVeh
	50mWqXa02xc/CL2crbfg2ECuYRZazgDBksly8XGHxRtPZrhj6laG96cv3+BbZd7mjpYd6C6amCM
	LxeSFe4iHbSyDwd/QofGeFFx0V1d7tQu45dw47BKNBblFdfVmALb+pZ3fEmUu/TxvTsAUQ+Pdc8
	+nyKF7It6dGjl+dgCQPcXcI25ILtXkJ/O23wfKIou4zLxFER5MGziuCfr9YnwytG57Q/vJwYY2P
	Sn6Xk1Ad210u1doa2KV4I5joval7Rw8BoizEojeCH/74nIpWY3BukOzQW76X6xNaegDGbHIYy6i
	vbLDp3o0OD6wlRan9FgEFmvH+d9Thm6TwoIg==
X-Received: by 2002:a05:6000:709:b0:478:77c1:787c with SMTP id ffacd0b85a97d-47877c17ae9mr2019954f8f.56.1782984711543;
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:46 +0200
Subject: [PATCH v2 2/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket
 S2 sound card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-2-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjACezRvsknWsM09U/yvYorrMqp0JqWPBXtnXx+2
 676kkYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0cM2D/
 9TbbYYcNW/X+u703M7JQJBMzXYex9vzQQG7wzxMq4PyWDALJBB1ua3Dl+LkwxWta2ISbCowgBn2b84
 WKoH69+/zgb03NI9Xo/LNHQa+EmWrQYbCTsw6/8ZR13voMkrWN+bU/mcCEFG9gBErMIYMMBgH95Hd4
 5Bg5tC84KRHI5uLcTPG3j1W/fDkd2q+7qPRMFsMgUJm4hPcmvJRiQDUH9/AFc0wbQDtOfDs/RTV2VE
 1fN2xgHWXkhLP5v8OI5srcWPUYPFld4+Ve6ELIfHbLg+3NzldfcvvmsYs4X9dbuEfhtptrAM1/8Y5A
 uP/mskG1JueNulRh19b0bBhefmBlJOM+GXenJDaRVPWm/lwJTpVzpwQQxl8fIBCfxpQq8zpZr75KuX
 uKSnpLvtNVrrxxsXaAuLQ+b4IsYPH50rSeZW2QqZUKJ9wNlJYYL9ywAJ7H3fE9NxjJ4G9bd8z88p+i
 mrqYPGD+OYi9rT+X1NakjlJ2nth5hNQvzc1opXY8j3aybFGaaBLBoilPq0pBMGIB4/guRrCL8ieuDJ
 kdKiEP4fRJ1Eaa4ftyvIRlarK/+SuTiDpWDpEKxDG/wbawSOEtxa6KYppdiEjguK7mhjPX+HAOQxGU
 iGzzY9131B2vrbDnBWXonTn/nqoIwAvxehsCZ2ldP3Yitx0eHAW1UfS2T/tg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..1fc458276ab3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1

