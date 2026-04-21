Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB115B0EC
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738635; cv=none; b=oMbw6Y6qxCFBIbhGOUYDte9ethepskKriwr1rQ5EKRzubB4GLrapULGMOMHHyNgaoMvjFIHWxA2gv4RjFVEfHERehyLgfX1il67L/aiojzivKeCh640GuCau+hrk5IeOJdJZesuBZbC6GsZaHrFpQ3NgO869q5KlgOmsYTs1OYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738635; c=relaxed/simple;
	bh=eNFJhBtjD8B8eniLaadq2Ors5V5LvMspGxmHlcuetcg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=jDs/TMcWZz0m1KcLajQVS+a3WILrq1DpE/xJHJjoJt0nEp5QFHHllA5kcHdJTvAhfIFPoJ3m+bl/9hqKrD4cfvh0gG0+MjH6NT0U4+KgVusxsEN4RTi/spf1IK7n1lm6vCUo2DOuw+yP1tFubeeICAY/ItJEw5p61Z6KOy8ymLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxfxVh/8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxfxVh/8"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so4473943e87.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738632; x=1777343432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2IBPUNENCsQHchUp06VWORQgbouIwBJadPc+eZ3RYI=;
        b=NxfxVh/8P3yJ+R8AOiDoiuaaALdCUcQw/FAeUEFGIpTZzA2Z8uJlse96zqEBAq/zNy
         EkPfVSSKAOlF09TP/0YhXwosRqaSAMgow23YZ5djRfdR1TtobgTejty/ZYlSWEffJsY9
         oasWK6bMkqlVrO9Zqg6hCsteMIZgEBnIkdhBCNv1esLcrH64veu2txGp5gnoRgDQZx42
         GM2i/gNwUTllMMxGxGVb6lSbgWLc2L6vmblgqVJp6h0DkaKUklZ/lPShOnI5Cw1uMx47
         FAqT1JPmR1eLkKLjUKjHsERjWHadRKSlK47dPiK5yKiTRxCleKe/uoDdMv5hRpO5UHKT
         /+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738632; x=1777343432;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2IBPUNENCsQHchUp06VWORQgbouIwBJadPc+eZ3RYI=;
        b=O3aIBjCFwLCnM5JQfxXl9J8UzWK2kH4ZN3+98acIQp1zIu/q7nEbzh0FgiUCR1Sbcw
         KlZ1dnT49B56TC1ZwBzrbAtDmOaC1tMmfREuj/uM3/QYWc/v5ONDleHXyYvLjktg2SDo
         7A+j736agwFx/J3T0NJU9LIQnBQpCPNMtzvwI7VX4Xu4DACVH3M/KvQaCE82BVeh/PTg
         bG7e8oRjbpPGv9jDTr/8WLlryW1o6KpHvtIZQieVp8t5PlrD2AxFsf6+p5tr40egL7I/
         P3R2KiEQmqjSY04cWyzlP/ReckZDFn76Tr35iC6fxwIXYHVe3hKtzAHy3wQm2EitnHBJ
         PMTg==
X-Forwarded-Encrypted: i=1; AFNElJ9/QqTjI+Ikq1ouyj2htg5eYg67weZtZFbn1RBSJQUeYhtSyT7AsjX5jEENCeEQswpLh55Agaf5wKah@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4rJsP6TUVUb0RAT1EMeFFlH3X9ermyAqFMEs3n4NJsQOzSDw4
	AImUFrJQrHHQX4biFGq5nsczVxihOZxd2Yc+0F7qM8JitCaxxa3tmdDs
X-Gm-Gg: AeBDietOr70ALEMVj7bqvr2StOiU1RHVXLMLDKaNJbpibZukyncd0yIqiY0g4uVpwEX
	Pz/Qd5ebJyMjtwi9ICdJN8CtE+KuVex5+Yem9zwMeXma3xSVZNUVZMmxRY7lpe+S4pR4CcPHZ+x
	Nc0bUaKX/HGaGkVoR/n31UxyXzXGZUb7sIKv1VY5rx2L9wDTUMCVVElDylhvpJJbhcvKP1BDMii
	QFkaBiOl5p6/2ctAoXxjy/lRwu+pn8uxp6h48uspR/8FXnEVeWnFfYh6zhiqiqz9+5/13Z7b51B
	zykFa06e6lCaShsmE5JDxjUFLO/nWJ/tgZbW7zR1rUHaqkvHQuLoYfJXKaY81bNA5ge1iSuA0rF
	Ytdfd1JB7zU0J54t4g3C/OL+J0N13TDdOH5j13JYLlDBO059QcS2uSMgbafqWw9CrQRHh1x9BRq
	hFjp/d7fwUx/R6dFdJfpYR6qXqbefGpUwbQOebsXZ9rO720aWNOTxSE0yW5rIysm73N4ViwvN2J
	7HcSS+ZvifJgqRn
X-Received: by 2002:a05:6512:108c:b0:5a2:c962:59f2 with SMTP id 2adb3069b0e04-5a4172e1c03mr4555045e87.22.1776738631665;
        Mon, 20 Apr 2026 19:30:31 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm3307460e87.74.2026.04.20.19.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:30:29 -0700 (PDT)
Message-ID: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Date: Tue, 21 Apr 2026 05:30:27 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: IRRatium <majnkraftiigry7@gmail.com>
Subject: [PATCH 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
---
  sound/soc/codecs/cs35l35.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9f..7d9b42c5a 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct 
i2c_client *i2c_client,

      if (classh_config->classh_algo_enable) {
          classh_config->classh_bst_override =
-            of_property_read_bool(np, "cirrus,classh-bst-overide");
+            of_property_read_bool(np, "cirrus,classh-bst-override");

          ret = of_property_read_u32(classh,
                  "cirrus,classh-bst-max-limit",
-- 
2.53.0

