Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD0B38D6AD
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414829; cv=none; b=c26fjf+gLdUCSPhHapqdKfFiE0sDPHbdbuXsVWDktihBRvAnx+ZY20FGbwUv1tSoUYTnolTiKCyV/2b+y4upz8j1mZ6S5wRKGpLHrM7u2WcW8cQVvotkDbpEzs8kFA2RMSc6UTZo6WfZVSufsbp7dNPlqcXrfefLw+D2hhEsoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414829; c=relaxed/simple;
	bh=Ptei9JoVVIB5GON+lwznGIQ1eYUaNiXHrC992FdBm7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qo/G0PpCjH19c8wQJJJJR7mEIisjrHYw5YaQGYFeBVa3+SIefxywMEAurpGi3tXc7C0dEiEdfQEd97hqm0hQIc1eKGqRdWC6GX10+5v2k1mK4N0RKAA44JfjT9fMXyf9SxjAP2RwS0KvoE3tUVzIN+pqts246IeWwZSOeFa4K38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk4oBKiT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk4oBKiT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d3135f62so15250265e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783414826; x=1784019626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nkwcchEu9Ml4OmDJXkdrk/JL5BeVqN7tOXDSpcJEoU=;
        b=fk4oBKiTT7WND7oHClL8riQ8wBTiyB0XTW6TYcw2NUYImdtXXpx4xpvlkU8pPY2KWs
         1UBZALT/wIBM5qnyy1mv9146azNqFccW3kgwpxJL642W96FqXxi3lG0vSn5FUZ6GrxWO
         ICEakBmufeqwinEh4BqfSsqm1hpUtXKK8xYbkz5ovm9SlshjdlyTXzzhCV49SDHQh9Gu
         SV18LODCrFCWEGw9HXhzKaC1btYNXHjX1gG9UlnUknAaHSKzXn0Ka5OcWDgZjUebgWGw
         9vQTstDEM34z10zBrbZbBsTdlnTFoL9zh+UXpUzx/9lRRbvnK4cUpo+5s1SeCEPg9Ow/
         NRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414826; x=1784019626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nkwcchEu9Ml4OmDJXkdrk/JL5BeVqN7tOXDSpcJEoU=;
        b=qNyMOI4/eaIvcCCUNBMye5L85Ji2S9y9GPrpJn7lakDSfKXO3VQUYvWmUWFheM5sD1
         W54qP8aYgdBRPX+EQajXJmIvU7wqyDe3N4KJA1hl65+6JdrhXm0i7CetEMqrDu60oEEL
         d3IRVWzJts04gk730JMHw8XCBHRdds+aO6iMLA3+nrTrsX5nxbcIjJw6eYUlOGULrO18
         3e8mcC4+wsK9E7bdJoSim2bRRJ4WIDoAUi34VWza3iNlOvwUmluLcIk6Gqm5EnRq9ZCO
         PpVYqga9C0KGg9f4wuUOE+bXkjHbOTMkyunqUrc9/CRldQwn5ORjVErOIyATelXeeks5
         jk7A==
X-Forwarded-Encrypted: i=1; AHgh+RrnVgAV4fHDHpCog9Eoo5mLG0rnnrWuTJ4OkwN7JDLOOXY4DYie4jjCCxIteME6uW2cTNfea17/iAPn@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqqIHGs2r2dK/KA/qKex5PQRyPwdFxjb4GiBGGa61Mg2GP2Hk
	cLknjiYPGmRmrRYOzQHxDMWfk9L6jFoiwnhzbVf0GaNgGaBuV06CUOe48O2Iuw==
