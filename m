Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC033A9EB
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970633; cv=pass; b=euiD5XyEc/Cyi1cVWWaJkPLZoyrReZou/kbzDAv8oneHmizIi+9ciiR+v9KIauo9bds8I0jyLNaX8J+e9z6g2EIBvhgxrxOtc7IhTOT9qNCSyKmEIeGxCo+dzoINTB2p/e0xLom9Y9gZDAIdk0xn0fZ8QaHGkANg2CM8nBgNhB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970633; c=relaxed/simple;
	bh=4N0XsN0VuRkZQnzr3+qSDKa3Co8A1IW1OZR2iyx6Je8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGZSXQuYKts6+kjuhdVcUJyzPQ5A1XrvU19L6ItqNBg7EpuHnZ3sfLA78JdDzgN6WJe6KQiHeFkJH0jlM1JZSOxYZYPbqJ/vBG1aghttWH0IOEjAcuB+b5JfwkBT8SQmL/InPMmiEdkVr/5FiBPsr2QjExqWlb3zomqTwRFoVTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ12Tt1b; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ12Tt1b"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso794340f8f.3
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778970631; cv=none;
        d=google.com; s=arc-20240605;
        b=FBn1LRJzztjPzs4cRmJLdkJDezeeoaAvJJjVHbnv+H1nBgQmb6CfUAz+oXy2ogyn2v
         4pUF64frMm3peA6J/6iK+gl2X5VtODg/norYjXn9fHrGRBPIYnyoTsJ4fG/FrhK1Ap6l
         0pjTGjqFvj+iIF4gJziW43izilmMNWdMycXHsujCrOsIjk7OBKMMlB/yqK+W6mEyy97j
         9XTt9+seRNL5NXF13V2Bts8wROQuPGlKzrdD9aE63e+u3kswxDp6HRiQ9XHk3mk4F1rc
         C0Pvw5Q9ER6f1eDstMkmDyXl4i9AGgdgoSck2v6EKDfS984zbE9zAKPjV+bmjXp2/o98
         12Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y5Yq0JJQpBu8DnC+ofcLBs/0uhKdeHTP9RImpArBW50=;
        fh=8nxTmSQDauuyKb1a5WkqJjXUHYT0ECKO+c3KfdaFIE4=;
        b=AxAcd9bPa76jkJ0adz832lft95Tc07S2Zmtl+TT4mQEMsyXQOgmsDk5zY96O4hR2on
         pOdMFALZsS4vZ8Z+3FemaGw9ueaI5ffVZNN08c1tK5F7I1m+Pb9tqRMdfqo2hM5IpFm4
         C4x5t9F0l0a57LPAk/3hRhNk9B3DLWQmO+7yXun2uQq8jm5cwGu87K5jaepgLkxDA6Ty
         rbn90lY1TkaW4LNHsGNV3DkRTBEpkOB83LZ4XEggFmZrnupEbmQNR5d36A0QkozgcdKo
         usNtHORiVa5ZEJHmBwoY5rLfcnFRkCs6mcjUFbRWE1OraXkn7QGC+7z0y3viRK7nulME
         FDuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970631; x=1779575431; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5Yq0JJQpBu8DnC+ofcLBs/0uhKdeHTP9RImpArBW50=;
        b=rQ12Tt1benHreEIJaKKS8xYQ8sOK/FiRHbcYzO/ntzsNWfdlikKiOwRFJH0xP7V9ZA
         nc+k60s0xHsEjXGj1XfNfJlzAGVKiyFq7qbGVfzBzPJBbTasCzMI3dCeMgkhxN+QdzvC
         K+v6768fNki52cJ94OOQXeq70gF1kq3eqY2XCAougjaOdf+NZumI4fpd6nW6KZ4Poul8
         SFy2CxeV4DWSLxiY2VkFeChD9/kUMCOyQSIsoFmTtZyAnUvzUDuDDDDU1ZVAEytu/LJW
         Ll1WzXrYLG0vygugUIs2YaVHwXS7IzxNwfw4/Xe68yOdhZ9D0YqEkimDhMCM1CR6mylj
         Zg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970631; x=1779575431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5Yq0JJQpBu8DnC+ofcLBs/0uhKdeHTP9RImpArBW50=;
        b=DowEFpmwepfQw5zTNT8s+eVgm4u+lzMlQmUyEp26x1HloUOI59Uup5v7omwOAPAQpG
         AR3BmohAQ9Hm/LihbGtXSv2cS1k8rB8dgcSyMSMbnmjXD1AOZT2DLDgjh3W79yuiuYGi
         ST8oj8witny/n58GmHS2Sct8BtOq0APhIlrYDLIbvO0wIYBGas2uEC00pRkrwMsqPMWG
         mbJuS4iCC4D4Ij5jI2PsCrPFtdl7B/wJzpuYPJmiereK9K96+MDk/vPJCbfti+HGtG/4
         P0uHM9GrD98rMoNdY4AY0tt4zi46M0vjdNzZ0BTIKh0DznTZRy1AeqdJ6XBt9cZP+9fs
         KPKA==
