Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB40135A53
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787019141; cv=none; b=I2NUWwo5sbRLQH0JkGVIYtyTatRejawzFA4z3RGOtHG9btPSOtx5NGhO0uSo3t9ljqN4FCveKIJc2UmZxQtzOUnUeOkYP8LP54UEpvphUbJwM3NtRjOpoEFjsz4JO0WMCSPRHIgLy87uuRQXdEU+Pq9+iYVwkuSJjkSWWJA2P4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787019141; c=relaxed/simple;
	bh=ilVxbAEyPCdQeyT159ppq7juBlEw4p6vfYYryqNole0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VnuElrzDdpfxReaOTr/jS/f3lVZOdp4mUYR1kVKWC5c3CE4FSCqCc39uUtisB5eOJU+WHs9FqLdcfVb8JQzLlNDwWo9mD0HN0wpLH7M/fMJBNCAMglUsM7YnzFtdiI3l1OL392FoOE6DYp48ULYqfr5I5p4dgnIH6Z5O3tp7MSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD7sm3Ml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD7sm3Ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA4A1F000E9;
	Tue, 18 Aug 2026 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787019140;
	bh=ilVxbAEyPCdQeyT159ppq7juBlEw4p6vfYYryqNole0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aD7sm3MlsCsZVAYBe5iwRnyU6in82LmCTrmkdfYgYPHJu0L4JzuHqmw2heOCTgya2
	 XhBoHFqbjvWv8fGg+rIdzXKkRLGGFwowCqTbu1urzj/MPigUjoJ3LevGRxqwuFbllp
	 J+kfy7HF0Ekh5wDhxo1S0iLZ8AxdEEiMVW9l1fs4XYShKjle3F1+WCFZjKio8YbRbi
	 wcPPW6Zp0nNzTa8G5an1vyuq4PSkGjBhqS3kXqJ3PapYlhZsShTclkeResfCHPPPfr
	 FQl/fIWQ/zLXdG5zEYgdrb8hEdPryLjc2tZBdU3JD5ssdZohTlyr30O/Is0/bPlyHx
	 +tFGAolrCQugA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add right justify
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xin Ji" <xji@analogixsemi.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260818020559.961335-1-xji@analogixsemi.com>
References: <20260818020559.961335-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 02:12:19 +0000
Message-Id: <20260818021219.DCA4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding a vendor-specific DT property for audio interface format =
bypasses standard ASoC DAI format negotiation.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add right just=
ify property ---
Please note that due to recitation restrictions, I cannot quote the original
patch code directly. The review below is provided as a free-form summary of
the findings.

commit c7f75f4b785470ba45b421324266273f5142da0b
Author: Xin Ji <xji@analogixsemi.com>

dt-bindings: drm/bridge: anx7625: Add right justify property

This commit adds a new boolean property to the analogix,anx7625 device tree
bindings. The property controls whether the driver enables the audio right
justify function for the data stream.

[Severity: Medium]
Does adding a vendor-specific devicetree property for the audio interface
format bypass the standard ASoC DAI format negotiation?

The standard hdmi-codec framework already supports right justified formats
using the existing DAI format structures, which are normally passed dynamic=
ally
to the driver's hw_params callback based on standard sound card properties.

Creating a custom property like analogix,audio-right-justify-enable hardcod=
es
this configuration statically in the devicetree, which creates a permanent =
ABI.
Should this driver instead rely on the standard hdmi-codec API to handle the
DAI format negotiation rather than introducing a custom vendor property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818020559.9613=
35-1-xji@analogixsemi.com?part=3D1
