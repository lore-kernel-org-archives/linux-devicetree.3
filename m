Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793573885;
	b=jwe7L+FxNnJ0MNddGwMNeh3tt9gnxZOQCn4CbXE8e3K3Fzij0SR2f7fJUy7WtUabSZbx
	 7aFU73jGlwoJoNHL/00SmDdbcp8tPaOg1Rt3HIdZHkJXQ0a2Y5LKCpZ+swh42uWHFQXtg
	 RPW/3nrRAAGhMifq445rlsK/WflzIKN661wW9yJIh5AG/bASEQtLKbTFLo1rnxDRL/TwP
	 OL7j8ubz0pXJo7zaeWxY4bFs66ss0Aof1WmLy8v+RSBV2UrI41p8vkeLhGwNM1Bdsd5ed
	 eO2zOGC++SxDmb3PBbfWcYUU3yhl9g6X53QCTUjM3CHp7YXORLHzytp/cbiQFqwjr4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
	b=mBMf28H7bXRrlnonNuUmoI5Dyv8fF1PdTcS9rsnxpgCRlCS3kQatDfC5/fO9TO6g002b
	 Bg2io51tqYCnMof5px/NbEWu0nVOqsvisHCu/kMPKwXeBgudK+PnxMKZdyAo7xhHXUa+p
	 MUKKx4IThvk8VRglBA4q5rqlvxxmRQmle8UrRytmX2qKWewQIXEWtAz8U6uwCRU0X2ohF
	 841U1mWfK2sX0rZsoPJ+zWgih0nck0Jr+2ckumPp4ygHYRUgGLZl0bVoVxyl7JCs+sLqn
	 4ansP2or7sQecytte/IDGU3kHDUrCFBytm1Wxuuz8A5Gzyse9y4U3xV4ewBJPEulXGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0gw6988x;
	arc=fail smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EB3606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0gw6988x
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677bc4704cbso1961036d50.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:58:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573884; cv=none;
        d=google.com; s=arc-20260327;
        b=XxHo/kN2aze8RbEW/Y7zbJrfIdb3caM5itC9cJtvswnzlFSVR0FijaN951yMVLws2e
         flzwD7SqLWyPLMBRtQvY71w6qxJQPxlZNhVnypeFZ2tjzON2mUFGMl/C/IdUITUW2CoD
         21j0gRcS/GjJDCzSkqeXViZvwyUsDorE9RyW6oIeBrQGRMrSqQc1rPfRbtSzd0TX5yc8
         S3yJceyehegb/Ctr9EsY2MreOomI7LacSgvcEryUwzf7bufXXc+ltGP1YZEnxDmTd7FU
         srK9WQgt4yzjhY0YhXRLKiU2ohGEUqLnldnFVcUuIMEVxuLFJACfNYqfc4k6J17W+4at
         lAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        fh=ONMR696XgLybd44DN1jo7dhpVP8c9fsEFubyzMxNB1k=;
        b=dDiuSy9WdYi5D5QjiTsWOExjIKjcU7Nlp7tnHb7cmkev8bcKApsg7W3OkapvElf/BX
         J6hrcOajMYnQA/UvuaGi4ujkgPmf3AIISuq+vtXf7uGVxPkrLeJoWVIL0Qkac9LnMjBg
         e45I0FELooP/a6r1JF5LrqtTnrAF3ii3E7bveFno8zbFHVze/3qXhJWRguU0P1G4PIpE
         Kgk8ChyG8Tekf6fS2CkdYJAAFm8l+oaecW2pnfFk53enMIhzAliLP7/RURs3MKE2LhCV
         3zU9RiKJ74Y9riy3Z9Jf8xsdJqHsdg/7rmLErIZg4YS7FY0Y96dQeanAT+LRHiYDwkxm
         FSPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573884; x=1794178684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=0gw6988x/OCDWClJuRql+I+XqjdNXzUvr8O7ZEWcoZLYy+VvIdMXHwqGOzr8ayBDVe
         yAEgvkjZgxnOlVYfaCDGwnezLFdbkElvBGH/pZz0JKPgX3IBpkZEB8IfvlFsOB5S7eiY
         mnxJzw5l3aG4qaWan6aQn88UimfqUzjZdxgFQGUx4s2is7MwTOOLzoXwLaoKR5Bri+uL
         SjsUMD+eYTbmShVuq1uk/p8J6RsKY3ex7k+P+oZ34VZqStq4oW11LtZUeXg0kaS7VjwO
         1v+5wT61XpShxrkIiR7xRWxyb0X2P+mLhm05+StfxvxoNrltq5aPXXECR5VB1PiwGdYK
         +o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573884; x=1794178684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=n1jyCnDYGaeHi7w98ZSXL0bGz5inAMnlRwAd7icOoR6eCiUiIiWDCp9urCTSds/Dxc
         LnSC9adgnxfo5wLthcrz98U8d9IhTAjiDUqSHrHCIKWyfF65qSVPC5zZpbUqcSL6d2NX
         faIbQGOi/qn764y/mkpdAWsJFJT3bdscKWpC+OUJIa6D4QZGE29avAcMXlz4eN73Eoo+
         GIJ/VqEP90Ex7Us1o2JZNvMeWT9c7ae5GKUbfjZBO35myI4pnHACz3SiDiCGm7K4fX/6
         a5+mPO4zhTIMQe+RxmX8o0iptCNiP62fUdpN/j7VplqrHlGGt1uyzVYjKlhr5uL5FvrL
         P83A==
