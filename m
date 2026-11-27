Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759824;
	b=1hCek6i3QBBy+BXSEN43J0+KfloEnu9ekdUeiFGrti4ftCZKJPFtWnVATVSscLJc9RQR
	 4Wl6oaiae1a27UvNSqR1UVT1VxwjZvp4EkRRFyogrzQeAU6LKlbrZ6j8oX9q4t4uyKo9D
	 SBjYuBQB2+ObNnTtTze4+38+pzHef+/hQmeAwb6xVpyaUysBah4xM9lQasVxsv1/gF0dD
	 i/yWKKzCg65vR4RzboJQJZjwnpLYQYzH2EcdZrQNHUcDnQnxYZ3a5qgtjzVQQRd9f8bzc
	 N9C2kmuC+Cu5KwlYyu7INlgZ5pH+pEZfoP6hq+eU3+TozLGt0qPhy+xL4xzUGrdjjkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759824;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=E2NeSLXfonrxSY+W49lO191CRD3CyOzI7hF6dMSOWd8=;
	b=nWpR2MdnsuGcnOD7zq25vH7yI0c4uMncmKfzFUKrFhwHtM6qnkGBCuCKYkOh/Zhlx/i7
	 krWw46etqdn+H1E27KZFF3H0A3+f39fOrH9DjiqvvqsL44DZoJEYZMiaQJOplA4BK2f57
	 v3TRRH8Cj2GKhlrXLSNTWcFwmsKfxzd424zIUWo2SNgimk8d4E6LgGYsOhD54GPeixCIl
	 2B45yGIjHbtJkLmo5qYKY1pELxxMEiLRF9ehGbXN/fuYUGb0uEkswAVDifaL2Oiwbn3FS
	 cZ8B2f7qqcaZnl2AKUBpbAm+0aIvdDgG2LgsTWaQddj9vkoEHjcNiUJjJqRyLTEUR5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IlGuBUNf;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B6606A31C;
	Fri, 27 Nov 2026 06:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IlGuBUNf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759815;
	bh=E2NeSLXfonrxSY+W49lO191CRD3CyOzI7hF6dMSOWd8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=IlGuBUNfuc0X+Pt3hn9np8itQgtiT5Y6SrDdfdiN0lIRUOz21aPe8g8Qgadna6M75
	 bdn2tXw/j7r0us/0BtOSVxF1Yjyjb3TUWZxP8XiPP5Q5qt8PZW/QpXEI/b84/aI1Ze
	 6Lxe3kwqdBXOal+B4RzUZg3Lpsm30yimKVcfbLH0=
X-QQ-mid: zesmtpsz4t1795759813ta86aa600
X-QQ-Originating-IP: n4795X9CtarIxKcBmI9iCqupaEOTuiKZlULc3AJEdYw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:10:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10182266507146119862
EX-QQ-RecipientCnt: 13
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:10:10 +0000
Message-Id: <DN5RQ489MNYL.1WRXDMIRHZK6I@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3: Set CD pin bias
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M2Wkd4xaa21sg9K06gNCQhOpy5NqUNeHylGFHTUHRUS54J/dciyOcK2m
	9eXv4P3ojXND0Ganf0qXT4YAoWmg7RhiLAFRmtV5VXtG7uA39zD2Hr/MzOr7Uf37LALxSaB
	wjoZOj7asVhHnimohIFUbN45xkyGvwUJNFe0ehm2dSmDIqOZ0ngnGbHjO5Z9QdrB5X3B9r9
	M8DCKpmpqYTyGFgjuXmAAnCP7hAwGnUPY7lRSHe2XLPQAAGxAHkRb4UisLU9r+rkI+6fUhK
	KGbCZLAUIYn4vgxUdAbtL8d8J1zwflTH0+VLb3P9n5r/we7TNMn8gl2gO3ZvUM767zRkHI8
	SqDL0RmgWZ/jHcvoS/SFEIfDkkYmNu3iDB3OYFzS3GT2XXQs6dNmoDb7sdFki2Czldcfqof
	T2k1bpHsw2MPQdp1UQbYryF5OtWXwfUj3WWINxkq2ZXYUkD0pVdkoyBwgwkuwLunBrsVz9u
	Tx/+w97Ygw3LjhxO0/qXmdrFLy0PYSYV3APcc26ANRYu0mLLY9xSfX4BuIAD/sx66q+9vdC
	AMsa3AzY9GwQQ/QlvlneFlxhCt+G6cGos1egbz5vFYzUxHKPsWdgEhhaZ90sfGbIK80yzfU
	ehOKM+7oqy/l0Ectu1XZ6DNxeSwKbhsemW8k7HkgORyFeFFSyDZB9HLQkTMsnpkiQjl/DKy
	0Ug37aVkif1KhBwUbXfKT5lTDaqGHpbxXqyd4OvsO3NHXLUHPcvAsz4KBgsBcc82Y4cKzIC
	niPIRdN2qwy5c4QOp4RX0RltNDhlFWNFQU3jfn2ZBUFx2FAPmAiUSvK5Dj2cbYqW/rEDPcu
	/YsqHuqCnYy+ra3xrA8RoyOVg/U71+lYHpmt+dc0w2f2wNA2RH4vsryNcEbvCQfFN/DhErl
	POpTbnQmMw+6I3LuAx7LMbJ2JIDd7OvdARgMxHMZIBGLuARJzpLyflgYB7e1N34lXUi001X
	PzWG5oZ1rex21hKaHvMa79U3A8/L9vPSxRPrWlsl2hrzW0Ogv7gJKHqJOxzuiEMlCxT71+e
	ce7s3rebJKm3drU2s9sa65n6A0ItU+gOlEYFGe+zwRo/q5MwXoCSq10xUvZD3+vivfnuBZd
	y7xDJVzXGPYEiS2wOXTgYWdtQfkdXwpRvEsPqQu4rL94TSdcJueQhM=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Explicitly configure the bias settings of the CD (Card Detect) pin
> for MicroSD card in CoM260-IFX board.
>
> During the GPIO pin request phase, the pinctrl driver disables bias
> settings in function spacemit_request_gpio(), this happens to work
> in kernel side, but doesn't for U-Boot. Adding a flag to fix this.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
>
> ---
> K3 Use same SD card slot as K1's MusePi-PRO, which needs PULL_UP.
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> index 65c6f49f8591..598a53461afc 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -240,7 +240,7 @@ &sdhci0 {
>  	pinctrl-0 =3D <&mmc1_cfg>;
>  	pinctrl-1 =3D <&mmc1_uhs_cfg>;
>  	bus-width =3D <4>;
> -	cd-gpios =3D <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> +	cd-gpios =3D <&gpio K3_GPIO(4) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkewiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/aXQEA1ljwDzb2fdP6
XzncsQ9ip4r67ZDtHNdpKwFVYpXsXskBAJwpqVE+V9wjlbhp5FQodbaCyQVw4YuI
iJup+srjnbgK
=BeSR
-----END PGP SIGNATURE-----

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68--
