Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759440;
	b=xNH9OjIIKw/k2fHCjKXQMvav7kMNSHCtb575Bmhp20qwcetWM5ukzholdTWu+5QpDYUb
	 DzCzSDlKa8Rw/uRgOXKjDxJWxkuR61P6vM+xId6Fq+L8UK3VpOcD0YFMdBbT1nsVVNUbT
	 CECSKNHfsGe6au6aqUbLEWU6OH975fyIYcIa3Mqdm6CX+QMWd85BEA1T8YVCjZo1Cc0Js
	 sDpZGd8hhXFCkGPjPjlydZJdHK5k/bwASomp6wQpFtN8PSuxyIATjt/hMYfoDEWtQReAx
	 IIoKODY6g/nPmy6rObRhqDX1ZHDIdUykUYuRoQgR8f19fRsiCKI2oI5pbi/mdUjU0iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759440;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=+CoxtxAlXXTcTP7hM4mxLxfWNCL2jUGH6jwViGvzmUI=;
	b=sBt7hIb362jRCUBm73o+G5OntGraaZmMuJmo1xqdSwmfCti7kyqBK0VN/o14fkXfIz1o
	 QfFNHaNPvssS4tXYfDAGrYs95smaicAYnVparmLg071D/+dZk8gQaaweVEXuUebdwKPdC
	 Hz8+TU5UZkQVYONGeFd1T5RLyF17u/Um6Hs/O/TCoSE//87ZmdyvKaQvV0DRxR0XCUlqK
	 Ai7rfcBJWMCUdlNiQq5ehhH3kd76CWaAOTCKkV8mlGz94FCtcqmzkAgpmN4kst6Bd71cF
	 ABgqkdBi+3pinGlKrW3izBPcDu9CM/4iRjuoArw3PY/ZcZcq4C7lh27JgoXhmkbXAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YEdZOqp3;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBB606A31C;
	Fri, 27 Nov 2026 06:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YEdZOqp3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759431;
	bh=+CoxtxAlXXTcTP7hM4mxLxfWNCL2jUGH6jwViGvzmUI=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=YEdZOqp37JkNLzFV/06Mky6834aXWGBw9sTNbXBpEEUxo6TiHAA076xIuPUNw2q4Y
	 Wrf05N42UtQrtkpvk3s73LHxA4nspd4Fskd5YlWhfjACwX10r4x46L5oQ3xdHDF7Mz
	 7eOucLA2zuL49xYBrUZUUqjm/cvbhWneqsGeEAM0=
X-QQ-mid: esmtpsz20t1795759430t6776662d
X-QQ-Originating-IP: mpmvFh0R3UtSvg9VqO4lkFODjR/FTtIIYNG//MpBlWc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3646035124795458743
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
 boundary=dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:03:47 +0000
Message-Id: <DN5RL82O9EER.3GGSSOY5NFUOP@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: Rename PMIC node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOJqM1zNNwXIERqHfeleDlcGZzFqEzZ2o5p/2U0K/OLFH/Y3mN1wYJmH
	nP6j4vIwyJXmwouR8MOuTfGOxhvMX5ycbEeEOn55Bpf9tT+qTuBoI2W3uL7hbvo+b08p7eH
	oVMI3WgzJtazFHs8f4zw9P4eajvJjVZ+JUDYxhsC8vRLdc1LlqjELrDrF/MPnUOvy+6ydUm
	l9ulV9SpBGrNmhKI44CTaWsT24RIlk1pRW4lyNguanVz4EKN/YhPoLQtM/9/SIoYBFBtN7H
	q9a2TkwXloH8zwNYUM5jOS+gBw2O8WFw6GWDxoJ62QXcEj4sLatsq38QQ+iVxOj+2Ifjm1+
	0nE8NYMCkLPpVgJxGZyKEDrlVKO7yMduCGJFhwXJV2HpAwLoDkfelxmGWwoj9Tl5W/z2l6M
	SKZMYpNNS6XjZfmw5F0l9g1vTlQK4f0UC57RvbO2FKRVzACLOlQDwBZzTHiQD22VcXh7T9K
	R29picBQGTblpZCIwYzhdmThutP+3e/cCfMa/bzQ5Luujmt5GHeHja9QPuw6NDZR1Gz2QMv
	irYDXBP7B+zO7OwhmRbK+aTobe8dwlB/jd/uAorkxw8MtuditjTeN2TqbooiJ8olh124foB
	ZJ48/a2lTHidhHUCa5AikX4cCCxlGWwlVfVUTVgEw6/bGv4X9xaz41KvBB3co9AYcGi9Ou5
	F8WECllOSdh1/cTogZbnHSkd/7R4ZLOCMWpM4882B/PxT1WhTQ24py5rNuVs0rves33NjhV
	oh/6jcUkQtJFLgqo91zp+OUqyndYfxSp0vciiXaww4LYcLHJ3hAB54jkW+AUUsWUYxhvdMi
	d7ZxvSO4nDQRx/1Jr9DeYGcLDqiZJ940pBa3ZznKVw8CrK8fC0HLjQ1Koo6YzPW8tnRNvHa
	VwIWtlf132LWSWeVOAtqlV7oprq2VcPeuSAuUjKGB55XTNMMNmjc07vgdZyGAsCJ87AjatU
	0DUOQdFboFu45a2uJUc+QiPdKwk9P50DGWYi0Fsogq5k4KBcBogLiitmrVOYrlSNavCZNpr
	wV6qTYagHipDyevoKKSnQm6/tm2kkVtee/XlXgoFiNYG+1jpi/Nhl+xfbneB4jLgyvTRdrP
	85+KEnq7gqa
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Replace to a more descriptive name which follow Device Tree docs.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index 8d1cd468cf8c..a4afe24130ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -100,7 +100,7 @@ &i2c8 {
>  	pinctrl-0 =3D <&i2c8_cfg>;
>  	status =3D "okay";
> =20
> -	p1@41 {
> +	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
>  		interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdQyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+72AEA6xeu93yEEa++
vdfWOF3LBT8G/QTUIuZMu/R3YlMKumEBAIRz1wtpkYvXtXK4vzdoyfE7b3gN3mcS
f2FUy2P9NF0A
=YDVA
-----END PGP SIGNATURE-----

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec--
