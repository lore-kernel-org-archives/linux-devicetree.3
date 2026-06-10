Received: from r3-47.sinamail.sina.com.cn (r3-47.sinamail.sina.com.cn [202.108.3.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8537DADD
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086014; cv=none; b=MW5tqJxXpRJADAWhs5A2dqWjdg3YX6i6I8xKNSHB7iWGCGzX/e52Q/Qww9QhJWPHLcVSPOsrFNK0D+eK7n1mnKOA67pdB+tLdGEVbZ73RglvhYLRotFYsWL4NxxClQ7EJz8BJNmTJZO/1hILtJ5GymmehJvOjQKBnf76fn8PprM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086014; c=relaxed/simple;
	bh=CE1nX27oBcL6Tl6vMv7Z3wZ/+naPHmaEsSzFKbyRHkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=W5UZ75QGy3sFyJrBgfdTw4Gb4fB7bYAXsMenhiTxKQ0PsIdJdG9yWc9QLtcM+x3S3dToORBkGL/F7iW6Fzut9v/Z/UELjgREmC1paaqurfhYV3DclMrRUW7qnukqtf8WoM9FB6rG3sKF73uvT6GAieTscbKo8644TMEXiebkQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A29372F00006380; Wed, 10 Jun 2026 18:06:40 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EE711B62DD7844089AB2C86FCA8A4203
X-SMAIL-UIID: EE711B62DD7844089AB2C86FCA8A4203-20260610-180640
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Wed, 10 Jun 2026 18:06:37 +0800
Message-Id: <20260610100637.25568-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609-visionary-truthful-viper-ceff75@quoll>
References: <20260609-visionary-truthful-viper-ceff75@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> > Fix the issue with incorrect modifications to mclk_src
> 
> What issue? Your commit msgs are really poor - explain nothing. You just
> duplicated subject... and anything can be a fix.

I'm sorry I didn't explain that clearly.
When the system needs to be configured to use the MCLK from the SCLK pin,
the old code still sets the relevant registers to use the MCLK from the MCLK pin.
I will include a more detailed description in future versions.

> >  	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
> >  
> > -	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
> 
> Why are you changing implemented ABI?

In the old ABI, `mclk_src` was defined as `u8`, which meant that users could set `mclk_src` to any value in the DTS¡ªsuch as `0x02`,
but the code wouldn't recognize what that value represented.
The actual purpose of `mclk_src` is to indicate whether `sclk` should be used as `mclk`.
So I've changed it to bool.

