Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6948C3CC7D3
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219616; cv=pass; b=GrUWWPAh+1gR31CJKxrL0sSgdmaD22gkExVBbSdWng/78veMK7/1g3+quZ5K0hDUB3iPrz4fxVB+DpTq2yg7XOBWUHh93aJWVj6hA9Cpyyp6fGMgZgwpKwMFa42usuO/XmmHAi9C0P1tNjgLkiRDiByJTtzVC7vkMp4B+xaoCaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219616; c=relaxed/simple;
	bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWHwA4SZAm5Xq4uOVvtnp4C5r3VwxPqxGesoCTGresC7YGHgWokupJyUThZfQPw12AN3pk3EZQgjV0nkpL5CDw0ySTyxCJRkfqQ3s2TgZEkPk/iIxRzVaA8I39igpQxUeW3mhjTNlXl3ccwoq76vejUhqwH4kPmqhP6w4Ngzql0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCeuOq8L; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCeuOq8L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1730410f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219612; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIork3q5l7cXU5TamMjzdOw0piKFv+Kjha2dxX+zC74HiJOwwJP0yOJbxfETzKu562
         GlKNa05m13J6dKLK8qsPTmF13GXpN3h+9+HuCA9I5Iz3gnu6trNNACoOkJE2PBGZJrPV
         WY2uxH5qqxWNlfBywrSGR369Y9cTtjxYB8VWQNqxCATeHu6MLpPP7BoHjDLT5m1S0SDk
         z1MTRmrjXEM+phU9VVOTqb3n5LlekYsH6SKY8ayGjYU0G9pWSg/DdrSr7gje0Qj/S9Hg
         XJc7zkFvpugsqRsPqwsrLMtDBIg+1elQuN0OIxyWlI2fxDoygHbY79lUIk61gsr478JJ
         XYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        fh=yx1NdLLpkJldZLbQ49yUc4TZv9MfoM8N8brVwxhus1s=;
        b=iUO+O6Bxp80fc3/f7ENWrqLPNagizudDsUaXlf6iPWJx+sO7pYMlqltvYtmxjUs4u5
         e15okeUDnH8RdL2BwKTci29x2weYPJnz4B38veU96Mf2WtrjHRZDJjiM0jtnGuElUxSv
         HgtmdCmbO+ckdir7dJ8vf0Y7Ybo+IrisMe5A3vG2/hDaZ6Yab4g+VGHwZmJgbLhXY4ZW
         LJQvuzwe3WGSUb3SXXxDQCPMJfkqF1J+5xK0AxyQJdskOroiKjYA9E3qCDO53hu+r3ZF
         PajtmjO5tMoGupYS54HjT6qhMeddJrtxsUymhZcod78LcpCwtPqPBI6y3MTvO4/1nNhY
         hDQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219612; x=1787824412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        b=OCeuOq8L/hFALKirAgzAB5gMVR/19MbuNtrhrKETJYScT+IL8ayv8329DgBIz+ls/n
         bu4NXfj0gtbTyPNl/AeSLyiXeFbfeToSzOkUxITeMFwlqd1kvK9vLhWNKnHmxvw3M2q6
         FHPUGAJ0DY16BhgSIGjlXXpYxmBQyGHJSU2zliyF9TpZ8zBwzKO///UYKey3yfXAdeUd
         xOvKSpKVgAtbVn2qn5p/G6BROqYqT/Y+5aFaFrIatt67FB0iKaTnOVCeHyvQ+DTHVd9H
         sltPZksCfpKrVYz4I0TF9+UrP7KDClcWufICY4tPtQTZzAXlJgjerH9HlgnD4MZgLKky
         pe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219612; x=1787824412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uFua/1SLZPtH58HJboPUy8UA2xsPzLVyw6OMpvii0M=;
        b=Xuh3bi1oJ833EbMOhGYxH/FCvuN5r775m9AnK3lX90+0MpW7qVUopmbPfq5XXRdsLo
         9+S8QarUkqumEtFBGittoonDtLq6krJ2jv5wmiLy8DgFR37YS0aDwJmv8aefDeeRG5OM
         DmD+Ws8LMY2rN+hnZeAAP46dtZBeBIi89G0Yo47dIq9TrfgSEi8Sd1LOkqiW5SGG+wEs
         JGA1tK/5/S1dBTCazouUIuubXFbQHFdjKHWr3+1F53OV/TUR2OTvmVHR+6izTC2TA3Gq
         w7dNVGhj8m4CXr1bBwIrF6J8UikFUKUZJO0sha8ZxM5QFVjzsuW60uW/szTFk6DuBg4W
         mCQg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq3p5w2nM9WO4Cj1DWsofWSBZLSEs8kf1pwtlKu+FHl94oa1heXdl4hcrQqxiRBWaZ6jfGQVA7JecO@vger.kernel.org
X-Gm-Message-State: AFuF++kOhg2KbqPWtynEPCB3ndpYqTeXjpHrILeYN8pMrfGkXg6mGOXE
	rrHwiy55qRfBT1xrOcFTXY9m+WMYOt5nRpYL7awH9j238BUrmlGjN0aJ5uYEEK8afSuaOo5WZ4y
	rzRl/adJVWuoVFAzwnZ+8WYjWMNzq/yU=
X-Gm-Gg: AR+sD103dK2DWd3ugbCPq2dPelYQXXrxqkayYXtZVH9TkZHAIDEuoI8TXyhO2gJ5td4
	saU0FWy/X0c43W2t7yYw/V6dCunkNMfY6fILd2wLZZ8VurbYDJsmGPiE4PSj+btZnhn8Hdn1ZH1
	hkjBwZruh6dV0aQ0d01Oba2r8+l/+ffPwTn//SPEUDvXlu2OAxZkVBYkLTB8WcBLXtJ9I7qxYiu
	q4d/cXzrCDr82CPe1az8G4zSUGDqHu0JAqJqCcyKe1526Azm2FQN419aRd4njPIZ0v32U5yocRA
	ZFrXdaoy5OwGzs+xETRoAx7wn8/V1aBclirWFEUQsM6B0CSEm/aOnIaV/ziHqA2JzQTwjv6Zw2F
	Blv/oGHDrbdS8GS+W/ueUF/9NNLmM0MUOKvOWI38n6w==
X-Received: by 2002:a5d:59a7:0:b0:47d:fc20:e7ab with SMTP id
 ffacd0b85a97d-482b1e844b5mr20227184f8f.4.1787219612250; Thu, 20 Aug 2026
 02:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <aoWsDIfmFgkRpDje@shikoro>
In-Reply-To: <aoWsDIfmFgkRpDje@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 10:53:05 +0100
X-Gm-Features: AcwNN1WOm3KalsDKNgN_Ouo-4r3cQno4NAzdUolNyABXgRrO98d1tOFgxu9R-9E
Message-ID: <CA+V-a8sZ5nf21z6Ku-3xUaG98=ZwJ-4Z4OcVkkzL8+pg1w1r0w@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] rtc: rzn1: Drop trailing comma from OF match
 table sentinel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Wed, Aug 19, 2026 at 2:13=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 19, 2026 at 11:39:25AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Drop the trailing comma from the final empty entry in the RZN1 RTC OF
> > match table and mark it explicitly as the sentinel.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Could be folded into patch 13 in my book, but not insisting on that:
>
I'll keep this as is for now.

Cheers,
Prabhakar

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
