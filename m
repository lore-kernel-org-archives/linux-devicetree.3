Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740033CBE6B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456804; cv=none; b=ixNpwfwxI2khhoUCI4uKWHWSi+ogyzQ+KYzXPGxnBHXsvumo34jOkbZYwubrAkcePoCDwjSxEn4gXJGcgEhljA/CS2sBNTFPKyP3g5knL8dHUXcfLLEBBCwapU9J5ZQ6FCSxmMu9WDrYxMaxcuAYNn0LI8bnw/xP3LHtCXGSSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456804; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKbrt1UHkXHLWZc4UQnoZLkUec4d/YAo6A6lGcsshf0eVPl2wwQ+8uItyG3M3UeT41eqGIu3o7XDnrk2nbXinjzw/Y8z93hWEdEiY6e16bmDYVH7mUD2NNUEVyq9E1kj4FNAHHUrDXWTwlFH5DY96wXp0sWojNB2iZr4ZaX+DhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63319183a49so2720575137.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456802; x=1780061602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=C6Tg2IDGdDiL3NxFsvy525+gTE8TQTjpF97HMf1EIyLy4DnsUEdn1LH0+Xa6kmVYAa
         aNO1xz8zaQFYKsGBgaNUc8epnEDw0BbM5/JE0vIOk6yOz5/loauNek6tFwFQsPqLpBMe
         rH17cy/wxGBE4ytIYsHuBcVMUggnpJHNNAjjbfHojigdHinMVKPpfPh9+HfrUReyHYlb
         xf1fcmzXhB+opqesaCmIFB+20iD9ffTcNf1lZCY80gq523GgcVjMQBZZWzzaDE0hyRjh
         4DUAxxpH/a6aCS5Zw0nLHq+a2CsMASE043hVI3T+VktoO8MYD9WhMDNJkaO7wUhQX/Ws
         Ov1w==
X-Forwarded-Encrypted: i=1; AFNElJ++Ygnwnq9aTQZDjllk/1XcfMoZgpVudbnCU30CbkSPhAjQ3HMid7uv2sJcP78ncWmRLVvYYZt3bRww@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dwZtbWzgJXLda6hCLSevCDUbOsoedzHMOaSa5Sv45NR36Vxk
	Rqy9ds0gJWfchTuoURDVtSu8VGeGGX20zTalZWMgoK2dpJsLde0MkrdS4a4yoAEuiro=
X-Gm-Gg: Acq92OGwxr5Q0iz2S34uej+HLIutFmH6tm8HBU0r4G939utA4jbH/7t8S6T8Otm+ERz
	wAVjNu+m7S4bDu/D6idEDadWcROBGIXOnVMxt/nJ2DxFfa1iPPk7EYU3qWnsMEv3cPKiIYinbeU
	Dx5JSDMR1Sz2OM4q6EVusO2VIHO8lV8ljgLUVr8bxSrW7dpsb1/6GgQklROyQPG10f/GNVRl62h
	FNW+q4V5Dee8t11dmtCZUtZz3nhgPHS9JNib1SiJ44MD4ogqHxKN1uWiypqrM5wNMYvAb4jsslo
	6nXcr5TeILAO6szUdN6ouG/pBSUbu86mXX6jRAmAzsZHm071Oj2zIeZRQQt2t2aUi85rC/XfL3i
	mAFvEc151yeSMs+p36of7wfEDsaeunrCIcndcRmRjocRXr1HQNAdZnGRD91+UjSAHraPvkIb+zQ
	BFux0fvTH0hzzjO1nTg2J0tnEZZqOy3UtHKbIVRO+sC4q33oqX/0RZttkPymOldoSXIVA0G7M=
X-Received: by 2002:a05:6102:5241:b0:634:92c:bdce with SMTP id ada2fe7eead31-67c7300cf26mr1607258137.12.1779456802364;
        Fri, 22 May 2026 06:33:22 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f0820csm1320357137.11.2026.05.22.06.33.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:18 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-956948531a1so1952220241.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8rzzE9p/KIxVmTMo6BEWLThIlwXZkbJw6fNokpHPNyBXReU5HU/mOyG/k/OObtg75QjzH2s/L6QZQR@vger.kernel.org
X-Received: by 2002:a05:6122:a5d1:10b0:586:f3ee:2150 with SMTP id
 71dfb90a1353d-586f3ee2352mr748808e0c.13.1779456797851; Fri, 22 May 2026
 06:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
X-Gm-Features: AVHnY4LG46fEPe2Suv0Wt0njTP4x5GX3t7XRY9QQB9dVjdHehcMT_3MRaFGgxVs
Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
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
