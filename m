Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661894;
	b=zEjLaBNaxXFXJHIIS/VCWYqXJRPJzpcIV7FfWV54FC9r7bSzf3Dzv5TK8Fy9s6XBKJkX
	 cGf5y8RLN7QYUczKImtj7gHO13nW+vNoQS3Xxwqgzf7aA1zC3n2Tr0iD4Bb+LuB0BOERf
	 DVo/CuB63fxwR3PgX522ml4S0irtWCe4WU9WCJc5imBhynmtSDttselayuRBbBvdWuygT
	 bEy7LdGmb0Snwqkb+z+WLYatct6BjFArLnBwshKT2dGPYwZaSAdKZpgk+eUXfkwbgGu2Z
	 g9u4P9H1Iusloqgvfhn7X1PxKDv1qORAmfsfksGPvRjRt/hTnp1c4FIsZ9TjAZgqUfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
	b=o8nbgeK5O8Y2WISY0oYg+kK3mtfvdggI4m4JCAnUZhhdbl1jZ+X04e+UqNIS4AArv7R0
	 j30E6yRwXUXTFIMw/IzXiU/GCPYS472hjc/j4TfxnLoQVNT/tMW4PZpXmMhl9ezarsfJf
	 ZqDv2k9UviCMM4CtRo8thp6hzPNxh88Yt7pm4JCzQDyKtn3Z1JP7RsmN856eQtNuETKIn
	 5NFb6o//KhwsvJ4Fsl5JCKDPVDv5ewJV4G1LDcLjji5zKPmDt1pQko2Z1vrSr69vZb8Mj
	 bo5b3P9ulVvmz2Nv7jN6tVBFORHLrtuiyNMXwcrD4vE5yptj4jcQV0ikpx3fImaDlLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dKU/AE2X";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C376606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C376606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKU/AE2X
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e30c26a4so105103566b.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661893; x=1793266693; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=dKU/AE2XlsC7GcWUGeGpQLt0ZDOploOIt9TkwpjyXXpNkXM66tiQQU3PdJQ6YC4eqC
         7hu3ePU433r6xt92ffRnYkgKDbvLPW7yu6du2EQp6Wjv/TwNni+cuHZCwDBi/nVtnaNy
         OTRLqzaVMETwbad+9Xmd1SPzaCyJpTnX8pbq0Rea/YPDrSA2YuojfiPoPqmwzh+lzLxG
         TNllcY2VYwQBqP6vP/Cxuky9Ab2VmodQpf29JEJNNkpTOqasJ6MzHFIjxne4Wd0/YO5U
         liYC4YzUiTebLacLHzw/aKKl0vJ9JhrpSQSV6JysLowoxESrymrjH7h0JXj5c4uJQFZB
         99kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661893; x=1793266693;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=KwYkGipRCdRnIDgvPXAvWWugBcF8G2H+eqoPuYVQih2MSFpU4V5/xTDxo8+OwEBy5n
         ScCeKe2Dss/ktGdR5eKmyLoL4VTV2xjdgz19UVXm6y1k8Tv0ajhaGCRLgXj7SW3mDcTM
         TjdZbFLvLkqiY0Qv28GZbJlNKN51PLb/mRIvPdwq66WrBv075SDlgnW3zLZGuue8mpu+
         ZVwQZgCiaZ4q0dIslLoxS/no3ZkWVHm/cxjGJQ6db21i8/tHWk+8T1lE0eOShXjh7Cp2
         pBc7HwJVTYo6a/FuYmZLjt8MMGPLd4QH23BiL/1kyapRKSyMl8MwCBUdHN4Q9prlE1aq
         6dPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+vksqBt3za6Xf+VCUZciOj4pZZIZ1EP9klSYS8bIR/kyx1ifo47hDQ2ASzyB1g3/BiFXuzEjN2hnB@vger.kernel.org
X-Gm-Message-State: AFq9FYIJxF86Vyh6XypxJsYVU4RJ/p6I5505wvHdB4rydUo/0RONO3Dc
	IfR8RDdondZwv3hd7m9idSJhF9ZpdsawVd1i08y6pK6zm1OCz0F+1Wzj
X-Gm-Gg: AYBFou0geFCfh+N+anenrL/eT6KJvC5lLSmIT7xTAkZW5dsRmIhYLZZyO6Fk9WmTr6x
	A2iC4f5Ua2u0a1IE5QfYRoZDDeMqsLH6TgJ26TAo0NTSjeRg2C6tne/Xo3DSV8jop2CPYtlkmSS
	6vQ5YSAK8Z+O/eSfc+VZ0ag0BiE7jCYjXoiI2B7YW54UEHPzRTJYZBRY50BN+YRRZ4VX+AXLiMb
	hBqGASt8Q+2sn55+udW50oBzV/DYMiHNPQoXepnRGzm/aujaPAJwunzH/mdX84sOJSF+DfWGbvj
	wZyh8+4/CCkJPPaVEOrVXfI+q4iRfLREtr5JFp/bwWK4r2z7czjgvW5byGV3Syuh78rIuUnkMWu
	aO6qisL7+j2yG5NvHSHSm86FRXMfsxCoUndNfy4/iOfbFYrW0773NdAfxA9Tc8hhkHTNkczzIOw
	/fCz9DkgiW+lsMnNBYu8XyXq558Z+xwOUXAImjMX47EmZJFKbvXDPi7/Op+N9fyCP2pXJ4g7wTN
	hsXEHz6JMCdRa5DwuMZ934PjHng/BP/gen7SOImJjMkdFW3p7+TzCWCLsQmMuaiVso=
X-Received: by 2002:a17:907:d18:b0:c2e:616b:6763 with SMTP id a640c23a62f3a-c468d5d92b9mr198921066b.3.1792661892804;
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
Received: from hp-omen-16.localnet ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm87755766b.32.2026.10.22.02.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
Subject:
 Re: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document reset-gpios
 property
Date: Thu, 22 Oct 2026 14:38:07 +0500
Message-ID: <W90ai6epRoWrikRmhqTrfA@gmail.com>
In-Reply-To: <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
References:
 <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
 <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
 <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 19 October 2026 11:49:17 +05 Krzysztof Kozlowski wrote:
> That's the same pin. This was sent multiple times, why is this time
> different?

Indeed I overlooked previous discussion on the same change. Thank you.
I did a few more tests with the wwan modem. And since this approach to
handle modem reset more like a workaround, I'll just drop this patch
with rfkill node from V3.

-- 
Dmt-Y



