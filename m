Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07571A683E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305917; cv=none; b=YLJ8C6RpPYjvACiCMHvKYI2LgkZ5OZe5UEdZvSJromLLOdWjswPyNW3lHNcXbFkyv6u1fmWnWOXYKU4Xot48vuQTZFr4yPoOpXWpv5upuTgAhfwWISWhZtkZUw1fosmKGyz0n2lEf1hiUTixTiZi0MQRP/1cb7u/rFOy4cfvb+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305917; c=relaxed/simple;
	bh=d5X+0mGIr5O8jmugP6tkVpOw8QahBvvE95JE3VMBuPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiA8NG8pE+OiBvUAzp/kt4HhA1ex1rN8mheXRImnQmwM2Xmkpfnj9odZ6zfLdehc/d2UjCeYA0FHvUYmN0Px3uirflX30tXRWlWVRLUpSACMVD2E5WlZH00+KNeZvMAYC0wgAB6gZue2HEXpS8puKSHLIyumIHLJ/Hw7q7L2eZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCnhSAUt; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCnhSAUt"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so232349b3a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790305916; x=1790910716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=BCnhSAUtt5+w6FB06nYONsG8FmUCJKrkGgmstKRysKI/xfVA+9NQoJBgysI8mgZeZ/
         2EzCIEGJtupU0LNKRUB8chQb/hklFmaDDJjVhQnqzC4F7gqd5uEug4ULEH/g+LxqQCG6
         vdgJECUfqELCpbRjREKWwOvBNYuYXpeERgdvLT9ggTAAkHddvZs/8PZiTh8fgS/Ybu8V
         Ws8+g0z1bY5zhJxhbrS6v3KZQe3PTu4KHm0ckb/zWbd5P44RTrlj9GZX+1xZ096Ihwda
         J0ZSi/STWj5SeQCtIV1BtJ5IULq7T5+0HfjNl+mVdPw/RbyRQRmhypBrXul0XKWNv9Lc
         QuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790305916; x=1790910716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=iXMwHztI2vwZOcKXcr4F9M/xy0gYYKQ4osxFY8bPYZogoZrnulK1nZpAen9VeJc7wZ
         Br6Mcog0lHOubBzHH+kkBGOtbBvYv+vcv+gptkcDgxjsLI8PR3PvgFMzIesNvqnfLcxo
         v/KmofBfZxicsOqSYaMYbAjzE8ToAXEtvs9XmMMIW6ezS3ACKFbhBYuyixXdul7FGeYG
         RscTzMWZ+qjo+/Zr7dxgfOggclBC5rvoY6T3kEsWAWIkq2RjRMA4YCa/XQ3PNpKpWPEb
         QNmRBJhmOlscbfDM36j3EGOpHGk734SKxBYcMScmLgPGmI/qe/1UAMnQrYHr7NTfxrwL
         yipQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQGqU0MgSNVGLBkkH/vMxf/dX1Oaim9bfUJhi2pFB9h3GEuxQVp4qnONd/aSz2lHdwYtgo9fZDViMx@vger.kernel.org
X-Gm-Message-State: AFuF++lL7yGtoRhj1BzEhPyZo20l60vSL/ajxSbKwYUDEvh2dvMdd85r
	GfYJG6ahckiXFMA1iG9szOJqaxsplufPetT65f9WK5vTVHER0ampIKRh
X-Gm-Gg: AYBFou24dHiOUxKa0wcMIuF2Ae8owIA5aB1riXjgEaLj6says8Y1Rtyip08o08J15dO
	axStOgonXl9vJiR7Fl9ZPl41+mUgc6V47AJAF9KTXdhcNpV0XEzYjlcOdwgvoKeQwMlDIa3v34O
	2lk+au0vYSekWsS3IRHU6J2B//0DuJLTiZooUI++RJC2mtiK1wJLgwpho6FQwzZ0sUQh4pxQVYE
	iw0YFk/MkT3kVuxJHTrGERFLc7d6ou7KQwp+f64GQ13zoVXZQNTbBck5XcKwsg1kkzPLFG2HBcS
	jFam3biPJekNDGDuXLzIB/y55ujRgF+ygFxbLFQnsHUxIU8VhPhUnwYdzdwG4q3W2F9bEuRhUOa
	INAxWnpuohAqvSMFkYdpicYUjfu+oUX6mZPstqhmOVKWSisVa9kqq11QpkKSnh/2bslFv1/lmMv
	m0mnqfzp2x0RKjZ1wiQAkS8rx2FzHBYeNJw084zBl6kMz/sW5yZin4r7hv+l8XFBW3b4hmoglO9
	x6f1ym1dTey
X-Received: by 2002:a05:6a00:b4a:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-87e9995cfdamr3809048b3a.25.1790305915932;
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe82eb49asm408300b3a.3.2026.09.24.20.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 20:11:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
Message-ID: <381005d6-0aca-4d71-a08c-58aa7da7196a@roeck-us.net>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
 <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>

On Thu, Sep 24, 2026 at 04:17:09PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
> M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Applied.

Thanks,
Guenter
