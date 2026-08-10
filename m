Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B83BD63B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372745; cv=none; b=WVy5v0Xh7PvbquMNQje3BEh3RRa6P1XtAFt6iqpIpUOsc8vc7cAgYMU+a6SVSSyhjmsLfuoU/qf5+YLat92VCnbY5wMP5RgwyCvyRS8V4kWtKYyxJTiB+pkfyYK6VvAKrJhjou/+i7s8AyKpIEoATY+UnPwlcNKGaHSSDVg2UkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372745; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCLZN4d6q1o4O/1/SFsDTWvvoNd1KkfGw20EDW48NueywKOSaw8lAix5eVkPK7ZnS9FW+3LXM2bGN1sxrburII2Kkik1xG1VdGFk3gMraTqjSZ/EDf5r6nTRcENSnbtaAkn1NGWsPBTEtxyG18TAVMyGubNgejFFub6HZXvWxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1454617e0c.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372743; x=1786977543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=ca67FJe8nGewLt9EvN6KsbHhlhFxFLtuVz5f5QrU+7Xvj6YxRsH7ZUeRC1y4KEEiZJ
         Wuc6HNQI0ZMsA681cKhms64Ugp1eDHCPwdEB/PEvQQdMi33RhRdoHX+g4YOAjbyxeJLt
         /ADgB21lDLM2W/hAt9pgmKYTbKPdd32Vmxbx6NZInzf1/KtPrRGw7LEEp474Y1rXlxdV
         PqIhkt+6WyBvXcAh3zJvHJoJXOP80/ozMDASlniB5n9u5CfCQLxN42Kj4VMBQ1uR0pXP
         wSRCqLqq5Bs2QJ0/d4H4iLMI4NnkKzaLfWEvHM2spAQKH+Dymccp75ezjpJ5vkijyu2P
         Mn3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpumvoMwTKyPtMspuks1aPmEi5OivteCPPE4k/QoAwvLPJpIwbGFJvWkHx0VCG2J0HG5UXnZ4f4wBSd@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyFn2c897oQFD/XvEn8YBkVVx8oOnygO7M7r7+vD9Ec08rfsK
	iG3eZ4CDLNVZRdbkVl6hARgYO8lDyChmYaLD+mz86Nf8AVOgihNr4rrKts8zV4sJ
X-Gm-Gg: AR+sD10qXKJJRcFJhO+Zgsz5Rh9hhuK7AObbBBA5NH26iF/4DOPtRSBsB7AT11ZzYYB
	cu1bCtM0QHzo8zKZI1NHsf4O/rTGdcL+ZWjuEHGqDJNOENpkoK7roClUdmMpMOb0ltpkL7UJPwB
	ZnphD+wUx5CIjmb2TzwlSBjYSB376xTCD8vKtoFAw3qWFLLS1nb5Q+k01IR0yT2tXnsrKVa4g5z
	HowginAQ2CtQjJmUTueoaECAzEU1X3mykmPARNBK8roLbOxQ/WPyexH8g8A1JveMCKAqNqPeJNn
	RUTxbBKqzHsjEqJZMFyIiecPOVBk1w2IQh390M52AxfjSaiKAr+myuQDFZuU555cjtawRXcOeJs
	dyfw9jsWraWgvY4bnAUVubDNex0qxZmUwrE0v2Yv3PeP170ykTnj/bjLddL8GfJ5z/S13bQSq+8
	CC1DBB/NGv9bp/ECQAdJdNeWdWJUXq9qj+0skG8o+uzI4P8o3z7KFE0934oSAxroJ3lyF8Bz8c4
	N8tR3fau3+RsKoe1xMsVPNRzSEISjhWVa52uG3c
X-Received: by 2002:a05:6102:801b:b0:744:dd70:a364 with SMTP id ada2fe7eead31-7634d10f5c8mr9103134137.9.1786372743043;
        Mon, 10 Aug 2026 07:39:03 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc6besm4641031137.5.2026.08.10.07.39.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c4105393feso1162271e0c.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+HZFJ7dPtYU2h45v37h/F/ekRqrEAp/ajTGbffTFQbul0pXrcZVJNayfbFD7iTp8zFpTEn1M4h26J@vger.kernel.org
X-Received: by 2002:a05:6102:2c88:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-7634b995627mr8426129137.7.1786372741848; Mon, 10 Aug 2026
 07:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
X-Gm-Features: AUfX_myvevmtR5joPePEVta7aMlmbyqquBFhSTNi5eja1FOfxEmgcMn8mxhnvEs
Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
