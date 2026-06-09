Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29C39AD55
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019052; cv=none; b=JKgvmzZAx7BoCVZGpXrYTPtyU9ac6VLt5ZJc26xbiJBl1M2JZJt6sWEyJ7P3pdAMYc5ieFTi1KvTURcFpr+YbxNNNTF4nja2i+X57t5USuzVUZxklAUk8rCn8e4v6AuzSZMTGyXRG7izRdTdlPGGTOf+sqFmyYaPY03c0cmLVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019052; c=relaxed/simple;
	bh=11WhgqEt9zgT+ZWXS7ElY2GogLk4HG1AB68dGIPIaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO3akO8kL4+98SKgwEIGPWPbGwhB1LEkLxV1hXg68ImEhOAx5vbjI2CAf3LSlmWuISzunlz1dZkZRtARdx4gHRfduHPcRskm1faQgbczMRTe7G1LNg8Y7yaISEbj5AgiAueLZe4WwVKGkv1G8I+Da6NPML8ve6tKSIJBU5EgBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0j8zQz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg0j8zQz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c85c9e8b7e4so2362064a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781019050; x=1781623850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=Wg0j8zQzHW+KSie6yZ/U++pU00g4DfbwbKgfhdhwDo+L8alXDCAoKCDwdR35iNGHd3
         NR9fXMEv+dCP+Ye8xUVd0lPBk0DvAgflS9t4X4JbxNBlitoSjqihqYgL6It5FfZOFVaT
         OzuVWZvpt+IJzRLTUitlgechxgoDbhqVGrpQk+L6fCH/R3/9WI8ojLk7a1aqW1XpLur7
         LvJerYtEkxvA6LhVp6mEp8ZnDdsq6LN4vYbcUnbbSl41KCpiDgPVDbQn7RQ14sO3ke2S
         TdVx1J+/3Vj2xx+YTWx4flEGhJgQEuipu6YUfq9FmOTQY3wB95M/wirg6gH7DgjXTgnC
         rCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019050; x=1781623850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=XKgFbD+lvoCcai+k6nMq7QwO/Gy5cCBEnbgplvzTBmIantMDxr2p2LC7LRt4CaIbMb
         NOQdNiIrfi08xhoOZuDpsqdwaCLaANO5q/g7WL0KqOJulBLtTfoeyjkbkKN0tsTCH7eZ
         7LPzjDiPz5mg/tC/3YN4/Pi8ScpoI6+2NpZuDjCzvZWV/pCgTg/G5MPLBL6vVDxBjuWt
         OV0HO+9WZogeUU+ZjcHplOAelTvvCInExCv4r9gaDrSWBp/W4teqBeMgIIrkS2eFGlHV
         u69a9KrtVUrwLh3Igm7JBCBGoOd47ZQMdg958dyVBjGJj7uoXSIT6U8IiGzeHphl8wWI
         hN+A==
X-Forwarded-Encrypted: i=1; AFNElJ/n/L4pnUbVmOcO3+ccaipY/czmWUc6ovD1Vu0Uy0nIwuPPPAusF5/7tjC8pC7xrkZjoIi9cvEy2npm@vger.kernel.org
X-Gm-Message-State: AOJu0YylofpRWS4sBW+R6J5tCKkOFuri1LD1l++pvGN/mkYw2UztxV/5
	r+4VhZwc5p3kWl6psIhV/YuO+KXi43hYVnJwsyNjzNmDkwe02kYecksk
X-Gm-Gg: Acq92OEsYblnE4h48ji7JKthhWSBRUEZUa2W1EsiraomX/KNmtt1xHuBDq7WWHFqBxv
	VBxWVoikqPj1dcAJQ8+/Cmj9yu/72Mjuc06Dd9kL7ycuPY82tql+LvIQvPJJ5wvkpFoE8MbRuWD
	jkcZruFK3yzoxCRkFi0NNPKI82HkSYtkXzeeyrwvdqQEMRNkvP90808TWFsenPFszIXuGkjMLKn
	Put06de52YBfeV3Rtnade88mp4nU+SVtAiJYBgh+euoI9E+4MzTLX9QJC0qtHRo56A7ieIloTrQ
	8a3BYznl47smx6N/adDIC6kjqWgngQ/AxE4E2J3O1mlpaR1LY3/xiuNEsLs+8of7HZuv2UAOJ8d
	kowWIXYpzgekIRNn25CmZGG3aDQDIvVUP10Wb6FGh+I6b3xCa5rGc3RoSx2kYhK37mlxQYL7LQ+
	z9WNV2b5QfuQZmpUmoI1A4vgKWZD8oaP1xzfHwcJg66IAX67k=
X-Received: by 2002:a05:6a00:928a:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-842b0fb6e13mr21005108b3a.35.1781019050176;
        Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm22494788b3a.5.2026.06.09.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:30:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <6a33cc01-e6a4-4e3b-a629-66fda71d8ef7@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:54AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> 
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
