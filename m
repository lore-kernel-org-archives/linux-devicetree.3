Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B43410D20
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824378; cv=none; b=tpDkyUREfo4vyWbAlfHU9ZCHXsaL2qnvxQoFb9T2ohrRp0RSO9CD9XJadDgGsqRqpURtoqzna6w8FxLHhLUmfwijmpDuf2Hp1T71zazNtkWEjdFqhvpSx99KNl3s8Oqj/yvZnLcYDHSBEG9AaFU8Zzq/dBVWkEOMfVWemx370+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824378; c=relaxed/simple;
	bh=cjpb/KJVEmbALOQmPqqykS1NKdRNJ+5MYPRAEnMe54U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b9VAIqqoWvJFANSszTsrCegI7+XUVArgxbSRS3+wIkX7NScvpKk2K8vI1/2eIHuODssWGQwa1Iv6yNNw6+9Pq6iF9E7YAHDvfzUqfc0LH3OElssBJXx2/N+5ic7xBRDtPDTltfimbhHmNLQjb7doixSJz/2K/yKLGk0UqSJ/tMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKMcS7v+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKMcS7v+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E186A1F000E9;
	Tue, 30 Jun 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824377;
	bh=cjpb/KJVEmbALOQmPqqykS1NKdRNJ+5MYPRAEnMe54U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eKMcS7v+Jz1ekxbUm5soobcVX/vlD5CaXtIp0CFTSFSiCFzGyECxm3xiwZyaSD4lF
	 cICzR2mly6tdArhl8tR5Sz3uR+ElIkiS+nV0iLToygYVFmYugw3Pz8Oq1r5EEZBdxM
	 bwBuFKVe8cTh/5zgxxa40rXtpxTAEyhBwz/miIH/NSHFN3slc7KRC/w2pfwk+bpguc
	 uBAd9xdhh+vgW0BoCQT5OtkW77vhzgUJ7ZRYzzjYBZ/fR/yUTL0ETtvPjhMon1cuxk
	 pq2FW+ZKuzUtPimjXMxfnjpFQoE9rgk3bAYjmDemnBrSr38vab2KU41CcQyYjOaeE+
	 RvL28D9lNAO9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630124413.1814379-3-joakim.zhang@cixtech.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
 <20260630124413.1814379-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 12:59:36 +0000
Message-Id: <20260630125936.E186A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Clock operations access CRU registers without ensuring the dev=
ice is runtime resumed, causing bus faults.
- [High] Exposing freed composite clocks via the OF clock provider due to i=
nverted cleanup order.
- [High] Hardware reset and clocks leak when CONFIG_PM is disabled or synch=
ronous suspend fails.
- [High] The driver uses a static global array to save register state durin=
g runtime suspend, causing cross-device state corruption.
- [Medium] Runtime PM usage count leak on the early probe error paths.
- [Medium] Missing reset assert in `runtime_resume` error path.
- [Low] Unconditional assignment of `dev_pm_ops` prevents dead code elimina=
tion when PM is disabled.
--

Note: Due to system recitation restrictions, this review uses a free-form s=
ummary format instead of inline patch quoting.

commit 515a69917f63979abc30478efe45a1239363fb83
Author: Joakim Zhang <joakim.zhang@cixtech.com>

clk: cix: add sky1 audss clock controller

This commit adds a platform driver for the Cix Sky1 AUDSS CRU, mapping
CRU registers and registering various clocks for the audio subsystem.

[Severity: High]
In sky1_audss_clk_remove(), the driver manually unregisters and frees the
composite clocks via clk_hw_unregister_composite(). However, the OF clock
provider and auxiliary reset device are registered using devres APIs, meani=
ng
they will be cleaned up after the remove function returns.

Does this create a use-after-free window where the OF clock provider is sti=
ll
accessible but returns freed clk_hw pointers? Could this also leave the res=
et
device bound while its parent is fully suspended?

[Severity: Critical]
At the end of probe, the device is put into synchronous suspend via
pm_runtime_put_sync(), which disables parent clocks and asserts the reset.
When clock framework callbacks like sky1_audss_clk_divider_recalc_rate() or
sky1_audss_clk_mux_get_parent() are later invoked, they perform regmap_read=
()
operations without first waking the device via pm_runtime_resume_and_get().

Since the regmap config doesn't set pm_runtime =3D true, will these unclock=
ed
MMIO accesses trigger a synchronous external abort (bus fault) when reading
from the powered-down hardware?

[Severity: High]
The driver delegates the teardown of hardware resources entirely to PM runt=
ime
functions. In the probe error path it uses pm_runtime_put_sync(), and in
remove it uses pm_runtime_force_suspend().

If the kernel is compiled with CONFIG_PM=3Dn, these functions compile to em=
pty
no-ops. Does this cause a permanent leak of the parent clocks and the
deasserted reset state if the probe fails or the driver is removed?

[Severity: Medium]
In the probe function, the PM usage counter is explicitly incremented using
pm_runtime_get_noresume(). If an early initialization step fails, the code
jumps to the err_pm label, which calls pm_runtime_disable() but does not
decrement the usage counter.

Should there be a call to pm_runtime_put_noidle() here to prevent the usage
counter from remaining permanently elevated?

[Severity: High]
The sky1_reg_save array is declared as a single static global array, but
during sky1_audss_clk_runtime_suspend(), the driver writes per-device hardw=
are
register states back into this shared array.

If multiple instances of this driver are ever probed, won't they race and
overwrite each other's saved register states? Should this backup array be
allocated dynamically within the per-device sky1_audss_clks_priv structure
instead?

[Severity: Medium]
In sky1_audss_clk_runtime_resume(), the reset is first deasserted. If the
subsequent call to sky1_audss_clks_enable() fails, the function returns
the error immediately.

Does this error path need a call to reset_control_assert() to ensure the
hardware is actually left in the expected reset state when the resume fails?

[Severity: Low]
The sky1_audss_clk_pm_ops structure is unconditionally assigned to the driv=
er
pm field.

To allow the compiler to eliminate dead code when power management is
disabled, should this assignment be wrapped with the pm_ptr() macro?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630124413.1814=
379-1-joakim.zhang@cixtech.com?part=3D2
