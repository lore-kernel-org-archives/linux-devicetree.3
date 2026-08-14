Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31976477280
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714927; cv=none; b=uLy3NxiJA3bSaCec6/prz5V1pyqWt8yKoqT//FKQ0LjL/CSBN9EEsCx1xIT1JLkZ3wBD63TxWH39pp0U5kw/b74ee4+sXSXd1pMLJMZbRoY3M2FpSO8Xo3y5z8d5CQ31X3XUkzdzGS2DbqJ8ebDijqOd3F62BDia5bWLdjonl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714927; c=relaxed/simple;
	bh=Ighuvc8zNEvdMdTBj2MgkY+Ru3uT8BFEEQGLZyHwDyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lVipiFjQv0M9K0MVZLSlh8xh6S8jcF6eMAsFLVgGct96DjqJ+qYO97KMm41gF3syEb3tEOrfgl5LWICgpzHl1qN+g7xMM5o1twbpTTM/FlkqyD/LCqjBNa5oDEtka3jlf8h0Kiu29cnRAOQaywvwzZvD+q2PoA1XsME2BTjrOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L6joda0g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L6joda0g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980dc26022so11104265e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786714923; x=1787319723; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xhKuc7koDaTER66hHC21DLwLn/weA2lcrprNlj91Qto=;
        b=L6joda0gEZVkGKk7LCqs1o1iMMVyGk8T8dWdMOuRE+U6RyX90s0HG7yWbTxfbG2zCo
         AxjjBo0Tgff0b0Y9afPn8z0VWaljSriLH808X4GJTzjlqqyQslIDgWhP+5DY2sX7sn0W
         kuCcCpEfEw+KfNTG9wFcgFyBQyritwqrYnVcut1bj/sFKtVJ55hmAHYkVpWelO0npyRd
         Fg0EcXNabskOGBUkoLWCF18NagdCidUdT+xApEf+dd0N5xYIvScamN8r/S1GkL14EhH1
         PU3DQpkDqAzO4nQdMtIToYRDo9Zb/uobdoA+62BFk4LZW/dqtZSlUXZMjllwKwnQ+F2i
         ugWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714923; x=1787319723;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xhKuc7koDaTER66hHC21DLwLn/weA2lcrprNlj91Qto=;
        b=m0zXqAf80RX5vkXlVT3SAEwW1uKywb1j4d8Dv8lH3ajEGRVZfQ9NMR1+3ZLL12Yjft
         MHJdEOFzrNLZo8RE47vXFrZfWssPQWLtZDgiIPwQrrJ2/AnynbK5ABGFXppp7f3sZLmt
         xb2x1/seaaXcyCcQeMJfBvbfyeU9SVcuDAAwo0oY9tyIPBwCCO8M5JXX2JK+z+TGvYbn
         f1ADQm4NvERdeYjVjr7O4QlcqQW6RTnyTv6rYYJqsdlTbLPfY0WiZyeCb/4caPsaqxqG
         B8kIyKZmFVPe20iqkJkY3KNYmut9TIVHgSNHN+aSLWgLkW2TnpBS9/7T7BoWW/ewMwNL
         +lkg==
X-Forwarded-Encrypted: i=1; AHgh+RrehTYT6rgF13rdQ2xCuoMW91P5kAzyqyjOHm3knCJAsq6ojLGCvrviKjNgkJ1JEsEK8F8ZmQRCfYYd@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHpnj1gPvmCYsC38r1uSXbbNl1aNYqUThPX1xyzIDhOrYtCvg
	Zrci3DPaydWQhwNZkyqW1p4xCa+DoTD+4+3O8AEgyX1RdcAMzpb+brYd58VbI3dZIY4=
X-Gm-Gg: AR+sD104sKH6CVzp+3fCbPOfGo+N0B7dwemCTKYieE9hx8gL9lWZIY4oXS5ubuAlu5l
	DBMqCgEnk8MJP2YHn45DIg5pxRoJxJC5lyyDg/bhkPlRlQz+lBHNGHBUEBEaUBuE7s2f61lKCyG
	IDBJQI+JU8NZo8lx1dTP/cYnXwj7d/JqpmUW4AwOK6llFsXTkYQ0/5SEEKxRMcg6k4bfg2Aqy24
	4FFZHOIe8ukyQFlcJJrhnJN+UGdwQKZmweBHJcIriRn6Z2P9rV3Kla0mTCCKjfIxoexJMl6uGaE
	crUX5kIfWs4B+OoATGfe9iIo3BOyDLSo21uZGLOJDoPDY4kgJON0yw4Xv9x18OY2t5OsopnSt9T
	4afnnSs0qJnz4TutLtOtENYijvm6LHzQxt6liIqicWsM/6qFIvkV3XBClDjXcuMUkEMzCO79Xbr
	jj4qirfCue2KulhHjxZQ/Ew5of5f/LvStqtjg36mZzOww6N6EEkymRx68M0LpE0exyZPwcSw==
X-Received: by 2002:a05:600c:810a:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-49987985df1mr76542075e9.15.1786714923535;
        Fri, 14 Aug 2026 06:42:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899c138dsm32119835e9.8.2026.08.14.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:42:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260813095600.GA1072730@google.com> (Lee Jones's message of
	"Thu, 13 Aug 2026 10:56:00 +0100")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
	<20260812214019.CDF921F000E9@smtp.kernel.org>
	<1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
	<20260813095600.GA1072730@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 15:41:59 +0200
Message-ID: <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:

> On Thu, 13 Aug 2026, Jerome Brunet wrote:
>
>> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> 
>> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> > - [High] The corresponding regulator driver lacks support for
>> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.
>> 
>> Funny sashiko did not pick up on this when v6 was first sent. This is an
>> ordering problem. The regulator part should be applied before the mfd
>> one.
>> 
>> I could reorder here but there is not much point since the 2 changes will
>> land in different subsystems but it does bring a valid question:
>> 
>> Lee, Mark, are you OK with picking the patches indended for your
>> subsystem or would you prefer that I split the series, regulator on one
>> side, mfd on the other (with a dep on the regulator one, of course) ?
>
> Does this break existing devices or simply delay support for this new one?

Existing device are fine and untouched.

I've just checked and if someone tried to run without PATCH 5 (regulators),
the main axp driver loads fine but the regulator part gives this

axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8

Seems sane enough if the regulator part is not present (and no board
using it has landed yet)

To completly avoid this, the ID would need to be in its own patch,
then the regulators, finally the MFD. It seems like an unecessary churn
but I can do that if you prefer.

-- 
Jerome
