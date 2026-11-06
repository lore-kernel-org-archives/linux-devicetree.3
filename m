Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988510;
	b=BUGeEXnKi/nVkIUOzz9FDkb+Ta3pWDiQcNmLCkeOkWuFIkznzFbYPc6iPas1iYrRIXue
	 I46DoQEYaZmfPTWeBhIjCQChAz7+DTxI/8Af3H6O+Er1/iZut67Ht/Z8jfwl7xYU98cyC
	 otn8tttvgMowHm3eYRTw90EFQARFdu6SdsjARLsgQKjNb+PShuoXHTKR2qk7cwgfbpXnn
	 EY0a/uBTAquo+87Hncn3Aky7FVvnf0QQpdJ8kj0hRQ8bx8kLlVc60WJJphnrfUR+Pblg7
	 2lvCpu9qzJ3ir5+TJ2xP8Maal0u5jPoCC2fq1hjOd9LxRbX1V+B+TPoyPucfu0ArNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
	b=4EWTR2TjnYYji88Ry68kHhO54KLNJVvN47MfymAjODCrWTG7d/se0w/oeeiJVyEeaSiU
	 f2Y+kZsVANQSgTWsfP1PWFCiAo/hHoC6cIXRbfZ02jB2KINbMWXmijaCCN6LclFQsOMm2
	 ly9Atja+avMvmU24CRklm3yb4erEy9o2vtKquOTVGF6nLPSIGlyswDve1sM9SOt59wbQI
	 9ZDkF2W+qqokZKhjKKrwE5rZOrezlBwtr1S4owRrFVYgyZ1Ciq29AYJ+iZwhtpNckswhA
	 O8OFNofYwIML8Tr4fBbNWWF+esa8OcbsJKDmx6a+4o8ChCzUcW/q37NbXZtVmX7hr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl9kRzom;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96752606D803
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96752606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl9kRzom
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so1679412c88.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988510; x=1794593310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=Rl9kRzomM0oOp7wdeUPW3WC/r3jSD7fJijNyagohm+2yzcSET8sgMWU/dj2Ag3f6hP
         KP6il2thuDeIjuhEs2wc7Y3FblUJTxFjFihbjbVB1WYfkbBs1acdnMgRBWvQZWlEp6mx
         YR/3oZ0EpGaML4VkCYH7EAgy6OEgLX0sDq6S58wBs8uCEVbkEft36UaTLTxDlJ6J3Gab
         TsBmrqoY1HDT0miyy4um640FxLyIDCitna7S9zjGJqkevEittypG5FOPmBwZIR2kWJvn
         Lw0lRxpM49RPewr2m9yZycwXZfJX/OyfhIJg84yXOsFeNmo4WfUUzFoVsTd5FLvYPF16
         aMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988510; x=1794593310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=VQkIt8bB2rcDaOmY2BLBr1Ltu34yz7IXaNQCRk3zhl7iPoqJHnBnM9d9XvFF2zHEfk
         xso+xMhYlG+FSpHypREmiyqHzpAJO7Va3KsLmpl0VGNpjX2mSLEeiDBwHIyr5SLdVmB4
         mz/bASARBXM6TnU9G2zHCOosHDH3BVJ7JsuGIHSUU2mn5Z315dVEcIWzsih+9V64BDba
         PMMJ+3bviH2aSIgwKQfSgJ3q3rsbppbP4aGwH6+YnVovLLqfYnovfNcUo7a9nZNwpWZr
         hSpHPWW50ukkT1NxM9OcuaFWoblnbZl6J9Y/Z4ZnATvoK8OepT1pRDa/wXAmUNDOVLef
         QlcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4EMVutgEt0cCx1M51BFWY0WqvQjCLSFM2PI30e79VLkndj+wBNLcMmZfpG70GEiGbEOFE39L4xu9+@vger.kernel.org
X-Gm-Message-State: APuU4Z81zBFhyxMBpnZToBNOWcJqnwLCklWZRi5o/AszoZLKoaKGo779
	lD3xNEMqW4FjcaPschPjbwIWVvMffBbxgOwdmzqyldXE6D42RHc6Xaqn
X-Gm-Gg: AYBFou0HAIl8Y6x9zEiPIeKjrRhZe5a+1eHTY7vqx+vvIjUuZ4aiDosQmcnWYbbKGkO
	wc6X8JE6wnMBu8kxuQlX0vTJ2jNZqwgClB1Wcw+amItaHmn3MBlLdRw2Eps7esQ8r31wY8KsnvS
	TKFvRkyFGldjDVFIQn5HEBUsOaVGUnOfJbxzJ7nN94pFX99kNmEUXq87CozGdjpN4Q+WRtE2J/I
	xyeBrdGyWuZyoKuQgolBGvunDaXVPmJ1VAgLzSD+O702N2/0TrDWHBMr79rDYMNwy+RUge4o+/v
	Jnon7YrFYOYWLvKdTCcvct/MHNeBUY3rTZSS9wtunZqCFmWi6FecwgzcZaF7Jhx2Z7plCW4LZQt
	y0YFM3eX/Nd2RW12GR7gJ9KF0TplsMb9+c8qejJ7z3fCoTgnM3aEF6xrg8d3i+V48r9EFwzJmV0
	19Tj9ocwM/WRzOdnLwWo6sGIsu17+l1MnPbtGKM3VtZG5lT8ob8UcBalmtSImr7UuLvJxDKKX5U
	MHWqKUwscTN5nQrtfgsnSoZlsIgJHbAD7jOC5xeKmS3i2bzzi3Ch/V81OZ2bCSYMBUKAnyNA2xI
	0J3D0jU6ITQceIzDA3r/M0sg7jghNMCMqJUj7VmxIvIqHzbjjRy/NyQyLY1Uh/QRgbzh
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr3453567c88.10.1793988509569;
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm7443467c88.23.2026.11.06.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Date: Fri, 6 Nov 2026 10:08:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
Message-ID: <au4Xis7Ei2th7xFZ@google.com>
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
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
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>

On Thu, Nov 05, 2026 at 01:29:12PM +0200, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry
