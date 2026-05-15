Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7653EFD31;
	Fri, 15 May 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830761; cv=none; b=mxqeRJX1w+0zFlgnZjfAzzQWgFloNLX8MuIW2xtEA+Zzzg9rhGKxufc6IohpBINNkqkkQWXqQ+jHLTFjOjkCeZn1PLlQ2qJUSM9FL82CCREiN3w5BncSZxtEYumkCEKHKhneHiBMWazUe52lM1Tdd8ixe6g8qn7z6mTQBKbCr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830761; c=relaxed/simple;
	bh=UDmVSb75ZqYhh0+N6E1Z8UzE02p5VFsFz6kdVBeDO/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2H1XaMINh3gOTjOnuIHGspxg85nTe0PGGFDCibXQoRUv9pINoFZfqgAmkaHvNj7YY3Jz5hPSjmBxJB7iwuXTVuOArOVkqzVrYX+P2yqTLuP+J+eg27EvI3Lp6x4YZ0oOHQBZMQoCrhTG69sEzuwwG9AGS3gqyeUmcg88LSIFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFHi8b8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFHi8b8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A20C2BCB0;
	Fri, 15 May 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778830760;
	bh=UDmVSb75ZqYhh0+N6E1Z8UzE02p5VFsFz6kdVBeDO/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFHi8b8kQwBRVlnFXQn2SLcqyN0N70TdBy89xZc8mRXUqEJtD7WOXLUwZr8rFNS4N
	 nLdWKekx6mmupFTsBipTLg1LXg5Dtv7xfaNDOUItDl/aZqLUL4yZ8JAh7ioU/9v+o5
	 Rd7uDyFGUPpwCAdBEY6rXld+UqqAm/y4iPWm3fcuYKV37Hz1r6PADJozETbjgR4rEv
	 3PpTnUSVP5CIBSXP7x9KiXLHA+SAfpaWqWyC+FhkuRux3EbQDgwXsE2B6f8zWFCSzA
	 hCtxjzy2mW4hI4S0Jcz0toqrIZRSYBm/bGEKMYwlalbdCBIThvFtJLrcTUKJ7uGAs/
	 BD/OkMkwxjcpQ==
Date: Fri, 15 May 2026 09:39:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kartik Nair <contact.kartikn@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christian.gromm@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: add documentation for MediaLB DIM2
 controller
Message-ID: <20260515-radiant-practical-dalmatian-a896d4@quoll>
References: <20260510184419.98043-1-contact.kartikn@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260510184419.98043-1-contact.kartikn@gmail.com>

On Mon, May 11, 2026 at 12:14:19AM +0530, Kartik Nair wrote:
> Add device tree binding documentation for the MediaLB DIM2 hardware
> dependent module. This documents the compatible strings used in
> drivers/staging/most/dim2/dim2.c which were previously flagged as
> undocumented by checkpatch.

This is not a warning you are supposed to be working on.

It's third or fourth patch like that last month.

Best regards,
Krzysztof

