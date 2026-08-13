Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F5361957
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 04:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596716; cv=none; b=qjdvwY+hKnACeCzA58tAj5RSHZb44+Mjv+qcPw+fvBSOvSbJ06O0bXJkQMkqQH5/RkXOG2fIwAawkA/+ao3fb37xFEotXSyP7+cdEQWG0ReYzYOyg/4XHc7ouRYBBCZTsRCYJhgEihvg8T0t2ytXwMWQMNLubA8trAieN/D2UpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596716; c=relaxed/simple;
	bh=uKUK1gxkl6uJbUz0Xhrvk0SBk14n4u6sepfNf6fVdGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQJv4aNQUKcJBmdK0seaOeEmmOzMq/zJn7loOXgWw60ugzAaJe3VNgiTP7sdWGv0v8RSyK6fxvAhlzJ6KuZjcgBkklhcFb/+BHRfqIOM0VCimfFgIgTFp0B9p4n1IwQbGW4pX5QFDgdkszZnWm0GSQwu3Rv0OjUnDvS2Fk0J8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh00akK1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh00akK1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1861732a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786596714; x=1787201514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DduBe0z2YUFzR/A1UM6Cy/sXyURXYl8CxNoLveWxT18=;
        b=Vh00akK1wJZ3CSobH0Y9i7BOeiapUGxskHBv8dyUYPfJIfNjDnCGqWSxPSZsyf3pBn
         YDp+kBXjLU0DUh9KnOZhbrfaCCndSFOCPMsYJh5HlUBgk0nK0CAXikQKQ9a10r5RF/ro
         l6QY28bjh8XHBHFUgXGq2FUK5tOdKMmnmKIRG0q3fNpguSBTkKfUewaEBDVeJ/h61/Xp
         TZOkflv6Q+j198kuNue9wC4uYreKdgxHLudDiR78MqDWpxvu2qpsnIJdY72gcsJJbhHg
         XpobhJGoB5MHrFgTEB8Kn/Dz6UVv22AQIjqho5iG2G8+Mwg7+DKEDeC0e4bdQx85Nxlq
         p/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786596714; x=1787201514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DduBe0z2YUFzR/A1UM6Cy/sXyURXYl8CxNoLveWxT18=;
        b=p97R4hoFJ8vTOShprETyUOFWxuLMgeOfVkgdUdEmPISb/20U+ffRcX/TVOoNxSUCqr
         MsrD47Vke0+x6pmCqjsThMirNKHhPCqRK4l2UMoGYQ2O/Y8awhVPLLKcJeJD2M4ljg+B
         c/gwlViALKt+W4urOCPSJnEBb241A6GoC8ejyYRIzyXtur/PfJxtXsa/2k80ZaakIcrS
         Ho53ag39SOYp/ee69KBSk49FSF3XZV8NtTe6g1pFVAkibaBb25+rvEyI/x/HZJomVHdt
         KOSBrhqbfiUu+UsyNBQdyJ4cbi+osb/5lrK/uIBZVqQhq//Jh4u5ZvfuOFd5v9a+vK1l
         UHKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2QN4WOq8kt4XknfspN13O0YzwwFSGDFU+nGkUbVbFZH5HagoYMcqyvEiIrE67Cxa3f+4gUDid77uT@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeT/34lqjlhHYoo1aeycSmHDht8Bf5b50C6DofDq48VFA1jm3
	1/KIG/XrlH7+vPWqZEHkq9biRAoWXj6Ap67m1lAX6IpA1U7IFgq4/GU1O1/Qig==
X-Gm-Gg: AR+sD10QyWCOiSW+pRfFKA4iHZ5M0YEplIhoMM6cLqahtRpbnu4adWfp68n7GfmVFOc
	1qH3PeFhuYp9VWGDKigQ6LL6cMsClM/CKMrVwzr5GObEIdPjqk16DesTVGR/4HEBiXg9koQQCPw
	5YvoPvqn2O6eq6SeC6Hgie3ul/V29quK4wT76b6OWzNFErVS2zce4y2aCjQ2jzZp3dUHkBs8GfK
	ERKGIKdwh7eXgB+VHhM7YMFrP5fcOKNfFbmcCGqv5n0u6O7d5AgszlFxkJFtRMFVEZV/yF8npml
	YFVQ9P5g8Y+CQJph8Ki7ReMsGhhdmq5sfAVbIYmWi8FzjPffGV2DqxJE66Zh7cPZH0p3xUwarec
	DAQ/jPq9BtYN0DXlAgo4YYTLuqmmm8JYHRCVztICazru0LA+xi7eNkGTiRwLM9NVRfLMpJBq3qK
	RF3xN5p56W6ND5U+WWWDP6N4Ae4kCrvShRbzYNBAqVt66GCm40rcXwcgdclf1sGSd5da2FmFZyF
	Q==
X-Received: by 2002:a17:90b:35c4:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-3931de34a43mr4190232a91.0.1786596713959;
        Wed, 12 Aug 2026 21:51:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cefea07sm1803421a91.14.2026.08.12.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:51:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Aug 2026 21:51:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP110 device ID
Message-ID: <277a7da4-7201-46f6-98ef-b394f18973d2@roeck-us.net>
References: <20260812191021.65304-1-marex@nabladev.com>
 <20260812191021.65304-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812191021.65304-2-marex@nabladev.com>

On Wed, Aug 12, 2026 at 09:09:45PM +0200, Marek Vasut wrote:
> The TMP110 is register compatible with TMP102, add non-DT I2C device ID.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied.

Thanks,
Guenter
