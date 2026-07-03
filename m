Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD2385D6A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061200; cv=none; b=BYNpyEPRQccBu4H/4bGiX04BwMn3nY1wE0ZKDM6pCiunBnvjuCkOrV2JpcOdHPnBeL3OLfDFzbsTtzZxbJzmxAlVrjc98160lfBCzpVv1VXSJ4Eexth7j5kmSJHDc3ifxNJsjhRVzAtnYdOxlc/C/e8Fw+Xxr9X2eCy5XHmZnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061200; c=relaxed/simple;
	bh=QlltOLosWuxYxAS1OyGKVXwfv4cwNcuR8IueM2HLeHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M1dp4veYNTIgW26jYd1S89K/G5VzepVFHOKrfZCpCCdgNuF+w/l3RfD+wlJ9af04qiLjJYgnZ7Za8aB+DfySTFo3wHraBIboRjBpI9Zdqm1xBScGVoWszPXYh7cEq0fbGfaMOX315YMQ4UflMrpzxbzz7h/KbLnguBH4g30cfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGM5ebf8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGM5ebf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2367C1F00A3A;
	Fri,  3 Jul 2026 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061197;
	bh=QlltOLosWuxYxAS1OyGKVXwfv4cwNcuR8IueM2HLeHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGM5ebf81eRFIxatX85w9IDO2+vNL8jzvZzyZt5Xb6pi+UAOLEKkOXqi2hMPNbogd
	 weiDjTUmJcX+iWLlp7QrijEdlqUQ1BBikpY49vaUBn+FuOUg+pliFM6uBPCDOsA0iu
	 52QeGBXv0ufo4bipymNwaBTNn97bOHidc/1ZFrDtl46/CWdZXsTkNLQKoFj/ypohPa
	 W39LGfXyUP3P37V86ZWQsdY5Wruh+WyeDoMo6J5aUoZMKk49K5jasUP/9Xht5nY9A2
	 CwdsMzxBHTJiqg6S7KlxDUx/tiT+IoEdSRIl5N4ZwjKbeQ1bPZznFeNzNxaAow+NRP
	 9TcVdiVku4H3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-dsa_lan9645x_switch_driver_base-v8-4-90228d8bba58@microchip.com>
References: <20260702-dsa_lan9645x_switch_driver_base-v8-0-90228d8bba58@microchip.com>
 <20260702-dsa_lan9645x_switch_driver_base-v8-4-90228d8bba58@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:46:36 +0000
Message-Id: <20260703064637.2367C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Traffic from standalone ports is completely dropped in the datapla=
ne, preventing any network communication.
- [Medium] The tail-drop watermark (SYS_ATOP) for the internal CPU port is =
left uninitialized, preventing CPU frame injection from using shared buffer=
 memory.
- [Low] Redundant identical register modification in the CPU port initializ=
ation sequence.
--

Note: The format of this review is altered due to automated recitation poli=
cy
restrictions. No original patch code is quoted directly, and the review is
provided as a free-form summary of findings.

commit 6d3e640051eacab0f47d2250812bfddc2bc0f9e8
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Subject: net: dsa: lan9645x: add basic dsa driver for LAN9645X

This commit adds the base data switch architecture driver for the lan9645x
switch. It sets up the port modules, internal phy connections, queue system=
s,
and phylink integration for mac side configuration.

[Severity: High]
Will traffic from standalone ports be completely dropped in the dataplane?

In drivers/net/dsa/microchip/lan9645x/lan9645x_main.c within lan9645x_setup=
(),
the source port masks are initialized to zero. For standalone ports, this
mask is never updated to include any destinations when
lan9645x_update_fwd_mask() is called. Since unknown traffic is flooded to t=
he
unicast destination mask which excludes the cpu port module, and the source
mask prevents forwarding to any port, does this mean all normal traffic
received on standalone ports will be dropped instead of reaching the cpu?

[Severity: Medium]
Does this iteration miss the internal cpu port module?

In drivers/net/dsa/microchip/lan9645x/lan9645x_port.c during
lan9645x_port_set_tail_drop_wm(), the code uses
dsa_switch_for_each_available_port() to configure the tail-drop watermarks.
This iterator limits initialization to the physical front ports, leaving the
internal cpu port module uninitialized at zero. If the cpu injects a frame
that exceeds its reserved buffer allowance, will it be immediately dropped =
by
the ingress tail dropper because its watermark is zero?

[Severity: Low]
This isn't a bug, but is there a redundant register modification here?

In drivers/net/dsa/microchip/lan9645x/lan9645x_port.c during
lan9645x_port_cpu_init(), the code modifies the injection gap size to zero.
Two statements later, after setting the injection group configuration, the
exact same gap size modification is executed again. Can this second redunda=
nt
bus transaction be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-dsa_lan964=
5x_switch_driver_base-v8-0-90228d8bba58@microchip.com?part=3D4
