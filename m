Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3A3815DB;
	Mon, 11 May 2026 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508879; cv=none; b=Xe6FB+2zzgtXyxSx36lW23Ae4oIuMOWdmfTudd6/AusdLA9snhZmW9UOcw75euqD8yMXa5mWrkB5ued5qFjBRdoSOG15QtkxoaiuhTw8L73wb49HvGw/WynExXkB5eFtgUTXVpnsiUKtTdOyO1Mbq/Amm/fHmXDtVdoJuRcZjFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508879; c=relaxed/simple;
	bh=/xqH7NH5OnIsXIFChpqYZdEouHpjFOVq5k8bHoem5oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciwOfsgflSsS95NinRRytHds/36IsJA58whb1eIyyA3B53RZd+CzEqhmQk9oVer/dE6dUf2/xb+4p/b33B5cQLVz1qtf5qV5edjl/dD827190Fc50dBSGZ5Of3SoRU0sXfvVUfOHY8EJ77e1paXxoE9R91jDe4VrU1iTxCd+jSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pq+lRQ6Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pq+lRQ6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778508878; x=1810044878;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/xqH7NH5OnIsXIFChpqYZdEouHpjFOVq5k8bHoem5oY=;
  b=Pq+lRQ6Y9twxsYBGGNxM/8Lp3YMHRBU6HI5iFLBUFDaWkTydLrEqS/ak
   S5I2vPa5gRL4ciszzBDMmY35wmSnKIiFS3utA0ZuweqfI9v7nxdg72CVj
   lSq0ltCVgwdSBSz13pnUs5L0ncd99YluGwtgIyKQ8Z8tM6ILLpVfKCgev
   RZJoJHRq4wPPxGtTaMjgm9Azo6V+TwirzWWWpTxMADSDfB5nV2oF6c/TS
   CMCye9rWWnF9M8Tb0iYL07/HGWw8nFik15Mv7HaVJVxGZdXiWKQ7XWlxk
   O8ti7QFWzSccqAdJWH6RwngbrCwhfmx3fNZ2U8DQs937Yj5y/sXGPDV1S
   w==;
X-CSE-ConnectionGUID: Xp/fQgx0Tg+KH6MOAdyamQ==
X-CSE-MsgGUID: YYMjq0R5S6SwMLq8l/tWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79577328"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79577328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:37 -0700
X-CSE-ConnectionGUID: IGMkto1nQuq+i2PCwp8hSg==
X-CSE-MsgGUID: joc20km3Sn+zISkQ0Tcj4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="232986212"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.250.159]) ([10.94.250.159])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:34 -0700
Message-ID: <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
Date: Mon, 11 May 2026 16:14:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cover.1777058942.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/2026 10:20 PM, Dawid Glazik wrote:
> This series reworks and resubmits AST2600 I3C DTS updates that were
> originally posted in 2024, but stalled without further upstream
> progress.[1] The series was rebased onto the current tree and merge
> conflicts were resolved.
> 
> The patches first move I2C controller nodes under the APB simple-bus
> for layout consistency, then document aspeed,ast2600-i3c-global in
> the syscon binding, and finally add AST2600 I3C controller nodes in
> aspeed-g6.dtsi.
> 
> Jeremy agreed in a separate email thread that I can continue this
> series under my authorship.
> 
> Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/
> 
> Dawid Glazik (3):
>    ARM: dts: aspeed-g6: move i2c controllers directly into apb node
>    dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
>    ARM: dts: aspeed-g6: Add nodes for i3c controllers
> 
>   .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 543 ++++++++++--------
>   2 files changed, 318 insertions(+), 227 deletions(-)
> 
> 
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f

Hi all,

Gentle ping for this series:
https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel.com/#t

I received Reviewed-by from Krzysztof Kozlowski (thank you).
Could I please get feedback/ack from maintainers on the remaining parts,
especially ASPEED DTS?

If preferred, I can respin/rebase the series.

Thanks,
Dawid Glazik
