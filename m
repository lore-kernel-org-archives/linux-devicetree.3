Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709137;
	b=bzqKloSO/Pr1qm9RCtu5pM/zZgOTNDbZimbJEN4ZiNQgSbCkpXlyg3d3HoEdZGdzsv4d
	 AqVyCfXP1xAgDl+2zx6wlQG93Vlj12HUb7pjJu8es276w+klF7Dyn2cyW7PFO3Lyxj69x
	 9lMyuxaLzMjLkuJTxEhDqdsHBZ/5+ZH3bbeo6w2L4VlNpOV/xHJDUxsodNIz6lrXgNRqV
	 eckDMS2KJudS6mOwgBdXbzu0sdnLgip8V5G/k4pVCC1FXgFw3xNSKxI4OITQyegPqFskG
	 /kIvLlX52d6WcEzeW6N4Z+AjcG7XQESUPwgD/NbyRkUMxrZflBgfCBwhAfS3LLD6wmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
	b=hnqGj6iwYrEpcR/b5xurXzFWRzDvzP5q4WEHgjzH7XpivkSjsIwFXvABA9hxG4hfho2P
	 zyyhHIW1sZeCUcEJWwQuDbkpf+1WB8SK+RvQjRu5DUaWLGu78MmD0DpG1IWYc+fJKpsIz
	 PGl4ymhynZLz+o9jzokXxd903rranK0kJ4/AwuD0V+HbZ7Fw+F33iQm5GK4ZGi/78VllN
	 91XY6BwKzUFpfwcWYJPyb0Wbb7u8/S7pMg8MXz1c0SUQpqwZBDwtg7QenANU7nbjqrva4
	 czVK1zhvLQJhlqnAtTNF/a4NyHNqDZ+9sm0f12+IHjD91tcF/sCqG+QgYqqW4caZvPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHSFx1QJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC72606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHSFx1QJ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386d1859e1cso1636351eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795709136; cv=none;
        d=google.com; s=arc-20260327;
        b=pPczLSu0q2GiefewZc9OG7bkEXwYWeVrfly4WihNPA4egC2GR1gKSFIia+TnJRS6nJ
         rPLuMF30cubirXrOospg1elaI4lX+sncExUK938BEDRqdS39Zv5DBgwCohYAhFdZwDIO
         Vu4QfK7R276Ezsj97Gqqh+mq+vp7odYiSYH4iDxzbf+DCYEuGLIsz4C10djpTEsXunvG
         U9gA0Q9CMgFy+Qbhoo1ejXSzEh4n/yZTiGSoVLTIGi429ZQle8FMzoOuZOlWJNjPbQkO
         9iAnHDpQTWvhgJcDNSi16Ec7pZGJYwINMWpBJkpBmeHaeezU/3zWxDW7Uv3Ra/RU0mLw
         goKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        fh=BT9XqHiX7PtrHcJRLNezUhWOHYiQss0XHYs+qn3iWws=;
        b=fpjQve47SWvvIg8jQ6Td6JtHEujkVx+OcxOEGLsZkcwbuEnOEmecYH6A0JekX/rV+k
         yq3YCL4UK0Kv8w3SfSePHsyQpIf5qqP+42EMicJAEhrNplf/4FpldwmhOeWfWg0gul/M
         Bzgh1JQQGKFGJT3XBtNHoBJHH9VTVl1/9AbPq6tnys70peRB5+NK2WELm0/1OiZrxDQY
         JgVHMBaiMnHheVNXLd5YM1Un6vkVVR4fooK9op+IBJLzOHN46o0CCcZpLo7xF+qOXLY6
         LlIe/UWeqCdWg5MkbSk3XXpq1QQHd66qXKABd6FFlM9Ga2UJvOlnwSRhk3m0ITxdIBzz
         /iqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709136; x=1796313936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=LHSFx1QJD64NxrJTjVySmgdy1+QyIpvCZsYsHetuKrtGZ73f+yuvN6vVAQpjFgMJUi
         VMebqlntGR9XwTnjXCDaI+DIdtf3eb2aF7NzhdKB+TAA1SpPsymVwDdhRZSoDISFZBhy
         gT3iGb69VLDLPi9SbtnLFXY/8PaeK0RPmcJMc/viANOYEle757NWA7VFKq9hCFqzP2lG
         PHdadIr7rt0xyZDOTl/9sp4H2DE1XwTnuwY+DK2k8n1YF40bHvHKVFg9lhRaEeysJymQ
         egJfvS/KrIqmEnVEjlJQrOyfCZ07jPJk5/NRhra/84mmDWdhjgDezO0k8WppPYOSFRyl
         cHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709136; x=1796313936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=YzlFnuNrszr3kEZAXJacVEipp4sNKnas4z4WuckMDM6yo8N272kt5rrnkCCTgYrFsY
         dCj1TKYgpUtyUjRLndtq+tUcpkvRDj+D7R+CVE+FJOMaaMZ7sngPD7xLnJDu07ai971k
         OiZM7CVlAJJK5Ny6xWfNt8Jr0cE6ClJ5B/Gz2EqOSG8aHylzzXZyc9BVOqu/S/HlAObQ
         JcRnvRuNHAMR+Yof/StSSYQTdikbR5aOlp8qzbQSpVeVQAQHbpIjwwd6I5NTJK5tncUi
         GWU2+n/dfXwO0s/vqSwTqvmM2gDsMg5p/ET4iL5EBAtbiNEHcoL+zBx7F19Bpk5yANNr
         M7Vw==
