Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B113642849C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827829; cv=none; b=sQUI0MRDCdjJeBPbKpxBh2bX6rttK3odLXR7QdgqiEAktgzaKnVV0uiHLa17xwOSSx7JIrHwcliAkgpEdcKWYlcN5GuskHjYkS51orufvatoioT37bPp0Aq/i91xvTACj6XpHTnyqp2TV5TaG+fF7bQQqC47oSu8o57rACWL1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827829; c=relaxed/simple;
	bh=0N0fCo0Zm4CXVNYEpjzIkDjBoU/VoXWP8OwDcbbwwjU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jb27tY1YivWqbdWXt2rG7U6VvBHBw9u97+I/1/xiu7S7UKBW0EtB8A23NOEnOI6FCqwhMNTSxPEKatLucjpSJJejz/96NcXnhyDWRbd6SvSNToWEbqdRUVeNi1Fl8YrKvZZI9O7oqU/vMKnmhazjtrqHKQwzYqrS/qWpYrcvTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3nl+/aG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3nl+/aG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25C41F000E9;
	Tue,  4 Aug 2026 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785827828;
	bh=0N0fCo0Zm4CXVNYEpjzIkDjBoU/VoXWP8OwDcbbwwjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g3nl+/aGcFK3vtnCaq1/igYo3Fe05emjEZx4xLsGKgUleKYB6MxJEOprEUk3lnwij
	 8oTlQuBha3tAmQRIKXyGdAGfiRJqKWL9NYz7ngLCbqlj/gPsAa+1uxMF3gG0YZjpvu
	 IpErZoSsJVxOo/jkquPQhkdwmhkvP41R5JpXf6hgCZq4UA+8y0FUCpGL8XPxdTl/F+
	 eLDctvqNPy3cCDNmdMB39aVoY/5VzCxS2tYqOV93UcTqGc1F04PVQhBfK9iUTlPVbA
	 oc6sxRuXrlSPhD2teS6ycuX73ARudIxsqLNMvKFxTJIafgGMk02LJLEL288EE/V95E
	 pua2fLwJ1SUbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804070307.117119-6-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:17:05 +0000
Message-Id: <20260804071706.E25C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch: missing TDM slot pa=
rsing implementation in QCOM machine drivers.
--

--- Patch [5]: [PATCH v7 5/7] dt-bindings: sound: qcom,sm8250: allow TDM sl=
ot properties ---
commit 068c68db6ac28d3b45bf5901b4f8efe15a3d6ae6
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

dt-bindings: sound: qcom,sm8250: allow TDM slot properties

This commit updates the qcom,sm8250 device tree binding to permit standard
TDM slot properties in the CPU and codec child nodes.

> The QCOM machine driver parses these child nodes to configure TDM slots
> on the active CPU and codec DAIs.

[Severity: Medium]
Is this description accurate regarding the machine driver's current behavio=
r?

Looking at sm8250_platform_probe() in sound/soc/qcom/sm8250.c, it calls
qcom_snd_parse_of() which parses the DAI links, but neither function appears
to utilize snd_soc_of_parse_tdm_slot() or any manual logic to extract the
TDM slot properties.

If the machine driver currently lacks the implementation to parse these
properties, will the TDM slot configuration specified in the device tree be
silently ignored? Is there perhaps a missing patch in this series that adds
the required parsing logic to the machine driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D5
