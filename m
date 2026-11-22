Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370116;
	b=XB6nMSmn77/Jmg5tP+F2gSKZSnWiaVqcyXNyVYnId3wAAcGiT06d/s6k4X5FCg7i6iqz
	 OCfd+mpsgHUb6dKGOFkrZo0yqXj0URY+UP55dmynJjafi4uD5Rq2QXb/tGIvwlv9zYmIt
	 VG/StY11H51eBrjklCEafVwcFPOqtkjwCxyQ0X3wCDbcxhNu13UTMkBj5CYRGxPYU6Bn2
	 6KcDNXPwC3UwX31A7km1wz6M5LBPFuAGivy3Yh0k4xBWnw/LewVCHTeD3ktKoawLrTtGj
	 EbtTzQm6CzgjspagE8n+d6AqUjPScnw2vPlBvGbZev/g489uNSYDYNCz9RliBSvustw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Subject:From:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=xwre5e6nIaPryuiNIoerX4GQbKhCZQnyc65POm3tE+JDdwKkt4FKshKDMhyiFF65XZfw
	 hBCLsaqSC96RVcmt3gZ8SS0vc2OeAMvSGgGKa0ZJ6MOj2BFGfND+S45F3PydsgR4Eq4le
	 etyjtV9qfJfTS+W8krrFLD222UgopijQlWoJ+Nla8hOFJ3G2piSdQg8+H1yvCfZMTkNFo
	 3y59JuSboAKCoIpEPm2mS/iSJXYlS3u/9Y95mcAE26Da7NC4b6fPEqjSoJ2qSMfdAw+bo
	 HGB4I66YYHjAa2hsvHtsw9n0dJ0gSLd+iI5rF2pwdNnuqkMO3uhaFcPvZRo13pa9hUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F8aupT1/";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B137606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B137606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8aupT1/
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso565440866b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370115; x=1795974915; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=F8aupT1/AXXLqFRYnFG9Wa4oKDTm+nQiKVJJpHAjGD/m8srnDYHjHTuG7VJUL6jgTU
         0LshakNGtPggj2pbNgWhkM6Bv3c+6fydnUaJ8nqhmnpdvE7ZKJtQxTy4zukzH4aBsjc8
         cS9lkJBW8SapYNQ0UdfwaqI18nSj0t0fkfsqW8rIUt4aQh7cRwRn4F4+bFYhBjwcwK1Z
         y12l7sKn7AfbwbnERzZ4fsWTbscrrEIr7IUW4+j2Mg6oPYWF8POyv4tPa+yqONcKI8nW
         W34hZbcsp6T/oRvaNKsVtTPv88SzVAxAOlNJaZ6UOMQ7mS6DpM9Yjw6iQmFvlB2kyO1U
         p6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370115; x=1795974915;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=GNRccWkiD1hqbsX/pjr5ppE4P/qrlq88qkA5IoZ9j0oHQZo/QuBAydDBjmta+AGdS4
         yJq7K41u7tZ65qkmTetQvkBBlia68hnlTcn3f3ACSpCu5fiMannEm38if2TdlGe/sCex
         5rkCCP9TWBa1IUeTG4biui7i0/m7OYjCpOUL/045uLprFnWnq6lQHTqlaNz57VSdu+RZ
         PpUj0K+H4Wc/KQrtYguKcJENtc4Juux4nw3PnbfGdKiQNBOePH04NWlrWs3a1CAEP1MW
         K4GN+yODX7eQvCjyXonTejUGpgbqYBtIG/eiQSkdoUGwIvtue/dX90Lg5GysyMCbLF+U
         fXOg==
X-Forwarded-Encrypted: i=1; AL+hErEsO+Reo9heZvkqP95OBSGwJ+B3oFLCQZTTzSSAAnnot66X5oDJJZqN3kjFIvha9SoVu0Z8tc0WC4qu@vger.kernel.org
X-Gm-Message-State: APuU4Z9m+H08sE965gY73KEbJJcex3wAoo0FpvbuM85CUKgFjx/mNLp0
	YBiZgkjIUG7gLTiB+piVAW251+X/O+FewGKxVQaAsd0/ZAuTxM9n2uiO
X-Gm-Gg: AZFdTZcQEobrCNzMb75MtTa/F5SL9sa+Zrse/7vJ3dcvyFijKb5amCyWS99H43oLi0t
	QUyCNpZoWNr2DzN2M3mXx54g7eHztvALhCywwfvzLT0s9aTaZChdpH8LI+2sFlT90ylSoZxnkTv
	SWotlkcRpbjGP23E8FgriyGcqNkPN7xkz7t5W3ZX2TluBgCMGf3biMbLzQ9iE19bjhPloCo7bLq
	Mn1U6/hwbiF5N86JHK1snKOEkngtV85UnU3hzFWoKmiWZYhZJN+ByIvRLe5mYe2sk3Wv/LZacZC
	HhYt+dfwNODCM//b8qQ/rYoERIFhOQltphfmL3RQbssymuzP275C4aohyqtIUIDOGmLQnJhN3mp
	/I3NrhuZqQlJV+wBG6GmsbQ5R0wajAqhOaERE9vRbBDNuLZqwtvwUqYob9lYE5kCtBV/O8Zp1n/
	/qoEWyPSON0dAmRubI1dlVS8tHsaA1Rx9UVRTpevx7WJkH9RmXBYKqxmGWjTFdJ+IH0ghygKSBp
	sU8tr04kMxNzvgS4jZpPGf8NQ9gDP0wVV0LeiBRH3dvUfB0DQrlkFOK/xofbGALUKwqzCPsMc9F
	4Snw1ac+fYJMB62zAbCCbMT+tPDd
X-Received: by 2002:a17:907:3dac:b0:c51:249f:7215 with SMTP id a640c23a62f3a-c51317e3341mr933233966b.7.1795370114732;
        Sun, 22 Nov 2026 09:55:14 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6841asm340920566b.24.2026.11.22.09.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:55:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:55:12 +0100
Message-Id: <DN1XL7HI1QUD.GQ4SZXCBUK3V@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] Input: hynitron-cst816x: time out gesture key
 release
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org> <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>
In-Reply-To: <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
