Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74A336881
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888161; cv=none; b=AUASAg/2A+tiim15rox/quVj+3UMlojmLmx1l0sh8xCq+iIlha8u5Yta1yy5nZfbTMjp/zV+Oid8KAMDQkEVXW32Wwbz6a7gTB7Uq0gYuCer5KvoyGCocpdl19gSA7Kkf7RDe+XqF0kOpgml4Cr0v98gpdUseKKh8R8yirhO3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888161; c=relaxed/simple;
	bh=kGkWt6C5ycyjEXTsn2oV6cHKOg6pKviV0NC46vzMPWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPwH72dvbSR7+anpZ4Yf7s/eQICucsaoK9h/HjqMXMcn28Hc+DvWFNuecFKhVqkCkleMsAmabzOUqHgv6gjwtnk1DSCzXPy9T/gNagKsLLYir5DSRpFQpEc9vDnyY0mJdiWvwe7/t0P/IZo8OARvNXT64U4gEQzecpl/oPgFkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er46dHqc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er46dHqc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso2282091a91.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888160; x=1781492960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=er46dHqcA0duUz4iMNw27XOsxjmWyA1B5pSMoaAIzmvFtDmVBXF9QpdoPvpeSCHAcB
         7/9oj/EC6m0KKL6e0DULafXDERbrsxenFnBb7dApXgG/R11ceeVEZKzh54brJXicCFSC
         5YWQEUKIWIBwq8Hn+lgcFx67Aac5Lzsqpn2kTpyDTafzl02OusDIQFr9A6slLFjba1u5
         Akq6E1H0DliXhpU+GgrTKSOaIl3mx4YBti7DQatVYRh7DMeInjj31TAE8gqlOIj1v3b9
         YmjlijND3HKw1ysYGvAaNFIkc4vgdV64X50RJRegdg7Z6Km/LKa8ZN9Tm736lreA+ugC
         BjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888160; x=1781492960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=ajmxf6Kqa+tRIi7RqrnK06va0+4S6eDOwVmf4Wnv1GYlCnrLvXNqRK4dfCio4/AaMa
         EpK+kVt6G1+9KWo3+CmJpGObZ13gwZ06l7/hokVYLi3HwUfkh3dPqkzWDjh8AaR3wMJS
         7benajFh5iybpKuOLhay1nP09IR034bXCBQEk8U58WUIGb0pP2ethpnNNWG2h7J6pkga
         Dt0h9ifSTKKY2VFrcdNzBPbQ00lkIjVUxp0StGAQUsFN9ljkVUWcQo34E8BdAX391Y49
         tMvtr3s38ZpCTf281okLICFo3XcGncSdK4SFKYtEGlD9jpJxykX1ZUcPSBLeH+lvfo6s
         pk6A==
X-Forwarded-Encrypted: i=1; AFNElJ9Vu3VP2dBW2B1sDgfHFavOoEkaX0mLtZslkpRJ8Ta7wMTG+IQpJ6WMo06FtREBa+KgshbaPLs+Xxmc@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdQ+skEzql/kIR5gJUX5OISVHxX6p3pdoI7odFjtMoR0qmHgw
	5TMacbK45lIMO6UwxlprVf/T468Tp4o1YpeGgQmdgNa+4TBOAeR5PiFpANrNQcJl
X-Gm-Gg: Acq92OH+LN6XxW9sZFKbcS/L1z9weXeMk8J7CVsXXqfkGRSk2bo1Bm91EUJ/9IirUyl
	wE0PbQNRvmyDxkNTIzObI1vOghlb+9NjOI7Hk3TX2kVd4EWweUZ7cOSvf8iptCkKuaGPmRkh4IM
	pgVjsV0leAe4TsJ3V0VCc450aifI52rRFjUSA7lYLWtqDS0lWumouzKcFpbHlG30rHnOSY7pEMn
	PyY9qk48VQo3geUc9K+h7NYjI1+qZooR3st7/HzzVOctb3oKev6tEMpPkxjYl05+VJA2bO5Fp5l
	WKDUyMMSBuD4kERd1xkcO2vG15LcgMLKHEayhxSlIRXOGmaG94myBGuvUw1LplPUTFuk98sE/KZ
	i/5Ui+x1aMtSMaILev7uHJothcaZ9CUngQGasR0pLy4BdM4wbeJ6QhIgnyMgGAkITeCKP2prbvQ
	4BvQgblFwL+YKsR5411UnS32BHQUOVmArKcETP28K3eaqkUhQ=
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr14132310a91.5.1780888159963;
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm13867998a91.11.2026.06.07.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:09:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"noname.nuno@gmail.com" <noname.nuno@gmail.com>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Message-ID: <8559cc71-ad0d-4b76-b562-67dd3d7a4ca8@roeck-us.net>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184516.919488-3-sanman.pradhan@hpe.com>

On Mon, Jun 01, 2026 at 06:45:36PM +0000, Pradhan, Sanman wrote:
> From: Syed Arif <arif.syed@hpe.com>
> 
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format. Optional regulator support is available via
> CONFIG_SENSORS_MAX20860A_REGULATOR.
> 
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
