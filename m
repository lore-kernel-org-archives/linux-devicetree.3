Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FD4071D2
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318046; cv=none; b=b4rKKr5wP17+Cp/PPAqtX08tsOyBrYhd61PgM1/gndneWfB5EUjIKXI6GgW/5j+xqa/T/Q+enUZedZdBAZQIkYymcJor4XEX+qDbODjATLJRFZu4D+TnsQOtXjYJYdFNmMfPBSJWNMlSt6Pi3ItMlRJ4vogcqA8xxV19Vze9JF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318046; c=relaxed/simple;
	bh=3wrqckctt6zgH9bKd9dhTAE6d7ty9EDoCoNpUpTvjZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8s/aFsaCfecVs1i0U/U/lDTQ2xDUbv9jg6mwwFtUIItZGTY8KifUiOdO3grCccASwp813eXvWjXhQpiw7f8tb8brFvdJIqk3uAGsmo2vU3VIo6clA0bv2Bbxr2GSPcUnAoIKB27aKs8Nfg0I1NbxMlObassVHHHCpM87pjtJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=RSzCztt2; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="RSzCztt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785318000;
	bh=6JutlRpMF2GZhC2lvsYXiSLked//G4vutb8ZF7y6E8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RSzCztt2IWqTYIFfh9noNOZcXN7H64bMob7rzm6kp8FHcntymwdt42OSJ4n1V3lC6
	 /kwmGlUjw14qUbcUDrZ4AZ0IlYB0SDFXV3pKOjehX4fY3+bUQyrPt8VbCM+2XeSrFc
	 0Ra0v6oRDyvrZVj8zp1UCwEPvn9/fvlIQXzcWRTD6RVu5R88m/Q4LBv5mqNQPAMhfc
	 bFEs3KY5OnB+Z4S+JrWDz2MMXILb7iL9fJPitnsf6SzLowj/4jcE3IV6sz+UUjxwP+
	 qf6Ayf2ET+V7yFE4KzRFdbpRu1VGjMCKe1RpE6r7qQDBuMPCTHKYySH78YT017/hNf
	 8hUDx+FwhPnIg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 3D763B220F77;
	Wed, 29 Jul 2026 11:39:59 +0200 (CEST)
Message-ID: <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Date: Wed, 29 Jul 2026 02:39:50 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 Ilya Sorochan <k0tran@altlinux.org>
Cc: Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/28/26 11:02, Conor Dooley wrote:
> From: Conor Dooley <mail@conchuod.ie>
> 
> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>
>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>
>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>
>> [...]
> 
> Right, I am going to try this again. I don't think there's actually a
> valid technical argument against it, since it just affects the stage at
> which configuration is applied rather than configuration itself.
> If the configuration is wrong, and more devices don't use this configuration
> than do, people need to move the node to where they think should be. That
> shall be done separately.
> 
> I don't want to hear about the politics about whether or not Starfive want
> to support it or reverse engineering of binaries etc. All that I care about
> is discussion of the hardware itself and which boards need this and which do
> not.
> 
> Applied to riscv-dt-fixes, thanks!
> 
> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>       https://git.kernel.org/conor/c/42c57c049054
> 
> Thanks,
> Conor.

Second NAK to this being applied, again, do not apply as-is.

As you're not interested in the technical discussion, then you won't
have one.

-E