X-Forwarded-Encrypted: i=1; AKwUvBxddEN8eRIbrSS7sln/ZGzXIeixit23VzcnSlIhoHrQLA7H+4Je2TmKstS3P+DKEEivYo9PNe+9In5v@vger.kernel.org
X-Gm-Message-State: APuU4Z8c81OKStzBDicSNQH6OcYy28q/dvXZN5g5r73rLpFrie8W0Hp6
	Ou+UfGKdSyWaKXpjWF39kPMQHZh7I9is3o9kuvqzPlylkzA4+/fS38UGLnw7dc+PYgQ6ISjbDtJ
	GPRIJy31Y8Op6wH2NV/GnnzGt5DIvMZ4=
X-Gm-Gg: AYBFou2+LPyG2jJnol56/TZExoEwIYfWMfF+0ohIgrx7ShYOAWEhD9vQdkHkeNOKR7z
	oa2iH1wcswROf1gJUWBmfBgalI7BSd1eQtO+JI507Rh50eDsensfClsDjaRHUVsuFw5vIKYuoDd
	4wWmSPx/iUGzX0St7F5gQ7C+QC0Vr8bS9p0AZ+z/o1Bln4N8ejh4eu9neBLe6Q62kwwJhCaHz0L
	LkokB0QXum0Pv2h3czxlzEdq3bmU+dTCEtSvzBukVYlJv4qzR2FAQ0drFsgy2fTFhLGU+L0eVwG
	Fyp3/kIL5WwcmT6Zb7FabBri/vUXLAthRqtgrCmHHKW/0XZ2N4iLTq4ZrmBzswBCWgeDrxw/aRz
	KimSjIkt5ApiPWEU12s8iWzFKBc/J1sDdllK8wezX5SgRiC3CtlnTe+f2Qr7dSDScMsE4Sw==
X-Received: by 2002:a05:690e:4507:20b0:679:5bea:d3f5 with SMTP id
 956f58d0204a3-67ba4f7cd36mr2946413d50.50.1793573884100; Sun, 01 Nov 2026
 14:58:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
In-Reply-To: <20261022200640.3101932-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:57:53 +0100
X-Gm-Features: AclHuK9XeeIDEqdtINHt3p0JMcC8yqSM3_Rvc2uE8IOAzFd_ujX08owtUzvHpsU
Message-ID: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +       if (!dwmac->data->init_delays)
> +               return dev_err_probe(dwmac->dev, -EINVAL,
> +                                    "missing init_delays callback\n");
I'd rather let this crash hard to make it obvious to someone adding a
new SoC that they forgot something.

Other than that this looks good.
It would be great if the netdev maintainers could comment on whether
this now matches the approach they had in mind.
