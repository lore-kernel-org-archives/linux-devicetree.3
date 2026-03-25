Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDEF1C84DE
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398320; cv=none; b=rQuri1Afm5xAh2el5XTMrLRPytKpFB6yADjAX37rYUDDmKt7mosWunSSCacvkDBakw0eeZVxtqQQ2vyXi428AkqLyK96NxYOFQHtgpT7OKxKK1PnmYuC4m2U1U2XAB3IH/3/DLSz2EafT57tXhKfttGbp+0kS/EU5gQNBjnzoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398320; c=relaxed/simple;
	bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9KrjF9uph1swAslhy4TTXfUXXEE2xW3L4ZKWuITgpheiffxLia11ts6TAvwAIipsHQffinVNh1Xy/3ngXT+FD+V28eW27kZJwzdf1PxqIJOTQA52naWK9SGom5VrjQpW1dhYrbG303L1ojs+VPn0XOMIOru9k5Rfj3bs2GFCQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICia5Sjj; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICia5Sjj"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfc085395fso445670485a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398318; x=1775003118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=ICia5SjjK7+fA769m+K2idmiLSp3KpAzbj5IJCk5gcWhJHvNWFxhu4wP9wH/MF4bkX
         ZGGGSZhFgMrk3pisNPWbJ5TMkPN8fxFVIgN5sEJiikr8Cfhiw1IrHqQLhERlmB428T98
         /LAP7cf5YhPErxLTcAgyl5Hm5HQHq7TzO5g/uWKiQ4i8X+bqucDgZZHEhITjWEk1fWXc
         hEuPXWHvCp8s97mGtHDRj6OXEu7tMiGQKt5UAAQXCqTl8nKLwNbw41SL1DKO8kOe1T+d
         0HKmlSLwxtQKgRE5w7RQNW6EENm4UfsrVb6IkW8kW8OMcrzrLJC3Au7Owf6nU81ZBUyy
         XMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398318; x=1775003118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T62eLvCEArRzYZStwBuW/DskGoPmPid6WBtJuVPOf4Y=;
        b=LmawkF3ZAlnigq0rsWvUWihfq+Meqaa59YCajbH9+HahaqhyQo8KpZRJm21bwoRPPn
         ePLO6wFPQP2jQsR8EewdLaRqABT+5dvO2Lej4IH1a8ASRx2HzHDJEX4sXu05K6tWxR3g
         GaxWudaJoDNznCzG7rDBwkA7nblD/P4qJBlMpTJMALxhz6WR67xZRT/6S/pAv4bbs+PU
         EcXUvYIAGOIPuYHogzPlY2NUPXjnYAQKucIkkC8EM8DpvJvGqaO/u+r07Hlf3k/SBK6B
         fCQTpg0VZZtShCHKQBsJcoCkiNxIqrTriPbuxL4KwpuNi681hlUaaLiWwdfnqUueVe8b
         NVvg==
X-Gm-Message-State: AOJu0Yzm8QuIlAvOEZHWoSsfnot+56O7HO7DEe+h5wECDfAjZD5WqnBl
	JkVY60W46d39+H62SQV5Ck7t+WafMsFxpqMIy6yhdaCn+ipfDTTLh607
X-Gm-Gg: ATEYQzxt+7jhVFUrKFskZ7xW+l+YWoWzlMxfWA1sv8jvgcoxFBAkaP3RZV0yZni6SP3
	TZ7RAXgC+p0x1HPkIUEhIYG9EKfZIUVIOVjoNC3xYk04eRqqPi90qh872oU6L26vs72c5wA/QOF
	b/Q74zro4U1+8uT3ifSsAxPO6xkr2HzRq6fatc0f1jADt4bCJCx0kuAcZv9IOflxembuD346anz
	IjJAAWLNO83LndSIFlmrnz7eSLWerU9XsOdgJs9RQNGHW8NGmRpeo0pZNrTBMotLCG5wF8Cwepf
	aa6QRUagPZ/JduGAgpjRtOAI7pH06vCJC0wNLlpcp31jn46+xRESNqldWeJ31mgulfBnEA8Z4vp
	/5UN72uhT4fNW29IqK1HIkwnR5b6ehYwFVCDMEybpkmJLeNpDNmHv8vE4vnQX6UL0Q2zi6lpQGo
	7Y1l7rzkC+qNC5th+iEvPLJ0xmO53Q/JjQLbyn2WS76wBsdHYopgk9pd5fG+fE2yKm7NkGc7hgr
	R/4nl3yY82ORA==
X-Received: by 2002:a05:620a:400e:b0:8cd:7f7d:b089 with SMTP id af79cd13be357-8d0010523b7mr229964885a.70.1774398318140;
        Tue, 24 Mar 2026 17:25:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfd55e79e6sm1017406885a.29.2026.03.24.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:25:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] soc: sunxi: sram: Allow SRAM to be claimed multiple times
Date: Wed, 25 Mar 2026 01:25:15 +0100
Message-ID: <2342486.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20260324164357.1607247-5-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:52 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the SRAM C region is an alias mapping to part of the VE
> SRAM (accessible in whole at a different address) and part of the DE
> SRAM (otherwise unaccessible). As such both the VE and DE need to claim
> this SRAM region to prevent access from the CPU.
>=20
> The SRAM claim API is designed so that a "claim" routes the SRAM to the
> peripheral device, disabling access from the CPU. So long as the written
> register value is the same for all the claimants involved, allowing
> multiple or repeated claims is trivial. This is indeed the case for all
> supported SRAM regions. The only known SRAM region to have multiple
> different settings is the SRAM C2 region; this can be claimed by the AE,
> CE, or ACE (assumed to be AE + CE). This region is not supported, and
> likely will never be needed nor supported, as there is no documentation
> for the peripherals involved.
>=20
> Change the SRAM region "claimed" field from a boolean to a reference
> count. A claim will increment the count, while a release decreases it.
> The first claim will trigger the register value write. The driver
> otherwise behaves as before.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


