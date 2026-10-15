Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488D2C08BB
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028314; cv=none; b=RWiE1w1YvtLWku6CWYQisWMk1JFbtFqixq5lOGprBe0lnrBtT1rnQ+g8Z98vt1JtU+7YX0w2N04L0rvhJLxdaTNuoSkCLtDGL/MfjusgojAQ7IwrsHf5yZS7+2+ghVRMkL8MVzg60mTJERYoaHgMqXV7qNZHeqjea7AGvxMKXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028314; c=relaxed/simple;
	bh=/Qgnut9+G6PGmnCXCHz/0qRV+Pfvr0slJqmidKSXVH8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=mU9Mt+reYtukpICISmT8xYsRrN1+VrtYurIrz7QkM3RmKUXa6DRhVMYOTZ1VptNMEiFVzxFPF2a5IgR63HMFO5PQRexzRHZqhxf5hy+zGSDzicRhc6P/MJrIPwg8RfjWvnVKy823uiGn6y7HNuSQSS1TJwaBnrMUG8a8fUsxk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLDcTvu4; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLDcTvu4"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so2647701eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028312; x=1792633112; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biVi8aFmQp7Egr8jmIyP2HiGBUC9LJELcNuVslQ0QHw=;
        b=jLDcTvu4GlLenPqKYM2b3LOjBa3mCCcitaRC1KHpgVHRFLgY6U+lh5GqxdOjOAeSMZ
         mmm41fqaAIfJxrjRFW/JlXMNgKq3KutcSbK5/nv1OEROewywV7pnmRaLZsLDZwexRde0
         uzga7h3vawE9WH52/R1PBJVFcBuNr1fdCF1GH/rgeF/tR/+PqIR8+ce8UABklOTweAWK
         8uyqt2he+4hjxvKgxHChhfHKfYyp5xxpfSNv1QVN+YbOxNhIrDJFafutV+TSg9kKyJoK
         3RSvi61YLvC82yrIdoxgJzKX23kBwIasSbgnqQHp/7Kt6DvBcPdegmDYUJlNKHph/aNN
         jpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028312; x=1792633112;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=biVi8aFmQp7Egr8jmIyP2HiGBUC9LJELcNuVslQ0QHw=;
        b=TxqhPSYYFU3jV/hLr2LzU4TEOTD8H6aJ5ZD1Hp1NzmyPbOw/iob/WRevkHGDV5c6iB
         xGj9uehOIU2OHRo/QOF/ZBa0bM5LAi8bJsiD4oR7lVend8Q7d+HiDWZpTUUGoj3Itg5l
         T48Lhtb3WudEAUPErkvUhCLACIgWHaDhDOymH7P7vvqTtv2SlhvTDGG+Wi3xvA5G+rzI
         xBmZ8e91YzOhXJb1XAALTpBHD2AE7BW3fjjiBS2F79T+Cc8DV6ZJ+y8NsROXOCdmBgjo
         YdwsDFqnrR5uSYzv9tH79EAGuGoFAN/YQMK95qMXNYM85GZf0zGYPMNgWqrrglCbAldK
         yG1A==
X-Forwarded-Encrypted: i=1; AKwUvBxXp4OfIYRIJgbHSKB1MsH1T6ywo+iX+iHNMYNte17udp+fo/oeu1UxfJX+bK/Kl0u+uUoCv6EZTX/y@vger.kernel.org
X-Gm-Message-State: AFq9FYIkAOU/lRBeJPv18vzNled9tNYuo2USrjR9GExmBHa6lmhO4mRG
	UhosYbY8WKjyTzFaP1uAygTZyXjp3+SidP5vLyXKkYhOBkyVbr8hJ81l
X-Gm-Gg: AYBFou0jRTmxpF+p4BelZGwEnW8WHtIul4ntnJKnXaBezolyNTiF1vPn3eMClZJ8Fqn
	cV8TxBEnCrzEgnSSS255RAME8W48fwPhygd/8UiUfHmGZVvbOtotNA30bvWIKeD6VAg/vbK/WoP
	4Uw2GbZT0oFyo3Z9MQIDYphdZxHqwEcgwX5hKjVmq8nuAegwpVGn4Df9yvU+2PLG9mFkJETltEM
	Lor/egDO/+LfrB9CmCe1+qR7nTYJrqi4Z0r2lL924ImL9l0TwL+UWncsXWQjkydzfmfBho0Pxcf
	FKTLJ0n5/iUlvXTq1KdigxMxMQLiknhlXntKoGkQXqLukLxqzW7b9sz0gKfAMH8hXKau978WYdF
	ikjLMNwEnJkOgDi8HcMSDNPe75MACUjMCQUc+wxfy6QT3n9KGJSfWbuw/gGeuaw3FZ9nk1qjoXN
	VSqqY6aa9VOu6pe6+PT6l7NoyXzgL7zC6sqPLce65arrrbjaNMxvwG6/HoD6CPV0AvMHNr1T3JY
	3EkG75q1yg6v32FChx9zP9rrdhUl3W5CD9ZGX+yVkXvHUTo
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr14634414eec.37.1792028312150;
        Wed, 14 Oct 2026 18:38:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:821:261c:74c2:4177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm56907491eec.16.2026.10.14.18.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:38:31 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:38:30 -0700
Message-ID: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
In-Reply-To: <20261013173504.451391-7-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Svyatoslav,

On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> +static int asus_ec_battery_get_property(struct power_supply *psy,
> +					enum power_supply_property psp,
> +					union power_supply_propval *val)
> +{
> +	struct asus_ec_battery_data *priv = power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval = 1;
> +		break;
> +
> +	default:
> +		ret = asus_ec_battery_get_value(priv, psp);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = (s16)ret;
> +
> +		switch (psp) {
...
> +		case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> +		case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> +			val->intval *= 60;
> +			break;

asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
properties >= 0x8000 into negative values.

In particular, when the battery is not discharging or not charging,
TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cast
to s16?

Thanks.

-- 
Dmitry
