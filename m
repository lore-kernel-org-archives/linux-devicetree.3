Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F34BCADD
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322211; cv=none; b=dHw24IleTLQ7yW76gLqfTexzUIMku/JNH2XclgGGH272FnKlz7bhhH1WDd846hekiqffKfJ5wUuxBGzSwf5kqpFgR9Agk4dLiC0oOtAQhd9sMbQFSJ66pNwGSDb6coLcZAK/AhNA43/CD0U9G1odaZGNbhaATfWHZ3hSwyaftgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322211; c=relaxed/simple;
	bh=iJ5zjD2EWw2yDJ5z4MSpVjmW6V+stFF2dP8kSOQKY70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJY2wqXdOGyN0y0rNr8JcjMW3NzN/B5Rph9WBbFOHON8DYvRpffx+15vcCBrFGuVJlgYx9rjhrNtmjIVvigYbO6vb5iZ6CMQjUxCCFNaOPb3OrGn6DsP+pDSrpW3+d55oNKxFHPAvldIQ8CuwGe8Tv+CUZDqY8eok6p+Og6rAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yier4Xh9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yier4Xh9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1012379a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322207; x=1787927007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=Yier4Xh9iCsVEqGjmTOw6EdbngSngoMSzx7lKN8F37EN659bLub3ys3S91kbPbPOiX
         Yu2g97TOmN4I9inCUBHfwYtrPJqcKFp0O8qUNg+TA62unGw9VJHUKWqZPqRdnjfbfslF
         qDSIMOBiMaWuXCSf2RIwHuBIZwmEc5Oi3RrJm+fM6yZWo/nzTjnOyuX7a5qpkxyLwx1C
         qLbtHtvsBdMkgc5kJhU7g+l+SCaMcM5wkXgX1vFhWC75NP9m8ht5oZXobfktWUfric65
         ohmKUXGBVEJ68gn0ajCYm3x1SKFs7af4juAPH+pcCcnJEtxOVmYyOVccWBqhAqhGeBD8
         0mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322207; x=1787927007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEFJejdXEP132PW639xF3lV8S0Gso+8wMOBeJk4UlZM=;
        b=FLQAJisdafsmTZT8imkCEfvEdeO6Zl9YNMmSx3eGMyOgWuZDJ6vGkIXI3+SiTuOS6Q
         XEqQtgbQBSu4y/JKs3TNdXwUROzITYW5EJYDdE40IfloDyO55KTEDiUob4BxYQ6uoE61
         05hFfyDdh4q3rcR17ZfEPRQnZjrNBwAbfHo6tz76RqZ800UY0Lslb2BGxE7mIDq6QswF
         LgxpWD201AL8YLlHeRttISng5tgoV4YdVCjQIe1USUdeNDQQ8oGU/DL1oTCVfqiB1Blu
         QzYQM1tQ7KxFRHyEP20dYQvpnDJ2ss9LawQhfijZIxd4lZD8dEy3Tkmswaa1Ry+1zuxT
         oz4w==
X-Forwarded-Encrypted: i=1; AHgh+RqvrG2Fa5v9O/z+TW+rOKtE6XPN3GsGmo2e5MmgmkFrPxj5IfRUMytxQccA0VpVvpx+NPGqFisZcOD2@vger.kernel.org
X-Gm-Message-State: AFuF++lsuXBWdB2bGXPGFQXOWf7M3LlOQU+UGdqnRbvpDNB3u3xe3o7k
	nTt/jJLvhuco868JWV0Ehs10sISzT0vaieCnlQ6PqmruyuEg+9FHjhU46wx55g==
X-Gm-Gg: AR+sD10LF4Gc0tx04cSD2fARXu1yC7b2jNZ/xBazXf/hPes7mZ4bleMEfbWcNCKFvIY
	s+tcIuEksTlLdxOrQlXgVSmsSv9mAP9E6B3TJVY8ubWBe0FzipTunOPBbfpL/G9dqIaDwtgEKdQ
	z7zz8eyzMW1NIR+RCdhsuxpf3gNCEsfKlYxYprXBR6aDSaj1BCxqyiy2BN2xOXx1+vTQix8Calo
	+9RtKc6JKFT4785cZbABXfPDbja6OeH2su2BNFBcs6gDmdS99COVmkiJis7mv1c+dn9w0mET6WP
	OVSllx4csOqAIl+BqyAMXJU98ocxVJWgxXSrWj7/T23JC8focD5Y6a9JJuPZ7eGwXWS/DpHVKSI
	qw0MWHaP8vNRR2uXnCAP885OytWAxSbJxYVNuCcQEzAOJguq3+P3WfzeVLl2N3pQi3p1UBygkRJ
	ekAkwOiWqCBxgSF5nELMSecB+Cls72fh015V05xiGwilwLYtphc6hSkG3dBKzJ90Fxc6S8xcuS5
	Q==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr12901407a91.14.1787322207392;
        Fri, 21 Aug 2026 07:23:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm25714380c88.15.2026.08.21.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:23:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:23:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alessandro Zini <alessandro.zini@siemens.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS4x
 temperature sensors
Message-ID: <e081c728-92e5-493b-ac28-9473eade7e82@roeck-us.net>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-3-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821091924.18975-3-alessandro.zini@siemens.com>

On Fri, Aug 21, 2026 at 11:19:24AM +0200, Alessandro Zini wrote:
> The Sensirion STS4x series is the temperature-only variant of the
> SHT4x family. It shares the same I2C command set, conversion formulas,
> CRC checksum, and timing with the SHT4x, but only returns temperature
> data (3 bytes: 2 data bytes + 1 CRC byte).
> 
> Add support for the STS4x series by dynamically adjusting the read
> response length, suppressing humidity channel attributes when probed
> as STS4x, and omitting heater sysfs attributes.
> 
> Link: https://sensirion.com/resource/datasheet/sts4x
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Applied. I'll send patches fixing the pre-existing issues reported by
Sashiko later today.

Thanks,
Guenter
