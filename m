Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DE4AA006
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051882; cv=none; b=K/c4heclE4oMrijuU3wyyy+lCtGwpMeVZroWj6BqsE3hsHeG5tRTIPy4ICWgcNYrn8Bo5cseMsxfSPYBBz8dFqzcAFKdQzutrP+pNwPXtkGrGE2auoiwjzkIm64XedK2KichCk44Li2czJCKemGuRD78pLKW+U3eZYOCQDAb8XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051882; c=relaxed/simple;
	bh=qs5S8QPTPOrh1lF7eV5s6cjsPd+SeVHGUW9kmsUQVWY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHMcKZghzjKye1WhAe9nnGzjHtb3dtEGVrIvYYpw2173G4Inr3MYYBZPpLj8z2D6QLH9nr6szdsOFT3QNK1E2Um16oOcNwdcwrHu/GUUxEoavInMHOzgFsZ4rQXKtVdTT9It6M0thsPE4g5fJntPV48u0NwfPR2ViiuLi9VnNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5kRYIpZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5kRYIpZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso46737845e9.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051879; x=1792656679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/jkRp80+cF/FczhU2bxYxtjRt93BJyvM0wCmsP66FY=;
        b=E5kRYIpZhoFW7HyNjFot/gehXvjfaaTLqO7BNSTODqYrE2P7u/asW7Z2l4Ub322RUE
         M7RNJyXOug9N75xBpFrmn8oGGntTyIQgO+QPBjOzofbJxpL7/LokTMViCMTtd5u3fts7
         rsrpit+LZiH1qnJ8UtF1il6eOb7X6mJIIdyQx6LhdhAu2J6Ov6rtzu73SUpwLqj7uRYH
         D3zTAgXMz4RnEGCN/j8UuIebpSG/ai/QGMBS8N5lrZePbAoAk/+9Hc0JrolxuYUZyg4l
         TooVkLKTP2nhtVPWp/7Q7JBSlHpSdTzEN3QdYC5HWB7w9j9GG1NnhoYCUEAwW860E6LD
         U53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051879; x=1792656679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/jkRp80+cF/FczhU2bxYxtjRt93BJyvM0wCmsP66FY=;
        b=o4sT0OF23X+28TEodgNL52/VJfPPl0cnuFX9SDiXVv+6uHUBTKJX5KX1d7rV53m7xN
         xoD7GNweRso8ylG6fhF+3SoJKg8gMDjlUyIDh6UzRA5QZlkwDOQY2jq1ZIVAE8e7+2VD
         vRUNiI0thgJlVRf49hWsPIWWaAuvkgnu690JWUFSHuYkXxid8gcIfEsHXtnBKVoZ+djY
         x9UoaOjv9W/WmIEIHBcAvuY8Xxho1cG5OMhJ281NwYyTrxjdlNbRXJF3S6dGRUBPZCvL
         3D+bM6T+W71Q3NbRiYoJpcPiiVYLtKFJ0arsRdDOxSyARp6v9xDguOT35N1cymIYGBU7
         jjfg==
X-Forwarded-Encrypted: i=1; AKwUvBzikXBlTV2apsEVaZo2hFTdFp8YHMID21VwfRi8s86dLFNimM8NdVBziD/cSWQpNe/Kt8BtYS+K299X@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0X0XurcFc928qQlrPyYUGpD4E/FS5r941w3qX8OtdNmGzWp2
	ee3d8illD6PyD51qVE6sYF7rB+HmKWWq4w77JpTrD7NDhmC+CMf0JW3R
X-Gm-Gg: AYBFou0O+d78UvAZ1zTO2ao1qQMYfp50mYaBoxf6v/KdNuKcsajE73AGNU+jSfvJm2c
	S3dc1RBlrYkNy8+WXHzc675OyLCWWgtf2mcUBCwfhQy+8Oyo+r9gAy5JgLHiBiqvTrxni37ESAV
	iNN8jdZqX3dNQ6Re3ocsl8ezWnYG2t72/mOpDooIi8gvnbKg/etw0kGw8Zt7hVoPwMoINvelbZ0
	4yy7EDRUXcB6Dwm64q4nEAW9GqWqlycSOcCTlcVhUoGA0Z1fxHqYw/WCE8ktJpcf+TP8ltC2ShV
	ltOFR3Md+JLQ9gMRIhr391wUWn3qK6IYaex5bmlOLL9AeYm60EjXMtXYMuB4cOBiAJvPh9gar6Z
	/hNZs7GB5qEj+8HvZNGRlCEkXn9BYzsBUPF9kx4cwt6guClXVecZ2VqUtbJr4P8MvMX2sBHUqW7
	oa3XkN/FmtAmBfnwZ/8Y9K2rqtq0LmjBuFw7H/ZjY9X4XpDjjBthRIy293SAYMUchh5vgT4neFH
	cTrafGzCATqcUCCFZWbP/RddoiIX0ZkEKDNweIVNK/ziIrsC+r0wKfTbxxeHsa+Iez1nHdfjN10
	soNNlEZSAVSV00vJf13q5qEYFCVsoG5RxDSFN+HQC68Z4ls1H9+YB7wJYjvN7Bkhqi0P/0pDU+7
	26r/wNVDlOjkrT8J2feIa9WNpmd7spUQsAGa25S35x+Zfwy3wBToZQeTgXV3uYrjw/hPgDng5M4
	5LXWXLrWRLW3PgRbk=
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr362793635e9.2.1792051878885;
        Thu, 15 Oct 2026 01:11:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd69b2a2sm22018415e9.4.2026.10.15.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:18 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:10:12 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <krzk+dt@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
 <nuno.sa@analog.com>, <Michael.Hennerich@analog.com>, <andy@kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v4 0/2] Add support for Analog Devices MAX30210
Message-ID: <20261015101012.00006cc8@gmail.com>
In-Reply-To: <20261015012159.44-1-johnerasmusmari.geronimo@analog.com>
References: <20261015012159.44-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 09:21:57 +0800
John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com> wrote:

> This series adds support for the Analog Devices MAX30210 I2C
> temperature sensor.
> 
> The device provides a 16-bit temperature output and includes
> features such as a hardware FIFO, programmable sampling rate,
> threshold alarms, and interrupt support. These capabilities map
> naturally to the IIO subsystem, particularly the buffered interface
> and event framework -- hwmon has no equivalent buffered-capture
> framework, and its alarm attributes are polled rather than
> interrupt-driven, so there is no path to supporting the FIFO or the
> autonomous threshold comparators there.
> 
> Although the MAX30210 belongs to the same device family as the
> MAX30208, it is implemented as a separate driver. The MAX30210 has
> a significantly different feature set, including a 64-sample hardware
> FIFO with configurable watermark interrupts, programmable sampling
> rates, and event support. These features require buffered operation
> and IRQ-driven data handling which are not present in the MAX30208
> driver (which talks to the device directly via i2c_smbus_*() calls
> with no regmap, and has no IIO buffer or event interface at all).
> 
> In addition, the MAX30210 uses a different register map and a more
> flexible I2C address selection scheme. Supporting both devices in a
> single driver would introduce substantial conditional logic, so a
> separate driver keeps the implementation simpler and easier to
> maintain.
> 
> Patch 1 adds the devicetree binding.
> Patch 2 adds the IIO driver implementation.

Please send a link to the datasheet next time, it saves time and at
least we know which version to base reviews on.

I believe Andy also asked to to add a Datasheet tag to the commits.

Q to others: should we try to make the Datasheet tag official?

-- 
Kind regards,
Joshua Crofts
