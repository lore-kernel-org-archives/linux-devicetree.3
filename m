Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A623A564
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805287; cv=none; b=bJ0goHOzp/aLsvtbCn81NA83LeA0s2hx3L+99usGNdQeT9yyzooIjj+jy+OiHHyxVRZYAvWWgF5x13jVQcNGMNDvm/wgbtta0RH7K8oC//qe6lJ03h3R1uWXaOhbsHXTJsQh7ZQ0wx+oflSmWtlMNJiSJnBLox9uPw4xmWD/54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805287; c=relaxed/simple;
	bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=ByYP1PHMnebPZ0uLAtPubaChcwV8TReFjcdB2xPEdrdSETsC70jnuYSyHyDCfiNxaroVAQVsMj1s+TiAKZnqVAFlGeB0I+7bsHja7jPu8UWKZ7g8LMlvcHZuHf9EFSglKPLqT9ptkT755rpYz4PGkCZ/vWPF64ppiQItsJnzAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeISQ3hY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeISQ3hY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso9951445e9.2
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805284; x=1790410084; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=UeISQ3hYRl2Z2zCPvz8ahkuCchctyJDR5bqJZQbmfX/tpMP077Q1TYnz7UIEqCJbnG
         u6Xf9ibNBB8KE4pVbXM5Gpr6hFXYQVVeFhkLKFXTiR7l6zJX2DFBsln5UW+BtlYDyRhy
         xfT0kfJfyQHL+VfTMz7fYFQMiZbEFhRAf2mkCI/Yi9kLhOAeNr4D6AC8+zjB//RX1Vmk
         EiDcP/8hJhswas5KDTEyujl+GwrO6vd3PYarlwjzT47GCxLyFnXKZ7B89niqzl4D9yH5
         LzIxpdrXnvmqp/l3F/PkIwc5GG7Zi8wzbvwtoVFzmfVW1j0xKKqdWQgbHRffnsiPKzxD
         7+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805284; x=1790410084;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=axbKbNCTcoJ9lT/J+1TK0AytgPRv+cJPDJVlUCNwm5HxU4KSUBLnOGFXqvQysFXtSc
         hV35HryxSkOPpf/xs6q33mhmI6A6S1unTpYdl0OvBYMvs/i7ZcubFMLCz5lkGiUCxcj3
         /XiwZP5aUn1Lki5PwXpnXkGl60fSrcrtNdvFtJ3I9ED60UxmkElXvD0UECWJsaFRMsAR
         1OL1PziDB9j0FNk80hTZzmeEj8aA2ho4i7wuSL19qlpoHcfuHCQoyILDP5vOvxDwqIEE
         ZfMdkCW3c/wNe35hmGeGXXKArNc+kznDJszLwRFp1ZUs1I6vSWnvzvVVOL7fcK1i+8l9
         JH/A==
X-Forwarded-Encrypted: i=1; AKwUvBz6z3bR0DHAFxFpbBS/OsUn6Mz3jnS4ZVqnHsUgIeI66E/t+lLwyFF3pwUHgxhqr7mlmbYPJSApJSiR@vger.kernel.org
X-Gm-Message-State: AFuF++mimzPhKsBMj9gMPLsCshDKci0Py4cefLwdm+4DXHa482MU1aZ2
	wePYimlm/1HKRLG0UuDs/Rm2LFb6YN64VG8kUAeN6tmadD7p+uW247a5
X-Gm-Gg: AYBFou0kqiaLSeiMNjDKL3DOG90+rh64BSMPg9lNcBsk89dl5BEH+hyMZTuQ8O4hN2X
	RQlmv/g57LEA/ZditdzyS0+LK2l5Ct4LmB9oKLynhh97xhVkGmhKmsoCcrEn4HxYgUtB0tNOlCt
	h2D1oM2pb1QeQmqg4gWpKQOFg/bSaCVdxv/OQMBNdw2hPRaAKFGzUzqr0rvL8FN0U0Ychun+1k0
	YJ63HdDpXLKfZ1BQcWsO+SY50rLVlzU5NuHDdSdeQZD3Y3ASi179lTS/EHXCQ56aige1+5/rmJl
	oU0jbD1Tasp+ORhX9itn11rpbq9QObZj3sOzZTEeTzz4g/Fuu5pwECRBunwM9Lf4rb62Gez5SOC
	m2exNHAR1oxyvYcktJ8vbtqsvJkP8woomvN526janzg7IRDY+aODVxWYhf2kusg5zbZTKgZwZOh
	WbS1hNYPquPx6hLol1ALzVYA7ooO9dRrbYCSzCZOOGi/6GzJ+9vwmaqntcNbX5DJKaeU4aFOZVb
	PJfXXJa7P2vpP+cZFHg/BVIFNWpBQ==
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr69617635e9.14.1789805284421;
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Received: from localhost ([176.220.97.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229e0sm4504980f8f.4.2026.09.19.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 11:07:37 +0300
Message-Id: <DLJ50GBWD392.55LXSSAFNR9X@gmail.com>
From: "Omer PALA" <palaomer100@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Omer PALA"
 <palaomer100@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "open
 list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
X-Mailer: aerc 0.21.0
References: <20260918194434.9240-1-palaomer100@gmail.com>
 <20260918203257.6034-1-palaomer100@gmail.com>
 <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>
In-Reply-To: <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>

Hi Krzysztof,

I assure you this binding patch was written manually by me.

That was my third DT Schema i have ever written.

I used ai to understand the structure of dt schemas and i wrote this
myself.

My intention was to add the Devicetree binding for xlnx,xadc devices.
I apologize if the YAML schema structure or formatting violates current
dtschema conventions.

Please go ahead and drop this patch for now.

Best regards,
Omer PALA
