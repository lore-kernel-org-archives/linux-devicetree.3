Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697C563FA3
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967341; cv=none; b=EYjoJsO2hwjCoi+H+ODaxDPRz08csSrB7wfLhaEWdBzfaWQ4tSNxeMcpc8H6d/3NIXvkWnCO+Loc8MPFTg2tEbf7SAw5MesQSM5M4+2CdpjhccIJnzio5MCc1sDL67w/Yw4u8R7EEh6ZEx0vbtpYcNPqX+4HnBWXRDfK/oZLx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967341; c=relaxed/simple;
	bh=JkYg2JhCpEtdX7qwSdwLwF/pqEf7ipMDvkeyNYPYWiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrBxOr50uoXgZKRScYA6pxw65LFdHMdN90+juR56T+VN/Y6xTbQHXRmGoSlPuCrmVxwhOvm+rCmbfK0GVnQvH5rwY1BJrz0HLMjQGRZDNK3kHxV0mIqKSJxCQg/i045rqmcQKk1vCJu8ub1X40MplYSTuUNP0gX45uvYmLsXupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966e7380109so4442255241.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967339; x=1789572139;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvH1LN5nROju0SUpXayMHEhowOFfOFw00A7tsFfYyCc=;
        b=OhYfL63/uh052MDKfHMju9eGQ/ZfclcBN9hmxhNns5GjPKa6QY9xs28mrqED3cf6l0
         c/ngLV1icSwSUgfWN7M4XnN4fr3efjASbnrTxInL4sNokUVO5rGAAN222PvVD1n6qCQ3
         ScvBy/f9YOrduMY17+kqYXOFQb4UANbEo78b/JZlnbMNRJC5mU4fhwjjikrjJvrp34sg
         X45LpPGABdBnNk4r9Xsxbk6oM/GvR6TottM8OBMcaHTiz3mLNpTRzAxA7B3uFLnOhMFO
         24US2SEwFC1mp/N9JtZrToCtTyIWzuGuXE2DT6r8qar7/04c8w9R7Sv8FIxE56Vmfh3l
         s1gg==
X-Forwarded-Encrypted: i=1; AKwUvByoKF3zQe++3mabuJhlgTpl/z6KhXhFNpz46mdsNs6atJTE96wBPdZEu663IhKySqiHjt3uxwRztNS7@vger.kernel.org
X-Gm-Message-State: AFuF++mr9ZhlSipEb4Whf877X8QjHAr56/LyhLGnpvZM4xjtW8IQj48S
	CjDlw28xXo6wx8y9gPtdiBnG+cQ2X4UYuhSIs4QNuXHSNDQnqqnGRKo9ZCI7PPUqcRA=
X-Gm-Gg: AYBFou1J4tWoDDmY6OWyIS9weXFfmew/Uvl6W822RUwwWKJeLh+nazT6P9nAE9AKdcd
	LxD5NiGHrS/Y+fiaUcOxnto8ZgFq+awOzObhtxBg4NcL3HsxaZ4Rofv+179hrQqB8CHGmrZTLMD
	J5sKypKE+jWl+zHwFgXfsZ6V5nkpIC3RjX0GFW4+ksrmrdu2p+OlPwBayVpnLiePUsiHgSS6smp
	cf84QUw9gpDpeRKPq1xHcNfd4Sru+F/liRo066uyK0qPRVvU1DShE8VqkpP2K63ePH+2w0VmQpy
	GbJb5FdHr8ShQBp9o7ENHNiYiDeKA556BkRMJZqsL0+2vCjVNsBu3CzZjCj/OIwtmWHSzVAGcbt
	q+xMR/UMdJaQxYdOGgFNaZrl6+Ol1D9Eqe+pnieWTeojVhsToff47of+6H0UMSdx/fbzcknCPvs
	QpiCh/9HdiENXdKy31+KVLLW+o0i7elmqTPOeRyHQ61IK+f1fJOt/F3XEYJEozcSIM90WUaOTba
	qHnR4HFIU9ddMmKUc2ggminGLj3s+nwXskyvCCwJVqXRJE=
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id 71dfb90a1353d-5c7ed2f89e5mr22804542e0c.0.1788967338801;
        Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec386599sm12392454e0c.14.2026.09.09.08.22.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966e7380109so4442217241.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbiASRPClcPKAbU8lA5Enor5vKJ6YtLoyIS3vXEpDaSE/N/oSoYz6C0OWf4T+7GOfAWEp9VgFnQwWt@vger.kernel.org
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id
 71dfb90a1353d-5c7ed2f89e5mr22804170e0c.0.1788967336434; Wed, 09 Sep 2026
 08:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
X-Gm-Features: AcwNN1WgFr7t4mTZJlE0GkQEVjTvX4ia6Ekcpvx97Yyry4KwbnrUZ-lG4127I-8
Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node
 name with label
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 17:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Align MSIOF1 PFC node name with label to improve consistency.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
