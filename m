Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DA3E0C66
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947770; cv=none; b=TeN2yMfLC4w39Zt+qsGmpL7SelPoeVRLwsQH1DOB4fgdvaPVV48u+jI+JXnZMpdoIgl4VcLN2prKmoUP4tjcbb2M+IouJr6PvcmQj4glr9xNpIHFHUEMkN6Hvua08SeHfYMqklKMGlMbm31N8xPAxfAAm0c0/TcI8g9v/0q+1M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947770; c=relaxed/simple;
	bh=JP75kpJ3w944vOwv2HN8fnrAxMGrV1zhSNUKnJFvGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mtv22nSpr8UqmvBGv2AUwt1hZkhBx7WgN6Rtf/DobOBgtKa2I9V+zKsdK6M3IdS+rZN6LIgK5K5PPNCVYYLRGiYss1k/rAFUR8FI2+5HSJhxTL25i7aQjd96BPMf7YIIK+DPLxQyYHukctbK3X/doW7Zi099l69GCJl9YcXIOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPuUMlL/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPuUMlL/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso48174175e9.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774947768; x=1775552568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=BPuUMlL/wHYNnmkVpuVlsOauRf5I9kYoo1vAmP2amSX6Xi9yYbr65yGX5o5G4mdEQv
         G50MCYIgjgOaAAc9I2cq+wtHwZ3pK9H6eK0DxcaiHNGpRxTZkVq3GfHbye26q1UfjMHo
         xmbaX7SxpSXDO6Y2DV7LYN9H5jyAKzTuddAneuNMCIT9XKDoyVIkAyCZ+GKEU1zMPLoY
         6hFjO3rNKi9PK1wY6t6ygKU/grNcdTFIR+p1Io7g+Xhnto9ZWS4pp5SUVwUTQxo+8kDF
         JMybednx24o1iDRZ89685cIbRVCNVyUXRUOQP82nKfByBo9VJtpxKP90Isn1z+Hk7jQh
         T05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947768; x=1775552568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=FGJPKfs5hVbQ9APJSMnWclrCkdcRvRXmR/YD9fJyFiPsEDpkAbKzj78n0shBWR0ZLO
         7W0xM34Qmy2wNZKjL71ophdLdtmvD+qd4HHyXDSaoYpJXyr4SJxAwKGhc+lA1eAONF9J
         yw6MxObS2RYUaSTKWfSJCDEmF8pSFjmcG9mQCCx2+W9QiwL+mhuro7DoIbybSBW81Aae
         VX8yY2ZAF/W2cJg3tibrRmHhHHDu+odDIs9vhWbyI83zIvhh/5pwLZsnL9iXWcBdvPiO
         CWGBNCxjZIa7GZvIILNiiElW7BGPTojk7cqVl6bXZGQcEFqVYuri/ej73LQ3KGt0p+vu
         JdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRIkw0TqTZjaqvFj8vjfvw5xujv+E0WH7Evt8vl/5QBSrN+ZAOInodLeDAROyjla0v0Iu/se1tSgYV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81Gc2bEt159I/nR8hEdrEDhlUdq/i+96oGx6gfiueJk5QsWlI
	yNkMhYGk3uWhpp+DQ22oPYWNDqSvCu2+6BCQT/ICI3H2mK+JThFByJB/
X-Gm-Gg: ATEYQzyQdpR5NYc0O4pzO9oVQUpT5Xju4nBMrlWp6sr7Miav2/5Pj725Pb8yYacikQ/
	kgGkqoqaNrIYDFXfj9K39Z50SRinJdRmeVUH17M2O2h/hu87h/3cv0MdLfw0KaUeKArvtm8qFCa
	AiFch7SwxzXGcLBIM6eb0VmoHoGe7ZQUPOarjLq/A2XJrLS6UrG6CT5FLQsV3Jo6WR/FHU/0GbW
	j0gN51ao0Oohj/lQBE/qOLG+NHDiIAXaiX+c0dSvodgV9iyHax4lFPNHFMeGULcEnLziUIszoJa
	WAaWFuUeJJW8gdBpyg6xf0fCCmyf6VMjgk9Kb9j8GdWp2J2GZUNW5Q83G9T0rrc+74WnqONkZqD
	VnKY1k5aScW1g86YnCfqE/qYKbYv93D42w5wlaGy0ZH0oOu1e9yyIPdBmhF25sZdffIZHb/U2pe
	IRASJZW3wJqTHFRuR6TN6D5eieQOWwxDqlQkzRHSPSLpqPM/9xJDi1FzGVpiXj6hXUKEhWy3Xs6
	ziacpSAtgn369Q3GlAQMr4Nih5Ex+mvj6cLvTdC9FY=
X-Received: by 2002:a05:600c:3b24:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-48727d5a329mr283719915e9.5.1774947767403;
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80140esm19733365e9.4.2026.03.31.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:02:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acuNtMwKMy8ka2j2@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
 <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
 <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>

On Mon, Mar 30, 2026 at 10:40:26AM -0400, Frank Li wrote:
> > Yes, it is exactly the second case!
> > It's just an EN pin, that enables a buffer to route RGB signals used on
> > the DART-MX91 som only.
> > That's why I think regulator is the right way for this case.
> 
> Okay, it'd better to emphrase it in commit message because _SEL is miss
> leasing.
> 

Thank you Frank,
I'm sending new version with correct commit message.

Best Regards,
Stefano
