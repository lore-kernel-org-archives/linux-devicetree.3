Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BA3932C2
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216786; cv=none; b=jfi5uIbEBF4wCFgnHejJl3kd5X+j/D5pj4OViS0Q8UnKkR4pAfRrXO5IVZYe1dcvvayLxFQxDhFAs6rvH/X26iwmkUcBNOJwLNN7PLdDj4hHorizHAbgQDu3lrANB44cEzFDhFjGE5pOOq4gtZVr70wJtLT34ts8V6KsiEvCKuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216786; c=relaxed/simple;
	bh=P3dIQtl58vlK4vCvVGpo8bRmfchguwl0fdNJtOmLjU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv/AVDO5b9K612qFz985IXggfEGBh3Ngj9pmfNSOudyvrJwmCPTgY3Vw+uNxn0JjyGkzp4L2ZwuAm/bldpyzapCP1FHIt46i8spSjjGuE3lmypB7e3ABp9SZ00zLPpx8T2mkBREe4L+2YgXFTvr3GtQyNhsLPM4Ev5ujwr7BHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck7CtFlJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck7CtFlJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so266898f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216783; x=1792821583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YTnAJbuDLYQXb15/j1+EJM9ZwYexvHGmO5mPLB8bd4=;
        b=Ck7CtFlJu8xLO15U+xw9yDDipRWoLY42+accE5BtY+x0umc06+S6qWUDdHdN3G6U+b
         9tNmcqXNUiQ+N3vGFxIZ+xwOGsvRQq6zsNUihk7+moLH/v6ZEUIqthalOKPUkcB0Z8c9
         2rVT+1SwBwvFojXHf1AzZLZFZtrkFNlEnedLmq78YBplfMoFgUk77wCD06FPG+ON7KwY
         NpwjNlkHZkkfUasSoBBbTOPqH1irgTBKbDkjwaHomh6SYtHyFOdGU0NaDTgkRhw8qk64
         D5208c34wXrhw8ZlU8Ky5tSRsBxiv/SnMuqLrCcwzVZ2kOO3DbtBhLy1MR1wdbgAdIbl
         BgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216783; x=1792821583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YTnAJbuDLYQXb15/j1+EJM9ZwYexvHGmO5mPLB8bd4=;
        b=KE/YwWvstqnxu8Zjgx3L2iIrU7l3GiB6rELjY+Sk7uINS0hxS2f9kxZk8bDDD2x+p6
         bAn+61n4E8pupwqvfMYjp5G1qaOZR7uzzgQ5lClVOzvAJR2qOW11h9BkRHvuTCM/GtOd
         HfswNuh1g+NT0HczjJryIZ8ZCA/4GK6TxGdRPPqKaA08rs+yuLwDsrOyCXW/CvAqYgF6
         GpTzHVZYQ866sLzYHZ3gM5UfY68yipoLcNQwAgmVRhwD3BfaiQ8tlWaO7SSwV6b09WkH
         lZ8FLje+ePLxbXvaay1C9U1vuOtiW8MN54J83P0LVOysY+IYGGL1WoNwe1udWhvXo3L9
         6Udg==
X-Forwarded-Encrypted: i=1; AKwUvBx1rsSl5hpHEeeP4APtcPmZpTr9zGuzpR/BMbXHSwpdf6inaMvPFDr2vGDctauF/8ikBkr2E+f/k1Nz@vger.kernel.org
X-Gm-Message-State: AFq9FYKS1NBMMtw3P9RI6PZf8qtjzbOaBakGhsrQ8+3GxFvJxX9XR2uo
	mMoDwEnbVYhyyfMBeeOCIXefxrwWmnnwKTVYbeVy02g87Y3qdNQnynAu5Se5Wg==
X-Gm-Gg: AYBFou2W7AzHTc+RQRjt99MlnUbGJ/7lOIPtQ3pAghGqUXX7qUGz16xDIAfYECfBfSI
	hsfqCmCuem1FnppKO/dKr8NRSKaAN4rTxS/ku9F0a0Tn7zL2zkHAC+fBc6UF5fF6lVzUS+JJse/
	kVgJTAmqDdirxp0Gmbw/7rhJtMcnoBidNR0PkmKTftKE39L0GBsNr1b79H5/cnEvx1rDutA7/xD
	fuN7cjPeN6mvt5TWiXFyyj2c9w+bXOQRcsF7GPvJ6IqVPn6ccLzTrtl9/UazBmhkRHlrGh+4f7Z
	2oW8wetb79w3cuVF9b9NO/713ObIeXZ82tg0+YHfJuaCuPILpVjbG1jmE6mNOzNmGtz8faHMX3v
	IeZkkC1kGUgO0/EE6c4m7FajoyGX6HmaXuQNdGXRTvJ72b1Nah6OFfGCOGXwetQNUiLNihYyEZV
	xu2nrvrI0RKhDOMeWKyUIYRkT+JOAo4rQIIrrXqFySicRTllxLw47ErC6m3y7uskj/Gc02WtavN
	7WC3H2ZUUO4oA7FnetDVA0b+wkQNfGgJd+lg92dv0pXix8U0ukBhY05b2TyxORi5r2fdsl1Iyz4
	uDNhnmqG68a9mge82YfRR6jdvIkjLbQpHc1HDR/bvtIF0QqyBHLWSOfAxUBgzuQjAw6BRhb8isj
	onDDv8d6iQSwlv/izW4yC978L/62s3UZnKjS8rRGwFH9e7JcMz2YmII9G80vjyqlGbq5RqaKD4Q
	Y5kR4=
X-Received: by 2002:a05:600c:4f94:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a1d76086damr33196555e9.30.1792216783026;
        Fri, 16 Oct 2026 22:59:43 -0700 (PDT)
Received: from systembl0wer (109-81-110-61.rct.o2.cz. [109.81.110.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm45595395e9.3.2026.10.16.22.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:59:42 -0700 (PDT)
Date: Sat, 17 Oct 2026 07:59:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v5 09/15] iio: adc: ad4134: Support buffered data read
Message-ID: <20261017075939.7c9a8bb5@systembl0wer>
In-Reply-To: <dcc159585f0af92c145569331063bc867efeda8a.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
	<dcc159585f0af92c145569331063bc867efeda8a.1792200021.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 22:59:00 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Enable users to run buffered data captures triggered by IIO trigger device.
> Add an IIO timestamp channel so each data scan is provided with measurement
> time information. Require single-read operations to be in IIO device direct
> access mode to prevent buffered and single-shot data captures to disrupt
> each other.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
