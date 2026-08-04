Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1180432E6E
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877662; cv=none; b=fa2WL2IPyUS7ls+SSrG9zXQQfGFi8fMHScKFEeecwZZlXCcARUbfy2AWPKfcfkESrFLRjiU9PCfhaCU+2UwgyzNhpH7H+b9SSLDVXtcfx916q8PDyqXAx8wvP7pVTq8x1xEbWC3RUJAmS2scj5ehZDrt9umSv7aq2zb1MCLi6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877662; c=relaxed/simple;
	bh=M94F1PqXP2R4azTv5VsBrw3fcVY3YhyrZvCDUpvojig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McVppQqnG1A2ghzFSpL/oxWLelnZhzbAZ4Jri5QuMSZnfJU84f10WPhVL0EBLVm9tWKSl7oSs0acOi40IPyzFmQgr6e2aM1vC7+iXWU2RT2v0lCF8io/Rohkf3PPRK38kC+H5f6tzMQ5uBV8PayPQ1vuic2jkF4ZKiH5m7QIAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/JyTPzm; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/JyTPzm"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so267013a12.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877660; x=1786482460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VUaS6lIR89fzUXE8jE1kCkmVqVFSCHPmmwJhW/Xieo=;
        b=s/JyTPzmzEy4CYMFx0MDLuGE+Hz9l9t0GpvdDSsuX6ku14z12aoaDR2OJu60H7O8VP
         1fl5KymTjLMPLGt4YuDWeSSUZdNkRrIWHhaB2fwnW6LxD33/8HSOxRMuxD36+cIAeSFs
         oAWrzA2+GfzsqWbs2n5swGClIIwf+vZo48iZgoxXV6+Um2UP1QeHj69XQ68xUcm6E7Zr
         Dz+nSSlWrsUXfnFYtukGJgoQ4RDl/bNZNIt2MbviTqPz/56gAHTX4OaF62Ipi1qUlPkN
         rJc//7Le8rHgmUaIxWbz3FO9JAeIRxzpT5Nj4qO5sD//y0RXvFTgzxLJyNXJAhhpoYG+
         PRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877660; x=1786482460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VUaS6lIR89fzUXE8jE1kCkmVqVFSCHPmmwJhW/Xieo=;
        b=JX1+pwhFEyYjcxsuqGQsdBw5NUr46CHkQI1uEpj4goX4hoZZwIpBTKKhu5nsY90KqF
         2WjPPZEWrGS5r8E0b4rAsTb06HyDzYJoO38zxkRqQegwOi2g41a6MPYNxZAlJw2mERaA
         9Bt0FVSBkAAiAIxbYLTr5i61izD1BO0a2oLYJ+00y/F9288LjaLDYaRT0mV24A41ZT3z
         M7gPfQrwCQRf0MR3hBkjYclobt8PP8yVtz8o8vTrNqXuIrdQ+7kHQj+c/6/g1KKR+33G
         6c0Fz9cPoVFSL7uI6dR2czZZcRxa+oYTaO4YsD6qtKJ8IeDuQT8QS3fClkiLz8zDlUbw
         ATxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn0arpg4KoEshfL+5Yafg2pLmBU2q4GiS4MInzgXwzSfNFfCEgAYzjYbjSMcKZr2Fm66XgBjuCFZuW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx5kewgqLPi2N+cLFHB6PGMb5kBp5UJJ8sHMiWfjPvVL5UhXY8
	cAOeO8y8xOl+OuphTeC7vyCMYizKEd2yzryZh/t3+SuJ0m5qYoj5nbs9
X-Gm-Gg: AR+sD12VasJgrZkOgySOQn04iko7rU43K1TnhGNWGjQfb9kMTy7qq7grWNBmImbXibK
	TQ+pP0eYMx4+m5Tm5nj1Fq3pAomeuMLJnKbZjNyGwMBuPeQeztsmTUCcoqbfNI6psZid1tH3Xn+
	zkrO0K7tG7BhKSpfcsx7Lucy1TUC0Wd+GzQ3vih2cGGPiv8Qxtsy7Z12GfM4ArDWvSei4Qtszh2
	Cfr15ABD6C7PlwS9ziiKbwpG5bTWZp/k1uCQoRErIcJINxqVqogFqYwxdVpq3Uf1rMcGmyV6bE4
	gTEDfl4ER61b0qUTRHseze8epSch0/mJFQanYocFa6xNOxwPyQSYWYt6r8xtR4K6pqKqpxbqFQP
	yu6rbMC2xRqusowdr9xK6SmgG+l3Fj2R6/P2EduHkIAtMmUVZqQYkbjVdfHAnJeFhme50J3Fqbw
	xoAyxEaPTIr6WtVgiATbb6Dp9JP16cdXa5waH7Va3Xn4uNuomkkLxH5ql60+YDeXQKiuDjslEko
	aBGtZTvSrlOmw==
X-Received: by 2002:a05:6a20:4320:b0:3c4:3750:2c03 with SMTP id adf61e73a8af0-3cb6c7b71b0mr5878476637.9.1785877660120;
        Tue, 04 Aug 2026 14:07:40 -0700 (PDT)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm6062339c88.7.2026.08.04.14.07.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 14:07:39 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC net-next v2 4/6] ptp: ocp: Validate EEPROM board IDs
Date: Tue,  4 Aug 2026 14:07:35 -0700
Message-ID: <20260804210735.48116-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <4ef01fa0-969f-4ec0-997b-5f5f3f67e11a@linux.dev>
References: <20260803205011.1249-1-ahmadexp@gmail.com> <20260803205011.1249-5-ahmadexp@gmail.com> <4ef01fa0-969f-4ec0-997b-5f5f3f67e11a@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review.

Agreed, I will use the 12-character Fixes hash and split this safety fix
from the feature series so it can target net.

One detail about the suggested snprintf(): the size argument limits writes
to buf, but a plain %s still scans bp->board_id for a NUL beyond its fixed
13-byte storage. I reused buf with a precision-bounded conversion instead:

snprintf(buf, sizeof(buf), "%.*s", OCP_BOARD_ID_LEN,
	 (const char *)bp->board_id);

I have reduced this to a standalone net patch containing only the over-read
fix. I will rebase the remaining R4006 and V9 feature series onto net-next
after the fix reaches it.

Thanks,
Ahmad
