Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0040F74F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573953; cv=none; b=UsWmrY24qyZWva2HxhmYHmK3SXUc0CQEWUGN0W9uoDd4kWrARKIIceO15oHN9hbvLynhKYthp7KiifVEmAFVNMlkFsrVfzJ+NrERsUDmDyhabjUxF0fhEkneggxAs7xqRQsEqCt/9Nlb4eNe2hhZHiWPMCU835fvf1OSOeyHpRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573953; c=relaxed/simple;
	bh=oEmVoTqNwL4oExAHfGENpNbS+QESXn4HTPfAL2vKifQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9LXvbn78VIO9HWnvMFVqu9jjmBoaLQbZh7uxTHGsdpmdM7Nj66dUwIJ7JS9j466mDxD/Gjd7KRwmaRZuhM6wohs31k2DMQ420iXYSoe4Go9nmWfmAi0NcFRDs0XN3w31PQLsFGum8OnbKnxusKUkcaK29g55KRD6hNRNW0b//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXFQrC4P; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXFQrC4P"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1476054e0c.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787573951; x=1788178751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ActAKE3l7zo8+sdxPLWIoLXyxVVzOQ3YeANx3kA/65I=;
        b=bXFQrC4P7+uh7hya8oThpKVsciD4eO9zwqJPj16X3t5CxJRW/dpJuR3AJAxU6v9Z4E
         8zsIVuAQkgo1EMRqqsEFHEwuJeHGH5QaBhE+ki/QcBgEd+jfjOKlNCcMwOzZFLXlb18w
         AnaekO/hekdU8er4PavV43otomWwRV3sBEmSkU0vWG+JehkT9Wcv3mGYVYoW9O/ePx54
         aMRn9nyOe9PvS2HR5X4fOhom7TW95AAnLXi7O46jhiVZAjA8AtwCCENd4dcH0b5KdTna
         Q6tdjsgOOMMGsgAOxpPn+wx0LdJM56i9S8vPLXioa1iqN7QN1gHvHkPpiEU44DaOaRud
         4GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787573951; x=1788178751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ActAKE3l7zo8+sdxPLWIoLXyxVVzOQ3YeANx3kA/65I=;
        b=WhbYacbnxr6eW+Ms/nticBaFAMYGNxcGuhRillO+ycsIeVlvqFQnD4RkIR5xtqepg/
         Jg/2D/kdnRDaQpXrcTbKOu0ms/wVhjXPWYBlz1+GYhhDkLOSC+KaSkdBBNh6/8bz6BK/
         SWZNDG/bCsyKKbimv5yPtPxCTj95HdjPu8k7eTGZNji6AanYkzgvs5ZSQ2B9S+6ApZxi
         qUDHREiBhuBaB0k12UQrgyayGfYJpd4w1AKsASx6Q6ouwfYU9Nz/lApOWb80pNsdjdRH
         fTmSbHuPN34Ia9DCIzE2VvufwBacujH1z83JD1a2hTQnI+gm0nu0pzNWO74Gxze31ZtI
         jmEg==
X-Forwarded-Encrypted: i=1; AHgh+RpQXAxxo+fr5E27wVLL7AFAThiVDQgvkJ0Hndpjz76PvYscb4QpB4uQfXdGxxV25oxGQbnR2uXVf2cW@vger.kernel.org
X-Gm-Message-State: AFuF++m8pkoMck1hXQo6OjNAd/a9f6mJ+tjQFFRFvvXi3WTwWXUpsEIZ
	fzLuJXZTg6pl5qkshBLUoo9M5BemyAZhwc/xFXRDkEJoxm7oxjRzdCStRJH9Ufht
X-Gm-Gg: AR+sD11zBWCmo45mZdzIkPe1SIoGR1YYru3cGtkylErwsmIjoTDVtuXkgrPFJXtKpkG
	Srnv+Ys4zOL+CPgXZYmDVcbGZ3b1vVBDG7y0J4mj7hUfV4byffRFzQMuAXP1ziz+0a1PMeBTjwI
	yCw91q3jSW7tbxh6+YqCblmKS+Eh33opcIkS+S2r9Q5zxgt4BKvrJiBBESfrkU/suPCFzzAvVOu
	yqNfYJ/FKDVgG2v8scjKHYIcIYY/n82+0PzGqbJTNOgxE/vp+K5WOP/nW9phogpK+YYkDAUwkcC
	82l4GepMTO1Rx2NKwEjEcRqV3I6ScyOro9AJkYU1dHM/p0Qt0coxnO08T6x9bRKcxE4QjcGZkGP
	pDkYePZGOMCMNVX20xV2hOosuH0u0dnj8WrbcOh4U8kk+b4zVdkpbqwgc12JJAgybYt0JU64XVQ
	Dg8+LgXPDSM5df+FRrNWzkDQRmIOL01VRq8HSkeVBg5CrbRELKmXVQWlBVhmpdJUBky6bt
X-Received: by 2002:a05:6122:6610:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c5ff803054mr10905050e0c.5.1787573951106;
        Mon, 24 Aug 2026 05:19:11 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c8db56329sm4847385241.3.2026.08.24.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:19:10 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:52 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	linux@analog.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] iio: accel: adxl367: use regmap_assign_bits()
Message-ID: <aow26IMc3tpgzI7r@debian-BULLSEYE-live-builder-AMD64>
References: <20260821180753.4633-1-antoniu.miclaus@analog.com>
 <20260821180753.4633-4-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821180753.4633-4-antoniu.miclaus@analog.com>

On 08/21, Antoniu Miclaus wrote:
> Several helpers set or clear a fixed set of bits based on a boolean using
> the regmap_update_bits(reg, mask, en ? mask : 0) idiom. Replace these with
> regmap_assign_bits(), which expresses the same intent more concisely.
> 
> No functional change intended.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
