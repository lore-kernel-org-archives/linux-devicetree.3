Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747E371068
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096270; cv=none; b=KuOVI8fsqg5S3NyOxaEcPPq6tA8OzE/BU7fa39fgNOP/3PFcxpR+tFipJrFaxm+O9PyKXneROjEUW61GOy0g5w5MswGXIXQnWJM75qDXkdbWX+eSgpBsyKAbEBwLa5eZD3nEzPeJ5m6AAfE7tj1V12+cqZQ++NqFUQESJqx5DAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096270; c=relaxed/simple;
	bh=nVfFfY8A659cL7HK7LVOhl16GacAGCOHEahYhLSQ3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSCkJGg7aRv4BO8Yuue8cpdVCgcXam2dV7rk0ts8Mu1FXU3yC28V7d0+LANJwHghs1EIZHkIEnLn7wYu/OXAKrk542qpKkGZ9DdKE4k23YYzW/VNxjS2z+25yRtw1VCJ4YkdnReOZ/9/FbOqGDSiq90Cec1clciTmakz4y6pOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUhuZBfu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUhuZBfu"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso274990a12.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096267; x=1787701067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=DUhuZBfuO1KiROJdTWTNmGgwG5MngtvtL5pARztVVR1tt641D7L3cvL6mnELvF17qK
         KXKWnnJHas0SKKrVx765e3Yk70HgHF/dM3oMD9L5Mb/n5X/mj3Fz7jL7xYS5sWPLxwSt
         paHR/xHSel+6ZywfzAW0Ss1wW7kN0+OeBlla5PacDp+FMpBg268cLj8PvuKmGmpcMEMT
         rmWCrN4YSii28iTPRwpGMCuG3ZG8fRC/MMYdFxQHgGSjg1S6n4WrUYC+ZMzFEtoX0DSr
         0NVilexx2HTJHvw7s3Old1/rTEpSIYFgqIXHsg8VCMopN+fBNSHXYihebtahtZwHiLYY
         4Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096267; x=1787701067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=AedFcKxx0USCZlKX240m0vtshJi3y7AhzTPxfwX3hqy68CHJGfg89f1qVeKp0e6hql
         TxCNW2b3jXXINuTSDaspxSX4uBJYYK2HuVuPwlVUtsMT02G3SIvw3Y751xOA1km/spW3
         Mk5292OWxEXbGW/+w3hRo/M6hHn2F7pGajL79DLxCKCg6ce98fiG1XZZBgOq42QcHPOZ
         9IDQ6BZGk+V3656mHH4rbMSgTsEKH2uCVyDD5kszPept6mVW9b/hJ8dDBN0FgK9UkI2E
         1I0oo99otwyqYI+uy8GfomdiUxybs+mrfuVtRoa+G9sap8jkO833f0LWbMwzXHaXYjFR
         3XwA==
X-Forwarded-Encrypted: i=1; AHgh+RrpyemO3ILQV4qmpx9F7z7ToiF1dnTR6/xdYsHnr92eXndWaY0bR04bb/MVfKVfejdmcyxGF+zRLVTB@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6NJ0bbmqxIGx57E/Jfwq/xaSNamu+vUV/vs7MW3yRiNDkFrn
	OyN45LeeDsU55UYJ8Wed391OPB78b8evhcdP+rz5Kvsr3BF+6IjWQ6Bw
X-Gm-Gg: AR+sD11cUBPuZoOWyVyf9uD4GhVPx3uCVxmPr6LcATw+ILHnBkY0ml3408jGO87XdVF
	iDpdKj7EU69VqKrWp38oBHMe85yAwY6hcdkqWDhPc+Sz/foS6f2Et+OcDTzvK0Z92QG/3eRpK43
	XqmovT2PQj7nfNXqjIvCO9Dh4ysfTq44DSerXP9pvg0z9Phmvw2fFP4QQp2KdNWQaX5eylFg+Ss
	WOsMls/8o12DQfsFGhShT3lcGQN1mpC12WPIPdI8xxAlmqxL22g+eRLQGxEYxMcyghGwRYyBhyh
	aXhee1+64Iykn3Gzta9cXNroYF26dNmWfQzqFzrlnW7epUwsvKyG30Fxv7+v3Em+D/k4xTuQpD7
	Ms2wRVWoRrL/kC2wNN1Po88jQ5Y3eLHNzo0SYzGT+J7txHErURmtHU5Vn4ZSktpdumyPFpG9uNx
	L4QHOTj1/3wLdSCOdrPspi2fi3nd1FIMFw75OtWhiT9WCCKKvPGEizu17L9fYcNm7xt+git+Ay3
	w==
X-Received: by 2002:a17:90b:1804:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395810b5a15mr821265a91.12.1787096266837;
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm657098eec.16.2026.08.18.16.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Message-ID: <9cab8512-94ab-4ff8-9921-31d86033ed63@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-3-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:44PM +0300, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Queued for 7.4.

Thanks,
Guenter
