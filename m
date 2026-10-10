Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE123BD17
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598817; cv=none; b=Nd5hkD7jLhZnXvy49pFkZjLcVrdiyL1M7WRUQg0tQG9fA/dGxIPmp5kCAUwBvIzD8/vKhB6j8GoBSf8TvNa4WsthFVoq/Uup3/EvxtrGnkasl/MpBuemK9yKn/Zyl0CPB5mQfDd4fgeiOpJGvqLvbpNZ99TD5iP513jVDJu9iIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598817; c=relaxed/simple;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMuxHe9RgLV8U2Oaqq9wrmHm13UPSgBw0dxwYRpspmQXGzM0M87VB86PwL94zRlKx2/bZ0kuCzM+UzxJrwzE2aXREPlzgOBRWjVxV62shvCJHHpiZyFcZzSTycb4IcWMXY50ELYVUr0mudk6XcRKGTlvVGAIIHLlEC3DnxHInoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bedSKEcd; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bedSKEcd"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so248819a12.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=bedSKEcdonktUwUOm6kGJgnOp1+atn9lWPkJm+9A54WEWeLJq2NfbMTh3fMmTqhWG8
         1ATBLPRzno7UPJUAdmSOVqNTlvxwXqsRQ8NX4tLN1zO/1Sxgnf+qAlMJYFIuPSLphXbX
         WVrNgv/hyIGWKw0KjB/Ck90NEgloNgeJNTVocHjOLCz+s7NWAVrBR36YHCVdECO2oBrs
         7552wICnjntsQukPvk+cpGcKljXeJvIr7MflJ/uh9KamJQizF98pvdUu247rphjHMfUJ
         +RTGwyw1P5U/GBlUqRMB9bao4YEmQaQ/07AJwDq683jWmnuuoz80faxx1uBQ2mvozT85
         AYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=pI0EtBks8g+jwzH4uVKfX6nFTkPgU7gX1cJgPCPKdD5zrN6e5+Ibx2LwtBqXkMb6p+
         deCb1M/sEU7RR7FZcrD3aFvsjRT7baCKspJakV5DUBuaWkokdmPez0V0F75nbgSe0Iye
         oU1YcchdO7TL9iTLtz+bmWD1Mb+c+2aRrBMCMV/skPNTb+v5NfnSe0LCJY5QHbBfA3OW
         vxx+63M0qr+Rb220b8Meu0Bc9KGcR7CfNR8jlUDpjbRFM7lk+5vP8Dz2mZQF3rt+xhRb
         eA5qy+TK6tPjBUTCJrquo9t1LdGG1qOImzGCbIasvYBl5VmJo5Mr8KCKAsgbJO15JID8
         QTkw==
X-Forwarded-Encrypted: i=1; AKwUvBxDxEwk3OZwP4V3e1H6UsjMChAqEkGNkqyQqg2OMoOVznokacMzIb7wBXzUhOjVOJCT8gvSLcfSNNv7@vger.kernel.org
X-Gm-Message-State: AFq9FYJE6vcpQMLgCI+R2sEqMv8ODr+uwAhFiUB4UxvQT3jlZqX37mkq
	vWb3+jhMP1VaR+TJGBNqAZfcd9QfkNyARpSW4/WEQNuNkxkqRcRrrxE6
X-Gm-Gg: AYBFou1Yc501OIOu0EYnu95wjCg+h8pMT3uW1q87VJ6ayBVi0VX/2/9i3NNfaISa+bf
	1s47Ma0D8hATuKBnPnkerI2TCsr8pc/2vdBisC0VXSDlBC4z3byQkBXG5J+nglWR6VWFCdEfUsV
	T5ZYWUiRa0Beoh4zIw6R7VRRILUU1wXUtuhnKbVlu+n+/Y/5dGX8OoTl2jOl4crQi9OFBHLNWjP
	GooewZIFomn8qe/5PDgHPNHcaW89Otk6sEsks2JyJQ/a//jLiD0dE27YqZhAgoor8p1ddAJcrJh
	cujhhnqVRyguT+NX7cULdQeTWzhntUDmJBo6TnIh1+WYLTVOJ8eYjgB35sMrkhN3MmpejnPLut2
	rNzpL+9D3DL6Ke6Ip1y/oXki4qoQOpdiYwJ37ic2Swhb7gBCUdp10wae7aIRS+VzPlYN++uU2kC
	lO9zRUwMyU4CbVT6cnnKqI4CbnCARDz4GIERGjkeiSRL1Kg2tNAQ2+aoH1UTXvPZHzeG1Xt1QJP
	vs5OPlWfGx7eoW1JaEYDFtqq31Ust5pBX1UXrPAUtC3BhsSNaLziETfIgEaPa5bPrF4ogCWRO4d
	Hc1AUg0HnECzCPIbuEu5PxQvJNcsGM0YAVgS0QaOBmAIzgJ0zic=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.


