Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99EE326927
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679566; cv=none; b=no/8VyoTc8RHuRi+0XZFdvP9t+es++SHCpOMfABH7lgXEFeLdc9xvnXkjBmMyhuFXgT5dQZdUzzxusIt2LNkcH3PRQX6FzZ2Vy2rGxuabKcl6y3HirLOego/Itc+LyY3WlQ/vfH6Z2IzwxgsDv/lnGPfDoL0/ZTUNKrI0tX6LTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679566; c=relaxed/simple;
	bh=NRZmcUciumNfhMV+R86DTDy6mW4WruG0mQc0IOMU430=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oe6pJ87RmI8JavoXV/JUKjywFRF5lcjVTvTdb/QCZk55zqDuybl3zb8NkchitaB7V0mkneGo8hbeK38Kwj2zb/9Rp0Alz8DMZtcQI52ZoWTA8pYPFJkMQ1vNGSo379bV+3lpo5pvKuDDCYUmLw9ulUI4aV+SbzDniOCkDUsYL3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=1cosSul/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="1cosSul/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-449de065cb3so6212240f8f.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1778679563; x=1779284363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Eg6znqbDJmB7CWapqmrTIn4+VnKkZGZsv0UkMTOArw=;
        b=1cosSul/az31fam2gTneKqmPIG7KITHZZckhjTee+cvU11XHj+wOhBk3wGmw9A3Myg
         xf/2f04NtL9d9K3wAIyNctyzZv/qmpGZeXJOoEyHjq3lJQzPv40Efo7Vus367b/IyjF+
         TGYdaiYPehC2Xm9NSZOUaMhQ9CsmwI39+GILlMnCgEF65eY2ZEwsbj4gks2S8b+ttJyi
         YyYAnpYuspVsvYnmvPqiyaWwlztL//Mme+UMEvZu23LP57lJlZdmT+ZlKgFwjMANO9m0
         gDQj39jvzXUg7yK4+44Rh56cBOeWqmHt8dSX5QNFsII2p8/HaM9xZwMjFXlV6JjkmhwB
         IWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679563; x=1779284363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Eg6znqbDJmB7CWapqmrTIn4+VnKkZGZsv0UkMTOArw=;
        b=h+UnsHw+ZtBfTKV2zY4BdcQorE+Y8vsatA1nxK1rgC9gr/E6HUFDZJ50J23aKedtx2
         66E0swuDeqdNAathkbHxHG2h7A+Ts1pDyCZN4cCsQ/ys1pCx/V0R8GV4j2H1OtK3tlTZ
         Bn4aH7vUC+Wiax0efSAIFJG+g1B6gD/fKmw9ZhZ6fDhaP0+Tdxws41B++19cHtgXmxCk
         PR+oeFEZShV0LTzWZ9wjNoYqw568nB97Q0GeYSr4K3urg9ySID93jKPq6j58Tj5CvUuP
         TMLkJaoC1XkQIn2eDFKRTPikqSgif5zEfUUMlSOtw5enoG4WxkwgeNZ22IytBIG5qj2n
         oSfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rY4W5IVZQZCEP7tgGK77me3PZP56os4sFGNzdXS7N1mwwM+1q/IvK+KD/1WlQXk797ydbWHfu8n0i@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPPbyszIODHnKhHgkfwnbisjGCJ9kyFimMELgl6b58iKy8rGj
	XtY/WygprYesjXKPV7NjjqkDrt7E3hUl1O22E8oyDg7lBsBhMeJQ5LDeZded9h1Cj1U=
X-Gm-Gg: Acq92OElfoQzlkdzXdj35AtOC0HxmLZGVtm5ExVHwkflszIG/4607qBnWeOHgKOtDY9
	1+xnVNov9p/5WzEnb9HPeyrFcC6GcoMIv3m/3ktLp7YF7maDnwUrAujwjMPfpZd0yS8dgn0IPs/
	McBrtaMAyA+nhfeipiWRJUwx2FcTjJOvbPXzr9NT3Gqi/ECguYHzzd9iYr7iPbgQrYTYm62+94T
	3nupZCbuzugZwww0NTDyO187O/NK8llCIKgmY8PXGZcrWEEMPdFWfPJZqOFldwgcBSm7pzMB397
	l6NvIDdHyWO01c3njm0E6sjpSq4jyzmG+rWPioJGbwj4i1zvA7a8vduiOmTSs+IH+3TmxNn5Jy6
	8xD8DLIXkcGOkX4rAKOdYltyHNISGg9IJbPHszR+G1UMqlZlule2PhkH2nzPW0EwwHW4fv/sEO5
	0AUn0iNqjnljcxt6fYzB0pN/j9KpOM3GgzgdlpV8tWN1zodaW/nLXM3NAQT6v8LGZvJaWPg0eb9
	nR57CEl
X-Received: by 2002:a05:6000:250a:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-45c795862a8mr5219175f8f.13.1778679563306;
        Wed, 13 May 2026 06:39:23 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-83-110-135-253.alshamil.net.ae. [83.110.135.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca383asm39627560f8f.28.2026.05.13.06.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:39:22 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 13 May 2026 17:39:10 +0400
Subject: [PATCH 1/2] ASoC: dt-bindings: nau8822: Add supply regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nau8822-reg-v1-1-c532e18e92ad@flipper.net>
References: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
In-Reply-To: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NRZmcUciumNfhMV+R86DTDy6mW4WruG0mQc0IOMU430=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSx1LO56x/v2HJowgctzg+Tf3Tsnf/jQtoJ94+tOT9eb
 Pihuo4huGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICp5pRmZPizLnTS8xtPc4V6Lr8+mz9Xq2emj1zI68gbKccUmEU9F7Iw/OHYoXh
 Oo9In+nKutVKOS2B9w6Ea73PbV/RfmK+56WNJNC8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

NAU8822 has 4 power supply pins: VDDA, VDDB, VDDC and VDDSPK, which need
to be online and stable before communication with the device is attempted.

List them (as optional) so that device tree users can ensure correct power
sequencing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index cb8182bbc491..0a8e40a140c3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -30,6 +30,20 @@ properties:
   clock-names:
     const: mclk
 
+  vdda-supply:
+    description: Analog power supply
+
+  vddb-supply:
+    description: Digital buffer (input/output) supply
+
+  vddc-supply:
+    description: Digital core supply
+
+  vddspk-supply:
+    description:
+      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 and
+      AUXTOUT1 output drivers)
+
   nuvoton,spk-btl:
     description:
       If set, configure the two loudspeaker outputs as a Bridge Tied Load output

-- 
2.52.0

