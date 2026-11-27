Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802217;
	b=08brriVNUpLq0oaN3NoDkTM8Fw2cJlvi4C5b/ryx9B5LODVRSvX3SejaFnbXvclo9jGE
	 UwC85+ARFb9sAYWQiS7ZLggn+0mqE14VPy3makPioj9kcO4sya75d0RJ/bms2gsA2YdU+
	 0DH1P3Mk5J0rNKFhytIelCUm9iC3tsw6E/bim1lIcjAzEEFZB7TUycuG4X1biR9sR8ymf
	 lu9CCEM3KUT81QUKbY2SNGDi0Iu0mlTU6kovNAPzcN4Z0uNdWRrzGmPXGFui+1l4ttuVZ
	 j9EZLM3Db0aX+M4Y4olwiXO+Wu2tSi5NbGjbF7LTREGipVc6vsgn+zhvqofiTGsvRMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802217;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=;
	b=kW3SrFMzA5lW4YuUk6DLmhDmztSoldcaa+iWifoKueveEQX0wqIwjmWx5IsPZNrwadog
	 ZlgWT6ojngoFMLBe0dcaqdGz8ZdpQvHZkEsIzTqiWZf7sJOEtyTJUrD1LT5Rmaktr+GRB
	 O95gOllzTB44gxqW4OhhTWeeRJKqRRqgEQULqQZnrym7iwJWxL/4L3VKg6H4aV2fi9O9i
	 KUWUb4KvU6yk7XvQTAJ33GWMgXUB21KzPLwkS5VL/5ylq/ofqMlfp65PCxDCx/2pa+FNv
	 FMyj5hLNKDs/tFLCffPw/v0czlrSSK6zmlnt8pX2ctuTOC7Y8fwGN+PIB9ceKs4GLMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=S2RtunyL;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CA606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 17:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8CA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=S2RtunyL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795802211; x=1796061411;
	bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S2RtunyLpG7AW2lM24pI/U7rKd6i69buF+keQMLZs0G8NLrzeYl5j8V6vBXvfB08Q
	 GQkR8M3KrYLf06dyBxdeFKGBk0ce4/yIFlQ/PcaTMeFDdMnptOFxh3Ti8Xxdet6eVH
	 T+3lQjCYH/g3A/UMhHgpXKuOhrXnhM38G2GuccDP856QDBO6JlJNkuWH5VXPb/ZOUk
	 mqtHtCTjQjQetKQvwHw1pcEg2gaNhpDyE9TrlAOExdufHNKKXQeS4tU+mxm1/RnQbV
	 PzGh+nV9trw1fhTxYvZLiLDGcVnv4dgD7WuT1PPuTGYTqmlrDSE7LUsaa+cejHscG0
	 00KLmzD3+VgGw==
Date: Fri, 27 Nov 2026 17:56:47 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
Message-ID: <GE3qRi7GaGOm4q3DQ5CGxw5EBsl7PZAaMFuN0ZZ0deeH8ibregEYkJBSZjrh9s_wO7n-eNViVRUkNI4B-dEtUWtgtAprhKViuPTy4t2oj2s=@protonmail.com>
In-Reply-To: <20261127030009.10572-2-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com> <20261127030009.10572-2-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 76cd1cefd60693b41ceda656ca77dd37e48de0da
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

Hi,

On Friday, November 27th, 2026 at 5:00 AM, Ilia Snezhkov via B4 Relay <devn=
ull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add a compatible for the PMIC Wrapper found on the MT6789 SoC.
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman
