Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AC330301;
	Fri,  3 Jul 2026 05:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783057280; cv=none; b=PHERi1ZdlmuE5eGraiCcQKafu9kVi+4C5Y/VQQxV4IjgMcznPBWYQKczboStDrKQIgldmDHdJt/8j1QTYyi/gEN4BZHnNxz8VeWjVZe4dmNu97u1wmHrDadp05HFQHMghi70cpRjgGeXzEeUryougFvGd+OxrP40QhztxhDPJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783057280; c=relaxed/simple;
	bh=SAusHHRBW1hkD4b3dBmjaQiaHUKiEJMrPz8gQkykIgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZNBNFA9GR3+oExDbbwPpK0u9Hr1I19ws5GKFxwAYClrCbqjX5TQZyA4wrXZDQWIKAk2krWMsMcj9GAHx5h4nG45EmZoYG6Lj/gjWqrJjpBHEKcHF7yxAH0P1h9RJmYfeM1lpsTdszWYKvoWm0SA8do2GaP4wMb/U7F1sjdCRUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yMg8Lfao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yMg8Lfao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED521F000E9;
	Fri,  3 Jul 2026 05:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783057279;
	bh=K1dUUsyk6rfusf74RsE3HlTSEHwrqILFgZJ4BkGvnSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yMg8LfaoM0vwIGg0rhTmu7UjJzj0k1D95WoTIGuTVrjb0whhqRSu+Z3W8KBZdAnUA
	 7TnMDwftKw9iZXXuNUkG9lVE69FaHdqgJiY9xJV6EtT52erQgSyVBiNyikKbm8axLZ
	 KDJ0N67mOfrvPlJk/8pMsBqYXZL/sCnkKMs/INy0=
Date: Fri, 3 Jul 2026 07:41:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, mark.rutland@arm.com,
	mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
	sunilvl@oss.qualcomm.com
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
Message-ID: <2026070316-surgery-unneeded-bceb@gregkh>
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>

On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
> Hi, 
> 
> Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.

That is very vague.  Please provide specific examples.
