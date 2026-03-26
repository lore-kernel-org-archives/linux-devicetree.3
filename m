Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A13B2BA;
	Thu, 26 Mar 2026 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505414; cv=none; b=gPXTBpbku9a5FUxg69BFzaeIJAxd/qvmuiNMQR0Zp27YH3GgWbdE1Bq4Sceh/FMm36Ktrj9e9e9xDw78v4LDA7tTSz7Rh8Ko93tEfNTt9rJ6WZSJTm93/FDZfTFvydonNmn0xQzY7IYa8rl7wfBY8pnFngPHk0vdo4yzjc/uf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505414; c=relaxed/simple;
	bh=hidLBtwhQbxPBXbheN85pSsa8RQxYeW+MLrk6uzD3ac=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fJszJaraifpBnA2bn+rC1quSXtl4Y7Svsy9pu673ekYtE4LDiEYyMkPqxKXrbP0/+cv+gwmTPXlEHsLxvHFBYj7dBOiOp8FrGq5DCdQK4MFJjVnVBTvxHjn6G+7iM7yXUKuIXsDvhYVMaZUcCkJWTIaPuZMdPwSr7xNVhMasJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KMhiSzgs; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KMhiSzgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774505411;
	bh=hidLBtwhQbxPBXbheN85pSsa8RQxYeW+MLrk6uzD3ac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KMhiSzgs0FiJF1ZY/gHkQ+gt0zCunXJNaCStpNJfIiNdsSrkcKNb5QW4c5Grx5QBE
	 ENlC2WhRG/AQG+nVfFt3lXtpRvLKPI2NNgQ9qbL7UR3SevefGE6eu+AJjhD3bpI9W5
	 NdlWFj4g10N/XCODybZzWndp94Kxey7+q8n6iayvQknF3uu7P7Hjm8WxrydLnQOWuE
	 9qrSj5odCfF9zbpupYHRX27hyo26d3auWuZsCYSgmwTzB+6twIozI8Lilaw0jUie/B
	 O8QIOOAqxm2R99ITRmwjfSZaBV37z6Vl0/kSbm27JvCsd+Gkm6Pc+aJAldaXi+ik7J
	 VM5DHsKt4rviQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D19B36597C;
	Thu, 26 Mar 2026 14:10:10 +0800 (AWST)
Message-ID: <e24ec25ff7d731cf6ca094028b1336dacd01ac9c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org, Amithash
 Prasasd <amithash@meta.com>, Kevin Tung	 <Kevin.Tung@quantatw.com>, Ken
 Chen <Ken.Chen@quantatw.com>, Leo Yang	 <Leo-Yang@quantatw.com>, Jackson
 Liu <Jackson.Liu@quantatw.com>, Daniel Hsu	 <Daniel-Hsu@quantatw.com>
Date: Thu, 26 Mar 2026 16:40:10 +1030
In-Reply-To: <CABh9gBe2BcgnONwx=cmcOAsT15HgVGjxSChgFMvckTAW_8JfMQ@mail.gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
	 <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
	 <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
	 <CABh9gBe2BcgnONwx=cmcOAsT15HgVGjxSChgFMvckTAW_8JfMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kevin,

On Mon, 2026-03-09 at 11:34 -0700, Kevin Tung wrote:
> > Broadly, it feels a lot like you're revising platform designs, then
> > trying to make the one devicetree fit the current design, and are not
> > explicitly communicating that this is what you're doing.
> >=20
> > If that _is_ what you're doing, then we can come up with much better
> > schemes to handle it that aren't a constant stream of compatibility
> > breaks.
> >=20
> > I need you to engage with this concern.
> >=20
> Thanks for your feedback. I realize there may be a lack of knowledge
> on my side regarding the best practices here.
> Could you kindly guide me on how we might implement a better approach
> that avoids a constant stream of compatibility breaks?
> I=E2=80=99d like to ensure we handle this correctly and align with the
> expected workflow.

Sure, see the reply I just sent here:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

>=20
> > From inspection, I only find patches 1, 4 and 7 of this series to be
> > something I'd consider applying without further discussion.
> >=20
> Got it. Should I split patches 1, 4, and 7 into a separate series?
> This would keep the current series shorter by excluding items that
> don=E2=80=99t require further discussion.
>=20

I am okay with that, so long as it makes sense in the context of the
discussion linked above.

Andrew
