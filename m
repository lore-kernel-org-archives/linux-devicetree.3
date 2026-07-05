Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982D2848A1;
	Sun,  5 Jul 2026 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783277736; cv=none; b=XTYZBE4qyz5E7gKk5gC1iwMeDPw8uLbakfqnNhjsNiDvjNIirHrTmMp88BzgNB9xinkAgy1fI36V+mOiPIzXCGP70+JmIChbjaj5WD93TVKRwTLRKvAFMULGoqUk919dCU7w7fBr4dSmoRJWuRy8GOEanE7gPa7PyyorKnnEm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783277736; c=relaxed/simple;
	bh=X3s+/ParZGutlIjQLSuAI0IrbHulKPYjszcMT2PF/co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twSLEqpPzv5hstRNGGTvcrQCW2CgLb5wYV0zOdVD9pV5mVPkIX9quSSLEUqycTbqZ3na/dNE5Stn0xPX7cOVnKTET3oKbifDm4UIG4cNUki4cehZgrYJlBRugo3svWUNH6+sjLgzqHD+4LOuPEBszlAR3MRVxk9MuFCP7piVWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=NLMUdShJ; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="NLMUdShJ"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1783277730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3s+/ParZGutlIjQLSuAI0IrbHulKPYjszcMT2PF/co=;
	b=NLMUdShJ9c1NiBRPaRo29NTdt5nNsMPDmvNm11/HwY+IG8GqYFGfwmn344/jnfdUqR73XK
	jLBGPmQKEGxQugLMvrwXUuw6l5fSwvNJyDl+mPif8clzU2Qg3xlZIt/nd0nmlyhbatfeWH
	5WKigcKslzMfGuelVuc32QlUvRBEDalCJpBcj3nB7nEyAyyoYO9f0YSPZ2fNEV2TM56V9K
	SG22gcmqLv0Kh0gN8um8xj4tZ0ywhmWDb6baPlFndLrp5z4pL7KZGCSUEYpWEy2C0SM31P
	sihCXpmvzTn04S/6de8+XgeJrFNRCOiYh2n/p7uwAa9mkrjqPAAPJpPRc+3hvA==
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Sun,  5 Jul 2026 20:55:13 +0200
Message-ID: <20260705185513.138353-1-tillo@tillo.ch>
In-Reply-To: <20260528123645.2650085-1-tillo@tillo.ch>
References: <20260528123645.2650085-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping - is there anything I should improve on this one?

The matching BPI-R3 (mt7986a) patch is at:
https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/

Thanks!
Martino
