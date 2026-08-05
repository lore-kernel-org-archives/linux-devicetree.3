Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7A3B5306
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942071; cv=none; b=QgmowLLn3/oZsSGptX1TQLwsss3uLDkoVXypapH8ye6NuT24x77luNzChK8OZlQlntIXtOyBLK2Pg5GPSabqkkg52R6jSKRU+aF/8og5l3ZXLTBN8Ujz25yRel3unJvTxyuGF17uylJAyZ7CF91gVtiAvZClMZ0b51IdQhyn8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942071; c=relaxed/simple;
	bh=rETe+kyKI7gO6eDhLmVRVB5BUJ5GhBZxLA9xY7N02eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBsXc1ctdp5cNcaVxSyAg40x9IGDQd8nBF2Yp6un7W512JMhZBJN+f+Dn7HqGlt3o6d9BT12DCs+CfkXgwR2+2VpJw+fnRb55ydkzt9mSOUfv7kE2rfZaDBxUGD86KsCW7Gna7XoqpO8t8xlOsj5AMG0nY/4niIPfkljdaU8/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLbg52au; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLbg52au"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca913a601fbso970090a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785942069; x=1786546869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5i0kcxttlog4h9p4Gll70N/vEostWekyPEjeEzGUkY=;
        b=nLbg52auKNxJqk5wIlBNoVRIe9V53cgyV96sf6NtcX3wGoPyP2VGAMlIHSH5rFtWts
         DipJxHnvgsqdvIsHVPU0CvaI7uc2y3XTV4zQkioNkTyhDacPRu7yIdmp1s89uhQKzGrE
         l+YoXtnf1n+K7IUUqIhvq3XgkOHb5ox71UVWaAjmshEPirhd8Nx3RUtoCuKcR7caji9A
         rrk37wsrE1NZo/Xs4pHRwinIU1RQya6H3iR/szN4ghEptAHvRvis9lJhPruAtUSukjSK
         kGqTMDKcSdi/I7DSCEYH3bL2fJcEZi9hO9Adb4HdqGDpnIAoyig35h6RAuXVAiAG8MFR
         r7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942069; x=1786546869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5i0kcxttlog4h9p4Gll70N/vEostWekyPEjeEzGUkY=;
        b=dQQf0PssNUEcmgHpxMkv2iVZBBKh4feVFzukE+uxuZ0t5jtICSedVVQjLvwj4GFvD+
         bp6RvmgWO7INvJiWheoUKq0U3NdF7rrNH4qjVZyRxZ1HKJd0tpoJha9wxO7HjM4/2zB7
         fgOwuemwjleGOuk05tP+h87rpk6kSUV2rQM8cITKBfIL3imMfqjtY3q6lC2giMyFcKfi
         OojtTLT0S66Mo+rebaiaEYi6Oqu7ZDOLnFioMDkTbiXMTFiqk38LivZL2BuM/mw/0gcm
         GOZ26O28mTcuzTtJu7lGVKiUe5f31zrs1ixK5ZbljYFP5RpRmRLkuGi1jcoMQNhU/bS9
         hi+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpXtO3VgOA1872CKT0kEVRqWnU6xRqixHjAHZo/XmZlyUMgeXMf0X1LzQQftnUGZ7eYWd7EKVGgZWCw@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/f6/GJ0SYnteykxu44QXoCNzj4c/jiaHoNo4y29r7UeA4HfT
	Me4d3FR7z4GU8ViVGwLlaWlmovb3nZZ856VRZFeJzycwYdAEs+5ORiqa
X-Gm-Gg: AR+sD11FEmt3VbyYXNHIvSPEaYrhnQ7w6K7hpe8jzL9VB1j4uW6UeW2o+dzhJS3DTo2
	Ykc19BjBVMcBURksISo+KMY8UdnG9OAMuQXXUfyrXjDXuqiRa0HjODGdRVo/ZU1KCNMF2A4tyqu
	4O7NmAiM/Xf/PAr6StgVW272iJPgxK1oIgfq2QWF7T/xjZEhrl5z7u/JzLyQO3zYvawSVxPKSYF
	ZskAQP11NObynsbNh2GFLonS6Yz/zioaC3B5rIu/UoQv/oyfkgFMuCY5Xx6e27GaYCAcTlrQ1Kw
	n03Whp97TV7YltbVipPCMDTMapnAjZ0YhK0Kn1OVtTnwuB/N2HNkoevyE6ricp3a8FkjMgena4D
	LgzLGjImGBNOdQLYlL8L4fiRYdGW75geTJgnpy94vrwSpttzOwOX4O7d/m1WmfV6EoVIiyGr5LD
	UEreIQDGcYsCmi+5RNLeE4GJ5o5lP7JLKvXgQ7A3gaG7aCcLrNKM/AAIhmAS1wbT7twSHezDQ+B
	e3vBQZXn59P
X-Received: by 2002:a05:6a21:3a82:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3cb85df09cbmr8984012637.7.1785942068906;
        Wed, 05 Aug 2026 08:01:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm18114476c88.5.2026.08.05.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:01:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 08:01:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [hwmon-next PATCH v6 4/4] hwmon: (adt7470) Add thermal zone
 sensor support
Message-ID: <bd7b1dc9-239d-4d97-9593-1d1888fffacd@roeck-us.net>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>

On Wed, Aug 05, 2026 at 10:15:20AM -0300, Luiz Angelo Daros de Luca wrote:
> Register the ADT7470 temperature channels as thermal zone sensors.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
