Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC121EB9E3;
	Tue,  5 May 2026 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952370; cv=none; b=s3YUlBgm4XP4foDqb+JoO79F2amOpVXZIeLdQoVJqOy0tXlKm6WR1bI9dNvWDNthNOzPbFWSt+VBWyVgo+m2RFEQTdNZAebgjut4tVq42qbo4OcGo6lqU0z6B/KfGiTzhqcRWn8ekMGEh7mqjwSOYECi6BrYLUUBY4gzqY7nDxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952370; c=relaxed/simple;
	bh=DeBA/YI0EE0Tzo9UI9H+AdWF2PvNbqJUeh7dsqfuOy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyqguSFUU4kD2TEt39NAqFrG4PlRiA0GpQQx5Xr4OQShedGCC2a1nTanMaM0+bCdX7lCYb/FIOttpGNJpbOKT8DKMSbUtUnDO3f2dZXSdk756/OFFuLvk3WIVSdDYcW4iE5WKAjkWDOD5VBt7fK/SY/FkiQUUma8K1dvaix7xLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUzlY4ew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUzlY4ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15829C2BCB4;
	Tue,  5 May 2026 03:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777952369;
	bh=DeBA/YI0EE0Tzo9UI9H+AdWF2PvNbqJUeh7dsqfuOy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sUzlY4ewVFJJ60ih+4VIMEO+GN7MU7pB419h5MSqAtrGLpluSLUXjT7hmgy3X2Oao
	 myrVIxlbfNITGVeV3njsh+RVavjbS/xKds8x70APSonT+3Lfa5iurrA2dEkBsb5yu+
	 EJb3XUvn7cBPG0lMR/K78VzHHBS53cge7wc+O0ov6owD6n6UCoK4updohMYvu0Tpdn
	 6bh1vnQFTNjr7ME1dVv2zoHE9bOfKPdIsYtmn+5c9Itinmp5syuM7oCPtEt7Dkxuwu
	 Sctivg8dzrhRWo+gPgzNtOr9w3tdJN5kJo/xxVM8HCvDaemfiGqNXDn2aFL9CwBKuZ
	 09n9lIQ18ipxA==
Message-ID: <8822fe26-aacc-4167-b53c-9dabd23420d6@kernel.org>
Date: Mon, 4 May 2026 22:39:27 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: intel: set alias for i3c controllers
 for agilex5 variants
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
References: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
 <3f6a9abfac3ed7bdc37e891f6740e5bb6db47c11.1777951738.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <3f6a9abfac3ed7bdc37e891f6740e5bb6db47c11.1777951738.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry if I was unclear, the commit header should be:

arm64: dts: socfpga: agilex5: set alias for i3c controllers

For future reference, please run a 'git log' on the files you're 
changing as an example.

On 5/4/26 22:30, Adrian Ng Ho Yin wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Agilex5 SoCFPGA variants and derivities have 2 i3c controllers, a main
> master and a secondary master. Setting the alias for both i3c controllers
> to prevent bus id contention when both controllers are enabled which
> results in driver probe failures.
> 

Dinh
