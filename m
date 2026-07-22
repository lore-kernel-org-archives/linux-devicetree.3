Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA11D31985D;
	Wed, 22 Jul 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725725; cv=none; b=HugcG0gKs84uka6WD6Pf3Lp+G/srud02qM4IJJxVM4qD7YxnSduNajCQ/DGNcP9jkrL0N0bHbtS/DxFAZ1CVl5SjsAaqo/3rz+DjR7kvCeSTyO5JvNjwVxjVyaACj3MAdX3Co0Ar3VQFrND+eMpH595I2b1tWee76QCQJQ1qeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725725; c=relaxed/simple;
	bh=qn7nbO4sPz+iirSRgxHxS1eGOwrbuiauDLUUT+2VSfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+h8VYUs/06iy00CNap/VUDJh3599ZelHQqIsEGB1+5h7lY4ZqxFOUANDdcvIwUOWkG1aQQkTLGbOjt9CT0nSaClmRBigjOtioK9+e5HupgkvV0EHwbWeR93tMWlYclPsKMncuIys1fAH9Oo5KeSzJs1ii06lwzQ2EaR6aWSA8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H7xCUMUY; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H7xCUMUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=WaPDbwxCsdcx+B/dCejKtJh2wWTua00Ci6Hpi0ul8C8=;
	b=H7xCUMUYc/LooIzd+CSV4M98TEu1QIbG+rVULphn8ypPW3Ek4oRmPTSrR0BTeb
	oJ+jvvyj4Tvlx9myhIVE9GLwTQWXpVxr5nJrn1A21G2Dn6DGGBvLvBJ2ndJevJxe
	bOKiqmNQ83H0B5Z0k83upy/IwqMDvMgOipJcBqsqzaTH0=
Received: from [192.168.1.104] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCndQKNwGBqqIFOHw--.52029S2;
	Wed, 22 Jul 2026 21:07:26 +0800 (CST)
Message-ID: <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
Date: Wed, 22 Jul 2026 21:07:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
To: Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260627052708.172918-1-haiyuewa@163.com>
 <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgCndQKNwGBqqIFOHw--.52029S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjVbkUUUUU
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzQ4GcWpgwI7TFAAA33



On 7/22/2026 8:55 PM, Andrew Jeffery wrote:
> On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
>> As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
>> string") does, change the AST2600 DTS file to use kcs ast2600 compatible
>> string.
> 
> Is there some other motivation? It's been a while, why now?
> 

Just happened to see 'ast2500' when adding other nodes in DTS. Nothing 
special.

BR,
Haiyue

> Andrew

