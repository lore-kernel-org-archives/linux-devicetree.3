Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0E474262
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275238; cv=none; b=expH4FLj5uJEKpFnGg2K/M5nmLN0HCvnCLkoPhYaE49NLSTc+/J77um3KRdxLXjQpgKau5I4ghHGk0/9m6d7KnA2VWcsvWvQcjfZ9xiQV8mYdtCH4b+yDQq5qbK6PhcZwx6xovYVmqVocJmGgfyExT0sjQm5F4SIMOnBC0bKjh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275238; c=relaxed/simple;
	bh=aa9uCvkt9fyuyL7AMDLLx3kzfweWl/j7TYaWN7Q7Jto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGTxW+ORWAM5miukrwlW8lDrhRjakfCt79A4LQmMv+lADUEQi1ja56exWWH0CzSpUCzotE14vL73owWlf88qMP2OK33XEO0lOztLz3mAatYqi9mhusLb4dFdSFNThnmQjMCAaqbKhg4o48m8p/4y3cka6WC09GAqatgPM7NF098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtoDeJBV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtoDeJBV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1833425e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785275235; x=1785880035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9vMpKUgzZHffelbejNFHNXhkEtn+2ac2dc9WRvU8VA4=;
        b=UtoDeJBVwVE2tgp8WP7rQR8ckBGQFRiK+5veUrrjtEQkZN7Wc0wy50/x2cYGO0Cx9Z
         P+VTWYdxNmvi0BB74bjDx+TBxGnPhPlleOsNfUpxVAt0Rozdyj+oDDMSxyG0yw9vxU33
         zfu85ZEgNeSJwa0H6xdIKrtxAUpTx48CUmR+Iy2l8GhGdKVcCsJHHtlEy1YbYTWqxEvA
         PCt9rJrdLC63DPDq7gbh0kOnf2x75pjW1B2uTcMWA6APDcUkmIOmqhpMV8zu1f5m0HYu
         PUxzbMf2WkIP/5AXL3PnD/X80927IhkiM2TUXDBk++7H5o/VULcfyhQTcSwrkBaEpQ0Z
         VFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275235; x=1785880035;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vMpKUgzZHffelbejNFHNXhkEtn+2ac2dc9WRvU8VA4=;
        b=V3MEk6JDDQNkre14S/+TVoXjEVUnUTpeOXbryaRyyGIRdPfAqbNpXS1VOHyVzcUUal
         0zNn4bUl5dSsWJ2hkMFKbfbe1vRvQiJwlMMVbawgd3R9vsTrVMBqOoIuFZFDZDtF8fbd
         nbMnGRneFvJwmCwFdp4H734SRppyobvjZp0LNjA3WZWf84XjXD1J7sxRq59i/0yZ//AB
         7hLDSUTTRpcglZrxWJDLdPLsHhyKPQubxtJM0r8x3ultGxh6izY3uD99K153is57VQEo
         Nqpj2YdOGwfvR4sh1c6lxXX6dCyJbRGbxttp7Dty36zdetKbYcQ35ebmiMQO2KiepP9g
         0F+Q==
X-Forwarded-Encrypted: i=1; AHgh+RphfcCEFvZ8xSu5sl61tgwG89QjIo5HoOGsTlLYhXLoQ8rjEKL+MMYt1vfaVYe+Ldoyn+iRwB9qeoWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx91JB0G3TQJ2xJcDr2LqcNICfK5C5b57bCWP7T+NZxoq3GEi7L
	fCPyhQNMEg2NYVRGWWJPx3vhxIphi1NepMEFOHmHHddO8uj5hTgIbUv2
X-Gm-Gg: AR+sD12FVtwHh7h0sc0TuDKKZ4Lwa0SDSY9Si1iyjO+Z2FdIs5GBlFGqp2tNVAFBxji
	aZxcmRoTGuLBu3W+YMM2Ahb4BwaFhTeQxqP4jJgIcON+D8MwGIO0bbqjAZBxx8mjMf+/si9KVsM
	2CYceVB5OLnPf14B7w9w35PcW5kPsb84nRypGzEXGUDoVi72QZKfvKSgBwoQgWVz8Dc8d8iZ8PX
	3KgtucxNoW4blVY78zA1a+JyjMFVia0/l7SiehQKp3awLsZkZYIQAA9tUoXkaYH8zuaATfMldvX
	SBDhShbEjvNTGROO9lzQltcYF67sEfzxynNMPAZkSrvkiyYnqgc4UMrfXAXgDrWhBT7RsVCz3+R
	tyk9qyeY03NUA9i9QYwjaY+SEkvpvLuTWQPbpM8+thEJ3u8cgvb28rvgtCBOfBgFbcDp+QqRqXu
	gFZGJO6VPDohxvcpQ+4onB6VIM1X0gJtht8nJgw27P7Q==
X-Received: by 2002:a05:600c:4fc7:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-496c6413164mr57842865e9.2.1785275235139;
        Tue, 28 Jul 2026 14:47:15 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm105382605e9.12.2026.07.28.14.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:47:14 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <maxwell@maxwelld.cc>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: Re: [PATCH v5 0/4] iio: flow: Sensirion SLF3S liquid flow sensor
Date: Tue, 28 Jul 2026 23:46:45 +0200
Message-ID: <20260728214659.29488-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260720032927.14fc4f9f@jic23-huawei>
References: <20260714085358.20842-1-wafgo01@gmail.com> <20260720032927.14fc4f9f@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 20 Jul 2026 03:29:27 +0100
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> Hi Wadim
> 
> Something seems to have gone wrong somewhere. I'm not seeing patch 4
> and it didn't reach patchwork either.

I have no explanation for it.  The other three went out fine, and I was
too sloppy to check that 4/4 actually made it to the list.  Sorry for
the wasted time.

v6 follows shortly, with the driver included and with each variant
having its own compatible, as you and Krzysztof settled on.  Krzysztof's
Reviewed-by on the binding is dropped accordingly.

Thanks,
Wadim
