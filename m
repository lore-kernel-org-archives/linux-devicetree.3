Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5B4D17A1
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353684; cv=none; b=jNVHTJ2zics/jwMqwHLeIXi7+CbuPXxlrFuzM7gnpmaIr3HjO1cV772SulKkPdEDpI+L4Q0voIDkQf6VfQXlEXzEM+W+GCRnkwDodKtmFDRJLiZv21x+f8s1ZgYLXqVehLukzg4AEEZD0n+7gLQ1ECe2q5jcw9nr6h1gHLFI2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353684; c=relaxed/simple;
	bh=Zx04GRhESpJuwUwQXfmh4GagFMWyql4BZ0xKHRNyTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke8EZPHtz5rPfiOjrYyEPloJMsA65uNbRYIIJJhipppVuSSo5pdb98oKVBe2TGy2nEuchSZIxQ22cZY0y4ZoVQM8BkJzdRtANQRJeMpd8UJYHblnTKr75/NmWgDjk4vFhNdsEiquXlhSBsP+hMBhg+GMdP1b1sohEhxceXa4L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLgFEotP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLgFEotP"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so536823a91.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353682; x=1790958482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=bLgFEotPQaJQDLcG26mkDYsRyezk4a7D18Be51OK2rd8p6pgtyzAO6g5OcOBHmZ4LA
         B91ZF41fjK+Pb0bNegb4F2d8trww0Sh0Ji2z4e9nNnBlyM2ffuoXpQ7b0EEaTngjyl6+
         paNx20v27X6qtkeg7yJ7/sqMjIu6tCMa/ZjP07FE4MJpmTfHPZ0ylWQk1MoOA/i6CYGy
         DoFDc2da6eykpCPMzQLM9rOBsy4bME7Bt29bchbCNcDdy+0E5bUma2HqHXbquKWaJhSi
         GzA4Z8fU5hNMtsiFDBmUnB4XCGPhDvLcFCqpOINWH4z78naRWINxnHMFFNYt+6y6LayD
         2vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353682; x=1790958482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=Ce/MA+0428jqQ7Yq54VTfBZ+cABnaqxuK04Us43HEZaP/o69oz7shEmY8DRmk09iU3
         Uza6l1dnmnyRyUwYxDQzAa1oHs1/Kc++GT3jim508TynnrngdzbZH0dXyKns5C1gDbnD
         vkjFwn+OPS3O3FoXq1rS6mBTkLOZUkXqvJcwRRK70OOT6arasRIyKH+9Xpwj5eRmtjZs
         UU1goDZICChe7Gnhu+GyGTlYVBBu35RkKHWNptpD/cxoBWfxah7KUwv1sUbQsxnQ2tN7
         ydF46SZuVP0XDrAo9RRVI1fSs++UAudboHg2SIjZ89QlRkPaHJMfOlA18OT075jHj4Hk
         AHzg==
X-Forwarded-Encrypted: i=1; AKwUvBypwgaz0S+ryNb7SIyMWRyS7I3LDALmtK9iOzLk+CmeNQQ1w29vkMxb/V/iOTjTW/rh/XK/MLRQDHuG@vger.kernel.org
X-Gm-Message-State: AFuF++nYTsWTqtBYLomO93iSjzofz/MQ/g+G1C/V/Oh++kRJvHmJjicL
	XdiKFTGTazfj8QlQGuNMQi+0SDVe/6rbovGVzh3HJQI95gYz3uLrGh97
X-Gm-Gg: AYBFou28rpEuEbrr4JeBm3RraEcN5+eDHiT2J69CmWyBe/8N0R42SHfL76ixNXM0oGq
	/osdeveKy/T/Lam6DD8Rf2IzARnoUtBIYoVtqcwtB2K6ws0CSEwOmv75rh4/IeS6TWU1gfLCFpv
	JbBI7QL91aQMjpN9XMV1uHOEulP3cj4WQs40XzNH/GQrNH47jAUnNYPB8PwS2YJ8ARmpF0v/Vzx
	pCQcLZw8i0kReS3fIEci2Jz7hx2h+pVyPFTbvHFKkKWLbh23G62Bj1BYvwJej1iL2jlALTPqqOx
	r84Icv16VuR9K/jfk5VxAai8HXaUi6g6+g9t1Cv4nrkcd2pF+xUNRwoqFaz//u6Pj9U+9GHs0uv
	cYIOGv8wtmCBj0EoPMCFZG/UM20o6yFLumjxyNBo9Py70co01FN5l3vLczJMnz9kYSs2ULJLDHB
	ldLLbePdJxuyNROShzmTGxA0hymZnr1UAelZtbJ7qfI7SEWkSgdTQrRDwiqKxdIO4VkDVjKP4cE
	spUmEFi7QrU
X-Received: by 2002:a17:90a:1c89:b0:3a0:9dbd:431a with SMTP id 98e67ed59e1d1-3a09dbd4752mr3475490a91.10.1790353681688;
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm12819580a91.4.2026.09.25.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <fd18f46f-deec-42ee-9574-91c71cc4caa1@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:35PM +0800, Colin Huang wrote:
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
> 
> They are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
