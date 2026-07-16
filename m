Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51A347BC4;
	Thu, 16 Jul 2026 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235104; cv=none; b=KjryDVmPflJj5g4RtvuQqmvZhNLhsEkZrSXuriZ1FLmR61Tenauc48dWZEl8egD647ApAEeJgPRBtR+B8ctxc1wID6TmWNOQVWcxvT+F2xxlXexLmYxJO1vCysXT0rsxFTD4Xbgea91H84lwc6G+XMXCMrmmzzBqR0BVU+PPKac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235104; c=relaxed/simple;
	bh=QAZvdH1An+dJCz1lf+6FQVjDZd8u0vpeEfqC+NA3s+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myPac3n/VKnaoFcZRRBazhqV4T4Hqp5Q2FnQTRy1nE0R2lxIwrKlW+EzczJTRx+OTVDOdE9oV1szubdynhU+oe/1sSlxOiWulcSQljwVdFsfsbcDL3ZWrWWTXpM+uBBH++Q6gLRshMfhzpuzLbgoZaHYIPqwXkfX1AdqU3kYYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqs9Gz67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqs9Gz67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEBA1F000E9;
	Thu, 16 Jul 2026 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235102;
	bh=tKTmjq3H4VMXyq2Ze+g4Juc18m6aYpGE5eXI0bSO8i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oqs9Gz67/s7htGodt5u8Z9lEFvvMAi5ZX7VgIyoO1Vu3OJ+v6yqTrAfxWc+k4jC9m
	 r9IX/drzboIlWrWcUplukDRwshRYwUfRoUEfHWdDtVTQEASdTiooZ3Gs4q3RIkdXs5
	 eK1F81/EPQSHxWZbf5enSPflg5QBFJDco74AKDobNAqR11B1tU8l+xYTGN8jpJiTGM
	 x+lZAWmzn5r3tp45WXQF2o66SOUICJ5duvDEn8dlXSvy+VYpPAVvAIowE67w0a+3Mq
	 RSYSOjeZYckWNKRPA1EU3g3Ok8Z0XMdOphnDfnZYIJ7RXTodH/8Rm++ay88aE2LnWU
	 Sld+GzpswbuHw==
Date: Thu, 16 Jul 2026 15:51:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Varun Wadekar <vwadekar@nvidia.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Salman Nabi <salman.nabi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com,
	Vedashree Vidwans <vvidwans@nvidia.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <178423510160.1271124.8998579223606247136.robh@kernel.org>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706134455.132091-2-andre.przywara@arm.com>


On Mon, 06 Jul 2026 15:44:41 +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

