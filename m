Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100932;
	b=iMSGnXTmv2FSsinFLkQpvZstC1iLrV3sqiezZU3Jozw4P8tmhgaCThkEpdUeaBSOcnfY
	 hK/vmJKzUI4Hia6kDkeO+iu6TfqfzDRhx29BlBCTUNWbacmNfH+MDAeG9pdaPlW4otJZo
	 nQY0zBHouaLLtdNFt+cI06TLkoX1Gt0IkIdZAliFog6HDzwvbb+Ekz17C8s280KEm4rcX
	 irMTc+C6P/vQ2tdoAuqevptOVhp/YRk0xHEKmxx81ALUjPN8ylThKq5m+9X47sAxOW+xe
	 JOh8hXSnLExhT86xM9JjjdWeS2X5QMnvAZSSVmWHKGsyy5KJKq4ch5wEKP0n2wWZktw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
	b=rfWM3A9VOr2JPE4CKZYoZuV+IelWKnCseNZgsKSTbh/iVIZ/CVrJBQYYP4cPWWK/r2yH
	 6VnDvBVM6E6KdEUgB3PqJgcmpWx7moYre0edvH50w9GMHwQC3P3dwhGe7T1ArdbQe9PxX
	 sOXits2hN3l/lIDnS+piBD8nIQb+ndiYJEYjGGvSfZGO/38Wyz3U/66aIFBp1kh1RdJYT
	 T9bie+ydOzKfobrEx7cXMaKRexeJ79U33Rdn1oB3JomGGQRJg3XsNgK2+jUrRgTZJPrry
	 9joa6mcBuovILtnAFdOhDmhhBmWgoOJY7LafEUqnkpVYX6tE9418369btelNlsIgvSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09E606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D09E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfc004920so24212671fa.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100930; x=1795705730; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=P6Ly+rnEbtb3B56g4DtN4Fx71CgoOhCEXnaEgUpHcKAS8z6q+OC9aofCeJlbWWx72+
         2lws9UULc+V1eCneSwRN4OOY4fGNgcjG5NzKfldBMjScI+0fzgEW7m3wmru3i+luxMYU
         UkCQaJ2cNA+h9J6K8+GfHL1NUszyiAqzanMK66aR1kQs1oLx7VMaPzMFD/6IMeWzCs9X
         1NXG/laty78FQvJvWaYERAfgw9fN1LHBaG8CfM/lUuhqS6bbgozHduRlKicmrh+VX4Cm
         F3CKFwNzWc3GSHWCcnDVmiVmNDcy3GoBvqrHvR2UMkSKVnNSyVS1LRI+QAF8q2vjUOFH
         oR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100930; x=1795705730;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=iZn4aTqnrKDGmCKL313PIDwcIzdvRpa+urZRpIYzfrWsPPfGfOeNLFzYa2isnCCaRQ
         q9X9kvTGyRJWRlU4oV7mPg/BRsPCJ7PXgCHXfMR7a30y8KomLQ8nO371gw7eX5SZ1zYr
         W6CAVTy61CPlh/WeDpuo4T/Cb1DgFLE8UY1615rbnjCFiNsh4dEYjzVQB3HaQKcfl9lF
         2EwQK3CQ8W2j7foSTaxrIGpOYPYnqOkDGyHiHaW+3bR6X/F2lVMdg7OTb33zEtS4L67C
         qc2UIensADXS+rbKfIuMVufIr2UTKb8npZjFz9Qz+AiKGAVPTWN5g+WoeVA1RB9xfepU
         nR7w==
X-Forwarded-Encrypted: i=1; AL+hErEgQ+BY+ViXGk8YT/+73PIu10Vin31dda/jwiXS9YY3FCv6wGseoYQTWYcLS0tzujZVBeVZXqZCXDPq@vger.kernel.org
X-Gm-Message-State: APuU4Z+T6FjofjvARfgc0NLm8H6pfKp5ga/17B3jtXhQFyThVqdnRWJc
	KIk/tkffTTPQ+7FbM04kcwQM8Lgt9DP+OVNQECls8kyvK9tY4WdoDsN5
X-Gm-Gg: AYBFou34gvfFlzgoTPiMeWPVfc1g+oK1TGuumRVbC5bpSSmNwzH+0pBdGmsaRADVGll
	U7e5jBU7ctqD2MstsM7Qfmdm46GSYVQwhv6R5u4/YFKA5WAQkvUFGsvp8oNr6K/L5bNXmnSSTuI
	o0+SPTwO1UxV5a3WJtTgPJAK8N/WGCNhiML+AZGxwzTdWvU+FiWEs0q9kxOkp6ACrDEuli4e5gc
	jt/pp6a04E+q+VBpnAVaMQ6h2Us4q54JVk+l+JOTNeTd6O8J4GOj6rFlvOTjqdtxdxE9t10bkc6
	HFPCKH1Z3CnxX/1fi+X+1jvTwQcoEH0bPQowB7Q8x+M4zJLgXDIeo/QJZFNi3a52lPLUT1hz9vg
	D11a1GTvvm81fytch8oWIvtxJzwJGC2TGJBLgLkRyUqI/v7JDrs9MLtPy9sGlvuKi72ssXDjYZa
	xgprVK+Ld9K+a+25p6fuoF+7tXzj5Dlmgb6wFHSS34xWMm8ZqNRir4aZTOAtjDno3JVYwbUV6hq
	7QMsOWWulgCSsVSutAZ/DgPQ0qSSXx5psBHQqnpUVZ82Df4mDHtwLW2eoguvjzuwXAkST+5/bdt
	cSFw2dPmZ8WRDtM4mT68D9H5n0wTdr8gCEgWSoQkNR9HMszXMj2bTFg=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id 38308e7fff4ca-3ae7f9da258mr961291fa.11.1795100930127;
        Thu, 19 Nov 2026 07:08:50 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebef2d0sm11809841fa.37.2026.11.19.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
 <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
Date: Thu, 19 Nov 2026 18:08:33 +0300
Message-ID: <179510091368.5.7008617353574583652@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Bart,

On Thu, Nov 19, 2026 at 02:42:27PM +0100, Bartosz Golaszewski wrote:
> The driver looks good but I cannot pick it up while it references a
> Kconfig symbol that's not upstream.

You're right. I have replaced ARCH_CORTINA_ACCESS || COMPILE_TEST with
OF. The driver only uses generic MMIO, GPIO and IRQ APIs; HAS_IOMEM is
already required by the enclosing MMIO GPIO menu. There is no need to
keep an architecture-specific condition here.

I checked built-in and module builds on ARM with GCC and x86-64 with
Clang, with OF=y and COMPILE_TEST=n, using just the GPIO series on
v7.4-rc1 without the CS75xx platform series. All four builds passed,
including vmlinux for the built-in cases and the modules for the modular
cases. The GPIO driver code is unchanged.

I am sending v6 with this Kconfig change and an updated cover letter.

Thanks,
Fil

