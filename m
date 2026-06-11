Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF183630BE
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189347; cv=none; b=VdNuM1WmSqCaLvmFKuFgI5N3H7162LWudBv6rbavHkLoVUBSLxibkp34tC7xrGeKySpY4xhOiSwsQjcTbMPYqZUFUxbXdu0DR9o9cmsgWHz2KkJjbxrJ4ozgtL3g8hGNI6X9Dm4T/IwDCsScyRYbF8y3Dm74ZJAkA6o4EPb+7g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189347; c=relaxed/simple;
	bh=5Jdv+qCy8zGDihWvfKYhvg09vaPh6PSRvuRMV0IHP6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mC6O78LO/IKLRCeaDm/HvpjMpKZLiKfu3lfrP23TwcDRdheEe2yx54+fqi4tyMb22oEiu2LRHm2ikbhKI/sOdqFrlvL/CYdYC3YEFC/3u0AmvwgE7Ptu/pYYNphISyl0BU4PdEdRiBAF9lQuJpLApuIvw6PmZPiE5sxq2lLQGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAQz4h3r; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAQz4h3r"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-517760dc3c2so50450791cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781189345; x=1781794145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Jdv+qCy8zGDihWvfKYhvg09vaPh6PSRvuRMV0IHP6s=;
        b=AAQz4h3ri9Va7tlhhWJ2PTkYlRwIo/B+HAMDrmeK8xzum6DxlR8E0RzzQQsB2dsWnY
         S4BTQsmSpeAaeeae3aw8lPYUk9XhPlBWMolPtKcVUua11qCPOrqGnZO8aM32V4v2M5ca
         vH1s82JGxIn+blnB9F5rRIBXCAJuuAvOPPNIAcwTe3VppPEMGNfo4Wr+SlDJvSHOnEMm
         tISqPN8X6UnSu2uZ11iRVOnL3GYZ7e/Xbl8GDhTtxYzmjPMGrSYwCsXwOOfbu09zqBHY
         eIW+dREysFGL27rYepVtGiRpymyhiLOxKTsXkKCw3UosOLufj2cmG4JXUoHZlyN1nZav
         /vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781189345; x=1781794145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Jdv+qCy8zGDihWvfKYhvg09vaPh6PSRvuRMV0IHP6s=;
        b=UQjyRjE2pUpyiymyrkOkxGEy5GGCgwjrEMagipez2tUg9ZJKhRq6ZMM7IeZmUJRubV
         +m6+1OmcRLlHYH4QB65PmOrRt8huCdT3QTPZY6nIgF9NgyLP4BFx8dTsYgJNxD+k1/Uz
         k1Q4rIoAPC0hTWbIPohazxqLKWCsA+W0pCLZsOsVPEHxY3DmzI5dIdhAsKZDJZSVLfTi
         3Sp6cjX4SqgFv4FZWd0lSCvmLGyLuPaRRrgWSJBQsVVsoDxoFf/xQsvUB3u+0NWvLuI+
         YVKBdHCTJLWTWgCTbNXIsWCkEttYXLZzROWSEsh9vQTOa2KxaBqs/ecqOvkRPlT9pw1M
         StNw==
X-Forwarded-Encrypted: i=1; AFNElJ9tqyLfbO/cduHBJaaN2zDSUKoEjZLFGwglM9SEr+K2agyCU4F5f90fxFxqMvGtqCCdESODkmTDDiLy@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtyfJ1MNPiBC6X2r0jXSz2skSwI985qiUEOV7OJ1zK2eF7hBQ
	guAhDSz0sq3SXFYI9Ii9zd75CZChY0Dy8zuWU6YjV+az4tQ1qkfqyADT
X-Gm-Gg: Acq92OEfOlzx7rp21tzMj8WMLAtKZSVDB8USighjkUTNdr5t62McyPE4M80AgksuAik
	0cjGCVtHYrborxCMp7bhRr2mliX2WoXbceEVSpd9wjnal3XU51YZ2FSqW3O0d43oriJimUPbg7v
	yvwiVyGpg1Dlq9WOh/9mZMdpbPuRQn4mxXqdWX+gwoFvFFz5LhCaLQuNQZipff6+Q0ZOROhMJ1W
	M4bCf9rzv9PcD8QKVh6bv1EAfKw05VO8BVwYAwRFUi+pJ6geOS+uvNg5SWh7P7c5KVaCjO8oD+I
	DzrccDq0SqKIwGzK/YQk2vTj+rRcZoTD18wpI3TZtRrbRrDXZVN4+73Qa/iIvfd9Ru7QVCK/gcS
	nAxH0orVFk5Ps1bj97gUjmBW8hHjCBWV6X72d2BbVrbEaAkNTGeoAPYlic2QxaR8c//Z9I8skAL
	rBpj3HY5nzwnQPjx3fzdJlxVoULb/CNr9IU9QXNmq3uRi4wRxITtEfitb/KQ==
X-Received: by 2002:a05:622a:118d:b0:517:675f:3ee8 with SMTP id d75a77b69052e-517edd0f6a9mr47526821cf.12.1781189345268;
        Thu, 11 Jun 2026 07:49:05 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eaf98e6esm19187806d6.39.2026.06.11.07.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:49:04 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:48:57 -0400
From: Louis Adamian <adamianlouis@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: pressure: Add MS5637
Message-ID: <20260611104857.6efb5326@louisarchdesktop>
In-Reply-To: <20260610-broadness-unraveled-b5187dcb2fb8@spud>
References: <20260610020458.104818-1-adamianlouis@gmail.com>
	<20260610020458.104818-2-adamianlouis@gmail.com>
	<20260610-broadness-unraveled-b5187dcb2fb8@spud>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026 17:45:52 +0100
Conor Dooley <conor@kernel.org> wrote:
> I think this should be made clear by use of fallbacks, or being marked
> deprecated with a comment.
I will mark the generic compatibles as deprecated with a comment noting
that they previously all received the ms5637-02ba compensation
(following solomon,ssd1307fb.yaml).

Thanks,
Louis
