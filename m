Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973A329E7E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377303; cv=none; b=pNgo5avaaJlljDqHJ7TJvsK0Qplhk49vjWhEJ8KA4BK2hdAAg29eC5xlHvnf9FBcao5v9dFYLXnL+s8jjYRKMTchuftO47ZaSwED18KFjUoUxVCIOTAP7eE2Y0vpSCyD46GC/lavMAA2Chn70Te5MCZP5Y+Z4VZfelRVqeWNzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377303; c=relaxed/simple;
	bh=2JiDPcxhXJ+iFYw2hYYGQaT67uUTGPO34PsJexCMh2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQnvzMdN3HWBK/6j02TqeLyBtDO+VNYCIHi/51oOQY6V8CyxonEDnHzYoNTrtppZLnhF9TT4x1OpOq5Oo6ATD+dxJrTd9dlpSIdt6MtWTbGn6aPzf2ZUnX2kELQRiWMLtmlggCoTz4/xzTTBqCVWKTEyyKARMi0T//nRitCnNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEUoixDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEUoixDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5B71F00A3A;
	Mon, 10 Aug 2026 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377302;
	bh=jHgB9KcLwbFlrFnHbJx3/DoFOTkJvh/ws5voQ8FIVYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEUoixDBT87ceX2G/yesS/FEu6oxmOdxqUgfOm+zSd2lMBIiKkdZepjfsFXFHIrwt
	 2p8COvMS5ibxCGjdxI6IDFnvQLj4E1Mhyuk1mSVbU+HmYtbbzBHTZwq2AXB2EwIgo7
	 /Y7a/FcXWgVdp/EfHdoyjUP1OTC15mSbqVrBol/zm7Y74XJuYJVWs202UjXXCnQf9Z
	 r/GccYytMlqegiHQNdAMkdNeE99q/IDzX6KFKKbWrHpPbwm27JRSrkFgu9EGtaiAk9
	 fSSTmNVH7NDXLiQcW0n42cAtIyuPoPxRQ1xIGarN+igsWxzwa8N08oXwkzweB7Q3Oe
	 Yt3hcZ6WcAdnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/14] perf tools: Add RISC-V trace PMU record
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:55:01 +0000
Message-Id: <20260810155502.5B5B71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Missing explicit header inclusions for POSIX libc functions (`free(=
)`) and constants (`UINT_MAX`), violating musl libc build compatibility gui=
delines.
- [Low] The newly added header `gtrace.h` is completely unused, its macro i=
s re-defined locally, and it is structurally broken due to missing type dep=
endencies.
- [Low] The function `parse_event()` is used without including its correspo=
nding header file.
--

--- Patch [12]: [PATCH v5 12/14] perf tools: Add RISC-V trace PMU record ca=
pabilities ---
commit dc36885ec60bdf3420446c3aec420428e7cdc32a
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf tools: Add RISC-V trace PMU record capabilities

Introduce the required auxiliary API functions allowing the perf core
to interact with gtrace perf driver. On RISC-V systems the gtrace
PMU uses the RISC-V E-Trace components and optionally an ATB Bridge
component for connecting to ARM-side sinks, if it is present on the SoC.

> diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/risc=
v/util/auxtrace.c
> new file mode 100644
> index 0000000000000..39c31be9f8966
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/auxtrace.c
> @@ -0,0 +1,217 @@
[ ... ]
> +#include <internal/lib.h>
> +#include "../../../util/auxtrace.h"
> +#include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/evlist.h"
> +#include "../../../util/evsel.h"
> +#include "../../../util/pmu.h"
> +#include "../../../util/record.h"
> +#include "../../../util/session.h"
> +
> +
> +#define GTRACE_PMU_NAME	"gtrace"
> +#define GTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)

[Severity: Low]
Is this macro definition duplicating the one provided in the newly added
tools/perf/util/gtrace.h? It looks like that header might have been intended
to be included here instead of redefining the macro locally.

> +#define KiB(x)	((x) * 1024)
> +#define MiB(x)	((x) * 1024 * 1024)
[ ... ]
> +static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
> +{
> +	bool privileged =3D perf_event_paranoid_check(-1);
> +
> +	if (!opts->full_auxtrace)
> +		return 0;
> +
> +	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
> +		if (privileged) {
> +			opts->auxtrace_mmap_pages =3D MiB(16) / page_size;
> +		} else {
> +			opts->auxtrace_mmap_pages =3D KiB(128) / page_size;
> +			if (opts->mmap_pages =3D=3D UINT_MAX)

[Severity: Low]
Does this code rely on implicit header inclusion for UINT_MAX? Including
limits.h directly might be required to ensure musl libc compatibility.

> +				opts->mmap_pages =3D KiB(256) / page_size;
> +		}
> +	}
[ ... ]
> +static int rvtrace_recording_options(struct auxtrace_record *itr, struct=
 evlist *evlist,
> +				     struct record_opts *opts)
> +{
[ ... ]
> +	/* Add dummy event to keep tracking */
> +	err =3D parse_event(evlist, "dummy:u");

[Severity: Low]
Could this trigger an implicit function declaration warning? It seems
util/parse-events.h is missing from the includes at the top of the file.

> +	if (err)
> +		return err;
[ ... ]
> +static void rvtrace_recording_free(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =3D container_of(itr, struct rvtrace_reco=
rding, itr);
> +
> +	free(ptr);

[Severity: Low]
Does this code rely on implicit header inclusion for free()? Explicitly
including stdlib.h is usually necessary for musl compatibility.

> +}
[ ... ]
> diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
> new file mode 100644
> index 0000000000000..4b87bdaf55c69
> --- /dev/null
> +++ b/tools/perf/util/gtrace.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
> +#define INCLUDE__UTIL_PERF_GTRACE_H__
> +
> +#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)

[Severity: Low]
Is this header file completely unused, given that GTRACE_AUXTRACE_PRIV_SIZE
was redefined locally in tools/perf/arch/riscv/util/auxtrace.c?

Additionally, does this macro need linux/types.h to be included so that u64
is defined when this header is used?

> +
> +#endif
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D12
