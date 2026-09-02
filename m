Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B5403AFA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338868; cv=pass; b=Twyb6mh5zWrVYwEu/VgeaSpYERLF4zRq2huEuZAYf4ELCXtDlm2zZysSWnXhk4UjF/ftb8ALZdit7eCR40YKU6q28GwW0OyJ4uNOU4M4No0hrFyCTtWXM8/hxC5bxdEs1BSoHDhla1Up2av6pqFMP5d1+PAd2jX1Kn1UnF9udao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338868; c=relaxed/simple;
	bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoVSSYpRX6rm7pSpIT0rsHvFOu18PaWlML5vTBtiS/Jx8mG7D/1ibBk2ue9vTlvHTzZP+vKm6nKUAe8kgTCnnkXj+fTtWdvMtx4aBc5/ZF9WGJsq4XbHVvJXKCEo16t4C+whjcrzSfR1n5SsOODTxYl33ujyT+t9V4qMquHnIKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJbzAr7h; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJbzAr7h"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1b233ca8dso370723eaf.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338865; cv=none;
        d=google.com; s=arc-20260327;
        b=JsiiEhdT/QNVodl8XOh5T0DkzHdBla/jgIhVPB0lzErWfP96HGwyGYNCAHgjLIN0tm
         kQy683v56G9BY5ClwlOFb1c0ZE3rJ7EQ/T0id8dnr56YXuc0h4O5bGFNB2ZKGpXOJjGG
         84dKJpH+YzMcCONb/kNYGZZ6lAxMomsVqTyelEfgrJFDAu5SdJilDTMyP4+Zg4fl7AVq
         Pkfj2BnQYf6qPiXmlIxjw3RudEs71caf0VlrJjqFuHY2Ck0F54OJVxYmCt7gfrya9foK
         Y3fsJS1XUPyvHlIc+vrXIV/kZvO0cB/GOnEMa8bqQOpYVNy2UpCRN0cWrqRDCCR2l+uN
         6Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        fh=XN1YjoVGbooawXPfinrf2IbS3BFaJkNQIjlaYv7n7fI=;
        b=jtrqYouV3DddE+0WcgRvLeP42qZU9vYOvAxrKs7/DJfmthJtKO+xO3ndUF9IUCC6il
         iaTfkhyZrsnm7KGBzEfQZf7qldGoXw0cRjys14kv43C5XOzBupOs1yRLESJAyJt7Ukfo
         G/2csrTc+k6CtfiEwyyZuwZiPy3fBVSU/7grTGm40Yb/6tA7xwBg+7+43QoApXNNmwxr
         yxpaXR27H+trn9NII/mTcqstDnWtgvdPaY76rBZi9qi//T/dBy44kUn3DIL+GEZlUBu7
         FMw2Jmsv42GHYyWo/H/IHlqKwg9rB4sBev/z9tRMDp49DzFv4/bVmHesOyQFWHVq4jI+
         EgbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338865; x=1788943665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        b=DJbzAr7haKWxdqnUc70Phg+eixPYvwnJFoYIB+xzF5o/Erx23EGd9w664afgzl8p59
         fuClszgTLBm41FkOw2h62NZWk+Kq5Lzo1zJ7xZ9MmqPwgaMZ2cUYw8RFNGIQHYVFu0bI
         15R39hACUIh1bhKHHzIwu+A0QKnCCziOlfY37LID7sp1CK8mOQasRwqHTNnd7K8IhO8D
         /5sbx5rq+byqgugzcphFqJjnb7ak0+mldNmNbBBS+GHNg/IMzdqq8aatb8cqgsh1nyx1
         7DWyB+aJI2HoBcpsfFNK05uP9bDZejngLkaJpPtsIFzu7UNlWuWPjrDH17y9qNFSRGIk
         KpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338865; x=1788943665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        b=n8Ny0qQmd82GCnDCREJIVQZm0lUi5JrZFKSqOyCeUEZr1slUECYZf5bZrELheApcWm
         /WqW/ZplyVw9m+j8dLUbOYV7uYeq5NtHYSOb+ATt8fiR4i2BeNXCXGgDrIymQpgAMMI7
         l+3EtczUW0o4LrFVIzznyOHtuuqH8qQsGvLXc/G1A8UHnoWQc0z4KJRBwdiXbswBkswO
         xOXHOK3AVJV/Nb61BwVeqCVS6j8gn5nqFOmjwP4x3JzTz06QH29jxMtBYK4gx1JdhHjD
         Mylgt3Y2kMeddb7TzB4C6VOuBQpa7crN20TCNaI19ecka/wEiR1bGX0S0+CraUuoAw6E
         7dzg==
