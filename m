Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EA635A3B8
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773275; cv=none; b=G7xMi2mJ9ADVtAAQAYHxKle0JIlsDhY/+9eN3L7gdSADZTiYPfUezmaHrFlcaLVR7PYD6VYPpZjKxDh3I0sTCihu7cbn31FiKI+oxS37mdJbl5yp3Io9OFJ0Nu/P92y8jEie8TTe3bqF9M/8CGBYyO1lcd9TIkxNSMTCSsXL48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773275; c=relaxed/simple;
	bh=JbCmSEhMj5HfeLGp4STM4hU60tLUdLhuElGdoGvW/No=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UAlqPGxLDimZ0Ro9H6gQqAwSTxMnQB5OUt1ewZJX2zdsBR3MwMN0Y4xcA7mOP+05OlBP8mhzq+7x/0TbJMZcUw7BBrQDIS5jM3OeyFNU6FCula51yOuCqo9RM9c+hyeWC4tubStW5ox8FXbh3KdFHEiRh3rKkKQBI0lyx74eu4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMbPUws9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMbPUws9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a402b2d102so4842373e87.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773273; x=1777378073; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OozudbymEZ7NGU+5rFZtQr3/MVPLQp8RAMq9QDqzhfk=;
        b=TMbPUws9R8qzxmPORAatF296utAmEZV3ylos0JP/74Fxc5/N/74/YoDZfYyY7G993v
         Lssu0c195Hdjzex5E/meDVlRfQFxFK8kYdwYyayJBk2HIdeXqtUrl/u6nyCJfiJsYStN
         quepp3q+KO1xOpHpYfA4COJIdVqHuI6syG1AsOC4Fs3BHGi5qVXjt9vLkqIbac/TU9Oq
         rdI1HsIgx1LSI+Dw4dfLw4Yu9ZGPoo+suByEqXZmMx3DRtHQIO5iE0Sc+fmnrw4tNMBe
         aB9O2vCjif88PPnUS1jDe/2I4Gl91ApdzbblcfxW3y3M8MbiFKINm0cxzPGLjSrQf+F6
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773273; x=1777378073;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OozudbymEZ7NGU+5rFZtQr3/MVPLQp8RAMq9QDqzhfk=;
        b=MQ3yZ17K92NsE08lJYDJJPPLjwsJiooLD3yJrVeT/LWGP8GuByaitxwjJIqtTDyFy7
         jIAOtcZAlCLv3qdLAYmi6chwYLkqr6dPpoz2grHftulZFtopY9MH09VEuMcAx9ltbHSU
         brkAusPkp+UOlNzdVzkBczFghxA1yMSUvgalLnBYklxuSto+V4R4YQlB/QIi22Q2NkIT
         lTAYL2neluLkLNQhePXRBdIA2kuN0QynKnrcjhL1H567LerZJ0GN9ewFHNVsLHe7giUx
         ls1/RvREDgr3zV4CecxAjF/q7JjvkcZM0AX9O7jw4Kw60F6OcVi4atAi3yMIobbwm7A5
         cj8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/D5H/Pb4mBA0Xts3xZ9mJRMYRYAd9jwFpmT7UVmHLKMsL1NsNpHmOQiTZTEBhYl4q9NMwfLoS4vDAp@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/CdHyPR+OEaddaWdBfAs5vcJ+fb2LICpFiEa5X98AL2NQ+6B
	qZCzrU6zgWhJXgTSdCMjZ4Sv5j6pNdm3g3De+zN87SKzZ+lpaHmkCFGp
X-Gm-Gg: AeBDietIcuNQ7ngV/fBhyuwy0JEbAKc+xGeARwdFDmKoXgQouBoLiRracLiI1/63kyn
	lbEyl0CoXiGaeaLFjzGNcuJ5JhKc2uT75KD/slsORD64obJr0p8TrsLN0deEiwyjy1jPPeZmwUq
	VAwjTefCrNdfZSmkgaPVdbndUyvlCKvhT1jUtEz+aL8kS5GYRIAFj7a/IyPTq2LuQSGUTIou+GJ
	Ljmtm1hpKpi/mponYx35Kfp22uBlsQQ9vXF6Rm7p5QNkS9GyfmnxAUYKID77s3guZ4mg/Cj8WIR
	LKMXk/163j8Q7fKzbPtaNpD2w7uy8Fn499oceIhvO3gQ5wRYUYI3DZ0kpxoi8PHWOSE6Jdit8X3
	sSMXz4mUGOxoUMF4tOJPvCLb49fbm4m0BofeWV5JKgXjfcbITh1GrtAuEUbR2pjPrDtwxADtbhh
	+gSQznS7xxDhayszHE2X0n9iPZCcZoe+mssKXYI3cDs89gT8Ml83hqbusfrTZUugJUxWxY1CbOc
	k9rukOEWvDvAJI5GK0EUdkGmCE=
X-Received: by 2002:a05:6512:32c1:b0:5a4:6a5:9900 with SMTP id 2adb3069b0e04-5a4172e4788mr4538488e87.34.1776773272327;
        Tue, 21 Apr 2026 05:07:52 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm3615262e87.59.2026.04.21.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:07:51 -0700 (PDT)
Message-ID: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Date: Tue, 21 Apr 2026 15:07:49 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
From: IRRatium <majnkraftiigry7@gmail.com>
Subject: [PATCH v2 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide'.
Add support for the corrected 'cirrus,classh-bst-override'
while keeping backward compatibility with the old name.

Signed-off-by: Sergey Shatkov <majnkraftiigry7@gmail.com>
---
  sound/soc/codecs/cs35l35.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9f..XXXXXXX 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1311,7 +1311,8 @@ static int cs35l35_handle_of_data(struct 
i2c_client *i2c_client,

      if (classh_config->classh_algo_enable) {
          classh_config->classh_bst_override =
-            of_property_read_bool(np, "cirrus,classh-bst-overide");
+            of_property_read_bool(np, "cirrus,classh-bst-override") ||
+            of_property_read_bool(np, "cirrus,classh-bst-overide");

          ret = of_property_read_u32(classh,
                  "cirrus,classh-bst-max-limit",
-- 
2.53.0

