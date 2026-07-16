Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6FF273D8D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178070; cv=pass; b=EJ4ROnzMfhTyD37jgEL0nsNjfRQB3Qhoh/NSvUlJHkG+fooKbKhWUVDqSfzlbdCoY2WifAKg4vjhXrvI5V7SAi4VmQtcUpax9WpatIxWpIwYMeAHO//ctrb9yefLT0PkdFEopZQiOS6xBimtNU/7l0f0D32rotLm1sheaGN9aNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178070; c=relaxed/simple;
	bh=IHDO4pfQ1RwtqxE6jXQnDmb8Q83xXvkBKahrI0yFd0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugE84ektg+ZjgU0K2R0ohxis7vENnZzPnWyxUl/vrcVDAtOyoUGo7puyK+p0eBdblxHQJx08tdbiy++cg+4RJpgHBHe6Xrwvc6M3v+yosIVfz/SItSRcHz//ccPC/2S7+o9FthaHnhBJiEGykoBih9MgqXn500Xx7aLGGa+pDdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ig1WsEgx; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ig1WsEgx"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66807ba2f0fso2830215d50.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784178069; cv=none;
        d=google.com; s=arc-20260327;
        b=MwGRCa3LCI5Icj1NzayvP308uwnYUC4DtP9dKCguYr9p+G7jPESRxO2bQpI2CsIDMy
         LNz8o7dIuALwc7miR6rfhOzaYkIvn9kjm/uTGJfMiEQI7igO25hrLYhcEfmKakiX46K3
         7jBruwYFztBaRBg20LRXM0fjjE2idggmiRZZwmPYB8vdxX9PtPZhjl8qPcMVYcIt9Jim
         Swg/J1pLFUjZqhQcEcbvxz4yb9hK4wEc6N/B6b1utXkqLgD9/GImA9iNaUqDnNjAosJr
         Jc8UBJiLHgICfkVbegOWVNQ+wEfvnIjcO5CkeS18/8dVrgX19l188mLRlMeZVncNAUI+
         Wqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        fh=kgUYGj7kl2S0wuOPJuUG25Yzn/6Fjl8v8tI2Yr8h8mI=;
        b=QEglqSeJdbzJvjq/Wed3DDnz+Fq6Tem6V2uoXGN8LQFvqK4vb/G3ZP+cq47m05Jm5S
         gasZizjPUGSvqv6K+oxR+FcTymZSlnaO9FZRHpAdjeqPKhXSgetZgX5xyFT05+0c4P6a
         /bPobvWJ44sQasOoOb04hw96X95NxX36UptMHg1yycqB1wujQKJrHKqFhd2e0n35zXHn
         /+g4MNC2s9etrhmkm1mC/vpR8QrF3taKtpGvNK8+OlOeUYWZJaTtBSKPL8aRhipodLh4
         CeN4C4tnMna3Qz9R91B02vzC0dH8cMUY8jQBASRJVifvuJBSDhXIkFsXQZ3y8NGRSK3b
         5D3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784178069; x=1784782869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=ig1WsEgxHaehpeIAcyNLPqvWpgaXlJbvLW+5rH3SFpz+19UEW53TdeemIN0JXFUtne
         TkMt6m0Ok9h1aXxhWp+SeAoopR2zHxu592pE0v//Z0/FPIeYbK0NU0FNg53MV3cutom4
         nCIKLSD1tsszp+MlshMYFxNbZEDzVO1O8iSyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784178069; x=1784782869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=YEwGbKYgyn5+xzi3V1p//ZF9wZfa3Tj9MJB2nSzmJjLwvkan9rz+Lmrqx7M3tCYjCK
         +v9TxrkoyRh6XkdtoeCCLrvTcUKSX4Nj37Ht6kemOTPZFykQUY6I26BW1w7taASDhTdK
         gdHDSlX8d/Y8XGV2HW/38RD0dQEOsEirj+rJOklAzuYvKeXDJS+OE40R3M4y4aJtlAPc
         yEvDUCfzGmm+P1MnPHh07mv3/qEGgJKY3FtbmIL6+PR4/tVcnGiZtJYrgiuSWIx6eWMo
         7KO1dsdFdMVtGL2laJRUX3xOs0xRDxrrqnbWoqKZjsRKPBe7X3irveoF8z5xuucIF2Vn
         +Spg==
X-Gm-Message-State: AOJu0Ywppqmx3evk1F0H/8cUhV1SoB2/Gr8uN4KtvncJg8crZRBomB33
	3tzCE8jUEUYjwb5NR8YTFrnjA0vMX6i4CkeeLDMOMoYUIMOPmIPytIFOSO8vmCOqWqp3qzl84Ws
	+mQSeOiqUwZTiK4K9KCJnB45eXjaLtB5cfjT/HNj2
X-Gm-Gg: AfdE7cmpWgimTr6+jWw33Hb5FsXQj/ie0cDF0mPj0k0JriOEUhBiyAcMxEKlDTToBCv
	73OLAJnQpu81BCvVyWwth49oEVLgm4t7uF+cHLPZDs/YN1/kWDMyKBjrvZ5ClGx9jhqjfTA8hx9
	fZf+7Ut0B15CvQARfYKQca152EgfdUpiF05d2/hyVOVwkDKizRyPYrxHvOao99IfTuQaDLp7tLc
	DCNGzODYyIZppPaE97xA5k5bqLHkDKZWAtwsZkzk4UOBN1VOctWnydgrY3AC8ywUB2xovwWEdYo
	PUOBmKZBzt2A07NR
X-Received: by 2002:a05:690e:b8b:b0:668:2b54:8cf4 with SMTP id
 956f58d0204a3-6682b5495a1mr520495d50.72.1784178068705; Wed, 15 Jul 2026
 22:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-2-wenst@chromium.org>
 <20260715090310.26F5F1F000E9@smtp.kernel.org>
In-Reply-To: <20260715090310.26F5F1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 13:00:57 +0800
X-Gm-Features: AUfX_myRAMngI7RW0JtHLajnxuyPdfwVsueSic_78CnabftGnuXr_AHxR2Pwgj4
Message-ID: <CAGXv+5HQ68BPzu-G8FHoEpFyncd_78VJCTm3vNDBQPsomX4H7g@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_by_id()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch adds two conflicting declarations for `fwnode_graph_get=
_port_by_id` in `include/linux/property.h`, which will break the build.
> --
>
> --- Patch [1]: [PATCH v5 01/16] device property: Add fwnode_graph_get_por=
t_by_id() ---
> commit 88979df4c2fc6de15d7726e00adc783bff896bbd
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_port_by_id()
>
> This commit introduces a helper function to retrieve a reference to a por=
t
> firmware node by its ID. It includes a flags parameter to allow callers t=
o
> specify whether incomplete ports should be returned.
>
> [ ... ]
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 14c304db46648..480ba8646bcc8 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle =
*fwnode);
> >
> >  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> >
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id);
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id,
> > +                                               unsigned long flags);
>
> [Severity: Low]
> Does this cause a build failure? It looks like there are two conflicting
> declarations for fwnode_graph_get_port_by_id() with different signatures.
> Since C doesn't support function overloading, will this result in a
> 'conflicting types' compilation error when the header is included?

Indeed. I squashed the header change into the wrong patch.
