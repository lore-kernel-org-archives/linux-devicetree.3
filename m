Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE546A604
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730706; cv=pass; b=JXV8N31HqBsQorG59/8bQnrNLZGIc+cLr5v0nEnB5JMhq25inpHYwMek9QDjOAVb8TR5aV0WwmnsHDm6EZSWKbFyzGBLv5QNvkTXTSCnW21vQq9iYjCAJ9ct0YYNMuwoVWx7k48kbUgHUxnWSZv7n9z2JNN4pVeDMeraUEvkryw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730706; c=relaxed/simple;
	bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spCGZXfiaSPkJPTXLme7DXFSSOQeaPGZwccGcwqapXsROc0Bkn48n1ioUevoYEKO0NlnmPDLZhPwMrRgTYzy9l0MYKpwax3GpltRjukegU5gkY4dNqUyPvCVQgZpDKdPu6G7pveobc9ZUCxEOsyqOfTPEda/+FeoWzkh+JpEBdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=P7hKKBGU; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="P7hKKBGU"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso6617426d6.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730703; cv=none;
        d=google.com; s=arc-20260327;
        b=NFaRW0+2rUhcuGk+lqaVdHr4uPq+C0ohehBeWEqjltznsv+3S+Ca9K9gOzRABaFuXm
         eKynH09fAYFDbKgBkROCmIFUkLGNxa+X/AfpmaqDz7looAColzkItUR5eSr1SuyDRKb9
         8YUVv2bAVi0IfmcklgWJ12oyeCwPa1kFsYWk4LjlmBAQCws5N0vO9T4k6V0N4woXrhEa
         lcOpkH8HwCgR/cZeM+RczgDiiN13Obaqs9u/H30kE00b2tAnM2V6+aKFwz6Zk2lZs3Zz
         Gbe4lgLdBZzzocm58l0ZLqusi69IwRzyBUVfJJR+53Qqz+P6b59ZMuG9evNvWWYBzwzE
         6pCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        fh=vgMIzHERjXa20t3oVI5gFbFjfM8Vsg3q7O1pxyTqJH0=;
        b=EEpFVVxV3pf2Y4FwunYUV+CWY5ExgbsikXvIDUWB11OuklN8FXP7Y0TYZMAsC+DVyh
         v7d9XbtO9FHjS+fOyAWK9AKgORwmpDtXt7aIe4Rj6dnQkLHEg5T4H82pnktwsV2yWBx8
         p8QjH/Ei1T05KYqKu9nReqh+KdsQ6gTtDgn3C0EeLy/6tuP+82htqhVaZ8b6tgGM2dXW
         vVKwQt4zxNxtCOb3pvTUJg5I/RX0SF/PDLkAKOJ8A8PDHW7aqlOucFQLBbJdyaebofyb
         QHBiumCrUmO9Yyy9Fj4v2l5IGYl+wh6/ESpkQu0BxvMa88rxtIHkJ/QEj5bh5SiQmhzB
         eKdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1789730703; x=1790335503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=P7hKKBGUjZIowKpnru3at7bFSePHGNg9Uu4liqLA6d6Xhne6zXABV+CVud10iy807J
         s/Lwh1+S22rGZTUck++OVIPTWd8R+21cL0lDunbpKIb1nBlUxSF8yRUgE6qthjVGoI2r
         1G19E0DFZaG6OssYeyQZS7X/c7n6tyizl9Jg2fSLiES8vPmwDjE0/ndrGCJGW99Jrd+u
         mfFTJrC73w4GHSawyMJzuOqVx7yKrjHTOmIp8aYR9pKMFXUE3bdAunXOYbr6/2HYEbDy
         ROOtn/yPpToEViVj5ndsLekwwMZqenFlnML3tK6raKoCfeXA5A1xUOjfVfPSBRz99mKv
         fDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730703; x=1790335503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=hmyre+zNO/lHv0Zd2LlQXulUpFDMEBfVbc835Z+ws2qTtZb1b295UUxbSf/R7NUAS2
         mVgvA1k2lbuMrFO+Koa8SarXR9WKMqftJDoDfddIaBK3w5L0W80VOCUspu+716ijnblz
         Hq9y4jUs+29EYeUeqxUFXg8Own2q5GiOl8E/f5HVINneEN5uDyOWsPs/Fs05svWplIAd
         2SDnz3CanIz/gYN+KvxgHYldjQrZaQOOe/glPxvY2MDUIHDxsItH/NB9s61kGK2rzmt1
         +qBvkkteqGjN493/F9qWTT0E9eLmhpl7BFVJpTdrTCGydJssKMjLAvOAc0q7hyT3uj2k
         8pqw==
