Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC94421F10
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010871; cv=none; b=izLj6msB7WWu9sNzMpvQ6apIU0/thZ2/ZlL+X7OBYW3KmdFFKPaYstpj+QVMx6amZ43genLhqgDQdlCZy/7Ag1moDB6xh0qe9Jx2M3Hq4F5ChVWNFNjUoHbD3ri0sWEs7o8/28+egtqa8NRlKpTSARwBSB9tPc/YrIhMIdwsqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010871; c=relaxed/simple;
	bh=2Hn+kM/vBl5Y+oGy2tUn6XoBN0Urk2DCaa4LHKLj2vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAxoVt1n4JPd75kJJADQP7RDh6c29ywQv92sS6HvKVnmR4LhwV/HN1r3hes8a0LmD1FzUrEzhby3K0rfKgHWRf4qdu+M7WJggBnu1Riso7ljqzbo83lzABQ7hf1y/jxyhUzCqXtMNDEVPRPzRavp29Ag46T3P4vshq9SCLwms/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReuqD2bm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReuqD2bm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c27fc587ebso9160185ad.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010869; x=1781615669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XpF88ssB7OGQIU0/2BYnkpklMaNApzKBPoVuDN5kZk=;
        b=ReuqD2bmIKxAdxVmEgoI+aeuj0T01y2FQxNI6lsjd0HJu8mrikuPb84IR2/lKdcI+v
         nMqeGm44+v/Q+5T0YykUCzZkTTOVQH/EQLNGZnBaqNJbwWxn94yWu7yN52gC6mB+ww8k
         jIv9QsH5yjQVZDB0pp6HSE+32hLi+C7f2mRghaPCi+NgBBL3dpWuTDFiivwlkrA+Azka
         xlShR6cr6+xBFvWO2d5F1ID4EG+1rZ63zperdIDq21QwOpHJDf3sACr0yQHUp0+orY40
         KagUR72420XRxAYQSDIQT/GB6z3DywT+/IHPQW4UGNp2Ibnj2+7R63fYTkdshpZIW4oe
         86gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010869; x=1781615669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XpF88ssB7OGQIU0/2BYnkpklMaNApzKBPoVuDN5kZk=;
        b=fdC4Wz24WmFsgFOyLPdzYzLhOx+2bjfbPCvZHxW79tf/2NiAlchjbr43YHeP2T2BQW
         TOTHlB/5CrgSw1nEh/HBzwRrqy69ZLg0phPvBH0XRgaez+vA1h6d2nT3MAM0dIAs2vR7
         r3MlEaTOuUIYY0h9C2ZQU1O0McECl45wZ9uSmUlpA82RFx4PqachKB0YO24+fgC2Caf1
         Cy/hCsFJLt/UVEM0bxVK7F4aosTT+dm9MZEunpOJ3I+ssKT+lVJly3mHCRHSUL8Eb+fe
         xmqXtUgIiGeySKvy8eC2zWzfjNKaD3dlXZR0DWLtllrblkTcC9+z2SNNVHXeus8bbTd1
         Nhbg==
X-Forwarded-Encrypted: i=1; AFNElJ/O9HgMnryvL5Lt+xLLy7RgeDrIvPNbekdhIvGPTmQMAjhAjQHRsNExBJIAUuAarrKeJAxvO3mLmhLm@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQP9sS7IggWro6U/xd8jg5R6R/Yv40uV95xgvTTxY+D0PBfRm
	zZZd4FL+CTqe6vUZhEQ5moa1tAFRn9lo4ORjlrh3LsWtKR0egFvpuGsC
X-Gm-Gg: Acq92OE2NQ/KvxWTODm/lCd5rUqYfPVQekkecjQ7rBoYbRc2GkRedrVx+JX5HRaVMrP
	gEF1S5wL/cCdG7Fcw57MiF/dPkcBrQF23ijxJYbRo/q1VaMnA8bU6RBOv4Zh9FhwcdZcQ+1WiIh
	8dffCNUvW4XAodyXFYqyGhaebSeofC+LHpyGJJ5js5x+cTAyBrrS3EIOxkrQfapBN3ACyjHsrhh
	9eG4SIbCZDbtXU6x41kWhnj503HtOH7o2G2qjcsKktX3+17V9moP7SnP5MBC4hrdM7s8ZTqZF6U
	QtHI2drwC5t/DTZxHLTWk9dCZyzUSBIPFn/g3R3ycgvKzVmqK1MUP9MKgK6kauuK3Bv9VsFhB1Z
	Hx9ILplo9SQN5tI45iQbdnPYz4kUlf6553JFyz4Np4pC7Bt/wy1wqyIh/7kc0EwzudoKz7nf9cI
	YYsYA2/5bYS5VaJdAwqdHJLE178kEzGhCtzL/aalS1+WkVLII=
X-Received: by 2002:a17:902:cf11:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c1ea958447mr240566365ad.7.1781010869431;
        Tue, 09 Jun 2026 06:14:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm201467585ad.12.2026.06.09.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:14:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:14:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v5 2/3] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Message-ID: <a3622473-dd54-4b06-9b02-bd3fc590b1b7@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-3-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:30PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
