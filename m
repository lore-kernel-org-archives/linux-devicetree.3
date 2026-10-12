Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7044F55BC
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841719; cv=none; b=UVKz+NTuz6XAuO93NluUUX7OolodRPfj8stmX5LDwXr2v1wtlW1+BZg3KcAc+lYSqXdG0rLXVsls9I1rI/lxuweFpS5zvsQkiPwR5xcl7Z6JPfA33e9OoH06K7dm8BAF+15FyIeRSw74lbYntQut707ZszwNwiiHSkxv97ssmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841719; c=relaxed/simple;
	bh=M8DED88FTt9vGdXSJgORPtM+dFk8rNOOwoXkojqQ0ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BO4JP4fPKEG/hO1fI7XPmdrFjcGUApPU3o8A7GB8iUB/GAPj1ENVbZVj1U4DmvtZe83lz6T0dakENI9bCK1kVSNlGDbJsWqHHVCqtgGEaqPuiIbaoYIl9TNRUgkSthD+JelTiybeR0Aa2xbuvRbZEBKCgWkJ5TI2CM344KdeI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6SQyZx3; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6SQyZx3"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cb6983cb9bso137482137.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841716; x=1792446516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HnRhY04PNKIblmopaFcCx+f2FeA60ZgfsKkxJFBzxg=;
        b=j6SQyZx3sPaIksG4x4b65KZxBMhJsxzFsDlySPoMpKh0OTkHOe57irh70AHvVAUylv
         cXQrxPWYCXAcy6kHi4OuTPw+ZZUkBuIM35UXK1SmU9QhysHk02fHiHp6LsutgBgo0RXw
         Vv9xIwdOujPaWzfmUs1/2M79ruXGbBbLzuJ5eG5xaD3fjSxOtomhK373LR6B4blptBCk
         t9JXOvyibHJzaSjVaI46ip0rRYRpUyc0Rzm4R8A9Xmvska/QS29m0OcH2r47MdPNVNdf
         cfPJZQnJjfb0gcqK98XSXe7+XV6tS889qTByRWazk6dOLyafksSPA2mzhNevTpO7Io0I
         qz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841716; x=1792446516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HnRhY04PNKIblmopaFcCx+f2FeA60ZgfsKkxJFBzxg=;
        b=vDGyRlIwr0BcOqZoDWCvoHyh518i2gRJsSatXhwF1Cvx3bPgPBTdbGIZny4GZ1LTzw
         p1RTnQ6PFZrm9qjAYHzp0oZLJTpVnnxg5D/9iyLL0rEN+szcVVYoyMg3/h0WSfN2bcWL
         SX51v99uJeS0qE8NTyQPjSu/OzddqBJLkDgse0dDSWeneOHGTkANnmyc3Ad8NAK6Gn6e
         kb6adgc2Rfyv/06oQgA3hwjzRf4y6OXBrmA6b6dZQTFv9lbvp1excfqTV/ZbettQwRSi
         3LTPMdL2RveFhNz+y7tAGJAZzc47f/oNullD21lpEAHL/YWFEG0S3f488n2wsNPUByAw
         uXRw==
X-Forwarded-Encrypted: i=1; AKwUvBwOkFaCpWB9FSyycDZbZE7rYL2zgd1TH/iePPrAxa1pgq+jIBBxa6A2upv6ve1EBhSQQySqFhzNiNnE@vger.kernel.org
X-Gm-Message-State: AFq9FYImKVLm9cgioTSIFzECt+9tdG1VdOUCV/lXXy6IkscRboKf9cFr
	fSCOfwTttsitwf81/mh4AME+gOt44Ce/JKY/WMImpdn2HLvN7H/nRtFP
X-Gm-Gg: AYBFou2sp4doVHHaeL6PVdfPy0FBLSTxRQEbDccTrrSnK7mvJGxSIZZ9CFvmmqJSKvC
	0H9yAtpIU+apXnbfedxj+QjU3uOPEvHyIhDatev0kQysZfNmd7cViRdPsysPoxR3t8sJwUbKTou
	TbXzVyd6PXqmohY1vdjp2LVDnMTt/9t0GcESHMfR1pgBBqHj+SupbPaqCN81JqjSZzszbcgVKG1
	3LQNuh6FNWkvjRD7EuOnj/J+lBYrdfxKTq1eDTTIcFKezmo0GfiuVgwK941D3WYnstTPL9LtyWj
	p+sLAlazh+GAtdeHVGwIqOZ+ZMLx7aCzUKYyey7tMkgILVcShvRsAYxmE9klCyPPgHWcQ0pmu/o
	My50n+5SRmaDOQreF9l9ncvFh9OOM2rX+rxSNJ2vrs2zBRZjNccYY060f3YzS1x8zu3RLEGlRn4
	0TqKmTp/w30BjaeBXsd4/hjcxGmgCov2QgX8kClRMChxnXj4f+qQ39sYqmvVj+p18Zm/PRg26b1
	Dut
X-Received: by 2002:a05:6102:f8b:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7cb3737be51mr2116910137.24.1791841716002;
        Mon, 12 Oct 2026 14:48:36 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cbbd178e4csm1426250137.2.2026.10.12.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 18:48:55 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] iio: imu: inv_icm42607: Initialize gyro based on
 chip_info
Message-ID: <as1Vxx7sz3gTfc-q@debian-BULLSEYE-live-builder-AMD64>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-b4-inv_icm42370p-v6-3-e53884f185ff@axis.com>

On 10/09, Kanak Shilledar wrote:
> Update the chip_info struct with a new `has_gyro` property to support,
> devices which do not have gyro functionality. This is a precursor for
> adding support for the Invensense, ICM-42370-P. It is similar to the
> existing device except it only has accelerometer. Check all operations
> related to gyro with the boolean.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
