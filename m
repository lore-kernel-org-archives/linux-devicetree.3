Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5FF44C660
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578081; cv=pass; b=l/n4KBe0zef87SP+yEOude2jGHiE8VJkIQz6OXiooXLT+6wuvL8jL2Tm/uGRYRDY06oI79xBsla5QlcoZFArT0bhE1+KngIqA2R3MbWNqTm/nXq2dfvO/iIdsVK6n9StlD+pa29yDHx/ZRfc+XlA+Rmt3h0nX6FrIOl+xXof/JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578081; c=relaxed/simple;
	bh=Eoh53J4E2pxYdCKQgHv2CnHOlx/HRF/85mL2UYWNhjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK/KFLPlJtu/KVoa6HGJOoalbzw6I7fDPs06x2jAKpax/QZs0SB1IIhAyt+welB7on5mxSY46Uka0IlfF3J8f0F+DrRUTiZA4KXk/i5t6d+7Qgo6y2VoqQV6/p44hKJ36OH7DqYME/qQpCesj3P/QzEO1ar76Zfi09M7hHOYk7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjNg6qEv; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjNg6qEv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso6580e87.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790578078; cv=none;
        d=google.com; s=arc-20260327;
        b=dDWGzvepiZFViE0JfBY+nDO6WQ7EdwxFxaUTnMT5apnJg7tjTWWY/xnFoQNyqAAW2W
         UG3Marxf7HRHwyXilpn9Cc1RSO3iaT67M9Ntcqd0W+AXISurT+ioUgNlCFttvdnUXr2H
         dNmq4tdimJ0C2k5JN17mrzfVqWobSImAig8BTuK2DgSEXVU452L4P3whlDd0s+Qv8W1Y
         mhU8Xj4xn8nqSLOP3BTEhLDxe3aEJ68ZWfCd/7KC8ZD71OhCr/udUhqIsvo2S8hrYVyD
         18EmBFBD9Fgq9DrJNVyU+bdY9XfzEBalohFak9zCjxG9Mfl9x+l8v61mZ2ttjgXn1cQ1
         j+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        fh=nCZmn0xh6H0fz3Gf6GGjeXcmChKOyxKeljzr+l37e4I=;
        b=JUSDn8KFteEohHm3ol5LyzB1594YzECjqTacJzclw7ZscHjbslJRmK6dt6AI30emVU
         mmycIJxnkvOVbDPWtNoHDPn7WoGqvXEAFSG6VVzMg+mSvf5FuEaxuRiK5RPkTWWn6jnI
         ERPfZfGi2+pGYO3h6T6pGw04txSjLcSZYOriRgNB9QC8/9jxwVV5g9NOIlckcEUjeFIF
         YuAujgSPO5K5ymTj7M4PLuGpapssJsdlA6Px+KVv5G2JzNWXPusI6NIDTBUW56eUcNKY
         WDsizhGRq3CkBUR2a7/SVVmnHhKWbxUjvF74KhlI87AAUAiGllchF88rNprQO4WD6lc1
         KaFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790578078; x=1791182878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        b=bjNg6qEvthaPq56eY0zkjQujLCNNyhx37OiAkgd8xVmQJjwCyHX6PJ9BH6UP0U6O12
         TTOA8HFUO0U462uZwQjLP67Ij1Tuv08YdbAyF4G7jxdTPNeAT8xMfThDYWNVffAw/9Mh
         i7u0JqAeIDjD2BjUsE65QL2Pwo8AqxLikat3Fk7RnIqZFEZfTsCYUDrbsDKfA4DGwRD0
         ZmX2ZSU9CPnuJfadzVrP0qfo7HXw6o9aHvaMY3Hw+CYcEdHuGVc0dO/CWs+BnNwpHO4h
         iyErc1VAP5+XxNXXD4FHCX4t+K1G0jhULyBbqywtDJA1sPl4upH1UY5rKpY32O8d/8ns
         OrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578078; x=1791182878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        b=Gs0oV7G7Dt93FMk3y2GxvwO5PwrKAmRQbJImypbELKJtEJ1D9Xx1t4GHCPe8TvTals
         kaBmPjh7Ct0ySD/EHyKR2N4wBxWwT1sQbfZt0tSF6RoqtintvPjHaeV7h14sma2Ynu4V
         UPZ2lvB7SO96y5h+YXV7ZHqsyAApDxbLnyTC0NmZqlXQ39Q/zX/iUTsAlGBuBATBQjIP
         QHLXSgUFMNtV4YEz1BIP+Fbtitw77bViCuYjBqLIGWEkH/ZmPpt0Q+yL1kqzRxfREs5A
         j3CDBvjz+ejA4eKTwot2Ai5+4+lCN1ym76Y0WWqLWcNxuDabkXQg7algXRg3yImRoZae
         pf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBybcK7qtkfuipi/lLATgMJP3A/XWAK/2JFvpmaNOtJv5xPtseK6bgzkNL1OBP3iUJ55+TbEmsyYmcar@vger.kernel.org
