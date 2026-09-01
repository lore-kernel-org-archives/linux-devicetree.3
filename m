Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF4386578
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258737; cv=pass; b=m4bFZK7TuO5wpXEPfafAE6mWdn/Wocflymf5jVF5nzafBphPbFxDrkVyCl1YqQU2cAa7+SIfw8y9IjYhihIae7ebO/t7QmKuDn9Cvi4lpr9/Hmi0ULKfSjHU2Wn58LPbx1UzqAwkbfe+kqNbATRDeZz9o9rdlOJGBlEaWT8xXcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258737; c=relaxed/simple;
	bh=smEifeBMy0Z3ajt+Qik15W/HgNo5+JEeABnfNmNyhfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGZoyprK8rRHOHxhbQBxXZ9mPKn69d/8X/JiEXKEwFxLnD8LN6yuI9Lyauh9FKnEjEMH8cYKYCluLS3Tn34EVBhNuyYNhI95UnfE1aXrd8aC5xQS8XD08DKInle2icGZZFfVmKbMaiFLixPY62l8udlYoCRHnDzp93KpqqBf4KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDo6bGeU; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDo6bGeU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1017017a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258736; cv=none;
        d=google.com; s=arc-20260327;
        b=piSLnEZcxK3ETJ4IOkURBUUjzPHcRbbBYNUaJNWG/jEjRDpaNbYQqC4trBCRPISOW6
         4bHcQueyt66mAWwxrP1sHzv8rBR5ZQlUsJyLCZ/ZITBWPwVC6oA3MDkHGld07mjcZctG
         vSnFJT7MPxFnk3M2xyxwPWuNqockp3J3jAArtFtc5/IR1RWVNl2vkyHpvpO693ikXthj
         vJsjttk+x0DgJJCnT/LjGBmnNn6/eYZrBbKFoIiqDs2nFcekbDUnrXm4Yz80443VrOhf
         UVU3gUJgZfYSMpkFrkt5oiS86cyB8jHQd52vC4+8aLwrV8I+vzlorRbHw83LnX+VF4XG
         9ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        fh=m79c+DxxgMlLMnAag2rqiPCY54vuhpWbRtvCqbVTwzM=;
        b=R5iBozbEMplnVtaF2M8RQgGlKmGPL8BBztjVWwUEdlUxDtec95bD12v7BUuUZo+xIR
         TotYG9uME9sdSiVsgQoJ94mPY69sx90wHQYKgR8NEXea0AjrlbyqrNB/pm9cUxKGHZk6
         7ITvjsAaAZvF2/Pv2ws9oE9oAzJL4hTqqKEIBF+GyDUoVoQ5GE3tRndh9oxbDAiT4SaY
         Yabb8hBOrqvXaLheX9MRiHKHdVTVtTezsvsngNWvmhdjn5oVvQjDewxgza7Yhia1Z57L
         YV+yYZNzkv6fa4py6q5mmEr5m2LfrICCia9KIppRKW7Fhb4MnJu0EHFXsRqEEmDXC2uE
         gumA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788258736; x=1788863536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        b=pDo6bGeUb3RCk5wwYhvyHsi5UlnmlmsB/mv8gFGgXdUeHqXJV1gsRmBfisgjrE/V7Z
         0YaGgb6vBv9XLZ9efNdrNzi2qNPQkxwjUJ3DUljRI2qo/KBTAOgCMWm6rxxgryr9o6s/
         O4xjNeS+VMhqrEc3Y8sIB2mnjikHoixUfuyVmGoFqrVAtpLgBtNn+MFgmT99EIwbNGFs
         Ye+almjLq+zkV9g80wI/9zavhxLgRV7o451199agXf0OLENDOoLIL34O4zjxXUchxMWN
         K+axDXkiHp6ZX7EVbzWwutWs/lPUj8Edmx2+Q+U+X6U7yZ4gzGywCiud7BabHDD/aQLj
         Sb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258736; x=1788863536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5s4IKVXxawyIQN3k+Fx8gYZRs8DqeFSyZO91rnQvKI=;
        b=RQc5BmmykD7sWQSL/v4Ani1BS7ttiMXxqL1CTQ7VmcxDHOq+rr8J/FZcXsc+1x97o1
         9ts2ZEWmn2XG0yjW4bYVKOig2NzyqGLbRhttqacCW3mmwJugS/Vsefp1iaMyVxa+JSQb
         wsxf+bmCkfWeMzD8xdZa/ZeQZXD9E+pB3Qzwr3x5DCbB97moveJeo2xi2YKDgnucDKy1
         ury+l1IkBCgnc6fHB5p1hLNs8fkDGMn/ijkYCSA80g1xKnNVsXjVO2IcuJSJecveLkkN
         o5ox9g6pPvl0/2fAfc76lQJz9iJZhSa0NSQ/yql6g1hBo8CcQtb2eW6DX9erEd5BoinG
         ef8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/spGHYGwUn3l2JYckf+ZCFvxAo6I0Kr6OydmTWR8i1gPozjUNla1MFaTKGoiJuKJiGpTaR1GoO4iR@vger.kernel.org
