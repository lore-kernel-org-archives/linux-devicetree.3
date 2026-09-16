Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACA4CDA08
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553079; cv=none; b=q0en8pIqauW51yh7edNEJ6T3fYHaLHJEeXLYlA16XtCQ9580OEAURi73Ii4JUmpL4D5mUPkUgLfqw0i3ie4eTgymVMQ5im20IEjKAPcAS/r/hnBFd2LsRRue217Oyx1H+rkGAx0wDz5GOsVx1aYIQtNAc5Mg9Supe0dE0xiayiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553079; c=relaxed/simple;
	bh=0xWacLHVFg8yDFBVQgT0xxVbDKKkqpluoE/q6wHsbhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hNC61XBYaQhdabmOONjnDIccm3ouLLz9h7HL++Bh6hTJAlRtJUTNVTu0PqsX6XM8eMjEBaPfrIqV+hK97zvNpna7hXko1bpu0l26zClsd416scsDabk2sM/d9FR0LWksBgQHzuqQLD/XhUlYdl6VLkEzWPqXFVZACcsScgfO6pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXAzjpbn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXAzjpbn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so379682f8f.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553058; x=1790157858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=jXAzjpbn2UlEDALJFMvz9mjxq561naPRSEqqCZISeov/EP/NcBrw0I4C/LA7c5PJ0Z
         G/8Il8TPEqCAUnSIOfeW4HCVyRC03hnCxErbZDl/KxLmaaOdjJo0w2NfGCeWij3mAnt0
         U66KXZq8NMJQ4wfo8XXvqzSfp1WlZ5gt6BLJN4pOTdi6meIj8AdVcF6F7GzRwDTlHGB2
         Y7n6HhFgsDWpq+Z9bz+0Z4Jma5lf8DH47z7fQsQt98Oc08BEuw821WSgCiZ7+2K2ebqe
         hIyc4kUR6qjTc3FqtQGuBdLE/gimDaKfTr4pH9XURpyUaRtRpsMV7OeVyIRBVTkL2UQ7
         LOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553058; x=1790157858;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=HFp9iWsEWgSJeXJ8ZiIhjz5Mu3oJmtUs9ZU8Gx+GedGUbDUmiyqrCvjy1f5F5XXYKv
         jfxWqZy5htNLEvYwTpbRXJNUtO7AuzJPrQoRW9JVDfT4zYZ6hxzTuuVelbjQf4AyNnCI
         l6qUxsbpCNEI2NCXs15+YAtHh2GEotAAYkFn7J36XXffvf1+ThrNmG8+lLF976gS6xlw
         ruMEhSpkv63aqrK0e2KE3gvGR/AKXcu0hb4vJHHl1TmkZGw2w00K4K3ufClTS/hoc4V5
         ES3M/HurifY1MXSsc+By87NEuR8/m2mO1CDpONCvnIkW5vjaGKHjGNSVZcUIgSDkC5Do
         a1mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVtBE3ZcUE0Ybiev2x/upDgKvRIqdF9ZfGWoSRBMtpgyUcAvsQ0ZfvjXiO6XLalBxRxUqXt7ZOPe+z@vger.kernel.org
X-Gm-Message-State: AFuF++lZZS7TNCGwMMkQ+yF9wIt0bYbm4jKpW3QPTGCrcLhh9sXEUX8Q
	mzIITfTmdJB2tO3vdQw3Cr84S5i1JL4KVFoVSy0AwHogP1cil+z1wj3nUygHcFmrrms=
X-Gm-Gg: AYBFou2t1X4zqqfoksw43c5v7r5z0UDIsApy0WWF30pKv1AtiKa7uSYYbBV7RsjGXHo
	TnbzxwuspuWQ5HIWZoyIgpqE2ADseLB1QzFfndl8tGb7Z4EkyEk9sjaXWBx7PmGDvjEIZDJTekl
	YyeMxOggvhWKv/fv+QisuxM9NwxVo540Zn5/XZa7hWd/iI7o3UqROBUHzhZP79JxBu1+NpofLWG
	ArHRjsh0nFa83tSCJXli4bvbR0P7AI7kuRaz3dadbj5ue/D4Tbeq3ZyDf2ceyEBqJlOfPDJTe0+
	ez53MUCQfTI1hRMRCjeZaAMs0+s5MZQ3tqdmIks/py42XPBOagPbHmgOsWSxEvhEbzyidlcADpB
	pxityB1kLKNZPfGPp97GqG39lzoYiaTsJjjS+Oe1BlsBCCXZG97bLC/8N1A4x1t3EJXq7FRcBNk
	zN3angQDGOoXAOoB+V4VrWISdt1s+erzrZftckmLU2oL1Jdh9iK9AaLNBDgkPU+dQMQYLSki4iA
	3a2yNi8JARQ
X-Received: by 2002:a05:600c:3584:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49eac4678b6mr26145655e9.8.1789553057754;
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm35844635e9.3.2026.09.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <178955305678.2918771.10810230842213506975.b4-ty@b4>
Date: Wed, 16 Sep 2026 12:04:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sat, 05 Sep 2026 16:32:30 +0100, Lucas Tanure wrote:
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
> 
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
      https://git.kernel.org/amlogic/c/065957517880dc7053e0723cc9532b6e78c8855c

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