X-Gm-Message-State: AFq9FYJur3Unjcroy9fk1jJYCMra+Vh3p16HZ2AswAriHA+weJjpaTrT
	aNPhJKOGpXypwtNzLaoqpVXhzYQaLtyNbjJlKoMjLoLgZ/Kx8DByS1vBuFoNdG450XFC3ue1vVF
	vE3hBIsqQ7YMSfVrCpo/ivu/k5HWIfIaRtTun8hgs
X-Gm-Gg: AYBFou2Q6bC8QxjzI0NYkomHQkAAFyhjEscCgZMtJCsSIYRXXGItJlb6+3CQLgedC1x
	a3sBH/vdJV10kuvnOWUuW84G4Meu27Ce6XIsfyNhihvvkylXekPJFT0tv4pT6s9eQ9PUw2KIpZy
	L0CG0Srbyt0oLKD1VEeLFtW/hjblTXokOMVh4wUaJOuHL8V4fye7/Pebr+jjFMGvqopyICb89/t
	Lz+9jqKa5wbShI9m+X13RFIH/2YdNwjx+irL73rKqOHDjYCWYdXkkoZXKF7hEU2Ks/+LL5V7FOI
	0idaxeoNtrFWd3JaVdmCbp6yTJAIQxJT0/Gbaf3Ic6sfst5jyA+lVewlupMgkvq38skYMiE1j2y
	mJqL5+GNG106G
X-Received: by 2002:a05:6512:220c:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8ef277c63mr143069e87.8.1790578077022; Sun, 27 Sep 2026
 23:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
In-Reply-To: <20260907112944.313618-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:47:20 +0100
X-Gm-Features: AclHuK91QbBNcvBWx7myc6pcingVvXraYotkCaAy_hj6gs7ZUrok019AkyOIvbI
Message-ID: <CA+EHjTxV5G=2Ffjh6qbUqet4rtfK644vpN_Yp_c3y_GOtUpTNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] of/irq: msi-parent handling in of_msi_xlate()
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob, Saravana,

On Mon, 7 Sept 2026 at 12:29, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Changes since v1 [1]:
>   - Added patch 2: end the walk at the first node that declares an
>     msi-parent, with the reference handling moved into of_msi_xlate().
>     (Lorenzo)
>   - Patch 1 is unchanged.

Gentle ping on this one. Patch 2 is the msi-parent walk change Lorenzo
suggested on v1. Anything else needed for it to go in?

Cheers,
/fuad

>
> Patch 1 is the v1 fix: of_check_msi_parent() hands back a node reference
> even when the caller passed one in as a filter, which of_msi_xlate()
> documents as receiving none. Patch 2 is what Lorenzo asked for [2]: a
> node declaring an msi-parent names the MSI controller for what sits
> below it, so the walk ends there rather than carrying on to an
> ancestor's msi-map.
>
> Patch 2 removes the line patch 1 adds, along with the rest of the
> reference handling. They stay separate because patch 1 is a small fix
> for a leak that has been there since v6.18, and patch 2 changes
> behaviour: folding them would hide the fix inside the change.
>
> Based on Linux 7.3-rc1 (cee9395acd804).
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20260904073424.3855365-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/apqnaNmeuUjfC8Ng@red-moon/
>
> Fuad Tabba (2):
>   of/irq: Fix device node refcount leak in of_check_msi_parent()
>   of/irq: Stop the MSI walk at the first msi-parent
>
>  drivers/of/irq.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> --
> 2.39.5
>
