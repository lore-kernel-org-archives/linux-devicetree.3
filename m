Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC354AFE04
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442998; cv=none; b=RkWTk8jX0s5QqIVzpfQK6lNshLRSEPiuU8l5jvlZEZyQ4WLCa9q4mZGENLzlXnjkGNDF91E54G9GNTjPIpM8MSDNOYv5zx4tF19ZJw7qofgUm65sGtaxOrFWjTWU3bsHVV/NDLsf+d3VuzJ1jPQi/36m10mSDGoq+c6DEPdOtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442998; c=relaxed/simple;
	bh=4KnmTBwok++fPaMfsVNwqmH+pEbhftNH5fl2TMl46Bk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEqSCvLRmc9NRHItiUEKGPbKiUIBRRbBhAjJK95o9gCizAq4EpWQRKMynGVYDvMfXjlJCaVM86AdCTmzvnXWBXOUYzxiyMcN6jCDIjZo1XesoRrIkzb3WwWt6GaMpzKCJSKgA2IzHcPlPKSoYafr9g+QDkQq5SjbH6BB0vFcvdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gjfuq+Cx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gjfuq+Cx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso24087355e9.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788442986; x=1789047786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQztoV93kUusu3+6iPjezagXhoWGmz6/B4T2KCFeXKk=;
        b=Gjfuq+CxpxHphx7C/ZOt494FtUgWIzY+e7UBl7nvfbit4W7Ub0ZlQu/VXatfO9ApsV
         NR4wHxQoQY2CBNBAGIxVcd2h3Y9IIkvwFGrZWWtx2q4VzY8J4whQpDwiUhCCaEoN0qUk
         cdjfs2a5FNHdFQbixzYG8ewJ+DuffE9eMB11tVOuYjhfIOx1fOgZE/muJUURQRxLMpzd
         dTUiLy5gttATDJvhudRcyMXvbfadCgiFJr6/oRff/vZvk+hMwTjAn4SooKBdx06mkJex
         LAtWzH3MDSHdOPGEWnyH+3aC7zmcA0hH1fTXryvOWvVbd1SA6+k1mqlqqXZ8r53nbF0t
         mYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442986; x=1789047786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQztoV93kUusu3+6iPjezagXhoWGmz6/B4T2KCFeXKk=;
        b=mt7pyRkiXyyBhkyWmQ7gxBkink4UcmQiqr9qEa+ekSKltWYHEbny9xTB2yKrZaW+U0
         /BNHYeIEgewZUFaoQ5e4q6GYCRnFsyCnPPOQvlXNdtIR58IhuSlw2kvMuuU1ncTRBCf/
         YImRmksOOBEQYin3SJgxFCE5bQ8KG6fxO6olsOSYnQyWeHWb3+CM2B/m8bdjAKeiyLER
         KwjSKYU9Kb8b+vYo4lGitFCEP9FQsADKD91qCbOP5z1LZP8+dwnJYB/qc70f7/JvaaDd
         KXm9U7yJ8McW/wueMXaTikkfiZIEcRZmX8idHsJPwAXOs91aV2H2BrLDjTXxdZOSwPcL
         cefA==
X-Forwarded-Encrypted: i=1; AKwUvByyqhZEQ3zB//QILEpKeylECNdmTqdiv9cWmuLztrjzmAN2qZxbRMgoexEbp+A5/uQpD9VPAibZ5pIu@vger.kernel.org
X-Gm-Message-State: AFuF++kftppczz+lSo0C1MaEJ97XjlfV7Acnc+1JE0LQV+opSpGt5KaO
	Je7Y74SSpLOgYR8EdBwdgP60xDoPmzTRTIr89eZLNDcBd9pbCoYOtE+F6sAkHvnPQJo=
X-Gm-Gg: AYBFou3DUxTmUODizDdPXCrHSjlSZJ3SBkY65EzmFYrLXj+cxgYCO//6pBB68o+aLBf
	0G1mKGblb98V/wbg+fUaYgH2rtoHN059Gt54nW+j/6o4A3J6LLiYktTFxrRLtTj92lUom6yluKr
	1/dxB+9h6JrZ6lDJwxp+w1qpXYxaHjVX+hVIRZy7KC4lbaSV/lhu3ffqBbpFW8ME6nc9mIa0r6r
	ZxwwsiTcY/pzZZsY9BXTMKKmvbvEhB/ha/jh1ONRVyQWNQm3J8CPxzFkDRoRDyvweOQ8IM+y6j9
	b5qO9jn1S4ypKoy2ba5rVQJmDxZ9aXcjjir+7z8U8xGztOZtQtM37vt6KRnSa9JYDx++mr1E7+4
	euen6AnHiP1X9d2Cb5c7OPD2A3O+98BbvAa6EKVsb46kCrX/65EdEfIzEu6WxpZft3CDdaXYQP+
	qatuUFAv26JZTJY+jR8enw9sKMxQPa60R8IARbG/CcUPEhkjDGJ6TLwVBg2A==
X-Received: by 2002:a05:600c:e556:10b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cf5baa013mr808885e9.5.1788442986610;
        Thu, 03 Sep 2026 06:43:06 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm74408515e9.0.2026.09.03.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:43:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 15:46:45 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
Message-ID: <apl6RddLcPz8Q2-O@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-3-pbrobinson@gmail.com>

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The thermal sensors on the bcm2712 (rpi5) are the same
> infrastructure as on the bcm2711 (rpi4) so add those
> details so we can get thermal monitoring on the device
> as it can get quite hot.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index ae1fc9d728c00..c73ed9e066662 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
>  			ddc = <&ddc1>;
>  			status = "disabled";
>  		};
> +
> +		avs_monitor: avs-monitor@7d542000 {
> +			compatible = "brcm,bcm2711-avs-monitor",
> +						"syscon", "simple-mfd";
> +			reg = <0x7d542000 0xf00>;
> +			status = "okay";
> +
> +			thermal: thermal {
> +				compatible = "brcm,bcm2711-thermal";
> +				#thermal-sensor-cells = <0>;
> +			};
> +		};
>  	};
>  
>  	axi: axi {
> @@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
>  		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
>  		status = "disabled";
>  	};
> +
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			coefficients = <(-550) 450000>;
> +			thermal-sensors = <&thermal>;
> +
> +			thermal_trips: trips {
> +				cpu_crit: cpu-crit {
> +					temperature	= <110000>;
> +					hysteresis	= <0>;
> +					type		= "critical";
> +				};
> +			};
> +
> +			cooling_maps: cooling-maps {
> +			};
> +		};
> +	};
>  };
> -- 
> 2.55.0
>

Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?

Many thanks,
Andrea 
