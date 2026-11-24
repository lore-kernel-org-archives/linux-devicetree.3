Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510374;
	b=T6D01BelQZXFMLrPAbAjzWPGT0Ud1SmciNqXQQL5vB9Iybdj5QAU/s2Sc1Yl9zYvdTjG
	 ZTB9aanADeSWgEcHHQ5FoBQyj/l3Q5FktGZ5eMuDwBw+kbGJbOnqBeYBkbrEY/rg5m64I
	 7RYosDQ5z+du+hzBBENR/Ydd9IZXdbH9qa+7TVIBVAei2xj/4g2u835ED8qxULtmdFotn
	 lV/0cO58MmAQokR+9ePGK2w6HZyAJ5iZ1Sbq0+8T34VsX9tbhfJyo6RExhOd+EWgJ0r6B
	 op7itub4WBkOlo3A1XWqR8ECI/n8b7NG9RKK3PtTqxXjxLw30fwfIEQJeA85/senfcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510374;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mmas4sEPc/sW2LpnQYSfmW/nirur+GSJXqezeiEpjXI=;
	b=p5j9rWg7Jo13gy1V6VypOERcJgaR7YIpwAoWML+GQyKPCMZbESba9AycMngdB2gnCtly
	 pPmPRGxlkKymbrewlGCuA2Qb6VgE1Odek8P+5SFBI7A6fHkHQEC+ZPobPXdYdBvCkOiby
	 darPTfpOzXmcwpACepuXKIxkHQLh9R/sbD7fElH87Zl++uQBE/ybqL0pf2BztE5pro4qX
	 SpaGso5I3erqyJrsRsaq2INewwqKW8IYYjw2qNT2GpiDFmriYOLO9Ibd/m30UHeTZjhcq
	 zDHO8i9yoK+37x/ffRzDjfHRieCczKeYVIdjhEym100fsnpEQCqcf9zOGPgjh1JfrQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YJd/wm5z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC48606A685;
	Tue, 24 Nov 2026 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJd/wm5z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE251F000D4;
	Tue, 24 Nov 2026 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510374;
	bh=Mmas4sEPc/sW2LpnQYSfmW/nirur+GSJXqezeiEpjXI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=YJd/wm5zHvvOfWudqZvslMBIbP4O7UtzFiXYdV7ce8fnJaBK7kA+rpGG5cObNcQG1
	 cmHdKoWGhavmoELpXvMXtR18OSblsxB57mNFHbEKFEVtelKYU0NZ7sH0nCvZxptLND
	 fjBrO9M6W/ltLkqIDKn//Munm1YqZNrUtfTKSfdrjJOkYuA6SXWDsKs2IBmOr654gf
	 yCgCghtVIwpU8C1y09m2pmJ/GZjUs82d1HR0UKMYTKfjSGDpBCL8yzjHnH+0ihODcX
	 UNOZco58pGK/LVyBS8+h+1Tyyyrec9I4Nfn1PPDs6b/WMXKHYYH+xm8ZXKcQa26z6k
	 2yGR6g1Q17GIQ==
Message-ID: <42fdf94b-9be4-4699-b8c9-c18fdd1d1fc1@kernel.org>
Date: Tue, 24 Nov 2026 10:52:29 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8350-hdk: Add display card overlay
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261101213616.2433513-1-vz@kernel.org>
In-Reply-To: <20261101213616.2433513-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 23:36, Vladimir Zapolskiy wrote:
> Add an overlay for the SM8350-HDK display card kit with the 1080x2340
> Visionox R66451 AMOLED DSI panel and the FocalTech FT3518 touchscreen.
> 
> The panel is connected to DSI0, which is alternatively routed to the
> LT9611UXC HDMI bridge, so disable the bridge and its supplies to enable
> the panel.
> 
> The panel OLED_VDDIO supply is PM8350C L12C at 1.8V, and the OLED_VCI
> supply is PM8350C L13C at 3.0V, the ELVDD and ELVSS supplies come from
> the PM8350B AMOLED regulators, which are controlled by the panel over
> SWIRE and need no software control.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

It's a gentle reminder to review this trivial change.

-- 
Best wishes,
Vladimir
