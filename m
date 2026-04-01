Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8731E84D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067588; cv=pass; b=tX7gDFqEyxutj7MbL46fGLJYwe/66GiraLy+2mt1lVWq0/SNQXXdlLWUWsGlTw/1DHQHj6TfObrnLrKax5bIC4XOJRnV8GrS74uNL4Rz+lVWQ0ViJigcWR7HFG2rXdUqcQLYpsapIT7vB/ffM3ToIZ2AKHhcDvrt8KiNDSSNjsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067588; c=relaxed/simple;
	bh=0h/ZLXlyAiiqkavyYvYUO5EzqyuCCt8oYTMVBap/wqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHotuGH+wBlWdZ5QXHNEwPKPoM4NxEyyn5P/BFZlcv7r/Sl5OHoFklCavqkeLRc8/keoP06qQs3xLUJkmssqLiTL0pXVLAsRJn/WElr28dDyYgqbEdhPwZQazszrbwDVUa9Ays9RviwcsYjkUJXqpdDgFX9hEmr54VRdZVqK+aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2c7aOie; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2c7aOie"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b23fcf90b2so47749695ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775067587; cv=none;
        d=google.com; s=arc-20240605;
        b=BG1p3bW6oXc2oMXxRHUSxJdaDi2iik25tvNj6k+BUBzoDtvEToH6dFdl8c61FAIJid
         YdDFg3/3N1jJ8cqmgiKijAzG019QwQ351rERx5nF/wx00NaisaXs1cWqqZPNC49Efyvs
         5q5sf52gWG0DocVkn2pnYohWP978W4uXPomEcYFCane4M+skZ8/22A0iQTOT7A8gx76b
         qYXA4ifpp5i+3s4aWwActqaAQhbXXZiraS3P1oUenJd2ursGDhcNHChcuQYdFUaXujQ6
         baLju4EUVXaztu+K/HgfNJO6IXF01mMXzR/IFqRbEHaSjTq+cxm9sfMKGwmenjCZQtnp
         JO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0h/ZLXlyAiiqkavyYvYUO5EzqyuCCt8oYTMVBap/wqE=;
        fh=qIXMybltcV+XFpE8RZXPn2P5qFj8CWV/QnucYaJn25w=;
        b=UNRV6QFOay8uJbDyJgdkqL22hkXonUfpcu8VfA8N2FsGQs8SkZHja6TLMxFb+ufgdW
         slsQOQQbZhZQMYK35ro78T/hlDaiAchreTtKMa8Fw/HfuDsZafT4lvZLLLD+Qv4raQ6E
         4hgZIe+00FkcAYkXrElXmmtXJGIepPuqy29UkXCFLQApbMs+NNa5SxuFvFy/5LhMH/EN
         gH93qW2/vbogBJ8nCykZZmsWdyzWJf6xFK8wC5sYDOj5aN+N7Dx3IB7kWyzmJvq8unXm
         HumbChcUJc4GUy3mRTidVoJJGRCZhZBQSK/BD4EL8NakPQcfQ5eqwpafSma8oqZWKoRD
         Rx+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775067587; x=1775672387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h/ZLXlyAiiqkavyYvYUO5EzqyuCCt8oYTMVBap/wqE=;
        b=E2c7aOie1QM3H6RNen8hxQ8iycidMIx0xhhX59VpG+PEgqKksbQtnIJuD7JVhhKxqj
         Pw5AGr+50d/4lCpsrFBkb2Go3wMcwfS6KtVszYdvy49j0wuDlZ1LkOgIQnmBYfNMcuWU
         jc80UYFeeH/lzTHROhhT6PM/Mks5onqIP9qgr8ofcpChYLaBNG1LH0j4ORHnNZwJIx/y
         SrQJhJbhUfJ4/6FCGftrZ3Cxq7awTFwnkjY9FExQo4KP+poz4t/RQQKHVLo0y88Hc2sI
         mxlH47esPL7kusk3IB4CXmk+x1waB7MtOlGBTPuEL35i9N3yxVc4wm3o+TO8I4CEvoAE
         mVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067587; x=1775672387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0h/ZLXlyAiiqkavyYvYUO5EzqyuCCt8oYTMVBap/wqE=;
        b=RNsTNUP/hgUKLSfc7XH8hEaL14OKJPynReCfNBsMa/h/88XPSAyvgLiddOTXpxzbB+
         IUgJ/2md6xQlwwfAVvj6+VD2FVddYGZjqNU7xlhXqMFGVFRdX2aEfFNsHJTzcR4P4wLu
         rHGkshzNltf57RGNzcujZTgfd10StzwryL/Fg/S+zV8wY/KVuCky59/L3XleSqs9Bz92
         FzTIVONHvfRvIbXN1CXIlfzHdvXg6EhBy2jjZbFThO8g1VQmBOc4OGG3vmBx3cs9xy4I
         6EGohkDkcBa0wHiSueAirWXiqIWHzC5K9JBe6jtFHO+JA8CPEkXFmUQtRik62ehxlWlT
         jG+w==
