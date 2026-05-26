Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4430567E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809407; cv=none; b=pbjPfMY7zUlXR5ykDanEvAUEygxvfbcGAtDfmhcv2vsMKaUc1ETagj2LFKT2TBk/pIRXU0+gk4iq4BWVIc57oIegwM1/Jwa9uuiL5zhMbSU8lr5zFR4ynWIzcB3AWtofCtKcJ428rOW4+Vsq5A1I2FYCZmenBy4bd0KGfD7HkeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809407; c=relaxed/simple;
	bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+lyRZKI7aFH/8CZv3XVYF32Fnk2hJFF4lKxQlJ4aA5wSdPKy+dBGhXbJqq8nRyB4URYisOfaMtZdCA7gAniZP1Bt1mDSuapvZ0t4wboaZVvuSyJoyYZAH93khK4dulijAO2xwmWh1ozaoXjxX2X1b/25v3ExyZmRa0nCX+HMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zC21jxOL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zC21jxOL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44c350a5b87so6377251f8f.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809402; x=1780414202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=zC21jxOLAGFNXO/HHhONuDs2YGouoRLpPQP9jYirJdq4MDkDmVgbc2+3tD+xQLnHc0
         0UCFzqLNQ66w2/UU+0SsE1osKpNh0dxfwmeZIddv+G+ZD8ef2QSW2USsVnyuKgckEh6r
         zkhEZFDO6ee+0N4o/Na0v0pLiyECKDcExkZHXIfxJw65rTGe7uF4mM6OHL6mdq8aB0v2
         5g/KENckNW46rOGAq4oprX6Ta+F21F2Sz+t+yrDb4jegTXS8XRO6DgFBDLHjhumKMcaP
         /v7qnFgQ+IXHnDe5AcaVQp8rZQSZswrg5uyGywKlJTZ/AtRKysdcXWl/BbLr/aVHRzb9
         xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809402; x=1780414202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=QjXskOcxZBJH/EQUE4jaICkmKV4l/zNwPdaDKtv5AMrM3Dj3x5Cg9WfnW6fj71W7DN
         vRzoHhfBb2GMkSjwwLAu6uhfSOTXfLdeBNWjh90PAhCRMVjz737CfyRWrkeh4yuVyaoa
         ROqqG246yXMyNkpXNJITukuUxtK8JO9Nbu+i8tbJ0eGEF2vwQ6J2adStPuUit9CwhtAN
         hG7/fsQBwyTRN/MumHou9MF+R1XfYf82ZaOiv63KlooOpyPCH6XeAnM3Sqg6Sq/RBIXm
         7AeOpTJqguSBkV4qygDHHoikps6H5vvG9Z5qWHHKU1sQdU0L0TZ2nsQmfuFXoy4Czm7W
         Av7A==
X-Forwarded-Encrypted: i=1; AFNElJ/cxCAXkZ/3IR8OwziL5sDUZY4KFOtkSbZxH+u9K0DZNOqhvzCeOT4Ma+tIjt451L2kKY1DDe37LrU/@vger.kernel.org
X-Gm-Message-State: AOJu0YxYqaHd5zdWHrg3DoYf3RYDV2J+wJf5mc+h/3iyxiyQ/+FXVm/3
	rckiJKSU0S9S70OwU4ruz8sTY2Qmra5g6xpVW2AcL27ofuTpyQiSXAibjcLPwJF2tXo=
X-Gm-Gg: Acq92OEux6yDSVRS5m+PjxmxSQ3wMhLcdxKgvb3o+BMi9kROiKCHj+ddNdrebAMozlY
	e5X9c3UfDipa+ph9fvsyHNHE9mbHA+G6EcJfOT2aNViY5NVuNuRPEid4ab+r30hBlfK++eAu2Vt
	3s43EUzApVzdbeh7LZClK+mYfwybzbiVz20qNWet3IhGAY/PYDlYuV33VyXfves4mvtKUHKSX28
	0YzjztmiusYl413wINODtyD8GjpBOxryfsM46UiGK6wd5t0OXWlOccIcCQ2d+XAmPxSjByAAP5e
	t0+t7qoUOpB4nfsBZ6TjwzQHjgerma7huzhnQaaUwj5kFeqjKA2aJ/n31hiV2EEhndOvzY44AOp
	VMErZlwqNn/5aW4PFWs9hyiDDWWqp1LAZ9SvaW1JuHsQFolXsVG7krrMGHE99tUtmfVkM7rYv2f
	wkKubktIAjeZqq58HrCsRzQwDZFea1/DB8
X-Received: by 2002:a05:6000:25fd:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45eb38a66f0mr30090550f8f.22.1779809402180;
        Tue, 26 May 2026 08:30:02 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:54 +0200
Subject: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=1167;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
 b=uAdZLNZsfUX4RLp9inUuLMDBsGewFvqrwfJwhlCgMSPgkhFLi8YtiiUMO4qU+M5ZSEnUl9sda
 vCC7PvpT73ODFseHSnV08jqTGnUAaQpiKw5RTnjNyzscsY3xst+kPOQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With the v9 data, the controls will have completely wrong names and
using wrong code paths that do not apply to v9.4.

Note, that this will change control names so it's a breaking change.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..7f93ab0c3872 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2493,14 +2493,9 @@ static const struct tx_macro_data lpass_ver_11 = {
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
-		/*
-		 * The block is actually LPASS v9.4, but keep LPASS v9 match
-		 * data and audio widgets, due to compatibility reasons.
-		 * Microphones are working on SC7280 fine, so apparently the fix
-		 * is not necessary.
-		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		/* LPASS v9.4 */
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = &lpass_ver_10_sm6115,

-- 
2.54.0

