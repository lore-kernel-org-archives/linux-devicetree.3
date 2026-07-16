Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9F53314B7;
	Thu, 16 Jul 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231288; cv=none; b=XsWjLzT9/NjU60Zp+0DoVQeVTnZQbq4SwP/ScyR0/YFl6wGtn4nOV0HxEyX9xz6H+LdHb2qiafaX4oR/rO8L9T6fIexaXkAP3uhr+6qGJqozH11G5BTcgHnMM+dWYKElQn83V9CSdh4nWEeiFp0G3CZzy26L5GI9kW6G3QlIAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231288; c=relaxed/simple;
	bh=SJcCYxPKmMNIEclPnWtQMb8Hvsy4B94ToARxmk9KVsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyZ2rni304ylTFs0zVDc7Zc10Fs5MHbPcph+43XTrKyFUEYNDUVhMUxQ7PZONOnTQuT0+9DT5GmacrLXXMVFDTVXZsBjMRZYJQ4xhbfiIG3OHP/eZ2Vn/Gtq6Z178ZgyQa6SKQDDxDgY5w6O6pubTLve0JBbt3qcXM0vmPol5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWvezLmh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWvezLmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD891F000E9;
	Thu, 16 Jul 2026 19:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784231287;
	bh=3hhyWssp07/ZGm2jj07OWH53BPbjC4C4wZgRggSv8zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OWvezLmh8IpOIQJUxbAuOnrKQsiVynhZzqrFMr83q4sRZ8wHNC0UZA/jpqcVEVMTT
	 GydXWvDua5aNX+XLkSCgK2xOcsCBZLccMaURql4LbAreu7MEnYy099QbeZ0qzNlRW0
	 yQ3u0whE/1vo3rND97O8vjNOnj7EAaJGpKiv85DqDoh1cZlgN9kq9J6pEB/FWG2Rzw
	 q/4zgvsbrTQwyvCeZFa3au66pcVI3CGGxL49r73+tB68YE4HRbTOhit/8IcOWK0cJm
	 0uvXZy266TgLv18ytV332cq0+bu5cuQ4nuspFgzubXr+oBFPVAKWkIGvVVoZXstIN+
	 868u333PzLL2Q==
Date: Thu, 16 Jul 2026 14:48:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
Message-ID: <178423118332.1182230.16969278384286286126.robh@kernel.org>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703143717.177362-2-richard.genoud@bootlin.com>


On Fri, 03 Jul 2026 16:37:12 +0200, Richard Genoud (TI) wrote:
> Declare a carveout memory region to store LPM metadata on Jacinto
> devices.
> 
> For Jacinto devices, this memory region is needed for saving ATF context
> and the certificate information of ATF and OPTEE and DM image. This LPM
> metadata area is firewalled to be accessed only by TIFS.
> 
> U-Boot R5 SPL/TIFS will use this area to save and restore:
> - ATF context
> - ATF certificate information
> - OPTEE certificate information
> - DM image (which has been copied in memory at boot time by U-Boot
> R5-SPL)
> 
> At resume, U-Boot R5 SPL is executed and detects that the board is
> resuming (with a flag set in the PMIC), then it:
> - brings out of retention the DDR
> - retrieves the LPM memory region from DTS
> - authenticates certificates from LPM memory region and applies firewalls
> - asks TIFS to restore TFA and its own minimal context
> - starts TFA on remote proc
> - loads back DM image from memory and jumps to DM
> 
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
> 
> NB: This memory region is not part of DM memory (which is not retained
> at suspend)
> 
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Seems like sashiko raises a legit issue, but that's a kernel issue and 
not my problem if your board crashes.

Rob
