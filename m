Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF82D9ECD
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204595; cv=none; b=M0UyUD5eGS6WtqGQR/sxIPTcdRseciGkizAmjFS2/jaW+AzmWrb3qoI3tTxHVdxAWtHMryv3DhvtngkrASEdLazXo5v90+Ef8ao0K8js/5VWR5kgEot7XAhnSN8GlwH8BEJhfUSUQ+iqmSkGnJCBAIm4qiA9CXBeiSF+MB40Q2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204595; c=relaxed/simple;
	bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P5BJtvg/+WiYh5+T/Y7nX8As8cPe20wVn4rdX8LafaqNA8CMEXJljmjQ1L4QsX9LXKF9Zo6+gC/2GNLEZExOJ67ElcpG9mY0ckRYnnb3Vrv/EdnvnsPPb8uDVrP2MkvjLRAXwn69IvxW2gNmSW2b0/9+SkvflJ3Al0ocPUOkVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x281Uxd+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x281Uxd+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66e56756220so186889a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775204593; x=1775809393; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
        b=x281Uxd+O1epRbfuICmVyPJkXA5SYdzMCZSDDYsaDeMWFjMZydJgqdSsBiP4QkdMTH
         wdwKFSAQ7txNW6HyUljdoUrfpaGIzbIL8Bd4WlM1ry+xIUjOlpPr48DdUXY9Lvu58rTc
         O74XJFcQG7oAytQiloE4qjmhbU1siHb+95qe+uXBaLqAfpLPhAJpLeUhqAWeKprmhtia
         zHIe2TK9cg/K07gEjcgtRR/e3fjO2HTYc5OZbziBYtWFctlonKUrc6ZD1JZNY0PIa3eO
         M4/wUPjbs5zxDjzf3g25tDZhbg0hUrf2dAOMw/W+2yXnG7EMOd1EGrOJR4v2pLWagNS0
         ujKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204593; x=1775809393;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23lg71SS1ypLE/10It2aQYW4KhKP+2cYmx1DGLGdzjA=;
        b=hSDQiuBRBU1mSiyKOuSC4q0XtCrQMzyv8mKKymWTAPxqehEyGiWtyO+k211/SqgZOx
         92YuGEqaCbt3JYEG6wykG4eaXI5m8NN1UdiY9UzGEtI9HjFm9SLn5JHDNQ9EyN+D/alJ
         YHY7i2absxcqE3jpH8uFd37gwYjm+LmRV6Zx0L1ysnPV7/OkHPBXbYScxf1sQtGxHmmM
         xxW6gw9L1DgDDo91JelaRK7nCmP0+emkmRL1H81D6gGt6S6VaqJu1yToSmVJAbG9CxgH
         B/8ElpxT0j/TsoeCtGxyPvyOOY8jWBQHnL5OFQQEmX8ZB2nXHo+24DO4EeafARscStGE
         Sqmw==
X-Forwarded-Encrypted: i=1; AJvYcCUDgNdHGoKQRPQQqx5Kn4dWoNsM+ryR2HPuCR83uqVmJ1/k4F9P2GUzmNXts+vwQ6SF89UjwzYmiWKY@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7/09XLDuIUySBRF6Z6qjqkBYrGNe5WiWcWkVD1flRknpnKs2
	bkqL27MNUD4Tmvs+k7A7SYBO0GVtBSoQCxXRYGcs+M6ekZVWdjhXj6oILZ8ixo3c8SY=
X-Gm-Gg: ATEYQzzZqhYEz9ZQaEuU6yvmGmCaBbdUllL8GI9orLyrkOzRpB7hXVxdxFll7fnALbf
	J3idrvXszZJ3ZRc5/v1ulEHieS3/oJwgrrY4hNGt6Zky7Sggt3rle0ZJ0uut1UjHLwp8FYulwrk
	0KWYVuhbSzR8JBYZNmqOZ+1rVbDEq2OJ9pBpx2fRLSHY6zFJ+C9HDfdCHX2ETaywebgF2vm4CNv
	CM7tr8/3PodisL16TAVUAYEhvBJsIis1KOEpFbnxZcdoeiqvhs27yd8QTDbRaQ0tiKykKMDDtoi
	NtOsveRoampSlebYpBs6yNMJbcpcq8EyqpRC72SQa8wP+t8ewKQPFgOSt3RVEe/9+7cOK6HyyP/
	TUQfrwUlPZhmrXnkKHheflBiLIgjDI7KRF2zYgUHKqJB4AL7f8qUg+ZJav48eJvyrVusgBFyMWg
	zG+rT7zAO1HNRVwH+4Lh1PGtg/v71Hn1hcefueKbH/SdmrdAJFOvM7a29IesKiPeVWXYZvtX0nt
	fhGLl57in8isFNysWgBNTFrJ63v5RsDh7jU
X-Received: by 2002:a17:906:b391:b0:b96:e593:fd32 with SMTP id a640c23a62f3a-b9c67308377mr71993466b.12.1775204592537;
        Fri, 03 Apr 2026 01:23:12 -0700 (PDT)
Received: from localhost (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034d60desm1398832a12.31.2026.04.03.01.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:23:11 +0200
Message-Id: <DHJDIAVJ89XO.2OH312F9UMLXN@fairphone.com>
Cc: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-input@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] Input: aw86938 - add driver for Awinic AW86938
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
 <aae7fRYaoDHMptyu@google.com> <DHHWDE7QEOTO.1AQ85UBLO8IQG@fairphone.com>
 <ac1DclNOl3ZA5bUg@google.com>
In-Reply-To: <ac1DclNOl3ZA5bUg@google.com>

On Wed Apr 1, 2026 at 6:11 PM CEST, Dmitry Torokhov wrote:
> On Wed, Apr 01, 2026 at 04:44:47PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Wed Mar 4, 2026 at 5:56 AM CET, Dmitry Torokhov wrote:
>> > On Mon, Mar 02, 2026 at 11:50:27AM +0100, Griffin Kroah-Hartman wrote:
>> >> Add support for the I2C-connected Awinic AW86938 LRA haptic driver.
>> >>=20
>> >> The AW86938 has a similar but slightly different register layout. In
>> >> particular, the boost mode register values.
>> >> The AW86938 also has some extra features that aren't implemented
>> >> in this driver yet.
>> >>=20
>> >> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> >
>> > Applied, thank you.
>>=20
>> I'm curious, where did you apply these patches? linux-next doesn't have
>> it and I don't see it in your kernel.org repo either.
>> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/
>>=20
>> Did this slip through the cracks or will these patches still appear
>> there?
>
> My bad, I think there was a conflict with Dan Carpenter's patch and as a
> result the series got stuck in my internal queue. My apologies.
>
> Should be out in 'next' branch now.
>
> Thanks.

Thanks, appreciate it!

Regards
Luca
