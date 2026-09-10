Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664524825A8
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070469; cv=none; b=FezRzE4vZVyb8uP0usPi6bKTL5q8ajSyacq5o8NsnIIgOZIaXzqhIYk7c1gI5tU9SYf6sFXbbQ4PxiNheXy4uLXTCrMItiTIkUm1SNgXX9m1fcynVjY6HSWIaOH7xrNeuFefpAAegjGhAOT9UVDEHnpWHl08PS2W/QnBQN0cOoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070469; c=relaxed/simple;
	bh=+EaRlpTj1R6GDSMIQEBaTdrHPWAUOhK4v0G+2f0OA10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ei65Tv+pY1g6QBur8aZd+GyER8P1y/Li9kIScCWQUC3jR5K44lnwhO1rZHPGVBRHLKxl3cgbTglBUCVDK1xQY0CIBslxmfLk5rhKku70mDSUNmBV9IiJjFoMONXE66aioXDE8s+sG4fgSOx38x3yolaRKSYBYBCBM2OtG9bdpvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWgljTv6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWgljTv6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso2680185e9.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070464; x=1789675264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EaRlpTj1R6GDSMIQEBaTdrHPWAUOhK4v0G+2f0OA10=;
        b=PWgljTv6VfENaNCYWj03P4Qvaq3SqBjmpSflDweCRAjsvCt62k0de3RM1RuRQoYyq5
         8mSx8IEUKs2Vw9diNcX/WRQVaIQNVogwaOecUKxwUFG/qeXhVq/zwARixnVSTUhMY68N
         Dg3i/oBJbtJn4vkz199P/sbXEXRYa3a1mQKm2BFc9CeVzDMcZ9AOxCbs5gewAYmnGolZ
         tEO7wrRJSslobfzchs79h/7hYYaRlOtL60z5YjJsG12qPTHie2ySODF6Ihq6kEymFn1t
         HtsafG/+JUap1haxNfWJyX+IS3+W3/1UxbELCVCRW9P/VQSf9GLOMHwAGRxsqeBzxx1m
         01MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070464; x=1789675264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EaRlpTj1R6GDSMIQEBaTdrHPWAUOhK4v0G+2f0OA10=;
        b=s1wJFS7W+UmTSQ2eeoOSCori7YhRC6w4XhFrCzpIegfRERz79NUO4N+8VoujqXO9jB
         gDT2GTPd2HqxDr0qYPjiDGyYyxCEMyRDHXmc7E8leCz/tiPttNNaz6n+4DdBNYNSnpZx
         7w6SyK0rZKhy160H050wsnhom3hOygZpihji8OKV1Aqe9lIHzxwqQ4o0A+IL6taS0atF
         j+QAy5zXNjmNtIxXC+kdJ61wZ4QvIoJv/MLQaUKb2c/gsVzQAYpVdmwlF20wdL+WVWc6
         48pJgBYB+xB1nvugvVfM72xbnSJx2FYsfLgFeNr/TYc09iqG6EBEeeDxFDtL8aUkNYBb
         tCXg==
X-Forwarded-Encrypted: i=1; AKwUvBysjk+sgOVtPTOjureAZbB16aYH4XC9MyVaMlgKlNqEQUdpb1m5NhTZwddGHniRRV1sd6SO6CZz/lvZ@vger.kernel.org
X-Gm-Message-State: AFuF++k0yMciXTNPF/wFQXUxU3skIg4GhdTOXzJhey2mBEg4AApAaTS7
	2gFTpV4ZILZSYmYP8SFxGuMmjhuqqCAtNxSwse/HRMbYDSb0Lz29WCL5
X-Gm-Gg: AYBFou0Rly/D79Hmd85Q4xiMDECbk1BDGwnzqJo+8LusGB8k+fmIWsm8769As960vPo
	VPbfMAWGcU1BjoagYAbqswGuEWy3xXJ3ndYq0QRXWOjmwasJbkK7T+6+9Q0hH33YrnOxWLJGK7G
	1o7j8vcp6mstNE7Zy8Hb0RwE+E+576sc3RKJAJeJTddsjJ6wk91HeiSWVL8dCs8mm++bwn4Jo3u
	sV/AkEHZ8Q2WJWmi4Deo00R3dnkCB+4lTO6WTNEd4m3LI8idkb+sR/yd9vffZSfqUZODNRa9NYo
	/f30e+OXrqlWmsrZhIcV4x18D+N8Sb4lASVjCjYezYnKb9OAwrkwyoZEOcWJzfM4o5r9yIQCEGc
	LfiZTJ2YJooZvL0DJH0ug6/yESJ6IQKB80Zgj+0wx5ptwM8VGTrFcfFW5+lVcRucraj5mzwXaZE
	CBimcpVqp5AcxcYUYvqzQgNZ37RREKlifYOn6xa22JK67f3o6Hb1C2Xhye5fftVh+R6LJao43bo
	cVnSuLAbVQoLy9dQyvyZ3HUX1aFTA0celelaz9GQPketrc=
X-Received: by 2002:a05:600c:3484:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49e619d1eb8mr6258665e9.27.1789070463744;
        Thu, 10 Sep 2026 13:01:03 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60a8a89esm17674895e9.1.2026.09.10.13.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:01:03 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads1015: Add support for label
Date: Thu, 10 Sep 2026 23:00:59 +0300
Message-ID: <20260910200059.5975-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqFoE_GKp_hd26eF@ashevche-desk.local>
References: <aqFoE_GKp_hd26eF@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 5:07 PM, Andy Shevchenko wrote:=0D
>On Tue, Sep 08, 2026 at 10:20:36PM +0300, Flaviu Nistor wrote:=0D
>> Add support for label sysfs attribute similar to other ADC devices. This=
 is=0D
>> particularly useful because the label can match the schematic signal nam=
e,=0D
>> identifying channel voltages easier if label is defined via device tree.=
=0D
>=0D
>Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>=0D
>=0D
Thanks,=0D
Flaviu=0D
>--=0D
>With Best Regards,=0D
>Andy Shevchenko=
