Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475755;
	b=agwNbLmBN5rSWb+fC9NAYwR+IOH8UvziXelmjILzvspzIY+ZcYN3hhrDsMPhXO9uYx4I
	 +DmG5z5mtK4ndB2HurLZ/7VmZXfuTiV/KQf8wZt8nFPnJzbY3JKEJBuQ4/qTLq7o5PUqE
	 Mj5/+ZkAnfYc+ihtlve1X12c2Syvv2HwM0kNoJOTcxZb19KbQHvB6xt58PNZrw5WPnrTO
	 i4GTOAN/xmUdsTRt1TEV2dib+OKWv3uVKiuGdjxQTEaPQmX46OTMRRGUsOD6gDsMGFCVu
	 HPOr91bLl1Mqyojn9K9v9wvps5jHBVfpyjXLR+GpxEznxe+WEKDaUcM69VaKfBHZT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
	b=Pfvr03SqUUrLXf8ebFbdjtyVuzVqa1+ouSMridmu9XDCGbtjdj6Ymr1wZ4irnIqx3OCm
	 BEW8Y6eUxPEkmDH9z2CIYMz8D9Hi942ZO45+JmvhsR8BsKLtwXKgEtPqZrMm3BsZfnMr4
	 CDfNVp/BryZjwWgD2Oo264jvlGJ5HanpIBh6tqq4jd+1DbO9VSHoepgDrWWqrHtv3K92U
	 AdkKj/XLR5bT3rJlgmQu266C+nCtYpO28HabEjBybXzOwT7R0rDn+zjsQ/7YcZx7oVGSv
	 ehknqmoDHnMWukfYAaWY23cL3+Cayz5zpHysY9cZcNZT8vyoSxUq3mmoAwomlksST9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86E606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B86E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so33106475e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475754; x=1796080554; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=wPVV0trpVGtHbB/97bjQWfk2GYqAhNe4E8Kv4EAegMEy9E7FLZuTqBdH1ZjCVch56k
         2vt1WbcahQHEbrkN2AofgMYByjZ9FZ7lQRs1JJ2us4wY3e2t+lne8Yn8U+OTSkhEvN2c
         DWPIo9V+4MCO594r/DqmBqXX6qPeHNVbl4uWNRS5lakbIJ7VahPHlvPCk5gurmHScvZo
         QzLCeW9PLmdvNUZIeC9WBXHwBfn3S4fiKQymdPRLhp2yiuSzbw243y6S3rTATicHq7/Z
         fGSUPFFfYHSt0BNmil0SceTSOBreYF9YF4VwIjsTMHL+LatSuJwxCtTdL7w1wtYrMWnH
         mY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475754; x=1796080554;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=yadqo0dvCQcuP0z5AP+oHaoBVnXNm1wMjWSMf0Mipw0Jq8f0VyYtXI9N8/tKliGXBX
         Z3/TAQZm1DZYzpjnwJ3T2rlop3G6XJHo45mSEKEBaBBLJuzunIk5CPBpxt7px42APCZX
         YHg8Pxt4LNq0vqz1IDa5BC8IcNBRaHXKB4gqSZ1mO8K/qVy7Tl5a7Qs+YPu2MOUQ4i4n
         T6MlhyfL+aPiPG9Em4bbYwkiBd1E60eZRs09q9l09+zae6I4YLGMNST1r+TXnwKkct+r
         GG+Tx9FPwtlp8z0IhlsYAhdncwBlh2FrXWxHjVDakk2YF6Xl7D2iV4QqYz/QMiF5z6sH
         CbIA==
X-Forwarded-Encrypted: i=1; AL+hErHdjBQ1FOVWzjDnIZ2O0eRbA3PMz6yVZVtISvTpR8XJB+QDdnAi3KBZyUmUCfi+Zt/aRI55fknClpZV@vger.kernel.org
X-Gm-Message-State: APuU4Z8cb+ag43nwIn/0bbLz2V2fVsHSnNo2Gjri37ymWLPtLFK4S+x7
	p8uoup76bQoL8OhRPOd4ymULpu6KtAV1oapl2FphtIjeL5ngqqX+ov77
X-Gm-Gg: AZFdTZcmhB2d+zPSbKDKiUl3NDZ+4BXA4g132Bg8K11tKL9YJXiiM29QKckaztmG2rm
	QGKUaVrnbq7IH5nTIsEYGbGTA08wa2lvs2qGkaK4Hvj4EgzSfcg7atWkyqtL/XEz6JOVG9RkBZS
	ivoCPxsx7HmRS/SII26xDuW/KCwhvv74T9ac1BE5aTTwX/zu+5AzcOgEzXPd/EISSGOblG8Suq2
	+xFfLwDinzLrf1ptxSZxjiGjteEtOJuMBoaVdBVgiYNVWQkg4G5DlkzMhWUKrbRx8l2CZLDWAfw
	mZ4I4ooVqU7sKKxsCeWGRTaDZJpzDhGHA9efpXyyKt48iPN0P/vgKLSOVNtbmx6yUJrJi5crBIE
	WCWx7EpXWm+3Noff5RYlUTdzGl0bOhymDc2aYstCHJO1MJNewfXIyj5/kywdUW/nkbnp58auV+w
	/czjpjILsqbdraFPjLrXkGAWz2ksCFTg96M4sEGXG4JHMLUJ8+YLk1+wZeHBYB/9oTOAI9I4pGf
	QGp7z5Q6nyVdpA1f8iPy5/FiiiHVZWuh+8/dQ+neQu+3T+Fv82Wu7Eev/I2X4Sl22VtQGqDhuGd
	s2ClhkqLXQ3dwuR/0Ee/G8gSBdu+7LicSn2gR5p6QnVpddMHR/h4NT4=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr269607585e9.24.1795475753577;
        Mon, 23 Nov 2026 15:15:53 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm214620235e9.1.2026.11.23.15.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:15:52 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] soc: cortina: Add CS7542 PCIe control, SerDes and
  host support
Date: Mon, 23 Nov 2026 23:15:46 +0000
Message-ID: <179547574633.3.10816077515932240445@gmail.com>
In-Reply-To: <20261123225447.GA1119216@bhelgaas>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123225447.GA1119216@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Understood, sorry for the rapid reroll. I will wait a few days between
PCIe revisions and collect the review before sending the next version.
I will use the meantime to address your comments and test the changes
on Almond+.

Thanks,
Fil
