Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572603;
	b=Sk7V1rvHPWQ7axJXH5N95C6t7su9amoWXpsfFGVlvo0VTfCT9sw7mjyd3f13Noh4DEtL
	 hEILwsJnldLsHx+geYwUsmAu8LA6vsMuIxXctofwzpkJZTv0eKLWmTeCdnNZid6sCcSbS
	 QGj99hDlOiBv98rtgJtN5kAVHdUlAiDlOVodJjdcyD73+Mwpq+XlcogRZfnf3l0v4OgH5
	 +pwIf2150ZXiUB3IQLzEgbewS5qERe6aRVUDsnlNvyPyPLkllxX6NZawaXPjwOs4pjhNK
	 049b+6UQRvdjIWdKLN7jHGu2joG3gdutVHQ0Ev9vfusfkNY95aJ59ar+jSw94tRMwVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
	b=MDACtL7aCgGEVl+nLGoxb0Y/RIpS5HQ5LqwdZX22fSJ8olbcqS2fkdvsf1UqWzjv7LoV
	 MfcfFZi9dTsAx+I3zma0OZKeFgc3J0A7f/vBoszFSZxdq4hWK1/IR+jcVyNjZSgwh2xbm
	 kpEOgnRttDPc8uDCpsYsQCNZ42S69Kmq2TGtKmQEj9P2NidugY2eXFhU+zfjBwpfGx+iz
	 rn24jiUwx6ZL/P7z8hnMBtvTAChbnY+ddvGzneEnKm9bvuSgAIVgZB4jM31c1crxEqmth
	 32CFY8AkcKYhHhg20rKvEQhvM2XW8WxOExQFtFq9+vcUmB2d6P5xarOlm4v0XRJ0mSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A5606A326
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so382872f8f.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572601; x=1793177401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=pXdyC55s54e1Hv6vU9hVz3eoRTKMYXUDEFys21tpyB9ifVl75wWvOYT4F2dyQMqX/Y
         PUQm08WVAcVIFGuZfSdievc2L8yh0n+XJmB3vuW/WJguh/RrkhVU0J8kvl+sL61YTJ3f
         FKQL/DLChMmlFTkicXB5UvpsrygqzizEpq2tqROG8CZX4iWiFwFp8NvN67AuuO3Gmlau
         lHt/VubbcIKIRwlVMWnOlXU7jJ+FtmV8/7PIh2yp5kan5ZRv21djx6EAZiqcjKmGxrDP
         LuD7nCkjX6xcZTe2iwpqixLQwqfR3RJIfOSggsuX8EfprDIn+Fr1e4Ze/6ijfIH8+Ogv
         E23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572601; x=1793177401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=W66xJjq3b3DkQf1CxW05842rWwm4S94vDPIyP2+iJ5WRNFjaXBL4ad3tC4Se16WSqb
         UwwyycNdOx4PPJJJveAOu0jp8ydyy3EKln2tl/PNMLKqNuAoSaXPv19afrSXsqc4POfe
         vQQZD4ednye7aHskINqek4VcdVf/arlNhRhxKXpdcI9z4mDnuelMFkVxK1Paf8/jLfSr
         YNnk/EkPp+/vrwMFFhpVHBUpOOSdZqr9KzAT4jG84jM/UnGHmuuPpwrNGTKbrJdzciv/
         gG7iIIk4L6Az4MeDF7XlU6PBKcHUJQhIj9hCLz9q+onvZVaz+79igRO1I/NX8eMwMCrk
         zUww==
X-Forwarded-Encrypted: i=1; AKwUvBxpbqmearm3MUgL84KtAGOuMhOUFr0uSKuX40R8TejvqlF61wFjF+iZ7T68rBwAkGPeFG/iwAgH4maT@vger.kernel.org
X-Gm-Message-State: AFq9FYLAYP7gZmj25wp/VPfvsxZf54zScTROGlzIqIOmO8djpkWyyUfQ
	LfLiiFGvP8Z5gikT8MjtEUHeWusLBeQ/nPnOxAgzfdhGOv3gxAUYNIsT+Eg1G+eqTJo=
X-Gm-Gg: AYBFou3UO8MVfH4MHTlAD9YArDcW3mj7HVbqbWEJ9I9ZNgHKX6cxfRkwlmEhkJcKG+/
	C1MwkaBdflcZGHLf9mNZ0XtNuwwBxF0FJazL+JvqC7dDfBGWFrjTnGCy/G6cFBYXFHVbSVExFnU
	p+Fed+mbAH2d5uv5lhNknM9b+zf+KfKLiPMGJNrRWSyl+UgepEXF1ttoHViYS7/k+qxdaCAr8ZE
	1VKuOG84/ow2rSnmgaoScn+068YlRdlr5Pk/II+nwFuZNV+11w0pPi2Z9NI/fCYixQtkyfcC1ej
	YgNU7frmZ9PJvBSyqBrdv0xdR86/IKrJklwlW9y2W7bwv8lniiIrAc4Q/kSNzQCkXCGB7qnvAK0
	NpjHb+Wv7j0VXva4ryoCNJkV3fgMGFXxgUBRhxy8jy67kq2BPcRlG/N//hMUgviuRD9STUYnOBq
	afLzpbTAdC2PYr7zAfLP/p6RgU0GwnHxfR3aFNWpbG9RrMo5Us0ESazGciXkWOfwr9wJdQLdI16
	DvMdjjq8iNbJnasI/PcwqiSM+qsL0M4f2XnkdHE+mMIWrenqunz9A3wHKyNrKpy0Qk=
X-Received: by 2002:adf:e28e:0:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e264dacd3mr1959740f8f.44.1792572600908;
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:39f4:5e2e:3b34:d185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581efd9sm4013258f8f.18.2026.10.21.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:49:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <ath8tHxHOdA7G-Bx@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>

On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
> 
> Thanks Stephan for the additional information, that's very helpful.
> 
> We currently have an urgent thermal issue on this platform, and getting this
> thermal mitigation upstream is important to prevent overheating under
> sustained workloads.
> 
> Would it be acceptable to address the sensor naming and description
> improvements in a follow-up patch, so that we can get the thermal protection
> in place first?
> 
> Of course, if any of these changes are critical for the correctness of the
> thermal mitigation, we should address them now.
> 

I have no intention to delay this patch. In fact, since I'm using the
latest unmodified stable kernel on my T14s, I'm also suffering from
these thermal issues. :-)

On the other hand, we are at the beginning of the merge window and Bjorn
is unlikely to queue patches until that ends. The changes that
I suggested are purely cosmetic (the names of the thermal zones), there
is no need to repeat the thermal validation. The throttling behavior
will be identical no matter which name is used for the thermal zones.

IMO we should use the remaining time until the merge window ends to
correct the naming to avoid any confusion for people reading the patch
once it lands.

Thanks,
Stephan
