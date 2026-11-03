Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699650;
	b=ZtIS36kJjtx8d69u7qAMITGCVgIKBhtg3tRmwPtvBl2ZwTtDIL8RJZiOLOnFqz1SPiiz
	 plnhJPblFvF+wdnwsct/UIDV958ALVyBCDipFm2mMQlF0kphRKb1RLXpSHgqJ/e2NOuLP
	 +1sYHQWXMlKClEmXXDQH+0Mh+8eJ7wG2jzLdLJrEenmtqlj5H3IsnPZgRhZkFgybTOHG0
	 6HnfL9m7FTGQNmU69MSLCfbKCv0q9lqTaitFgMiUxwG74va14orQsmWvSvL+Rg47xY4hD
	 KPYoWXwUZyoGzZgC0InWPaQGy2lc9BCCuXkoXBJzLiD42EywCgrmxi/Wry+HJOa6vYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
	b=RQjGMRXGVzLa5kVefOQYEhXh2gvrGCSxTiXnFcN142rne49+DmjZWfBsQNwM6K5ZzFyb
	 Gvwv5Gsu5nsZWRmxXu+K0SATLzzGpwG+JNm/pnai9z/mudv+TtfVic3M8uk+k6wvEkVdF
	 ffUcESP1E8L+dTJhs7b+RmplSpnuaKWlu5kSFEgJk5/k5DSbvk7AtqeTL/nZlLfy1cX5D
	 1qMi7HU20Hq0oFAsrG/NXPi7J3uM3G+nufklLjHcyC2rvTqZRMaOIPFjp3VrTG9kxsKHc
	 G4WSLr0sen9pkizwXil6NFQcr2FIhh7S9dqI0jZy+EIbs5XoSeC4agDr47MpC43uAEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jZJT+PdP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EC76083620
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EC76083620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jZJT+PdP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39663895e9.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699649; x=1794304449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=jZJT+PdPgVwRinT+CDR0jIBGc3lqnX1N4Uc9p3VDByFhs6i1o9TT7sl73//ryHHMTI
         kabTaPqWzXXh8q589otNlLe5IMBgqetkU7ggfbAvreO7iujd8TSkOUTf/uFm5kNQoWRg
         YyKrZYonvpffja9IG56eSVfBTBBD9LKP3VPW9RIq5VejTAGCWp3f4KZ0eY+8wpvDM89b
         vFoivhiiS67bre6dajMFVH0nMg3xPPhiAEbmJRWRytdoPxTPWKypBfH/l/usHejD+XTf
         jC+TUWHJ0qi7aq6n+2jxe1+SMFUrlQj2ylD6hIgE6ZQQCB0LajDEraJ+tr0iRN6uaTiN
         hb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699649; x=1794304449;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=hTxyC6vsW+0FmQmrzvF3GLJnFN9pycow8yJRm5pgHHqhGinyPBTo+ULIflklSH9l+0
         doz9KcK66P/V8T9EhU49G2I686LXizNeiAiEjXevV9VhnEdQqYFfV1meaD3hsX1Lhe0J
         iapcs6UVJp0/pHNw+kW23PdXZhPhqs466bLK2XFzcJECQnvnTgRlZhzotDjt6fMC5b8G
         Mzc+PZt1C3pXU6kl+NYLXKTNV7Jl6zBzHA8GeaBao4ChE1je3uxEftv+2AO7fNTp5+YJ
         Z7IFcNsrJd5A5iqWV+F0f4/ys3EvtOeFs6iGXolysG3VqItNaedtl4uTANBa/Ux5J5gT
         AHAA==
X-Forwarded-Encrypted: i=1; AKwUvBxR60pcQO8+T6bd8JIDf4wrxbREXVYhMpjTa8UhLhfHr8WvVkGUg1KVxLZthLQ298xNLho0V+W2LOch@vger.kernel.org
X-Gm-Message-State: APuU4Z9vTcHHDyyhuZWlC6eD2klR6SCg3YvbCOFSxmtJGN1BHWsQlynW
	jd6x+b73uES4jJsnRUsTT/tOLc6diM19BC8qs7TnndUI4dWANmXT0chN9OwHhaZN/rI=
X-Gm-Gg: AYBFou2n9jZ5toztf+UNAu3722ETidR0uKKcmetHLYU+efMWdXgrRx9PWU/8YQ8oD/p
	9vWsHg9AkQDRcB8sa2E3kVVgsKzi3RRhDtI9VsS4+i4z0h/KGdeUimHA9yOu/rFVYS+R2XjecZv
	oO7WPj9nS2DWkmrTTu1F/cswanUhVhC6c0EsLcvv2PmB6jP8mz0TvZhl/ydr8dpLgxBf3SqwXeZ
	AM0d86wGKXzxFvAg3YXceqaEWqk7XKCkyOxGw/ac4g0Fu/evoUPsyZLkVPLk+1TKUb6QWRSZWm5
	AUYR3RWSMc/EboDlupWv+uW63ix7i6kFacX3TiNjJwSVqN0YDH0Yahorv5+SODnfKbayNpAG4gZ
	meC7nrbkABNyOjAQZzjemMJCleecZ5wSjAfvlLuyivTHTvisvhSDpxcElRhTNsZ8zl7DI13zGdP
	aN0d9kotgpt2WmLcvm6x26xpW+FHQaDzZJm8sGNj72t93YhTzsa2loNZKKH2sblZb4LHhnx+MDm
	ve0aj/kAretxRIk6YCwO+p8N1VTbFeApy9vCd9goxWcvRxo4EcG5tK224lSxeBS93+dvsTh3zZ8
	TWs4ozhfwAjpr8rxBtyx3U2l6ElgNGc2I4+7Q93+yKY3VUBi24U=
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr276506235e9.28.1793699648696;
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the
 fan tachometer
Message-Id: <179369964799.2330120.9043967618143448654.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Tue, 06 Oct 2026 19:36:17 +0300, Igor Velkov wrote:
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/1] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
      https://git.kernel.org/amlogic/c/81e55899e134541583a4e611ff750e1868671c67

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

