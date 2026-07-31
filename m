Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B042DFEA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508317; cv=none; b=Oou3Z3L3UQdzHLY5qI3201P1mL1Nh60ZEdCM57vmbRNLFPGoFv59m+dwxLkQWM3HOE5zloK5BwVmxTujyzjIO3X1o9BtyrJKABYPFlBeXcs3hRXvbLTaK2jaq6D/oTQ9soSxU9QW6JXBws2E9LFG3AWOt/h+aHPKKLWEu2J0OCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508317; c=relaxed/simple;
	bh=l9fwqzHxeMnBKlvaOPLHoKvNOlfOY6llkdvXG3LCTf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMxLwM2jgOVrECjka/2UZUXLh3HV4XNbBZNW9Yjpw1jklkgqoRJTqAnzYcc1GjPvNrEOMclPBdMj9irohQTVLFdPE09SHKP9ofwZdjfEmNeT5abAt2G+9R6NyTsgyNyK34h/kprZnn/iV4s0TOP7la98qWJq336GLgcolmT22PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWA9cIfp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWA9cIfp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab973140bso12069975ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508313; x=1786113113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCV7rUk4XsmSK/bBAvmYQSxoopJ6iff6FRBs63f8X+o=;
        b=QWA9cIfpnby4d1/84sLFxJK9JV8nt+TRDZomsA7ycxz7l+dpWy3QQT+lvbf56t1z6b
         LAYvy7SGmuA8rYkAarHg4nC5nQBGMZOlvrNlF1ywz6edbiKhSjkEhSrXBmOfWuysu6aM
         dr+UUMi85z208OYSLNN+S/yfWtga+mXw30x7Irnz+mFW+WBfB7ogXsHeFtL5jeONHj0t
         54KZcTvBLxdKo+fUC1DuojcU7/6dTlxNG3IhiIgPm3QTGGNMrJnxTPmZiIPC9Y4zpi2D
         NZf79/UUSdVKIDcW8IFLRZG21KdnBPHs6dLP8wtOq3/DwLvTXQX9+Z4MLQMFretrH6bg
         bhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508313; x=1786113113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCV7rUk4XsmSK/bBAvmYQSxoopJ6iff6FRBs63f8X+o=;
        b=tUxzEEOU7Czdsm+++rp4VJ5Jfrv8jtXawheDgY/zvx16J0G5ZBmakhMl08aZkn0O6b
         HLDKA4/+6sNWYpjj9ijKiA5TroXw1TNeCHEI4nC6QejhfvKMvaLWI4bxZRAAV7OL180N
         Rcl2PSHP6/m087gWIYMNuX6n5JmP24cmqBP6p8HuWnd7IgJfr8mgeAq9CpJcjJeNsmCa
         oPlu5Vs8Q+Ft74GBw4DsG0X8GkGV8jJA5Wkqx40+zBFo9RvLXPMYkMB84hfxnpD2cxh4
         0+GZyJ3/jIspNrCHR0KTj7LZsshj30ZyBJH4vcJS3Nqc4TKSX0e7M4ILC+QKYI0M4XGx
         gcnw==
X-Forwarded-Encrypted: i=1; AHgh+RrLxjMuX0D7lKSVyROPP7lZFEjNKMPhJcJ6/Epdjh4Waz52h7DtCCbAuBZYabPzBcpfQ1npxoj/4Rsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyquk7EH/I4X4lRRwzG28TKZLpEs40KEMaRirhb+w4rn4KOodvE
	SH6inBGj6fjJjDBLMQQchK4dlOG7NJ/kjwX680bI3HbBuW+pp/eGbFZ1
X-Gm-Gg: AR+sD11V0hFZZF4mT0NQ9komRXeDiAspTkHWYCeSVbZ+HoElwGdU6VZaohJqhDtlecV
	XUplpylzYSTUBtmEpPZxesZdG/5NKuFRMOtml9vpWfbfSUIcmHlZhMprwTR5xJ6xmwz21ccYu14
	nXa3vXRyMvqMKnO6bGctQkEvL/s4bdx5rxN4SM0W2a3NPQ66Sd1hp6Krupu02XWZ0wxnrGVKfey
	PcBp64/vZKyUKE+gbeMdmZRAN5wxdnEEnWdBABN0+QFYknDz4j9BaDvFnZlOysMaaYAJHJrRgae
	zAC/0B7q/q5IH6sFhhEKYyA7Y4vINe8JOr20NQ9LD8JXrgePG5568ts//NUigvMpFBM9e03TXub
	+/rq+sL2BkcjCbEBw8RYPYCwUE9ePlAxbReSQnN8xSZwT4udJhysoTWgN7nTaN6a3cYb19dbz0n
	csAps+xCG1NdfvB//wD4vKswUzakMQiYpUaGSvXygCbUFc7kq2b1OABV91NAK92S8ySFmaCOJ61
	g==
X-Received: by 2002:a17:902:e5cd:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2d05229a2a8mr2499625ad.25.1785508312949;
        Fri, 31 Jul 2026 07:31:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb7c3sm6097115ad.54.2026.07.31.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:31:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:31:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: pmbus: mpq8646: gate the writes
Message-ID: <179a2f2f-b932-4a27-ab6c-cb70f821cdc1@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:02PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU core rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
> Said differently: some wrong register writes can and likely
> will physically damage or destroy the chip and/or the board.
> 
> To be safe, it is disabled by default behind a
> CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE and we print an explicit warning
> banner at probe time when they are built in.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
