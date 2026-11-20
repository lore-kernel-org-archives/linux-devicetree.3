Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198184;
	b=iwejrJUVQ7KvmZRII8K1wv8PlSQL2XKUlc36nVV+Ci74d1BD9r+DwJA/jkXzMcnTdbuL
	 u6ZWa4/gRIaP5Im8luvnOxDARxoxnhKK2xHg1LaBWEGksjWMm17RSN6yXYEzkagHVAwF5
	 ZWESYGpoKXnUgMfB5ckY/DLzHO91hd6WpY5gfXR/OZRTIHJLKU31O0hZTy+4UtJH+2ADd
	 0KAdm7m1ojzxbxVszgMqUCymTjTmzJ4onqouMTfBbO27bGeUBu7XUvJbSnhN7Abvhs33l
	 j8vL5Rohx7h+ml9Ij8c9sGYyl7YN+AM/IVLvb8952p5Z+kyDHlQxilEgUjE3ejznJnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198184;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zResQ5ZFMg/74d81DhEnv17MvM7X6Q7FueU5zTYSKMY=;
	b=gnUml6iIGhn4FevhOLNd+apx6XoOHIkY82gOrpw1NIXqTzonO9jMtbwv2hfuC0OFq+rO
	 1gX9LlxkFJvPhaSEv6243o0aGVsmtnNAJFFMyvNcpqqFmJ0lX2DxmAGOdboLudw0KeSSZ
	 Y02F3/NVTlblRTLUm8c/XU7S7Cq7uwTyQGxqLMHMNwkTn1A1Tmwm3gOu1zWXBnHSlySB2
	 yXlnQ+VhQDaMyGnX7XQ/WQm0ek51zNnKHwHOoLd10i/yRHXZwyo+MlBEGDtIce2mmjk2R
	 MNme4friKRI7rcyTqvC2z/xt2roXpE79o0w2JqrFMWcNvqycA4If4vaLFRxJhdvBlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gl467aguv5ev5iqs2hsem64xuu.protonmail2 header.b=GU0CcjcQ;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697960A3812
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1697960A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gl467aguv5ev5iqs2hsem64xuu.protonmail2 header.b=GU0CcjcQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gl467aguv5ev5iqs2hsem64xuu.protonmail2; t=1795198181;
	x=1795457381; bh=zResQ5ZFMg/74d81DhEnv17MvM7X6Q7FueU5zTYSKMY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GU0CcjcQG8ylfbomRVopPquWwjR/Se0fAhQAkCsKeiRhYP5i5gtVT3cmFCbgMTt9c
	 LOJiM/a0euW5IUfsnXqjfYRcUH4bd3YpFhk+IfIP/mPEtOJZJuRqFWE+aSBq3i5Tka
	 2BJUKkvkYtytCkszT9yE5klqJPadwAL3AuBcZXwb9LPN26dDWjnhGFmJeFdBwfoy/y
	 5olxgaZ4Fl1MfqgqljgGoR+i+qqL5xmHG2S85mPIAZ9jcYkwCz66p1gOwwlxPcP2DO
	 ik94CnNb/YQN1al2hveGdvAJu8mQi5iI8Jl++KkbQjTXo85giR0Th21jKs0KXdxwtG
	 ukoLqhZV6brSA==
Date: Fri, 20 Nov 2026 18:09:35 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] media: i2c: Samsung S5K3T2 image sensor
Message-ID: <n9KhEjcupYPV3bWTkYxQ7HeEpYlqJh_SNsFRzgdw_aRJ6FxhfOx08ZCBNjERg_S6P7K3Fu9F__f8f7O3fh8vXQ7SxZbLYk0VrA3V7vhDbFw=@proton.me>
In-Reply-To: <av9wGCsEhX-kIW9H@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me> <av9wGCsEhX-kIW9H@kekkonen.localdomain>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 86d5e5f045ece75d1abeddd62650a96a8fbcf9b0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu, Nov 19, 2026 at 11:54:32PM +0200, Sakari Ailus wrote:
> I don't remember whether this was discussed earlier, but link frequency
> determines which modes are available, even in a register list based drive=
r.

Thanks, that answers my question from v3. In v6 the link frequency
control is writable, and only the modes for the selected frequency are
offered.

v6: https://lore.kernel.org/all/20261120-upstream-s5k3t2-v6-0-dd345fa4201c@=
proton.me/

Thanks,
Armandas

