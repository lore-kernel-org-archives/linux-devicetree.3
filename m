Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA93A1688
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856366; cv=pass; b=WP040Cjrko6nqNHDM55x4r8S/g/cQo/cRWIrusbFl2FEkXWL/1HeyAR29md9ARKHvaexmlHm6C8YwCJ50r6gxWf5KTI1RdsXJT94rbqflNTOaUbToHghOlpZ3/EIU9LkgJH2M4YKHGpIuVzOvgTGIJ3ZsM27/EsvqCy7YaxFOmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856366; c=relaxed/simple;
	bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkI0Z6KhQXNYLXdKI+Iz5sWbb5jbkwMJtydkaGsTCi9BiwHy/sPwLBDWlZ/EIkBj67hCos/r1Z8JvX8SOq9nq0J6FpwgngpyC5LtgkL/gJhbiKVBGgknQSv4SYoZZpPFH/rbydabK+uWBpsbsdM7Zco7PE3hnTQ8kVVCzbsWR1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltGT/++V; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltGT/++V"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso7225391a12.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 00:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774856363; cv=none;
        d=google.com; s=arc-20240605;
        b=gDm0hnAurq+IdXXDGuEQHKGa0ywskyo1DLKBSQn5wUGBK3E6gf4RqWxbo1QrrOm8ZR
         LqUxE5++e8PZ2HSQ0Z0j/Onym2M3TUGBmIDs9xz24UqYOLv5Pba8IAWI6CYqrJ9BalqR
         B8lCDQ2rdYaNbHZHOW3+JGOfg9Y2KLVFybK+kUnCN3CiddREY0zO16Cook+IOkQewT8W
         dYrEgAZkQLNqfwRFi24eGcodT4GPftKP0Hg/J0WJ2L3tMbKYS0krifhWv054ECfiTsi9
         Il4wX0+Pif2Y/3b9zFG2chzDeEvv31swUbKOzl0htsUdQbutubP8kXy7GTLyLrGdSINo
         /S0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        fh=qmXRkZOVl9JB1a9SWOdZhfpKUJyRefRekuRvF/546TU=;
        b=LQ0aXCrxcc5gz6RLUyTa9CacSAgJVfwyv+jq9KmJJ0askAlkADZAljfMWB2P73Su9U
         SHXvRPX3lRWfiYueYRdZoUGzkO32wjfstLH/YV7JFam7Tz+OGyz+lPgstdcobHg2E+Tc
         WK+o6YmtScnf0RPi+NGyTSNV5W+L9JHhlXk0wsBGlcy4NlI61J7JonevRw2YKectLeRs
         0/KE765EKzeddfA47cU0E2rEbT0x1rtjriWXZPeHE/0Jyte0p6gu5yaN1IxSDHQ+pKMr
         uyL2naCtOOV2i8RYkPZJSO1MZjPiGfcTv7bncgYNK+8xi9/2vot7kw15eQDvdZ6UJQkS
         TMCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856363; x=1775461163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=ltGT/++Vw0wLROzvE0ZJl7pTg3Cu8NEOafpbs0pE8r3RpE8q0sJpAfXfzjUWl2eKao
         CwibCxdmVAMROEpagKD2P2BeipXDsZxOnJFg4r0p1SI3Yxt3GNT45BOnZwwLk95Eo4Ur
         bic/mmzzsS430V9YyHZrF1oEuD07CcJd9k5Xpfei4bC7LfoMpiFCPtea52XCLajH1NFL
         w0y8A5r8REZkulM0KoCdY+PSvUpt12E0BymdQDrtioO5gbl3BEQKOToNLoa4Q24RP4EU
         migiCy+shBWDS5wRco4kXyBXokQ/DvrpRXnXp/N/8qO1ZGQyZXYdOlwrIUfNsxc9mpWJ
         iQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856363; x=1775461163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=GYpEQfNKSr5ivc8PqAHX5Qj+v98yXA+QcTjFDfSG9ytPbtT7EHCCueoL8Sj9k3SNFH
         0Y+sjRWPqP26YKDKfQe6e9jzbE/4Jr6BDhgII/DmPk4d3X8v42/u1lJBtIBldTdlBwBn
         JN3oQVsS4g6CnMXL2WUVU48dutvzc4WlfWspzcDimBW2mrxCwkRVb+F/3QH3SvX6sYQu
         nBXOHkmI5ema4MlUBEfWeFlRDSGTexvc+CokazrM8qFXFOFdK659bcv7OikewwBtVRTr
         SVmBGSL88W1aogoBGIuoCaYa/EG5ikS7EioOll3sryFz5b1nXIsVknyVNNZx+zgZf7wF
         9bkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi1WXHbPxw5AgEDs9IPv0MMUqrNtw47sQ3S9K7fRt4oz6EnTci6nHNFB4dTLId1wJjIOZyEEBUE0mw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxque0IIcBNehxLp7EQfYVenM0CsF0VgcAmBS23z2lEj8Jpn7uY
	nBLjvRlzAxNRUS4HHzC/fAVklzX/rozrGrIPrs+3zP/ZlZ1tJMjSizEDCAv7gEC0Bv/bhsJQ4IO
	Tf41fqMhm3+FjR+RC4dmGhQu7chZAkHE=
X-Gm-Gg: ATEYQzyKdk7t2W6BYaXYhHba/SRRNb8dSKFbCvzlYLCi0qtQoAGLApA8ybWShSIJ50U
	I5omP6VdDga9XIhwlT5429hy9mFuphhjfrzUVrS7ozbHjBI66f5/dogz0SaX7Vgdzw9JP14s67z
	x2rSJ1xdTi5CVCkyz+d4hJIy5kQSefYEimQpMcI/bYcMHbzImfuvirpE0XyXdZ60CMeGVjZeYMB
	ZaIT9ZJ+2Fm6ivcncaiDRPgNYgB0Ub3SEwM0NMujEPtK46qJ9SEpEiNxxG8F6K8DZx0TmRc3huv
	lP5qiQ==
X-Received: by 2002:a17:907:9621:b0:b98:13a:c92e with SMTP id
 a640c23a62f3a-b9b502b5aa6mr732407066b.2.1774856362950; Mon, 30 Mar 2026
 00:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
In-Reply-To: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 30 Mar 2026 09:39:11 +0200
X-Gm-Features: AQROBzCKAAw0QfB5IMl3n57JlPRQDr7IJq4vT7zpNh4df3HsPMVBkVCKdEdIBnw
Message-ID: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:

> If this PMIC is anything like the MT6358, then it has 0.01V fine
> tuning for most if not all the LDOs. It is sometimes needed as
> a rail may have a 0.04V boost that would otherwise be invisible
> to the system. And then if you have something like 3.04V set in
> the DT constraints, you end up with something the regulator driver
> doesn't support, but the hardware does.
>
> Please see how it's done in the MT6358 driver. I spent a lot of
> time on that driver to make it actually support the full range
> of voltages, and describing the supplies.
>

I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
2016) and unfortunately I did not see any fine tuning option in there.
I'm sure this data sheet is not perfect as it's missing some regulator
registers that are clearly used in the Android sources, but there's no
mention of fine tuning in that code either. I guess it does not have
that capability.

I will shortly submit v4 that hopefully addresses the rest of the comments.

Thanks for your help!
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
