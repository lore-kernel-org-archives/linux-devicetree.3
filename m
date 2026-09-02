Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF23B3884
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385108; cv=none; b=ZUJDr/6h5nWTMs5zXnIrsuGtLj5uyAbmkoZY47NmWMABAMblV429T5UNH2dtGQIaHZYvcIB71qLZ1tb7W7G4ipG/m5NYtUW8/buaRQMEHmie3IBJ7hM4pQy97+EpqKzMUs3Cj+olwDBkLbK/X9OktsWPVj5pJk1DyxwibPMPxUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385108; c=relaxed/simple;
	bh=db4v1ANHItotB3g1ahWtztT7Yb7zlAgWKJovQuc6WCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hse1BWpdG8B2QcOEYE8BMjlP0hlBUKBL7b72uYdSXcrF5EfLrMyu0xmw+QF7bSdLV05lt3uL1vWKlHQwF+NqpRAdJOu0+RfLdJZ8GWou9zopLmjTWpzT3UbYnvrCOlXIdkf7CBwU5+22eZjIMIJ7mOq7a/s0BsHQ07m66bGJ99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjyxnMgg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjyxnMgg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so2556306a91.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385098; x=1788989898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=UjyxnMggSvWjQlQ6CH5nhRqcYjt8lUYVhHTws3E11wjdUGatGChOCAE47U7chPtM4x
         H3OuRn0VIfU//l/Pv7Xeo9kDZVmgh46OC+6qH60Kkog8mrr7NjorwO8xJel8gKz9MHet
         pKoH4yX6nBxKnDC/mQU4FBWIVoZx6gRJvVp1NrzRvfh61WU0Ym+JU9/jxk4vbI2Vyq9N
         vRONhN76vDDHfiVqyuTzxSf3GXr0AI72hno2RwDpCSJqtPuqTZ/NfuW1iJLYk6cFOfeb
         JRfk5n4PUFzBd0Kg/rAR+84Yb0s6wM5xpe8k/G1kdOJGiU9ObcCNcy2aB55xkJYIYpd8
         trhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385098; x=1788989898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=CZRAamavw7uUHBFPfY3PTR9DGTefG83VCVSkYxMndNMjKLng3RXcmGrUKHvOIn8Y9/
         1I3vRBUGin5V8BF13n59KuV29qshyMvOolz+MH8zELgzjaPc5PeYLRuaexQIQMRJrM/k
         vrW85HImigkInwEDr+oYw8mAn0THmRs9yPvQe2rPoOhRVkh4NCWKKTUgOZPAA3kBX00V
         TDve3dVz1EuGMxrh64rfw6sxMCGM3Jrl3X0WFSot/xI2nkSKjZ4H1gwm0GQmNNW0eWIR
         UwpgY1+nFE1+y3xOhWrKcSuWXg01HCU7EzjYVLGZqMfCqDIJg4PZqL0hL8e7ljSqKNAU
         WcNA==
X-Forwarded-Encrypted: i=1; AKwUvBwKRUnUxsEW1fPVimt+HFHIxzfaymTXTE+WLTCpaPZv/rQwaLTZSB1wp5vGQP6/ix6yqrAO2WaXPSJ8@vger.kernel.org
X-Gm-Message-State: AFuF++kAXf5RQuE7p9xhTlfd+PK0gv+YTW++CE3BBHTY9iuNXCivW8XD
	ILrwl1C0G8KCKvDDOlyuHR8mSsg/17gF9JdwYalFnr/10baMr67WvMAT
X-Gm-Gg: AYBFou0R/17RzHnAEBeJtONs+IXhtVq44yAbImBJ3jLBHb+PUEm2LUvJEkLta2uhiCc
	ATACTuI39TlD3nNjja8HgttoHK4p3A5FIan3nHPERkoSW9pEIZ9tqi+CiTyUpJhxlk40eW5M0ZQ
	GqCCA6CJtj0BGF4jZhWwSe0CQOO+mkYsI8mnBUB8pLCMJT6mmpycs6YDdP18qgop7G0PTkG94g5
	qKAozotj6QKoOAlSaeh872Z6mhItRz585F3DV2MzMMlFvYjAkyK50u7Gwcfowo4uPV85+FnBPoG
	0aAa4LOewcnBXPkFTphpo1w5dEg1TAuKVtoOkfR1bUos2kBMeUmvHsYD3uGWm1dGdvT9N1cWAo9
	LOOKvokJTh/cVN2U6xM18Grzi91niTUT0eIOSxM4WemBNehozvCLHrJr9s/U6OQgvBKuL0OfAt2
	o3BSrPiwnQnmsFxjdgUS1SL5eHEgzvCFfeEXPzpC9ZPiTQlenIpN7dkiHqST9YYF5/LInlQdV99
	A==
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr11966313a91.15.1788385097798;
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm1371740a91.2.2026.09.02.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Message-ID: <870df75d-bd0e-4e59-a81f-880dc4207dfb@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:48PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are PMBus-compliant D-CAP+ multiphase step-down
> controllers. Add their compatible strings.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