X-Gm-Gg: AfdE7cl1bWFN3kqqXYHrWW8UEJ3IbJ6EHCgsM/W3OcO2orfBrO9aknk5yjj76WZsPwE
	WVXQMAWK+1vfIQDxNoLbeOsIEtEzNvrSxDBhLuiYPHHc2j6q63tbeL/CfIRPdVrDarxIr0k0gRB
	AGigsFBhZA5a30XAYaGHvdBj729aKEWEboUqVdtHWMdsefa7VMh7lUSfnnZtGJ+pj74EtzTpdOE
	brxgw0cnB7Iee6HEmYRdTVBlkZOWOvlNCsRC+WwAceBg6ud/Z7wBqCwJXzvnXDa+tUQM9nW/28M
	xi27mwphvtfjHNoCaa1H0SyOmb6Y/DJz61o90QR+v6PqJW4fnMXZqhIiehOYcAuuEBcsuDG1fPf
	7UXIdjSD93D8j9IxZVGtEiv8nmuQNy83Ep+x6auKsjBoA5glDOSAYnPs2hgjxHFFmj2HXEfqP9a
	A2/Cy5yQClvEbXoB0sZdnnAg6LiNPJ/81B0dKDnjw36xUSi//WoOXaTFDlO/p3VRm2sQt8xtivw
	RBogYOncw724ee8WQGqQ8rVHvY8vuY779n3w8f2M2X6xFFRjBoq51l+OsdvFuVX8/SlXSyxq1LH
	idjKV5NQhvjpviNLup37SpsMlcb5mtFebu2T1SNChMIWvJiHKhWgHEKqIAV3HtLMD1ugaCoMdYZ
	2kTr63LvGRIuYW2bM05CqQE4=
X-Received: by 2002:a05:600c:1395:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493e0c325c2mr21882075e9.25.1783414825480;
        Tue, 07 Jul 2026 02:00:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f44b3bsm35617455e9.9.2026.07.07.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:00:25 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:00:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno Sa
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/5] iio: osf: add UART IIO driver
Message-ID: <20260707110023.00005e60@gmail.com>
In-Reply-To: <20260707014525.1015-6-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
	<20260707014525.1015-6-kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  7 Jul 2026 10:45:25 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Add the Open Sensor Fusion serdev transport, driver core, and IIO
> registration path as one complete driver patch.
> 
> The driver enables the required vcc regulator, receives OSF frames over
> UART, registers IIO devices from capability reports, supports direct raw
> reads from the latest sample cache, and pushes buffered samples into
> software kfifo buffers.
> 
> Use final Kconfig and Makefile contents from the start, claim IIO buffer
> mode while pushing samples, and use zeroed scan storage with explicit
> timestamp alignment so the driver does not depend on IIO core
> bounce-buffer padding behavior.
> 
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---
>  MAINTAINERS                               |   5 +
>  drivers/iio/Kconfig                       |   1 +
>  drivers/iio/Makefile                      |   1 +
>  drivers/iio/opensensorfusion/Kconfig      |  15 +
>  drivers/iio/opensensorfusion/Makefile     |   6 +
>  drivers/iio/opensensorfusion/osf_core.c   | 320 ++++++++++++++++++++++
>  drivers/iio/opensensorfusion/osf_core.h   |  70 +++++
>  drivers/iio/opensensorfusion/osf_iio.c    | 308 +++++++++++++++++++++
>  drivers/iio/opensensorfusion/osf_iio.h    |  22 ++
>  drivers/iio/opensensorfusion/osf_serdev.c | 114 ++++++++
>  10 files changed, 862 insertions(+)
>  create mode 100644 drivers/iio/opensensorfusion/Kconfig
>  create mode 100644 drivers/iio/opensensorfusion/Makefile
>  create mode 100644 drivers/iio/opensensorfusion/osf_core.c
>  create mode 100644 drivers/iio/opensensorfusion/osf_core.h
>  create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
>  create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
>  create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d4199d9e..6ce18ad92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20016,7 +20016,12 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
>  F:	Documentation/iio/open-sensor-fusion.rst
> +F:	drivers/iio/opensensorfusion/Kconfig
> +F:	drivers/iio/opensensorfusion/Makefile
> +F:	drivers/iio/opensensorfusion/osf_core.*
> +F:	drivers/iio/opensensorfusion/osf_iio.*
>  F:	drivers/iio/opensensorfusion/osf_protocol.*
> +F:	drivers/iio/opensensorfusion/osf_serdev.c
>  F:	drivers/iio/opensensorfusion/osf_stream.*

Looking at the list of F: entries, wouldn't it be better to just
do `F:	drivers/iio/opensensorfusion/`?

-- 
Kind regards

CJD
