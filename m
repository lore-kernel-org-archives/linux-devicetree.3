Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776685;
	b=kL0HFmTzGseZYJ5p76TBcF/xEI5N3YGI+UPIVixDbCuBNxTPKqhSsszB7R5ITx59a93q
	 DndaksIHBpQlqJOs+/AHhR00JtMpE0YVj20dyAy/sSiohi69ofz7gH6DJS1q/nbuskENF
	 44vvYAuvzh5ToE9rK6q3wksgKdnqzwCxDpKQWlSQgCL0+dYWDHSbzx4MBNDt9Jlwy+t/X
	 jpYp1WJkTLere2dVJlR0cF+MbNk7OgtjP9ctpXmMzy592k/4ewhUV6fPUOc1Sy/dqgITy
	 pJDduoGTcf/Qxx8cEqqL8CeapGfJDnIflbAmLrCbjMOVBuCEmMMRtqsk5zdPrt5c2TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
	b=JCxnPcECwRRQJXNGCnlie0Phm1VCZFIvkHl6uNJRkCAbRmOA43UMfqVDbuJshsTzaYTT
	 DID1gxCySCVyYugsgSqBf2AKoveZEHPxLO8kUnrYFiZ97I386OqcBPmN6mD8joabV5gbo
	 K3n1ht9J7y+h5YSsEks4/CHjmTXEHJwuZ4F9/woLyg3txIar/iIVPUTOjRW7b4nOexskJ
	 addkSlkAa2PgOZtK5k0sOvwyCgD+1SJ/S6SaETVgzMQjcTM5RR6g1WcHHLTjlJj8Iopac
	 4xn4PYrwGxdWQV6H8VoM8qqR/qONYV0n7RsnaXURJOqAzv4K+QaI2Kqa565H6T1uWwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAF606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BAF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2572527d50.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776683; cv=none;
        d=google.com; s=arc-20260327;
        b=AfvXH0/8AkxgPcI/pDo+iuAA3BWpqMJdaoLlUhVuL23dcxM5lwTs679/7IZIdoZHXu
         pgSnYO5fwEYo9Lf/57ytGJsuCCyEoJq6QUeb4H9cHrbpDbzeFbxFiIxlzmQarMQgqGvl
         6VM6qtXX3YsekOEAlBLlrvIkmXPUMcwmYl6TxRGjsgDncMqpzNjPvsjPqiHRoa+Zubvq
         862PCAtSixF3vfNHPrYuIVYviZaZGA5Rkt3HU9ZLK99eHbUJcQXuQ/BrtATZiq7N4bjI
         EqFpVpqbexThX5KT5pQyCBFZZauroaEQeok/Gl25GGMZluten75Rn61PqefblDyXm746
         kKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        fh=0hBrNRBTXSvk6n8FrTzm+E9lplNb9/qYxvtf8Tkm778=;
        b=ETQeX8JazvrodsJW7ZvQ5QFv8dYUyJ7/yG/rsW1x4NzAMLvzVlJUDAJQLksoXf48FD
         AT3hv9/NESalXOKvSzJD6O37MzIhl7a9ixGf8TniaVcotLlodm7Ra8MlZIBbynEcURlG
         SHULU9jLhpvpOAgRLB21MAkIRcTeI7vFot6za7jiciEGGwz32pqAPMFtKxvbbz98/LxQ
         IO3WRpmD3dFuy7wUcJj6Rxzq62rhUjD8en68dwE7z7rb4urNk9fnYkMY5n5AdSah/CD5
         6FylubktJTcRSc2ztKrRFi4y6ADaIDp/gfk/mYwwv4C0UY+XbUuVIlxdiogLIAh/fMax
         5JHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776683; x=1795381483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=aXPCVwfxL+U9CzSjw15PUia7M/Maex05durHtcijeoqRj39L0XOsvUxgOm5jygXmf7
         dsUly9B5FSkWRJW/0AfffHZktcq5Tn1k2yDWad476fvMt7Q8QS3KrB6uTQd1Y7EwsQIU
         8Tjnk7ldXmlXusoxA1JB7NM/0ejeOtNIePsRXX0ydmMQ/kisjfO8TOVCUEO+1c7D4hi+
         7ExJ+ufyjAyv23ItPvSej33CXAfl0Zr/tbvjXXFLurtBDW7auR4pziSiUURj5fBn/hp6
         +m+lAHg9M/T1nj7/UGpSyVeGFF8KK7OClKihchyjewwnJQNGcbQguSy/O0ABI/jb8QP0
         EMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776683; x=1795381483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=NPHVKmc7eE0sMedjuM6ST6cY+IAsLT8FcaGho809MIpJTZ7KuFJTtlFl5q6h49/+yM
         K6mgluJCcxHS/Bdili+kvjaRKcG5E8ISzIW4w5E0RPztoBS7rL3UsGrJiqQBiorM8Hu0
         awbN9iaxorjF+PM9wsuNvfRTUAK5LW1lB3wtJZPb9Em2oH3YZUCN4kac9b5tw0qpkeEQ
         XDodxbVbnkn4LdW652Et7K4eDPo6BdwFS7I+Bql1V7wLWZia+kz8sTaY8/QpPdQb0AWM
         +mDUYOhEYotChEE1v8raWki7HHF2BIaYnDHRrbep6h2iq8pLKUkwc+Hu94ucyfe/a4i4
         Pv2A==
