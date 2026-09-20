Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6143FADFA
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912315; cv=none; b=tRQ47JfLVkBOZUDf4Ohy7UhacrcngTzT4Eo+12Z8fH94zeaFGUz+ogp5MFfJBpaTZyaWr+UsKkWlm6UfUIBGtVyy7C2PlKBw66qNdLngkaUp3uAo9JmAl83mFma5gk6K9902ockoz4CmW/cWKQxQvosTiWV4mW7SM+QB72gVzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912315; c=relaxed/simple;
	bh=KrFLy4WtI52x3tGQmudiPQj+AzMzloxY/Uf2tz5humw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn2xSi9OUtMscpdYpZxKVgKK0GB6y6Ew1KCfeZLG5NjnDTtFHurek+Sb9GB7V+1q1t9uHXXS23RaVga8KhADik49OwGSXd9lEIoOCHbSSPsLLLK3FtCKClXU3kcPTaulbP+/5rLGfENrvLyoiCD3Wmx+mEZEWY5pV1NVgDZUXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB4OsaLX; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB4OsaLX"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c97b28165bso2179220e0c.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912312; x=1790517112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cZcmuhfWNSOMdpLlBrDH5176HCDVCbPGuvF5u8I7/s=;
        b=FB4OsaLXs0kF1pBHL1anSrXCMCg05N/d5H48s1i+m079H5/jpkm/AUQI9P+BDDNBaf
         tARc5EbXjFeht+/NbAtt/9k57X3HSM064KlS6t2XEmzB4ataIGlkDrVmIvhYl52RpU0d
         gjShF35W8c9LmD5/PoMFJ9kjyqTVBtNLCB1DTinXzxOAP0egGDglRzystOlW5Q5KpaTs
         vvxhdpPhAFEf6HJ5n8zoeNUY5aquYT44jESujM8WzL5WcPhCo/qIGcnrqvel70BofTWR
         5YpQnWqwW3HJOh1oqf4XZjRXJWeo3sVpqXG/QpG7IORXnm0vJcjvdHw9hWS543ZzJhTE
         yGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912312; x=1790517112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cZcmuhfWNSOMdpLlBrDH5176HCDVCbPGuvF5u8I7/s=;
        b=uTwaksEFWNrL9zUFZY0LVy4HAHgWa5NODzgn281xHBlxDbE9rH8nin8jcbOvGs1SIz
         nBGc4S2+A6gA+7N8C106imXZBqkjFCZG0djpCp5cARODpYCJ1MdGUEBvrQioUV6obkA8
         gHmr0obizZza5ziIL52IpVrJR6bUd7E1K0LE7LVyB42E90xRw8HvzlOp5TtHds7NaWSz
         yzIdrpPlFmMBUr6llGWJdEkgShaINSfhGFHgcuLcOVengdrA93bO4ZE8Rp/FiWISn0V2
         MM4rYwFSGs0VZWH4UpyIzDv7MI//urgp6gd0jOuOgTAsz/m5abLEvz4wbEHKeJRMlZLP
         WlCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLnZwNEmg+3tKuMPhbM3RqCZHhrh4Gp7EDFdBmpNMQEdC5Cp6Da37cduFko9tUm5PLUH1OWvjA/wK/@vger.kernel.org
X-Gm-Message-State: AFuF++mMOQs6NOwXjmxgekzGQcMvHR4bOwJpWZnLU4q6qiy73rTmscvU
	LQgxxr6Obp6GlunUNWUaCt0oag2tFxkHalCMC5FHPMEAJiaEQPn0Y2vS
X-Gm-Gg: AYBFou2H2Zj2peL+cnwAMfrDOvKnz5zjWmGAnHmDHM1gwpRj5llXp5rKXsijWpPkJmf
	jUoFG+mYA3Dq/c70Zx9+1A7ybtNgDYRjAGacG8SvEo/ZyqIBrRoQBP6gJuSQRDp0IRl3N4/afO3
	9PY10efbiPw7oL7bb3UqPicZZzi7HS+Wd+ZLozjCwDfvihMeD9RJdBcTQENjjGZQFLzjbpmqf7u
	/Q9RLYSsLAsPk6vvpy2UYmQbR4zoV/wl1YqVRek/AOgc+MpYTxgGwudBSC6CModTIqCViWXOZQ+
	B5vZr1jC55KkkImJP/znTnnj4hY4ilB6jp1I2NPYkZJZtCC8sGtT6SdtUCFwdIsuO1Sb7VkXKUK
	3/LBWJw7iji6yLzYOHHw0nHqc0u1xlrJyahmrrIudayc1scD6RVP521a16RWhGpTPOyj9wblPf0
	E7QYx8KBcAjMmIpGrfExyTXnSvNh/vV7iJtISa3ucAQRml/vAFGi8X3fUsPt3mwEjuKqq94lBnF
	jn7
X-Received: by 2002:a05:6122:2214:b0:5c9:a60b:e5ab with SMTP id 71dfb90a1353d-5c9b59a2fd3mr3984408e0c.13.1789912312321;
        Sun, 20 Sep 2026 06:51:52 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c1932ff5sm4511630e0c.12.2026.09.20.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:51:51 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:52:57 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Message-ID: <aq_lObgrI7uAi0K1@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-1-fd9373f123c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-inv_icm42370p-v4-1-fd9373f123c9@axis.com>

Hello Kanak,

On 09/17, Kanak Shilledar wrote:
> ICM42370P is a 3-axis accelerometer. The device can support I2C, SPI
> and I3C. Add the supporting devicetree documentation for the device.
> The device supports VDD and VDDIO operating range of 1.71V to 3.6V.
> 
Patch 3 says ICM-42370-P is almost identical to the existing Invensense ICM-42607-P.
Instead of creating a new doc, could we have similar properties for ICM-42370-P
by extending Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml?
The updates on the other patches keep supporting both ICM-42370-P and
ICM-42370-P with the same device driver.


With best regards,
Marcelo
