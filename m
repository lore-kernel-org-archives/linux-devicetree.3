Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759446;
	b=AVHEN5d/9QvOw5AUf8gsTM7uYew6IKD/QqyIy3ZF/O6uBTq3quSLGJAxw22iLVGie610
	 l8C+N1FFKbPnfqesfciOeC+GM7G+hC8rLb7jM2NAeQWh6Y6METil9k8qa1P7t0sIGcrk2
	 9o+Sn8sWqxwtffmVjFbYDpm2T2Dn+bx/CnWzd6rgU3DfoMZvbPeyG1kBKxdJLXxglIIk3
	 /b4pEIFk+Y566WBky+kFid5DFGsiHCzwVYPNgPCNtfea9QEDTrsNtoIzKqn8dvcvEbieB
	 x+c9O2mbuXXACaf+eqwfEGLjbtbCcKEdt2O78gtQz+5PqpauyP2dTSoAj+tmVccHr3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759446;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=6JumvAHOP2AK1HGwC7E01j70Ya2ecZb8F2RHmqR9Yyw=;
	b=jJpi5CUMwirkhkndhPoEQDb9fGvDo+kNAZxH7RLskOnCqNNhA8f8pASy9qZ8t9GG9abZ
	 6vuIZo6/A/CKKEmUl6Di4Pz6ayy38rV2uj0GaBiYbNcmLorzJB8coB63BSZZA7M0QmZdq
	 mqYp/vAzxEd5AKXSgGDOlolmKhLOFKu9HZybx0SbyMhJILn2l3C0al+T+j2JBS9AUDlTv
	 WJ7QnbB4sTyB+oUtEM+Ud8P1wjQl/Yd/tO8BHUQH/nSFNJNqMIk2yZE4RJr0QwVqMCM3U
	 lRDkOClAvOY0WSEJ22MhJj4If6pwqKJy5wRB/MjZKEIacNk2hREODgFUtPa/TcDEUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SjWbyELg;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66594606A326;
	Fri, 27 Nov 2026 06:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66594606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SjWbyELg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759440;
	bh=6JumvAHOP2AK1HGwC7E01j70Ya2ecZb8F2RHmqR9Yyw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=SjWbyELgTsWeWED3jYmyArOL8yB1+WDYq+9RBmOewKxunZh2NytCzai5KEfDfB0Ug
	 s4zqxPYS2Sf7JLEsp4dHdXWi1lcg/wDrioOfiGWOPLONq6pQoaOSId08PvGMtku1Wa
	 Ia+E7vAb5VcxJzA/74dUR8ttZ+jUOj5drKj8MaLE=
X-QQ-mid: esmtpsz11t1795759439t27ceb795
X-QQ-Originating-IP: XwpB4emc8zy9NTegUDS57CqD1DRQzcVkx6sNW/aBB/8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 934310561638399512
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
 boundary=bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:03:55 +0000
Message-Id: <DN5RLC1L2N0Z.1ME02BVHS65GB@linux.spacemit.com>
Subject: Re: [PATCH 2/4] riscv: dts: spacemit: k3: Use Pin Macro
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NDz66ktblfzJxQsJ4y89ETWrU8ThmRVaSXe761izFUzLpUiEEQfNBR/p
	qrankHr/NP6ug4lK1+GxwQ+6QlPg5Ilscqq3ABTZNlSG4ZnmDhJO/fG1qNS8LdWQIZUm/uC
	saIuArbKuPwTnr6jctB42cvb8NeTTJfCGl/3GWK2wsjVKRf+ycOFC1V2lu4Dyjep655Gk2e
	kGRHYHAazj6aPjufqTxNamogan/FfeC5vm22heVrGP7go9WUqxWAvDIOIt03d0swawZK3dG
	pXI8AZUVlAKkvHO+AgBmF2GgxizoLC6thUk4nw5IoVh9ApAW85rUsSWVWSNRO2NldPimeCn
	ljpErjGeUUvJMWRhR1IrTDUg8MpizBJkSHBlRYN8uspMEpPHDOLY7CDMhPGFIYARsSU/JGn
	q4FqYYunvtGhi9A6sADVw332zvUJ6cT8eZD/3HDm0b9aTgztaKP3qcIMcsGHKuCll1oijCg
	vo7ikwmoQWsogckGqA9rMzemD0PaIoLWPaZ6FDXY72yWU98hjQ9DcDZWgjiechvWvZRWxM7
	crp/76cuWm2qcdg6vNV75RDXzg2b/8cWN3IpIi2MJLPOBasYfNP4LggtOBE3loJovKnrGCF
	sFXonmVQP/VfasI0EAVWuI2a978EY93DW9eRWi9lLGM7n2ye0eqSufQB7YoCxg/NzzCYRUt
	lqSNHmDpgGNVARFDpwj5LYi0DPsnqxF/dPtGMkQFQmz2gbt2TCP7FL2T8KVFun1G15SMxo6
	OMFbDIt+3tPFFuU6MuJ5GYz/9KJO7P+PRA594yPaZdm3ziDAhajIeVdnTvqzJVzPStDqyq4
	506orEUg/lx97g+FgwlDUvGnVSMk6XZnFdeuWmHcyBpn+iGqD7EktNlqHmFJb8WmgJfrRYO
	OP0uluitPQtpa8mS2hWPvfEv88jxvZVMxvc0qY5CuVKLnSj2PkrLPBwtQWi81tzBhmkIIuw
	IZe+mOWMZc55WosvYrdeDpnlMp5EJbRP4p8VlQkMrQVL+4CdG1gbeTPkVN820T/ghmdmeSi
	wAEKte+u21Olp7V0UJnCGTTk1VbcxrZxx8hwmKEi0q1dYomLcw651g4aFwbEXSYbYAn3GxQ
	6Hgwuiwy/+NVFMh0obTB+CX/3gZg7cR6FbpTwMpbq/A
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Use Macro for the GPIO Pin definition, which match enumeration from
> pinctrl driver and make people easy to grep for debugging purpose.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdSyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/PhAD+MjsNYLaaUSS+
jnOaXI3bd6fSlgrwHfaHd0YUBnotjDcBAIENH5z4d1y4JP/lnkqh0ElpBLFje1LC
PTNC3ih9fLwP
=j3if
-----END PGP SIGNATURE-----

--bd6d9cb74dbeb1ab2a51de9674e51bbc31851864f70b55408179a52ed7d6--
