Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254814F96C4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780482; cv=none; b=kWVbtmR580iRGXOPk9w3gDWOtbRSZKGmu9ISEoUribTIukPXr9JTXj0GPsqDk7HKypNZRWHXjhAfyK8IwhMlg+R2nuaBNO9jW9el7Y/HQqTKmRkP68zsP3EPj0wi94SNMaTqIWH+iIeCTq5/1DIIpzkaMzjQaabeZl7gpw0fACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780482; c=relaxed/simple;
	bh=JD1fgY+7J4x4sU5fNLsBwey7gYe20nmvoZ5i5mL0c5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7OFz0eXz9SE6ctN61mGutmi93gJlx13163zzv1Or94YtD3x3tLtBCaxhSOQ1T0ZvkKRjP2nFU0cjXXvXcDBIMWUb+BV5BrwjFVZMEAOSbb7UEFd2OrA+ouLtC2ayIb/n2CXE33PJVUWuLj0gwf25iXeZbtpCO/D/DDw8LFbEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I56aTj2f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I56aTj2f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so51216785e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780472; x=1791385272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=I56aTj2fFytE/XlxHxTk/cMvj1IGvSqcWGDE0mbwMBxtJG5rZCdSorZZ3mXhbOTDnl
         JUgA/AmAhCiLtovV95XlnLgkFsQQNw4zAAlOZT2wylGahRcLqLTWQwu9qFqnMKrU83ee
         60qfnpfiZsaPpqLmxItW+aRB4SLSTT92pL+wxmPYU21MF3ZrHLE9pXpfgT1xbevaxbph
         Z8MxW9NtuPi3jpzQauMHs4a5mNe6NarDg5c9fC133aV9XLvDDda6XnWWLgaW++lHlC+2
         PMjjeEuHKyFZqnDxZ+pr/vOIyX+wvNr6aNccrGWOfWuYvi30+K+GO9FIBsju42UAOsF/
         z7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780472; x=1791385272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFMWPn5IoBx9VRgYwRavNR0oKcAnfF+3nBU45SDbhVg=;
        b=1iqebOF8ukUNhwchBRYT/EENI6f2Dgd27nppjMjt1hNKxDtNszDmf3mmmrbix4owHx
         VrjTvD5HY5Txo2wVLRwUBlDUwVjv1/tGQ9xHPyO/+8VnvQK3+XGl6i97ntmFDh9XHz0t
         +kC1uPnEnlO+VA23BvpYy4tWQ1IfGOARI6mtDTSonLsvoMyg6Bf4bCS7EbDgX9r+IH59
         NnWeLY2KHWT2NAWI754C9T+dY3UPtiLQoOCeYjD4epyDiQu89Nw1zIAvukw8AHWBAkZ+
         4WjjMqDNFf0RuFap0Afl5bc4ubPTad1N8FAuv2HcmO64o+0gaaubyKHIxk/FGx/JNEev
         eQgg==
X-Forwarded-Encrypted: i=1; AKwUvBwmj/x15IaLIqktaeC/wlpLvHci0ZdwBy1ul9FpSuAK0vxv3JM9mZmwUiqdgdQkCMdFljGsWAhjCUJP@vger.kernel.org
X-Gm-Message-State: AFuF++maVEQZV6l5EviSvC1m4oebYB0RV7tYHIjw5iF7v2z3gW4YmYSq
	bbxaHXbJ8QQ0GeIaNHoGFOfcblx8A+242BWSJshPiwxUvaYWAw7+SBsG
X-Gm-Gg: AYBFou2jvBxcINoH2LQSXNV4vFuMp5gUCyjP96lJ2ue0uGlw5rHKCPApuiFg42ozpu1
	uQoSwkrvvCKRSwv6/u0KwfTt2wkHXssbpQfdwlNetrRAivRnJcAggXRjejtF8gDUbNZQXfDUepY
	PgDNYYcxzXM72Mgfx/+Uq2Ev4askmmmJTSlQbEV2OWI4ONnEERI2A3pjhbxWtFf/EfDuOMPtaqz
	UyN9p9vcztqnX5ogG+aup7oVZNaFuxW7TRO2IQxmk3UzAkjcJTcTzqo6Tq9soU8fwIydnf91WtN
	s5dJrMw2m7OJRTEtizyWyH5fgSDebdYZ1+uH7ijhhOsVlH9SA0ilHYYTKcWx8zX/yJ7lbFpZJtt
	XAL6GBnRbJQ04mMgCX/4FaiyPnM8Ec/s+EuUSIzBd7/ggjNZ1r5FrxsKaVz5Z5usw4V58mea0NY
	bYcgsUb5XwVQP3HZTIUMcvM0LrWy6N4AJVRi2Qm0LJ1nQmufMNdGjZ+GQ7ZJn9GGFMRVmXNuLo0
	9GyE3oL9UEgbDbjsWclbHNUQ6CASaXDKjC1X6wpoEIN40ZcDwKzLCsSTiDrSNY6JSW2U7rTI97v
	tthBX63xZNaHzvWPcdnJ8XscfCkr9WBIOUs24v3S/NvL2B9P5N2mtz/EES01ZZEoQSZENeG+jze
	bS3inVPlW0qWNmLdI1gwGiXBBjnn83LCQ71Uj1suovFbDan90UtFwNcwl9rOnqfeKCOqnU11g3q
	LSQcqD
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a01c0ec65fmr23274685e9.29.1790780471473;
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ccd1566sm17376225e9.2.2026.09.30.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:01:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:01:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>
Subject: Re: [PATCH v3 06/15] iio: adc: stm32-adc: add vreg enable option to
 manage diversity
Message-ID: <20260930170110.00005b71@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-6-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 16:18:27 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add a boolean (has_vregen) in adc configuration structure to prevent
> setting the reserved bit (CR_ADVREGEN bit 28) on STM32MP2 SoCs.
> This bit is present on earlier stm32h7, stm32mp13 and stm32mp15.
> No functional change intended.
> 
> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
