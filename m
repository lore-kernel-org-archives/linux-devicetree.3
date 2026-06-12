Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890123E9C2B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270009; cv=none; b=eSGkcuMUeSXQ8i6Qsj+UBDqGDquYLEqu06rSJWHuocYqbNQ3kIFU4FsoAH50m+heXV2vxiujUGLoWq0Zr8EEcSyfX9sfcIxfiZqPXU9GBPSDLRbWcgj0C7ZsK7XZHCDYPO3Rz2TecDAONsdkiirn+/I+nS3GOCAcGeilKoHnO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270009; c=relaxed/simple;
	bh=yQ4GLYiZlXIERfb2uNDrs5hd4Co+jRQWqQhbxSg3fD8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvzt50xrlGmEu7IOYqPUAu5tcvpKmirdGXj3rEFO5QxMiTOBf4Ox0fT1gGKLuHas5/fnWY7AwbLZxezSqkZ/Jkph5vbYK8Y04A75+r5xhPVXaM0GjGJhhn2IK9ynuPM/S2It8k3061I65/adOnFOqO9l4GMc06JZ65EXz1fx3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyweUNcu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyweUNcu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eeea039ebso546730f8f.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270007; x=1781874807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWZhl2ivaLNFWdM8nq4/32ijqldiB4HiW95gGitIZc8=;
        b=UyweUNcu35ldyt2zJvK2mZkadh7q0mFw51czalvbxaBorx87AuIHf/9WTAlAA8OrVP
         ZOD7kWAzPi3VKWmm3y0pF0fQODcbv2GNZlh+11VDZ3tKyB9wwLT6tOStnvxbmrZz1LJ7
         huM1AxnV9D0PBOr4ANOyRY9A2Ix534JAlcsOQBxYKDcHJXRf16VnUWJgbCOQGigjLLLz
         z/POfROZPChXnProv1cePY0yjkPrncirpvFPEe8e80trz6U38antEET2xFZYx71Kxspw
         tXgSziItZ6VdXUPmeB4bszjbgNcAPJHYEMs9LIqHrvp0gULk+pQrvologjv6zHS/1Mxs
         otsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270007; x=1781874807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWZhl2ivaLNFWdM8nq4/32ijqldiB4HiW95gGitIZc8=;
        b=jT6Pla4o4LKxHc/Js4LALSTCopm7jaUjciZ4fOgZB6UxDKaEpGszdIEn3+ixtf2cpd
         ypr0M9eIm4qah24kq7/TKLFGIRQAaPjfbYoyV6IwPmuq7C//yBXcs8fJASK18JcIjhCL
         ZQirn155G5V7mzMCjQNOZVYCyRzTkdgJFs4mD+7O6ym0UbE8dEfn9OXoDQtUKTcZOrc6
         v8NHOJr1XGTk16pt6SOT79Bp8es/ECmY2Ta/QGOvr0KNaMtJKRA23xsnaF3ynGfz1+kS
         +QG5gXwtT+99dbebUcDE7x7w/6Q+oxI5kjC/VohM69YEO+/goGYhHlMLUDp2jzloUqeU
         RcnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f+nD/8qRqqpQqwxyLIAYMEijs6S//iCF17ulMLLFZxlcoRo9j1N5qlizsBJJAeNNHnoNQixlThzuE@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXVmNbaXyZmEtIUq1cgWaroKqR9IcVyoPKc+19sV+Sg4tQNbZ
	DViEBgkPJBIlWrMDzkPURmh0CtMGQRMktF5Onh3ZLlEWgikO5gAyvcio
X-Gm-Gg: Acq92OGtFckJf4cDAnKisFiyilGOF1qK7AXxugCX3w7cnX0qqHxmq2F8xxzDguSBDnj
	q9KKiekHCXpFExDWVCS5OiFnp9KQ9bE3OqKBzN13MEOu0MOwGj3TU6XT9+0dlx2ArYzKyJCKh/S
	az2Pu7nZmYG4F6gDmnK4voMj6S3ekCR14oPGex7vFqGp75ICUx+QJYz/CLHHUBauGcQ7W9xbmZp
	Vip94aQXi5CJulh1v/7eDJq7dqEx+XHMcWAC4M3jYQ/pgCwK66FjkAAO3839wAUp0eOcV8EYNvV
	OzB+91WdhGpzZanE8+kq3dHLUrvRhf0M4V0c4FzqY1/yaN29g8AN99p7Nw406qJ8idmCb4SP4mU
	Qh4vrtVQ5qRe1VQecR7xqMFeE38+FevWgJD0KFNefHS2iFGR4JnCS6XJzTb10MdyINaq/GKGNOe
	5nskxBN145gZ4/BPDnzKhpXmX0iaRfOYxdrOKQhKlf6FkhgrY+N66nyxVEQ74BfWppdzXLpj4wU
	TMfa4On84XJqckPW01QGbmNf22OPRF6DW4jV8dlkG5i5qDqrqIyqV59pL9+MVjFFQW4sC7sx3yj
	b9wr65SDq7ncM8WLgvEfhO9MlMLeyQ0nuave25ESyWEu/gacAvmPQKk7ic3Dijoxjw==
X-Received: by 2002:a5d:5d03:0:b0:460:1684:ba11 with SMTP id ffacd0b85a97d-4606da69cc5mr4514544f8f.15.1781270006792;
        Fri, 12 Jun 2026 06:13:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm6038265f8f.1.2026.06.12.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:13:26 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:13:24 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Siratul Islam <email@sirat.me>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: magnetometer: add QST QMC5883L
 Sensor
Message-ID: <20260612151324.0000704d@gmail.com>
In-Reply-To: <20260612124557.13750-3-email@sirat.me>
References: <20260612124557.13750-1-email@sirat.me>
	<20260612124557.13750-3-email@sirat.me>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jun 2026 18:45:26 +0600
Siratul Islam <email@sirat.me> wrote:

> +QST QMC5883L 3-Axis Magnetic Sensor
> +M:	Siratul Islam <email@sirat.me>
> +L:	linux-iio@vger.kernel.org

There's no point in having the IIO list in your MAINTAINERS
entry, get_maintainer.pl would return it automatically based
on the driver file's path.

-- 
Kind regards

CJD
