Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6E3B3C11
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107940; cv=none; b=h8bdzOsWVmwkL1rDvAKR6ffRrWRZmMgtwiRPP3TBuHzNLgiuugHf2vkYgQQ5783mz8qGERgo7ojp4j4/TPIZWHZBwctWxeOrJk+qCveWKYdinV1qmG6Ob11jaIOYvcBdDaWMWZUOFFwq6MxahzUdHKpGiFmPb9+bFZmRwhkxtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107940; c=relaxed/simple;
	bh=avwn+6HURSd5dO0bV2I4rynrD4YVWESq3vfVvH6E3L8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=roPj1RiAdloQ0Pp/1wjbEIXfllcAodnhpKBe/wz7+ra9bNrJY/KYH9rQUntXj7Qe/0A64yoTygW5D1YzTmCh7qp3f+l6I7fQgFwWQ23fR2/DnA0fc5sxK6/ZH5YGFMHzE0ltuLiiFt87c0pxA7/8bF9g5a1kI5mzo8mWJmukIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5HYBRVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5HYBRVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308991F0089D;
	Tue, 22 Sep 2026 20:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107909;
	bh=6kXp2SYL/EBypvnrrmFIS2QyQDWD3ImrSLFu4Qm6koU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5HYBRVInCUmFgDeDi3M2z+4Ivxt7XTyZ4NmtiIYR8XmPetdIYNYfh8B9mfduZjr+
	 LzCrwvWkSAxnMa//fASyBuYbjkc7Am0SVOB45EAV6ycBfcB/Pw+BfcDoRDC69hi91o
	 KnNxIP9GvBYxDLsEkOU5b9f1IonlwJfhDBvtooBpuIvsW0YfzIPgnz9/7AUNG7lW8F
	 bDTHfibpcgwX1Wkl1tNX5rfyX1gpREF+wfsHScAccokk+/PouMcwjPaKACZJDcCp6/
	 0AawsCogbwGk1AsHDxTzrDzt0GLTydF7KtzSDq2hTNMAJAy/C1H6pSDifO6lpWIbzg
	 McKzPrRC+YGZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 14/14] dpll: sit9531x: allow the device tree to
 override two board facts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-15-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-15-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:48 +0000
Message-Id: <20260922201149.308991F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] sit9531x: missing kernel-doc for out_pll_map_count
--

commit 7eb12495259a2c54a7fa809f3d6ed3feeb8f22d5
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: allow the device tree to override two board facts

This commit adds support for two optional device tree properties to override
the VCO frequency and output-to-PLL routing on the sit9531x device. Absent
these properties, the driver behaves exactly as before by deriving and
reading from the chip.

> diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h
> index 1fc14eabb6210..31a5f49c02531 100644
> --- a/drivers/dpll/sit9531x/core.h
> +++ b/drivers/dpll/sit9531x/core.h
> @@ -224,6 +224,7 @@ struct sit9531x_dev {
>  	u64			pll_fvco[SIT9531X_NUM_PLLS];
>  	u8			out_pll_map[SIT9531X_MAX_OUTPUTS];
>  	bool			out_pll_map_valid;
> +	u8			out_pll_map_count;

[Severity: Low]
Is the kernel-doc block for struct sit9531x_dev in drivers/dpll/sit9531x/co=
re.h
missing a description for out_pll_map_count? This missing documentation will
cause a kernel-doc warning during W=3D1 builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D14
