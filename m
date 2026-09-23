Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877C47AF4D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157532; cv=none; b=L1dRYAirQZ9P/ryTEWFtK7xDAwiuhORXsfjGt8hFb8+9f3NRiE6ufgU+NGAThcPkx68adIpRRGz6+MYCQAx7Y2sjMioyQqx5YQgzELuTbveN8rS2ySZ/8YDLOGAfjVb70/+U5rDi4yUHK6vAAKnGdvDgIEfxo8SgTA5lQ2JikhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157532; c=relaxed/simple;
	bh=cgQKrK3Rqkd2bXNMJtchWvRqmw6rrHftcmd6IPygYd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXUcpF8eAgKh/POq/JMI1y7nqISawV26g4N8VVceLL5Nf2TOcEVpiUtZ34rLHIVqMToCvsfvKYP98Hwkq67YiF8P85LRwAC6QTbvJr8xXfhCvVugUf4j1zGG07r1uOURMIX+nkH2BIfb7Fy9PHj3hjC5vw+N0/DG+fiQUXY4iw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so364527241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157530; x=1790762330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOsjR1C8KRldJmAM/WaBd8dcZ8oAMqD1v2iQK87wQ/8=;
        b=QHbxfuSgBXDmeOkimC5REMiVOtiPDNDMQjubrTlP06ABFwWEfH7hFV1oG5M2fhhP1M
         vtJBDnBnZHvV9Iy3zZz/lOuAXULgOPQ9QEg8ByAtcFT1mKaowRiDRgMVkKeAan3+giX/
         D0VHPHf1KngSMe3ntsMvuxuFKHiy0L/kQWZSoUMrtRUdtERvELUyJZWkVDn86QkisjBp
         WY7NEZC0oew5dXI1SLoZnFUjxFLfg5ydRoW0BBKNx/yMPWONxyD6Z9s/vhXp6jdW5xzf
         0q1KmzBnHHeqB6Y4QOMjeDwVpzCqzxk9BUiWVvWuTKVFz1cS0B/lYyKOBLjNti70cVZL
         dmkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvabuzP2ig5Ts3xPyN8JGW0dd8y8i/Go5T/UgJFBmSiTcjCd7Ep6KEWhwttHjExk15fMbh+ZHMzNW8@vger.kernel.org
X-Gm-Message-State: AFuF++nw2NC8mpPpAv8npZn39Jr/dXakpWYAjQhYmXXgj9bTrZVO0LWH
	F5Y46Julr6KBxEAvxEUMNtPzBnbAa5U+qAuEirGICepM+O8b+5vBZvz+9+cv4ZU8pVA=
X-Gm-Gg: AYBFou0Y2uxglh1zrbODDzFCcir0applSKtrIz3llDYqt1YbxUirvcnus+pCZmGR54j
	Oi8AwfQb/cP/uzounXidg9axy6HlzyM4+4C2ubb/e3/1TKGXbMOej3chNrdIfgggqMhO9HiXqlK
	xjUy6UJpylLViq05mjQCzVlQGC6eBB/vGismDUPIP75vOoHbtfFCko6ZUzlIWLpn91HHTeFwQHM
	wVburXgBWp1BqnFJmzqAIfEWvUNFQU/ruT5zehvxKK1bcdq+2jOtt0mf0CIh0ZBkC7jdtkq7ubh
	/mcOizZqhlWgY19+lX2Hy+D/ID95WPl7FUZ4/If0w9+EtFL5EJVTiUDQgyIRDzZHiGIpqgyA4ln
	CijPH2Qa2nqdrZA0Se8YIM5B7JexMI8FQZfjS2TsIoIbaksB2kiDHb3fLBwob7U97JxN4Ch9toS
	LxgXAz7Y/dVotmXKfh5Hege713rdDaLRVjSXwUcdTLGsBfydORIuLhZzkJKoif/S9hNrSRXZLo4
	uya1hqYkeHMAMMf6iK2EYTotWbIx+dgtwRQ
X-Received: by 2002:a05:6102:5107:b0:7a7:198b:6747 with SMTP id ada2fe7eead31-7ac1da2b2d5mr2040851137.28.1790157530038;
        Wed, 23 Sep 2026 02:58:50 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851691693asm2921258241.2.2026.09.23.02.58.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7dcso319463137.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHeZu6p+PeyAFzzJO59FmGl8/auUV8Ao47wMhlBTx6qd+pGJsJtWpSjGS6EMeRJvVNRQnaizeHv5JB@vger.kernel.org
X-Received: by 2002:a05:6102:5493:b0:7a6:d3f5:3551 with SMTP id
 ada2fe7eead31-7ac1ba3aa41mr1865740137.14.1790157529595; Wed, 23 Sep 2026
 02:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
X-Gm-Features: AclHuK-ZLnADC_yQSZhQ6KyATq7TTVujDV7zLDX1BCp0BDcquLjKrWDdI_wG4Oc
Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for your patch!

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1, place the nodes in address order, and sort
>  the interrupt properties. - Linus Walleij]
>
> Assisted-by: LLM

Dear LLM: Please take into account the review comments on the original
submission:
https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
