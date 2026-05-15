Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC50F3FE659
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833068; cv=none; b=PxA6kZ+ygZaG1bF3akm5EBFFzxcpipTh+nmTTAF+PWcwuQRhRaQQICFqlpJKDxd1nMhBCbLr3PEEj2efgsTAqOLNXPDe9b5O0wapJZyo7psiZmsOY+a4sq27XK72e7jpofQjB9dbmX7wYMmg0dk7wCrXlZNsmggio6H7owdk1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833068; c=relaxed/simple;
	bh=2OnJdpSf1F9n1GTpP39AmS0IQ8BVMnlgW1SubimsfGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KDt37pOI7V9ijO6O1fb513v9ml7GEhdO1F+pwYldFq46W5t8QWYl/TrVIU7qmF1c2kRIO78ZH5iD1IAjazAgTFdZZTd5QtQMogIXfZwhQcueqG2W9fHN9QNdvNlI/d1g07Ecc8pjaVgU8YoAOvJT/96XKfaEpJQ47weJfvaMWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CADuVCI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CADuVCI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E033C2BCB0;
	Fri, 15 May 2026 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833067;
	bh=2OnJdpSf1F9n1GTpP39AmS0IQ8BVMnlgW1SubimsfGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CADuVCI8GZiYORwPgfIWUMQuSESTP6HSqOLeYyjI2ZgNq5dsaeZZdnH+vNiTIlLzW
	 1fE6jFIaUOBosr0gLWhapvH8+S1Zow1cj6UoZ7hpqkVdkHinqVOtP+uCEHH0mdlqUF
	 EVtR2UW7qjto8gl+X8tuhd3jZOVtydjGihkzgwnf54vwlJEVafO2fanMZa6Q8Jaa1J
	 leWLQK7bN5HhHWSLPZJOz0Qfppwr8BQ7we2KJbmGKrDdZQHdrd5oMSVZRa3afRj9Ep
	 vt+vU35+ssBHedPr73cEp+twBjMJC5TZKX0ijh7GFxWSxnQEJfjrgCYb6Yz8YeehDm
	 voFNTtuT+P66w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] staging: axis-fifo: Fix alignment of
 wait_event_interruptible arguments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pramod Maurya" <pramod.nexgen@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515075736.172172-3-pramod.nexgen@gmail.com>
References: <20260515075736.172172-3-pramod.nexgen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 08:17:46 +0000
Message-Id: <20260515081747.4E033C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver incorrectly uses register I/O accessors (iowrite32/iore=
ad32) for FIFO stream data, corrupting the payload byte order on big-endian=
 architectures.
--

commit 2b61bbc0527fc4d755d68d7a70237195d89efad6
Author: Pramod Maurya <pramod.nexgen@gmail.com>

staging: axis-fifo: Fix alignment of wait_event_interruptible arguments

This commit resolves a checkpatch warning about argument alignment in
wait_event_interruptible(). It breaks the condition at the comparison
operator to keep the line under 80 columns.

> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis=
-fifo/axis-fifo.c
> index 3aa2aa870ea91..1c34de020cf85 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const =
char __user *buf,
>  		mutex_lock(&fifo->write_lock);
> =20
>  		ret =3D wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=3D words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=3D
> +					       words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}

This isn't a bug introduced by this commit, but while reviewing
axis_fifo_write() I noticed a potential endianness issue later in the
function:

	for (int i =3D 0; i < words_to_write; ++i)
		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);

Could this loop corrupt the payload byte order on big-endian architectures?

Stream data fifos must exclusively use stream accessors (such as writesl()
and readsl()) to preserve memory byte order without applying unwanted
byte-swapping.

The driver currently uses register I/O accessors to transfer data to and
from the fifos (XLLF_TDFD_OFFSET and XLLF_RDFD_OFFSET). On big-endian
systems, iowrite32() maps to writel(), which performs CPU-to-device
byteswapping.

Are there similar issues in axis_fifo_read() where ioread32() is used to
read from XLLF_RDFD_OFFSET?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515075736.1721=
72-1-pramod.nexgen@gmail.com?part=3D2
