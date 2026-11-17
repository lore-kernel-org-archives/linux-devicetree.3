Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919658;
	b=If9CYQvhOTcCbcuSJoxNbM/toQyEhvPY3btIZIgZ0ZEVt1kI5kxGt68lXFYKCHpYyB32
	 UBxFPVMJbcpJSFGN9YI4KKaXNSwdlinpSzul2lm3BaCNAcgHV4m5HH/8AIBwyWLsP4l4u
	 VLdwmjvoHeR11xOs7+A5Rxayno3Ot2oDF9TsyaJldRfbzQhCvJbmbCeKW8Xqh1Qvellk+
	 Ft7MIO0OYJAIn7nEUZAa6oaG9BWClJt+U/xYOqmWMo5Rd8khQUj7XoWwNZ2uzepoBa9Cs
	 gulc/n6N5R9LIVfQWWDjhTAKlG7liaWpoCX9xIJ6EDUTgc5b6aMCSefkaJMnlqRmMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
	b=QMmwF/g7iqd8UMAmlnIUhp1T7T3aLgCM7UQyrv+lDkVylKaoloXuxwrJsLRzvd6Ftu1/
	 DRJS/ScroB0bf+5F5v+NE+JgKmr7JI7oSryfAQ0sUZ3M1dzlgVe2+uMVlEIrBE8gpVWzH
	 JYxybJ68ej3qJ0o0uEM8JC3wjvTCPcB7W4Pa+sJkregF39R80o/mtU5eC/h9UvN1oD+FH
	 21W19MuIlyXsSXau4imTZaoRMQt4uDkcsb6pYX+sfq/fj5GyQk4VrkRSYUDpR2UZ7ePgS
	 00mFuTkJKQyvKr/cNS8zqId5fLxmmcL1zSc76xtK07lm1mp1lHDRtOE/7DzbMkVOQkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GR//esP/";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ABD606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1ABD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GR//esP/
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso6248511a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919656; x=1795524456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=GR//esP/c4jjW7kiru6z01qnxOfaFo6rWysyC+LikP/1AVwDdpHcQqSz+pIcMSZZLL
         rGUV3uBrN/ccnmzI8R52Z4Oeg81aVtcX3vBb2DF0cDUxgjk/DXT+msphxH1pfVcr0lsQ
         yDvdqxlzl80F0AdPjBiECfnY0M0O9euYkDkZxrG9V8PqqSLIuANgdUsb4eDMZOsjqE7i
         QWVyyrPvamr6xPGKmSQQBuzXyrQJby/WFvm7nHdgO0G1Uvk2MX4MXJwdwBXXWKBv/DrA
         PJ2GLNHpXXGTG2b2JjZy0uSFrWV2Oh1i7GlvXxKrGOGIZZU4eeELgJR3VfZ/TBqqZdR4
         S3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919656; x=1795524456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=BJ4sx9Lf7KjeXJ0jRjqVfrwBGZ37fhmE8snnjP5rSzarB8v+n7rq6tcjQQ5pyc7ijR
         6VqQUQaRYrg5bEpDng/J2XI2qTwKEPbND8A00Fx5GcPbiR6MhruMUvgJF7gF2kYHU+1Y
         5Y55sARNy6HuaWctQyBHH7TAKamXnADPntx+6Qx7hDZMNGSOayYE/mKjzlRUryu4DU41
         SCrKKcWD9BllBQM9Y02jte5BtpEOp3ASbBaPFskwTCiA9ATjnZ+3tzOTkeVdIZTcqTLD
         /gB9F0F5D37FqKEG11WYtkus2t0BHfASPdU9y0PEAt6MocfMovYNrqxjCGldCB4ICZkR
         G0Pw==
X-Forwarded-Encrypted: i=1; AL+hErGwVO0x9FL4ASEP3b+8wgo6vzsAFuMcxpnSd5JiDAvulgCXFmZW1gXhBzYFq28KwVj+WpP8IowUMgRR@vger.kernel.org
X-Gm-Message-State: APuU4Z8h4CYJ+L7szSeE+HjrAcHP6DRJWeJ2GAB6F8L0vdd4wDf8kv2k
	QWIhMIkXQ/3rJnTgjqg4SMT2S5JKg4/7wnNQQ/JuF5GA+9sQrqvP6KpE
X-Gm-Gg: AYBFou0j/zjmqCufr6UJOV5DzFFt8Wp7Zt0GcAh8VLipjnDIH9Bq6ODkU1o7tAcm5KV
	PXxv1slWMZRkqVBS7leMoaItWvviFAOzHNwoRHoJzRtCctVqH4MSEPN2sWeQ8vMZxCzWD5xj2Od
	PO7xhl4vCfTYsJVhwCJeZqvYndXSQodWdURPpZI5A2ZE6SYz9Jzm+a/cUD4TniVRx5qMu8+FEHT
	S/tyeL/BnZnhUo+Hza++yntud+AppKWxW3qhsAYh2oVzHS8AIqbPWFReqYBxmxPZJVpZwU3M7KA
	NLRn4m4Ea+ys1ic3r2lW1kCTCVLhhzR71vEyZ3+337cSuU+vzewCvqUD/xzuI8CW32yBAxqjdiq
	JqpwOEWxRACXxR/Euy2LHAeTRHJOQGH+oNmb1yDDWDHp891Bmap9Tghm+d5u1E3LlOkF5Dkga3L
	eP9yIxbXhMQ9s9RFa/5O1x5ynBFz4WraI/w8osgegbZCo5SOAWV+SpiOGDJVVlG3i0EHxSlGpqJ
	/ZmtKfEaBphc4eXUzyft2c6yJWveEt7tf6VwemCYS74n+qBbgmB36/HwmQwG/t0sWMH+pIUKLQJ
	v4IrmbXpVl62JPllNxiZvuez20wzUHmmnPqARfSQgGiD5Wm2xG9M/xxMbvjQu9xsemjN7h4KDLY
	kL1XG7DhilJOqYiyV
X-Received: by 2002:a05:6402:2347:b0:6b8:7d2b:4dcb with SMTP id 4fb4d7f45d1cf-6b87d2b5390mr750722a12.14.1794919656177;
        Tue, 17 Nov 2026 04:47:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b87368c70fsm430430a12.23.2026.11.17.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:47:35 -0800 (PST)
Message-ID: <6afc4ce7.4b925a68.31e7c.7768@mx.google.com>
X-Google-Original-Message-ID: <avxM5Ldccuc6TgM_@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 13:47:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for
 fwnode PCS
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <179491941687.3291.11313796890436002644@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179491941687.3291.11313796890436002644@kernel.org>

On Tue, Nov 17, 2026 at 12:43:36PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The RCU """bug""" was found while evaluating the code. It's hardly possible
to have such bug on real world scenario since PCS and MAC are currently
tightly coupled. Nonetheless with VERY BAD PROGRAMMING it's still possible
to trigger it.

It's both a fix and a prerequisite for having standalone PCS support.

(hope I don't have to repeat this message for the next gozillion revision
of this series...)

-- 
	Ansuel
