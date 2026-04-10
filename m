Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652A3A872B
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855988; cv=none; b=pk8e09B7jyIyLVfIWx97Z8CoUp+k/bzlffcTPMVf0EtMfcWa/JbvFuH98lameTCByIQbSixLgRzwZ+MNv3FAb4wo384gTXVcvlnQEkPApmgqYmc/Gb3vqbUgxSMof7U3qyX4umNvAhlyxXAEqf2extNvG2AEjWMEF89VSCXAG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855988; c=relaxed/simple;
	bh=fuCyX+hZOebLDyB2K4LSMxb94MV+Q1+/Ojmf1HDk+G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMSVh4TwZ4D13qxarOQilMnvRrRveDY7hsVT9QMl/Ku6o8iXUL3FuvHjURdXLtKQNJ4ThCpqegQT3hP4anfXlvuPkVqUHNXZ482t7LWrkW3y6EYR3q5OGHBbIicQPEC0DaFy8sW1ZX3fIFD2TozoE/v/48KMb28kCMm2E473y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1z87ue0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1z87ue0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2437498a91.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775855987; x=1776460787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc2MPay3qECEt5RutZpeQRm16NiVkPyk7oyirHTTtZ0=;
        b=E1z87ue0RATBjEt4QXg/ua8kQ7XGFXnsfnUW46ucWQrjJ1OaR0aGrbij6VyKfL3xGt
         OeSWA5PAc5qUfxAW9QXvDPpgHe7qpJNalha5BWq6pecKcIv5v2wmiIr9OASf5TFWsgVV
         q+wgU6GQWb+zWbTAbPbWqzEXb7PzP7C4+ULBdiQIe2cKkMu3TLYIU+YJmeu18HSc7uGf
         FuK+QpQZQKLW1om6w8Qxcfhj25AA926xj3mI05Mfcn6jBgpflyHBndchuC/BUWLsQvUQ
         JOuPWYMJfDTocS4kzymQvhuhlPe/Pqzi25YLdiDHjpdIzh/iYdfsbExB757fJi/DSo+t
         suhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775855987; x=1776460787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dc2MPay3qECEt5RutZpeQRm16NiVkPyk7oyirHTTtZ0=;
        b=tT1TdJ5zEuUQWxLpPMyXsxp/W0Glx9owgZki4lTBebgSC9iFKFHjw7lqoW6MAXzEXi
         48TwwbuCxY4gwi9Z0kxyudw2adhivFASF4aC8lZDEuXbXWRhyIM82IcdhzeajXB8+7iM
         w1ZGE0X5WYyGWSBK20b9xIAN4oMIlD3ChmiPBgU85TgdOX1skWhb+yhl/WyG3pzWzcOW
         RdC1nmcc33VyVQ3h0eWvnTRbaEgqGKSgzxeYVSFSCIIjkdMAckykS2WFI8cd1IEcR79r
         LJ4CtKDnIdfIFDKoepHk9+Hx44XeofORcqT1vwlcF0Smdc8QjN5E5ESV9+U38ysF3xD7
         wxZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGJ5ysTs59EdQf5uov/CqsFHyKgygfwv1RgZTPk4vUTcagtS68XX9kGhuqQhgv2V9wJ81hSoDqMMOv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdi9kH777L73YPFYkvXs8/JybqbbTi3m+GlhG+DbxsCuYaALqx
	svGyWsvYcyheN5uWlyW+/hvE1Oi7ENPX/PTb+ZRcvOamYAdx+zlMCvoE
X-Gm-Gg: AeBDiesRgaA475h5zmCbYABw5nNkblFjs0qXO/Q0Aprp0NlZ3US5hdJmX3vymfw/2Bo
	6qrYiTrcIk0aYrI3SRj9By421TIEPlXqWnf3g5WzQuZ8WT0DrXQs80pQiOAR4eQwZOCOIqgUmjF
	oLsr0XVb7KYIaukfEFOLprToMDtR7b6MgsE5a/qMEQ8fZPEd6iuY6zoX5u7WWsOHtFuEWkxgjOI
	LYwiTIyLk89ZCfnAQiUomstDejtSdX8zjZZgAfJkRLM8AsirBfalBDDvsL46Fv7gU/cMJpoZi3b
	Qru7MYRj4MSLfvf3JqihW98/eXAE08V3/IIU7b6vnJ/T5SqUOw3hWoFCS2J0VuI1NBBidkeEsDm
	N66CLYGPOcmmFditeHAH+eGnVmFixHM8JJoqEmlgxcvJeT5hWmT+RE7MB59H79bLKDaiSzABy/c
	ZJeh49O7KXteleHmWVWqV60D9b5F7K596Y0a0a
X-Received: by 2002:a17:90b:3c0e:b0:35d:974d:8f7 with SMTP id 98e67ed59e1d1-35e4274696bmr4688590a91.1.1775855986630;
        Fri, 10 Apr 2026 14:19:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e143d8sm1652603a91.4.2026.04.10.14.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:19:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 14:19:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <907ab36a-d230-4fb8-a20c-5848d619e51d@roeck-us.net>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
 <20260410070154.3313-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410070154.3313-2-Ashish.Yadav@infineon.com>

On Fri, Apr 10, 2026 at 12:31:53PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
