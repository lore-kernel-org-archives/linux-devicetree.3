Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE83BCD15
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550617; cv=pass; b=VguXGH7AVjFVGorytZXG81G2gHkOTM8BO96k5O2R5NhC4a/IjVcPx0alSZsm4j203oJQpEFQl/2Wbai0ozW53JKt3M+x8wTCGSciWSnntjYRNR+PTiRPitO6ibhL1Pw+2QmvLiMDyUxNZbW3+dCmgX5kNWh/JR2y3mmJylJIElw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550617; c=relaxed/simple;
	bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2gVoWq9U4TbTGYUx4Kqs+0TSy2tLburpvXLLlyeTcYYrLNrKL52uFR8DrP2DTfgqQ52EzIIuMu+cjzfVRkeRsCIg/KxMmVRqqxdYjzj2qjpVofNdIWUB01CKmH4iCW1kZSklwvv7Eb3Oo6fC1g+RuJEu2TqRKPJJHo4VDzaRxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osQ1CtVh; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osQ1CtVh"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69e4483cfe9so670206eaf.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780550615; cv=none;
        d=google.com; s=arc-20240605;
        b=Cr8bXDUAdUCVbR2YZyW3J9WOgDwTtKkD6pzMhz3u+3WaYZ++ZQDpgPWNr8wlNLUNBn
         EZETQpvckvjtyyZoNM6d4Tu5L8YSd4DkL9ekGapZeWLxNUgu70cIsogOyqgvWirDiih3
         eRAFvuI2ZCcxWCNP3HuiXjqFPnc0CtBmfFpFQYknjaZzpzH/6j/iD15ZVshp7KQttCan
         Ue7oAKgB3ITgtBnQUFFtWE3JIYUQRfE1EyPqQqi02G7NSyetykFghuMCPtCe0y0nBjHS
         XUVB7FQRrZlI/8IxTHL8qklKRhQEC/WUQt4EsrTh8pp4byBi3X7o/Et1i5kTsy/vreVg
         Hplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        fh=Y3pGnJvBhjuszp79Tu9axSUbsBJ3Vf0531frDhD0c7E=;
        b=EFs0I4/mfdATLfGwdClH/q83rSmowJDhYCQCaCN6naKp6HmR9Nr9c6z0TbqPBmfNMq
         OPARhnkGCjB+NqGzga9MKjbZRc5E0t7noxr7V1cCu6JzZToWnJ6fOE39WaEl5/va22HR
         KS6q+GPfqMI4lryb5XCLUoMaW9d6Uwd85QvWTKcok3JR4knZnBYsXl/d6i8C9HB02Zg6
         5FibqL/4Nfh/4uWuh9VVcG5WjtP4Fipr15OhTv+jd6F+h7flA4OODXr5x4hdxZD3Gq9g
         8QY488uINjaOOGKqxKvXK9YS2EJwt5KFfkW2qTTelfc6owf7aQPi/Htuc4NupiVYolNg
         LSDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780550615; x=1781155415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        b=osQ1CtVhcrS1F5zIUEc+lDa6/mST78Xghsj/4zh53QhyxbiAuWbkTGYF8+jQfv4TKD
         NW8ZUtTtntl6OzeWSJgjg4tUCGHi20I0BLP0lbmHwvO5l6yCNtAkNnUtrXBQ6UMhh5dc
         wtCrUNbjHMYDRX/uBRLyUtFdBhgnxend/3dQxSeqj/vcW+EXZpdv3hLBqPu82L7crSmM
         eFVsVR4AIucOyH5sQ0nnnOYR99GTWVZFO2zwP92NBr3pc4GOl23zxITF14XoJsVX8XCn
         yz0+qkPhBaDPJBtUckFMOXp/e8VoAVPQJhfimw+j0v5tY15itPubgdZwcBCTcdubcmPA
         70jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550615; x=1781155415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        b=YniSy3UhwVwA9DjWGC8QtYR/JLf0shCFEsUWwdfJ6+U86tbofx0pvb9P0tHR2KlvyY
         EkHcVFf9gRasiGEL1aql3LTRi7r4E9GxscKMwODotFOnisPzP6R7Hov7WZBoeZa6WoN+
         qUW9WxoTRVFF9oSz7IZZ6GUq1LIQvRStxyvp+89e2RXkBj3fg0O+W1dlqFpOVDtIlygh
         tD0XDs/S8/MmyKkcMdX1P1nozkkLx7FJeCurVUr3kA6lJNG0DK5rjov0vkzI5VSHUr9o
         gdjfulepbg7t0lAdRp5hswYkpzaqnPUexC+WddoV7gGYCZfpDX9alkga/6YJiMx/xltR
         OBqQ==
