Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1D303A0A
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461082; cv=none; b=BNEHEvJpxTX5AyCltXhbF9bu1O6m42a0cf7jj3KISZ8yjqZgYXPkaempnpobhUK99qXIQ2nyPKgO1sxESsv2pGMpsI7xBGYDK7XN8N3d6S7ex4Q0kx3URnWURVnx6Fk8f+d2L23+lxQ0NufFuXVnO0rOQNcrGH06u3nCJEPsIyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461082; c=relaxed/simple;
	bh=SfW3aKMNDF3itjmw5mDGazvjrO1+TlvAVfQgjmpgN1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5P1uf0z2Nm2Jf6egLGD+4Bx5h2jUcCdyxN1OwYnqXfNieB6Fqb3Pwruc2/pwTbvPkAU6Vl70CX+ZrL8NM7pz2vnDCP9p/IbtyJ1V3+oVWjCkFVuJ54saasGir3fwKFiZSAZYYZ000LginW8N0KTwFYR/JvrjmqGw2BKSGp4g9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1IFCL4I; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1IFCL4I"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c555f886dso1809042c88.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776461080; x=1777065880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9YMgPDsRl1INUEuGfQBN2K0mpewlXYhHoJVyAhAldtE=;
        b=Y1IFCL4IL4YYYhrphm7z00mjd9GRO/KIC4Zyqew9QjkGR9AdjivC19iU7hDPS/XUDw
         /QmJLcQuajzICwfhzrnhFPo0p4SWL7BUi/yT42QAZH08D5kmEDel8OoC8clZZhtpIxL7
         TcGJEc6TIXn/mb1gcHcO2kY5IaHp0FURjEHznoKL1Bx9pC3on6g5JGHoUzwpYS5WTdih
         brKW/ke2xXPLjm1Zx5puJ9x6fkQCoVF/Eeoq33t6IOkESfMcvosY6viWozLhdX2YtpO2
         jP5GKMTgNuld+yQglT6QklnYun1nL732o7LhoYSulJK/vU7UbF12xZ906KkavsgdlxGb
         gHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776461080; x=1777065880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YMgPDsRl1INUEuGfQBN2K0mpewlXYhHoJVyAhAldtE=;
        b=IysV/aUmRKtqxlSmAE5sA26V4s4emc7ap09ZglOET2EAhj/9NM7vDAI/fnMRxKX8Ul
         YB5k8UEoqTt8Lqkmuqq3RQr/RLBVq+u4Et6CGpyryxudAJB9fXtyp/ao0KpqgZRT5yZ6
         R+YbzaMzAlV8shnOGvI9dgG2crg3ECyZtimLL17Coi7qnT2deeUgNOXl6uXVhMw0ZW1f
         DDvGehEEowL6d8STukURGk6vZTJEqH6p6ermwav4JZp0bN/T5GVuUknP25nyIp/4foVw
         gcxt8kRuq1NT2sAwcj9vQN3UqtNgQjgUunLUkhoMd8XzPfYbPhn++mWJ8afWQNznVEV+
         m+0A==
X-Forwarded-Encrypted: i=1; AFNElJ8IseQVMu4ELOmeEmu4uIhP7tx0G5tIFFQur1wMV+vgZY8OtYrY+9mORSFwUXC1pifUXww3HlT8SRax@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0TK2zJ3y2188LJAthKJIbhPbzPSluPta6EdiRrYzbdrMesB4
	7u29xvNCwuOEeSqaDCi7BknebOhh37zH43U3JzPUHseWvMctelS4kcpH
X-Gm-Gg: AeBDievzcGELj6NybJj7vl+3HMcmrwa502au+oo08/sBiOnjdnmeZZYSiCfppTksWiw
	ZPAbzh4lZsfAPfAAXAfY/ouUuMDl3c2C5Pwd4eCTtObn2H2YTSAml+gx8EPaudcVzhOrUYTsCxF
	1/XqWtUJsgyHylFUibRD0P+PGN7zzPFCb8Z+JK3qfLRGEZXWaqwqSpX194MAPX0GU4HC43ZVzMs
	M4sS64ikR1syuvdyRHZ6PyRhQgGcr3ID2TbzpmDKEhrzQOnFMZBwJJRcOD9WARaXQASYolYhaK5
	tYRFHm306MiRNJTXK/dYZTpEVf7mwOiK6m6dwaEqlo4Qlh0uZndZ3btnV9Nxe22guS70lbq64/4
	cdjhh0XN58dIlpcGiEUcE9LgLjwX+YrQdGBKzBrMmlQK3cG1BziI+5+tgN9U2CMbvkDhuL2kDow
	SKaaRMlOUx5a2wRMlG8cJHxjQj9uDJertkeqr5+g1FSTVXV3kB680acjmheIa9YSFwZXjDC68=
X-Received: by 2002:a05:7022:60f:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-12c73f9bc97mr2419280c88.24.1776461080143;
        Fri, 17 Apr 2026 14:24:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a3:a483:e585:b80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm4053982eec.18.2026.04.17.14.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 14:24:39 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:24:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Harpreet Saini <sainiharpreet29@yahoo.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <david@lechnology.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] input: misc: Add PixArt PAJ7620 gesture sensor
 driver
Message-ID: <aeKjPSy5c1yAz4Ge@google.com>
References: <20260417052527.62535-1-sainiharpreet29@yahoo.com>
 <20260417052527.62535-3-sainiharpreet29@yahoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417052527.62535-3-sainiharpreet29@yahoo.com>

Hi Harpreet,

On Fri, Apr 17, 2026 at 01:25:27AM -0400, Harpreet Saini wrote:
> This driver adds support for the PixArt PAJ7620 gesture sensor.
> It implements hand gesture recognition (up, down, left, right,
> etc.) and reports them as standard input key events. The driver
> includes power management support via Runtime PM.

Sashiko has identified a number of valid concerns, please address them.

Also consider:

- moving powering up and down the chip into open()/close() for input
  device
- getting keymap from device properties and allowing adjusting it from
  userspace vi EVIOCSKEYCODE
- no capitals in type names
- use 'error' instead of 'ret' for variables holding only error code
  or 0.

Thanks.

-- 
Dmitry
