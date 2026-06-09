Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159A23EFFC1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000771; cv=none; b=BMF8bO3cu0kczLaxjuxQblzN/Ydl9Cr6Td0N06a3Ofb7/mzrGfHc/ob1SCRctdt6fuxIj8upsGfpkKOYE9cIv3Mweyeo52qh5wPrFY5nz2sM6I4dKa/KhmCvYe/nnEGqZXuH5jIiCOCbSFSjncEhrG4N4bY2r4rtKOHjxaCrPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000771; c=relaxed/simple;
	bh=CvjWP4qfaUy4Vu+fDzXdcGiVNmiLKemDkKshBGQW93w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oePzH6cccskuiKD7xBeMlkY8xCFA+zo3f7T8NWl203PwN1Jto0QyMP+eVfKWQVT0n11EYzWCNhMCBlpftCwuFV6S5ieahJgR8V6en+Ei9sM0dXZeiHAXqBi5SgGjljYscO3mfzVT+9t9kjz+c1JzmtrZAsv8YioeZsUlP4uPRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG5GqU2M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG5GqU2M"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46015dc517aso4304736f8f.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781000767; x=1781605567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7DTan2GpF6A2ycsVVtBoKDWhROO13NhyoThWfu3oNA=;
        b=lG5GqU2M9gegkg9vFEFFMnkpnVwp1jbANzRWvLajAMLdRMO/9Hhc3V1U1cEKsLCK0U
         S1xaig0sweqAdOVpXG7wjQp+/9NVR5wEsevopKt1+x4E+LfXkR+WolseLKDfCbDvPFIi
         UozLQpUXgmlxdSw1+Bu5IMpEC2gg1G37UMom+vaTY4OMhfBwIRVUH/diMxMfC6yOXLl1
         qbQ9pcpDCwuJp7l1UnjW2mc8otAej/rzHDGBpCYyfBGRjl26ZOPqN3WvY5glzVuHzYp3
         MQCFhQtZ7KMx0DW1WBqxAKVOsrws6F2/Ld4rgzUK1nxo56/H6sFhivbfbuNPdEJ22eWQ
         ZKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000767; x=1781605567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7DTan2GpF6A2ycsVVtBoKDWhROO13NhyoThWfu3oNA=;
        b=oycV16GNC+eMIKGbIsbyWwKxR5nyrX+hzDvaOFPxETtQn823sqgsnPqQtuXjBAtJyi
         w6GivgGdT6fW/f7PpNq9ePH2Bc7xW7dCIudgmjU+wmLuvJwN2XuYt3IjdsIYQZPVyBT1
         L8A+Wfnn2AIdbZbX5lpbauSQwX2kAmTDwjVuRDTmSnU1jDUhuPXxZwt3gbVmiZNNdIXG
         XFozX3N7WPx9yaw4uNUmsoGtZBTCiSeF2ZVbyRlIpP9F0wwZtiSN2cO14tBBNdHK3Ci+
         upfP2YMpOQgHng7DngMMGozuKUqn5G0hjcWUGGR4xQUuqj8/SqcV+VThzoaAUzOMQbya
         fUwA==
X-Forwarded-Encrypted: i=1; AFNElJ8W5hT2U58xhG0encj0kXKdK9RkT+E8BJGREbEUSSjMBSvKrFBu2PLmeXKCJBzpP8tCHO/KYRAHC5UH@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPICJwfUnE20bcv5g0LsMo5Mck4Pr27WqHrH2/MhP7tT3OpYc
	YqKQ4M6Gn+gos//qXSPQzTM5+0eSurzbZTSZHnDEyu11m/jAewLQ3pqa
X-Gm-Gg: Acq92OGwzZBT+I6SqWPfGb5LDdPbMNyMNxEyDBY8vbEFSMG2GBWw8XmpOP3IUleRifr
	Du/4/mY2cAQ684g3o2QJ6h/qA3Xc7E4TXrXjjn7ffRGuzDSwT7nmoewk3yZMPC5SSywvaffQszQ
	LsPe+1Cvna7o7/7vbun2ftmjHVjkVa9XqvXjqn2Jza1jUVONp1iM7fRqVOvyQxqMzTsPDmso8Ew
	i/dYHuZ5c4CL6iXi8kxKkOcUeNZPP2Nd4Am2/iYUknJJAlSGth1Hij8XjNm1khDBgmCA9Nv6KeM
	ELqS4AAIVNK1pOHYfyx6bXGukRH5OZVKNu4tJIad0hGXudGb0YCdkBbOgX6BKj08NZ0dXIc0Rro
	LjrkqUuslVf3+ZJ97QM7Mxl+HAhEJMqMitdE1uux/UvchPpH3kJ8vIcjTTHu/vJCJBM/gWj1zeN
	3gQYaSIehq/JrQRu9HLdStWMZIW7fuA/i/3uVkHGC2fXpFPpS9yB+qXDUkVyeX4gznvnQKGn3yX
	LbOg1YTUIiHqbOQFUerR4d0nyQBvh2yHHnKa7CVDXarYmsUQigbtrqeoM++hUvCOM4hG4VxG5hY
	Nma8piJegk0z75ZYzmdIbXOYZyGTowSByj3UnocV3a1R/Fa1T85DUnkKgOwmso/tfwTZ4e+8W67
	M
X-Received: by 2002:a05:600c:4e43:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490c25d24f4mr315035765e9.30.1781000767236;
        Tue, 09 Jun 2026 03:26:07 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm543448335e9.1.2026.06.09.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:26:07 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:26:05 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Michael
 Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 11/12] iio: dac: ad5686: write_raw: use
 guard(mutex)()
Message-ID: <20260609122605.000010b9@gmail.com>
In-Reply-To: <20260609-ad5686-new-features-v2-11-70b423f5c76d@analog.com>
References: <20260609-ad5686-new-features-v2-0-70b423f5c76d@analog.com>
	<20260609-ad5686-new-features-v2-11-70b423f5c76d@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Jun 2026 11:13:06 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Use guarded mutex lock to facilitate code review when adding new
> attributes. This will allow for early returns, avoiding error-prone
> locking and unlocking in error paths. Gain-control support will add
> the scale attribute.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

Althoug <linux/cleanup.h> is included in <linux/device.h>, it's better
to explicitly add the include for it as IIO drivers are currently being
moved away from these catch-all headers.

With that fixed,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
