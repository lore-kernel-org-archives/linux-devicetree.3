Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E868481B1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501083; cv=none; b=Hx9MTjHzZ85G4Yl2JBMlsZuyq0ljFkisGr+eSIaVS3MNMseKAc5uNCbxQ225/RyLyfhu0XvDC31/gDKSznZ1nDeJ+l7TX1VQ7qaHTiVfuCPFTgQhHqAHN4oHZ1nzyikg+D4d3pjGuIPuQl4z5FvjWM8hyvmQ5TzvZAgLFWOjCno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501083; c=relaxed/simple;
	bh=LKyNhJXz1JIaxAgZZafPKVNcBtAvTVXc1u1KD9jTvq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq8+HrlVpdDOtYoWrjECjDa0NZYFCHknt0Oyvxco90JklpF5i/FhkMyma9hH723QHvoNIyayB+666PpGgZZDjF0x7sFinhvTqM0qGvQbxL5Fs4tuKLC+Fi4N2yzJ8QXNDciESs7169TWv8LVlyvFjtXdAzXQ+6pxfqW4o62xLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqHwrJuI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqHwrJuI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf125989f2so21041435ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781501082; x=1782105882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=CqHwrJuIs9298oyuVjMj7WCCc9jwKBH1akZ9JCvCFRFYujyDaQ6gF1mea/211oh1PU
         +a7pgUiWlokW6Kc8qC4lMpO0AfYxxIJJsD6EHiMMpJ8ydghW0Xnh4vYe4PtbG+jEU7Nq
         Q1qq7z0BVe00nNWYgHxhwiEVSTea7pVOB5My1ohA/ACvUWkbhnWEO0aw1wzF6PamzXz8
         kT7SfKNHCndrcHmejDjSh7G/xDa/LeL89eVO8LXqXjHYQRKrHZ+sVH4uGMB5AvwMbjF5
         eRht+KhWkjhfBCc4SLgJB4Z7rKHKkCvg3Uk7C4nIurgYGfHoeylymZaq02JlbPCrl192
         dEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501082; x=1782105882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=LTb176He852vnR4VIySZ7FMdnLbM3IDBPYxqPtuJDVlOoYJBkNYPMfX0Qo0u6LiIJc
         y7C/mIlcfHBgI5r+8tqvT+s7uS5eMjdH/kwbjLgkwXPsmWTBqsTpvKYR+zjLEnW2mIKN
         21NdLH+aXFQ7zf6KPIBJfnOVRBU8EUFVoLkNaKlKZX0QSlNhg/pAYHJGhkFHfGVHMdrW
         7sgnxtn4eLhUsQlKY+FdWOaOi5wz0K9DjyWDKeKgheWaqZnLolwVJmyitRXiK9im0KLp
         Qg6K2S7egMqhEvEH2CZa4NpJsPVDWYqO9ZlSdAw1xBB+0skOjrLOiw+W1VPGW3Fe46PZ
         f3CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vBO9V1zyMPqa2zH4M1W0u425c9DrsuWm88L/ngwB6b/2fInrsQ/XQ0Et8DWkGgxqU82CW116FFzVY@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTaDAw7+J6+CPdudvsgXoO9oHaZe24zvQT/abE3Sd/Mq8q6M6
	jE4GV4EBCLFdmniFF5ZUqEU7nuGuYLEgMr/OphWy8leBHNGkjdYs8zA8XsQJbCy8PrI=
X-Gm-Gg: Acq92OGYPpCIfRPFkv7hwNqg2655Z8zi2i3L7GogrMvz67flUcvlzIlhc9Z/L1hVZTI
	us++7fh7l8FTblLcaVzrGKtdcQIyOO7Eyf4YOJPQZVxzVbDH3DUzriyXv9w270cLktEmQWq2j7b
	nYl690XBAfYpmfgX5Lr4vfQvTujKq5Lg0UsjdFZDr1qjax48bfQpqPqXgO7eKLo4asYDoPoeg0C
	VxMon5L31TTalOHE0ofUZNZ07Api71/6VNvCzKMU37bhX7tHyoKYtKyot/joVoHL2mbvgRJ0A4e
	ugSvFrgwaP3bPT2yhpRgayI3i0SC1BI+bRFAmHgEalfjp9cZamajrzGVRpkpGPSYhn4lEbsGQKy
	uQLLfCzM6EZ+3VwJnhw4dPQ7jCJQp0lwauw4kvxnu+gXn5T67kWAFmubj3FiixxsillPP0+T5/b
	IqaYzsrQLqjuo3ERl3632HYEA=
X-Received: by 2002:a17:902:fc8d:b0:2c0:c0fa:1659 with SMTP id d9443c01a7336-2c413dbe166mr150322135ad.33.1781501081641;
        Sun, 14 Jun 2026 22:24:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm87824995ad.50.2026.06.14.22.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:24:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:54:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>

On 12-06-26, 17:51, Shuwei Wu wrote:
> K1 has two CPU cluster clocks but one shared CPU voltage rail. Use one
> cpufreq policy for all CPUs, let the OPP core handle the shared regulator
> and the cluster0 clock, and update the cluster1 clock explicitly.

If the clusters can do DVFS individually (as they have separate clocks), this
should be represented as two separate policies. Isn't it ?

-- 
viresh
