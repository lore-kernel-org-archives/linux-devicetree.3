Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530239;
	b=caS5418Je6XhmIkzFy//n/3oNtFid8DsInNZeZPXDDpTWNnEWxQ2Xo5HvUS2AasowpgV
	 5EpRmLkdVzaPyFJSb+2PXVY+1rWO7lIuO1o20qpWP18BUSOXq9ghWmlisnsi3dXR/Dtry
	 dOaNhHtIG2S2MbxLGyazsGMfZqgQr1zEaRWUgU4cp+jTP8SjvfThjH3ytJj3xsFC0eOHi
	 EPO8Od72sug1Y8m01BBEIgj5LnSVIJDqVCpdPgGJbf9eKB1ccjR58OQ+95AELRuCsSx0v
	 ayicv63bee/Q/0IHhsJZBeq7cqWnnrnLbdmDx+WB+rVTLr/nG02orm6OVPcRgFdRsNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
	b=aH0WTIH+m+zMMc5GL+feeQ9Tu05Vpm9LTm3hYOZQbZpIuL7Sk1JyBxmKOzOLcFb01mRm
	 1Gx0dAOnXEX3vALoqFpU9bzKNsYoZKO9sZMeltY3SOVQKb1kOBK+Kyhl8vMv8dJ1XzHQA
	 p+1s7HYV1trPhMmQe+SzEEKduWuAzxavCL56zerILF6w/OQ7EUmA6/0MIt+P5NTugKcet
	 tnFbxb5vbYVu+LP7l41KMZlcgT/h31llxZQAHt3y3x4XE7Y2mx3BFaO+Ws5DKHQ51JdkO
	 aCQs77r811F3Zw8E17lAQdJGMA0+oSmEG3V2DWgmTZ/mZmLV4N1dD5/eppWT72ufQyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOayCD2S;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A658606B553
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A658606B553
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOayCD2S
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so253211f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530238; x=1795135038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=TOayCD2SBEBwrAKAt2MXAD+N+85uu8xaIa48EbZSRV2rG0IIkNrWZc3cxvUbwD4E59
         2cM942obilajBJm8B8olOayUossndYpHM2udVgTz4IK5Fn/25cNTJ7i9tCoW1W5W3TwU
         U6CDp06M2b1JhqUbeDtgQNnP+4PsnMWu7FkvUaYKzdTbZTIc8izEDrIuYYIfj9OhZj8h
         zMX7CV29tkN7QvrfKCrJNZ+ohmktdm69N1YB3vR7QJ8o5Zj1eZykKDYV6GjCYPpNaAWT
         jgeX8zFePd3PU+9OEKZLN6UFrs7bMzlN50vSPRQeEDOhOd4cPwXLdX/WTNPEPcM7K0VX
         AbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530238; x=1795135038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=VBww9a91dsUXQHn7305lV3Q0UM5GtSbnQ+ViLsjWUHX2R0f6t7fdE7Dmuljer+bdXU
         AEKy/amosD/AjuwSti5Hhf9hpkDNxHyXzcswuO266C0g5x6t9dkyxkx0Wx40Inm/77MC
         DJXhqVHfbjqY2GUqrpD+Hw3q7i0UYr0Xl9NrUWh4lWH/oij9eYFBosB5eh46TfttJ62G
         a17EFO3zzdX9dKKqgAEUDyL5H7PXO8aSmBTXpe13Kyx4etHahfzzuiLt5T1g0/Wrlufk
         XDZTaIBuOAAn38ps/Uaszz6T0F7z+FTHhUfbx1jg4td96JVkEzSa8FMDTWq6JP5J3onL
         Pziw==
X-Forwarded-Encrypted: i=1; AL+hErGVvSzrIRUMCr5bugV0DpbdOW3L3v1GHrItEIvW5YFoy/GZRY5Jcv4ml5ViXHNKvCSpHmtJL7QO7KjP@vger.kernel.org
X-Gm-Message-State: APuU4Z9TYFCTxgnT0vDGc0Fq9i8TAsgvVTUApX1nckvbnBLfmwxBSWSC
	xBJ4wQcnU3kqMVQmW9m6C6mSQW3KDaoIG7H2X0Vb303epnNiLxacrqFzSOx402Pc7bo=
X-Gm-Gg: AYBFou1+UPb4H/IQnCB0EzebGGkh6auwAvkY9YgcazEBge07yNbwnjKd6Tin/JZ9fvC
	b3bhqaoSC5OHMfWD6bS5jdsN5aOONkqr9UAeASGz+TplwkncswpT0JlI6a3SauiJTDqhCLpbJJv
	TsWC/YgdJglZPqMd1ML4PlS9UVCxNdjli/HDK31xnQY7q1su3pjcza+z142RU/ZjRU4pgsmI1JY
	rF9vaSsyjxgeTn/La6WplQQO3dqOwyaS69CGyR0hoSdnYqJ8wOsJbay3Xc3QRIKVEhTpjJndMdI
	exb+85b8acad1M9xIp/ovraAw9kdIJXJCmOb7pSNZ8B2mJ8vGgusoJcmtnVqyc8j3EECgwL1Kvk
	tghgOejkjn72UWV0idUJzcGVWrbIqb1VMBKe2vhbOkLyuNMNnZdBWRubkbGXcr5dnpl29fudVtf
	dTfU1i77z2ABnj8KPuOH4VtQbpY1vLbBsafG/RUY9n5uwym1dZ2DzzFCzQz1XFWzP/BAumQCrR/
	xyJe+w3iIxGPvwsP+hCDo7nnIqSd+g7LDm8zW5Df6VjdfeUi6hnFAAXvL0h9orcH8c1bh/YoHRV
	+SkMiivGW+Wlvp75xIaCPHtDuhhapVSHo/BJso8AQr3eXuPJmk7k4lkzNSOkvQsjB6aBOkcfEL+
	UwuosFx1SwcRcnucPaWcV7za/Qfo7zNgQwM+beOJ46/7XCqUKV+YknqCFmXeWRAm8pwP2Nz0gLr
	LUT2aPQGK5V1Opi87LOsmXS29wHET5GbmwMkvr8g==
X-Received: by 2002:a05:6000:4b12:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49c70cee81cmr2469854f8f.21.1794530237680;
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm1937527f8f.21.2026.11.12.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
Date: Fri, 13 Nov 2026 00:37:16 +0000
Message-ID: <20261113003716.3666756-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-khaki-gibbon-of-persistence-a552df@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-20-ghahramani.navid@gmail.com> <20261015-khaki-gibbon-of-persistence-a552df@quoll>
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

Krzysztof Kozlowski wrote:
> Where are all other properties your driver is using? DMAs? Resets and
> whatnot?

You are right. The driver used an optional reset and the rx and tx DMA
channels, and the binding described none of them.

> Did you actually test your DTS against bindings?

Not properly. For v2 I only validated the binding files with
dt-doc-validate. I have now run make CHECK_DTBS=y on the v2 H3600 DTS.
It passes, but only because my SPI node also leaves out the DMA
channels and the reset, so the check could not show the gap. The
binding has to describe what the hardware and the driver use and not
only what my DTS uses.

I am dropping this binding and the SPI driver from my series since
Stefan will submit a driver. For the rest of the series I run make
dt_binding_check and make CHECK_DTBS=y on the board DTS before sending,
and I compare each binding with the properties its driver reads.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word binding.

Best regards,
Navid
