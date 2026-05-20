Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C92366065
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293989; cv=none; b=nth9rr8bH7pPfh065NxYPvVIuFXF11cW6nwuBmAik15wQtzHLARtzv8sofoEpDI3zP9VhOJIc0QlpX1IBtFKGMVJaJEhEaNtqZlzGs5H1gNnqTN1J7wCsGwstDXiTlsxGdzLUgPtUouMoPExtPkAWDY6R+bRvXhxO99DiJUYJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293989; c=relaxed/simple;
	bh=7jUAqQqy7bOgNQ235uBCW7ABh3kxZWMdu7ZkuqhJIl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FHswMmWm63IRsv44Ud8FXSxXT/zHTyJfI9zZgsfAM/Ire2b+xqiEgasW3lXE/KQ8c6vSj4o2XEYdsY5W3lvTMi2kDIQcYjfH4QyxPdLH+5TNGEnXOjogEbafDPPxeJ/QTkzLu1qcmwz2C7ys+bScxj5daL2KIHg5fLBd7/Vc5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxLV5nGr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxLV5nGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BF61F00893;
	Wed, 20 May 2026 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293988;
	bh=BjOr4H9y7pf/UM8HUksqz0ra1NKogRSArAqzqL9fYis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cxLV5nGrw1AQwISieejxGEycRGrdpDKm1teSD/EoQtKlIE+wZvTHLp4LpwWlIe/Lz
	 S9v74BahBmqdRp6EpT3H9jnX10PzNRhC9KpGOlqllRCfXey92ZxYvtk6L/jlwFeJwE
	 cvv5rpSemoPawa/nVJNWLQ/DI+9XhiprdeHwsSjYmFBdpICqOcBPl5ZJZC7hTKpyTo
	 7fwqU/ji1NIv8/Dmyp63dog0fSJP03WOySxI6WRvHP2nhIJtbUNeH++yKZ8yaWUIYm
	 fhYjDYpNheEmIE9tWUvdsQOYmjvYttl3yCXnYQEP7vziAeEGikkOZS4qlirzd2IGQ/
	 2HXt1zaJnSc+A==
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260514091520.2718987-2-wenst@chromium.org>
References: <20260514091520.2718987-2-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 1/6] mfd: dt-bindings: mt6397: Add
 regulator supplies
Message-Id: <177929398525.2887671.6192290013124869675.b4-ty@b4>
Date: Wed, 20 May 2026 17:19:45 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 14 May 2026 17:15:14 +0800, Chen-Yu Tsai wrote:
> On the MT6397 family each buck regulator has a separate supply. LDOs are
> split into various groups with independent supplies. There is also a
> supply for the regulator control logic.
> 
> Add descriptions for all of the supplies for the MT6359.
> 
> 
> [...]

Applied, thanks!

[1/6] mfd: dt-bindings: mt6397: Add regulator supplies
      commit: 4e01a05330d4366924e622467a6654d69a6555ec

--
Lee Jones [李琼斯]

