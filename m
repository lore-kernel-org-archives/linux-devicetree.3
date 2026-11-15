Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782340;
	b=qF5q7FwLdV/nvKIe/aV4yiX7ouPL0MhK7WTeKucWwF6FMHfgBGTW7MzSXrHC7UkNvG4K
	 yq9RUuyemY1MjpdjVdjlMU13tSlw0Qe4CgkqcefZDtH1ixfpVViGHrfK2mL7+BmiAmYuW
	 oBcyMmkCDsbFIlgqq6FRk37Myiy6oPZyLwzizIvzIPrzLq4tjis0x2W7FHaLYyBFFO1yc
	 eEmXWcoNqOMFWvyjOED06BPSQmLjMD6XV2Y2N4N6ANom+5g9pUcjK0X3lxbmmwOL4vccs
	 9vmX24mVqhxXIif/gep6lq8XOqcj+yKMtykJlB8t9WiMw1FYO+bq4SSuYzybFELnAqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782340;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XHCHy7OZT1R7rA1bR6Z09vKuX5lf+lW9UUs1aEHAANc=;
	b=u6o95GN0jQUCFzZfvjLFkfx+JfPUN4shXwidZ7qUnpKIh02hKf2M7WsIm1cIkpIL08Wv
	 kJ9P2fYf5hOCe4tulZkzk0CLRNzt62n4U/RQsxZv5mcXXNTW2PxztRJbTI89JZN6z9GAy
	 7O5ffYeRTLyM/a/q3rQP4poI49vkrtB4BamNjcy9ZvLotBuPaCsp+/qmSSxFmGMaBw/o/
	 jVhJyYDxrjyC/7hwWjlBzr0BAF/aQs5Nn5jD2chbN/Fy051caw0JSHg3kNGuWk9AyyCbb
	 fhfDD0bDkCwqU9t250D7tW9mJ6/X8AcKsToOtvCvfNK98Zrc/3x9f9Hoxzh6r1LoeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTzZDrlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18B606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTzZDrlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6611F000C4;
	Sun, 15 Nov 2026 22:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782340;
	bh=XHCHy7OZT1R7rA1bR6Z09vKuX5lf+lW9UUs1aEHAANc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTzZDrlIesTx2iKsw8278wpqoH+Sm6pF8mzI8qXOKVp1lGQ5qEwQagapn4W0cbwCa
	 oHXNSdae+5MPCec9u9z9+qYu1xEmP8z4NzAcUcnmjaNat+XSrWLHiUendaGveRaQEZ
	 a/lW0HgJ057rsoHNKddQeKvLC2eTBwN+gzMIg2z8nuAAX85d8U1OkRNlgKZoKEys+b
	 NU1NW9X7L3t3SvRYZDyLJj1mR2+NqAZzM0j8PktLyuoVazRBx9n3fCrAx4JKecYbPS
	 5UKjUUGb0coae/d4py7hXGX2KkMyJfUPQDvuVmdwHKLiC7d9ujrXbaOGGxwkjIjN2u
	 hyw5NdmqceebA==
Message-ID: <sashiko-outbox-215883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: amlogic: axg: Add ranges to periphs
 pinctrl node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
 <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 22:38:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: amlogic: axg: commit message omits aobus pinctrl and
  explanation
--

commit df9ef90a65237fd0736035350fd16e31683b3d10
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

> arm64: dts: amlogic: axg: Add ranges to periphs pinctrl node
>
>   meson-axg.dtsi:360.33-1262.6: Warning (unit_address_vs_reg):
>   /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg
>   or ranges property
>   meson-axg.dtsi:1609.30-1716.6: Warning (unit_address_vs_reg):
>   /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg
>   or ranges property
>   meson-axg.dtsi:360.33-1262.6: Warning (simple_bus_reg):
>   /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
>   meson-axg.dtsi:1609.30-1716.6: Warning (simple_bus_reg):
>   /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

[Severity: Low]
This isn't a bug, but the commit subject only mentions the periphs pinctrl
node even though the patch also updates pinctrl_aobus (pinctrl@14).  The
commit message body also consists only of the raw dtc warnings without
explaining why replacing the empty ranges properties with explicit address
ranges resolves them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-fix-amlogi=
c-dt-warnings-v1-0-94cbd67a32ea@aliel.fr?part=3D3
