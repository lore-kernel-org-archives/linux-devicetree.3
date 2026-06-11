Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E13D9693;
	Thu, 11 Jun 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176508; cv=none; b=SqTHhMOYt0fPTh2M8FeDGJLtgDkd8TLKfrF7O04ri8SEFR2q/b1MZby2JBH7m5B37QJN2qEcsx7tR+k5e5B2zRwoDZAESKWeFkEN761KSGoZsadW2g9ABLiKfuxSdv84mgaMH46xI2kOcwygX9ynmqzy1xXjCHgEt7LUZOUBooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176508; c=relaxed/simple;
	bh=QcDQmEWfXryFiEHsQDpU7pCWRki60Y0EBQFaXVw6nvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLKIHjcaD7LdcgHWjrO5nDOJOdds8UKVsjSHY+7Sv8IxdfW7y1ppb3Af5zzk3O9suJDhFJxG1PwHS9hT/YhA+KHG9dp38KGsrfAhmI4qDyst4ZAumCshr/CS+sFIkNwUaICnK/G+B1MD82WAyaA8yRQkdyPmPC+B5gUC23xljFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABgAUygN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABgAUygN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BB01F00893;
	Thu, 11 Jun 2026 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781176507;
	bh=eiOE8vVz5OGc1lHCEeMyCTtaRiC/BRktpZAb812CfB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABgAUygNo1qA032l/mHOs7ejxd526JKw+2A8A5mQSQGpsrMSIPV3Gr/Mi1tospcbA
	 qDll/0RhYf0fZY1qmyND5rjcHxuUd6Evmz/CjjBU3ALzJuYSrhSTCuDJLwhL+s+da9
	 PMjtAmceMkjfTGgqaF3x8gW+k1ZXOPwWDizCNv9c3JkDA6MeuEq8p47eXTwB+l+UfZ
	 f330JAvG8ftNODUqPJGaeHLZJvWVQs/onlqPZrfAOYD4v0BBL4pRcgrsSxxrQxiWnI
	 v4u8aXheYJwJiCZ6Ex6NsWwZKI4oFUu2DKJ1K30iWooPGTgupgRe0LIs5Y5785S1XU
	 aHLXSc8EPQXPQ==
Date: Thu, 11 Jun 2026 16:45:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
Message-ID: <aiqYtowP2DQt7Jw0@vaman>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>

On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
> refgen supply is needed to bringup the PHYs. Both single and dual lane
> shares the same HW init sequence. So reuse the tables.
> 
> Document the compatible along with refgen supply and add the phy driver
> support for it.

Please rebase this on phy-next tomorrow. It does not apply for me due to
changes applied ealier today

-- 
~Vinod
