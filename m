Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5C392C52;
	Tue,  5 May 2026 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952418; cv=none; b=iAkradHdsHzU566nsCpT/itElYQQLs0xKZs4oggS3HA+gKqdVQFgSWQJVs/OI5eM7ad4mPwvLuvb+dGkLfvdOw/WgXJpEuk78Zkd8eRm1eEYR7QChCZfCPpTX6FcenPm9YegjeHOPPORFAH4NRAnp26jgf5wcipSfXJjlb8kYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952418; c=relaxed/simple;
	bh=csWnQpidmPrKGdDUUZaNm+ctkleqb00qfe9TAInxaSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+LPR+Dr5nLMN6MqW4f62fHdDdHZEad89pzqN/QAw0wqSeLpAeqzAGsc6mIl3GbGGqeXK90QbSEb4aZ0L6q5sP9ENR9Laj+M65FkPvugVkd0l4F/Y+o/VtlnJFAR/VjHyOvTkvFb+f9+qFwI05x5AZ9MPONKj21xuNz/xCHx/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaEt8NuM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaEt8NuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FC0C2BCB4;
	Tue,  5 May 2026 03:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777952417;
	bh=csWnQpidmPrKGdDUUZaNm+ctkleqb00qfe9TAInxaSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oaEt8NuMl9PUli8jKGjqqA0JQSsu9nbwxtni84SqU5gK4xNYBakxN12/ff8diI0+J
	 dbPVQEQ96SH8mqEmARkFLm3hG//bcBxadroK62uDAOvsFgBSWYV0lfV4s2EISJyrhJ
	 +N2avSs0NLnUN2mcLTG0K6NKU2CoNVzFm2o38LI+OMq/C5L8o34l8ef3vlcdFrmGzt
	 wmMg6hNzIsNMJtrZSbaF7Aps46lmjgltG+FG1Yt6icyx97U0MCouGgharlJNo+9tl2
	 9nV4S++LKrJARRDtSp1aUvjZffz4M5Jyt8MNXLi2SIsGXuWPwUkqbuDYjkPSaspaDh
	 yoRG/QWBkhC1g==
Message-ID: <f9dd23a7-8795-49ec-a653-61eabf42218e@kernel.org>
Date: Mon, 4 May 2026 22:40:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: intel: set alias for i3c controllers
 for agilex3
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
References: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
 <b83be9e6a3ea0c15c7032856cc6e67f3185ad613.1777951738.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <b83be9e6a3ea0c15c7032856cc6e67f3185ad613.1777951738.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please use this commit header:

arm64: dts: socfpga: agilex3: set alias for i3c controllers

On 5/4/26 22:30, Adrian Ng Ho Yin wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Agilex3 SoCFPGA have 2 i3c controllers, a main master and a secondary
> master. Setting the alias for both i3c controllers to prevent bus id
> contention when both controllers are enabled which results in driver
> probe failures.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> --

Dinh
