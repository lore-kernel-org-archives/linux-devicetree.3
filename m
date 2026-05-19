Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AD29B200;
	Tue, 19 May 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178793; cv=none; b=f9KH1qg3Lhzz6N2tmBCzyKqy+ntQej6kAqkavC8XOr1739/4Ct0yZWAConm+PdKoBq5zqM8RlYToBVawLXMYct83+2tN0FT6juP1phbhcWqPux3Sze+Qw5BzSv8QYV/ZkBgN8NbB2tbz2uEjtNRSPN4tzb7a1j7Nq527sMtveHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178793; c=relaxed/simple;
	bh=JfhAILNls4w2wXgWnGBbGRweRyrl7ebw7UAo4Oa5uio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKSxBGu3EYs8HBVUQQy528U684DOi9rtOstWcbFJRFsAxbSSdeN8nIXpsYhJh99mJN27TwHvsyw29nUsjgt9Cy3dR3ak6WZjxWkEmkXxTFy8kJKqyseMPuqWLod6Zq061nuJnb0zMNdQnEKvfEvBUAQBDD1WjTco7scpNy5FMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqPDQRMN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqPDQRMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779178792; x=1810714792;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JfhAILNls4w2wXgWnGBbGRweRyrl7ebw7UAo4Oa5uio=;
  b=SqPDQRMN3+BFCbR7HG5hjY/L0J7UuuYnM1QAo1Eo84kViYHCl6bKxBdR
   eDTs1WjALRED3le28PYnW7pHHWeH7LzrT7hvPtwUdJdYI+ul7M52TyRyC
   hg7MLUqXjwEVP5/OViXJDy3Xo9EsJntfFR6HNKQe+x9mDOAS/ahsSTaku
   lhvHwzeFd0kuhJWY/9An0oIwaAbPnGq15NJLHwEbdZ3WZQltXoKYOwFaa
   jYk91bPHYlXkGWXmcGZtk09VHYymRQHOC8bmFftCJUJHBSaqF4psmhMf6
   2sNa6a+tZaoLkqqN5Sn4yQBRNNe4mAzpJz88rj4ZudrCPMlX+XFCOStj1
   Q==;
X-CSE-ConnectionGUID: +EPg26BgSJ2ONezXYt4uXQ==
X-CSE-MsgGUID: Z52qzwpPSWihbaaW3P3HJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79193763"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79193763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:51 -0700
X-CSE-ConnectionGUID: dszkr6AhSwGwtndes+ihNQ==
X-CSE-MsgGUID: FMbhInoVSOSua/h+sMvgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238873185"
Received: from unknown (HELO [10.102.88.45]) ([10.102.88.45])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:48 -0700
Message-ID: <62d6af80-62f1-4b74-b4e7-3311d319f56b@linux.intel.com>
Date: Tue, 19 May 2026 10:19:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
 <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/2026 7:02 AM, Andrew Jeffery wrote:
> 
> Sorry for the delay.
> 
> Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
> the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.
> 
> Cheers,
> 
> Andrew

Hi Andrew,

Great news! Thank you.

Dawid
