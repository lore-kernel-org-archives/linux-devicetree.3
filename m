Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765466;
	b=tpYocY+8B7Av3GMWwFtePfknxnyWe+BywGPrV4vwJehilesiSXQiELRWF6CtRLvZchBf
	 HO8r9CZ+UL1iLUpflhJd+66gN5lStPj0yEPjVa8UsL/Ak0FtzTMT/CCE6fI/9b9pFrwf8
	 oCGOfkaSF2dDDU8f/rLgqEtdu6OyG8qvyc6tX62DZxoFCH8Ur6gkTWI/xF6Y7G0ZMoetX
	 JaKTXf6n5CPI7EjYry659Lt21NDsdT0z10AP7nLHB9khK1ExS2aziPvC8596kmQoCITDt
	 CP8/qtFykD6uWVIOI+uGJleY4hbwyDHQZF6RsABZsUXSzu9ougKnsqwl05kOtL2TX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765466;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:From:User-Agent:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=;
	b=I5bb9qVT3z6bK1P7ic64CJHCRv8Q69fcjRPNCtQsGAAmfnpIz6kyJSiJUniyHObLkKLu
	 nCwGe4LVBw08FAIw77/DtJABoKg5CYbMkYhgr+O2j9SxL5nBgkuCqm9yeBdOZCOGS3Vyn
	 L8SvqlJfU5Q3ze21oThJHi0NWYOjW9CH5oLsDbbhb+XYySRsnyYB0DAese96Hci7VsiwX
	 Yc/KiyD3sXLMakzi10Wn+5eDHrpsTxl6nMNrOc6tE+qwhlHcCNZWSxsi1Heqq5EPUfbyN
	 +MeTfmQZsZqBVG1xS5egzBSsFez7JFgj8b+ygzcDTtDq6Wb8SMLlVC/eE+LN69RXGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=hisilicon.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aQBJ8MHJ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E6606A31C;
	Fri, 27 Nov 2026 07:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aQBJ8MHJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=exyqA4xjQHJ8t9SqDedkQRc8moWZMY9lB2uphlyg/ec=;
	b=aQBJ8MHJprkEys9KsARq71TnWg1b+SkJLCo+KannvjVX0ckEamBuo0cnCDhf8rakTUP93K+x7
	1M3LaVSMu4s4dLJiVq0OS1WwxiGa9N8mSv+EE5tXETySWF6ZB06WaiWjJ42vzaEje+p+N8VXOPk
	dgz5qNat3d6MPTFfSSQ21c0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jbQPq32HQzcb49;
	Fri, 27 Nov 2026 15:43:11 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 6766740575;
	Fri, 27 Nov 2026 15:44:20 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 27 Nov 2026 15:44:19 +0800
Message-ID: <6B0934D3.3020302@hisilicon.com>
Date: Fri, 27 Nov 2026 15:44:19 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong.xu@linux.dev>
CC: <mfd@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH 00/12] arm64: dts: hisilicon: DT warning fixes
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/11/12 3:40, Rob Herring (Arm) wrote:
> Another batch of DT schema warning fixes for HiSilicon platforms. This 
> fixes most of the remaining warnings on HiSilicon platforms.
> 
> It's best if the whole series is taken together.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks!
Series applied except the patch 02.
Maybe I will send the PR in the next cycle since the patch 03 depends on patch 02.

Best Regards,
Wei
