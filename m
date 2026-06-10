Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64661AA7A6;
	Wed, 10 Jun 2026 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091280; cv=none; b=uPfIWKLCeqzRhOU20XNYObBNDNHN3bsu+GN5mnpwmgPNiHMOZbdU36lI1UeKFlnMYs+0Ffku2oW8A2I9sEIx+Z8QgPch6yj7bxOQeCZBl34Jqsfm1sDFQ6DK8R0UtfLQ5EXWZs5Gz/qOWYA3yCd7HBK1RoGzIQkT4qaEiIkBaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091280; c=relaxed/simple;
	bh=40c2YVnWm1F+cAxSwyKNuTTq6vJFSXb55IXlrE1pdAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4bCZcoJYu1sqWg/HyMhfEAuWhzjb850JM7XhxEQXQvhzZGbDksWNuE/L34/R4PWGtvo56OhnIBDuBWhFPbOK55qCbpcc5bbJSXC1dI/HLO7/US0BgaDwIPqXwbWyrEItxo9wP+dAPatFivUQKxFFwqA9PJpyzC2FpGb1oNs/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KtTEi6m+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KtTEi6m+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FA1225E3;
	Wed, 10 Jun 2026 04:34:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE353FD88;
	Wed, 10 Jun 2026 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781091278; bh=40c2YVnWm1F+cAxSwyKNuTTq6vJFSXb55IXlrE1pdAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtTEi6m+08ddxbKLii1Ua3yPwS9YUpWZA4ZClyLyzCSmSc2lKpoHXuJbRdFupRRk6
	 gHP9Ib3MxB3GJf5NYFeMsiNOlWRr7I6b9xl2BcV/COMJO+4CMJUxzQUGs6gwRf6GW7
	 4YxXoWE+VXsCZ9ndGWlSI/vmAXZXSN5yzyLeElgM=
Date: Wed, 10 Jun 2026 12:34:35 +0100
From: Leo Yan <leo.yan@arm.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Yunseong Kim <yunseong.kim@est.tech>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Jerry Zhu <jerry.zhu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yunseong Kim <ysk@kzalloc.com>,
	Yunseong Kim <yunseong.kim@ericsson.com>
Subject: Re: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
Message-ID: <20260610113435.GV101133@e132581.arm.com>
References: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
 <aikVYZDMYuPscIKR@gary-System-Product-Name>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikVYZDMYuPscIKR@gary-System-Product-Name>

On Wed, Jun 10, 2026 at 03:42:25PM +0800, Gary Yang wrote:

[...]

> >   (2) Or expose the full CoreSight topology in ACPI:
> >      - Add ARMHC97C (TMC-ETR) device with MMIO base address
> >      - Add ARMHC502 (funnel) devices if applicable
> >      - Reference: ARM DEN0067 (CoreSight Architecture ACPI bindings)

The CPUs on O6 support ETE + TRBE, you don't need to use ETR or funnel
modules.

> The firmware (TF-A) for the Radxa O6 is provided and maintained by Radxa. We 
> will forward your request to the Radxa firmware team and ask them to evaluate 
> enabling TRBE access from non-secure EL1/EL2 (i.e. setting MDCR_EL3.NSTBE = 1 
> in TF-A), as you suggested.

The issue is caused by ACPI: the APIC table does not contain a TRBE
interrupt, and the SSDT is missing ETE nodes (ETE node should be
present for each CPU):

  Device (CPU0)
  {
    ...

    Device ( ETE0 ) {
        Name (_UID, Zero)
        Name (_HID , "ARMHC500")
    }
  }

Thanks,
Leo
