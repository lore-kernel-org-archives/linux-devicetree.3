Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818740;
	b=3ihWjOU2vVQG4H3rHdnqimiNyJu0qhJPFQzRAh3ADVKTfcJ0qlybPhZGJMbzrHKZIvLV
	 sL5GjCFRNuJJNcGfc/d5RHvBl6ZCN0rnUYP0xtKN3Zy07Y6mIZnurJy83bJ9GInJUIYoU
	 EKSyh4UckRMx7c09MjAUIIwhbCwh5sIgFpY3dydn75zPOgRs/yMb/syjevfE+UCZvwvS+
	 jlsH6oh90X48P0+/zIQBCPUFsx85mLAu9xJ773CQsQkLuQaqLNAQhvdPPGCYv+hRLskyn
	 /T451CtlxOLNklJVB69tl32NYKOymOKiEtsqi7Llbqjw7I9vx1tzAwxxvm/vA6w3Nvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
	b=1/e96Jjzjy8oY08BYnXnmDKNDGC4PdOtcfWiiwv3zKWFgWJX9G+HuptNH924e+QtBtIR
	 26ZaRciY2teG1NJ4BtFuz9xCI+FG/AupP13L8rX4eJ5YVWIF1BadHEF8+VGdtSJFYh/r9
	 I/UgnHmCLYgoH+JSI/QnajyS4ysz8jwgYsj1mwphCMKwLA+dW0iywYaq8+ykk+UGRIJSE
	 /USqaSplcTMJQlJvsTAnMWdZPoHmlb+f+GdmvVhfycTLZdMlJSqemj+CpwGrHkw+8Kuxi
	 5lMyQzkvnD3Vx/oVit9N7EDonsqxgrX00PmEQEB3TF13gnmWMcvpCqFirV8ViXdIOkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH0UC1Ja;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD50D606A331
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD50D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH0UC1Ja
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso7570477f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818738; x=1796423538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=AH0UC1JaXTdM1K4oaYPHTi9yx537Mf0QnZ6//35H1UjhlmcoPR+ROTsEPP7PYipi5f
         aEiLTiSntKha77pfMTEnwB5lu8RM5pW56Qg8SmxAluxiW3RVNLBCW1ltI4GYMY/MT+fQ
         vHhOfr26GTL7STS3wJ7FmAKeMelcRh9JWSAZXg3vfBM+shGpPwxxCFGYOvsBQDGF9A5b
         5iOC/RQ3Axju/x4Uh95KF3FIsPX0qwgq6r4Mc8oEWvL0gSDiuvvRzzE20/uzR253uSI/
         SEbSgfNAhmNZPfHEtIjd3Fpd4pxCtGz293JYyVbHhbzcIO03neFYkZCQUm7v6iGUMGdL
         5wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818738; x=1796423538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=iVsnIezkv5tHb2DHA8/NheIaQe+X1/MruOTLnusjzHzJTke2DlSd6pUhNRv6zY7byI
         WExSusLY4/mbva+ssGOW20VzIUEKNatW4Tohidnx4TtmOREgf5WSmVauoreCEWtSrVs0
         BhzjGwnFYOtjlvEgVQpTPbyclw0YSA1hc9tei6kRzo/D/zEESMuMbWBKCj+r5aDtdYDj
         c1P6kLIrulnd2GmhtxZC5Uphvl48/h/RS6p9UGUwLLqZdVFnd/qSJWHtKEeTfODnYeJS
         FHpxed004kXzvw4MFrnNQxhu5H0bUsdYuf7o3510I2ldCiHyzbv5DuWmYmeXCPt2FRjv
         UpOw==
X-Forwarded-Encrypted: i=1; AL+hErGAYKrN1m1DyCOc8sWDFxEky36aXUzcRZoG+eSr6YTvZH/+fLorfGZv07l6s+JOYSrKzQ1q3y/5182n@vger.kernel.org
X-Gm-Message-State: APuU4Z9EneDP5O46UqPt6vSCeFSANbMW0kHPkC5FjZl87mJRIWKXmIYQ
	9m0/txamLf0rhYzqVqkR8IYrzEyFk2vdZnHzN6vbuRuurkVVL1JBh7IC
X-Gm-Gg: AZFdTZet2eaxovsD+JK6DrdQytL6kZemxYB6n7JhKC9UqTfHmMVET11RbfYgE6GgV08
	yCAEbUQDM3xncQR33puvXiwpYI5LPSXQJcpT3NZJls19AaclbkmRR03cXlJemf7NNQrYp1yvf+C
	r/aoJFUyqb2XFvJbPJFFhkPYJ6n14g0dsyIiPb8b+cu+gOOxtUDfOO3/f4wRAkzvl4RaOZSC/K9
	ZPTIEqTYJL8B8Yiaz19TuTVNMtoyzmEAnPSAxoQatSFCdH6mECNbU05UIRVc9Y3R68MVHJJXmbl
	PxSzNnciI8rOFIE32InPkGUUc9jSO4g7J8wlVteoqWIFkU74SCoe+yygTbMbeCkvc/0XB4TXKBd
	vbX5SqarM241UkuWAMqeFdg/S8y6bNrC1KLPQDUF4yQUs8Liq5w5mknkqUaW+ycgd4xerTZYUgA
	zoYA4+zQ0TP3E/5k+5sZpzb3BK6Pm16fXUCh45IJQBjffq6Bvf0tI2TkPIlVRVXqhLxhFAMm0fj
	6YtJ+QVdsXfDE9ragYzBG5iJ/gIu33f1yV2gXQOzymlCQfn0yHQ3+TofEuJTESYhVwCc7H9pcPB
	2aEFfIMQmMNaCb2c+HFihMbaqwlLgaHBwvv55WACwhXAKng=
X-Received: by 2002:a05:6000:288d:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-4abb73b516amr57641981f8f.35.1795818737759;
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
Received: from localhost.localdomain ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm49465507f8f.51.2026.11.27.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <joe.skb7@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Sat, 28 Nov 2026 01:32:14 +0300
Message-ID: <20261127223213.2481987-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org> <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 04:23:15PM +0000, Alexey Klimov wrote:
> Regarding number of channels. The Exynos850 spec says that ADC has 10
> channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
> lists 10 channels as acceptable ones.
> ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
> to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".
>
> So, I tend to say it is fine to have it set to 10 if it doesn't trigger
> any hw issues.

Thanks for checking the spec. Then 10 is right, and channels 8 and 9 are
probably just not connected on the XCover5. Reading them caused no
problems here, so no objection from me.

Adil
