Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5C3A4510
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767327; cv=none; b=JfDqSmg8i7B2lTwrPoO9Cfn3+wfCjyGpXoteVv1VlBnibYuv9MEl+1bSb9bFQC0oNYwG3DFQzwVZ+ECm1aThoiffBzEfmnjgdzcduDfE9e3F4t965Rd9fOm2YEkwqNZCJZinQtN5XBw+JUVO9M1zO56XflWaQc2BQeEsI6dC+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767327; c=relaxed/simple;
	bh=6rb/9dMZpDK5WoQdhS9fFwzC1QtYxK4ocnO5Z33wb0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3qkfLZmJOy4SWsiMBMAov8HrhhB4WZr/wA2ju7gMAtQLdiPGdx+MgR+5Zwm0/yWWHivmCi/0BIgRzcR3C+NQ40wgwDJaKxWESFrz137Iunq7mPx29xIy/olwAIPmXKSkyJGZFOSTlBaMKjlnVk2vKTGMsj0LZ4v8PkqMc8tJQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7lVAT3r; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7lVAT3r"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13810b63a1aso295334c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782767325; x=1783372125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMrhf2JgP5UA19mr5y1QAnQWIr2FfmB3Piqu4jc+2W0=;
        b=J7lVAT3roD5vnrco+lOLg11LkiPw8/XK0hVY13o+FkIlqjbR1kFNhgt/a1+eTHH41y
         EAdRKe/uQy1ogCkRx/oCcqqvtPweWER5PVtM7AkEb/+Byrj8acv6qI1J6yAz9W7kczCH
         UqennQtdy5crGrig1mzZzneawVhQJMiKivugwFz3hvtOtGZCRkFheN+xF/j9Q+5WY5yx
         gk/bq96HZnpuYxaYui1mPP5NjXfT76WCFcdxlSczEufpZExsWweWNTisiKDMVn2Q5Ivb
         mrYMT2Jzm2y9JvO6bXA6GdA6LKAlIPVSMWK0mOqZWs7K9BZleiB8fbA0Z/d3zCAAXq0R
         T8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782767325; x=1783372125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMrhf2JgP5UA19mr5y1QAnQWIr2FfmB3Piqu4jc+2W0=;
        b=POOzbqKJbXIOSyrQ+N7RBf/eZlzVaafbcTjm5qAPN0zp1A1mC7EHJxcdtKg8YbS9VU
         egm0UO9rEK0CVm7Z2z19htbA4lFr/BU0D/rayRU5Iqtel46v/YjikHh3ez5hkrVpHWfo
         hdsAGR2agsTXq97K2qNWFQpSWmIDxeLqfKP4RryciXJY2wTa8xwQtOyG0taPlqGqMxQb
         jHOYa+H06km1dMK3NYW+Xgi+Ckfq3MOOJf+BtENriN0k4ACc12Z7EwlQnHIszIZCoujO
         gNZ5t5RDufV8xBGKd0wYwdGK3aRazhp0+xfQRxPZMkkouf+gCIzL5GTwiGN5YUUIZyIQ
         jWNg==
X-Forwarded-Encrypted: i=1; AFNElJ+/tFCTgW1r2kp9KyM4UTXzlxtJUJRRoMISzP1WzM7JfqWxsSDFpCE7ChAnYHdxACC0xAAGcVAJ4QLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfpBQue6mE226qroGMXypWv4R+xLVRv9fg5KGE++MuME3Ad5pm
	Y5zklzBR7MNL/DbyWHf17JdbL4MvNynXCu+Ud6qcjVzTJEUp9j9/q5eg
X-Gm-Gg: AfdE7cmlPvU3bhwpqs9BCzFZDBGUKfTI/EHaFvAF9FBjb5tW4FJlhM+ha+U7KoK/lnk
	iCGjZb1rgmONvPsgHz1O9U3KneXOcH9DiKx0meBPMuIn3/AErBlHNo6PFnyJCFBMUGtnApyx9oi
	Xf8Dkcxbfvxv1yphPygxCPc8v12Ieie8K15nkB6gsY6c0rvruAkugQ6+n3wXrNipuptMd6IgtNQ
	QwRIGhp8tc4pcAF/NURQyAT0rv1rySkq2qlxL1vaamX6pSryjFRf7Fkvz0Bv+4rMUghFt2Rhv0J
	BcTMjPG9/F46sMcPmW5cO70QA/xuDRd7Qch1VnTrdL4yXSnaoms4VzE7zNMK35axJisLI8blxBT
	6v0C3uSkLyyJcQPQf9iksvYYzzXonhZeOuz4m3vQxm3ZKUwKApXVPSxcCup6fbvySjvZ2dBhJnp
	Z9QBYFi/69yn1iiw9wvcf1oHH1hQ==
X-Received: by 2002:a05:7022:23a7:b0:138:48cf:14cf with SMTP id a92af1059eb24-13b2a1c0e62mr615336c88.35.1782767324912;
        Mon, 29 Jun 2026 14:08:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm912436c88.3.2026.06.29.14.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:08:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 14:08:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
Message-ID: <2cf72420-8513-4856-a3cb-fe2629588d1b@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:26:02AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add support for ROHM BD12790 hot-swap controller which is largely
> similar to Analog Devices adm1272.
> 
> The BD12790 uses the same selectable 60V/100V voltage ranges and
> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
> a dedicated coefficient table that mirrors adm1272_coefficients, with
> the following differences derived from BD12790 datasheet Table 1 (p.18):
> - power 60V/30mV: m=17560 (vs. 17561)
> - power 100V/30mV: m=10536 (vs. 10535)
> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6

Applied, after fixing the comment about BD12790 coefficients as suggested.

Thanks,
Guenter
