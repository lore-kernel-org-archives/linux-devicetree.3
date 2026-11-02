Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592267;
	b=fax2sVT3s0PmHtrkZYK9umdL5OifpEuKFur4f0cOIB/0ZpnVvEI86SY1D9CnPKCrCo3h
	 sIXQFtyF6+jrEQjUL79ZzxxVP76sAIwy/dLtcTRR2iLbAHsuYcJdajXTyoOL/2BqPyR5u
	 pm1z5YX6N+lsBTBtoGeLt/6VR9f0VDSmep9FK1MRzX4/uFbYHgBVWvdpqG0omU28+1D/q
	 qH3O/ENc5Uks5kHc/Tq3vhzawYxl0/0MCf10uYLJAgXJ/wWjWwSomKTKFmb0tSbky95rx
	 B8SIjdKgcYK1bHRpt0VnywE+b+/Pc7wH8fjL5Pmq+ntNYmMcvqQ+uPMvyKYLm6n5/aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
	b=dJNIKmLYhCC5ExAIKeMhnhF1SvR+V3qDoM2lDfFujpmFaH6+eONOU+D8xmFdjmKb3jRj
	 mGr3vZfFadm5ajBis4dA8weFx8UB916F0+9DEkKIPYlHpAZK1FDbYpCdNDAaIqn39ln+n
	 XXicJqvgheoknWvJPT89mxC4Pfy+fTLGDBKLLtQKAe2g0I3LnZZl3fvN3fixPM3Bsj/Xm
	 Bw9UjtIqlqf3zYvRpoqqGKJQ7gzb3AL61YGstmmP6pYXfzDj45Hf22gQvU5V0nWFmSROd
	 4di5TyN/V1bxQPOPIMAASV8Q0otip1z+PxVYKea8oSLd0rJUjDUmtom7Y4K6vmnkg2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njgNK7Zd;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A57606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 04:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A57606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njgNK7Zd
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so140657c88.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 20:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592266; x=1794197066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=njgNK7Zd9sPBHMbCEZOZr6eVDUWt5KBuD+VTP+s5bqmhvtslQ8ZL2sG2+HN6HyuFVC
         /+Z5tEizHBWdkrRM0OF5q5WMfZdalD9gQNPBs9DTYP+elbCql0MeR7kzaPyPDea7kuAT
         rwnGZvYRrJBI+Pc4kguE08MyRN2WT7+LTczIPZGGvlCNlpXvU1OhXizINJ5HswSnqv+d
         2u4SiKplJO46unhLgZ4QD3txxVYKeGcT3nN3r4xkqMllZmAdCYg0NEnikkTh4oJX74WH
         PzS2RMW00PUFXM6veBossspVxxZmczbNTrIwJf9qvZWkUw8Pn2s/XmyVMZsNwtZizWxV
         EJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592266; x=1794197066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=fihEnB7NUAk/46rs4YB9TyKApM1hmGMyyWhOKo2X3hJU6HA5tfZneOkmJcVTpif4xn
         XKF1ePkdb5297JaSjJ2aiAh2A6ERVfo78VZS/gM75QNTbI0+g0dS8FAuyjVOVwP11GJm
         bwOb1kycLvJIIKKgzCR7K9DVoDltxs4XUSfEgoJB1h7291x051MPVr168NRlSuVfnSCA
         EhW+ZaArisfvN0etzxNUXwZzlKzu9ftgR5s3yShigkjrntQDIk14rhXJRq9qbsMNRbBn
         UzWsvSNGEr7CQ6CwD9JtOR5B0tXw8boGNE50NidbOEMtNmCLBn9/UWl2Bwtnaq+vGjNW
         smdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi/NW2L7G/pWQMOdoLR7+NQUi17VDmMDjhkr/xS8VhtIsNwX/VVtkm7HDSIzY+S/Nc4gBDTK32TG28@vger.kernel.org
X-Gm-Message-State: AFq9FYLXfIiMte7fVciOHI0VsmYtWpR9hcEnu8EXb9YwrLTg7ZJdwdhR
	taUhxN8x9HXJpI0ZxuRE9whYttLQqRkNOoqOB1P7Q7xuN8cNi+6G+nRO
X-Gm-Gg: AYBFou2ZIj6O3nvhJql361Z+sOTJ2ggr0i1Y0Ym9BMxw6W/e3RlQ6zR8AtVLSdPN/eW
	ma8pecsjy8P/ErgP6Gv3F/hVotcOYcm6GkpAS43EPOVFG0tw8lq0ICJNEVMeVMelYVfPuCbbWfE
	Z44F9NZq8dFs3xcQqW61iZ6Lq2007VcBHfVA4Iq0c10C+u9IvOHfZFuDmkOStgVNgXHL1qqafid
	3V5NLBHnzgF1Te/5+KMOxwUb0W04n0ZzcOhvwzcgKe1Ij9F7UwfVOPW9m//4w/0UJPBDf1QaeCA
	zGqAFMcpp/d93yAwjQmjK4Hf5LVLjq0TwODnQIFAxJDW7q3M7SQ552rFJ9W5uJXqd44SYCUGWnn
	GtGtSnvOIA/fSBpHiYqa1UjXeETv0Xp8daLHr9MNABs815JBwFVg4AztJtvthbFu4h1sZMIOVaJ
	eykkBKl90nh5ISXxZ/6L64N2teRVckZR39/Pl301jb9BfgjftJYeRApsJs3nvxho0G3Sk09Y0RT
	ctMqzSd1DusrPq1xWBN/L6870sjiNy8NK9/Cgjhhs0JlAjs6iqrETf5+3OCOXu52FKDvRsR7A/x
	g+smUI9FTzMZEF5dMs3Ubw95Ok5PS9TQZC6jUBvw3lynWEbJjGjIZ19xyMIQ1LNj1AoyqH8=
X-Received: by 2002:a05:7022:b043:20b0:19c:dd9b:d09e with SMTP id a92af1059eb24-1ac5cdf9b17mr14479268c88.23.1793592266054;
        Sun, 01 Nov 2026 20:04:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm29283682c88.5.2026.11.01.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:04:25 -0800 (PST)
Date: Sun, 1 Nov 2026 20:04:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
Message-ID: <augLnMBF7Mbw9_sL@google.com>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
 <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
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
In-Reply-To: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>

Hi Ryan,

On Sun, Nov 01, 2026 at 09:24:58PM -0600, Ryan Brue wrote:
> Hi Dmitry,
> 
> Gentle ping on this one. It has an ack from Rob and reviews from Mattijr and
> AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) that I'm
> posting for 7.5 uses it for the volume keys. The patch should apply to
> input/next with a three-way merge. I can resend it rebased if that's easier.

Applied, sorry for the delay.

-- 
Dmitry
