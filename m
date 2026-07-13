Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7B37A835
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939303; cv=none; b=qGNTRSDTUBSZu/I7wej2cja70z0ECZqDZNs5PgJtxFFUJY4RwzfQn9+auQ9x9mN/2jbFZ5n/oJbrMjwCOtT5VpNw7q34ZtXz9TZXbFdR4de7mgwD5PS4ZCVgKzrpwWjbMtslmqTlw2LKr2cpve3GOyBxfJastlY5VpnG/TjKRWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939303; c=relaxed/simple;
	bh=E75k0CxBXpT739PykLJDXdgSlRicWGBlw7jBsCEet08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSZoTHMuhBbz62fcYF0ibm6llWUKmOy7pUlf6ngYVkVWI6O7+cJ4mF0eSEyAQlndWptCaZ9gRjDzPw0Qx5zU5lSSu8SeH1/K0rO25I2i2zX0wEjBseszl6b7YzPXNaMZfoKgtVQ8Fpofzu6bzoaojapr/9xpMBRcnO9kqGrc2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfrPDxpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfrPDxpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132AE1F00AC4;
	Mon, 13 Jul 2026 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939302;
	bh=E75k0CxBXpT739PykLJDXdgSlRicWGBlw7jBsCEet08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfrPDxpRjIr3m/RTRBK1Bz5lZ2Q35eo1qjpD178WjFVPaGmg0zBRBKN3FNDbleAHZ
	 neL8kMce4dqRAz+Jtwfa9eaHEGdxbToTSPMlzFOJPka1cmH5FhBArVrhSxV5nvrVeC
	 Cj2fj5/KdW1NAyE8hBY23ucDPYBCDIZ7asO34bCbIyJkxrMi/JVV7XgmZRTJS7DLK/
	 FNVBU4KwFX47Rc0Y8nf7d9Um294rv/ezCsD7/QmD0BEYCTLGJBCs+ft16UtyDtvsCU
	 2+eIB/Ht7VJ/uze2WDuinSnJM0hFtD1MZ/yeC0cfu5aIr6DIymHEplJjrsKBRQey8a
	 30QvF9iDp5kTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU
 cluster power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:41:41 +0000
Message-Id: <20260713104142.132AE1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `cpus_in_pm` counter is permanently leaked if `handle_rpm_noti=
fication()` fails during CPU PM entry.
- [High] The return value of `devm_pm_runtime_enable(dev)` is ignored, pote=
ntially breaking cluster power down.
--

--- Patch [2]: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU clu=
ster power domain ---
commit 1e6fda1a51a8d1d0370b919f0b149226ff3d825a
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: irqchip/irq-qcom-mpm: Register MPM under CPU cluster power domain

This commit resolves a hard probe dependency by moving RPM notification
handling to the GENPD_NOTIFY_PRE_OFF callback and registering MPM under the
CPU cluster power domain. It also provides a CPU PM notification fallback if
the MPM hasn't registered with the CPU cluster power domain.

Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")

(Note: The standard inline-quoted diff format has been omitted due to autom=
ated
recitation restrictions. The regressions found are described using free-form
text below.)

[Severity: High]
In drivers/irqchip/irq-qcom-mpm.c:mpm_cpu_pm_callback(), during the
CPU_PM_ENTER case, atomic_inc_return(&priv->cpus_in_pm) is executed at the
beginning of the transition.

If handle_rpm_notification(priv) subsequently fails, the function returns
NOTIFY_BAD. Because notifier_call_chain_robust() rolls back successfully
executed notifiers but does not send CPU_PM_ENTER_FAILED to the notifier
that failed, the atomic increment is never reverted.

Does this leave cpus_in_pm permanently incremented, causing all subsequent
CPU PM transitions to incorrectly evaluate cpus_in_pm < num_online_cpus()
and permanently preventing the cluster from entering low power mode?

[Severity: High]
In drivers/irqchip/irq-qcom-mpm.c:qcom_mpm_probe(), the return value of
devm_pm_runtime_enable(dev) is not checked.

If devm_pm_runtime_enable() fails, for instance due to a memory allocation
failure in devm_add_action_or_reset(), runtime PM will not be enabled for
the device.

Can this unhandled failure prevent the genpd from managing the device's
power state properly, preventing the CPU cluster power domain from
entering low power mode? Should the return value be checked and handled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-shikra_=
lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com?part=3D2