X-Forwarded-Encrypted: i=1; AFNElJ9/FaNfxl4+K23QqqaYP3NYhCCLb1sb1P8W+vFu7brdbooZoWoWol204Ssn5BTpC5jAga41pLHaSked@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXALnUqF93B0AlfaH2PvJTMKOxkC/9VkeLrLKTpAt/kD3Mqhm
	Hzp1WG3k+sVDE3lJhEVyuSYwJ5bddXNfbAjuakxqJ4hF5OsKfBLwRQ2/KY5OD/Fj4Sc7HoxjvcY
	TSrCfNR3vG9VCnDIIwwFoI3IvMPMcnk8=
X-Gm-Gg: Acq92OGnpicwOHpBTBbWSqYSkkoZptLV3+tY0eJLL7FLytfqUCYN6DhAcBLepmLuuoE
	vW8yReH21XeWd3MMbneahkQp7LedjxuOANN0RolqYm1mtfziYbo+rAb08FzXGslyPIN0bRZGMaV
	UW6bmd+uweR31GiEQnh+vXOypcJGuWcjLVDuMiMVTzg2pHhaekLulB378EDLN6T9Qjfeyr/p7+/
	rsp+x7xOzM2wHr9o6SPuGgtc6O2zNeYA6w/u2y1jqyEYpTVHg8cnDIhhR4WIXwDgSyp8SA0lmAS
	4X0clr4jsAjBrhG3eep7Fo/eZ4Mp86ScL4Ha5HxbyGiw9G4m/yAJSoCJQn75k5GFsFlKk7TuIqv
	UUocaHXjskbju3DyTFcwmnALJ9c18Q3LeF01etg80VYaI4naY+XjUkdj8j1WXxRNnR8Lu6BXZHn
	lBlu++17w=
X-Received: by 2002:a5d:588f:0:b0:43d:77e1:6a69 with SMTP id
 ffacd0b85a97d-45e5c5a4dbdmr12881250f8f.38.1778970630729; Sat, 16 May 2026
 15:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com> <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com>
In-Reply-To: <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 00:30:19 +0200
X-Gm-Features: AVHnY4Lpol2xQpPg-FvHpHXw4L9P-zNi4t7sdq2UPd7AtkX1kD3dRlVETsYARkU
Message-ID: <CALoEA-zCjGUnUfjUGLKgET-Vua_6MpsYpYWPfGf5xmZhBipCAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 May 2026 at 23:51, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> via I2C (SMBus compatible).
>
> Also add a new entry for said driver into Kconfig and Makefile.
>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Oops, Sashiko pointed out that I'm mixing goto with guard, will remove these in
V2.

-- 
Kind regards

CJD
