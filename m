Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A83E51D3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945021; cv=none; b=S4VzIVz52IpTjB7jeLA07uCnaAkP32xpAybdA0Lz0WALLFGpHHmjZE8B7f9yR9fF3/Wd/DVZrvyb7zEmeoMvYzlI8pYIQjKtRHHyvKVRXZ4C/5qkqTMHxU8ukXhIiLG1xWkvVRVgEnqp/gxy2er+hjpPk4UZ2NB43OExUtlSEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945021; c=relaxed/simple;
	bh=sHRgZReIBWpW5NdfBaanZpgYqI1k260TPLXuy8TIblI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvChKtkQrheD9Cj36LgN7Z/PrpxJk3weB6XrSVx6n0Kbiacp2N/7PfuM4eGJH8P/jRCgxFvlfR6I7g7YRz58Ix3O+H5CEqpmeBPZmKXOXCWVFSjMeGpQDNoXA2zOlObs+rf4KX+BHbj1bLE0Iff73WtrH7ds98fn1CqDG8xtBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWOCw9PM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWOCw9PM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842848fd613so3852217b3a.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945020; x=1781549820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhXTrIGzEozRTYZqrvuBs+osNbcorCKCcPcM0I49+xk=;
        b=RWOCw9PMyf2fTpkNnfFyd7t9MtV1t0B8XBlBx4F0mBFY4EIC61n5Niu6dHqvep+qFJ
         zgFANamEuV+RrdRLwP9kzX/1oiCiWSw6Pd7jMPdjckZ0CKCFY2JydUoaPaHbPyjtQRPr
         NHTsALLCfm0IP8G7Ui+S3hOS6UOzq7qHWwYlXccjPHcdVqd1t3mWvn3yKdBMb+e/uu36
         rw467FC9n0fr0wgYTkSmc7LngSzuxLM9SMyHarZYiJex5xGWRe9VhRz/4cqKB0ZGLjfE
         1CrDZl3HZvcVtMbQoKURlpYVecIx7Uo/HPsr4vlOnIdVlIEcY0MbLDxoqcCukOXOZ5mL
         Ko/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945020; x=1781549820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhXTrIGzEozRTYZqrvuBs+osNbcorCKCcPcM0I49+xk=;
        b=bFlXUWqmvzvLjSa3H53lCVaQBwUYJ4n/THmjpydLuJbs0kzzblrKA4HCj2b5n6uNEM
         U+lHiIo+mt4+6LPeNwIrwpb4S6YbfociADDrSyKwf7miH7le7t3EIA5+kdDI641qDjO7
         8lyuxjX2D5z3KM4b+9zXeaBAWY2r+YqrqUIJquHUmytNYRS4qrDaXs/84h3rWHXWliz5
         Bqxfnj6Iy3kBKx54mAgpf5rVYxDEDPbg56JmjdZwQRh2KHFHdbG9oXvIG9/+9pbMldUR
         CVt0LnnAHXw6UvyFI5M3Kf00OxZQUOzD2+/GMAsJvPXbCa7n7NfzHxGNth7iSKIIOhw8
         GIlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cDrLDjEHj7rGFJA6+QW1WT2wNpsd54imY3sA1VCYF/mKaZyjFQpThysvUE1bAHzSgpnEUsPXaPDnI@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVt+oxjHKICR7w/Urtkl6Ro405YCmBM8PMBFMNTtE15/y9n5+
	aYzupUhPvcADypK7t/G9TdbX+MMlvbKNWymLCJIfIhd+59wf/KW3NQZJ
X-Gm-Gg: Acq92OEIa3S9V8Opt0TUivNi4QXV5emo3d9P+MbFfcnc7pUwPBmSyAy66fb74jhnJut
	5NCHTShrPULGBZCfGIs8KzaS0b5aw6hDEUqvgkurJSkzdaOYwiVKsJ8ocqD8Ur3ctmM8r6kITFT
	OwaJAVK7w3i8S6IAXD8hchn9kckMt5DCBac6amUq7pvXbhOYuKoW3CiNpgKcARpbJVG4UT3tFk/
	n4bwYDKbnXhVLtf5TFRw5cXlZuK6/kzlfYMyClMebCc12JpNA37WUcUVBhii/0Xr9tSP+dxalwv
	oV5Z6e+ws9ZiIN1DP7DhGSXdHJr61XTtOIn+5ivf0Ic3GXhGW/hQY7UlGthTjishwNhu+AFDoLY
	2Apdpt8X9h6q1NFFJppI8AHhupZXVoJLnVMILrn0Ax63krgQRAuLitAEIZhJBIyZkE48wr88r1d
	o1CDn+WFAUH9O/IPAl8hHlAkuxchpx5cyFmj5NT4PKUpfuQ4C+3dUJg8W8ww==
X-Received: by 2002:a05:6a00:94d6:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-842b1051617mr15667359b3a.37.1780945019804;
        Mon, 08 Jun 2026 11:56:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm19476589b3a.59.2026.06.08.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:56:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 11:56:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
Message-ID: <31356c7a-6028-4901-a98b-5cb375d7742d@roeck-us.net>
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>

On Mon, May 11, 2026 at 04:19:13PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
