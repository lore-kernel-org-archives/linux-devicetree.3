Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CA29D268
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292268; cv=none; b=tWaBR9UpIz8CVVPMSbJ3birAbhLdbDx4t8bG56noGxGs75I46JrJOH9NURo8xX450ixP8/4VEw7Fhr7IS0oF9M5Q+gq+kV1ikUN+1DN61/P1cS532ay6NU/vzWCugzBImIvkOdIc/bXmEDXsoo1hNNTC77HpMgE/W1QUvUHgzys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292268; c=relaxed/simple;
	bh=67cQx5h5EfVqCG/fdK6oUL+AYJQaEpxH3q2e02Z+Ytw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PAmL+jszyyViCrPFcDdTnZebnB/EsGirgam6CqlBMsfmaUfhatYwfiC1wLYyOlRucqH9A5nprFVZUksWO+ZszMHKHiHY9Fbm1WGDqx1ywVhF+kLvtSPUh5zqkjyh2ATTaiX+KVRqHV+YeSYDYMSHY1RLpMicrB6FF9HgEGOJ4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW/+A+SF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW/+A+SF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837cd669be0so2030424b3a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778292266; x=1778897066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=90WqjeRA8ThNFX5d+11lotpk8MoHTD4XnnqbeBD8jm0=;
        b=XW/+A+SF2yz4v20/VK++5SBeu1GirwM6QB/R5K81x+NzC/YewyFFueMcWrl3N10OGl
         WP1kpx/HcMHo357+fTqHiUpxHA0qmmLrRBmCqKtcIVYmTJaT0/8tOfaV0LBO6CwU+eiU
         aP3jKRiWTv4xcfzV7xhuuPi52ujyLW9kM/5GBtu331qYbuycWwv7BpiZQGFBDOwC+77D
         uRvV6lzJB9R1xQSSbDHrIYKY/IPMgcJfNMZC0k/QACLAQoD7PgirRtupwE7tziTUuFBg
         iVOnwPYoJpX+SG5AbcXsXGEe8E+86iX6oKihdk0pMGK4sJvnqLbypOq2/VxlPna3w0Vc
         e6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778292266; x=1778897066;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90WqjeRA8ThNFX5d+11lotpk8MoHTD4XnnqbeBD8jm0=;
        b=WeKQmv9rZFrOOsQQVtR+ENeDcO4eXwHeRuOZUIqLNVFfoc4NaKAxib1OfTXOJYAc0r
         4082bfhn+lE8kd0HMw1pY3i77SgHkzJ5rhL87dW0GodqLO1RqDDExEjNKFZJ0rPs6+0a
         sixhjd65TOJESQ0CCgG4q245VPU/Wz9V7mVsRSgvKM69U8qJ+Entsh+WH3uQrPq/I1MH
         BpbR73RGLWXjURat4QhpVPeW1pheqWu2Gkkt+7hIicsjuTXgg7Lfl+7hdBEtZpFmnku1
         +KHgh+ot1xxvkt2VfQY3JLJsKOWlop5Mxz9JeSS2kGrZ9IXKsRIS6dnyFeJ/Eyb/kY3U
         1cUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AxjVBHMspeY/HuqbNnu42KCPh47vlFoxdDomR2wug5IckPxAjxTT8lhhVD7g/efg0y1itZE8w11MN@vger.kernel.org
X-Gm-Message-State: AOJu0YxLqUuvnQnksDSFvggnYnTKZkNoJTq4uYDQ8eUjPuyB6ZSa/Lw2
	hAyaQzNq5tPxRHP01JfdpkLD2Hb/mvsX+YPw5SnXVrndQuq4E9my73E+
X-Gm-Gg: AeBDiesFDuz2hZNnFfJGxoxoI8e4W2GJ4qRvs/dNMAis+qoh45HleCQWmWKSfoF4g30
	q49NhQuACRQ5PjBt1OtcszhToz0OPI+0nFWO+qoKXdetNrLxOozLO4u1BvyqPVMGyBupbyj6Vj6
	V6RGmxj3ZbAAYq2CLrqZUJS8cKVjdhMMY4rOTk9IrZsmGG2jTUOgVSRz22dbnP8NXDu2653e1Xc
	IN7tdKr6HWpoIxT+YNtCOoxV8lu15ux+efvYZO0bG3sKTQW/IYaFv2KVnFMbNGaI9fSXFv1NciS
	1GoxQUgxS11BKPOs9ZstQLvHxoTntM+mfKsNvTUl4SheCf3dex0tCglQoSIFonrIv/AsKQ68Esl
	P5cMoCyIzzmL3mzvugSqb56niGLYRjjxibA+AzQKq7CKSI5aOcbEYDxYhV9YXgSRSFzHjhLOj5F
	lPU4soNs3ItK4R5u0Nutd5Euejy6Ht4BwrNOjtMV6P/zwBNV0=
X-Received: by 2002:a05:6a00:8014:b0:82c:2555:b9b2 with SMTP id d2e1a72fcca58-83a5b6d0a28mr15321522b3a.10.1778292266253;
        Fri, 08 May 2026 19:04:26 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:791b:cfa1:9b60:879e:786b:b8d8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a088fsm13566241b3a.58.2026.05.08.19.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 19:04:25 -0700 (PDT)
Date: Sat, 09 May 2026 07:34:17 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
CC: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_0/1=5D_dt-bindings=3A_iio=3A_?=
 =?US-ASCII?Q?adc=3A_add_AD7816/AD7817/AD7818_binding?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260508231147.77044-1-dennylin0707@gmail.com>
References: <20260508231147.77044-1-dennylin0707@gmail.com>
Message-ID: <0D2B5076-A5D7-4D14-B58B-E500585DD465@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9 May 2026 4:41:46=E2=80=AFam IST, Hungyu Lin <dennylin0707@gmail=2Ecom=
> wrote:
>v2:
>- Fix commit message to match binding requirements
>
Hi,

Thank you for the change=2E

Ideally, multiple logical changes should be split into series=2E For a sin=
gle patch you can include changelog like this:

Signed-off-by: =2E=2E=2E=2E
---
Changes in v2:
- Fix commit message to match binding requirements
---
 =2E=2E=2E/bindings=2E=2E
         | 94 +++++++++++++++++++

If reviewer specifically asked to update commit message, you can mention i=
n the changelog as well=2E for examle:

- Fix commit message based on input from <Reviewer Name>

Replace <Reviewer Name> with the actual reviewer=2E

>Hungyu Lin (1):
>  dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
>
> =2E=2E=2E/bindings/iio/adc/adi,ad7816=2Eyaml          | 94 +++++++++++++=
++++++
> 1 file changed, 94 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816=
=2Eyaml
>
