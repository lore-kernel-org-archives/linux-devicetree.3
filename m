Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494307;
	b=b6qRpkjDKMOeRAH3FCyD631vszq5o3MigYZ20gLoUOqxaqoo0tt9A98sIzfoaaEedgrd
	 Mp0RsllT29m2NFTMVFpfqcJLnmrtiYGJA2B6VaSd1Bg8iqvpYaQvi+HRD7hEfWP+Z+LCy
	 mD/LzdF6QHx+thEsIz2ofNtogFszBFfaMMC5Qxv+sqYQeF8F33AM7v2Lc11GUuFgXGqzK
	 +yG+oSZImBLXnPaJq9GTQr/SsKa4fKhzolgb5IQnh6X03qnvVzw9yun80iv74a2HFDz5G
	 sg7Y+1ElC3f8ninj//pzu4QKDI1klebKFpaHOcvXZGWP4ZI/PGFH2Q/B2ioGvzvCZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mL3DCj8C1CNKfIn6HKeBKSiyje/eNISwIE7ePXfZesU=;
	b=4kMdr2KX+RdB9OpXaoOMR+Qpe4ahAdcQk9m34dGL00G6fCIQiLET6eXTXazI0tZR0vUb
	 h8glYKvqvgHaMzD9SLOvmIg44QY3kAUUWX75Y2NwzYOfghHIIOBk/RQM0ywIJCsgXR1GD
	 0ghbu2lqXV3J0TZwv6ugklyhhxXnRWJgxozQ4FCNMm8KEGTL9GBcmOqreLaGg5S1BjaRm
	 MMsjd/tUm9Kf2BKod5AlNI8JEwjac95jWufsEwaK577+FE0r/GHmUvy6/iimF9W5J5mZ3
	 YIYiSAB7oeevDC7uiZM7xyyabvSorOmkafDTdsmbS9PNzJWFApCtduSFZuDziZOKOqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LR7HSYCd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425860A260E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LR7HSYCd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391461F00A09;
	Thu, 12 Nov 2026 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494307;
	bh=mL3DCj8C1CNKfIn6HKeBKSiyje/eNISwIE7ePXfZesU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LR7HSYCdWbWLgFghuhXhHl/DtMc1KTLzTroRySpYjwFIeNRaPHVEXbLPJkhKnB4Y1
	 4ADlW9Qf/P7nUihxfWJ0C+Y5Hpm0J5C6GlxKWlzcFtf6waKinJWtSJA5dCMYsVpt4Z
	 jFjQqvGpkwhFssUovdMAzP2C3uR97BeTw6MEApJ1hHDwU3JGrgncebZQct1xXXHzng
	 NkQk0v6vXSHUc8t6XONJdF9EWi1VttCP2RgXV1Fy/AmtdXvXmAUdOfOesElLzAQIw5
	 dSRFp1jfYc/Wq8gG4475j9FFIaHhx48i9bBvCM/ovIUshVxj0wms994FuIA6aOeZHd
	 dm5z4O3aF/lcw==
Message-ID: <sashiko-outbox-211353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: iio: imu: icm42600: Drop interrupt
 requirement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-b4-inv_icm42370p-v9-1-875c828a281e@axis.com>
References: <20261112-b4-inv_icm42370p-v9-0-875c828a281e@axis.com>
 <20261112-b4-inv_icm42370p-v9-1-875c828a281e@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:38:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: iio: imu: icm42600: inaccurate Fixes trailer
--

commit bb25ff93be540fe1b4383c714ff7cd075c29001b
Author: Kanak Shilledar <kanak.shilledar@axis.com>

> dt-bindings: iio: imu: icm42600: Drop interrupt requirement
>
> The devicetree documentation for the invensense,icm426xx devices was
> documented wrongly. As per the discussion in the thread[1], the IMUs can
> work in polling mode, making the interrupts as not required.
>
> Fix the dt-binding to not have interrupt property as mandatory. The
> driver will need to be fixed to not fail if interrupts are missing from
> the device tree. This will be done in a separate patch.
>
> Link: https://lore.kernel.org/linux-iio/20261018034134.2bf170a0@jic23-hla=
ptop/ [1]
> Fixes: 22addefdabdf ("dt-bindings: iio: imu: icm42600: Add icm42607")
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>

[Severity: Low]
Commit 22addefdabdf ("dt-bindings: iio: imu: icm42600: Add icm42607") only
moved the existing top-level interrupts requirement into an allOf block to
exempt icm42607.  Should the Fixes tag instead point to the commit that
originally made interrupts required:

  Fixes: 45924b8fd2c9 ("dt-bindings: iio: imu: Add inv_icm42600 documentati=
on")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-b4-inv_icm=
42370p-v9-0-875c828a281e@axis.com?part=3D1
