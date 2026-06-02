Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDDA18DB1F
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394165; cv=pass; b=taW0yqp/r1nB0cAGi2FbYs8BBfiY/JRE1YTg635RpEMkl6bjC/C91SrpA439wTOFEUYlIwD+X5JbMzTpQNSUaXcQ6jIrU0COY3PF1PHbI0ac76GB5nk/30whH5/k2zJuptrBY3900jb4rzclLfFnqq9kbzC/IKuOtDZqt+VvYxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394165; c=relaxed/simple;
	bh=O59CtIljZhLqWH4hYhVsqdio4RXdVIpr8uwu6olzWvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owKmPMxjclOVwozUcFL8AI31KArbRXiiiL4unjyTW9dr3+RSNLTcwB8SO8XMdngNAlAcWFUKVXCODDnyU/YErC/+zXf4O/hdY41Klb37OGSiTjC91ICINXtAFAjhElDB+Nxo9vEZtn9mXf5UMcjvGzpGZsYqZrKLBxGnPtQHJKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjW4efj5; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjW4efj5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so1148021a12.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780394163; cv=none;
        d=google.com; s=arc-20240605;
        b=DPzdMytmqUdW3Fnedxegnm1b4TKf7mxCcmZGU6+XVbzdJGXO0AaikJqToMjFS8fnHt
         Sjelo/xVA+yRp/Z65pKTOCtQtjPy4Crms77NX9fGb4oucVDohvj6Vy7EWeWns/3IucLz
         CYBl3Ycws7JVliX8C/AeIyBxoqxmlcoD5P+AtLvAfplUlxgsD5y8SrcligzlYSEYyQvo
         bbrjMMOkxPVsdCHs+m71g60nkTZ6ELTwmUjxnvnSokbJ8zOy8Cfvw0haOwvL9JOkkEkP
         afEc2JD/oSkGkuQob3ZtUsj+GPFylBVL/KIYDyQZ6tcc+Iu6S8VhpJlAWaK5Rc92FfyA
         qzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=axMwO+rlZWJP9yBB1+rjoK8tE9OJ07rqzzsLk//qauShRzAbfo0s1jqd2qdFMqgoHh
         SSwEPvp1hJAh8MVpmCTMn1A03oNYfeHt3pgWv68rCjtRVovpBCnsJ0MprbgN4iPcOOJ6
         lMQMNL4ZJQjDEtEOL6lWfw/9ch98JeQdWKJouYrx1ehwZCqLLQ+syKngjg5wU93Uh20C
         ts+PcjjB/eeRBu1klIj4UMs53XzDPqi18Sja84TSya8Sv4PlTFA3avoWKYHvyLjwUNrn
         pVq04dayLJLOeFpj54AgCOZtt2WeLN+xw9nidChpxQRwctT9xotNd5xdPvMJtlOEtde0
         78AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780394163; x=1780998963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        b=TjW4efj5iJg/N3dSc7giShYl+2AXyYUQod/5svTxqd0bUguU30k3IrbevUYn07IQ4D
         6ZILBLmY5nw89AxgnphWbLp4eMn6TiJeDXGGkb2eTAHP7SxXjrRDO2gMPKwmEshvjh5w
         qKfOB7b/CK5Zf66SObVdmAsuIzgS3jmsAhy/D1Ycs2tl0SQbizsoAbG53FIJvU5ZYCQJ
         l42+1wYkqKwRt2ka977j6x7mvMTo+GApC6iR9kgMwsygRQPxn4CAEVf/stnG7IDLbOjC
         JjM19MfPbn37mTdQzTxjL7BLnF8LGOCmJVgjPi1yUuZ2ezhCfsfcXaEESZm1bYJTG9sM
         UkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394163; x=1780998963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        b=JZrWvY2swbaQ9Di3hFqBmWX+779sUhpQ6cFEQTiQyL/WvH2nf5WrPIsclUtA8t7cly
         i+6A28VW4B7M6wKhpQP2/3XpqqNqwhqTavB5yKi3IsUS1S/GtuP5VrDjXAdmSwrRf0G2
         hA6r/Lj/qwPCPzJl3e/HW2NUlvdvec8HntV05uPSPQD8Rto83ff/hWQcWM3ElXie0ehP
         yaue7bsLMVAVE1mNtZ0X6CkTWEI5Mo/YOUJ1S1EOp4yu8N+9RT9xR8GGRCw0l0/S97JN
         B6l+k/s0OegpBxewmUu+Wtaoopb+HRZ+A3t6v19bUCyWBR38hfqkHxoXIaeDziMpyuyx
         cmaw==
X-Gm-Message-State: AOJu0YwuVr/waKeeudpJXn98boThaL3SMqZ5C1d/5hRBDNjaKnH+EQgQ
	xJCY0SRWpR9wj5ZUxbZCzS6KY3gZ+lNM16E1Jwzj8+G3VRZ8tYHvnq/dIcY9pXCOeuT02udqfSa
	AD5ZzGm2n60A5biiBuYlH3s1XX+TWybw=
X-Gm-Gg: Acq92OFD/2d/33HnM/cG3P+yxTa0EJ+5i+4KzcSzUWgVJuK/I3cx5MKb2BhptE1GFmB
	rilD8p3nWc11Vgrc+9LRRf+iTKla8ObDwnI/3HDvCBNTmp1PAG1dHRuf6pSUUF8OGMYnCDQn24n
	zU8/tSUg/lZN4jPgUEr9BPgmndMECQ6uPyCR2M5QOJd0WSXlhSYGDhwPG8wBa/i5VrtCIIBo8vk
	dQOUC6eQKhsTXw7EP2ssWRmDIhoYzpIUFEN4YOfiXbWBEoOdPJfggSJY880d/JwuB1/ssYD99hR
	JJY6OmRvbbtOvS2G7P/ag+MoNoJbzcAZRWzyYl/tb1+rH2If
X-Received: by 2002:a05:6a21:7016:b0:3b4:71c1:ab29 with SMTP id
 adf61e73a8af0-3b471c1afafmr5517169637.16.1780394163282; Tue, 02 Jun 2026
 02:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100318.73474-3-phucduc.bui@gmail.com> <20260522103713.6C09D1F000E9@smtp.kernel.org>
In-Reply-To: <20260522103713.6C09D1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 2 Jun 2026 16:55:52 +0700
X-Gm-Features: AVHnY4L1XSy8xh1n7_8eywzteDnYmK_ktmmzmw4IKNhvqBL8NzTqlNXMe3QnjJg
Message-ID: <CAABR9nFn95Pu4AGd+AXoKdezVyxqHwnPNimQrrzoqAXbqq1Seg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: rockchip: spdif: Reorder clock enable sequence
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.
I agree with your analysis. This appears to be a valid issue, and the
fix should
be relatively small and localized. I do not have the hardware on hand
for runtime
 testing, but I'll prepare a follow-up patch.

> [Severity: High]
> This is a pre-existing issue, but is the regmap cache-only state left
> unrestored on this error path?
>
> If regcache_sync() fails, the driver disables the clocks and returns an e=
rror.
> This causes the runtime power management core to leave the device in the
> suspended state.
>
> However, the error path doesn't appear to restore the cache-only mode via
> regcache_cache_only(spdif->regmap, true).
>
> If a subsequent register read or write occurs while the device is in this
> suspended state, could the regmap bypass the cache and attempt a physical
> memory-mapped I/O access?
>
> Since the generic power domain would be powered off when suspended,
> attempting this access might trigger an asynchronous system error or
> synchronous data abort.
>
> >       }
> >
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522100318.73=
474-1-phucduc.bui@gmail.com?part=3D2
