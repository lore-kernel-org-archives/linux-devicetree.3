Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782887;
	b=xtQ7rs6xjpIcf469cDlnBIT0jKFMk/shjUqKK1cueJKoraeElREeMraCTRHyw7CSmJMx
	 B3Mme1hhRjuApenNZZA5bdmND368bpdmcELXtZQnRk6rKJ4vsVZ8eKI+1rfRYy6tdIv7y
	 Hy164lNEYiZ8S74w5pMit0Vim2ubOO2UfWIJKtXrbo0G2WgkqidMYRt3Lge0MEMtHkL4R
	 j5N0mQH7MS1+rFCpSNISLsNW2iN3D6fBgk2nIm3xgp9hEX7/CYPG8oaPRUfVQ+OpYSrhV
	 0YEHryvN0bTA2HFulkabb6OH659Ev/+whHf1AoTnaqTw7FxLsfbqwEHO4yQX68WLE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782887;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
	b=c2gclsYSexp1vV4Wn0JiQznzC4Zkz0faRYbfuXxlaUjXStqWyTg/7k2K/Q65QRW2PEQP
	 BeoLH3jzpAP4V2VVQ7WAiISgKyjuuMlR2xmdKmIVQZPJklI8gYn40d06O9D5/Ch68AQfv
	 NLXUfZVz216UeIdgGqf5kVp1QNn2wE9ByuoHK6rzYZ6tZAZxShaA13Xm9yjWz8uJjbVkU
	 dlcsih8X8/VqWX67wHghA/3G3g7R6YoYg7OfqN+tv1RKc2e4QIhPc/kz9k7rMnLFICIcX
	 iBX6rMIORZ1c8jkzYxJdAJFW18WFt5ttaSuI15d7997eDtEPeRXQip/cIhrCH37LcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22AE606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eb18f4da15so1539135ad.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782886; x=1794387686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
        b=SqYdU8jc1NXwMyJytsFcyaKAlRb5Rj5iHahS9P17vGkIdB1KR+n7BczEjINCMVn64X
         O+lr52e6+K/08Ps5LLgmva9HkmZpt+HywRyimPwur29jXs2KjRDWKbfgVu4SlBoB22/E
         ee2CVkvaLjwemCHpRdM03w3l1umFWmzNNOPWEeD1e6zlRyPCytt+UNx/G/w4Ul3bpkD2
         +lObRlDHh4LT6kcTqTONZ5y0c+RX7o0hZ3l3K7niJ4485UwrR3uvX+vRUVSqu/GOr4pu
         E1UUmEozxW+vZvWj9beLMGiH0ShpkKAEvg7FTskHkTI2d0x4YPVd2iS3WM18uMEwB1ZW
         KnuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMsuHV4/cJBHTf8qUK3pbRrM2qeMTVfb7RadypeNocoLrHlxEUt3yOtpwGlvZNOQRgrcwemG5ni45C@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZz05xmpOWmwd4ouWt1s+LrZmpAL6jrhkJKtI0qOISOGLQfMi
	pLDvh1rnA0uX0ufpoRvrf5rSEBE2c5L+vDopLhE+12MMnG/lH8YPdZMGcgJwXmVe
X-Gm-Gg: AYBFou1OqKNEVzt2ECPG/RllIQmq0vJrKyA+vBWcuEvtZmpYgdn41+M3639/Sr22dLU
	sdQoJ2tTay5QyMCTficdPVobqQbdl7WRukFwo+AzKqAuRKH6LCbonq3Nh1x7z1WuZX4IBegEpBU
	WSwMJJVROYy5Xx8pKqq9AHq03Ck+rk+CRVQmB9VXcP2hiyl6xndiM0/1vi74v723Upw0L3W9O7U
	so68uxNRtIugsqo2N7iBtSVtXxk8RPaZq+aWvIzn7dXdBHSCwNZftq65fo3u90C4HW9ownBaJxN
	VBF0nCfWj01kwjdNmM0ZXPdOYfO/uXeIcoCD3zROg6vSXMQ1wXFFTQG/lpTPHPYArN5Ka17rwcK
	EaNp5KLOM8tKz/K2tuLQr93z/YFFTvsX2s0x06YyIIQIJj2IiVsGoQRV6Y+ZQRDw6T4iGA7FU4l
	qyNYHTgUmhvtyWrSO5DiIGDRcQlJEyb/RsoouGHnpplchjAA04sR99fIZ6os+uys1jImIR+QWhB
	vofRu87zr6A5rnbIMN8swTOq5nqFuoGaJ/4kHpdKso+tyZaUEOteY0w6RWJ0Qv7Wzmo2KP6MqiL
	5KtfBgxxAFVQ608Ixt7PqzBiKIiDtOvGihhwXnwlNIj7fTxy93NjV4ulHAJdz3+ymocnHmwke25
	f0KxXxXn6Bcei/uLmpc81oCojo4HgJO+wGFeH0qZmxIk=
X-Received: by 2002:a17:902:d50e:b0:2e9:628d:e9a6 with SMTP id d9443c01a7336-2eb364f35f2mr133910655ad.57.1793782886174;
        Wed, 04 Nov 2026 01:01:26 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091a62d4sm4972655ad.60.2026.11.04.01.01.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a18fc7a38so992536eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz1exPXkcZhNTcHdjFPqgRKq1YKoaVjQkaqYsFco2IoRWL+kPJzSQXU8ZBxjcj4K07oydaj6rAC1Lrb@vger.kernel.org
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id
 5a478bee46e88-36a423a205fmr27260638eec.16.1793782884949; Wed, 04 Nov 2026
 01:01:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
 <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com> <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
In-Reply-To: <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 04:01:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
X-Gm-Features: AclHuK9uQeJIR1NfXJqyf9nbtbfdJiELHYiw7wy3ZTo2enB8PX2i4vU_7m4oveI
Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> No, it is not. It has clear and obvious checkpatch warning.

Sorry, my wording was ambiguous. I meant that I've fixed it in v2,
which I haven't sent yet, and v2 passes checkpatch --strict; v1
doesn't.
