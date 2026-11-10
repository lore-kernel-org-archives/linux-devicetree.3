Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309117;
	b=aj23rSau3dE8uOrSiau0gDwNZsvYWkkx9WSB0V9mezGuKjtweaqGV62oqq2qBzuru7uH
	 S38rlh+A0++UdtKg0swNhwz4k4z2aODREVKtKjbkQEx3E5NK6A6zzWWWefrRIJv5/wyAd
	 BY1IzTh45jNJsA9sNOFduPPfI/Hw+ZzKm9SQM59hF6CFfLuOWSFwd922unWVR73Joe/7V
	 1wQpjcQKJv55dW3kqIHaudnoqcTCOZCWJa6bX/8lD3r2AGfKQmT146kmcYFvN+D6fu/ex
	 qoaRX6rkry1A2VV/yzPgQzWkxYkVew/b1WfJN/DO+EOESVF1HdPMZp/4z4T4wengjFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309117;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KwOMqReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=;
	b=RExBqbz8meT0Cu8x7/LvV+/unDEkqVxJ1bc0JRLWOeI+oQX9PfP8rCDB018WAvMwhWOO
	 Zf3ImN5QjHVkyyD6ezPQg+g8B19gmhS2YuFJxEIXwjIdIm2X2go5JUHuqP2htvsmyrNY3
	 sRg5IikJcFaFFc7wTRDUKfbG8VVay2H5q+QESzkO9w/2UjlOa0fmBs2IIuq1nURBZ71ix
	 RXQBNkQ3SmR+pcHG9sXVLbTJoVNBRHRiHx7nHWSkjIcY4upygcDTv9ZlEVgAw73e2eszN
	 /B5WBHedwK732TB1NXxY6TiA/r6dAUO2HTtyVQJz7yGz7ye/lbKSY0j7XDtZirs7BkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QYXnx+aS;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CA4606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6CA4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QYXnx+aS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KwOM
	qReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=; b=QYXnx+aSkafOzcSvfg84
	+n0fhAQDf3znURYRalx2f6M7bcGzQ1rO+qluar0Ep4W2h6OFl8gOwAewJx0+Pan3
	dPMe1MxRPZ7GptCOkWB1qxv3al+97t/CtWcAQd2rwNK4SN31coneVoF7c4Adg3Yt
	gjPiWxmJyiCiFCkRcntx1RMZz0fGxk07DTTb4IAKaA7cT1NrtdjpMpnEl3n9yj75
	TXCQEDCNmNc4ZChAPy/JbPan56r3xGYqrQEs4/6b+bgCYhCzmpY7L5AvzDCfczxV
	v/NUt5zgVO5JIccXDh7wM/ajsOEbKxNgEWYNGFRUPkrAGbfokTDlSZfJf19fcT6O
	Zg==
Received: (qmail 205390 invoked from network); 10 Nov 2026 12:11:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:11:54 +0100
X-UD-Smtp-Session: l3s3148p1@u8pgJepf4p8ujnsO
Date: Tue, 10 Nov 2026 12:11:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek
 SoC
Message-ID: <avL7-gfNNvO0s_gw@shikoro>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
 <20261103210542.15965-2-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103210542.15965-2-ansuelsmth@gmail.com>

On Tue, Nov 03, 2026 at 10:05:41PM +0100, Christian Marangi wrote:
> The same I2C driver is also used for Airoha SoC with the only difference
> that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.
> 
> Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
> Mediatek SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Will apply it to my for-andi branch.