X-Forwarded-Encrypted: i=1; AL+hErHId2n5Nf9rypC3vqtt56EohMpJhv5BPVtKD8Mk7541iEN9mKkCX1MlXqxe1zbw4Xebe7Cr1wQp/fGX@vger.kernel.org
X-Gm-Message-State: APuU4Z8m0cjb28L8PEYYLCmqwdlZC9kMZNxnVa8xErblvYJONEezZcOe
	Q5IHaQulrYFuOx36V/MxaTB6INGf7FnDsn9fZCQwQZpsUb1ipDPJSH2QyoLiQSNR1oNBR0aqvia
	yHxSCcOX3BOHtdDWVVMhTBxNcEAipzdKqxg==
X-Gm-Gg: AZFdTZeqCF3XewEdWnPe9IRz+EOgppBuBNlFY3vnxb3xqOV0yxN0avXBbdMqhnbnEDP
	ZLcZ1ccdc+f6cXbvLuH3a62GQz8UC8V7PRgGjD17ckGJLMlu1WZNRuXbqbenCXqUmBOwePvLxOa
	CjkjUg8FnwbzMz0jcbJlvz9dtkYzeK/KOxWcR5LsKXtL6IZkrVgtqtvBhgKrGTLXahmF4R8NZqB
	5i1nz8AXaBpo4Twc7yOHep5vWvTOG71SZEzWi1ugGtnmUDMnBgGGv1GKPwE3GAqueHLIywjg5yR
	2hHB3nKg5RasgFBWjDjBTfHikFNhrkly7fAL4Gre+7L4BjddzX8u9R2kggra+DEdCceOloDvPM4
	OOWp9L8AqVYcBJhdKY4H3ZeNfdHDZjJzsarco/1r27Rs04dxTXWQ5qxqDrudLIRLc/TvEhZz1zU
	LOOvoqWP3qxgEPWrRuCkDbwH2Q/hOp8w==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id
 5a478bee46e88-384b3986ef2mr24979842eec.6.1795709136002; Thu, 26 Nov 2026
 08:05:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
 <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com> <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
In-Reply-To: <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 18:05:24 +0200
X-Gm-Features: Aa3M54q_Z-vb7dO5r0L6AcMqg8jjKTFPI9XHDJLIFJzWvQsLcNuaX0nGCAYJczI
Message-ID: <CAPVz0n2-0e6L57FZBwz_azNOq-1Bn6023vke-=KB3a+GmyPjCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 05:52:22PM +0200, Svyatoslav Ryhel wrote:
>
> > This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
> > strict to what he picks maybe you can pick this, LED and ADC[1] device
> > tree patches?
>
> Please send a coherent series that can actually be applied, it's too
> much work to pick random patches out of independent serieses.  In
> general you should try to avoid dependencies on in flight serieses, it
> makes everything much harder to manage.

Ok. This is how work with Lee and mfd usually looks like :(
