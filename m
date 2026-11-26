Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697303;
	b=E3sLDzIDjvnPhQdkzyL9IKT8T8pflTzGLrR6DS3wLGPCTgRkS/KPhwVxwYHGcZI6mGaR
	 Voawm80b1YclCx9MrOMN/KgzxF6Xbrx8cwkAVfapf8d15EE15X5IQqwO1wNv3AZjih5hn
	 1XjaJ+EWSvPyzhHDTMo2Fb0javUbuVY3+m6D3XPiEzB+WICXbnR3etiD3qWQLFPs46WV1
	 /7/EAL4F5N5w3UlBTMQKn+gg2QiGj80J2xGG9AhBOmrJNJV5pReC2g4ChtS4H/TFXO015
	 +fWzc/pT3iXoFseu1ibGoZumwsMHt15TuDZ1ra/fc1Tr+Q2I52HAoh72K15skOwDlgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697303;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=A58UABYtrnEty2sjHiU2WLl/hxy5u3d9ZmR6jr4hXxk=;
	b=QhPhni0vFvVC6nDb34OE9Z7S1vcD5cWRSYiH46ra8M+qxKXaMP4iyIKWrA/Qkjc1kG5i
	 4XQLo1uHYOkXAe4CagqYKms/px2YK02qSSd+x5yz5Pikniro5hQ+mf7pZFIeAffBP2R5J
	 hps7eA8WR6KsZMK6ip8EcaAJBjLGUPBExTMSJjQuEIkGjmNsnn3s8UeAlSokBG04lG0HV
	 gcMwLpxebt9oOJlD5++w4f34oNvgcaBwao4rguArM2lXRJh6JgUAT0ISh4TlIv31mw7Xc
	 /38vTqmPoQX6/qNw3MZ35Pw5297MKYgiOuOQPQHEseKp38bYkJE0+WKo9FiBKTW9rVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIH3bDTn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47545606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIH3bDTn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C312E1F000D3
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697302;
	bh=A58UABYtrnEty2sjHiU2WLl/hxy5u3d9ZmR6jr4hXxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VIH3bDTnvVGM6xc85XONsMwzIZSIMOX/kLGunOVHAV7NWrLxiz6tUtsxiX7X9eRBQ
	 7HlYscIyT0DeaCqLM7W3dKABi/wiP7ejbaUzNkS2UXlTv+0D98ZsI0bvxuTzEMXgg0
	 etY7ebPDRFamAe+bQS0Ir+tJryGJ/MEtY0kkO9pz8A428wghm0MzNRG3lApKhP788N
	 h0i7X9bZG9iNoltIBhFYeNUCD/W9FDi5oQq8Iqxry3Gg2wOn7vUXiR8oehSsQnAEfX
	 9KY2D8Wi/Y829/dJbIxfUh21+b9siRCy+yWkidhssnSqpASS+2m+QfBYAmHrvk17gf
	 qiAN3jfkksY6A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so56070781fa.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFIB7Uqo3ONrOqjcpBXbRwoe9A0WGPeTTLkONA4ep0vmY5Y2LWGnG92M1iCwcX471Po3qV1fHObUjYv@vger.kernel.org
X-Gm-Message-State: APuU4Z+TmdC6i7ZAt3VIXvaM9z1EoeoqrhFkbU1KDXtOWSXJskQ1qXfd
	lWWDxG8pPAKNCadru6VQTTzmlkK4iftbywK0mNsMqWr1RXsvGUXT6W2ep9QO9uLAV9bRB7UPY1P
	VUaVmUU7zldBDuxtVSY7L2zzTxu72Gaw=
X-Received: by 2002:a05:6512:a345:b0:5c3:35fd:125e with SMTP id
 2adb3069b0e04-5c335fd1700mr31267e87.65.1795697301561; Thu, 26 Nov 2026
 04:48:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795589383.git.hns@goldelico.com>
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:48:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
X-Gm-Features: Aa3M54reGVx3uHqx-zCudInMGYCYaxYXXbA1fSoBKZP47tBZ4PUO9v6291x42MI
Message-ID: <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: ingenic: Add X2600 support
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	letux-kernel@openphoenux.org
Content-Type: text/plain; charset="UTF-8"

Hi H. Nikolaus,

I first put the two fixes on an immutable branch and merged to both
fixes and devel (for-next), then applied the remaining patches on
top of the fixes in devel.

This should work out the conflicts I would otherwise face from
fixes vs next.

Yours,
Linus Walleij
