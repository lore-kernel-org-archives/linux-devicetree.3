Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F63A5E97;
	Mon,  4 May 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901380; cv=none; b=XqKdmznCmWGw/oxbMQM8NnHN5LutoslvZ5IJL3m15iPgSGSzZ1sgmJolPwSZz+t2mlqCmO71yqIusoj9WMWv1F0f0RzUe1vNgo6Yt8o4S8AW3n488CYG1ovAuxA/SEQdUOchxXOENewTf3GgPC0vo89sC4THJKOuj/J91g+CvSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901380; c=relaxed/simple;
	bh=sxtTmyFIBi1JaLB0iktLyt93l8yHKFyan4aUZ+XoQlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTqmsg75iMpVM1BnGa+DtcQY8GSK5JDs9L11j9mfnWg5o5MzVAZi+S2itJHdN7gT/lXuh3bgNfSHYAKCs0LHbnWnzD/JmXM0rG3Xc+ml9ROGOuGUdnmC1BgGRZzoM3yOAem2gyI4k8R+dmbUrk5ayehhHlEjvMnKOvi2AxKyLrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lomBwYWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lomBwYWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F55C2BCB8;
	Mon,  4 May 2026 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901379;
	bh=sxtTmyFIBi1JaLB0iktLyt93l8yHKFyan4aUZ+XoQlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lomBwYWIHSs4cYThB2BchS8YCqCzcnyzvrozbDze5P/kn85jhAHMc+yT6+2hxpzqB
	 LRgmpX7eLGwl1Pa5S397vwQBnRJxwA/0V5NeYBEK2XVu3wIy4sEHTgLiOb0eb8MD6f
	 MplsANXNI9iO4Y4CKtqifphOW8GAuwXat86k8udXhTwYgCDkKHpYStmt6U1ypU/Di3
	 t4KVjkWmDXNxsfLU8rFOR2p2xJEmK+amYJe8ED36BbLVAsjvhDni4v9WHyxOFcriLv
	 0W2gfleUywOOX5RsTpZg5jkbWLxq/7DGO72wqJqDti6m6Z3tH/fpf4s6xdPwf1iZmu
	 RxSsQgMGZh3Ag==
Message-ID: <62bf765a-6feb-4df9-bdbe-92a4a7a330b8@kernel.org>
Date: Mon, 4 May 2026 08:29:32 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: agilex5: set alias for i3c controllers
 for agilex5 variants
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
References: <cover.1777878392.git.adrian.ho.yin.ng@altera.com>
 <81865f7542a599f72c74e2d9858534716e05c959.1777878392.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <81865f7542a599f72c74e2d9858534716e05c959.1777878392.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

Please simplify the commit header a bit, no need to use "agilex5" twice.


On 5/4/26 02:07, Adrian Ng Ho Yin wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Agilex5 SoCFPGA variants and derivities have 2 i3c controllers, a main

s/derivities/derivatives

Dinh
