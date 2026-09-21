Received: from mail-ed2-f18.google.com (mail-ed2-f18.google.com [74.125.228.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADD31B101
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961485; cv=pass; b=dJd0E1S32L2a44M3SSWiIIixuci/oyZDzNZKyOo8xEEEE20v02GFSAXzK4oO4pEPEF5TdOKRZXdmGJML0AGhFvfy8qMFZkbWo4oPpe4jnrPjTUFJE9nA4DX/IeyJR7ZqCrOVfCJptahxmBItDobOBOXEo5BVKZaKfmvSiKOf2tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961485; c=relaxed/simple;
	bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bquGRLZNOUBLYcH3Sddk9O1yMcUo+q3tN56Hld4bFP+Bz6jxbyC65R61QF6/xxU3i56kzI56lxYilv/TTnwzr4avVRbzL4E2rDA8/1Fr/gf2rv6SN1yIUh5+ThKBTFshCNQcTzZBqBo0lRLd2I9GFUsaW3SYtiswjxlKUAGWziA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liXP9qyf; arc=pass smtp.client-ip=74.125.228.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liXP9qyf"
Received: by mail-ed2-f18.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so3166166a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789961482; cv=none;
        d=google.com; s=arc-20260327;
        b=b8RWJtxQp77UQCqazg/tJWJf0s+f6J3aaNMABUrdzfC/hCqtTxG9MRXXzejvTYr9ey
         DuAGWSRb7nguChC0gcQpdw7wkpPssF0fXNUMzwBNqAU5iXojUTUMWaHwse/R0+P2Z8Dd
         rukcHLmRPpkrwuwveTcm7gn8t6+JbGhIcFcydosn+o/9dVye3URfJnr2L0lKkE6mO8+J
         rRTBJKIgl1hGR4seMAGJMlMA6wgyrVguOpDtNrbCi6A993l0mKhIrxwLR/Q3yD3yiR/a
         pe4OmH19Si+t6IiURhfkavVJeBvkU31U+u0Y00N23kEpf58Y9k9LPp8d4+qI4JtufdQW
         3ZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        fh=gmKxl5UnZ6/jFyDM08Fm60GSgSpSkdFiA3XBCUATuCo=;
        b=lVG4pJsHXh0qGuvL6j2PFyNTD7MjuP6uo9ZnNFsq0mRP4if+2ElrFZCAUReeGO2/hr
         s5o9KVAEwKjE7pH03Ra/a6hUxciNRFToQ5q0G2LW1Vth0dykYkNj4/T9Y9SPfsEByrRJ
         AbqQaDBL+sOUmMVMlz7kZWbXx78QpVJND0v8PAlN11Wbn7Nahm4IkTsbBqUl3XOn9HJS
         +TFoIBrGfb1+tOGDr+06luqtpcZs1GT6n5gOLQwraf5DC3cfLvW6oZ36qOPJwI6O+1Fs
         BxhGpJ0tf9a2t5gk9iCQC8vi7RaBJBCug8Vsz3C5Zx0mhxqzT4L6gaEEvblw8eaUqjR2
         5Oug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789961482; x=1790566282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=liXP9qyfSnnSa3IRVhVi7pFCMNtVFLBrgnKj6XVTbqcAlJihMkFxmbSrobSMQ1vDqf
         35b2ZzjbfGmdXyi3aulCp6ou7+lnG9JtQfGgNKn29Laj9U+kV+ghhyzM2Rad2+SsXGc2
         1gUmvPXb7Up5Mdo+lCNjdx5KuCEh4cYIPXlA9DSnzFO9LwbcJnR7ZWOCVnmoDxOKTxh9
         NyjVV0dHSMkZ0btnShfjyO7bDetBtLSp5vvYnJoU3VkBaacg7ecibNjpmqQJCcowb4f3
         Ibn/XFbWwr7u6w02ZKcHm603UWwbjCFwtrRpMvOZjNM3DAQ0viJQUrhr+esbh2B+QuwB
         w7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961482; x=1790566282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=Wj5I43nqQL81YUgkdTlE+L8PHYIGsRuBGgF0dRrUXepzveLTI+ZNZkxv5VVxMzDVBQ
         zQ4kspaG2e19GzxrEYEgSZw5HQQlJKiqsqP5ehBPcETo4fTuELmAoX/G6XMGb+2X9lwI
         IrZWsihXXtRbOXlSDslbKiP2zLzP70Wd+Zk4nVwiTvw7l4e7Jecp5B8kT9VjyHGyOuWQ
         bCERwhnBPQw4BiVivD6ZRRrXz/jMIJjNHGiYqVHFC3tovtdtCihzWuswv8BlEuyqUjlZ
         kuLRHDTM/mM4HNoLhB2w5heH5frajZqT0k7fxLQ+6bss02C8qaXpGHgZ/0lPFkxtL7Lm
         INUA==
X-Forwarded-Encrypted: i=1; AKwUvBzIgTNpUCzTGGmQN8yXSd36l9VmhqC/v5KMn2wuRbDv580BVmSkPv8lgbCnJc5VyVhVYp06Vcf+PXi+@vger.kernel.org
X-Gm-Message-State: AFuF++k1FbIvcXR4hfjB9h6XV0vEgTMP+vxcxflgKDKhhtmEEJFQ98w8
	TC3PdWNP4ft/z2Lv478g8TgsH5b1by1pH4qngUNq4us9yozFX4Rp9ExsJSgSf7bsbMEvSkeU0Y3
	3T+8RGsadmwXrQ/xYGE9KuuyOSzQE6sm4Iqa5q9fn+w==
X-Gm-Gg: AYBFou1p0roPwLggsgHtgxTZi5MCpOCI0zWXsOotqZ0DS3OMS/Re4r9BKDmAGULeOEE
	3YutRnDBOx3p3VdXQCK+udSVSHGtMK3f1OJXYUK0vUrRdjB5fYbAKheSlFvvc4wMtMjqlb8hYr3
	B8WI9Ac1xKkXgZf7XmlaDZX+Qdt9wy7LndD5QjhGxZ8AT8DGieRdV65l69rwGIXdQJKFBaMgj7D
	kGv/5q2ZE5Q57fTklR6xtAF9FFHQt19Y+dq7qA21izbns68ynlDHeIRo3waVDTihRCbwFbyoTYM
	3JkA9/UcneBRwdHL8Ibsa1V2st4ErCBJZXMJSbwQb2V+EcB806EHTNH1ysjugutuATmVFGJ6VDR
	spLVyjqqF/CBA5w==
X-Received: by 2002:a05:6402:4394:b0:6a9:ab7f:c8f with SMTP id
 4fb4d7f45d1cf-6aa54611e57mr5885453a12.17.1789961481999; Sun, 20 Sep 2026
 20:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater>
In-Reply-To: <aq453yukMHiNb1jp@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sun, 20 Sep 2026 21:31:11 -0600
X-Gm-Features: AcwNN1W3qE53RFtHuPGOztjJSdwljZIvy9Wk3z8AN3NJ17iDKQARaTMy5b-3hH0
Message-ID: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
>
> Hi Mathieu,
>
> On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> >
> > I have started reviewing this set but given the size and implications, it will
> > take me a few days to get through.
>
> I'm going through the review done by sashiko - would you prefer me
> sending a v2 with the trivial errors already ironed out before doing
> a complete review?
>

We can wait if the errors are trivial.

> >
> > Thanks,
> > Mathieu
> >
>
> Thank you!
>
> Regards,
> Francesco
>
