Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061086;
	b=3gQ4jaRdg1YekkSbyrazVkIVIfj0ktARHvxM/h++WYJPF5rY4hTSJzJ3Vgah6jJwg2dx
	 edwZcTenLKKOEioGekBpFGBZUcNhmJDDtg+4BVNIOfwQJI6h5i1gIgl/qC6Pcx3VUPLtt
	 o5YSejMqnQ71d98X8/KyMRx+BwiWdXy3QmwxPXFP7hX2lyrSf+85J1UEJ5tfqOSN2Gpyq
	 ewllPajaywHL2WQMgUE1ur3zaJvgdSwl1xeLbqolo5xWVf4+1mqsd3bwvKTzGzVbnsO8T
	 nsT6Kr31Q/6SvQ2qwGktovSi7aDDfH1OLswTcJFeI14KPke6MNfnI48UmKxBWd91iAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061086;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dckQmDGK51xUYXkNanlmrWOkBlG7G8NjEFbm3i1p930=;
	b=Xh+Q1ms1hDnOUOFM1Jp+dQJvbGVyP8F2qeSRKv4jBuJBMk8XYWtaOR+GWRdkbqIEPLAL
	 /ueeqPsh3ZRTz6P/ylPc3LCIIKHOtXaCnzlpmrGR/h5Q19coe4DEE26FpV+26YTV/r/OL
	 z3sLY+NEbGf01KSB9AJ5rLxDZHngyYkxZ24sUNSru89MbXNuxiFc25EeXs6ASrQL9UPIu
	 luTMnJ93FmQPzsyXYAEbXkwP4TaFi92ufHZZBLezlUJCQsvXEF0B10fj/5U6tWDHLxOpj
	 Kbef8ohBW9nzZySlnh9eAcB1xDh2b5IqAi4eP0AA94Z9Ba7njM3+vfQI2hST1/HVtyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=B+p524o8;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC5606D831
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AC5606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=B+p524o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dckQ
	mDGK51xUYXkNanlmrWOkBlG7G8NjEFbm3i1p930=; b=B+p524o8hVD3mkP/wnxZ
	pI+Lzdcoftxh6e5lsWJxeI1PiOgJOh41R22uH8zFRCGxXbwnoBrZbRkXyRoqF6kd
	aQLuTHvOWZet7z6o0iqXZN/VWaAKc1MdAV/MlfveYZ0nf6GsyZjJMHUFJZgeX8xJ
	xafeKQI2DIuRLy4Sg4LXTKdSYsbiGgd3SsQJdvv0C5JvtPS5LAHdrf1VMKKdwTeV
	dc1KAXlzZufLrMOpYArulQlzqf7EsoPiCd/UFK9JSBE+3L3a4Vz1ImML/ZUWFf0K
	I5bOUACAqLrb4vtD/tcMs1jl7y7APAUL1NbK/2L5hBD/Y9TO4jfwifK4nuaqEtzD
	tg==
Received: (qmail 2529595 invoked from network); 7 Nov 2026 15:17:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:17:56 +0100
X-UD-Smtp-Session: l3s3148p1@U4cnZbBfNrkFFu4l
Date: Sat, 7 Nov 2026 16:17:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
Message-ID: <au8zFKCFkO_KCdHj@shikoro>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 12:20:42PM +0530, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Andi? qcom tree?

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

