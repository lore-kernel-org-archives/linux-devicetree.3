Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346C3E44EB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376270; cv=none; b=G8TzmPAAR5ndTw839qM5KFIvuW0ovK+jznppyL7K6l6f8iKtA7PDTWfjWi29nXoNx7URX67gzArY/4lHXLkHPfWyoFlJ5pcEZ/FY42DaLKPFfD1rBvShNmx8PFrrzDsD8Xe7hCtDpu/Spm0RXZ4le7gYwmthIEL8qtQDOvOeOys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376270; c=relaxed/simple;
	bh=ApFcu9dmWONYIeTF4QKDvpBIApAj2MfF1p0NTkGsNK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SVokFX5W7l14tRDkUm8H7GCAWR65jjoV3gA3ahdsy9U/wFRcgU8KEO17+kUOumECV9egrXdSp1d2kfyO+a5lS4r80mHiLQRY8W+tmcepwxoDuOFgDpoBDp7hARhhLieAh0sGcS5GI8L12fC8B3r3JvKAS11NU3lEE7E10h/+tfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QncuYu8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QncuYu8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC51F000E9;
	Mon, 10 Aug 2026 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376268;
	bh=DO62OvJ0Jw5XpXmZqjFBEr/y8xwQrnaQY7IN4C8F6C4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QncuYu8SUVO8ZGmbmn0kRxwxKPmV2xcnLnwnvi2JzJL8hqcGht+6jJpK5XdFIEgql
	 LZvfnUPpYh2E2NMZHgpDa9FziBjl7dizU50Vv1qOgoDzaZnAQdq5eOycG46x4xWUc2
	 bTHGYd+jWxkdJ5LGbYHtDo/UDDxV2aetcb8aEDyAUnVmk48KU9pUKFARuPa+fAZl2l
	 ihm/9WoJABrgdaV52atvlrteJdTVCes3pmHWd8M5KE13t2IJ0PAs6+DijBbSBS0Jjw
	 6IhynVllBDTU0op3H13pPmSkXg+zQFAmJqaO01XClmQL8SjalJzy/D1hSbXYJyA72a
	 zVr15Ei9j94UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/14] perf: Add gtrace AUX buffer trace format type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810152223.3946743-9-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-9-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:37:47 +0000
Message-Id: <20260810153748.46BC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit modifies the kernel UAPI header `include/uapi/linux/perf=
_event.h` but fails to mirror these changes to `tools/include/uapi/linux/pe=
rf_event.h`.
--

--- Patch [8]: [PATCH v5 08/14] perf: Add gtrace AUX buffer trace format ty=
pe ---
commit 6637722bfb1d15a6e1471e7ca1494775099312c6
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf: Add gtrace AUX buffer trace format type

This commit adds definitions for the gtrace PMU AUX buffer formats to the=20
perf event UAPI header. It specifically defines the RISC-V E-trace format f=
lag=20
so the perf tool can decode the recorded payload.

> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_ev=
ent.h
> index fd10aa8d697f2..ca2d8614a7804 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1311,6 +1311,10 @@ enum perf_callchain_context {
>  #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for b=
ackward compatibility */
>  #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the =
source */
> =20
> +/* gtrace PMU AUX buffer formats */
> +#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
> +#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace for=
mat */
> +

[Severity: Low]
Does this change also need to be mirrored in
tools/include/uapi/linux/perf_event.h?

When building the perf tool, missing the synchronization of UAPI headers
typically triggers a warning that the kernel ABI header differs from the la=
test
version. Updating the tools directory copy would also ensure the new
PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE macro is accessible to the perf userspace
code within the same tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D8
