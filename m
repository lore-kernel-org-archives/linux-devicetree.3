Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697174;
	b=pOSGky69CS67lyxVHLTBzyiMbbuh4dbobAd9zllUKH1FWdwenGkm1ZI01d2JWkHsCOsi
	 ACjpT/GqN3DzN8S1S60azGXp1BjtvWpWOtvfXFDdLOYCl8ZDghiRc/lmEJqD1u6ymvvXX
	 ejDf+lydjFOaCCyLsF12cc+dyPT0uTsgmZivumQ6nQ4oln6uyI/gBe9q7uBs5pToXPoKl
	 L9uGwxYqqWiOHgfkrF0w5mUe5bIIsAzyRorN1gk1CrP/gOxO1z4eEFLAylJGlEmfPCKL8
	 tTL80HHEWOyr5fbgW3qXOcMeMj/4tskVpdmVno66KBNKXC/q4ODauOHLE6ZuVxWkZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697174;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bwIiMJQ2t5zyKzPUlNJW85EPjdSNL2+dojUyrtUSlA4=;
	b=21xjbnV29MCC+ohJHHOlV8sPqo3xQS3EQtIZPGQ1oyLIthFUHP6BN/I9geelXlKXkS9K
	 hguWDvz9JnQuKZSQR67M9ORs4tHRRHlgNCSkGjVFbTIEhuRqGQhOoOEqKad71nNuvEgRL
	 ZUbiboUiPLSkgg/AcdbJZUdWD4fOs2EYjygeincrA4BmBWghH4A4P8Nkk4Nja6ULdJExE
	 TS4PSbyRf3hGItJzpnJK914mbe3UOEMk+4ZIsxP0aRXRS6ZRDL70Eqo1lw+5coZUHFFBI
	 w2pEOR2TVaGjsxva4/6v5SnAXRMva8uQTAqNtcS4K6obdBqS9V5/xet9yqDv7nisP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=lPGe2G3+;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC361606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC361606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=lPGe2G3+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=bwIiMJQ2t5zyKzPUlNJW85EPjdSNL2+dojUyrtUSlA4=; t=1795697173; x=1796906773; 
	b=lPGe2G3+eBhG97Kv5rIPZPJ2TbCwGdqPq0fDmkZKKA0ZwVSZv7TLJ9Xjp9mtV14G/9SebzG/9GC
	c8bSd+NWR0v6WaHr+T2GuAhvuHzvEL10iy0M4hrPWXQVQBTcrBNw1uv3K3g5mIcaRlz2/NVNv1taq
	bFBXYgyJnxHSH/mlkcRObmZhNLIc0Yy7/dybPTQHDVg0QDfRTpQNcqnwg6ezhBTuf/Bwpck4j4oTQ
	3D71RmGHY9sEz6WteynH9Z0ag/coOY7oSBC4HBBAMZnAkPk3eD3L08nHskiM6RZLvE79y+mwJcEbk
	kJnSXsSRayxKYUZxamOPlYU1JnWRbkRHcMog==;
Date: Thu, 26 Nov 2026 13:46:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
Message-ID: <20261126134607.0cd4da28@kemnade.info>
In-Reply-To: <sashiko-outbox-235350@kernel.org>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
	<20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
	<sashiko-outbox-235350@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 11:13:50 +0000
sashiko-bot@kernel.org wrote:


> > +bool imx6sll_check_pll_are_used(void)
> > +{
> > +	/* check for any clock active which provides more than register access */
> > +
> > +				/* uart2 | dcp */
> > +	return readl_relaxed(ccm_base + CCGR0) & (BIT(29) | BIT(11)) ||
> > +				/* uart | gpt_serial | epit | ecspi */
> > +		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
> > +						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
> > +				/* pxp | lcd | i2c */
> > +		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
> > +						   BIT(7) | BIT(3)) ||
> > +				/* lcdif | epdc | pxp */
> > +		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||  
> 
> [Severity: Low]
> This isn't a bug, but in drivers/clk/imx/clk-imx6sll.c, BIT(3) of CCGR2
> (0x70) gates csi (omitted from the CCGR2 comment) and BIT(3) of CCGR3
> (0x74) gates uart5_ipg / uart5_serial rather than pxp.
> 

According to page 536 of i.MX 6SLL Applications Processor Reference Manual, Rev. 0,
it is a second pxp clock. Is there any autoritative source here?
I have tested pxp a bit, had no problems with just one clock but did
not really test all functions. I do not have access to uart5 to test anything.

For the scope of this patch it does not matter, both belong into this list.

Regards,
Andreas
