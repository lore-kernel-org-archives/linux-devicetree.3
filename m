Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51531E844
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775501146; cv=pass; b=p9r8wOSmHtooKvfXVsYYR+gFopujwYwxtHoJBLk6sARm9YSAYlXyCtV7a2EnftPsTR3sXxNC2nkNMabYAY29dnlAlihGWoyZi7EOMpSNuggFR0nZlH1s9pKcqUJsvALnKPzsqiDXgF/SZvy/4dEXpevBnoZH1PUCp6xiRi76Dik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775501146; c=relaxed/simple;
	bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbhYPTY/eQhz8kDPKeIatzf/Zd3BUguGKr3onIkCSltjN+fSi0SASNCVEXdyGw+E8lFtTCESRnvvusSv/lzHNwG6WwSYy86xbfMtmZDq+hjQb/Zq+moMHNwNEV7xgJXAZiw4UvHYiahijBJz0Cdn68DgjpL+eS7VzzKxyy4RsRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvID6AOh; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvID6AOh"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66ec3b7b1deso2255656a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 11:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775501143; cv=none;
        d=google.com; s=arc-20240605;
        b=U/NY4a99AY+qYnHVowred4rWI7QKx+qbBu+IKfWsCU0qpdfGuS6asMIal9v/i15PUQ
         SnFSszXm+Cdqh37u8Ug+wKQIe8GsxAPJXyl4SAajBGYHR347xJ6Hjzs0PCN6Rmj+/wDR
         lKmPCjbc5Yq9/1O5IU6ZAARIZm3JMXzK9pp8PmouPMoTlT0LWgvUDSSPlRhPxjpPVE6i
         njc1SkUJBGXTiby+0PUI/T4J1WEpfOGqBQtOAKhfrOlN/KCfByCaWl1wuB+Ru3FyvsmX
         iAtINtZArVTnv43ESl+mKYmQN816j29lR93vvXc8R6CYpjBJ8xE7j5fLg93TBZogCotC
         BRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        fh=7WQCiJZAJKWzA4gB0fEMvVYyizTBvRtIkg0u61YFioI=;
        b=HiKQiOGBVozNOTK1FaTd8r8rdRTXaO120StQ5gSMjrbzhw55fzO/SCjYNcD5rDnFq1
         S48QJw+fCunMjBDajFycq86vbW9v78185mAlMgWrWY3wxeEWyHelH4+ixVAc06TApw0m
         3LZZpeDP+ou9pmhEhKwmdlF32HkEkbwEWnMik8REJzEJwQe7kY47glCebFWTfZH0OWyM
         5TclM+yp3t/8F3S/0faKHL47EdUhHjQwb6gOxRJ06EfmheINsV0fRrFMTqM2Z9q3QeQz
         zfvHfI1obylLzRX+NamP50M8isICjDf1Owjzbl+xBvi3OcrppX7L2lLJs3k0EhRzpaA3
         xb6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775501143; x=1776105943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=TvID6AOhWa+L4+gvoy9mzK4z699+6jD2IQeK5WXq21Tn0aQdJvHTE8YK6aHBKcHpG2
         O/5ibJDgLOwKzWl+Cw/1puXZGbHukwGVRlBqRRXSWYwf8kZatytM/zzBqLqeuFjQXQgi
         l33gUTl3xdFrJpXxR+xWsRDr2L1+TZoWqw2eguVIF/eaYsNHmPvej5pRRsYxZelc31sp
         JfMehFtinjigL+HBsCT45DvWnkDKer3TLdfNnBns76DfjL9Mrjn+BcRcWfbt1wZRT4o6
         jSHIsvx4HLp5VFxlhCfaxJTwLj0+f2//XoOV7lVkjo1fHaoS8aP9RRhyLLC4wzFiHYF7
         OGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501143; x=1776105943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=KwowcVeMB+gawwSwD2XS07zzhnzZOhFxUZoSgVORM04jMYnssFwXjieiXqOOSFrw4F
         1jM1F6JVg95Qsk5h4tjR8fvg6G3xsT8pREdEFebJnEzZnqhjtPjJoNGZ512G2aqOq7HH
         qn6fNnNQjkKjL/JcXcPH57PaXhTulW+/u0QAqDt130C2jIxuK6HRQ8kbclr8byt6WfiD
         QXtQEytD9UtgQIfGrtdJ5kOzmPqHyOuoDghpwAZkiG8Yn/7W539HHxaer0/vwr1iqTxC
         cN2JPZE1Qm6QEWK/e6NhvAOGlft5LK9BH6groFbCjtcC1ssDkrVvjfXv4KBgy4akO9AR
         CrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ikI2tk6t3oV0R+WVHbCB3HRgcY9g+3qGJ48A6sZRdTjqYN8yaY6QE2ZvRvK6bbYknKTnAtUKz2ot@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxtQke64Q8U5BeLilW/BfgBk53k9FOCGxg9H/CvycILJ1459h
	4fQ4iQTsrduFBNwbsB4WiXl1S/Y47113W2l6VFScGN+jWsHfK/3ARVN9dw9MEx1d/5xgoIK0c3q
	Z0cKoJDcozCC8YHfk91uHXEiW/y2tSmQ=
X-Gm-Gg: AeBDiesuJc0Jf1VvF7+KqcAL5L71/I78p/xto98plf6XHWZjCegLq0aVutKeZ7XPzTD
	Uuoz0PK3MzlSaef4dao3wWBzlzvQuEyx8FMKyV21R8WbLVUq2HegzTKy87MulJZEloqvDRnjhgM
	h0iQQ+s2ToNitfhZhmALTJ2fEJ3lPt3Ipwk58OxnDQuV/umIbUEG5u7iU0SZkLL6QMcFWBCiIQ7
	/VdkqIc6s8CI3ujnXZv6U2xUgxakuH++5yh/4Bm+aO5kNlM8/72S7E4SIgKqTHCgi2k55zwE4Vz
	t1DZbQ==
X-Received: by 2002:a05:6402:a215:20b0:66e:4372:73e9 with SMTP id
 4fb4d7f45d1cf-66e4372747bmr4169926a12.1.1775501143298; Mon, 06 Apr 2026
 11:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 Apr 2026 00:15:26 +0530
X-Gm-Features: AQROBzAP5CclShOimKNLKPr2Da3Hb2vm1DFd1fAAdE9Rewzt50idvfVsjIHzHvI
Message-ID: <CANAwSgRUM0HJSKr2zLYkv=LnWv85gvbc0_WD9gXywQqHcU=EaA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
