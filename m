Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05792478E38
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364076; cv=none; b=Y1bn64GtWqAaEdz8BKos4cOqvOVYrvMOhwedK0eEPTYXomB5N3QjuDj7XCxapx4rEZlZBP/uvlSqwSkcXqOh5CSEZbnntA3W5XXrEemaOCDn7ygbs6S5SAYQ0blsACEfH+/n5sCsm9FK7YTEkoDFNZyQ57gWYgVRyXo1goGJhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364076; c=relaxed/simple;
	bh=KAeKmkNkjuzZG9TiPoOsXDj84d0lGdVN5Hwuzhdo3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVmRTVYrLixKEXCdNVmSMgnKjdnizvLZIPG436qXRPbwVr4GVJgcd9LT3zlqzfUGT/Frbvg1S/ubeioQQ4Vf8ogJ6g16iBNSY+jSWC1lYFomm07ixUqHzwNG4IiXakyjjTKwB6xEV/he5N543k/sHC/3MnPdIUx8OTkmmZNdhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asnoedmm; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asnoedmm"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so269961eec.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364073; x=1790968873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=asnoedmmhW/NUgBMm4aBxVE8jnMtXHZduRTjnB9dHZOs+nq3V1NZUKbuLsae4L4pNs
         0lDYM/GFZFz7WCAEWX2h+4B0/VRo3iPsh6nAwt9jNhrj8YNaB7hj8IonGtdWigySKwSP
         2Dsw9Wg4WOImILktjwM7YSrdpU5d448GgHLjB1wZ/XLMGFaW6w3pdz+PJizTZ68OGam1
         wUmHY9vSsdkT/6DatSVcBALStHe5faJmI36urSzWK44YbLUONVANz+RHM4ip++IZ56Do
         GaqWZwcUsR2lLwAn1GEUazWbXYXKjHmdhrbtplL7plnddVWgJ1QFcsFAmiquxIUcLzhL
         OaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364073; x=1790968873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=vQMuOhiZVikfBhi79teoHKE9DMtshxqEK+73wC5HWZseNlI8f9/Y1fHZxnrNLxhaX0
         YYF9KrBuIpx8dNElA9BiD09WJAejNuSAMMBbTNoXy8EYHyDWxMjbJlsOVaTwHgdlfw7L
         nTDYGKFFmwNtTy/Vmq+P3s8rzxrpanbTnTl/KbPMUb0hd/eYUiKKlg4YZBkhy44GnTP9
         ugQ6nassDBqB4UtA0cK79UDzcroTnWCG9BvlYSCSucjl/isNvLKQYQsFlPgAZEW/ME2e
         BA4Q9b9M4Jlxe7P9+e6bs5hk/RTX8FiEjP7FbkY5YTKhUZ3KmCbL5W9eCjG3xs4xX87h
         QMVg==
X-Forwarded-Encrypted: i=1; AKwUvBwU1cTDenczsvDsznwZ7dS7/qT2SbIP4xRF8P3r5aucVGtI/Wc0OsJMiEA97cUe4T14v//j7J8cPwNK@vger.kernel.org
X-Gm-Message-State: AFuF++kNczrKqgBturyKtbhiZKmBXyT5bJn+icF4A/D5bCWd65NBfmYQ
	r3jfrpZdltRsN/53tIBulJTV7u5TrmvoXnlyu5fhKDD4Svk531O1K5Bl
X-Gm-Gg: AYBFou1aP9Dey0hsldxSOZjaWueh0BADScf64wmEunRuQlze9K7kasHfgs8hQJaNGft
	xLX3b4i2myf17QdZbZqTzpN1LvZuxZofr6s5rNccNQARaMkbP0NFtbeyOeA975Br8q1MqfmhkXL
	LABIyFoswGzrABGlQlMvfrhKaGSwdAoYSCTZGHdT0g8Xb52GLHNUsr5w9zUDOYRt4VxWW6UUjpj
	eHj26BMcxhnVeHXP4JrnrMWfJDXZI+p57a/r7/UVu6o2+U3dsf3by6mBS0eD0noo+VJ6Oz8Zk3k
	tYM3+pAJxB9HZlQCIZ+6sqKuQmgEHmvzAvoQKBbFFBAgdg394+DFw4q9KD6U+Hh8vQybbdPQ54B
	kOYmTxtPICc6VUV35pjRD2w3rKboBp+1b7AKE76suSCxaZMo/LoTJXK/qS5cZvYnkRJFa7WKCgv
	b5Nj25akL1SKIoNxZ490fbkrbaezFME6818KgCbHF/1KLl1D6H0n4K6ryvLpE9U699AAgaaS2c8
	26vkUFiDGjIe5Az3r9teBKOjRoColwh3pOCnBI=
X-Received: by 2002:a05:7022:7e85:b0:143:3242:6301 with SMTP id a92af1059eb24-146ce29fde5mr1024848c88.4.1790364071957;
        Fri, 25 Sep 2026 12:21:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm1708481c88.9.2026.09.25.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:21:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] Input: stmfts - support FTS5
Message-ID: <arbJQezIkyvCf1rR@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>

Hi David,

On Mon, Sep 07, 2026 at 12:50:21PM +0200, David Heidelberg via B4 Relay wrote:
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);

You need

	input_set_abs_params(sdata->input, ABS_MT_TOOL_TYPE,
			     0, MT_TOOL_PALM, 0, 0);

here, otherwise input core will drop ABS_MT_TOOL_TYPE events.

Thanks.

-- 
Dmitry
