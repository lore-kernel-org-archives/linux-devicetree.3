Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7681EE7C6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 00:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603617; cv=none; b=QnE1P6FJcgPw9qxzfAk35LfEkhyoMAqjfgkDqY6+aQqfrkOzDpk1X502pq9XgPNnhap5y6RrfJQkwoQmBZ0Ki3vdQxK+yWxq9odgc5in1kHFdxuNJ9IfC8WyQDTk308K33n40FYSiENRJiBlSIf+0Z3TWjeJvn67EG4kD868zkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603617; c=relaxed/simple;
	bh=+ThdJPNy+byv+5Bn8J2b9hHnhaBGGv4AJj/JK9pn78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUo5Ufb8gLTQi3wY7cugQMFUR0cSe/8n0Bm0KFFxaMqEc1Nx5aZ7zUyV62bByBl0Box1rtHz1BiuH/8DaHPKj0DiRuNBTVyZQC08MaFtciVTMP5gNe+JaBWd8w0aOC4gE1XyNI4LBulVE4h0/e9S+vxP/sF6c+AeLzwjQoEvTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3WLNfh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3WLNfh"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so237588a91.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603616; x=1790208416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlhBBh6GNry8e/hmi/l6fJM69DrRa/l8BJNW8A1qQkg=;
        b=ic3WLNfhwU2fzmV8IaKnGslnh6GGuVvR5hlzb7CyCFJBasdoUZUWa8XhFzeDZ1C1jt
         qlXnaMa2o2dYgsaezRHeHTe1iq5aPo4cI7krEwCSxA0NoFvSlKJ7LiJzKkRpF7g8bglE
         wFzFrCJ/aPkBCxxAqEbpV4XNdHD99due8xNwIlj2fWA49S3Nce2tIj5zldGmJ5IP831T
         iIcQhaxe+ky5iNgiBw/SFC8/E1AGQYd/HccVkYyIloEeDRPFrqQO2OpGzhuUh9oRxCOk
         FCzGxHE1BpMa0cKiPp2C96NhsggKQSgmOcUj5g/4wXcMseiobuKI5cZR+PBUVSr04U4p
         l0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603616; x=1790208416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlhBBh6GNry8e/hmi/l6fJM69DrRa/l8BJNW8A1qQkg=;
        b=MJBZtx8fTxRRHSMHCxfHn2RpLOD8Hyf2bwIX3c/ZtriicCDv6AiGpkdq4jc769QuEd
         do2MmkT60nqmxdmF8UPH61MYFOcY/mlZD9brnC0zuM4JykDLTB0FZ9015TllLzOH2pkA
         +1QtZ6kEXkPtKj/Av5HI48RJ6J3DV3v2NpxJjeOEl2Ev0++giTK8B+f3qLpZjygi1uzf
         03vGpUairOlankGDQSwYFWsFzRWipIVUXDnnPabtrEvIZpfeQSaTCKdY/E4oNaYpiEuJ
         vt9ldpOeZxp8eMdJROl5e38q2JEgkcV12l16a2Pbd910Jtd1sLUrgoHKp+aPWYgiWxp1
         NkBg==
X-Forwarded-Encrypted: i=1; AKwUvBxVfb5GzIbRkCMOl6bZ+MYMeNQO6vlQJiS/vhrvSQwmRc3bF2sEed0KZ2BgFimnAnCbqqOK2LeDOivr@vger.kernel.org
X-Gm-Message-State: AFuF++mFgOXLCuAje86etNz9tqcZouQl/hrHgdWnWYctIpsm56kr05xq
	bwJhQ1NzjQBs55p9XIPQAAZud9tGVxaNpKLyvmGUnUZLokaNkSxNZwNfBEUNC7z4
X-Gm-Gg: AYBFou1l/GKex+0dqpdPT4kBI67fDkMLbmJiHlQp8BB/Z/wYeFK+joMalqxbxQLiSW2
	+TP+0/36L9iRy8NwiAgE1IDH2F6qi1+R7W/NqZcC3xA/IBWXQoAEHuzVjwQtuPBotIzZcXGnCMc
	vMr11LlCaLDJ/CXD9wYPHi/fDteq8qjU4Iec39+St5c+mZsp2W+dOIaYN2BmaPGqly3+O/V69gW
	zxVpEQDWSGueyUwKNj13DJHIGKA49wYpeYdRbiGKfO+eUO5p+MxAQM4saaG32l057TWM+YDsEDO
	NtdlSWFYkkehW39nC5M72DdHJiS76/ZhEOV+qw3GJLTuwGJIolQEakAWXgyM0pzhz3+ohR7nwsb
	SQsdWpwKVdNhCf7DMuheLkWXg0G9jH4jNFagRiYmhJLphu7sF2SZlPobtMRIloQaRJ+SAJcMYpT
	Kql1HJF8/bh/aKjUUXUmZjrfKFI/zspMtNrgrbWZExEdV5D988Z88xZ70DnDC1EgRmZXnXRudnf
	KjFf6rkP+51VABqU8lYqIs=
X-Received: by 2002:a17:90b:5388:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e1e509fc1mr10470483a91.22.1789603615636;
        Wed, 16 Sep 2026 17:06:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm11616315eec.28.2026.09.16.17.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:06:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:06:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/tps53679) Select page 0 for
 single-page TPS536C7
Message-ID: <01bcbbc1-d613-41ac-b848-462b309a3a3d@roeck-us.net>
References: <20260916235406.681131-1-sanman.pradhan@hpe.com>
 <20260916235406.681131-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235406.681131-3-sanman.pradhan@hpe.com>

On Wed, Sep 16, 2026 at 11:54:21PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps536c7_identify() sets info->pages to 1 for a single-channel part and
> then accesses page 0 (writing PMBUS_PHASE) without ensuring PAGE is
> actually 0. pmbus_set_page() does not update the PAGE register when
> info->pages is 1, so if boot firmware left PAGE set to another value the
> PHASE writes and subsequent telemetry may target the wrong page.
> 
> Select page 0 explicitly before configuring PHASE.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
