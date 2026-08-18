Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DA741D64A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042217; cv=none; b=GeDsyxAevhSA9IbfM00gVFyytD0oaoTgiV0jWCv7vd4Eih1WKc7y7r2YrjiLh5rC3DEH92gbSv7stTqcqllDj/xH5dMn3o18fuIkDfXEI4OuuX/SUwWUS6me5kGNLR2zKtfdxKvKzttj8xLtxa33S1RzY0J297LxsnkW3fCXAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042217; c=relaxed/simple;
	bh=Dfo0Xrwp9V97ak1qpmm9XRmx3ltOhqU4Ss8r29txj2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8Xg75xOB7GueFb02H2HMDWVkxyd83LwCJgT1WnA/X/lWzh6yUX7woyFU+cWj54b9MBPnHs8MsXSs3bT+u8KbMVSsipXwcfKpncfIFFVLQi6lEpqEcqyjLsnAnsTgkgZE3ne1SFWDY3khnOFMZCjnPUb7kumDcBfRvDwB2AHZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9rjPLVm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9rjPLVm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4994c49f588so8073385e9.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787042215; x=1787647015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dfo0Xrwp9V97ak1qpmm9XRmx3ltOhqU4Ss8r29txj2U=;
        b=B9rjPLVmY9qhBVglCvWv1bEQPSvKLcav0kRZQVB/pylu/1EIicTudvubAlr8/wsoKk
         8J0IhT9wNtURdjq684HkNFYGI41OtGV5uLKfChxWpmKFZU2/B5RxKlLT0w5lJ647pIUx
         OgtWzjB2nF6sO8mXvd66a79qa1Mms+Xyhsh4g1xuu+MXSX2FdDGke9B1yD2osHe1WHb/
         O6tLHOoY82p+6Jb0izRFA/oEKWiZZ3baWM/cusvoufjcQ7NEAp4xausdAJlziRkl0WgH
         QkdgjvSzA0zr03Hix01CJR3y25IajU+jGczx4ezpXu1mfzS26C80VxC7XyuFCi8AT3dP
         sgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042215; x=1787647015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dfo0Xrwp9V97ak1qpmm9XRmx3ltOhqU4Ss8r29txj2U=;
        b=f/5KV7cuFrsk9B585yVW4/XPeYy7tvLOeQhTt8wWKaDjBUpyANKRkTU3Fly0dJ3mmp
         Dd4HpOiDFclsIlWxCD7XhNRqYZtFX+nP5R/HsDcQRz7R50S0LsSglrPdDqsWmPqeSjZZ
         7gBgOBsdJPhAIlm5dGWqVjoheVvYi+qbJosf2xKenGSQytdALweScUkmp01I8r4jyl3E
         JohXk0tQesQSxLEdjZ+GRmRylbowvxpYhI0jnyV06TgTKt8zYCpNzXOckBOx9H7gzeCG
         vheKa7rv87AD/XuQqUR3d97xdZUdVzEL2bDTWxEQ1sE2Yo0xpnOqQyEJg9lxq4xg6imq
         553Q==
X-Forwarded-Encrypted: i=1; AHgh+RpKKCtJA+WUejKYh6xDkm1fz3WHs+0d6d5q4J4DrSVFm7i/ntj/Mnttc+eTeXHh7t1PGHDNlBTnGwCh@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDRrjs/CbPcTBn/jC8GsC7GES3FXEt/OS62jo9nKtIWZWx+AE
	uaYCWgt8PtzX8EQjzfi0MJSzuHdEN6BaEvbe4Eh92+K1vHOmvjjj4cZO
X-Gm-Gg: AR+sD10QTs8tQrUbrhOxm6Gg1uWvYVxg6P3Ksv/JvqtRH1mYyXCgpZ5nvNuCiPzakOu
	wbIib8seORWGMGeuP+h6kThSwyPB9Y5dSq41tBzTA5cG7NCoS7tWzzEEupeuyAEvUlPh7IUmSju
	4RQSkPVfiFPC6wGpXWaP4b7ptCfb47pwtItMG7z8Fd/Ptczkk8Mj7AhnkH6LnIsIpwqNjxYW7rw
	ZGQuoHYj8110msh1Nz0Eg73jT8T+jlxJTKla0S2hHqzQiaMTlPSifpgnRPFl+d70KJOc2fY66YO
	VRmtCiETjuebLjG2BurMkgUWcLdK/eSuV16NfahTFdjXitsCeY42L+yZd4X5J1ONxr5vO8wVUxi
	QqM2PCvnJS+RM74UScGfjUmrRGvVShaFiiORepc1+94UWVfNvR2eE850tdcV94ZUMwE4MVUDDtR
	RedxRKlyt6tKYTE7MHecKFnpIZs9GS8QxLQ+P1kpB3p1h7V/etGl05BqmrtCR6JSelfsc1JLCf1
	WD0UllDydKW
X-Received: by 2002:a05:600c:8b77:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499a206a553mr57451765e9.6.1787042214575;
        Tue, 18 Aug 2026 01:36:54 -0700 (PDT)
Received: from fedora ([105.71.134.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm103197425e9.5.2026.08.18.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:36:54 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 4/6] iio: dac: ad5504: introduce local lock to protect state and spi transfers
Date: Tue, 18 Aug 2026 04:36:38 -0400
Message-ID: <20260818083638.16041-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoP3wFuQBYJfEo8D@ashevche-desk.local>
References: <aoP3wFuQBYJfEo8D@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Was this message written with a help with AI?

Yes, I used AI to help with clarity and kernel mailing list
conventions. The technical content and decisions are mine, learned
from reading other drivers and review feedback. I'll keep the
messages more concise going forward.

> Always use blank line(s) to separate the guard()() from the rest of
> the code.

Will fix all guard() call sites in v5.

Best Regards,
Taha Ed-Dafili
