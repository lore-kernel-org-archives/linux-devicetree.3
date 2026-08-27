Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF744AB8A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834969; cv=none; b=YeqKzTZfHYFyaSR7UBhhYTX6ecXK5KvKgROpdwp/oatGg720AnQYs0Xes65v2CIJ8avwoIkvrwH8ICuNijeIm9O0x61xZzrJt9JnBvkxTJejKE2xpJbaaoOkG7N58aA/hKP7D8xUhj7sMz29SCFtIQ4ai5LjrM6qMLFH5Zh4cVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834969; c=relaxed/simple;
	bh=RT0ukWn/vp9pOynaHbI3yS48vZy8QqLYQcB+CKUFtCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0MERj5aV3tZF4hMRPoDUVv7zNndl+vdPNBV5keyuwKYueSKa0GozXNMA8DuRikLNsZCm6Fh9F8NzeY6g1VcVOMvFUwECxoJ6FBKW7B+kVRXjGI/vHsy+fLYXa/cKKmpObbV4CobNzVziMZ/C5uk5h9jc0ESukyVEo2NpEj1DB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnR3exHn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnR3exHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4071F00A3D;
	Thu, 27 Aug 2026 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834948;
	bh=RT0ukWn/vp9pOynaHbI3yS48vZy8QqLYQcB+CKUFtCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnR3exHnzXdBvk7EwVw1dQZjgvh9hCkTpd/dTdhF50rJGi+LrQBjZGj9rr6Ja2ky+
	 5vbKTVGhGjJiKHArM2QDWnOVh2DjBgExtWk286F4QWGyi0p1w9GflS9BZD3V+j8hey
	 Ylh4d46FZAD3n5JUGMIZk3DQ+Z83Q8LH45YBJiSileTAKuq89g7kJVrzD0FFt3C001
	 eMlbyvycqymU31k3GYTZBvW1frtRq/e6gyPWI5/pdeafpnVXoV5rMDhgJBoJ6m64BB
	 v24TZPRvmsoT/D23VtvOOAH9xMVawsbnDBfX4g1DgMPwuMUstDoqpcQalgkrxjLWL6
	 lw9z/MlirSZNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: dp83867: make exclusivity
 explicit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260826-v7-2-topic-dp83867-v2-1-a97b4cec6e93@pengutronix.de>
References: <20260826-v7-2-topic-dp83867-v2-0-a97b4cec6e93@pengutronix.de>
 <20260826-v7-2-topic-dp83867-v2-1-a97b4cec6e93@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:49:08 +0000
Message-Id: <20260827124908.6D4071F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Spelling error in the commit message ('nmvem-cells').
--

commit aca94911b8a130018e97c8fe36235a2d9d984b2d
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

dt-bindings: net: dp83867: make exclusivity explicit

This commit updates the TI DP83867 PHY binding schema to explicitly enforce
the mutual exclusivity between the nvmem-cells property and the output
impedance properties.

> Make it explicit in the schema, that nmvem-cells can not be used with
> ti,min-output-impedance or ti,max-output-impedance.

[Severity: Low]
This isn't a bug, but there is a typo (nmvem-cells) in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-v7-2-topic=
-dp83867-v2-0-a97b4cec6e93@pengutronix.de?part=3D1
