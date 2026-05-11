Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C652701B6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535027; cv=none; b=J0p2Sbgp7uCWnI0axza8NJKeX3aEl5A9AH4N/72SW7/amnVF1u+oK21R/iMp9iwlduVhrkm3nu/V40vA7Z+yE2XAD9vACp/ZGuuEOlMLEiAvlCgVBz5+OgQJsiZm4GCjb+IpxwFxYUFkrxZvF1GikEXodYP/NQ2bbO4GfwA3Bbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535027; c=relaxed/simple;
	bh=NUdyQQqfrxJQpH03RAiM9KO4H+JYtzW+L+T1+8TjnFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OqD7GFJKrlMTZTx3Zxn/+p4im6/nb6ZJZ7IaIWd8ZxxT/SfUGzVRRf36prTEFWHvIps4Ekm1Sj6i6aIBJA2zCdwfVcxrGt2neXba0eMJKHWMXhkLcgJHYfpPp0CG8iUU/H7mYsubsmiPkHHhO3xJRO2fmHQX1VrJIlFvQ4QLq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOGkVtxI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOGkVtxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5A8C2BCB0;
	Mon, 11 May 2026 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535026;
	bh=NUdyQQqfrxJQpH03RAiM9KO4H+JYtzW+L+T1+8TjnFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BOGkVtxIRk5CSm4omywfipYEw5PelNL5Ud/U2EtBoJNpZWaW2mG96aoSgJ8K75H7V
	 6l4zaUTtzbamG5ki7jZalOiVYGTHrefJoJRi9fSLlP9VVDMtTUNqmcLuYVs3QTrLGP
	 P+GjKj7wK42yYpF9hoET9Fp/T2nI1IwDtnMDFFkp0bt9Dv18h6oWurm3++3xJet/zQ
	 R2QQvctbfT+rCyTM+3MZroZ41/P2Y9FM0/hcyK6CASZupBfVlCncfQ7fUrGFWg7gv/
	 tpDBhd/CsuKracidkgzBR+zm1/IdqWJzV8sG19HGtt7+a0q7cUhVP8t9n0qQWZcR2K
	 qYm+PDcCp5Pdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
Reply-To: sashiko@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:30:25 +0000
Message-Id: <20260511213026.7F5A8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly describes the hardware change and=
 target SoC.
--

commit 6c12757bc070dc9476878d0e08e22e28437d957d
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

arm64: dts: allwinner: a523: add gpadc node

This commit adds the General Purpose ADC node to the Allwinner A523
device tree. It also documents successful voltage testing of the ADC
channels on the Radxa Cubie A5E board.

> Describe high speed timer block on Allwinner D1S-T113.

This isn't a bug in the device tree changes, but the commit description
appears to have a copy-paste error. The text mentions a high speed timer
block on the Allwinner D1S-T113, while the patch actually adds the gpadc
node for the sun55i-a523.

Could this description be updated to accurately reflect the gpadc addition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-sunxi-a523=
-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl?part=3D3