X-Gm-Message-State: AOJu0YyQjrNmqNca1yt1q42EsBjv7ifq4vPlk+rnfvKeD4hL05Kr3C0A
	iX86MGzsilmRfghXEVw9vBQXUSdgRoP2ftPTlmPuvyLR011JhjaR916xffFlo/uNPZK5Eys3l7A
	hBY978bIEcR5zGilnw7edbWSP6LW2LHoxj+RoqR+Npw==
X-Gm-Gg: Acq92OH0OLxlr/0D/p8UOEkSqZ6SO13i+A8csWZUfI/3cAbeFeVuqEbt0erixv5KWEa
	ae0DLqLwZLk+mewxBELHeXDmcQAwVKt3XJF28XHLfJN4XtWCi4liKyIb7POCuXzqrP4fCyw9qfn
	dxt+Wq+Y3CmMlCr5MOpPQyfPFPBcy33IUqe2LJWFTHXm8WhLAs1eTlBPIRaqqIU3USkKid+MHT9
	foMMaA6Qm6QcFy0wa53MdRgWBh/se1pJO9dBJQQoE7+dxzB2jFNiJSN7JhWqm6uyLnZ+s86u+Hm
	582Gu6etahA9JU3Cfq2lSQU=
X-Received: by 2002:a05:6820:c2d0:10b0:69e:5e9b:a47d with SMTP id
 006d021491bc7-69e5e9ba739mr125726eaf.5.1780550615598; Wed, 03 Jun 2026
 22:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-7-5529a7b28384@gmail.com> <20260602232859.3494A1F00893@smtp.kernel.org>
In-Reply-To: <20260602232859.3494A1F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 13:23:24 +0800
X-Gm-Features: AVHnY4KMEU2WhD0nvjMwpU3NMXUXsI7Ox3Ri4eRsECUeb1hKlU4cqSpj1AHXzbM
Message-ID: <CA+Ck9FYWCbHO6-BU48KLx_Lov7pJiSbAP8j3Te_uqFFq81rUjg@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: riscv: Add Zic64b extension description
To: robh@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Conor,

On Wed, Jun 3, 2026 at 7:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> The properties block requires multi-letter extensions to be sorted
> alphanumerically. Because '6' comes before 'c', would it be more accurate=
 to
> place zic64b before ziccamoa?

On a double check, I found here Sashiko is flagging a real ordering issue.
(Although it exists before my submission.)

In current riscv/extensions.yaml, zic* entries are split into two groups:
one (ziccamoa etc.) sits above the Zk* block, the other (zicbom, zimop,
etc.) sits below it. This is wrong considering the rule says "# multi-lette=
r
extensions, sorted alphanumerically".

Would you like a standalone patch that re-sorts the zi*/zk* ordering
properly? It's purely cosmetic.

If there are no objections I can send it as part of my v4.
Let me know what you think.

BR,
Guodong

>
> Does it make sense to place zic64b in its strictly correct alphanumeric
> position, rather than continuing the out-of-order grouping of the existin=
g
> cache-block extensions like zicbom?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-rva23u64=
-hwprobe-v2-v3-0-5529a7b28384@gmail.com?part=3D7
