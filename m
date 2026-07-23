Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790E1DFDA1;
	Thu, 23 Jul 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809876; cv=none; b=bVA47gCTXL/Oxqa2yGttPAaok3tRzbL6rcTo9y3fsuObe5Xv9CalBKZRfWrCIvoyNsOw/MoDn67HTOdG+WkgtC9vpw+FlcSKkljg0y7D8p7Xq3fn1yNocmGqka2vuppVN7Easu9MsAUwJdtKR8vSOSyv0yk6KrtKSPWlVlSzYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809876; c=relaxed/simple;
	bh=NfFpyE6lNTNjgeSpewhhJMFvlWcoRYcuQXZ9aMbrJrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTDPuUJbGMjjQiah9osSMAmkdLdTEf8JEkC5EY8kdOYAWMwiiiPfEUn5PJFQpm7xSqiMGTta4q1lXEOnUVIyBp8MS3kPw2M+DJ5kasIISugYVhJtaqRDK8S/blmNi2np/+qQUSc/zVYk4BtS6Rp0Oc8ZXcUakmrB6kxNO+MAPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF031F000E9;
	Thu, 23 Jul 2026 12:31:12 +0000 (UTC)
Date: Thu, 23 Jul 2026 13:31:08 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub driver
Message-ID: <20260723123108.GH3363113@google.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>

On Tue, 14 Jul 2026, Lakshay Piplani wrote:

> This is an MFD driver integrating I3C hub and on-die regulators.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> Below patches from v11 have already been applied to i3c/next branch:
>  - 79c41666b397 ("i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked")
>    https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=79c41666b397
>  - 8d8afa428318 ("i3c: master: Expose the APIs to support I3C hub")
>    https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=8d8afa428318

Am I correct in thinking that the only deps are between the Regulator
and MFD drivers?

-- 
Lee Jones
