Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686731ED83
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377081; cv=none; b=ciYwKFmsCsbQB77qzffV9UWBoR8QIK3aFP7uy0ovKuEL981/tGQUOZ5sk9V4MCcjI/NU7fdznMODeXSvGyudSr6dwzfbLOqHwvTedeUV7Rwivkrj5p/ek6keGdoXs1YQZD6cNkbmTDXYbcVClu/IEDlEOIYaQexSyxQjE78ERvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377081; c=relaxed/simple;
	bh=wYpCU4TavPwA7nkl0SOszX8eCFwhbBaj4/kktPtX/S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6g9yDoH2CUP/eItXv6GOk85j2UWlG7lxBrGcLCn/cssHwvDW1kJUlBFHCjj9k4zXWz+n0mRCU70Xe+HWztrjkD/bcPN+tOzPx8A6rPZFhcrcJjtaxk3z8f8tqJQJwLQrzDwFF8Fm4r+0BtWSDP0S5YdMUFzljffs+t2sIOo70E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0BTEXsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0BTEXsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6D21F000E9;
	Mon, 10 Aug 2026 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377080;
	bh=iPNNx1Qi4Y/HOVluwpiI8jZcR+rxOtcyetKeyErKayk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R0BTEXsaRDca3Oj8JVVhf5dRZOEJ/nhqOTEGwHLQr8LG+eiDUm5A6v21wUa4AvFV7
	 8mequr2lOVw19ionhVf+62YLlE6yWZsG9a6It7ajA0L0jAf3+TkoZA7B8CEGh6sw0J
	 PonpOGrNB0WCGpGide8ix05W7nUljXWEAPPnFEkHYBRDR+h2/pXvDMXut08R1aULo9
	 33vSqMKO0BzcUdkC7k0OQ4vmKm/DpRmkm6nQOB/iFTZGnMzrbRrMzAwEyhPLrMIRad
	 CuoGktg3l8lcqnBLBkSxzwyt1a9FwbaMxiOsTtmiEkTUa32EQ6Gr0tis5SN5GySJgj
	 CG1h4wynoNCvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/14] perf tools: Initial support for gtrace decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810152223.3946743-14-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-14-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:51:18 +0000
Message-Id: <20260810155119.DA6D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing explicit header inclusions for free() and zalloc(), lead=
ing to musl compatibility failures and pointer truncation.
- [Medium] Unconditionally overwriting `session->auxtrace` causes a memory =
leak on multiple `PERF_RECORD_AUXTRACE_INFO` events.
--

--- Patch [13]: [PATCH v5 13/14] perf tools: Initial support for gtrace dec=
oder ---
commit 7c1bf67a1a25514ab10564a3e48db1965dbac1a8
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf tools: Initial support for gtrace decoder

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file.

> diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-de=
coder.c
> new file mode 100644
> index 0000000000000..4a1571431edb3
> --- /dev/null
> +++ b/tools/perf/util/gtrace-decoder.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Generic hardware trace (gtrace) decoder
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <internal/lib.h>
> +#include "evlist.h"
> +#include "session.h"
> +#include "gtrace.h"

[Severity: Medium]
Are we missing some explicit header inclusions here?

The code uses free() and zalloc() further down in the file, but does not
include <stdlib.h> or <linux/zalloc.h>.

Missing <stdlib.h> can cause compilation failures under musl.

Missing <linux/zalloc.h> can cause zalloc() to be implicitly declared as
returning an int. On 64-bit systems, this truncates the upper 32 bits of
the pointer, which can lead to a segmentation fault when dereferenced.

[ ... ]

> +int gtrace__process_auxtrace_info(union perf_event *event,
> +				   struct perf_session *session)
> +{
> +	struct perf_record_auxtrace_info *auxtrace_info =3D &event->auxtrace_in=
fo;
> +	struct gtrace_decoder *ptr;
> +
> +	if (auxtrace_info->header.size < GTRACE_AUXTRACE_PRIV_SIZE +
> +	    sizeof(struct perf_record_auxtrace_info))
> +		return -EINVAL;
> +
> +	ptr =3D zalloc(sizeof(*ptr));
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ptr->session =3D session;
> +	ptr->machine =3D &session->machines.host;
> +	ptr->auxtrace_type =3D auxtrace_info->type;
> +	ptr->pmu_type =3D auxtrace_info->priv[0];
> +
> +	ptr->auxtrace.process_event =3D gtrace_process_event;
> +	ptr->auxtrace.process_auxtrace_event =3D gtrace_process_auxtrace_event;
> +	ptr->auxtrace.flush_events =3D gtrace_flush;
> +	ptr->auxtrace.free_events =3D gtrace_free_events;
> +	ptr->auxtrace.free =3D gtrace_free;
> +	ptr->auxtrace.evsel_is_auxtrace =3D gtrace_evsel_is_auxtrace;
> +	session->auxtrace =3D &ptr->auxtrace;

[Severity: Medium]
Could this leak the previously allocated decoder context if multiple
PERF_RECORD_AUXTRACE_INFO events are processed?

It looks like session->auxtrace is unconditionally overwritten here without
checking or freeing any structure that was already allocated.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D13