X-Gm-Message-State: AFuF++nyUovmgNZaoDnRxA7AOqCZPIqg+Imvi8H5AIr+nKaeTZgLxHXb
	ZZ11BarEoXEj4B6gK6bZC8MQUjqFkBlVd6Po4ib/YOfi5Kb+A+pbx4mEO0rEH2vmUUb4NttQxvz
	zBnvikVCH1uoXmkoquE2xKmQkqi076pU=
X-Gm-Gg: AYBFou2pOKj8H/PBa8eQc5R4hvlxBc40lEUk9iUqZPZiO+z1UisKdtfQtnrKLQyhv04
	LQZ5v0t+Oe8sc7bIEJcLe+i7ou3KO4BD3deYdBLNdfStlxa1yzfrYBlPnFk6SC9wRifOmFZfuwB
	R1J6YTgFn7E2cAN7hs1/7bgNlPRXTj/6+ckETup93AJbDJtlON4/7Veie32haIOqbaKqDGb//cN
	X3EvhLTVz9GMhU5xcUuE4lmgCxEhsbyGybBIMB8m41yE7r87De6Y1/AP7p4gcTI6TLxJt1nRtrN
	yeeU80M4UDne0RuRppnafi7uFzomLZbNnCxY160VGr79
X-Received: by 2002:a17:90b:4b91:b0:398:9beb:a2bc with SMTP id
 98e67ed59e1d1-3990f91f621mr4597404a91.30.1788258735750; Tue, 01 Sep 2026
 03:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll>
 <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com> <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org>
In-Reply-To: <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 1 Sep 2026 13:32:04 +0300
X-Gm-Features: AcwNN1V92jXDafPZZtSS49uqIzVTNJkSWZ4fOedgWAlAqiYSgU8_CRCjPwq9NOE
Message-ID: <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> >> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> >>> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> >>> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
...
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > ...
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - onnn,ar0234cssc
> >>> +      - onnn,ar0234cssm
> >>> +      - onnn,ar0234cs
> >>> +    description:
> >>> +      The AR0234 sensor exists in two different models, a colour variant
> >>> +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
> >>> +      the model through registers, allowing for auto-detection with a common
> >>> +      "onnn,ar0234cs" compatible string.
> >>
> >> So all devices are compatible? Then why compatibility is not expressed?
> >> What are the actual programming differences between sc, sm and "none"
> >> variants?
> >
> > Perhaps I need to revert to the compatibility strings that were used
> > in version 2
> > (https://patchwork.kernel.org/project/linux-media/patch/20260807102847.1813059-2-eagle.alexander923@gmail.com/).
> >
> > From a programming standpoint, it makes almost no difference which
> > sensor is used
> > - the only differences are in the output format and the format count.
> > Either way, the driver always uses the sensor model determined via
> > register reads.
> > If the specified type does not match the detected one, only a warning
> > will be printed.
>
> Devices should be made compatible with the fallback or even the color
> and mono variants could be dropped. That depends on the difference
> between color/mono.

Removing the separation would result in a regression.
The addition of the color and mono variants was proposed by Dave
Stevenson following
the first RFC version of the patch.
Subsequently, Laurent Pinchart suggested an implementation approach,
which was indeed adopted, though it has evolved somewhat into its current form.

Thanks!
