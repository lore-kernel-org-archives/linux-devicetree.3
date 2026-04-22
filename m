Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5A2FFF8D;
	Thu, 23 Apr 2026 03:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913340; cv=none; b=WkjyP3CzHGG5/riBJW+n8P7VIRm232OB76+zra+Qq6CcGz5edC4ttqJ60wfoVAd+eGxdbIhGHNF4f/H8ADHfOXVY6IqM+lO4EDlAIXa8CtDbwpWRKacHPUmx9RIdTJphEjTmbGIkZTXCXqM1WQKpqTPacdPwQOXY+I3EwaxVe/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913340; c=relaxed/simple;
	bh=WE+F3PSdM5XcDYP+9XU0/iWblreHJB9hjPUBKn2jtUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y47Fthj8+0z/cEko22RpJLU0N5fRHEPcpbBdUpvGto8fTG0ef9Nf5tzpdKUOvN5SiY2h1rRJQ+opHTGJJjoNs6CE8f3Xwy+VF6vl1d455qtAKppWehdfYXuliV2ZBvLHX/13uyu7VPh4fjo/6crqS6HzGugDNodWFSLVUEzlAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=VyC1jTh/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="VyC1jTh/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2C9114A90;
	Thu, 23 Apr 2026 05:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776913335;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xiFEKeCsdo+y2ee5HJM+LRR1fAE5qMPwg40kViy+gKk=;
	b=VyC1jTh/dJ4kXDxQG6/VyAsDkfcdE26VgkLNG90PIEdrIyozpD5hZvRRQmo+n4UxEjb4Tj
	f3Yj9iSs1ooXKcN1xkplUYbI1IukaXSeyMgUiZQR40kIu/f636g1S8iTgavgojWkFRup/q
	CQaMmJZnzMPqa6E37CdXplW+fycAhJgnXbIpl5pw9hv1iZXiNvqSnpETezGGbW4GCO31ks
	KGrFVHODvY8aQZAIdujQRTZajn057lw7N/OEWSWiX885UBy/cTCgmBotm8kQUF+a4/0094
	nJOTsirSYrDr+AEgv6/htl6oVHPHw3esAJDX5avH8yUfndLYwaxK1V6DC1SX4w==
Message-ID: <80f05d8c-ca09-4ef0-8e1d-f0f35436029b@nabladev.com>
Date: Wed, 22 Apr 2026 21:31:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display: bridge: lt9211: Require
 data-lanes on DSI input ports
To: dri-devel@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20260407203109.34302-1-marex@nabladev.com>
 <20260408-eager-millipede-of-aurora-6fcaa4@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260408-eager-millipede-of-aurora-6fcaa4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/8/26 9:35 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 10:31:03PM +0200, Marek Vasut wrote:
>> The Lontium LT9211 is capable of 1..4 DSI lanes per input DSI port,
>> describe the lane count for each input port in the schema.
>>
>> For example Linux kernel driver does already use that information and
>> fails to probe if it is missing.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Can this be applied to drm-misc now ?

Thank you
