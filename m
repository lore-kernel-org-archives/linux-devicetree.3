Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801283BB9F5
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463846; cv=none; b=BibP277kRhrka7lE42Y+kzEdMcXF7rKhPc2br/Snbncp1Icy//nemfSPT2GuNQCtlTbGnKgs0KBiVDCT84auisOgrmEt99KaXuMdkUV+ait1sFMC1MV2Cv6QfgVzaqgNU/KcsCeoLRck7H80IB+6yHH4+TJsGSkxhw9xggt8uhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463846; c=relaxed/simple;
	bh=JDa1npCoxnVz0A/TLLUwyB3cYz5sbB22cXecZ8GRtDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYQcA+AAViiWGJ/L+vVa0Z61EBJdqMUcR5L+gAGzCN84IxQ191UPWezjrvbS39yjK4mtJLLI6syRIU5O9ngHEkd32qKsKjgbLeDSiDkBkRdm9D6ozRdW0O53uVPGwyNcKYyaUr2ZW4kbjGlWJzp9ZbDDqHKYMIXSoVbAROb9w1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ7LF8GL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ7LF8GL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad8076b01so796025ad.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463845; x=1787068645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BR1AwFv5ug2wa1HdUYKEyyrH2huljwL1Xbj+dbpxbVw=;
        b=UJ7LF8GLwaRX6dpSC8S+sH+1YUJAwgFr43FWAkj8GfdPlFNNDsPO+00cNb3ioW6wmS
         +lXv6Dd3uVZ5mbGu9ElmQthlVYTEoMCYafDJ+PgkjHVd71DmHkzaaRURgkUlFCxsHuEp
         fVMWvakW4kIs289onIoZ/PKnlXUX7lJdg7PPfsYq9BUdwQV/MSpXbKrVY3yS0sPJqrQT
         Me4mkiA7L6vu471fpaCmiDgqrTGs3VQvY60ZmMciUc++xjT5MqySzcar4BiVR9yTMR+Q
         rI7hJLSgqNHTT2B9hXqMwOZJplkC58MBXVKgWq2z4DrZzpfxDLzeC5bEhDx+YYtunuR1
         3WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463845; x=1787068645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR1AwFv5ug2wa1HdUYKEyyrH2huljwL1Xbj+dbpxbVw=;
        b=mN85O6vfZP52wWuixxHclhUvyZCI9aUkJDp5F/KQ5+4UQkRifMhKeueaAVfAatBwft
         RP+XusqoZtvuCZB5Hirxdawpg+/Z19VCCLAqc6C9It3RM9Ak5Wu3/zPPfVqcMqwTZDoT
         q/mxklxCSasBWi/che63MBgroGpR0Gkm5t7/tnHqYQGpgnf6kT8Rqfq10uQNVEfzGjVV
         Qun6sNV25ABoYlnTigA5yPuNLlSnC+eZii6qelohfokNFYAS5KB/bFPjWbCI0VnnJ6yh
         UoJSceFEROw2nw6BRIlV4AoJkIVEReNPcju50YoZeArTJkuTJwBaQ0VrjUfWK3+XWm0Q
         JvLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbu8UBJPKNcZChl9FT9S6EBerq7PuFzXoBLaUboMfn+OBgckME9LUrwBbNZRMfkLT9q6kclBaqaBF0@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAsP68pjHTfqnaEEqyHe8/+405svuAtx3yvcOk5kaIF+FXuO1
	Qqm3fyXy0hpNCErvrLYGU9K/iX+EnB55+Cu+iFTeX4klSTy4+6cWXdcd
X-Gm-Gg: AR+sD11RoA8OUSyWqIQetKEAgrKQdyJMdPsg2nF3rplnMQJRtI3l4mNqIeVfjl3YQod
	d+RISwpI/HOoaLMgpqmckccpS/Xa1GRKSqqKfErWtOW7M8VHojDoo5PzdZxMRNjg2STc3i5fBzB
	sAe9XUNAd8o48tWQi3rAT1zn3qs6ugi/nwAeNB8CoLQb0HfFjrnr4rsi5568hr/WHC8ZCjLj0/s
	7kofobiEO5PwEuxFlkyfthUc3ct9w47LO4DPBxDZDNnjfLwxdhb9UoKe61OqEga2pGNSAJjjEen
	DVaoOOALeaHPWb/2NoSUHus1e07KNeNitKzu5OhSXfDmecNFSXCg1X4bYhkSGPfn4tc775wzbxy
	GG7h8pcRolRolQpsSuqgC0Wa90llNUjnyQhdqZJPIcKipA36AFaQT4MB0/WuF6EzMwH1OL1pN5B
	VvEpo7K9mB+IseKhDFEa353mcH9DC3hA8QyMQ8UMTMFPO169mqT6FT0WseFiXYhj59jleAaGTJr
	Q==
X-Received: by 2002:a17:902:fc8e:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2d32bde999fmr22795135ad.1.1786463844615;
        Tue, 11 Aug 2026 08:57:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d316233ccesm10216235ad.72.2026.08.11.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:57:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:57:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (emc1403) Add regulator support
Message-ID: <61aba261-099e-46a5-bd17-fc81bf4c0dcb@roeck-us.net>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731113007.145322-4-clamor95@gmail.com>

On Fri, Jul 31, 2026 at 02:30:07PM +0300, Svyatoslav Ryhel wrote:
> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Applied.

Thanks,
Guenter
