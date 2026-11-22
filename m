Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333989;
	b=OOamo0mVM638l04V6chO4zc9lGkM53U+TXZLcBKp8GVKe4eo6ukNJiSA3VhwuJZ0I4n0
	 u89eBILLX7OXz0NqOG9bnW8SghTD8HPwwf6I4k6JMSHnSNs6OdidQPhXckRyeEXWSKHG/
	 Xw5vOFF/unjLCgMSGfVJFDnTkjeNg4JYT0CwWvm0qk1Bv820ljq4cKlzdce3lfOBbqRnj
	 kpXYoF0BZMkq2oNQoVuzHv68D3ob8rU5n41cqX6kIJsA0aoidP4cQDnm/fKkmtwdhQts/
	 umNFJeAOUcFJT5xBT873sUUWRFADg4cHH9VRNroxs5BwfqYnB9DxIOVq/UBVcqUlI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
	b=tqRYB00Ls0ZNgiN4eluN67DCCxY2KQp2V0efBPidAeqPiqZgTwREsX+U+PNVD5T5xv49
	 q54fosQQwYfqVL22Huw+W2ey9SA66mE5La9n/ZTa08L4xUIdY5ptTVuj0cFxHEijd5qv+
	 eysKANtq+MQHrAyc+tarTMQF0LmWkikBAlccxKaoT6dYUI1p61EMDQUMJKa5hEh4HTFpd
	 y2rj3eOOu/0H4+523wN60c7oQ2rJ0zaF/7N7TiPTgXjegv/G4A7gQu/71AEzAnSk2hAJz
	 aOfUl/eLQGXOFesZyo5tOkCAgL6WMkiUonj+eiFkzzd1YiZtPJMT+yb9mDpiX5rX9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esvp1aEn;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB4606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80CB4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esvp1aEn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c516a194350so40461766b.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333988; x=1795938788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
        b=esvp1aEna3X6U+1FOHzsfniSJuTJNvN6s4Dxaf87ORiv+92ZE2V0D/OOHzQ6sflk4i
         rwYSGYOA87brBKhH+pjNqo8gYEGh/bBHr/daEJvWpWFIQxCyUxmOkEvdtiwR2HV+SCVh
         xDTA8wF+eSsge9zTy788/YKxuwvc+I6XyAx2BFcNQj88dk/xojGgbNOtmkVYZjwmxh/H
         b0yahv9FVYJffK5f0pHOJbzR6YyvYQ3wmzb5DCCs4MHjlnRbdUiUO72ZXCFPK56ZeiiF
         4tJMwwR0jl+xpg1T9HcYgNdvMpdns18UGHMwXx9UJ+Vgsx/2NVTe56AMtDX1qSLygGNf
         KDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333988; x=1795938788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
        b=YN7XUnXEKN2dSpPR2EO98O+dONQrPzux2eEmfd1P+LCVWzpA0UfXwJU5DDmVx8wyId
         7meAYQ3mtQDB0nFV1Rus7uGyjWh07dpRElHHkITQBRqKqdtNhPryne+sfH3hxhrs9F6C
         etZl0WaMbX1yhBRsAEuftkk8JEDRI567TL37zjuDT1nhVOIwa7GWy+CKPees/D+rnXoe
         1aEpjPfHA9nd8+U++PahFHgYmrnti8RmkalFLufLHmKic2XXV5axhB2ur2KXMMWPwnWr
         ATuLXAxXpzvlWnSXefEmT68+Hdqqa7pWL27aR8FR50m6XOVEVeCzU1ij2guYl+VSBI4M
         s69Q==
X-Forwarded-Encrypted: i=1; AL+hErF6XCLR/TKRJusK34aNgUuVTDGfY095WET1wvmfICYkd4GI9moz4NWUz0dXk/dv7NQIrXF4g0LtSEAQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aj4G+l4J+iI5a6Lz3LSqE2MVcywJBaE3svtXTre7JFV50pQUM
	/qbjoACukG1TxbH/rDjr122yLz7TOuxVNiqey/7GV5NRJ3e0O8cD9MfB
X-Gm-Gg: AZFdTZfqQ2zS1rUyduULy+JLmv00u63RHDDSCPTIxyUdBNMR2wY1Q681vYfLHfwXxpB
	nLwZrCnkT8Lv5WisD+Eibm08jvHCMvfbxwY19lGGP2vkPXj/FtJr7HRmo1WUEqgVgR48w7J0K6O
	HNCVfQSX2vFNt492ViaOAyoavPDJO/1lqJEaO188RXwliUIH1zfUEOeESgmCzuXfNu1btDMAita
	ZQGGpPtJ6Lqbt8AS068S4bf6h1xFWkKZ4DHTOcYBdRo4v0YqyfQgChmBQ/XgoJrsW3QcISg5LXx
	Ama29g229PFNzu+P9Ju/IRETF3YqHoWIcaOI8H6MA6eq8qrV4VBchMUyY+oJCfC+HzfnEuntiei
	SMP4Y3Q7C0u88atPWrU18b3gXeX8oJ0Njgk5tiZusHnObIWqfJ8VJMpc3nZII42r6CqUi67eIj9
	xpB6ZOBo9x5MLrYzxFkDm3uuHN+IYIctIv0YzzPo4NG2L4dEYwyiUqs4oAOPFoZSDpIbLx9zxqn
	zn1C/QcB2cfR7GG9RDL6puNtJ+UfxuAIXmxrrAUqaO7Pd6af3f5737iC/XOkbW3P/vpIWgEoXzT
	Gg1UmH4Jz7mLityHQI2r7rGff8A=
X-Received: by 2002:a17:906:4550:b0:c4c:e713:d296 with SMTP id a640c23a62f3a-c513a893bebmr534161766b.31.1795333987760;
        Sat, 21 Nov 2026 23:53:07 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm285332966b.22.2026.11.21.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:53:07 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: proximity: add Imagis ISG5320A SAR sensor driver
Date: Sun, 22 Nov 2026 10:53:04 +0300
Message-ID: <20261122075305.2920359-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118105339.00001bab@kernel.org>
References: <20261116074013.355363-1-tadilhusrev@gmail.com> <20261117173333.1853986-1-tadilhusrev@gmail.com> <20261117173333.1853986-3-tadilhusrev@gmail.com> <20261118105339.00001bab@kernel.org>
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

On Wed, 18 Nov 2026 10:53:39 +0100
Joshua Crofts <crofts@kernel.org> wrote:

> Hi Adil, some comments inline.

Hi Joshua,

Thanks for the review, and for the note on the cover letter about the
threading and sending v3 the same day as v2. Both fair; v4 goes out as
a new thread, not before the end of the week.

I'll take all of these in v4: the include, the pahole layout,
fsleep(), plain "return ret" instead of dev_err_probe() on each regmap
call, the blank lines, PM_RUNTIME_ACQUIRE_AUTOSUSPEND(), dropping the
pm_runtime_dont_use_autosuspend() call, and the duplicate error message
after devm_request_threaded_irq().

Thanks,
Adil
