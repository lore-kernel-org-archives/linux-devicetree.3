Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082179;
	b=RJRepWObmsOsVMotm0aUImMYLhIDZ4EosWM/BtrUqoKTHk0El8JJz//ipXvn4sdaa7Cx
	 nGj/qj4Vj1SsZ4K50yh19z/rce2BL1UqPLdv49tSmlz0SJl7buqVfUn+dsPmLtPeav4RI
	 p4sIh+8b9zVtFSdYUeRFAk0g9NfBBTJiaYsEPQKcd49c+ehxyjs3URV8U2GtzPu1pmgSG
	 U419ijo4gY8nL0jupbXmuYVnFfgPKoUeCfFmAevEodSIbtzZvW6mh7pA1gd1oUf/C/rre
	 dPHBloEshdT0dRefPj0p4V28iL6zFYRszPaYb7N55PHb3xqeuxQlV5nhTxWifw7499g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JQzROOwBklpdXWzZIaVgnkkhZtMsbZT4ouTTlv/sgSc=;
	b=QTGyDbRYBsxYlgxr6rJic3FPWzD1FE5Fl5EyuD/rkyOMosQNw4geA+baBFdOta3zLJ7a
	 EaOya92J+1JGxgWQJNuH5rXqT4x6FIyqAYZJU63ib2nfrXcDLfDP0GeCoatbJFmktQl6L
	 WIAMKGSPrgT7b70hD06Un5MK+Alrt1URlkyCzThBclZpHo6iRKHaVxQlngu4qoH3FVYXT
	 UzUrmBJ4UFMiouCTRW9Fs5m9Q+3MpEn7xPaYsL3x9xzI2SlAvzBdmI06wDin02XNx1Ca3
	 BGZxiNokaHMmJxkEIXUdtLWqZ3xwLU6PtRFIuMylRVS0EpgKTh9B40ZcB8SAEofnQkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2nvs5Ip;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E508C606A33E
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2nvs5Ip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DB81F000C4;
	Thu, 19 Nov 2026 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082178;
	bh=JQzROOwBklpdXWzZIaVgnkkhZtMsbZT4ouTTlv/sgSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g2nvs5IpiNjQ7N4brRWCRtgj2npcLxIZS23QQr1bJPvoYcOLFSPdAe7uP8NM9HsHH
	 X2WLWZMC1yuX6gwitY0DXeSAjg8Bttp/aIdAZ63RJzAOD1SJd8P5GVmVWbBvDFif1O
	 jS43hLkxKlrU1BTCQ2BjbGZuw9i/Q4ZWrq9a9WNjUEX7CQBhTEDJyO5xrD+SGqGld8
	 +ipQkAVzrIIaHkHYpfgconxUXcFPQiHxB4HAirErlXSkg3At5xnu4yZUCNY3EVqEp7
	 z3mSjyb1VJLZfuzc3Qf3R5QKcPLAcLkiGAw/9JFruesUjdFvAAGo3PD1TghGZX3twQ
	 RF9mIqOnnJvbw==
Message-ID: <sashiko-outbox-222883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:56:17 +0000
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
- [Low] arm64: dts: qcom: missing Fixes trailer for DW9800K actuator
  node fix
--

commit e276ea5d27a32b9dc0ddd0532e1d65d1cfbc8d91
Author: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

> arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support
>
> Update the node for the DW9800K for correctness.
>
> Now we correctly select SAC3 mode and enable timing-control with the newly
> updated device tree bindings.
>
> This is a breaking change for a part that was previously functioning,
> but only due to manual register writes in the driver. Now that we have
> the correct documentation we are able to update everything to ensure
> functionality with other devices using this part.
>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

[Severity: Low]
This fixes the DW9800K actuator properties and pairs with commit
"media: i2c: dw9719: Update DW9800K driver", which carries a Fixes: tag.
Should this also include:

  Fixes: 1cf6be79a865 ("arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam=
 actuator")

so stable trees backporting the driver update do not miss the required DTS
update?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-dw9800k=
_cleanup-v4-0-df26c431595e@fairphone.com?part=3D3
