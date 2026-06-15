Received: from r3-81.sinamail.sina.com.cn (r3-81.sinamail.sina.com.cn [202.108.3.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6A38552C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504199; cv=none; b=NZcVWvbaYTtWl5LuEE4CSDfCCmmnkxDa+eDU3lEUbbfTEpkpppdyIj4wO5lSXca3gcKSdzb88WY+tjK8iOxa4/D6RG2Vli//BYYH1Rq8okkLUsx73g7HAwj+9a42eANA5dYEZabPtCKa0QyFKayFxFpqxxEnyFHcKaNN1aGgPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504199; c=relaxed/simple;
	bh=HERKJPd7DsXyrtjjCIZpAt1ChZ+dWhH9Ft7EJglhrSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GFDNDxu8YRn2R2lNRhouMOfKIl0FUXvmejPmdbQAscXEzX9nk59Os+gVYVwtnoyklt9lVcFgC273KmpP1s1vEYgRu2cgdI6wUB9fiOBGhF/EYlMra/x745ueZudzh5TAqVwSo0dsLf8BEG38/BKKUZd4s2FIonUq0Ka5myb1bic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A2F9680000042A3; Mon, 15 Jun 2026 14:06:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1BDCC139A8EC4E049F608E5CD7088C86
X-SMAIL-UIID: 1BDCC139A8EC4E049F608E5CD7088C86-20260615-140657
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
Date: Mon, 15 Jun 2026 14:06:54 +0800
Message-Id: <20260615060654.18725-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <fbaf1829-723b-4a87-882b-b164bb544912@kernel.org>
References: <fbaf1829-723b-4a87-882b-b164bb544912@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> > 
> >>>  	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
> >>>  
> >>> -	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
> >>
> >> Why are you changing implemented ABI?
> > 
> > In the old ABI, `mclk_src` was defined as `u8`, which meant that users could set `mclk_src` to any value in the DTS¡ªsuch as `0x02`,
> > but the code wouldn't recognize what that value represented.
> > The actual purpose of `mclk_src` is to indicate whether `sclk` should be used as `mclk`.
> > So I've changed it to bool.
> 
> You break ABI implemented by this driver, so you must clearly document
> it with reasons, why breaking is necessary. Honestly, without proper
> reason I would just answer that you must keep it backwards compatible.

OK
