Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA83803CD;
	Wed, 13 May 2026 01:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636025; cv=none; b=uO0dWp5TcDHxQiKOZNCCXcoONa5sF2Gx8FUFG+dA68Si/KtUP9QWdxE95666Lh49nugFGH6Ft6k+v1iNBDYa8DBlOz3u9xrdd42cGOaNY5S4aROiGMVd5ROZg+BrFFwUqbr/F0KaEuHnKGIrJJUbeu87J9seCiIlSgEbTYc05L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636025; c=relaxed/simple;
	bh=zGVv9uG4G5sQPnwZQcu5H7meSqJvyo8As7wJpgw/6zo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GoLCz4dPxM1zenyR4zavIMpOm/IV0ZqpyO9UhoZaXOjFCJrCzolv2Ct9S71p9Rdh9KWb/uYPP/AvJ2i7amI3YC5KqmfT+2GpmvDcij2gbzKBQCUmAd1hz2uXTXVncBG60z3VFYndNw3ifkZycX82i+M9WrHEV+H2SHkSYE+LcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VBUbbNJH; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VBUbbNJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778636012; x=1778895212;
	bh=QSW8aSab9/wztxqArft5t7mYs/SZVX6zIZoNrOAhfQE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VBUbbNJHbXfkyDlAAQt/OR64Ovisxah5UhmREMnUYtdVchpdYnVvaYZEW6sjDtTum
	 KeKp6ATft0mkx3bobddfdFsYbH35E2kG2VuZkDDZ0wCA3S6gItw6GJGIaekfZZzELu
	 1zrRhJA/D9ThwrC0AeTo+QMInn7IE+H1fbaf9LkcGfUQG9YU+Moe8S69w9B2maDxY0
	 JiKX1Qu+fc974YP8czr0WUkjg6D5j5mD6kxRS1i2j3/7dHHbvEgKyMAHUfA1R6pCHt
	 JP0d82bfk5LC+cdvhAUH6FCHS92ae41Ia4yzD/6J+tO5l6LxoujS7qUCH2RQShSwfp
	 XE/UKKgaHpD5g==
Date: Wed, 13 May 2026 01:33:27 +0000
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Message-ID: <q2P-fl0-Y-qp3p1j6PRmUd5xM92-IslEfMGk9rFS_n82-beFGjS3MfZ8J8frpp17AVDYuOiJ8IzInsAE7cAotKSF4JP0LwgCXC6ET4eI_dU=@pm.me>
In-Reply-To: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com> <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 7d9253e433b1d7f42db132b57d13be0a5dd29259
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, May 12th, 2026 at 8:32 AM, Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:

> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
>=20
> The existing PM7750BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
>=20
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Was wondering if it might be easier to do something like this instead?

eliza-mtp.dts:
```
#define PM7550BA_SPMI_BUS &spmi_bus0
```

pm7550ba.dtsi:
```
PM7550BA_SPMI_BUS {
    pm7550ba: pmic@7 {
...
    };
};
```

That way you wouldn't have to duplicate entire file, but don't know if this=
 has
already been discussed previously.

Thanks,
Alex
