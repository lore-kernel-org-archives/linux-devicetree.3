Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBD2165EA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832957; cv=none; b=VhAx3cFFfxB52GNic1gmRW6JXVd+EPTcozbqugc040L7ZWBoBoHlWmiO5n2rbznmP1+8cIwb5meorz4kKDpADAyOS5s0F51C9SH+KzuXaUyrvoP2Ecen20ei7bKtpxsGbPcE2el42oMaxFcQtjcX4Owoz+VfQeNMXlxjAjqqVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832957; c=relaxed/simple;
	bh=5mI238to2HkYndPxhs256ZlB3K1e/fzzqGXk8KTabRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kY8W4hInSHEXfTqSxIl+fj8d0fwmnGJfj/T/aVkz/8dTMGRARFgmkKLwipcN60IlYvj0YeUqqxa697Q8BkjFHew093FIjJd96VTzf2PWebS6niY8r+ca8lQk+JLou7JRkoCVlYRp1vBVi01D8nsY7UzRoqDf+4u95bhqnPc0dyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuLhgDOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuLhgDOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675911F000FF;
	Thu,  1 Oct 2026 05:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832955;
	bh=aAPNAwND7W7OeAxTu7TvehSSbPIJaaKhYvz8K1FrH0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuLhgDOL8PGaKyJKaKeJo0nAGUbOLgzNRWC9L64zKf1glN+k6ku81cgy4VoSX1Hz5
	 AI5VKLKJcZZMOUxgIY01fgooRfhsh3b2oXdFsw1lZoFNsj85FYtXlQLPf+gb0ywMuN
	 elkjv+lYJN6XvijTYqZZ8cfQaZAwsYAGX3ChSbnNnftvlIiGqipo6HzGVAn+uEbIa5
	 nzAVWyg/eaHl3pc8fd+gyfD2aN9i2IFPLsmH4PCKA1fjwqlHBYygZmF4J6rWXwXSXI
	 bTtobi+LfCEk46klUPROfW+Bjez/aZ7UIByhyXc2HtZbJmEEd0Z4lqacv+lqTeQqtb
	 NuX4RHILAYD4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/14] perf tools: Initial support for gtrace decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001052243.3042627-14-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-14-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:35:55 +0000
Message-Id: <20261001053555.675911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] perf: memory leak of gtrace_decoder on duplicate auxtrace info
- [Low] perf: missing explicit <stdbool.h> inclusion for musl compatibility
--

commit fdb0fe6a9d0684b5f29d2d2a91c37ec24db2cc06
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

perf tools: Initial support for gtrace decoder

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file. Actual decoding of the trace payload is not yet
implemented.

> diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-de=
coder.c
> new file mode 100644
> index 0000000000000..c25fbfc61928d
> --- /dev/null
> +++ b/tools/perf/util/gtrace-decoder.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Generic hardware trace (gtrace) decoder
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <stdlib.h>
> +#include <internal/lib.h>
> +#include <linux/zalloc.h>
> +#include "evlist.h"
> +#include "session.h"
> +#include "gtrace.h"

[ ... ]

> +static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
> +				      struct evsel *evsel)
> +{

[Severity: Low]
Does this file need an explicit inclusion of <stdbool.h>?

The gtrace_evsel_is_auxtrace() function signature requires the bool type,
but the file fails to explicitly include <stdbool.h>. This might lead to
build failures on musl libc systems where implicit inclusions differ from
glibc.

> +	struct gtrace_decoder *ptr =3D container_of(session->auxtrace,
> +						   struct gtrace_decoder, auxtrace);
> +
> +	return evsel->core.attr.type =3D=3D ptr->pmu_type;
> +}

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
Can this leak the struct gtrace_decoder pointer?

If perf_event__process_auxtrace_info() processes multiple
PERF_RECORD_AUXTRACE_INFO events for GTRACE (e.g. in a malformed or
concatenated perf.data file), gtrace__process_auxtrace_info() will be
called repeatedly.

Each call allocates a new gtrace_decoder via zalloc() and unconditionally
overwrites session->auxtrace here, without verifying if one was already
present or freeing the previous pointer.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D13
