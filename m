Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533638;
	b=g1upAUNH5oSP8Y1oRmC3KYyR2jHeIZb+sz6Ik7YP2F1IMPb406VAiNSxp9fi5f2aDaEi
	 r7xJlcm4BcfWqM+Tacxmgn5mUtLhwkjmQjL3rQg6cDdzieg2PKngysWJb+C6MGnhbBaJf
	 /8ZBucSj3j9ToOj8yQ6o4ZFHNaLHoInUVlOEFRY1Ae+jVuRRIh+EUXT0siPpCOiFRf0HH
	 G0cr+ssFO0uvF2WxFXoJ/Sp98UaYiFifbHWhQWk6lA6GRUp9pJJxBjLgtkI4Pik/zXa1Q
	 FVhcC1vWBqcn5VP2zSmYEVmZgCtwwUjO6EO5GVljGT1vtBkApQzVwlFjS695srnjwpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uoh7dg63E82q3+ebfIK3PvhxV0FtQcqWOF0pfPzYoKU=;
	b=Jl6gJWnZ+IfDOr7eHLf/fNc+cpvg0pD5I2yfnpMwB7me3GMisYzVGTjbAMoXF1BsqRzL
	 Hi3bm1h+id8XmPCdZNNhTpIxBCOH0/xSzFI4SUQyQvXPOKCIwDtPNVGXiE2wNEPLS/D6Q
	 yyF4wud3CBzRYubmVkwkRz1si1hDqWYgnsxYgybFDu78/R52GDdUPrbNArrNFQB2onWNP
	 99E6KDOje/tN3Pvz0zTOb2kVkGtPAKpKCqT1m4gSJFO6VL98CGL8qDhRbfu8tqDr82dXR
	 L+x/MvWNDoWm+IXsK0O0H2n8Xg4+RukCrBuTQwcLjVnWmSl343KRBeqRaFDvSqv2fgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6oMxvgW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19946606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6oMxvgW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEA81F000C4;
	Fri, 13 Nov 2026 01:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533638;
	bh=Uoh7dg63E82q3+ebfIK3PvhxV0FtQcqWOF0pfPzYoKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6oMxvgWo1wiRe/SgBcikLS9TKANr4oioDsz88VwmNTKSikFNG4JT9zalmhbOlVn3
	 IiYzzEd+BL+he9ebeFnpSbRKKJR8j0hnnuq1erTQ4K6+vmdVRChNO8DpWCeEpyyMr4
	 cr83uvpypF23vHC9HGEQPhnv25sUOU4rPBBMoAwsVMJ/6gHy4DmwerM0S3oy/N+8tM
	 MrXYtoVOuOGfYQWh7O/tTcY3jtsZglmaulZZKw6q0hZUoPnMVSWyN3N/UvllQVDkpX
	 g37hHpWBdr20GemPE3NZ1NQYt+l3eFcwo7Gadc7MdfT4Mg+cbJo9tACoWTjXagAB96
	 gkJcSEXdP1SlA==
Message-ID: <sashiko-outbox-212064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-9-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-9-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:33:57 +0000
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
- [High] arm64: dts: qcom: handle used instead of real name in
  Signed-off-by trailer
--

commit 35567a569045cf43924fdde8c95265a9820a48bb
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add PM7250B thermals
>
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to
> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Should the Author header and Signed-off-by trailer use a real name instead =
of
the handle "erebion"?  Documentation/process/submitting-patches.rst requires
a real human name for the Developer's Certificate of Origin and does not
allow pseudonyms or handles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D9
