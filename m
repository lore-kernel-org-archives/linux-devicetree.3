Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EC63D9689
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365129; cv=none; b=gXWLb/cqtSNgGIoTNVBvcbCOoKAIneCuGbnwZ8ftXZg2cropsp2oFQUz5rRhs6AswYy/36VGWqycroFIXwlFAl+hF4amUrAUM1Tz80mDCG6knrfU5Uj9jTAj1CNfvxpZ6nrVcXx/IzjmmZBc8XdBi3L80tKeer5s8EXahZFxwfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365129; c=relaxed/simple;
	bh=lThMu1u+hE8LbmETZNNwkcOM2Ulkxrm5HMou1DVHji0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAaqmSsKRjjhyVJ4iVVmvCQbjqtY54ok220bXuHE/rr3xgnwxHY+ffubH0mFy784tUE23ONg6RrQjij2pw9GBpMciORDd1xT6T3Wf2Y5ADL8BoVHqLeCPE6rOgZJC1m4KKhb1Pgkql5QHxiDqva6orCb/sEqDwRa+OgYftP1jQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9696319e14dso638612241.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365127; x=1786969927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3yNCiQ2xZIUlAriiD3kuROtqejdF4LbO3lrN5CP0pM=;
        b=IqDn2IweASWwIg9I6OhqUKrLSs0tq1c28wtUqlFwLaMdnmDh2rClC0PKENUSz9z/IC
         FYeJ4prTlRBjqW9MJzrljkivG2/+h8FUJp0s01wC3hYGrDnRCM2IUGA7Nuym2sLAeRDA
         37V5MohhwvJVydtOQuRUAxcUBVAUqTp7Pl451N1Qp7NJgWOAq5hOXlcBOJH2LV6rC0gb
         IvsGNq/fwqKmy1810LyOCtKP1f1WAMezCxDQlLyvxTqaxQRuy+6f8W5RNSCCkZ4+emZ1
         J4diHVd8SPMNCPA/S3K8gwEUmbxploixmUJzmc+BhqzKjQdVYUjxW3CJc6WJU4ttqnjj
         RVSA==
X-Forwarded-Encrypted: i=1; AHgh+RoKaBHUt6sC8yps3hPZdpCUO3QbF6RkrfzbAscCHyXiSjWtRwgXsLhIm8u2AqR4Fjalh41G1Gsr+CHx@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7Li/c3y7a3Q+DxUDpyfwyAnx8pVtjP9hbZehSsL1VmarxjVC
	dKILLBeqQHQaZYhBMhvgAMykNpImTNl1pJg83gyrmAI44zy0EmvCEIduCSKMKFvn
X-Gm-Gg: AR+sD12ytibfoNNxq6ANgnyREdaYQGizBPRfTwUDs8fjdNdRe/etdnZ80GbTOzWKy4/
	qO0q+apEZtdpdJ8gZXaPzWnXJ60o+oZCa4TxeLT+mvPy7BL9gwUTthjpxWQ1aOBDDK4WQ+e84K5
	uGqA7JhvM047CjSb9ikmgTG/Hw71hOTenYRMjpwUAKTtxF2RkT/l5oiWii7FQXfUHLxhlEx1ZYX
	rlgl49Penxtl/aUCoHJvtEnFwVJaE9z/YOa9LUnPA2ffAQGm644CcMQHleODYsi8ujwosMY5FDT
	pCEuANT+4SWO53IiJ4N+fpIWWMnUyCxFuy3eQxbCC6ync52d2RrCumNSKjui6Kzz3w9GNm0DQ8b
	W6S/0th6QN4W8O+i5pTBFHfDXIcJMTjTiK2hOPO7LmFAlJqVNjbaPh9+DNoyScx31Ws/qqWTUqp
	h8UKUJms35YtyPKPlTT0IACaRUGl11q2FR3hagBJ0aN74NsQ43Q/jvGD9bQ3bdiRcRpBvuRChPo
	kNalHMrQT3Jq2nSIz5tdGcBj9iRtyj107xmZw==
X-Received: by 2002:a05:6102:5691:b0:738:bce9:6afc with SMTP id ada2fe7eead31-760e3194f65mr9564238137.0.1786365126951;
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76400dfdfe1sm4280252137.7.2026.08.10.05.32.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7389cff36bdso187272137.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKUYaRZhWJLgsrE9ya/po2ugNvrpk/nNrBaJBIUhzpz8QiGgFqFbheQVKeLOmer7I1Dvupkyjc1f64@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:747:4d96:dbb5 with SMTP id
 ada2fe7eead31-760e8b29c2amr8941171137.12.1786365126138; Mon, 10 Aug 2026
 05:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 14:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
X-Gm-Features: AUfX_my8_Kr3bd6yUN_SBO3fPdh69-mPfxOjVFEEVS03N_MOz4fZs0mAtI_-CGI
Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge
 connector I2C busses
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jul 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
> board may be controlled from userspace using matching userspace tooling
> that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
> and I2C4 to allow userspace applications to use those busses and access
> peripherals attached to those busses.
>
> Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
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
