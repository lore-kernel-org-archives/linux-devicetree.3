Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D053093DB
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207028; cv=none; b=g8AUzQTG4VSqGJuKS9Ary/7Pfi2q/1gPyVVU01mRzvlNaH1l1uQDbEQTrsz1OCczbnq0kRC2ZS1E5LbpwkqzK7as1qRRfOkrHMv6qs/TDYv0TUBugq99NApjyY6BMAmGtO1LBicv7naZbyT/v4fonVAOqCwdzlYUWCJHfl755kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207028; c=relaxed/simple;
	bh=LzbdcnOypVgl8XAOqdjkt07np0ZsfX2Gis+Z8CybTVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4KSlSsPldP91LcQOwWZp4wkMlCVO4CAZ9ZHNNJctN4cMiV3K1bEG2KXTh6KI/4a2wqi/GEDtpQu3TWR1G3HmyLk8aLDUqjQrRBs2QKvqG6ev0R4pPYW2t5dVGwveLLKIeWo393w6t8B0aKS7vId5bWXjdgMnp7ABu74bmfPvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d36e7d8e6so1163167e0c.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207026; x=1775811826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4PkZ6R/mmLwRiMLG8oh7K/G1iaMQnAp/Sqdg+cClo8=;
        b=XSeoPFC9Hog+fs9/wdMZ2Vd7egUH/tWKEO5mgWFfpHWSOPfAbJ8OodKhBFrOmARWY2
         FSskSxDU6obvn5xpXuFtSCyL9f9WKcergjYJgDmHdfOp9NZdbEHiGFcPS9EDBnTjkeb4
         QutLEvUhSWL+hFkGOjKTf+suWr9xXZ22MYOaVRKxqSt/RcoZ88/LHwvjo4KPsgPw7fy8
         5D9coKmCHKelA+raNa/UL1RGEezVzEPSsUsXJSwoWySs1aXUbjJRTwRK9E57usVWsTPq
         PybUb4PzS2S7Vi5+WiDOyf4/p2R6ciHlZXNzuUHeEGsYDVueXZX2srN+CfGIhz2fdqyq
         Orpg==
X-Forwarded-Encrypted: i=1; AJvYcCWOHaaCIIozHaYhT08AZTpH81sn5WMFYr6jj9P4zC0rV2gquiF3HISQ3yf6dKeb6AAOqnTB9qK9kv1K@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6gNGByZlYEU6XleKYKFVDkoovV+b1H7sa/RMWraPuYzwfnYS
	RF8f7qSl9qjCeuGZp0tJW1aCqK2XN3sGtVfDnxaBmHZjq0dRwN4K9OPgbLTF3U6y
X-Gm-Gg: AeBDieu8oDCK4Q1YmP1/BrsykBUI2+009MXlyvPSRntRIjn5Ab10092Wx2KFLc5qBd6
	4rshMVLFYg7jMcEovcnvHGhlbyodeTZ+rEA2QJmRGYo9RJChSnVBL0yWbt6OATwZpRpWL2oyJei
	fesO9k/J7Yri+d+S1LuKEVHDIt1+YzhfzqsncN1DYMjtN/Z72hJ6OhUsZJYadbp+wppY5aFCQPv
	Av9AqiiwLdPO99ZGIkpzDBJewHBW3UuNsauofjbFWmUjQIBI+nkR1DelFZegpEK5bion5kGjiK7
	EedKM6rbnmAQmG0ci49EY+qNKTAJ4w225bEe/dnlOX+PCKhAJSCsDLV7gFCWmC6l8UjUoSEk27h
	JpgSxos3tv5YFHqd+cScRDGzaLqzO7smHm+xQbz5AdsKZIJlECExwcwG4Sg+x1VQPljsBzGnKHI
	9NesJZLtVv1Wt39drbcxRVKtxFPyCywWnCBKB87lSsLYD9Ujle835L5M7imtMr
X-Received: by 2002:a05:6122:d1e:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-56dab812ff1mr929380e0c.1.1775207025768;
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd03371sm6194260e0c.16.2026.04.03.02.03.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso957144241.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwA0w55+RqHd2fWZnx5q7rEmtuBwCOx3naRTmZt33gUGr4J1K0btcuAeqIRLgm46CSHd4jwY6zb7Ok@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5ff:fd17:d74e with SMTP id
 ada2fe7eead31-605a5172896mr777997137.34.1775207024732; Fri, 03 Apr 2026
 02:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
X-Gm-Features: AQROBzChiJZliz9l44U0EaEXy40FbPu9KG1qcLT4sL3xvqKa_3byt050paJddGg
Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
