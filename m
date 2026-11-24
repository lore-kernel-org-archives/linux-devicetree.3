Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482081;
	b=5YbwRhnnWVsEj6ahD7dY1W7RuMAzggx0P+0f7N9SSsEyX07GBEz5QbSebjpsu8kFhqti
	 rO2wockxfxxNuutsNkq3MsGaMOqN7ZTF+2vRJhSR9FXJhkvVOmo/+vq+Vs6yu+0gxWJ2j
	 a8XaOGYmP1P3kjs+26Au1C+Q1mII2cNPj6cAQzjHVCfRxT0bZQMNlJ+QyGDaWTY4VfXPP
	 1AM/qNlXAexh1s1Va1WxP0ldtAC8D2jgOM1g1R/4Mmgm/8z/Hbxqo35GaunjupyYGerk6
	 xcqvdNUnvIB5yewsJPg4fU2DNPjEXZC12WmzI4dYacTAz4wGP8j3wvnbFlnEPxBVswQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482081;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Ggw7YcUYncqyVJG+//d0uJLUqpnx7zsMywIoX1umATo=;
	b=Zv9cl8YwlEml8trQUt5RXcQDQytQE9ib259Gw/v6xB+jAKxlhNMUxS+E5pG05xalCJ0I
	 fvFqSIImMVXgRfF5seSsO1UAOJ3KmNBc7weWq6mzv0k5liP6GWju4RdF67ewnuuYwcBeK
	 +X67odaxJi6FHUaGnrSPEzj9FbHSirpfJOBU3KbtLsw2rc5Npcoz02eGxv4u2jT7jd3EE
	 z1W6XjgjmP8pzMbf2Fvq8c9yneON+tnw3HjHhnWbA9xqMpX4Vwi8mM6MKkgL0fCtrKm82
	 3j2bNinRlvcQHiAHV3DN3kw/V31Gn33OylydlvBHeovxsrGjyrfDRErK3EnXZMl8C9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QlM6IKAC;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E50606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QlM6IKAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795482027;
	bh=Ggw7YcUYncqyVJG+//d0uJLUqpnx7zsMywIoX1umATo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QlM6IKAC38SvCbK00Pi9cTE69gcAUBd3lHR8uGTmD1Vaw+VGVYl67gpmUJJgPkkJz
	 9bKl+H4chJIAmv9DpE9a2lud3OUn7u1oM/yFw+f7TIstdNGNFWLnlSDuedEh2AZHHf
	 Udb0bdmtUIhsSgJYVvFhFZfYHDu2JXLoUbJwUlMk=
X-QQ-mid: esmtpsz16t1795482022ted70460e
X-QQ-Originating-IP: aaGmqngVMZGJB+SVmvOQbimTL7t13n7UZqIKKuEE44Y=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 09:00:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2033590560538473759
EX-QQ-RecipientCnt: 17
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
 boundary=717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 24 Nov 2026 01:00:18 +0000
Message-Id: <DN3198CCQBG1.RZR764NVW5ZK@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Zixian Zeng" <sycamoremoon376@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Aurelien
 Jarno" <aurelien@aurel32.net>, "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGmpL5CFYt/YATdBNWYWGhBWqnqjud8jL7fKHkPClwCAn5dG/yjBkOKm
	VxABQ9X79QymsaamZV/E5YxIyDm8KoGFoTGKeFcVS9aqz3rMBe0EgilRrgZVKCMfnHnRGxN
	MIwysIvUN7NoGG95e9Qv4drW2pxXgD0HgO4sUnw5d9aWUWbqZDbIgsvV4t58C70e/r3Gm6q
	EJ4vc2deEMBEnfhtXgxxxsMTbWXMh5Wnpyns56CunymkkdreUHpQvpaOTij82HG656MJkLF
	xNDHBS0PNgIEoGkMdRx96XGqQ/Co9jhLQAxnvn4JEAoU6aGF3CjgjO3G1vkhTB1J+4JCRRx
	WhEFNWJOqpEqFXY5GxmWke/dsTyciptPB7iI0F7Gaz0pia8pddK1Cm6zRy6699aOpYYbOYZ
	QvqflRlJrtFNixOBQ3quI6LbZCnUzDVwGNCNAHTbrVKFGqGaM2wYMQaRU+R2lYbPlcGMy35
	EVLEwYYhBvCvGHuNsdmDjqzefZbiDFZ8Ii/yZp/beo6nrvQIhn4GAWedYM0qPgwGfB4QOC3
	DM7oxSdZRd7sEFCu4wRbWqmKjVh3Kt3gvWL4FGxxH3fKbDlj2QQAtTgpZlRD0a5tFQtTrqN
	g/YNJFs3EWmg/mWo7btM1bvTimd53UMpzHcYOBJW+5elLSJUf/K+wgjUh/WMcU2leehtH2b
	gwDjDBvho9UNG9F6aeU4pV26xd+NFlp32FB2t7Ht5Nh3rslk0zy3HxsFssVlLS3s7e5keoF
	GBP3bNFnHIUdb6QMtDWiCdy2bCW+bfBw9Ow1oRpBPfsLeLU6Nu+Wp9uRHXGCWisG36qAgmO
	dvGJ09VZO7HJcHqpFLqYEf1zSIy3pJMLLBSuIgUvXCglOm05dZ8bp4euKL3/pOoNC+6kLkj
	R6kcfDFOylj2TDjyYBR3fzMmRQ1vzsfi9wfncyH6qYi9LzXOzQaxE3GLp3RYA5DQv0KKMUY
	Q1rFk4gXwV1BW72/QLCtGdnQRmkQGjhHF7SsgUTU30eQztIgSgSDeT/xo9Q26DFRGxlpNGT
	qOWDLT7b8ugpX3Qyas7OV/pQ4pfi3MvtXcPz0IK33nfZFv8wcO8QZal7arZkVJMz4QxcnWz
	kx7CrH++MuRIM0xfTUM3aDJPKT6QtRm2IdICwpUGsQtx6B8aGsRzm/uZ/q57z9Q8jtd2abw
	XQA++sCEZ7pogNg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 4:41 AM GMT, Zixian Zeng wrote:
> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> 256 bytes with an 8-byte write page, which can be found in schematic[2].
> The device tree declares pagesize =3D <16>, which does not match the
> eeprom chip datasheet which declares pagesize 8 bytes.
> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> together, based on the chip model shown in the schematic diagram.
>
> The TLV EEPROM on this board holds the base MAC address and the MAC count=
,
> so a corrupted write leaves both Ethernet ports without a MAC address,
> which is how this was found.
>
> Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
> Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew?usp=3Dsharing [2]
> Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=3D8888 [3]
> Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNboh=
nONSR?usp=3Dsharing [4]
> Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
> Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO =
board")
> Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for Ora=
ngePi")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawThoiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+o+wD+OlEf5HFUNy7f
l7HTzclNxt5QfKGOcZ77dQoUSqNlL8EA/Riqjg+f1nUhCjJ/zfcW9Ig33/Ral0U7
tEVGQLgIa8QB
=DIuQ
-----END PGP SIGNATURE-----

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784--
