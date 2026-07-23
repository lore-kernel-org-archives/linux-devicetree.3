Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAB1AAE28
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775368; cv=none; b=YHLHbxd12DucjE5rrsvQfEOuc9JC8EhcUAsQAqmgx0qasxAF8QYxOwWgpT7jHtZRhrd0/n3gg3ApG2NqDx7II92u8DNq5kq/a4R21qgARkvy8JEOdYfQPUbI6DR7DKsHw1f+0v1sKjg9fnu89MCqqt/lNFSGt3kukdcQcODajb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775368; c=relaxed/simple;
	bh=n5H6rrGoFgFJMst8HR/YoAj+7p2EfL2HVt34Pw2oPOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=skWndA2FI+eLHZxXyY57bwNxzMB0eK4t1mDlzbejUEDokgoCIFgxkju1q4YH/5C+xmM0WT8Tl5Jvp92iWYBpMiRArexaOFKAH6RVaNcoEMLp/ZX/gKo/PugzItLso836oE/tubRkE5KZHNza7lrr7ew1a4ioQfOG/Cm4ljTP79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1f3p1Qs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1f3p1Qs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF291F000E9;
	Thu, 23 Jul 2026 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784775367;
	bh=PwOPByokvk+cgsRCo1YBv217/8IuphNvRes1RXm/Hd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L1f3p1Qs4RhEFqU9Wj92J/Q3H6TGWoQtwZt/ZJgJXPKUiNSKJV0wDnnK6yqrsmAt4
	 9NUcn4N+LLV7HkaLx2bFAid1cl+1CWlVE3rf86fpeOIhGf4rJhlO4YvuTza1G//hXY
	 6WVLyMFIu5P+JhbqTHJmxPJbVpsjUXIZ9kze9z5Sm1tMeFMRz426jqYKGbqju9dE5d
	 Loy3vRBWyYlPMlWkOWKj+L1KUSvZ+cBOSFclKlOWoh72GVPcnzeGbmODPex6jopc53
	 IzIRkvYRU+AhUOtVkwS3rPPvMe7D94DPJsX3mPbwT1h865d9sjOUtUpojdzfbeMFVg
	 BzTTd/dEMikpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: tegra: pmc: Document
 Tegra210B01
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-t210b01-pmc-v3-1-1c5b970788f2@gmail.com>
References: <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
 <20260722-t210b01-pmc-v3-1-1c5b970788f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:56:06 +0000
Message-Id: <20260723025606.ABF291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete documentation of powergate differences for Tegra210B01.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: soc: tegra: pmc: Document Tegra2=
10B01 ---
commit 4ee623d1a1b305589950060beca1ad845d9ac09e
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: soc: tegra: pmc: Document Tegra210B01

This commit documents the Tegra210B01 SoC in the Tegra PMC bindings.
It notes that the hardware is very similar to the original Tegra210
but has a few powergate differences.

> diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-p=
mc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.ya=
ml
> index f516960dbbefb..8ec36c49f9594 100644
> --- a/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
> @@ -18,6 +18,7 @@ properties:
>        - nvidia,tegra114-pmc
>        - nvidia,tegra124-pmc
>        - nvidia,tegra210-pmc
> +      - nvidia,tegra210b01-pmc
> =20
>    reg:
>      maxItems: 1

[Severity: Low]
The commit message mentions that Tegra210B01 "has a few powergate
differences." Should the documentation table further down in this file
under the powergates property also be updated to include Tegra210B01?

Currently, the Devices Applicable table does not list the new hardware,
leaving device tree authors without a reference for its valid powergates:

        Name     Description                   Devices Applicable
        --------------------------------------------------------------
        3d       3D Graphics                   Tegra20/114/124/210

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-t210b01-pm=
c-v3-0-1c5b970788f2@gmail.com?part=3D1
