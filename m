Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8D47C107
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934598; cv=none; b=cDicZTQTIgAD1YUCKVk9vT9aZmkZX+uB5CS/Bn1EG7+jAM2aXwBxqaXr2QLGULelCYUDVOfcQf3dHV1gtJEnI7QNzhBPCPDSP7Slnbf3QkwBf+cuBiCDX+oxKzqF8U7ORNkSdNPh+TMjx4SAbw2X4wxCFZ8juAD30Pw8BdBMTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934598; c=relaxed/simple;
	bh=7XIis/SaxCP7BZheKEH5EfAiCshL6qRfSl6dsIbmL4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVk2g5I/5mmBecdJhDgLFbaZ1NV6kGdoym2WBhIrDvUq2Q1hM+JcuUWS54IkPmQ9daejn/O6SYiEz9MkYNLT/OXxNzPlp7PNjP0WRCOvkwMPOHQds1sx1hGJU+h8E9GgjjLWM3VjnIOZggu7P9Jq2bthEjm4rmfeLV/kiYH1pwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=n2B7hROx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="n2B7hROx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so42756215e9.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934589; x=1791539389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=n2B7hROxQtQbKGz18ks1AH3gbEfILIH7PM/7q0+AyxNTos2sgtjQn7nwQB/6ZWoph4
         8UWSULx1+zAPSeYbp5T8apJmjG0rDwkN7bI/ws7JJkOz/mNX18g+aNiF+A6JNGzOXrDR
         ao9gYz0aT5lsRd29VsnTJnK/yjAjorW/phwFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934589; x=1791539389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=mU1mjykS3367KfJp3WVShMhFu4243ohShppULyj+ni7w5ECvK57R/nZEW5Z4DAVC5U
         ow8pYxDV8hbpYdx40li+8VEHvcbdyK6S1mcvj/CEO4enHZj1gfyszd6irUAPHm0tTJBM
         ttByToGUm4SSA07eT/SUVfpVIx0dsmbSx6raiMOXhXSyVbWN6lR820jl72SuY65wPt+X
         319yF2F4xaW5tlfEI/UsMeV9Bt7mwwt3UrLGU25T0WJFB2vY72Uj91FL47a/YEzU4o/d
         xshk75aDcCAw3jBSgHyJzOwebV59z4gO7qpJONxfPPL/UCBcMdi8YmFnzyE+K1olQj8f
         iVbQ==
X-Forwarded-Encrypted: i=1; AKwUvBztA/P9r5kXl/MhQBt49Ya3quLIwdP86k/1auTwSGAnGSmFQt3rHsRMnm11BrXz1FhgklqMOKfVhps+@vger.kernel.org
X-Gm-Message-State: AFuF++n34vSbHbvufFQ9lGCctQB7jN9T4kVTItYMvq66vVGed6GUuVMj
	BUetihpyfiC5K0NzNYqLjqNrKvp3z29+zz6BL+0p3ODi4agPlwfwqgT9AxzCoiPst40=
X-Gm-Gg: AYBFou2QIuP+Xy7TlG9tPtOoL9Q2GTMQjPdfgNwR1Fs4F48N7O0BbY++UtXTGBtWJIX
	to7eLASr7DT5bRVnZDz18b1WTpKU+GAwRCvh+diY3mt+fwTQpgypJ3Bz0psAs0klPYzjMJ59iRl
	FTpbUzN9ytnkidwxmkIdrc1MmhzgIkk5eWHu+2AX8RUgg/upxga8v1VsP2KmY/+TB1n6J+dxgWx
	xZGphOBFxqMnWCr4uv75XlNiw8v5xp4a62uxoaez3oqyIGQ9WyW5+49F0NubVhMx/4JqREQpazy
	24RLiIztKxSM/xLA1KL3mpr3pd5qnnWAfeSBv1Lj3xMR3nUnbR6E3OjHLGCtOfc4tZEPUyGW560
	rwqldm7m66jVvUycLrytE816kJLG+eazHrpbgk67a2aOVKKh3+DzCkKuJ3jC/5aydmK7yHqPDKD
	Pku8eNbDUyBEi1UREjdVcf5S7pOmWCDLn5GNHSrIFQURjkm2LAbtMWjWYoELB8sBOx6m6ljZ89s
	v4=
X-Received: by 2002:a05:600c:c3ce:10b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a02769f2a5mr27989155e9.27.1790934589559;
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm4572200f8f.41.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:33 +0200
Subject: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..e5e4b942acfc 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);

-- 
2.55.0