X-Forwarded-Encrypted: i=1; AL+hErF1v/hUYceA9WCc/zRDHZWfywuLPkrUIMXcO/e2Tp/ckZRpYqZMKCAUklGyXGyhDwLJWsJBiqKzdFoE@vger.kernel.org
X-Gm-Message-State: APuU4Z+bpLnFcxWqetMW0XFCZ+jor3OrEyzsXscpUvuqEnFDm33dUtHC
	lvEge00IqGMp3GtMRy8q8dhAkCp4PLzeeT5agbie9F1Z+IXxjNU0jpIKwzjRh+KX7jbryQ/rREy
	jDkX/x1PJGROUwKmVL2W5EI5L1Ow2cqY=
X-Gm-Gg: AYBFou2N+b58RQxrYQthupKDHPISxTNsBU1IZJoZ4+XP/DwnG3WLIETn3P82TT0v2Qc
	Ud0WrzbzY4PNibtqUmk0Bsvua6zSJqILSKtzYRuTs0dnGZt1S1feobjNsgXZM+b/9BgVtS4N9Bi
	LqLMuypE3L6kqYLTvcvJvgsKBnbzODZWPmU2RjEGpdv16dLVsbgOGJ/BrHzMnTUCjfU1Rx8z05N
	JUF7ha49tLzR8sCzfudnMhdInvyJQtC/dYkxtn2pEjBs7LlnovG00YdAUgjTt939WkvD/1iBk5f
	Ak2ghnb4fhfSaypcGOoXjYMG6biA6d2QJC5feiiiZr4FcCUGiszUguvkkC1KwQsiHb1l5nVyNPs
	N3PuHXnBnSvHnB1cEktZy1oMMYg8J5Fgk3pfO1ztpLT5IKlN3h5wynIYybb/NRjZK1k8PIw==
X-Received: by 2002:a05:690e:479f:20b0:67c:2b34:31a5 with SMTP id
 956f58d0204a3-67d896aa73dmr2886678d50.56.1794776683083; Sun, 15 Nov 2026
 13:04:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:04:32 +0100
X-Gm-Features: AclHuK9HsBcphbKQs0k8LqAA9uRq4kzQTQJzZ3MTf8At638gba0WRnCC9ExoQzo
Message-ID: <CAFBinCDtqNQM=89mQ9uw7hr1CJVGo5fHNPJd=jAyDZ3+L3wCvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate module
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
