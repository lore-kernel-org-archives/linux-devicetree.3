Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816D5013B2
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793646; cv=none; b=qpJbj5vP7PHXmwwi1n9vQ7u2f0wQZFAqMzkCiSoZcnlBQtpnP7VCBWsVAuJyfJOru1WzQK1wd1Hx9zRE2h2spaYqnU17+Ay6jl5YPIPg0/K5a+W+19SJnNycJHVg2UxTY7i0gFxbClj/qwPEluMLwWuDmiXigwdou/xo5ZF9Hw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793646; c=relaxed/simple;
	bh=fKiADCW3e5NsQfk6SSogw7jdf8+Ro6dsTVQG9yWo4sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KJzf6fzJa9AMtRSwmj6jXsIUEnXZ3N/eErWMe89jXVR3MweTH8a3hc8Y0Ga9ucl6EeyDYxAdiPZw7uNDEFWHzoWM8KNmkEv0YrxFa2DGyTuFok/UAvn8QaKrisGwQX455uzc9OzsGSstfN6J1LKtZ+wLDV3QUSz93EuPM5sbVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=e8UcM+kH; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="e8UcM+kH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788793642; x=1789052842;
	bh=fKiADCW3e5NsQfk6SSogw7jdf8+Ro6dsTVQG9yWo4sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e8UcM+kHLAH7ZV+8XckPjDdHGW15iEqjUQ0NPjPdhw6nkXAtxgnTDVtRl9mntYfme
	 llMZtPJSCoaQdQzaN8qPGl/+EIKiDBP/MmEF5YluAzFrsptM4V5OSFGnv3ccIZIQT1
	 aHReCnzG3w6/Z42GWpbWM0eFa3pbITjIoMyLe0e04lpITT5FRrJo3h+bDzJ0dkk+s+
	 WQ38sSOtlJq+Fp6OEMskS7akiQOmx/B9dGq3YH113UnwSh87k4NVTfB6U3dEfXgMjs
	 1E43bAh3meB5+Ga6rODx7PVIzI0bH0LeCIkJc2p54VXXgEr5lCvj4Qd782enWifSNo
	 usGZpSLyq1LVg==
X-Pm-Submission-Id: 4hdr5h3NSNz2Sd4k
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <robh@kernel.org>,  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 6/9] iio: accel: mma8452: Add comment block for
 struct mma8452_data
In-Reply-To: <20260907145807.4E6121F00A3A@smtp.kernel.org>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
	<SatYW3t5UItEjpuLWqt40OiPSkRC0JpBAcEBiiywzDmeTj1I0uUglPi7uVWyJmlLxCznDom94fKG0c7sd1ZyaQ==@protonmail.internalid>
	<20260907145807.4E6121F00A3A@smtp.kernel.org>
Date: Mon, 07 Sep 2026 17:07:19 +0200
Message-ID: <874ig19k2g.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The newly added kernel-doc block for `struct mma8452_data` documents
> non-existent fields (`@vdd_reg` and `@vddio_reg`) and omits the existing field
> `regs`, leading to kernel-doc validation warnings.

Argh, I missed that when rebasing from v7.3-rc1 to the togreg branch.

I will fix it for next version. So much for hoping this was the version
that actually got merged.

/Esben
