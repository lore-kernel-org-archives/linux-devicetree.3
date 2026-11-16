Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869748;
	b=gVrRo5R71KXLLhdVmhqYp1efDxbJEDxNTkoSQROaXDZJpeoynfCK5wg4vXePve49qXb6
	 2yQTelUzg2HAvxkZLByKh5+NFU0VA2rB9Un0iqvL3e/xzGEZJMSgHhLQv+kukONSLSN+7
	 ziDLWaZy2QBJoBJr90ZIsFVw2C73iXsyxD40wqOUjyXNoIIAe5UD9OUv0HUF1sJP2i/iB
	 IIqF7KtGYI2syEkEz0b7vdTSsyYP3ZcrrKZMHdcFea/1Kqk1A/I8n2Vejcsf+AoZKcIty
	 on5zkMzaFuh7a4Fb7Yc3RqI0bO4SqNivqxgPIR4bxy/gyv5wLY996fDGvO1Na8SqeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4DZmLB3M1DLobOYk987m6k+lY7VG7Hne8WiBB90d7L4=;
	b=iC1iJYzyVoUpUqHBYO6JkJGnudNHNKBFgyFnfQoPHDHcdIxEiM6nsDzTMEuSLIULhIaD
	 2++wIi7bnDUs53RU6qaV7LroKkvdTXOv3eNtSA2f2URx1SAgsA6rHOtLjgA/dqApppYHm
	 HxqaRcU3BHfFpdM3p2H2baW2cIj0DVl1olk8xIQlCITs2lKN/DLK/BtR+53KNkuvp8wNF
	 SMYfosMPbBhegyQc7K/DDqiPKzubdwFlY+ynIQluLKn1uDjT1U9vkMm1Cgn1LtyYUuMil
	 jn8rf9bc84WBIDc5V1LA/ktgp2nnjKOw1pfte4ZLh3ckoDtPxLWbueTOVior4+ZQHBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9+M1HgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251E606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9+M1HgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8351F000C4;
	Mon, 16 Nov 2026 22:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869748;
	bh=4DZmLB3M1DLobOYk987m6k+lY7VG7Hne8WiBB90d7L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9+M1HgVD2by20XHU2g68zBgQ+gNJp28tAw7YJOzWt5jHPbFtPNKTWocyq8VdUnHS
	 iubOM2D0wJkDJzC1A/6hXIHVKUqqxOrCZqqXjgtgHMAK3Zoyd9VlsLAU2Qm9bcsYBo
	 etROXQ/4bBKNcmnWz63BeHMA+TwIcVsLByTAixH7vvqmoC2PdVPOkVOLwAx30dShsC
	 iTEnKWbkEuM7bvlZLa+BdtWf0SJKDk+1zdn35RLEv/9QKEOl96OxUuSnPq+0CS8jCO
	 E1l46qOuwarw2AMb7vm0BnPnRDAGNCFkv9K6oakTt1qSz2aZHn18lZP+XFCdtgS2Pv
	 PybExSCg7SRWQ==
Message-ID: <sashiko-outbox-217822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-3-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-3-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:55:47 +0000
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
- [High] arm64: dts: qcom: sm6350-lena: Signed-off-by uses handle
  instead of real name
--

commit 22ff41be0c77265e49ea053288034f41745039c3
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem node
>
> Adds the qcom,rmtfs-mem node required for the modem
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use a single-word handle
("erebion") instead of a real human name.  Under the Developer's
Certificate of Origin in Documentation/process/submitting-patches.rst,
patches must be authored and signed off using a known real name rather
than a pseudonym or handle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D3
