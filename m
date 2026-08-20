Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D79395AD3
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251433; cv=pass; b=aubiQz95KV5tyWiO4RMLJMuJlJxKsNwfNYinesXKiG8qnNaGOkSxlseQCglopWNwMrSOFQTflbqAIdohlBhumqhXgUV2C9iB6ya4hbc6cq3B4+KIcoNJpd2sApd/aBhzzuqbFNqfXSTcD1Pv9tXUTx+7Qx6Z3QF3WLWREVVNH5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251433; c=relaxed/simple;
	bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRjL8lfhUGtik/HgARgI//eepJgipnMxJdF0S21usaHkZ9y0SZo+TmJbnWY+SDPFUK52bMkpYrGv0pfqUNTKXWR0SW1GioaSCtCgMU6NKc98ZQd0H9GMBRmy9WlEHjFGLZ3WCyUdNz+G7PI4eefVc0stfeyC2AAtg9AM/L1gIZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+J7AceN; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+J7AceN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b02fc590so1230765e9.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251431; cv=none;
        d=google.com; s=arc-20260327;
        b=nfDc3NdzDulN2qx/zC70g5/zeq7zGV+fYYqV4fEfZo7C0gTtzztLBGwynDk/ul0wDP
         oNm+hY+CsNnsOM0+Oy6C8vV0kGufaa7XbbocNcwVZvCY8D4NBDPSEFiXvy5yAhJENZrH
         aH2K0W/brM+addUxsawVMN/8jvy9dLmChoHd5ILg/wBvSBmcdZnuu44hEgKu7qYrFpdP
         nlpJfhXquDjzCIe6lboHl+p/StenN9wlt6qvrBj1WkCOttUT8IWvap5N5eLrridWO1Tq
         BKWwsRL12A8HkTzm++peodbZkZLQvMQtYofWhSFRywVwBeWx+gDEAPvdtwUJjgiyLmyP
         3q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        fh=uj0f9+G2nPzuDdsOY8ovaRNYpX3EjfoNbc86ni4kxBM=;
        b=aLefnU9IyAEZ98G9zZM1XRKRH+0UsI5dqPRMet6FZ7XgXBq5AqZKxYOlyb/mX1Cgyg
         BDQVjIoK69tMuHibdO5cwZmRkpAFuLzcNfDGdumIlzNg2WuHToyOqSiPkRduJd1Fnr7o
         p8y1GWOL++6e/nv/GScclNnTfvevyX+bTWczdte01/F+kKtQ8/Qsk19uGYPip13uI9AR
         pW92gu4GrWXgdk3LNfVZ2KsoEROzoHYDplXT6ge8iAHcJkum5v21rIAk/m7goKPk/IaF
         CDwPqnk7oHpofv5WCpkdnlW/2kh9qri7CWBiW8yic3cWOMuFg44mZbaSQSEHLpiXty6U
         gm0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251431; x=1787856231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        b=B+J7AceNkzws9Yzpkwgs/1dkp8WLCkWcjQHf29DQ4DRwZ19/Iom7EAJ63CHdF3L8Iy
         KwmAmLk0MsRACu5M76phR5aj0rI1bENI8rD9kq1LPYnUE8j6awVNCozgl8l6u+qWlI78
         CY3ezs5xGw/fXwfIUT8pxM9WLwWqzVAiIroxMfgO6qcGP64MJYqhry4lbm7stwOt0uAh
         GiW1H7Wy4brNpC05//syH4SYa1OSMcLKKVD1bqctSI3nNifAeFWazVIYnW/1eEiDGNL1
         km2B7QGFuzSPmpYg6LRVwycmpAXQ9LZNe7WZsOS/CG6yjBat8QMu1VkLn8n9T9NB01tF
         SPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251431; x=1787856231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eokv7VYq8/Jopa4y9Fd2HUxgAgf/fH9R5m6fsZbPKyc=;
        b=rdzS0V9LcMHXM27TR9lPr98hbvN9jv+gEhrQNhv+E4ld/n3+aV+AdHZ/yawpSJkPss
         Vdh24AxjzmdguWRRN/TmCOWicKfFAS9yJqZb+Yr85wJW/nVfKpQsvaqVyaLMHoOVled7
         dQPo/UwTNXfdaAzlq1lPyo9Phy7eh3Vw4C8oKcPcGFJDEO+9Qe8JqLjFYexmRVwPbRKp
         rCDglAwv4JwYM+g2pTYVMRZ6thQKWVgBllBS7IZxZTLWoTXh0O+367MBYdGI7kbhBeH4
         CJsluVOqlCkFMtxWaK70gqDsu4+qQ9+y7nimxYfJe5KITSH6/sKJpq+NQiJn7Njg/NVH
         YCvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpm0dukEYFhbVRi13a86p0OgS4hBtcrj3WddoCrob1xsgkuIF1O4gioSo9RcGYkSqFLhGVDTVjB3ptt@vger.kernel.org
X-Gm-Message-State: AOJu0YxOO7cmupHIbMAyWqDZ72GqYWwpbReQpg8kaCAMoj3f9Ax7mZuD
	SmWls4fYW4X7cctxizQdlVwttk3MpL58IOHsX2WiY13TzeNr/zFrhoPtRjgbbiq7TrzUQ8KM78l
	3Om/FqmWFLAeipYhebr4Wxq+/8WRn4E0=
X-Gm-Gg: AR+sD1305vjIyRcTL4AZsqN4WBksmbqQdCDb0BlXDHOl/LjkEICTzm2PRjRzjXK3qYN
	gDS8E0M32uFdR6n9G4ueREkyMcSJ6J8MlYBMK+zaEGnqcSZOrXtOlS0sbYmG77yxBmrunw6G76p
	zs04W3O4FL8ANrvc9dk0eQSCed3cWxdPdYVlArOCLKyZXaVWC6wW6ouXHPKWhW/JvdsS/XWhPkx
	kW7Cim6ifP8lEzX9SsjDchd17sT8WHiH7fHzH3B5NKAeiiyFJLSB/DF2jNmvaFJYn0KBA30Yn1+
	Ia9YZiEDpDod+/40swQjp7m7TggldwCVxVzH0EX3Yr1LIWdTmlWpXMyiq0tyYnwK40Ne742ZHus
	LKxSRMH0jQOLd4BBWF6xPSt/cCUPHWA==
X-Received: by 2002:a05:600c:8b70:b0:499:593b:a15b with SMTP id
 5b1f17b1804b1-499b82f4a2dmr21862895e9.1.1787251430709; Thu, 20 Aug 2026
 11:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105139.4AB9F1F000E9@smtp.kernel.org> <aoWqqoOpIukOZBFo@shikoro>
In-Reply-To: <aoWqqoOpIukOZBFo@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:43:24 +0100
X-Gm-Features: AcwNN1V5YPd0FACE_Z1Y0Z80YTfEbDGtlA7AnJxcCLtu81DRXLIHN4JWJGjLB_c
Message-ID: <CA+V-a8sTK-6Tw36XN1NboyPx9RbP38x_7DrMUL6DiCqi6GxXqg@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] rtc: rzn1: Use pm_runtime_put_sync() in rzn1_rtc_disable_hardware()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-rtc@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: Medium]
> > This is a pre-existing issue, but while reviewing this file I noticed a
> > potential race condition in rzn1_rtc_set_alarm() that could lead to
> > spurious hardware interrupts and lockless torn reads of rtc->tm_alarm.
>
> Same issue as before? Just disable the irq before updating the regs?
>
Ack.

Cheers,
Prabhakar