X-Forwarded-Encrypted: i=1; AHgh+RrJpj+JxYt5bAED4g3AZfGpDCUJjv944zLSzNUHem52R1Erp2fa83pkgm+cY0GyFVtIVmZZ7UZOvHG9@vger.kernel.org
X-Gm-Message-State: AFuF++nt93kw6ooUJpDbvIiQLbLwaB434XXutmDHOQ9f9nJXmiCwqRxq
	WKBFDUn50AnwFJBpKyr7ECMvY0raHwVwEGJp2wpt3i9PqMOdfvt7rvnefDjL6aAP5v7DPHKP+Hd
	WAJ7mgkR3w5Z1EUBoSXaFmUAGzZP6iU8=
X-Gm-Gg: AR+sD13O5fSYERNAzgkGyEMGLv2kBXLUmhBHLswNqyc5xCS2QUvTJOsBCiUopUCr6zJ
	5/VALqePnyHFOoFWX5im2gh5DUHuhrMQCShOqnlWGVVRUsVcPc+kWFUFunwu3IMM0QwXUydKim2
	WfBm4eck7hT3Dav7uXlSy8Y+KsM+Akx/iOpBl4PkvHWCs7xLv9QqrOyJu+CUrBp2gcbTJwyGpIk
	e3+z4RcFfOIT8WLO8+Y+ZBmCC1T6G2tBUV76nphWeWmrMX6B/K6zFwLBgcWn6heHR5k9YdAJzE1
	IiYLlJ3OOzSCFooU66GZkkQ+rFdWPUJSaeW/PBVa45Aqo9jfraFEawCb640KV6Fa+poHBzPKUUY
	OZQ==
X-Received: by 2002:a05:6820:189a:b0:6b3:68a9:79e5 with SMTP id
 006d021491bc7-6b47edceea1mr2290029eaf.6.1788338865560; Wed, 02 Sep 2026
 01:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-7-amit.barzilai22@gmail.com> <20260823113402.D7F9F1F000E9@smtp.kernel.org>
In-Reply-To: <20260823113402.D7F9F1F000E9@smtp.kernel.org>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Wed, 2 Sep 2026 11:47:33 +0300
X-Gm-Features: AcwNN1Vo44MBmJfOcBB8zzBfrsBJUHYQroJ08viZBYwnFe3YB46ZksIwW3AFHfo
Message-ID: <CAOEgbEqhvoz-J0o08_igTAJdfEHN6vZcxgd72An=BKO2L2jhOQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
To: sashiko-reviews@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 2:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> Will this cause a DMA fault on stack memory? Callers like ssd130x_write_c=
md()
> allocate the command array on the kernel stack (e.g. u8 buf[8]). Passing
> cmd + 1 to ssd130x_write_data() results in a regmap_bulk_write(). On SPI
> devices, this passes the buffer directly to the SPI DMA engine. Because
> vmalloc-backed kernel stacks forbid DMA, this might cause an immediate
> kernel panic or fault during device probe and runtime updates.

This looks like a false positive. regmap_bulk_write() does not pass the cal=
ler's
buffer to the bus. Since the map has a bus and val_bits is 8,
map->format.parse_inplace is non-NULL, so regmap_bulk_write() takes the
branch that kmemdup()s the data into a slab-allocated buffer and passes tha=
t
to regmap_raw_write(). Slab memory is DMA-safe, and the caller's buffer is
only ever read via memcpy(). The finding would be valid if the driver calle=
d
regmap_raw_write() or regmap_noinc_write() directly, since those can hand
the pointer straight to bus->gather_write() and into spi_transfer.tx_buf,
but it doesn't.
