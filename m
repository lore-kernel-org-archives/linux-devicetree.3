Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499280;
	b=qj2QHeRZ3Q6PrxBa6THkaNI9URYiBDczdv8Vtbk7np4ty6NcmZK6juE2GdC0f7YIdNqc
	 IzNMs0LPHd/4xtTUB7RWCBedO0JIWvn8N5rrj11Phj1i3My/N71IFoOtTikrak9xcWe68
	 cVApfO7APEdvW6LeWvZbD5/jE123ztVrJ3nKZHFmOsNlbE3c+hlq7t72T7vWj9yZWRVb8
	 Jr5E5ricBfxg7upR0jyRjcYV1JFjam9iwMSybjhjGs6CSXoX2xJ7f7hJW78mfzKtGB38O
	 452iyTR5TJbvOUZvFgTqlhkJoCB2R0tat6n7KGTCxC/hOQtF2OyCBw7nic93cTorkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
	b=xz1DL9pNpc9UmYGf8rYLJvp2DVCXbGcGjM/lTFTEVNYKM7R5A4NIaGki+kSx3sultqUQ
	 un1cr8nzRpRjBFNaJYBg25n1ilclntRkYebtEIcUKy6otJTo5r4EM7DIw145drV6pW7fV
	 7KKY/IB8s+IpiRkW11TCgxag3YakPAjbgw+uu4wROA/4F6WaarKEFGEwVxGzux/2e2LsT
	 xfjknKzVsEC7VGQNJNrfj2LvN3aLxZg/bNm2sR9jsXxCfHZcjOCN9UeY4mH+lLHO5mZW8
	 GEAfwCPYTsWvLwks3cVL3XaE73nxzH8c1zVh5M8S7/KwZcllBBow4XXAGamYCJ6nI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1nMmDHq;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD5606A323
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AD5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1nMmDHq
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1948255c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499280; x=1793104080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=q1nMmDHq2C4UkjrZNeo6tN+Zd5a+7kHiLMyrQd5OUTLT06LjSe4LRyhah/BIvNBrJI
         +5nGjTsb1wjU3Q111fpXxDGi0f9Dj9h6Q7hyvudp7ryrlSdatr+UI91fVmiyh0iKRNte
         G4f0cIWPCy2eldzVRkBuNayjxQpkRdhuLa3JDCtao9VHgu+FOcKv21VAkW1ud+VzMmFq
         3z+WCiiOTLq1rLrenEjOA0mHoXqXIBN1sL+hSk6tXejz/HTxuTwnK21K6hJLW5vOQtyu
         vCABdffmvZkOtGiGr7xZYOE2ccHGoE45y2+mIU6Tm6xVpVkJ65hajHFMbiGIYzoACpN0
         O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499280; x=1793104080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=rINzDvemVPgl3C3pAh4vGIA/+qVeP+WnUd5WzeFmtrL28cCqQRgDB7IxsozhiRIKBA
         omrchdO/3omb6BupQLQKZb/nvzNV4t9yvkH+qvsH4febqHvEJXdFF3GVrWE7WX5Br7Kt
         Os8a8DNWg9e1CchAAfS7BmPEH6SuEd+MU3yw/KFp7FVd4sVxWCLsncYDcEl17MkJhr5E
         OjK4+9Q90/8ylsMwk5SaHCqTIqF5a/gxK8tk68CJ2aUM6eMSiwsDZUTk4zdk7LcqV2GO
         cRrq/rvtCN0CkuEea7IFNLUo3LizwWxsT4euh8biIj+35y2kVxk/9qEIAGIKoGeeaTHs
         S2oA==
X-Forwarded-Encrypted: i=1; AKwUvBzfGuzOgEbQU3FjhRCUNRXKqNwifRs84IBoII3Ntsm7iGftJ5gw9A1mGphIVruoi2iRbE9nm5Ic7Q0r@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/3vJ1kJYC8uKctA4S9Ks+9XO6KJt1fL4m0EefCW+n0vdfW89
	HcLbH6bUJU2wyKYLKra+PInWuGpo0edwoDT2u17sy3YKXp1YlU3OaSSU
X-Gm-Gg: AYBFou0+mt/yp6tz9RB/9JEZYt7GnWsFtirhhl76Mxb7D/yyDgFxyHa7tfuDsofqc3g
	VMephJ/KA12Soe/BdpYHmR7z2xWUB908somNnm+L5Yl4NiRqFUw/QTd4kHTVklAoyyd1ZAnrJKd
	sUj6mfycfDYpDagamZYU5kVl2zrLY2R9OUBN8zP8UPryUPHQm6WCupqarcmLxQXkE+on2jWV0pY
	z50GqQVS2IbT9/Ll1ybCLXMYYnUAAzqkHzu8oU1qgHTYQ9nSzmIiF+g0t0jIZNd6vgcn8U1Ty7G
	4G+BIb3kV/YZH2lu+oWJgxCbhSchFOOpvADMB3UG45CN7L75BpzwSXsSEoQG48gUeWrof/G1XHH
	QWRH05TLa2QdI0U+bGNYGA7w4FVFz+E9puwNc5/j4AGtWMTJkD0PlSoalssvK0oGBV2M4zwLvDh
	LMs93HEz39XkwWPAjDeWDFtJ8cDYp/IZjM+LJKi0BQ3Sutqd9aeF43TobVMEPM6NpEqTP15gw7G
	8R+fcaVdwKJXka3OYF1y0d1XRguxeG9d+UBU61BwRG0Ds06QWwmSnePqHTGx+RBFEt6RzsscXSQ
	jIixWQ==
X-Received: by 2002:a05:701b:4302:b0:165:1f2c:5c1b with SMTP id a92af1059eb24-1850d37060emr13962847c88.4.1792499279662;
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm36015493c88.15.2026.10.20.05.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	andre.przywara@arm.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	enzo.adriano.code@gmail.com
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 09:27:46 -0300
Message-ID: <20261020122746.41699-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org> <atcm2zqDs1P_EDr0@ashevche-desk.local> <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
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

Hi Ilpo,

On Tue, 20 Oct 2026, Ilpo Järvinen wrote:

> For is_power_of_2(), 0 is not a power of two. And it also wouldn't make
> sense to have zero bits in the bit field as it's same as no bit field so
> using just is_power_of_2() should be enough.

I think the reg != 0 check still needs to stay here, since the test is
is_power_of_2(reg + 1), rather than is_power_of_2(reg).

For reg == 0, reg + 1 is 1, and is_power_of_2(1) is true. So without
the explicit reg check, a zero readback, meaning no DLF, would be
accepted as a valid DLF.

I'll keep it as:

    reg && is_power_of_2(reg + 1)

in v3.

Thanks,
Vinicius
