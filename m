Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD3E3F54AE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331114; cv=pass; b=My25mvD2eKFk2jTVPGHeUtz7f5Oy1HEd/Vx3szs32DRTSYBjTr8O97IHEiik6z0wrwINGTw75VYPBtXkdI9dkDIMrE6KBsniltFugzdX7v8vdpwgZenXv9JKfl+op9XewdMz1r2Te16B5PWWNLuBBzl4blEUTKJK37FX01m494w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331114; c=relaxed/simple;
	bh=1y/VyBqChORatgg7mbBlbrll73whp3RgKHcndf4sJ4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aB4cSYtf67rJcfRq4/ILCPX2586+MYykFH0DTLDdVNMcsvcNOWtr8lvb31tgBHIFUyvm88RwLFjA2T77tBcDvBjsZKn2Ec7c+BmyRX6WtOfFViGWfMBhWpO4Qicm8KlfvNazxZuiMx+I6MuJoutS09mXmnqa00smLyhJd9YsruI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbYj5VV2; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbYj5VV2"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d78637f8so3964755d50.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783331110; cv=none;
        d=google.com; s=arc-20260327;
        b=d3ilpgmKhrxPCtO850FC18TQkmtJETQc0Z/Qwl404lWl4DPU6BxTpFyr4ADfznyspH
         O1JgU7jdPS98z01JdxVqCuOfL3BclHEY6AJjfIztMOO9SLCJzyAMO1pzWZwWrRuc8gRB
         Iz+S1qpwV45xqys71PNfbLWSfzWHQcosy1i0it/TmdyyJ6/o9s8Rm5ePSY7UFlZ+jfLF
         4p8OCpBJI/fZcri3UAjkaAyTQGFgelxULgNUJIIl19AYT1UpYWcviiIuQvsH9qPgWbzA
         dDiNUJzXkn3vFOfqeXVpNYUxZEg/4kmErYtceQAEChatRLiN1YiKgztIiAfQ1gMM7Dxa
         GfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        fh=W0U+kqrCZtOPAYNNVYufEqoAUHKTLZq9FWIMWjbQuPY=;
        b=Dg9/SVaa0wIuHz6/SQFaiA5dYY7WXpRzUpseyGNGQ0J7MToHC6sImFolMPDIqnkhzW
         4UAx0gROhYW/wWYlEwcss6e43a48GbOYGcer8Fkda1GzDZ0JqtfYL3Kf0BqvzSBzGw45
         9gLDRjDWPWQigGGT1TM0xSL/U0J0pafZXvwRSDB6SaXfOkxkmYNST3gruojKEzlwdMtj
         pBzYflWNUJ8DlWkeRP8AhVRWO1Wot+3bLE2zUqb97xzefhk8S8zvoE9PzhK9ojSoiMIb
         fVJHKHgb+e9jJJFaSKXTm+PFAD0GrdSv7xiFOZ6ggPRL3SdFLzzYPdUiyd0VTOGEbvmE
         mNCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331110; x=1783935910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        b=DbYj5VV2bbScNxwrMOomtwJDiHYpAFbDFGOrfWgRzOf3x4ZLHn+XAMDuo9Hn0vjFmK
         dn3One03MuFjO3Y4BzUUhz40ib9zRvxqtVq1MKyFLz8b/e/501JqVEKDXnj17lGp8CmM
         3PP5/KJNVhOEQyEP/PuZxVOWr30IezXiB7DRrVjMwYK49nCZj6eJmhV/b/U6CV/LXFxC
         HAkTqfDGFnwjmIMto/tsvqFBiE7vnF4TurY03R5GtICXTFKRgYkHiRC+Kk+rQGLdBb85
         pgjzozQr8lu3jntMN5rnVt0NFaPzgvEno9LvVBAJqy9jTund6fNVyPjIZyNozVqKhMWZ
         kyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331110; x=1783935910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        b=lyESJlWSe3orfoK1ht2t0gcaL/jljhLbZlUfQ8l2y2R8N98KtOiUyjT5+SQVzvNr9d
         7t1Xk6XHvKAAQL2YGTb1rdx6gByuHFp5mkD+C1DEZWip9h8TtHwReDcEb5LsHONBsFf9
         dZBbEMsnMkFpfzwIDt2yGMdr4x01X1OlXdTUF63kH4wltcK0SjnrlMeamqZp9yZPLemt
         +FGzGZr7GWQMddUhTWmnh/L+Tz9EEK25EKZVoMyMHuqVgJ8lailkFyGUdDzyqrSVbZ22
         Y8NVW11xTuvVPWhJxV76hApYzZ4Ou8wcCe3d29eeB21lGGfrXBUwFBvCXb9wxOiWOzLm
         gusA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7rVPKQi7U4wjEXhGTSBLH3g6BXAOfpT52P47x24dny2bEozMJH+OODAnOaUmvReFmBBlpUUd+6qVM@vger.kernel.org
