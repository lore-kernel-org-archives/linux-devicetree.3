Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959228;
	b=kf9+bXWLo0DXFbOZ3+PqV3dYNPCHM/4Av4bXv8QlIFF0A56X17JNDG5QYdAm6O0yIKoM
	 rrx9d5PBJCLdUCPb0BLexAPXfcR2HZ8Nj8nKaCevRGXxs8PGwbzMbTcy5lagFdASZcabS
	 bOBGU//R2IhY3NYDONhiVB2Md3ZJxYz1PO9JIQpitjTFY9S5hOnoDYVmAwxgxD/AXjB91
	 bVJJ0XFi+LJsBxWctFa7qxtYAS0csF4/VN3E90aafkJl3rCCRSRmdZpHx2o7WjMtVhLAy
	 Ymn4c5/P1iMrTkxhm+jMZcIbsuBDNks+v126rp+929NqnbKzTRFh7ufV1/AJsH7uyoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
	b=aGEFzAccOHIBgbuikjcjHOyxohxRSY06SJZl3/FsuNDxcLt36EQyUiUBFj3oClKeDAgM
	 mRuURcD6H3xBQc468FRQykre5cL1xlZpytcDPUWBTf4WZ/Iy/EIMgM+cusDHmWByJbpxB
	 EGH0GKNzcgxmC98k4TZEZuaauxeJUlmtlgMUWNlPvPeT7/zKD24EYfcf2z0jNAxSB1F8c
	 abo5McX1IZCbN8RxZPr/y7Jt/qBHKNpES8tHBBicYVNBCAu2DdEo+ssMt4KWdd2s4YM4p
	 nvQcQjjr/nIJzK6wC+KHdFHSRE0A17ZvuU9Q3kQ38KO23iO2Le1lh62c4ENsitypM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C922D606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C922D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4564945e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793959226; x=1794564026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=jOeFNwHao332HVD3QfiQaM5lk7vcAcuQZLCaMifPIknjCvH/ze3hFfWuBV4EoN7tMk
         wEoP/XwX4ULThqV1kMKSVTIyKos0MpEI9/DM853jGT8B7QZDLkJWTiv12Wf4NYzsPLyQ
         FnrFI0FMPmbRz2Y6dHMQ2pFDb+paJuVVTRzZdrhHt00cALOA+uVDF4nOEtghJt+1Qp0d
         KQM1ioBMXXiJUeyCl3m2BusET9eM7dvmLWYgyAMoVFBNIyR7KRbY19rKvslC07zpMwdw
         z1BhkBlaqompvfLdAX95pJqHTOLThpCQ2uHrbpMh2aRtIrZxi50iL47D5iHIE2IriNRQ
         XfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959226; x=1794564026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=RZX11ivZ9H6Kb23zCh73jWZ7AehZ2sh+ikQKR32m1Ad9w/uMFyi7JY0kzDFWk/lVuk
         trWIUhTKI6PpLYtBOPzgl1y+uDlYpCU0DgcT7ZZrIq7b3aqnnGXKVPR/lwME2WGgu5Ha
         7j5tTzPDJFHUTdMeOQjcH4WWDqSQnprd8y0vFWE+a1VAQLkJHczwreTlkYboPsxunkou
         AsVZ+EV7T0u0WK3Qpezv1EJX4f9ZtK7IvqfckdZHON6wHR5ecVYJwh9P0Y278p2t5ySP
         iTxgZ6cn5qaMybm4B9W9WjOkj4aeaFXsCrYZgX1YEImypsTQwwLycM5AwCNKAnl1O4sn
         L+mw==
X-Forwarded-Encrypted: i=1; AKwUvBw+e6K0fwefpI4vBOtGt8BD0QsTM9qkxiiNWcBD08Gr3vWA95Yc6jWoxelFYzhd3QRXKM/zQqRe22bx@vger.kernel.org
X-Gm-Message-State: APuU4Z9NfEyPPqVK5H392Av2OB/en1mlmkQAOqGDdAqNMgIM/vbcnZzt
	67HOXDyfkYjV0FkRqUHQKwoyAesxIEYSdeq1oDm6Z0l86WuO6JSfcrk+rnGW9XvkwixwtE4qEKK
	kWLEzQuc=
X-Gm-Gg: AYBFou3hF+zz+5EG21rHvpiXGns3RaFIDFgXqeHUcVBHKc3d1elPugTR5RprdxOxoqV
	FP4TaMrXoDQEROi317w8IjfemupMbGFJ+QqhSnokFI8dB5vbq6OmULIsQsLKtDlM8Sn/Sibp8eQ
	sgBCXupKsfohbZTX0Aj07QL2YhjrIOwTm71IevYKOVoVNZoI7lpvDcO2mPl/6vU/rjd4itRs826
	f3M8Ts5+KQ+ZJwtjEPzmgJxU6VmEvwGf0lHsEorC+0CBpy3V5VXBJdzToN0Lj1NwwmJuy+PPRcx
	c2KOOljC1pGD9as1dvNureM4QP7/Eb/rUaD3nbNZCRgBqC0CDefhySqzb1tUvHXFROQAr/dydK0
	3u1AkMQf23SPGB3davlDC5gwIKEhUiyK9r97oeOnkR1er+GGyVKKMRVZUvHq2A92FkrVQxLAR4M
	E5Nyo3VXKXXzwGA+I7/olypc8CxTAD/pIfIS0wRr2A+hKbNGZbC6QSQXGUlNCF2R8dmeVfPYcZC
	LPmgb9Q4PJBRYgizaiq0wMYO+XnDM6RYje1kWBjueAOR/v5aNtq3XhBOdKWSnEdq8q/dgAAr0IR
	Iiezr9woWlg6ODGzfnZeIejmxFxpjAGRBSlWl2Vs97S1vwF4NakeMW+hKZjR2V12sbI3Tw==
X-Received: by 2002:a05:600c:4f55:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4b6df5eac54mr35512905e9.22.1793959225655;
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm2824397f8f.20.2026.11.06.02.00.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 10:59:09 +0100
Message-ID: <20261106095909.67659-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
References: <20261105213210.87457-2-olivier@mgcrea.io> <49e69d9c-6cb1-453f-bbf5-e2202f97e4ef@kernel.org> <30B040B3-D371-443C-A66D-11EF89FC7C63@goldelico.com> <f74bf2cc-c459-4b9c-ad94-c60afcaed3cf@kernel.org> <05798D24-C5A7-41BD-8FDF-F7075F2F0D01@goldelico.com> <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
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

Hi Krzysztof,

On 06/11/2026 09:23, Krzysztof Kozlowski wrote:
> On 06/11/2026 09:18, H. Nikolaus Schaller wrote:
>> So this tag should not simply be dropped but moved to the driver code.
> Yes, please. Thank you for testing, it is important and should be
> credited, just accordingly.

Right, my mistake, I carried it to both patches. Sorry about that.

Jonathan, could you drop Nikolaus's Tested-by from 1/2 when applying? It
stays on 2/2, which already has it. Or I can send a v6 with only that
change if you prefer,

Thanks,
Olivier
