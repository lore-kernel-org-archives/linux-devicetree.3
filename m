Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836F2F7EE5
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783273490; cv=none; b=Nkrmyr91SfKSrPBFsw6iCthDECUDeBauyFm0u//dgD85vX66WTtpmLKktVGv1GTr9yZYzllyXO5bnJWA5+lcNa5/0t36ZqHZkjcricrta3ylFt8BsHTgYPSkBBqzl8LV6dpAOUPUl3e+Ov6tV4sMrPi9EMa0pW+H2JAG6z2XKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783273490; c=relaxed/simple;
	bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E2HB6qcgpFcVAViRUFzfRaZKbKd+cpUAh6Apd53SWPbguwCH3glt5/WII3gufCSOIZ48nxNvhyv5iipxc0oa/9LoS1nEtgv9IcK+pC9InmyRsV6W/CmMB4Ve0eZUhCeGVgd6hd0CCQJp/aFBTbons/DJVy6dJoHUZka/+bOAoIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slwFc2mr; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slwFc2mr"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69ed219d3ecso1871669eaf.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783273488; x=1783878288; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=;
        b=slwFc2mraQimWr3Xrr/0ZmJO+qWFlB0qVw81NTW3q+E+D4tBWixszwVEvKttZy8u5G
         4A9974yg9hX478Ttb2pV7yLfwdy+nvL+KBsaU34MvJmSoSIncporato8PJBfW0nQHr5d
         OzfpBPia97BVMcAgL0b7rRGl13GFGb6aHw7aRs5UQoYCygu4w3xKl8/j0oKfN6q+mwhW
         yeoyLvw88qm+YhDQSUTMzJvl03AbO7ewJKaJrNf1hMpPZWukMTyHxtjVZUCP6dY5vPom
         23SMIVs612wriRr74JBPHjYF+7oLCb2l5pB49wvItchg25Et7rZDdzcUyM9V4rAIwmaA
         huZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273488; x=1783878288;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=;
        b=FQhpZZIUXeCnOZhs1rucmDjhzmL6Kp3iCJOeWQRuCZjPZ7teE63CJTpwTgNRBY8Lt7
         /pOj0JhcA0LVPL6pEv3t5YHgQF7y6IX/OeMTscQ5H+RFG6Xi7TQvHfasXP41eIpiv+1I
         vwQCCNROr2ta1RdOFXW552qBedDSJMvjz4UBvyhF9MU4y4ruaxlOswanXe6oNUhRMzND
         QkYvYKfzB3UVfT9IXhj87odbPZRXrp2CozhqQ+zvzC2hYoEVC0Gt6LRdtZenXJfaqycI
         Ge7ezevkiHHIUvGxZjO+zcnIyvJCfX+o3nA+F0GLVCWAg9bUXfNnsJRHtUIUpg4Rt7s8
         TZng==
X-Forwarded-Encrypted: i=1; AFNElJ+xXV1JgMillVMnTNmtwUo+2ae/kIzl2q68rdvPf/61fxnnF7ms3j+znnjhFGNd9b1iUruc3bUPRIeU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6MLCyUl5AQnnsgNII/o6G1GoRYIN78imIlLASJFECFQ+SDym
	/+b2OcyJKeGKsIswBR9gcp/feEfXUzBqr/P0zzVDI7lCYSlzNVerZUfA
X-Gm-Gg: AfdE7cmn+5JC/m8CPzjnw9Q/DFLQ7FgHwIIAn+030YmsXVOXBFzU3ZpUVjzjnjMGmUQ
	m0LsHfvXPrqxKzRbNQthFwER8chrSL9EA5lByk8P9fpdRkUR2TA+OdvDDBkiXfij6EhNc2kbiRF
	73TKbNfGcRkNzKaaBQLeJG4jqDOU6FP3Y8cDRQOR2LK+2uHls7C2B4D7B30ZuL8v23IIdapZx1n
	ZkaFd6zB7PyUgRHNjk9pA5QYy0/QubcfYly7Fid+i1thyHSj8ufSVzizfxJicekY7X9704HoAPv
	GHWww4ZuRO6Vp6zkvfE7dse6A9EchNvKitmd1ZQ2qUT6C3JUsJ+rdOgfj9Y/EsETghxtCTIStcJ
	bEacjstLVsjKSQjauox57jKyecsILAGNvSGq7HZJvpDsW/eqH8Uo01/a62JgoWpdWAbHjWtQUd+
	f2qhJY5p9kg/Psbdut05pUb7R0cIG4j7Q42YW40Ag=
X-Received: by 2002:a05:6820:16a7:b0:6a1:99fd:5a00 with SMTP id 006d021491bc7-6a32f4dd926mr4682006eaf.27.1783273488142;
        Sun, 05 Jul 2026 10:44:48 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1bb17fsm7877267fac.5.2026.07.05.10.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 12:44:46 -0500
Message-Id: <DJQTOY88KR1E.1U2393N7KUH12@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Michal Simek"
 <michal.simek@amd.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Mikhail Lukianchikov" <avermoal@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
 <20260705165620.9818-1-avermoal@gmail.com>
In-Reply-To: <20260705165620.9818-1-avermoal@gmail.com>

On Sun Jul 5, 2026 at 11:56 AM CDT
Mikhail Lukianchikov <avermoal@gmail.com> wrote:

>>> Convert the Xilinx XADC binding documentation from .txt to YAML format.
>>> This conversion is part of the ongoing effort to migrate all DT binding=
s
>>> to a machine-verifiable schema.
>>
>>Sorry, but what effort exactly? Where is this effort documented? Do you
>>have a mentor if this is some sort of mentorship effort?
>>
>>And if this is ongoing effort then don't duplicate:
>>https://lore.kernel.org/all/?q=3Ddfn%3Axilinx-xadc.txt
>
> Hello Krzyszof,
>
> Thank you for feedback.
>
> I'm the newbie at Linux kernel developers community,
> and sorry for my mistakes in sending commits.
>

No worries, we've all done it at some point. If you're looking for stuff
to do then the todo in drivers/iio/ was just recently updated. There are
still a handful of drivers also in iio that still need conversions to
guard()().

>
> I'll answer your questions.
> I am not part of any official mentorship program,
> I just decided to try to contribute to the development of the Linux kerne=
l.
> Yes, it's a ongoing effort, and to be honest, this effort is the general
> community initiative to convert all DT bindings from .txt to .yaml. I did=
n't know that work
> on this file was already underway.
>
> Tell me, should I continue working in this case?
>

After looking at the link Krzysztof sent you it looks like it's already
being done, so I'd recommend dropping this one.

--=20
best regards,
max
