Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19427429CFB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387729; cv=none; b=AfpJPIAjiwGS4Z+VtRBhiWyIltX5wNcu21s5zzXG0CKdCeBeY9ibMOx2+TPVx07dHVIZNLQ7S9yyWLy1HSI7wmOUs5qFa7EeyRXv0wtQzS2fafw+R7/j8fw9URmBuNHBCqNThu9pGXvoss6sU/ueJ6iZiOzIwIumBTuJZMzAKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387729; c=relaxed/simple;
	bh=5uV1u5qZTq2tJdiLgpV+NIBb2zwL+3RXNPnZt7zBesI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p/ppjuTIS2dI924aHlwJ3E+iq/cZSNAo/XsEv1gzfZuhhk2/+w3f2RLex26+uc1ODy/SXboafCeZfQUsycuO7MMGd3H6Cznr7vvjA3JVUvyQK8AvtY1cCSYCOAVLiTCUE651h95yC+rGLfW/M9YWa/KVqy21CPUy/DremOzpWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJtDHC+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJtDHC+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1331F000E9;
	Wed,  2 Sep 2026 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788387719;
	bh=S6fFnsfheTsXens1WV1iHbHj8rafFsEcHuSMSI2MT0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJtDHC+Ga13H7pKipQBRwqGVdhEvHtzgM62V6Y5seyiF7ro5VVuAga7Rs/bMznYM5
	 OHJzuC3hDL2F4ieBSzANvvcaMg84Rq5JSDML/++q/VzZWHvdTi9QXSrveBUQO1aaAR
	 ueVz7FKWv8CXq3SQVyOQK62/tODFpTufkpL4cK/4ultsy3qlQFX94GEFdPfTVdfvAp
	 GMu4c85EEJvTlpZps/gRD/bhIZ+axWyfaR5E/osUhEs51q//I6rqpURgaaT6BgzCtl
	 NOjITYVwIGm4LJi1v83uToy8Y/kXyR4lhBcLH5rXUO/8PjXlUtFJGrAoWLdyUVMLwL
	 pV0y6TkVkEFFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: tegra: Move Tegra210 AHUB audio ports/endpoints
 to SoC DTSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Ivo" <diogo.ivo@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-smaug-audio_ports-v1-1-d4605332d8d4@bootlin.com>
References: <20260903-smaug-audio_ports-v1-1-d4605332d8d4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 22:21:58 +0000
Message-Id: <20260902222159.5E1331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch moves the AHUB internal audio ports and endpoints to `teg=
ra210.dtsi` to share them across all Tegra210 boards, but fails to remove t=
he identical redundant routing definitions from `tegra210-p3450-0000.dts` (=
Jetson Nano).
--

commit 583871624e297ed1aca069075c249e3cbd7ee179
Author: Diogo Ivo <diogo.ivo@bootlin.com>

arm64: tegra: Move Tegra210 AHUB audio ports/endpoints to SoC DTSI

This commit moves the AHUB internal audio ports and endpoints from the
tegra210-p2371-2180 board file into the shared tegra210.dtsi file. This
refactoring allows these definitions to be shared across all Tegra210-based
boards.

> Move them from tegra210-p2371-2180.dts into tegra210.dtsi so
> they can be shared by all Tegra210-based boards.

[Severity: Low]
Should the equivalent redundant routing definitions also be removed from
arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts?

Since the endpoints are now in the shared tegra210.dtsi, the Jetson Nano
board file currently retains duplicate definitions. While the DTC compiler
merges identical node paths without error, leaving these behind bypasses
the benefits of this refactoring.

For example, the board file still has redundant endpoints such as:

i2s3_cif_ep: endpoint {
	remote-endpoint =3D <&xbar_i2s3_ep>;
};

And redundant port definitions such as:

xbar_i2s3_port: port@c {
	reg =3D <0xc>;

	xbar_i2s3_ep: endpoint {
		remote-endpoint =3D <&i2s3_cif_ep>;
	};
};

Would it make sense to clean up these duplicates as part of this patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-smaug-audi=
o_ports-v1-1-d4605332d8d4@bootlin.com?part=3D1
