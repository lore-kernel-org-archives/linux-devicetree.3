Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F149738E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547593; cv=none; b=nBqWKaWi4EK3ozitiJxLbjnhZzSCFAeDpAPNfPBYGDqvI6+mTtP3Ad0MTm7IOaNLrOX0jRnFCwxWzRAgNgSA+nv2OMSDoVxcaN6K5XBZnhw6ZpGomS+Mx21UqDnsa4D0cFVBBNCfqDYh4jGrTRs3kjvxn72nsSPWA+MUUUEu5rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547593; c=relaxed/simple;
	bh=hOv5cDWUXPtG1yahyo6pzhmnH4Ks7c65TADdBXCaVOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4MOR9fQDkzi+zoh90ZBMpXsinbb2SJywE6j5gI7gf0qGP+8VHk2rgV1ZkFuWkLsRNEK5wMeXQdJBovdA0Vfw9uSE+SSeEWyvZkGU/ifOXZek77i/RmdCo30mWNQIwPhhDNXRoCaOOvuUFv9GHUNetrG+ewpbPg93akcXBZn8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlUVp8FQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlUVp8FQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so34718595e9.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547587; x=1792152387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZIo+hbBbh95/Ym6wzbahCH1ehdtPjKzs3eJGJE97JM=;
        b=LlUVp8FQ2MPyn6ZFghQagi1IXoAdvvWZX3b735EJI1KETnOaXFX1HSQiwBmgXQhBAc
         lO7mgmTX6ncK3rCjIi6RAPC+lzHc133N+3oQsaF+Bg33WJm0vjSJMZZOGFj2LFw0t1Vr
         Ozv0bmKBGCU7TE3nMFgJlWpzPQxjlwB0D2lHc+ZjXmrU0nc6IQNOhS0ZjyBe8i1Zqfvl
         1C0h2gqZ7sfbaJgJbUNUSvJxVBIeZU3WQdpqVyBXiuvrK4NLxwxsSEOgDRPvAB5JtUVo
         KO16HSMNWrFhriIr7s3+2Hez4qrhsM3qB8pqA1XZlVFsGYW2yDORNg671z6GsEz1AMJw
         dYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547587; x=1792152387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZIo+hbBbh95/Ym6wzbahCH1ehdtPjKzs3eJGJE97JM=;
        b=qW7iUJgoTf6M9jIXEr90EQbEOI2zG/6xFBW9Gkk8xsrO9psyl04N+NQ3bHVtG4+8DF
         T4SHzo3E1nsnnZiIeeSMUwhuTXG/TLXDCDacAiAy5DxXsp7Bl5gmQKg8WRigzTG9/TWU
         aDU/hR9sq3fRrzNdOko8kg5ndwcaLu2YiSW1pRXJwL8FNDuxR6CwQrheEY3RBRAJCyeC
         M+Nr38FFOK4tYY8OGO2foZUjuI5ls23cSIxuvc9E/p7D9pIL1vsP1bEZOWgNA350dvmu
         zCWQ2jgOzGVvvC2qARS1nWUTa1f6SsN5+2CsB+PTDBalFseZp3U1Ditz+eVaMMJbKTFR
         NXUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsnGo1xn2YrKPnYMDc/IpcUbkILnz3cSERREkJYiWzVEMNo5OHArO0Cj2QqjAu/WeUlWtdzBsrp/3G@vger.kernel.org
X-Gm-Message-State: AFuF++njz5tGQ+20qaTW0hHMv5MtQydHNCz2/ZOOfs6YQcUAjioO6o3a
	yz0m/3i0TpasEirWChRBQz4fvVcHRopUHkGB0PSjkz1y3hjYNImR4myg
X-Gm-Gg: AYBFou3e95ivQpUH+/4uU5N+VR4UmJ+WNC+3P2T5JkqbjbJPB4oHEQR+1rMKQBhxml6
	i7P/Zv88wOslQWnXZtPQbxd5UQP1AAJXhnR1L81QSXNFQ870YdKAQgKZgEN9/XTu4vuGF49rkok
	2K4WEa7g/kvmHjHcKME4KkvwKbtVMJodPXPgDm1p6VPi6C9q50MvHnZtoNY254l0cm/Xt+0DRT3
	kxqqrMGTGqimGo0afpTf2zSN45c3JSAlQa0U3EDhPCQsnTayyOoDxYtFi5PmgQQ38WFFemVUTb0
	TH6QK+kuyV9Bh+urAGlQgi+kBpLuTcAwAxjvp3Qxek0WSZ8mGKgTh/eiE3gYYsIqr81knaSBqjN
	uixUnBF8cMwsDkg0bQIjWnv0wAfFeq0t2h6KnPxKq5U7Q9VVQteR6YWMyUE/8azUmUmEhDAFzeY
	MIObE8BOqqNLKePnLJ8P98kmdC8ImvpubbowKYC/zFneB2rjmcpp3IuY4tqnV4mGsILn0n+6pxK
	XcMwhsUsxfCDjeTl3ieboVH//1+3UTJsRUlmr5WRjfoj+DVQy1QqRjvfCWiVgYqDgW52wEhDlsD
	rUZr3Qh9WhukhBUIDvLi2gUW2S+dAvYsWnyaR2pzOij4Hq8oFsF4cJiZ3T2MnELaDt37X8Loa0C
	+TgsZhVBDJeAapx33i14V97UsSmGfv1q/ttSjYpLC5UdT/TtBzC7bufwla/HV7e6cqQ==
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr31527275e9.23.1791547587405;
        Fri, 09 Oct 2026 05:06:27 -0700 (PDT)
Received: from systembl0wer (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bc6a484sm57732875e9.2.2026.10.09.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:06:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:06:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andrei Stancovici via B4 Relay
 <devnull+andrei.stancovici.analog.com@kernel.org>
Cc: andrei.stancovici@analog.com, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Beguin <liambeguin@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: lltc,ltc2497: add LTC2493
 support
Message-ID: <20261009140623.18920555@systembl0wer>
In-Reply-To: <20261009-submission-ltc2493-support-v1-v1-1-3dad1d4b152a@analog.com>
References: <20261009-submission-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com>
	<20261009-submission-ltc2493-support-v1-v1-1-3dad1d4b152a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 11:43:34 +0300
Andrei Stancovici via B4 Relay <devnull+andrei.stancovici.analog.com@kernel.org> wrote:

> From: Andrei Stancovici <andrei.stancovici@analog.com>
> 
> The LTC2493 is a 24-bit delta-sigma ADC with 4 single-ended or 2
> differential inputs and an I2C interface. Its channel map matches no
> part already listed, so it gets its own compatible rather than a
> fallback; no new property is needed.
> 
> Signed-off-by: Andrei Stancovici <andrei.stancovici@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
