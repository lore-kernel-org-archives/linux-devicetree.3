Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BD27FB05
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250202; cv=pass; b=uz5pIW6JKmo6pLwy1gIe7M/ZUs1nQJP1KqPTcJIhUH7lXSlRNiq998Gcx+F7M/XDfP36o5oNqXtnfd39gKbzkN1fQ4/A1TpP5dgVd/mEy5bV45UNYgQNdUGxniE/2lOLdYLisUoRWUvRW2BwBVKcQnkgA94fCUdBh45xznLy/wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250202; c=relaxed/simple;
	bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL4bo+Xp+cYWLUr5wv5XLty1mZr/7fqfgAlGwL7MEVuNHVv2rQwfAoZMlGMnYymXjdEqbiczq55OEGYOnNW3vviYqBv1ave8AzpOxmx0gYGyvSo0VOCRhWsOvu4ZR/IILWObnrKzZbuEdDsIdX7s4Znqu6oIrzH+eOPJ52ENFzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=FXroZHbQ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="FXroZHbQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd464d51fso306910f8f.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250200; cv=none;
        d=google.com; s=arc-20240605;
        b=UI2J3CmAnEJdkwPL4ECy9KyO8ttn5wX9ugr/h9WNAu0h7ldmpMbAw4ZoE8jzcjGdpj
         H8Xv1JfQkrj86m32/b2qKGSK9DdmJmvCMFXvVX0iMCGQ6B20KbhpsMTfsQZ5J/SBFKNj
         Qn04DVVmA3ds0MMaM6n6AHs7/swe+Wc0Nmty/zubTFslT3gjSiMfSPAPZY4Q4awqCKyV
         W5O39EYPPRTFMnSXDflQ0IDjOBhbl/HPC8hdkhXvmhmQfefwWpRNr1IaFQxYQhcuvXt+
         FPIyxZ3v1fw1E2itq4jLtFWI3vYRIudKJgDopls6zLXn9LhXv8Oh3Dwc5vMx4CvYMbpv
         DYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        fh=zFeav8rvHqt5bMgpIuYGuF+xYDOF0EtqUCKsO+iKhNY=;
        b=GwIrfVdm5kmmbDMijOQY/vtUr+NTIMc487w0B+2+QHOxZt53tCkF6EN3t7O5xyfnG/
         yBg1uJy1sNeAfSQOJCrMZOOnVREKyJ3frj2dN4XEAcMl5yw3mfuF1c3l/id98vP/m63x
         f3rtW1WA6cVhoe1c6AdM7Jbln1pq73GwotaiZCJwd3JphqWVha3EmE+ivRta/desm2Pq
         yTNsehtjBWoJeuP8c6iI7SCVmJjhAaldn2tkSRtULq9E0MlCxG3wUmxDZ8DQXC3XqvfR
         tIWl6MOK0Zq/FNPhqKX2SLsfhZdVlwqzfTY0qEyootpzOqiivgKlk9Cgcc+BXppwHGCq
         saJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781250200; x=1781855000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        b=FXroZHbQ9WDd+Lh8q7Ap5syak60vLewliIYZ3fdHRsI7PV1LDJLQBXQEIxWGQ1+LS3
         iCmd3tB0KoKJCahnRR2cW6AQSych0mNqv1cGpG5Io3AvdR6CEBPLHPY02vZRU1k0Df+e
         QbGnJEOkhcXz1S39ypguz/yyzvD3lfp2pdT1+lhMhYHe726I3YVdABIsfwZsiYHdn1Z4
         3z9JxkROAe42FhzTJjIwSXO2b1A5wCdjkJ1lVfjQrZu0yt6x2tqXfmjvtuol+999lOAa
         zLWsbz0nqCUF0FMjTQb58Ezx+AaZIHL1g2rKceu4w6AQKz6te1YDOJyqJ+4WR5YEFmIJ
         TfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250200; x=1781855000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5MzBBKZchkzfVSxnBOJAXhJ2T0QrM0FYAnwLYi+8eM=;
        b=aCmF0jKB6kAw0NE1XB7rx4uKDiou+7+Pae7JBZTRozv6unK37r2qv9KHBelxvoW5a2
         YECIlE+g1EFQ1ybnjciQKlambCznSWPLNpjf+ImHNH91euAMLQZrmBH1t2qiz57beEhG
         kzYtvliSjeNEFtOsuBTdmirORYEFvu+vcN6xfLemOwgx7T5D83W2UTLbyz9W75n1Ndnj
         wy3zMlPVZv3jqp4WFwmSMUm32bb7JGZqldghu0za0mx9/Vnx7W+tgVrJbLqnyW9Ujcyc
         RAHTjDSeeqICcpdGZ6/Gpel+uG686d6WcTXxm4Ovelv7nGawNgYLAS5cmSehvTVlMhGD
         pDgA==
X-Forwarded-Encrypted: i=1; AFNElJ8MXywQ5efvzDbLjIPHtQVeqL/kK27zoD2ZeDxVYfe8NQdUFPtYOJ8skSbYsUG6FWi+U8TmE3TurxOV@vger.kernel.org
X-Gm-Message-State: AOJu0YyGxtU/jdY1NBgttyaK5HxM8otnwT41YdKI4HoBKcc9GfX5dxUd
	C/nJNZ/UyDVSCphrNOcw5qsdt84CZxO1xn2LPsP6kmDh0vkT8MuLPuFOFah4OpegDdwNFFBvd+T
	MybzSrHw5dXu/H0IFbeo0hjh/XQX5bKoUCSeaE/C49Q==
X-Gm-Gg: Acq92OEhj/nnGuRQmLGD5ghwNYZiHnd/LGZ8WXC+A7cSW1Jztpvxryq1iaU6vK8w60C
	9QI7uarrW4zi8z9+j7hZYPByUdPHETignhV97XUhyo/KGbJQwElTZDbYKJYfn56NAV7dukWPvwd
	HmjR1GtL2BvFSkuj+F3k4n8zK5TRykYxXLatjenfsFZ10YUrcpMG/xWAerprQr2IetKcKfmtiGr
	jTpKfbwQYjc4COcyorSwAm3SSlgkuhXmoSIBFffZLYTvSUeYJiIAqYlV/mMbOde7I+D7q67y7FC
	/GOZX8bIflI3fkieJiK2c/s6zh+dOJelc2K5/YZCpBUHMwOZUal9F4HlgzCBCCs4pBRb
X-Received: by 2002:a05:6000:290a:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-4606dba4105mr2253784f8f.20.1781250199806; Fri, 12 Jun 2026
 00:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612072341.278591-1-gregoire.layet@9elements.com> <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
In-Reply-To: <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Fri, 12 Jun 2026 09:43:08 +0200
X-Gm-Features: AVVi8Ce5W6VsTL5wvIhDV4g3cp0NVrtH0vt8cfJM9zmJ1mlbq7raAsaetjYBOEQ
Message-ID: <CAFi2wKZE_m_xeggqKa=HxwaSuC2qMYNiBz=TjPgbX7BhQPyO5A@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho controller
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Too bad, I didn't looked at the right place.
Thank's !
