Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB3481666
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312551; cv=none; b=upcY4r7MSGQG/GEd7Of1o3HgyGciz1rQLHMKeLaocjlWR4Izau9D/6yNXrAdOsvGItLBNfEwxSam0QkGkZ91TCKQzV7z9xuDTZXGnk5fOjvLW1DOOh+OjlrIpvinvEs6+uqdyVliHJs6DWFhL97LlyyZcmM2TVxfwaUMpmJ6byU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312551; c=relaxed/simple;
	bh=OYToqEEQxAUkOIMyrrG5Rv8GjKS9HPYnHJZx4cXkuRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nqo7+UqaJ2br2Vqf4y2PEQ/h6zzbAVsUi+kD/uyr9MyFAMZnXYTGVvKHRyTcyRX2B7Q0COsMWFA8fFfOg1Bpvo7sddnle4MEuTAusKP62XQzvLUygfsmVgTjWurXgO3wkMN1pvrVlCTJGbf5nV63Yh9DmsIf9cc5pZq8fs5FDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqW5eyaV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqW5eyaV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49557167508so7424415e9.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312548; x=1787917348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYToqEEQxAUkOIMyrrG5Rv8GjKS9HPYnHJZx4cXkuRM=;
        b=lqW5eyaVUT7To/SZogYLHfwvXAhHc1+YSvOuhiCGdq8OrnE72/5Z47KoCxVAoxo4Xx
         z2RXOb84Q9pJss8UECXoR5c3U7eutPZrZPZ7PQNFLP6ULuQbWhN8iUMj32Qw6nrMytux
         fghpxX9nfGu9VypZhTo7hYpUAE1HAOdNtwt682CAzQOck9XgjfS4L6Z6nyEcJgyZR5CL
         CjlOjf5wM+QvpDru614r3XvYrSyvFlKLxxlGakP63YNlTOVkvRMabf5d9Ghn8/zCl3TU
         55RWoX0JhxAONeRNpRRMF53Q0J8JVMPZAI/dr41xJXGKGf6+OoWl9HhNcNbzTForNMq8
         AWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312548; x=1787917348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYToqEEQxAUkOIMyrrG5Rv8GjKS9HPYnHJZx4cXkuRM=;
        b=so2UZSQ6Ckde3rp5fponTtBIIwW2wLCdi9574EXFZFSyZom4EUwG4FQy27FPCXWK3K
         4Et3hlvRLdUb5WqV9LClZY+QSkiQXZDRO4mH58qrsWy1PpZR/atVairuenljv4/oVTJF
         VRrj8kDWloCsOVZHqU2ZowcGne/G9vKQnqwsGRj1oy2lY9jZZwc6kMyCt5AITfoI0sIi
         cJIyrvceIPOCciBdp6K2tunu9PaZsIqC5PABlko/1ulpNTcDDUhSUO2z4oi0mSLQAx3Z
         wkzyZzvJ/w3CM3er7btZUs+HYCAcS6wvOwOzqSsKqQsPA9q6485Kz1Pl5O7R6L7e9R8L
         gxYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq5Eztn/EdX4J2s4Y0KUY4e9gwk9OiykunZ6MB2oetwM3WDi1ph7Fxw7R8nSXh042o2X8kro6mIpT4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRCCzFXNWgjQe2sStPZpsLDTfocjU4WB89GkobqEyS3iOHG3Ot
	o0Zg2lMoZOU0gqaobH8cF8NsMgHZvPHCpkCz1HASwyLmRKjsWBResgcN
X-Gm-Gg: AR+sD10cxDc6bYyf4aqK3dbM7F26i2vQDI+O2+qaVGPIp1xg8zKaEx1zzClBcETm++r
	dQvhX2rz6W4ul5yRJaEX9qzeDP2btJKWxxHN0HPaxBzJ9fro592DG0xmISt4QFZHkjLg4/0jf1B
	sZns4tznfMq8CXEtNBFepEE18y4MZiZ4zfh+u5Zzl3a6D4XPGtoFLPSCy8r9cRCIJ3IjBjVC4my
	vZX4rGsrLS/fdBqroiCEEXDV64tT0FkZl+er8uln4t03zw7xxJ77J5qSYm5lBhM80+bwQVd93fg
	Jz05cB9VU0bT9Q2pKC5bsdNIYsdc7tu6wiL4cwHBO+cBGNXETA1dGrjogOwcILt2kOTfkSLcDu5
	3dUQxZKzyp6I0AGhbBBZ49Yp6R2l7PwS165Z/ZlPQOyqn90VvU2ncaT5/wF1N/q28uaVAJ2Nfna
	x/GHZMZ+nRAzG207aD5aKdzMr1XvA3FZBbRCxSYC3NUUhsKV0imjzc4UmMNqcjaTxgLHX0t6tHw
	+vmCU5Dmxz4v0MX187KJOAT
X-Received: by 2002:a05:600c:8b16:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-499b8343dd3mr71965735e9.11.1787312547553;
        Fri, 21 Aug 2026 04:42:27 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9111a5fsm24333905e9.12.2026.08.21.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:42:27 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: joshua.crofts1@gmail.com
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
Subject: Re: [PATCH v5 3/6] iio: dac: ad5504: strictly separate ACPI and DT probe paths
Date: Fri, 21 Aug 2026 07:41:53 -0400
Message-ID: <20260821114153.58607-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821132021.00000d2c@gmail.com>
References: <20260821132021.00000d2c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> ret / (MICRO / MILLI)

This exact line was discussed with Andy on v4. Patch 6 in this series
replaces this whole branch with the output-range-microvolt property
parsing, which does use (MICRO / MILLI) correctly. We agreed it wasn't
worth changing here to avoid an unnecessary intermediate diff. Let me
know if it would be better to fix it at this patch regardless.

Best Regards,
Taha Ed-Dafili
