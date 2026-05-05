Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1907548B360;
	Tue,  5 May 2026 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997348; cv=none; b=mlrf23RAQduuZfePdfc5/hTldhyq/PIvPKbN+8kdL1iA3Z2vQnv6WWOoKtVkEc1rYJtzKF6hWw5Gv4KkNeiSF4rHPyy0JrJiQOhFgJZSu+HEEVb5hjK6ixtc0iO1ffonA/5ua0li8Qhy9L/ubL1iUUV5iC0uOo1HOOB7eZ9DLTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997348; c=relaxed/simple;
	bh=NVOb4O9FNKVS7kwF8cMaWuyEURjQjrY/0sxa8OgxxVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QkC61DeI3c4WegwwjxO7doEicS0LocwA7YwydlogX3AmSdRJshfRK1134i5zpQL8ve++i4BLtBF/VMggREQbJYBFcVP3Jd8fRYPIVPkVm8Y2NFAnPLvLzHCOan+YCXA6I11c6cpo8Q49LhDyTyoHy9DEKGjF2SSvYN8If3Nq5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n57oGSOy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n57oGSOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30871C2BCC7;
	Tue,  5 May 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997347;
	bh=NVOb4O9FNKVS7kwF8cMaWuyEURjQjrY/0sxa8OgxxVg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=n57oGSOyWD/yPYiJcFetcXRUi07x1gy0Wuix5jW8Hyu6buxd+SteBUp/O7eu7JSgy
	 VWdNQ+6xarGP3rALg9anM2oFByXn/eXaytNUJBJMfwDbm6VqnFsaK+WiNCbwyfczdv
	 J7yJrEwdI3iY6wKHWHdiNP5aTiniRhN/4cy5bPJLI5H0Q1Ff+NI7xRUhZoYoczkW7W
	 cUTG/qv5INm4HncSHMoNDuDn/Bq6i2HuqRcmeZWG6wF8gESMH/x0FCyvAIYYoYauVT
	 C3UVTW4y1Ea7TujQvgDdBoO42IULhqwboHBtHtQzblLC9NeHPsm0YYiwAqyrPLlIA/
	 I4aX5vIsX2u2Q==
Message-ID: <432ad0ea-83f3-489d-a97c-21a0473dd341@kernel.org>
Date: Tue, 5 May 2026 11:09:06 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: intel: set alias for i3c controllers
 for agilex5 variants and derivatives
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

On 5/5/26 00:15, Adrian Ng Ho Yin wrote:
> Agilex5 SoCFPGA variants and derivatives have 2 i3c controllers, a main
> master and a secondary master. Setting the alias for both i3c controllers
> to prevent bus id contention when both controllers are enabled which
> results in driver probe failures.
> 
> ---
> changelog
> v1->v2
> * Simplify commit titles
> 
> v2->v3
> * Update commit titles for clarity
> ---
> 
> Adrian Ng Ho Yin (2):
>    arm64: dts: socfpga: agilex5: set alias for i3c controllers
>    arm64: dts: socfpga: agilex3: set alias for i3c controller
> 

I've applied both patches.

Nit: I'm getting this checkpatch warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Adrian Ng 
Ho Yin <adrianhoyin.ng@altera.com>' != 'Signed-off-by: Adrian Ng Ho Yin 
<adrian.ho.yin.ng@altera.com>'

Please try to fix this up for future submissions.

Thanks,
Dinh
