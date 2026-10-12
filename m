Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E13A168E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812999; cv=none; b=Xr4EzxaQQCMX1uHfs07ixIfV8ob/nJQ509bQFSnLwSJuPOWm1/XPGovocy9H7ITEpjvuIL2gXmCQ0BDfaDbRh9h2C82AYy0WmwczYgXBaTcxuYo/jH5e8f8yt+g2z+mJptxCfMWp8hFlheQSSxHgI4IVwCUS+xsRamupoXblNpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812999; c=relaxed/simple;
	bh=6QHe3gCwglIjK90q6m6GkJpBsYmYtm7uNJvBv8QiNOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ddCSlFoKqIaVyfZKhswOHQHOiTsZXhGc5mTPw00Yib7fCEr59dIH+9l5YFwNVk2hmj877V1LtQFemnWAVCoV7uM5ItbD/CxvmDr4yEK+bh11mL5vn5OYein+2Yd01v8z4gpAU7pMdeQeBMOCj1/ZYy8Z+akJa1J30PbGlLqKCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhMzjg0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhMzjg0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso270299266b.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812997; x=1792417797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=iPhMzjg03qo3VjzKOHMnYWKB6CCotLGA25LVgnQrXXRmEaUqE7KTvQ65WdpFkCTEdP
         ef55VPVpXLCMQuMT2KZWvAWB0gsBSQpAbIupzVvAMgs7f+RxgkcWcbBazaBbYzkqy4YC
         rRn1GT22Sh3SskgRfEd8sUpI7GCA7Fp3zTuYtPaw7176tbJCY9uXoQDRgKNulyqpBDyH
         t5aLoZiIOCqi1A2wzoJx3DRQVXYt054b1UhliILxcucVCtdxkWa6cc0uNr/tprQI7Lkz
         FyLobfesX200aht6EBFa1nlkG7tCh0sjnTLByMPgYrVZ8X8Y2G79wipL1uK90jRcbkUr
         +E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812997; x=1792417797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=Eg/wS9yaMOzK26yfBw0ULWI/WuVtWVY4S7z8o09cMeRuFjso7jMRvOmX8xQTbPToiw
         SiI9a+bzUtHCzBuVKg+EFpGS+wkzlkurXE/ITgNGQkkUBQFyqjuZG60wMkQ8cz/OaGZd
         Gd0Odyu15B++MSAn6utBq0Cwdxgt4JqELPvUnwGKr3tg/UTDW3Ubl6ZEYn9PHmqLs+oO
         Iv68gsINcUcSKzKCBeySukWoatiwYgXB5XknP8PiNNhvIr/RitR2JODK1ww2jLct2GNF
         c5I5nxfmmiimc7uW88Zrt38bzMlYnFzIgu3h9KlilGt0de324BarvwBnkZxtA+ocG9pq
         wY9g==
X-Forwarded-Encrypted: i=1; AKwUvBwW6cQ9k6w0kYGZrsHP1eCO/K+nDu7lG1Jk4jonKqRKqmZaTtrMzfNDO9WykwT5BI+QgoLNEOL5lAOo@vger.kernel.org
X-Gm-Message-State: AFq9FYLOERQB2EWnYLqRDNc7h3j7Is++uBmEMOXKGwOfLAqD2SNZ66Bn
	SvZs3o0+fSV6IvAVC0HqAv1421yTJxlTQ5WhGoHVx1x44lnaQu+troaG
X-Gm-Gg: AYBFou1/WoM5E1dTtTNrVOmVkJ7nvvC6CaJv9zAs0efwy1uLAddrXCPR2d+TH6FAqxB
	Rd1Q8iIRYJ40Z/LTGyqKVPncWzU/jBXg9iHsGmuJ8ef4buvUS8piak0ouuSiH8u/eFvoQHzZ5k+
	zoZNraQfip0L96yidSLBA+eQWTMGfPMyV/ORhFOrE2xdFiTdX1ReKgKetoT2Hx8sNYmp2E6O8dR
	gxkJCqZ2RtBSULTCQpj76xd6ot+eavDScmX9IzBxYqj+PC3Suy4+mlZtzgEg4ClZGorVTuZNyV1
	K7ICutlIcj0crzXfxLp+ZwklAqIJlvpbOUTmFpeE6zhPXsCjR+Dd2xBSmWqp8koHPMCw9EODygD
	KxuAnPjRGASamZH6C1eRjD/i9vAAi3adgxktfnR/NWwxxDY/latQdJbQ8u5+5ybDCywyQhed98i
	5YvOPZZeVnuJ22lAdnlJDh/IgNNO1cFm1wLQkoyJWihO4d87sBOa6LGgV/WEIG/bG7R/nL03vPD
	2FDnGmCGpf4tDrVo8aMwETxcvgYAcdXUK5/X0ozcnejPAJ1dbjY1KH0t+YwGsAbue1rGb5dPHBj
	kYZ6zqZBA4OJwEh2KAyCjFanWK6ccHDXa7yQst9w/fANGW6u2vuCK44BckwKahu0KnfmaLkitzR
	e2s25W96S6/PDaDrGet9m2Rb9Lef10czGjRksfE6IZ9zg914oHI80vUZngL9hrldwtEGAaG4qmE
	UtpvaJS7qPg7Lq9cA=
X-Received: by 2002:a17:907:8d8d:b0:c26:306f:289b with SMTP id a640c23a62f3a-c31a9b0b097mr807813766b.13.1791812996554;
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac6a4sm19827476f8f.28.2026.10.12.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:49:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 4/4] docs: iio: ade9000: document ADE9039 support
Message-ID: <20261012154954.000075be@gmail.com>
In-Reply-To: <20261012111342.48040-5-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-5-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:40 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> Add the ADE9039 to the list of supported devices and note that, unlike the
> ADE9078 and ADE9430, it does provide the on-chip dip/swell events. Also
> document that it exposes no total reactive power attributes, since the part
> computes only fundamental reactive power.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