X-Forwarded-Encrypted: i=1; AKwUvBzaPCcLl06VZac0QS5lrzrB72ci2OB8dp7j1xRjiY7N6cAG2dU9gyqo9uPseIyJ/wKsHNOymDZ3cKvW@vger.kernel.org
X-Gm-Message-State: AFuF++nG8ZtlQv9KSjqDpQElstC6wtbYBALL+PJ6JvQnlN398Sw+x+we
	Vw2whZAZv0hUYqUvPH42VGWoTXgF1HOriNvzxlOUJl9CMX9xljmhzjsqBq52OVmlxbzN8qDdNyi
	z4XxY10nq8boUeSsMlifZoSAWCldNJJderFjC7dxLQA==
X-Gm-Gg: AYBFou2LUVS/yeIsTJ76OI1xdvXJ5LXUjxqv6QRItxqAlRLB8Z3bZSiSXr5CUAlrGuu
	z62kZhjPRsStVFvteVNjzhVgSq/o7hMEOu/MoqFexgNRwqM5GKtN2PSwuHP1hHTd2J1NnJUP//o
	TkPNlSsoFw1TkXTP4A2YzX2FkyaaaV/5vIZK5HDRO0AcWErAPbgg96B8ZPn6LfnMtIrwbMh6U2W
	nnj3EzBOinM+otRAk1QEpnYOcPbRp+nqK2Dp60+6sHnn1KL7N3DSQu+NnrXI80Gj75YEQvlLDb8
	ReOeAYbHILtz4qOWwiPoqzU/Cq4AZxo9307d7jivqLjDBhAP0dYHS4HC7CggZLKyvQ==
X-Received: by 2002:a05:620a:6288:b0:93a:14c:3296 with SMTP id
 af79cd13be357-93bdc64eb85mr265730785a.15.1789730703288; Fri, 18 Sep 2026
 04:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904130858.27803-1-royalnet026@gmail.com> <20260918100543.23974-1-royalnet026@gmail.com>
In-Reply-To: <20260918100543.23974-1-royalnet026@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 18 Sep 2026 13:24:51 +0200
X-Gm-Features: AcwNN1UuXA_zYpic264Z4jBxnVkM0kgrR6zKknS_YOh0Jo6_SD-EuICl1_jx1Us
Message-ID: <CAPsqS2QXQda2ftbEJb_-Qeva9ay4+4ysdpUtj8jAvbyAsYiAJw@mail.gmail.com>
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sidong Yang <sidong.yang@furiosa.ai>, Diederik de Haas <diederik@cknow-tech.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jiaxing Hu <gahing@gahingwoo.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:06=E2=80=AFPM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> Hi Tomeu,
>
> A gentle ping on this series, two weeks on.
>
> Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
> Sashiko could not apply the series, for the reason you gave Jiaxing
> on 31 August: its prerequisite, the slot-search fix (link below),
> is not part of it. With that fix first, the series still applies to
> today's drm-misc-next without conflicts (git am only, no build).
>
> I can send v2 with the fix bundled in, so Sashiko can review it,
> or wait for your comments first, whichever you prefer.

Hi Igor,

Please resend with the fix bundled in so you get a Sashiko review.

Thanks,

Tomeu

> An LLM helped me draft this mail.
>
> Thanks,
> Igor
>
> https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
