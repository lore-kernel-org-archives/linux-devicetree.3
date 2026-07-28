Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08512F5474;
	Tue, 28 Jul 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252615; cv=none; b=Y9l/kxX/eNBnIyi0kNuAqxmUF+TPi8XuuvayNNrEKHwSQMItork1TsUWYwe/zlS8iWQa8oLYgMtbgKORubZoMbfg/1zlMw18NwZkqTNhhHqCIobviAqmCZbM6xYKsQe+teXibvUeCPxE7RnaAJVZCk+vb6/Z46pKCfATqMugtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252615; c=relaxed/simple;
	bh=Se9h3YzznC9/HHyMcBATmwvfjvBCf9dNwbPwdKx9wxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swMaSEhcrFlrEbDvzc+iFVIGHzBZiOqfP46GhwiuQMo9HkpEQeAhOVPuUbpNH1GpFP7U/p/lC9Dglac+KN2MYR8/xyxSaNLh5dpJfzoeLHP/qfPBY+J+5FQT9hR+81IZVCrol/PbU0DSPwG0XuLjSWDdiPdjX0/jYz2XFTHfGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewu4Kyfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewu4Kyfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4301B1F000E9;
	Tue, 28 Jul 2026 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252613;
	bh=kHMHe8DXYFbv7HkrjiopSzw/zJOF/JWl21dsP0Poq2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ewu4Kyfbqhdf1jvk5L9GXGpzcB33+Eg/6yRdLcE8d1JVDXQoTvVzDBnFDVp/7c6yB
	 9hj7lZs4vQ4dmZWRWl2spgWiKe6kWE6rPE05cHxhVlMHih9pvWmaQet+wBCpbaKSi5
	 7Cv2lmpeP4xsnVG92JBsR+FooE1So3SFUv4GAnZllYkeQDY48mIIYCI5EKXrDWvoyw
	 Tk/qTuaOQwTAob3WfLD5POa/TEZCb2TGwOOtPiI/54aP+BWBAxcCQR4+JSN7cKicU8
	 UlLxfOlHeDzwpyHdKzAYa1UaPOfhHNqnZhWwgrrdkY/jV/f02u1NYHxIeqCurGVGw2
	 qNETRf1zaM8qQ==
Message-ID: <5306f685-46df-4956-9402-a86834f913c7@kernel.org>
Date: Tue, 28 Jul 2026 17:30:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 phy-next 0/9] RCW override for 10G Lynx dynamic
 protocol reconfiguration
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tanjeff Moos <tanjeff.moos@westermo.com>, Michael Walle <mwalle@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260723150105.da2cqgtb7t5vw2d3@skbuf>
 <20260728134746.p7zqstau6376xifj@skbuf>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260728134746.p7zqstau6376xifj@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oltean,

Le 28/07/2026 à 15:47, Vladimir Oltean a écrit :
> Hi Christophe,
> 
> On Thu, Jul 23, 2026 at 06:01:05PM +0300, Vladimir Oltean wrote:
>> On Wed, Jul 22, 2026 at 02:15:54AM +0300, Vladimir Oltean wrote:
>>> Ioana Ciornei (4):
>>>    soc: fsl: guts: use a macro to encode the DCFG CCSR space
>>>    soc: fsl: guts: add a global structure to hold state
>>>    soc: fsl: guts: add a central fsl_guts_read() function
>>>    soc: fsl: guts: make it easier to determine on which SoC we are
>>>      running
>>>
>>> Vladimir Oltean (5):
>>>    soc: fsl: guts: perform fsl_guts_init() error teardown in reverse
>>>      order of setup
>>>    soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
>>>    dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
>>>    soc: fsl: guts: implement the RCW override procedure
>>>    phy: lynx-10g: use RCW override procedure for dynamic protocol change
>>
>> Even though I intended these changes for linux-phy (they are also
>> build-tested there), I'm fine either with these changes taken through
>> Vinod's tree with Christophe's ACK for patches 1-8, or through
>> Christophe's tree with Vinod's ACK for patch 9, really.
>>
>> I see on Patchwork there's a minor issue in the commit message of patch 3/9:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Flinux-phy%2Fpatch%2F20260721231603.67865-4-vladimir.oltean%40nxp.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cdfcaa68452fc46a3285108deecaed436%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639208432793851204%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AUY%2BIZEiFp3aLAO4HlHQCrJ9ZnCyFqzshPEGq6CpfmU%3D&reserved=0
>> "WARNING: 'struture' may be misspelled - perhaps 'structure'?"
>>
>> Could this be fixed up while applying, if there is no other feedback?
> 
> Do you have feedback/a preference for how these patches should be handled?
> 
> I see Vinod acked patch 9, so I guess that means his preference would be
> for you to pick up the entire series (which is indivisible).
> 
> I checked that the patches apply to your soc_fsl branch:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fchleroy%2Flinux.git%2F%3Fh%3Dsoc_fsl&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cdfcaa68452fc46a3285108deecaed436%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639208432793877128%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xjpwRCMIncWpW89zKzhil20%2BcUhnG4LPaFNbxw1pue8%3D&reserved=0
> 

Hum ... Seems like I overlooked your message as it was flagged phy-next 
and I was on summer vacation on last two weeks.

I'm fine with taking them via soc_fsl tree. I won't take them today 
because I'm already pushing a large series from Paul Louvel but I'd push 
them by tomorrow or thurday.

Please raise hand if nothing happened by friday.

Christophe
