Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393460;
	b=aEA/XLik66ou6iqiPNFTqeuuJYwVgoYefALXeb9V8M0nUcC2xXObZiEsC7pGTw2fHJ5Q
	 bw3eeeNHKGSY4VVj2+SgPpI42eZEo1J9/GmImA6zblfheuvQz15pwakUJpIGjHIKvk64a
	 ztbcbMzh8PQQeGx9IEJ3Bpjd/4j+7ikI9SaqhUX6ZPCmZ2T31rKnCXTdZn84B8FDtLfJk
	 OsNbgwz8O2SNBuYkNxU63hSaSVHSZ1f3iVIOHWMeRgEkobBj1hB2O9g0wfdjanVX/YSAE
	 UPZnyeEMM1l88hW5Mdblmg44suTFUrv2CU+GGgVFUhrQirAwch1zpykbtDFHRBc2UuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
	b=emGGBTKCfVJhAeg5awWZf6bvTzpHdM1WPSYny9VO7exSSePxXWLPfMeO4Vgs+9QKj6IC
	 2ebWtfDeIS9iWj18gh9Wx32vy1f8tQaCdYNpXy869NtIPZFyzOcPBHkMyjIsRydfJKcbX
	 U9X1Ps7/cRuyCJpJ/Z9zNNJsJ6Bgf0SZCDCfQ8d6dUJ6naFkR4ndjuh54W0Y8MxJC74PC
	 salKBam9qsYwbct2EFJrZAVZArE5gDv34sKBgOODhvCdeLEf0lr9yCMEw0/X/mR5lbXDp
	 GCIp0Id5NQqeeDszcsoYlj42cmJKEJJ2M0gl+JkAZ/IEy9oF+ysCY9wV3gneP2JhX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A603606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A603606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so920394c88.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393459; x=1794998259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=IQrdNLmUkTb0QulDRJPXkTLdVZNJIHZmsCFZg8DmIwe8hOHt38+G1g4Gh8LFJ9XZgX
         ckC1QGiDDqplvyYcReSFKBteQ1ervRy/byGtlQgUftKiu9gTWV2veG1eBb6ffpt0EYXv
         4u7c+oCWTKeV9N4W56wNzW5TO0y3fmyAkqTK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393459; x=1794998259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=Yhyv3fUE3a0T4ZSXsxiRp5Y5Mj2RLo58J8EIlNyNfW0E1hjZgV0ls3SkU0UPzv8ogY
         +bWM1NrWShJA7ntqoOmgopspH5p93Ki2+Jn2yLRM5X1OhhvPcc34VXygZCaQiKKY+fp3
         sJuuDuD//JvcsEK06QLTrCFr5Ox38SX7tFG3zr6Ziv1bGPHuNLRFeeV9U4OnTDGItCQw
         4ZATth7Avrz4/j27nbAt5DCVYFzUBBG+8UAPT1f99DbwSfGODOEQWO5U6LrH/IN6RN+L
         Ld6zQagvRvwU7SargoqQHY5z8h6TgNHlhQ9qK+cVQZIGr3CII1xiArVuIRquatFHVWHk
         3F4g==
X-Forwarded-Encrypted: i=1; AL+hErGViOQF5+ceXydL5u0/t+3jUCvwb4M83pddfwCcHMw1IXc8/PItUw8QHAozY27gI6OF/0YyMf86+8tu@vger.kernel.org
X-Gm-Message-State: APuU4Z+0KzBU669SAc/EhTMhXLDnuOR5fP/t2THtKJoqwc/o+UZ4ouNR
	McuRgjaZrqv85XYkd51Df5rJfEdnVnzoykNiLKXK8Z3SCH4wfqSODyC5bb2KU3K9AA==
X-Gm-Gg: AYBFou25GJjm5IAcXGSVTJ/YoPtU487fr37rTGNgUmQVqmStr1rUDB/svxBGWHYoBh5
	LWIk22XVGpXQGXPgFnI5ex6CawB8ADvpIYk1hXDza+Yf5P/+n0gyMnbEvv+kW/m0ZvzhPureJmk
	F9k2TOq4J8sS+tQCmWfzIJVw4YFuNAS6eVynB0lBO2iJ9U8gEflEjPDzq3ZSMouxSIYKEz4Rd0C
	YU6HdKWHpKNBxwmTAYqX6NckpNI+M+13EoZ6x7kbVox01PcpqOaAcwaNFroHHuz/+p6oGAHxvas
	TiVcK/cU+OXWwmc9JM8P3WipZ3ogQTfALKURNBmQfiSADD7/N5xaMI6PBJuuBzs1qhXBngDNTSd
	NhMB0ws9AAjwfSRFI8V9hKl1NNbb2xBk+qESYKuEoJ8xuBjhmsvjOhAeXHFBYuoXui+aFZsq79G
	M0GwTS+UNAz8rHORPIPlCzl7JwxcPJDO29KTqJ4GORYQGlOft8pi8SNGKbZE7u1uJ7Ofgwhl35x
	HaXCeRQO/upQJIopYEyYHX/H+QYG2+qkdPugZnP/rFvXgYx0YP9gLL4sHBypBtSVcWkFdojCWLj
	WpbiE4+0IsWH0wtU8Sxaq33u4iuPiWGwixnIjEooaDvYsTiuSPC+BnPsP3y41nlp1SZblRLnC+A
	rqCoz+hrWzhlS8kLD
X-Received: by 2002:a05:7023:a4c:b0:19d:6484:869f with SMTP id a92af1059eb24-1b3c02fcd46mr1947792c88.7.1794393459210;
        Wed, 11 Nov 2026 02:37:39 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:38 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support
Date: Wed, 11 Nov 2026 18:36:11 +0800
Message-ID: <20261111103710.1393311-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds DT binding and onboard_usb_dev driver support for the
Genesys Logic GL3525 hub controller.


Fei Shao (2):
  dt-bindings: usb: Add Genesys Logic GL3525 hub controller
  usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 drivers/usb/misc/onboard_usb_dev.c                        | 2 ++
 drivers/usb/misc/onboard_usb_dev.h                        | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.56.0.542.g3ef89b7020-goog

