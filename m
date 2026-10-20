Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493286;
	b=Th7xqtcvZDNr9jYMESwnKsbcfTyvNxm7or8tfWkWA9W/if21Y5Kp3tgPNBAze6aeTdO/
	 h3MX4lir3V2VsIZ02Og8ZQPUrvKiWtc9b2jS55NBITXcaXCd+kl99Fehk7BZ8BlEBL3ao
	 83tC2ft1FDnDlilkxAFOgTMe5yZL8kz6UqNFtdL++M5FlpztmjLBEgQ4vUOA0t88iKulo
	 Wb0TdSOOv1FyXdznR1eNcu+qfC4jb1S+7nbT2W/xhnZieE0eAzlsu6EwBihrDH+A63z26
	 kOEuf3pW4fQLDGNvh+avvyUG3GqK889FsNXbg99dw2BysGUesVJKIey31f51Y5edOPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
	b=Dud9aRVgV6dMQYBscRRFR80jw6X7Ey01p7k7FaQYLjzkG6lAmXnAPNGdrraquDSyww2u
	 B1VY2cuHgrk5PaHhNG5UxzDCxAYVbF9enxEfP4i3fHghMuP+HYb7GwjY2WURdDzJ/Ocv1
	 xROfYNXRnN0K8bRXy1GdQVGiU17CNOjdj+lK2Ant8CwnEiNlLRWhS4aOIXsUlsDCkV2Xl
	 QRpIQelawNyHn9Zt6yLf34edcL1gzEwkNl52eCCVNTN1YMldAdjokA3PxVkKkyAKkfuNn
	 n6NC7+hWTVLNSvO5m1apmsQQc06kR2LhHcAvCZGweOe1XlF9jgaaVvxR10Bpm7vAs4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fiGsEbWV;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7E606A329
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC7E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fiGsEbWV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so621792eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493285; x=1793098085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=fiGsEbWV8Q8RM6j7ZxuVSvjNOICcG6msaUt4ksLEKv+iwv6d8mxyjI+a+1OU0I2GKw
         F6luj7kc9MNOSHVKmv+62GQZAdeQzjs0durajglBeRLj++pSzmkAq961oZr4j8SXZELj
         JXdXl+6PIKVfjB48KQKvWRtyW8qHoTRIiGHSLRi5EVhek3fVAbfA/y6+onr+iY2O/bHx
         KMmmpB8oRIDXzcsu3MVc8a1X9tfsNan5xDoWsVMKchyzXgoTALcRdTArn7Q0oDFxM1fp
         glTTGMeSvFQkiHXwWmnRf74xc/RdAusZLhgtR0DICZDjNauabVu08HwZiM4jWCxGQ19J
         SS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493285; x=1793098085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=oMWVrjXuxRiuKKmfER3gFgxXnrisVdyWaOMTzgEf8ezOr8J34iymoM3Zgo21WOLr3L
         BZ0+wDrcuYFUsR+aLL03XSZNrlrCJhEX2Ht0irOmBGT8UAliJk25eDC3slcn9M/2DHTo
         9CzfzRVVOrykANpU/UmD4HhikszcemvlWd++LCXpSavUnTeP31JqqrYa5jCKFonTyY4A
         rAeyien0KKZESrVyWNPKXnwYY/eBB7wFK5aQpOB+JQyknb52dYZeSwtqKY6/1xBichwt
         C9rqnVBZZRC+wTnMKLPkz6dpc0VOmBATgtRDWTrY95w3hj7FTd1deCnyBLQ0p8MKF0Ph
         kT8w==
X-Forwarded-Encrypted: i=1; AKwUvBwK131270uKWWCP0hRL6Pr4ryrgqfVKtXaj/I2m6SnheUPR5zNCVm6A5Mo/dHDVWxnpN6+fplDlJamJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJGG8x55bbQGu1WMoX/etFU+sGVWkCUmcrOV/SRC6e8wkPq6J+Y
	8ZA63ClIRXSgrHevmiR7noYHORIiY5mTJOEVb5nDat1Qz/KLVcTj6OXb
X-Gm-Gg: AYBFou3xC8oJIBK6jVMGp1bBIDJX/YQF21xjGKYZBzVk5jYd9mzNLuJV7iJOf44StmT
	+kGLuqRwMmkHkYQX2YJkklpEdx6bb/eKqXRgELIbUoz7pRKUE3Ig0JAWx/w58Iz7lff6NUWjcmP
	CPxPos5+Qn1zfuxEgDThgprpSLEHT/E0/gMj9wxm9Rw74b20QNaYdwTT1878vRKuhnPGp8MuQLF
	E5bDOqgW7wJLO80UkUIBnciIfGyI6q9qizus1cJcmQir6g2P0XyQ7zTQBXBN9H+pZVNtuj6mrFi
	rnbi95DnXdpRYD9nFxxRAkZgfnO6BgBrBOWyF5Q9iiplyUKYkgNQ6KXWOChDogzK76j6Yg70YSY
	0LgY6QHhRaH2OsCvv9qb7wThhQwEvnzjrkEN+33MCP+4Rd6o7ovk7y1bTJouvVpgNOZFtD/BfnC
	SQL56n3mBbYT+w1hzHNqCsfiVjblAMaXPUSWTTiYdaQs2HD4ll5HxOrvu0Uj5CnapLxpM+pf2Eh
	nXYr8g/u8wYvE22D2UgGWCCtLe8BH1CsMTQcHQr8vq0zRg90h6O1wpcK/cNket2tKRlPKtPtLKa
	oJUoAEs=
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr13074342eec.11.1792493285129;
        Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm39596320eec.14.2026.10.20.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:48:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Tue, 20 Oct 2026 07:47:53 -0300
Message-ID: <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atcrpTI_R4kRM8pb@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <atcrpTI_R4kRM8pb@ashevche-desk.local>
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

Hi Andy,

On Tue, 20 Oct 2026, Andy Shevchenko wrote:

> > +		/* Keep a hook the driver has already installed */
> > +		if (!p->set_divisor)
> > +			p->set_divisor = dw8250_set_divisor;
>
> On top of my previous reply, why is this hunk needed?

dw8250_probe() installs the BUSY-safe dw8250_set_divisor() before
dw8250_setup_port() runs. Without the !p->set_divisor check, detecting
DLF replaces it with the dwlib setter, which is the BUSY problem
described in the commit message.

> In the case of existing _set_divisor, do we want to keep the possible set
> _get_divisor as well? Shouldn't we introduce a respective _get_divisor in
> 8250_dw.c?

8250_dw.c doesn't install a get_divisor, so there's no existing getter
to preserve. The dwlib getter is still needed when DLF is present,
because it computes the fractional part used by the preserved BUSY-safe
setter.

> But now I see that we have same function name in two files. Can we rename
> those in dwlib to, for example,
> dw8250_get_divisor --> dw8250_get_dfl_divisor
> dw8250_set_divisor --> dw8250_set_dfl_divisor

I'll also clean up the naming in v3: dw8250_update_dlf() with a frac
parameter, static inline after dw8250_writel_ext(), and the dwlib-local
helpers renamed to dw8250_get_dlf_divisor() and
dw8250_set_dlf_divisor().

Thanks,
Vinicius
