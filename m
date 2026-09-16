Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD833C536
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570681; cv=none; b=TXceBISqvfaWAecKUIqo9V+frNi/7PrLgIH/b/RlcTd64wpQ8jeeU91jrsMyyykkqgwxZvnw+sH7B8UqZ+AhW6Uq1bmcz+wSKsTy127/BuuaNY7R3dh/Y5rM0mGjQPX8iXPLaRaEEksUuSbnwqQeJCm2xgIgov/odjWY/3Ekf40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570681; c=relaxed/simple;
	bh=CpUAebJC1PrDhh1drx0A8Kt+YRnUWsUNY74Vdvutk7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsaeaDpAJX+8XqKHCYMfq+z+8C72Ms90GaBPwsCoysaU0CohW/E1UBy6C4N5RXjJPmksWswjBZcjySy2O86FtUwmXzvOPCIpCV6lThLlyulOHakZW9ZuLCW71oiVa4YQrhrMfKNdpFUSOCu2NKRPRzLnIKvCCOedFelz040wbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaaMOHDP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaaMOHDP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so764647a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570679; x=1790175479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=kaaMOHDP5rLcnaLL4AIPDb21bt0YbuZKDMUPF9Aa/w2agQsxv/vB2fFtbvsi1ZWKfV
         n1edh82X/Ejcs5n2CdQZG05c0IKRBNTxUUEW1xNuT1ryaqTCTuEHTP+NGsWmMsWqX41r
         5+F/JduHk5NdqnfzjQ+kB0SnSfu7gGbiq8X3cPDibdcpQLdGGI1dNP9Xm94LTjVjZ8qB
         Av27R6nORR6fUvDallFWH+7X9Rd+Y6NVjizjw2ULZ3bVjfv9BE86U8iMzwA4lGXcomO1
         yxw4E+mIGy8RD7CBk7qq8jNf7HdWO0vVTMEA2tfkudXGua4oSmlPO/pKdSJJW9k5HlK4
         qI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570679; x=1790175479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=QxOMs57p/8vSm98M9JOq4OD1GiWr4945L2wacsp0csAethnR0MZCyhYyRATsGIG9NE
         iAI4kSn3eo5EhnK9EccXveGCToHuHw2hjLcxvgT7ifap7lfCbekuGds6JRUX2UP1D6jt
         PzRppBuAedVBhJNA8NdC/VLUizr0/UuUKQVe9w2UmXXWwwWiNWMtaxm7fsr/mWDr0YWh
         2WxzkQvH1B+dF4kjj+HVKyRDSV8gmzSSYCQWvxsAlPrjvljNdf5E4KBIYmEwb9pFOzRg
         jFh9hMchI4PQSh8Tnt9cGKepZpEOelL43Li5hopoMxbBILJGYrOtoDs+/Z8g1G0yhisN
         k9yw==
X-Forwarded-Encrypted: i=1; AKwUvBwSC9Mj7xkiNeg0xWVBrYq3C8658pgpdkK0vRjLix2G7ujjpwTvj6nDMK8IIARchXbMy8fuPtuO0y7v@vger.kernel.org
X-Gm-Message-State: AFuF++mOL7m/XC1lncfzeQ8h/JMdIOWyrJ6HWhN4UNCDB0GxRO6tAV/q
	1YAwiDD4VQ8JVc/+/ORHLwh8S7fpJhyudmUWFnN67CkrROfET32bym37
X-Gm-Gg: AYBFou1X9JimaBR9Kd3bz+WZCnq8MBEyU4urRyD5lk61lNTUy0F3YbL8jPJx39aEA6V
	tO51DzsG/TkKC+zEngeuZ9ymtjE6tbWTyK888rTmk/04OpifUdaWNZLFLOmRaKM0E0tZ1IpvGRG
	iK6UaC6YWSj8a+gd26TSwuLsfck66qV2+HglRp2ZznxU2xEC8guutyY//sbuCSq7BQ/6fFqcxqI
	vyUEzSL/pBboXzFtfkSDSiiM6qI6egawm+u7Iuu4qHM+1L9HE/Jgg+QLx19FU3IqcbyuoYcHPK5
	yzKTvFbsItLBwP5Rc3+h/6MPb9QgDwORqqhG8Pk3QxXcxWhwd5lV9Gwxx9vQOGjtwjatCQ+SSSG
	KM8J95/y/ABpAxwsR//HLEqcUvr3v4LuVoswq6scQ22NE8Ff+bUy8sA/a2bKchx1tynSOrLMpl8
	zbXkMFi8QRstVLTfStGuEAOBr5rkp5ZziwfpKI1T7Xib/FFM57rh0pQwzEPznJIZeOrGojT4uDc
	vUntqhJYN7l
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr6871687a91.23.1789570679120;
        Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1d0be48csm1593063a91.3.2026.09.16.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:57:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Message-ID: <8a7d2481-16af-4fad-8eb8-00718117d354@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-3-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:41PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a PMBus-compliant dual-channel D-CAP+ multiphase step-down
> controller. Add its compatible string.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
