Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C51B652E
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800842; cv=none; b=bJYdjUpRwA2koa2KSu2ZiNrOBQLUY50W7QEkos/co5OKd+nKZ9LGo/w8bGT1omO8ThoqwWW+ad7+J4Tc3xV9/JgLCkey3il70CIZr4oUsa6xlpKyx638VOLbpXpeDx2pMPpdqOP4vam0C46DYITey4XFPieYvLlTp9NRDl/OYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800842; c=relaxed/simple;
	bh=vObI5RIDdwS5X+zFE7HhVBI6tNMVCJH9ycVj+iH2xYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V0QjNXdQDxMwpVDfrmbEh/mp5ALTMIV11huD/SpuEAHlheIrjakzQygE+M57HEodPWjWze2QclsMbJTjSrlD2Ar8lzmDmpyYPrRfpXSitOTpFK/f7SEWNq9XZBk4lBK/UWCfuGgsNbTAMy6INcb7j3DCcSYmBDnjbAIkxWm4vL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqR81mWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqR81mWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF2B1F000E9;
	Sat, 15 Aug 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786800840;
	bh=EdnXtvI11B6mTOLHJgzEOnhJLFB662Jj/4lSIknyzVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqR81mWX3rI950zsODuyDlX+ZRMxuwmr0TKDmp3CO80+Kny135QX7eKsdMLZAiEg2
	 KaqVkbDWiMCWlIPgJxNYxXkoH3lsBQNv0LMvSAXhQ9lmttsapW16aB7aFHqY+4RgY/
	 E/CYAx3tbDxzISWLWkRcudq4zHhXneNPvZQ6yjN38cL3aJJQMOIMJw/WFWlPNdkgHK
	 193myilYg+zmeUW2z9GV6wGUpA/D1vGfAZaXg9p55QHqTcz/q7ounAhyeEwimPCK4L
	 lmW38L9eanlpN2wz7/PL+H+alVSNwkM6ogbYWroKWnzpPw7WdmToP+Q+HFYa137OC1
	 20oAiBCDaYwiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] remoteproc: qcom: sysmon: Suppress notify between
 cluster siblings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260815132541.1575121-4-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 13:33:59 +0000
Message-Id: <20260815133400.5BF2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch's fix =
for the QMI timeout is incomplete. The patch adds a cluster-based suppressi=
on mechanism in `sysmon_notify()` to prevent QMI timeouts caused by peer SS=
R notifications between remote processors in the same cluster. However, it =
fails to add the same suppression check in the state synchronization loop i=
nside `sysmon_start()`. When a remote processor powers up, `sysmon_start()`=
 iterates over all already running instances and directly calls `ssctl_send=
_event()` (or `sysmon_send_event()`). If a sibling in the same cluster is a=
lready running, the newly starting processor will explicitly receive a peer=
 notification about its sibling. This will trigger the exact same unhandled=
 QMI message and timeout the patch intended to fix, making the timeout pers=
ist depending on the boot order of cluster members.
--

--- Patch [3]: [PATCH 3/8] remoteproc: qcom: sysmon: Suppress notify betwee=
n cluster siblings ---
commit 8023059af35265ed9a7ebd6a255bd4e8dfa00c5b
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom: sysmon: Suppress notify between cluster siblings

Firmware on clustered remote processors (e.g. Nord's HPASS ADSP0/1/2)
cannot handle the SSCTL peer-shutdown notification sysmon sends
whenever a sibling in the same cluster starts or stops, and the QMI
request instead times out.

> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_s=
ysmon.c
> index 61e1038328e83..5d4443ef3bc18 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c

[ ... ]

> @@ -500,7 +502,8 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  	struct qcom_sysmon *target;
>  	struct sysmon_event event =3D {
>  		.subsys_name =3D sysmon->name,
> -		.ssr_event =3D SSCTL_SSR_EVENT_AFTER_POWERUP
> +		.ssr_event =3D SSCTL_SSR_EVENT_AFTER_POWERUP,
> +		.cluster =3D sysmon->rproc->cluster,
>  	};
> =20
>  	reinit_completion(&sysmon->ssctl_comp);

[Severity: High]
This is a pre-existing issue, but does the patch leave the QMI timeout
unresolved during power-up?

When the second processor in a cluster starts, sysmon_start() iterates over
all running instances in sysmon_list and directly sends them events:

drivers/remoteproc/qcom_sysmon.c:sysmon_start() {
    ...
	list_for_each_entry(target, &sysmon_list, node) {
		mutex_lock(&target->state_lock);
		if (target =3D=3D sysmon || target->state !=3D SSCTL_SSR_EVENT_AFTER_POWE=
RUP) {
			mutex_unlock(&target->state_lock);
			continue;
		}

		event.subsys_name =3D target->name;
		event.ssr_event =3D target->state;

		if (sysmon->ssctl_version =3D=3D 2)
			ssctl_send_event(sysmon, &event);
		else if (sysmon->ept)
			sysmon_send_event(sysmon, &event);
		mutex_unlock(&target->state_lock);
	}
    ...
}

Because this manual synchronization loop bypasses sysmon_notify() and
directly calls ssctl_send_event() or sysmon_send_event(), it misses the
new cluster sibling suppression logic.

If a sibling in the same cluster is already running, will the newly starting
processor explicitly receive a peer notification about its sibling and
trigger the exact same unhandled QMI message and timeout this patch intends
to fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815132541.1575=
121-1-shengchao.guo@oss.qualcomm.com?part=3D3