X-Forwarded-Encrypted: i=1; AJvYcCXyAqZiiMUG0x+TBuOCqG9zORtuazzyOGDmlhAhg/+pQVb1SbKzBm5CSxZOtarLcTOqKUQrA6txTPPc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2uVc4RtV07kWn7tAO5lxz5YG9wZXUjsb9Iwx4GYhv3t6kFG+k
	JJNEA5EBRhY+FsftlEIDzWSAo+6wmXvwcqEzqreT0i+jNYMeBxVhP9pqTNYQ6uyUgsCHj2kgLp2
	bcuaHYYPCsQLw3v/uAmWWEwymf0IRNA==
X-Gm-Gg: ATEYQzymX9H9m15qQIwt0xTO7KmNP8OKL/rnu5bXgyJP7ocdnAeh+movriNhlskjgJT
	+V8dBZWtDZ7hp25o0OlvxzHwEEE7agr5juCzVKb6hgYbgpuJRyz6nfG2ZIFTwE5Nny3pZ5k/p+3
	G4A8cXQnVR7PkKmBPm6uQxiwf+yyvSI1H5+jCQ5KMvrACnm13xBj3hB/zsYqgMzgUtj0XVnNgBp
	qPKHhf1NLMXUoywAozCg/6CpcPBHR6IzZmA12jqveEX7dHnEaTdzYA4/njmQ0lMA88sFnqUGvwi
	2gHgeTE=
X-Received: by 2002:a17:903:946:b0:2b2:58c7:2cd2 with SMTP id
 d9443c01a7336-2b269c8bdc5mr44577745ad.36.1775067586674; Wed, 01 Apr 2026
 11:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327082350.20573-1-jihed.chaibi.dev@gmail.com> <a7f8048f-eb35-4ffc-aad9-a5275e830952@kernel.org>
In-Reply-To: <a7f8048f-eb35-4ffc-aad9-a5275e830952@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Wed, 1 Apr 2026 20:19:35 +0200
X-Gm-Features: AQROBzBTg2eMwme9vObgMyOhUJSF_7jbcgLgDPfxONxmwyyBU4F3rhi_IvTT-eE
Message-ID: <CANBuOYq=XAUpoC80oZm0oPT=Gq7TYrxT=kJGxKuYf4FO477WZg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: twl: Reference converted schemas for subnodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andreas@kemnade.info, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 8:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> > Replace the inline compatible definitions with $ref to the appropriate
> > schemas and unevaluatedProperties: false, matching the pattern already
> > used by the madc, gpadc, and charger subnodes.
>
> I told you: no.
>
> Why do you replace correct code?
>
> Best regards,
> Krzysztof

Got it. Dropping this patch.
Best regards,
