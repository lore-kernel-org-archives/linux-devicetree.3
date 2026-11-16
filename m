Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870015;
	b=Ziaml63xY9na+5mrzVNWnstcAa+HtnjrPFLhnfGhkM6XqpQBABScU2O0QKZTUXIeiu//
	 yD0LQb7UjvJzu0qjsulWLZBLmxKzMJViq6My7r8N/p7f32ZcZbPXFx94eSlSnysYhYNZN
	 iLh1Jf63zRfYhOgTRrChSXrrcTmPH7Dp5p2VPP2JQg4Ffn9tG/dfDqn+g/Bskuy768kyu
	 mOyZDQi2JJf4dG36qpZPGBJx3cgYNkm+MwkA8wYGg1pcCAjS6mG9vc1kG8r4WzLRVoQcJ
	 XIc+R2P8Fu3ZVEcIL7rZ5VKjDcx2y2s86v7iv2bzu7Ky0inIWX3i2MhRGPrmkknLHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870015;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l9dupyilK2kUIywdtAJzDg+QskeK5iZcBPdqB1Hyg0M=;
	b=yJ2V3Pikn45gcXuC6Yx5+8Whw9MwztBy5X15TXor1zMg3ohMLIb1AHMXJlD6/S5/F2G1
	 pI2UsunD6bIcGLnQyCraoSgp/393pz2F0XO9CUEy9GGUq+3Qb+6um4vcxrvn4Iv96dNlW
	 ZR7VrNPOzEpe6vd8rg7xdU0WjqxZFXdlbbzO0by+FXWb3QnfgeImJ7OngT68FHWLIAkpj
	 xqHNwmWxoviaVw4E8ek0p/Q7qjDs7W5ocAg1BotsCEHlb3qaN7iO9feqSIfhPdC+Wj+Ti
	 mF9X1ndkljUCX4EU8tR/qgA1rni0fdpafbDsglCmGRYIZIriz/tIn/KoUOQf3plcIdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPstk6bS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CEA606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPstk6bS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7968F1F000C7;
	Mon, 16 Nov 2026 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870014;
	bh=l9dupyilK2kUIywdtAJzDg+QskeK5iZcBPdqB1Hyg0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPstk6bSVJyWebrhsSmV/4gX6lLaGQgU/Df/oOM4GxxrasNFtQIgZAdubseChTazE
	 NoNxuzCdpjDLfkrk+Gzd+ih8JkrHHTW1Z6nKakn1zcaQnHA6br7qFNDpiYS9n1l93q
	 JOrNFceRUHzJ2UZclDglzJjJowQFdZrtcXwvgLQUfzfIyRwtNnZ0LKq/8vaFq7Dpdu
	 NKOjsNxwrM4YsMBA+Z+Tas9tAqE8akO21pwLVjRV0/VUaF6XyylemZ9sm+cjItA3Kd
	 Qvpwe9twyWBumezaAnJBxkTeSKxfnwGdtbKFo4mNpNRs0kv3umCpgLOe5QCQR6ZVrb
	 TeoDhEpytt1hQ==
Message-ID: <sashiko-outbox-217832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:00:14 +0000
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
- [High] arm64: dts: qcom: Signed-off-by trailer uses handle instead of
  real name
--

commit 740c0daeec4b7b67f69c91c933b4ac4150f59402
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add PMK8350 thermals
>
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Signed-off-by trailer and commit Author field use the single-word
handle "erebion" instead of a real name.  Under the Developer's
Certificate of Origin in Documentation/process/submitting-patches.rst,
patches must be signed off using a known real-name identity rather than a
pseudonym or handle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D10
