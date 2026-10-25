Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792908925;
	b=djh0/m9Ue5s2EvHqpMrhcev3Q8MOhUiFWQVfmbQzlj8uHvMgBI8eJqfzMfOR7bTg5M70
	 lcC6RtlLTVGirPyPNeL7pvIB4FHTXrqAn7hWprGCmMiODS7C+MqsVhlZ6d39Co0iZZRqY
	 FHRRCVhrSARM1ZQ2o8zwdwadWkPPJCn6msa/T2q4EUC2P3VLp2M3fRe6ycjGtGhq0M0qa
	 BvAbFjokuRT/YhWosAyor9SD/1xS1mMe5D6cSPiIgac/GBXymDW69udYao9VRFwjYHJdF
	 slvDShsew98KAiLvif2itO/TZCEnerr4SFNWqtulzAdxN8EDPNproo9MkAxdcR/6c3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
	b=LISSUC68oxuGetdbu0XmZD08tGvaGTJA2vx5E0m/T92NAScpJznjrltRUSov+rNjVfTI
	 PQPJgPqzIFPXxr6qFoOoZHE7yk+dd6PvOuhpFV4fI8nH+vc3HHV8BACtKVg7PyRCekhll
	 VlPXnIqpGArYBgLZ1tYI5tAi9OtlNEiNSEifUPa8SrPUZPk4O8ttVcWV94feufhq6srAS
	 YLccilwMc+qLTokqacm/FzzU018oUHLzSl/LL8EZF6LWyIKX3l1fiC6sub+UTdVO63NDO
	 MfuFo4dU+BV94OLYR5x94ZfgqfnXweSEqP9aWOl8S7fO6FFOIVUhoGTy9CWaTRmxD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TZ6o6riK;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19009606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19009606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TZ6o6riK
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso299842066b.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792908922; x=1793513722; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
        b=TZ6o6riKrjCFvVBnCiTwmiGk4Ava4V1pcz1NQXXb0n9Rnqnq4ACDom0/X4Mm7zVdT3
         aM9lDP5Nt5eGtIjGylFrs4DyGiDEfrjxtTENljxwy7e8Z9XemNoJG5dJ2K12vvAt3RmI
         nOiktuoYIhgJ6BrRqUtN5sfRfJrhogUDR5qVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792908922; x=1793513722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
        b=xsfSAm6/7e6izQtEYDD3sLsz+S9my2fXPpk9OqTY3i2/69EUGq7KbLq0dgHU6ZmVjc
         t5ZeldqY5YIkInCEr3TTw9HUa2IOFkw1SVGdgc93m4HNne6Z5ULT/3MT5HA+QCghzwmz
         h3huWm9zkH2eVt382cF9hSg+W8nOkuziheW3v57WxhxkGO/TfZUI0dc3kH24oex8tMy1
         T5+w2/SrDQSgeiKDkP3mY9NSwBzX2kFLj1LNGtTWKIDLhki9hR/ibjEFRzRYBzxJ/laY
         bb3HAusWZVUJ/eOhWL3FeieHC9xpdNpkOSObwLS9axSykGT7KjktmBrh8+STVqP1jf1W
         1e4A==
X-Forwarded-Encrypted: i=1; AKwUvBz/Lyadzhqai35aaZD+DSuqTZeqXT/YDRQJZ2bimTRYXQf/85RL7DeaDg02vwxStTkxY/Qp8eT9ydVH@vger.kernel.org
X-Gm-Message-State: AFq9FYLddHEwxDHTSWYja6SMqYDbfzxN2K/UJEECjS08u44G5M2yDhoF
	TDOBg9noO3RcbwvQmMmy1BC9rEG6DKoYUOqBh8bd5zyXiB875jNehTOw9bzGD1iE+fFjaj4cgdy
	0wadC7vg=
X-Gm-Gg: AYBFou3ywjohJ8158+zG8pTf/qWN6kk6Ns3iPx/7aWTBxuWV9cmQAfb/r7lIlMPzvVC
	u8pdmpAbl+cJb3CwTZS1eyQ6XLO+lFQrP8GgH4q+Wr5Tj8XwRnE+Lf5kq9KuQwunByieIlzR3QT
	FH93E1tlVhygkLyIvBEUZMOy0vDiiANVBEAVef7hmjklsX4TN23aG7RS7WdhKqf0zPu+Yfwp0+9
	LNA/yKKY5Bvcgh6qMiztwnkn00asNP/SNRLh1oYhZN8pF0Z0igXy++06+bQO6jsE9fRPovLvoDv
	y1gHBZ8jT+JRe07XUrpwtyWI4TDkaln7GhCSb1CXTZsnsPIdyVQ6kDeBwUpMcIHfNn6okJc4HIy
	o1NBBzERxqYgWkiINGSJsb2CZrXhIQNBDM+Q89k6Ru03+SI6QAKUkj4pC820GiKpXwtExu5HXm1
	2DvG26VmZ0jzm7qbQ53iehBfla7gQ49wgmoYOFdfxxrN21RXJeZ4UXQ1/R+HovK/PtHEnwb0KRm
	4RLS1+kl0CkaDxDmtKaJQIN2m1HKTdy4ZIYpA0PMTJHza7z7sahmVELziXxhtmBmqBAbgMSPAeA
	fr5QiLWVkkG4vMKurCRJommknzunUw==
X-Received: by 2002:a17:906:f596:b0:c2e:5f8f:e60e with SMTP id a640c23a62f3a-c46bde938d1mr407179266b.38.1792908922447;
        Sat, 24 Oct 2026 23:15:22 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b2cbdsm169597666b.84.2026.10.24.23.15.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 23:15:22 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c43fbcb4393so283368866b.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRwOQXWeG0Qgx17sAIVK1Y+oOUcCGnSzIE+HH64n9WqCfpbeQKlk2Ua7lockJhMhoGnZvTX3v4K6yO@vger.kernel.org
X-Received: by 2002:a17:907:96a5:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c46bde9d4e5mr422758366b.40.1792908921647; Sat, 24 Oct 2026
 23:15:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022195741.GA3409202-robh@kernel.org>
In-Reply-To: <20261022195741.GA3409202-robh@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Oct 2026 20:15:05 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi_=AAiRHLqW6DxBfaw0mY-KRtkd0JNS6SqTRmp+f2+Xw@mail.gmail.com>
X-Gm-Features: AclHuK8lPpA4JFhXTyry20nXxc5JcKa7_iIYA6Rr6nbO12sQCOuIinbGoDIc4vY
Message-ID: <CAHk-=wi_=AAiRHLqW6DxBfaw0mY-KRtkd0JNS6SqTRmp+f2+Xw@mail.gmail.com>
Subject: Re: [GIT PULL] Devicetree updates for v7.4
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 09:57, Rob Herring <robh@kernel.org> wrote:
>
> Please pull DT updates for v7.4. There's one merge conflict with
> mailbox tree and the mailbox.txt removal. Take the deleted files.

I assume you meant "git rm the deleted files".

                 Linus