X-Gm-Message-State: AOJu0YzR/mArVdUCzCcs71STPKzHl3+sCZrJBDJ80zK6Xsi0x/qW8gTl
	AYiWjS4yCZoGrb8YW10IzLPdKPb4vdQCAj0Jr7h9a2nJafIT3DnJ5lBbmTA4Ha6EFhadFSGqhtn
	6ckrOKtTu9LPIVVRgx61HXThUw1LenBM=
X-Gm-Gg: AfdE7cldHyEiKRli27oeVU8ml12JGfvU+ckvdf44vLUYYqWodhySbXYH2MV2JgFLg+7
	SD5SI5hUxz2RNCfVoeqyn1Csv7LB5vHIU4y2+tNFpylLQXfH1YFmlwWlWOmvEU2DCT5DAlKn4S8
	OZZ04dCZMuLel9pHbXnjwRLEQRoKfcEiv3CqV1LTRfSCER/InXpREh2ADq5BsnbtqGdJHK9Hb7h
	fA6h+KGXz6NJTn8KL+dLkCSU+N50ysXpcfoO4eeitFMrUEEgQ7WUK3E7nNymJUQ24+iZjSUXg==
X-Received: by 2002:a05:690e:1408:b0:664:e8ac:21cd with SMTP id
 956f58d0204a3-66652e50610mr9454023d50.25.1783331109980; Mon, 06 Jul 2026
 02:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705140100.1543486-1-tmaimon77@gmail.com> <20260705140100.1543486-3-tmaimon77@gmail.com>
 <20260705140617.A71F11F000E9@smtp.kernel.org>
In-Reply-To: <20260705140617.A71F11F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 6 Jul 2026 12:44:58 +0300
X-Gm-Features: AVVi8CeAp4CE3AWU4FV6AWJHL_1TkqiIDqOBExjjPuk3wMGkf3cx2S3XYhDqvP4
Message-ID: <CAP6Zq1jT-bfHvw65EsDKdqMCLVK1Yw3dd0NaxpOCw3zx+hVMTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] docs: watchdog: npcm: Add reset status description
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 5 Jul 2026 at 17:06, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The watchdog driver abuses standard Watchdog UAPI constants to r=
eport non-watchdog platform reset causes, violating the userspace ABI contr=
act.
> --
>
> commit 72fd6c8b87d96376853f3dcd5ef1597495cf9817
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> docs: watchdog: npcm: Add reset status description
>
> Add documentation describing how the NPCM watchdog driver reports reset
> causes through bootstatus on NPCM750 and NPCM845 systems.
>
> > diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchd=
og/npcm_wdt.rst
> > new file mode 100644
> > index 0000000000000..cdc45ade9e0d9
> > --- /dev/null
> > +++ b/Documentation/watchdog/npcm_wdt.rst
>
> [ ... ]
>
> > +.. list-table:: Reset-cause mapping
> > +   :header-rows: 1
> > +
> > +   * - Platform
> > +     - Reset indication
> > +     - Bootstatus flag
> > +     - Reported meaning
> > +   * - NPCM750 and NPCM845
> > +     - ``PORST``
> > +     - ``WDIOF_OVERHEAT``
> > +     - power-on reset
> > +   * - NPCM750 and NPCM845
> > +     - ``CORST``
> > +     - ``WDIOF_FANFAULT``
> > +     - core reset
>
> [Severity: High]
> Is it correct to map generic Watchdog UAPI thermal and fan failure flags =
to
> standard platform reset indications?
>
Yes, it is something that was already discussed with the WD
maintainer; This is why it is mentioned in the rst document
> The generic Watchdog API defines strict semantics for its status flags.
> For instance, WDIOF_OVERHEAT means a reset due to CPU overheat, and
> WDIOF_FANFAULT means a fan failed. By mapping standard SoC reset causes l=
ike
> Power-On Reset (PORST) to WDIOF_OVERHEAT and Core Reset (CORST) to
> WDIOF_FANFAULT, might this break the userspace ABI contract?
>
> During a normal cold boot, reading the SoC latch would unconditionally ex=
pose
> this to userspace via the WDIOC_GETBOOTSTATUS ioctl or sysfs. Standard
> userspace monitoring daemons (like systemd or wdctl) reading bootstatus
> might erroneously conclude the system suffered a thermal event or fan fai=
lure,
> potentially triggering unintended emergency actions or false alarms.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705140100.15=
43486-1-tmaimon77@gmail.com?part=3D2

Thanks,

Tomer
