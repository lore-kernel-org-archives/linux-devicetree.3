Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01173B19D0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005516; cv=none; b=uJwjPbOqh17lYlN71sC6Tz6ZOdR++kC5J1VEWGPfEY+E9GxhcYE6YVkyqL+CSfPlw6uBnlLYaM8BvmpblXd7dE7HK9K0Nwkw32oXYRj3Ssg+dmJrd3V/t9d6zkrVKNcRXD6K4cxX+q40NiwaSxDsip3CJbFx4/Usd6MRxEwKhtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005516; c=relaxed/simple;
	bh=wPjBskY0AvwX4uV3dMM2KtL87IZhP255mH61hEhnhDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG+IRxyXiOvfMMzgppZPFt9RfHvCqYh148J7EsyagWqORLz4TWVlPdKx6+/N+uXQ5X7+qyd8YjoLpClTOTm80sht3LtN4/1Idyy1vpIdN0CiQmcV84kr13UEA8R+LR3LIr5HMmxPQi+kZXz1XKr1HfDqbVcIeT21tO87hBDO2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdQa+oSy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdQa+oSy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso46034165e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005513; x=1781610313; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sd/8+FiL/OAz+ifKhhV2zV1pQBjjhziXICmo+Y2PAGk=;
        b=FdQa+oSyheq3FvpbvSlI1Mu/yjPyYyqU2eDk2y5Slm4OMtavqU7NPmw4QNhh054W32
         ML02v748HnJJ0kQm0NSTRbLQ+TxAE9uYCE1xIaqAJeXLOgwh4/AQmItLZXmnG009rWgp
         f1V6rredFWmKbb1faqhAIKdwq8cFz8CPhzibAXxvIGmrre8aYFWUz9Si7pIpBo0FcIFV
         1SViRCWzS8KqeLlrBjZu546lrU2qHCBce7O94Iaoc2C7Y2LIu5iwLTKgH7pJ9UrSEuyb
         93sjt7L5M2B3av0alelRWbXbyTOPX5mOG8PGsL2SxhYfCl6wxdTwbXcwWWq8M37yLwTM
         U0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005513; x=1781610313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd/8+FiL/OAz+ifKhhV2zV1pQBjjhziXICmo+Y2PAGk=;
        b=OSEk7cD9I5UyBDG/5jY8KNfQyRza2QLAs414EYStx7ysAQqUu5xJabk8jYSqWhdeJ0
         TCgegopcfFypJ07O0LdiyFzTuOhadrZYFiam2deDCdl7iSnkK4lamKycgxv36PP++W71
         j0NoVX73Qipjg2CeutsD7wTb8fwGHu2m83gucdBmRn4mHNKsjF9tcfOhhs/3VdLah7qp
         KEUpVArGmI0+QGG5DTb+mbxHH9HgkY86pXwVM8HOsp66jdQjISv9hn9DNDbHxSr5wuIC
         4UtthTrtOLJfKA+RBhBBM8gFNBgLY+OALq+yvIvc3+GAHo5HVPf9ts2ZIx3myCbkeUaW
         oVLw==
X-Forwarded-Encrypted: i=1; AFNElJ8HoJNrZW2Sf9cE45/PLBpKmfOOmTfqxBHtc6SEPG3g9YNlsrlkC1lYORMMWbmawv/CkWzppNx8GfhR@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGm6Afylxa6fZlsadAYiqr7wUjArTtGeIJkIxgPuYEe+OYBvN
	8vK0Cd3dXvJovh7x45qu5jQolF9NfaLumQ3xEfG+RKLxQ0W9qNcqb+CT
X-Gm-Gg: Acq92OEC1exraVScEZrTeDGKoHGCvJ5dpVqUwpAUHrCIa+X2PmmP4erbdVEikcIdKkp
	QJn1/qjRVXUmjxLPReVtwRKfUSj8ZoDWrbUKEyY5f34pHc8xKSwr+2XN5IO1rwaBZ2Zbq7aT9KN
	LXyEQyI3SP1N0go6aYybjkF5gTH7Y6yfiDwa5OWqxpuMVxgo120HPA2KyplLYlfaoQMiqhYvM/h
	pDpUT3YWAumJGWQObn5QZU9m9C8gs86EmJXdSX2RG56Xenjg4hBkTlEwd7Ut8vaT6MTFJHhYToq
	7nL/sY0iqVxHFz8hSFS5fLDwh82c+91ml9WsWJ+BrbvrjrPetGL1GJoTix4+M+CIRNggpjkVJu+
	Al5KreoSLmVzR4WZr+gEIkcSStyhwe0RU8rYqguuwNWHpPt7v/vl01r16a5q2B8afkFh1eN1ojh
	UF6uIwDLXbRjVeVJe9T8odaHH8nQ==
X-Received: by 2002:a05:600c:c3dc:20b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-490c2a2b3d1mr217625405e9.35.1781005512977;
        Tue, 09 Jun 2026 04:45:12 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm478478705e9.15.2026.06.09.04.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:45:12 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:46:12 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, 
	rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 11/12] iio: dac: ad5686: write_raw: use guard(mutex)()
Message-ID: <aif8y-O-z6SzVBxe@nsa>
References: <20260609-ad5686-new-features-v2-0-70b423f5c76d@analog.com>
 <20260609-ad5686-new-features-v2-11-70b423f5c76d@analog.com>
 <20260609122605.000010b9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609122605.000010b9@gmail.com>

On Tue, Jun 09, 2026 at 12:26:05PM +0200, Joshua Crofts wrote:
> On Tue, 09 Jun 2026 11:13:06 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Use guarded mutex lock to facilitate code review when adding new
> > attributes. This will allow for early returns, avoiding error-prone
> > locking and unlocking in error paths. Gain-control support will add
> > the scale attribute.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Althoug <linux/cleanup.h> is included in <linux/device.h>, it's better
> to explicitly add the include for it as IIO drivers are currently being
> moved away from these catch-all headers.

Also we wanna use the IWYU principle (which should not be only an IIO
thing :)).

- Nuno Sá

> 
> With that fixed,
> 
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> -- 
> Kind regards
> 
> CJD
