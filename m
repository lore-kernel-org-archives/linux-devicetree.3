Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759450;
	b=F7ZN8605LDuTfCdShgjop5wI4UNZ6Y2nNwi8o8RBJ0oi9aOOxTUiURZOvxapUh78J+aa
	 GZrb/Jp+bQFBRrZNyMTh2sJZ7aKRBTUwY5pz9/mXAOho1n3dUUR8TAaqjJoVElt8DYmdZ
	 g9oiR9Z2YCAAw2Y29YFsLfG5mlv/9aRNi4VKReJ57wo6FFrY1+rG174UZwmNpWY6HbY1P
	 v8FoM6r9lsvh6cgTXI2CTZfSygoUtarwBanM+xxQf5jkXoLruNWsBmhb/n2dYgx4zCI42
	 5WlD2pjfvP2lgRUg1mxDB9NiM+v9Ib/DisNWUsf0ohlTmjAw1qQs5/N3dMHkDc64Xng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759450;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7MogPv/8rDNnLROh2lJqUbjxxMwzFQktEETGe7LKoj8=;
	b=nk2az2u7SKjjAzvJrx8zWUDHgy1t/RvfYG2oksFgbvGUxQ0V3NUKrWYpoR/0e/ji8HBa
	 2wEAYsSjVbCYECb4oh7Ny7LnRwPe4vzswnRWrkLmdG5bj+ihwZbQ/ryipSGfsiLNk37N9
	 eTBuKuhEZxe8Ym6uCRtmp1JEap1OHqTSwqzaGlCCpUR5sBS26l4Ik6ivrGwcTDToXDnlj
	 UHaVttMGYH7HpuWO2tB5d8zBwX+P5uobj+288UZBVl3+teyvCua3n8keZGefcxZcws3ed
	 /8n2mNBzs8MMtvpSTb5Zn+x7k6seCSVOMkd7x0pDUWKHHIrVrs7a5iz/JpnqDjM8t4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fQRe4unV;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C1606A32F;
	Fri, 27 Nov 2026 06:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949C1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fQRe4unV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759444;
	bh=7MogPv/8rDNnLROh2lJqUbjxxMwzFQktEETGe7LKoj8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=fQRe4unVSaMutyUFFbFnEzLjoSpRNosDYRzBfghNaF1HWM2fwV+0ZahHu/aupnMHx
	 rELmk7cPrbEVvMk3YrOyE6eARPkM883dL9PE1oiaHHrxwk+LvOPNwQ+N1ODYjjJOZY
	 KhIw2YKbzHCD9oeI1q0y0XhxLEMKgKC98rTK70ac=
X-QQ-mid: esmtpsz16t1795759443te5c7fabc
X-QQ-Originating-IP: w9ScYnFOG3tL2kivETE6oRptnE7ii6xkMYvcHsfyRpU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:04:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5566147713049927069
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
 boundary=511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 06:04:00 +0000
Message-Id: <DN5RLE33ZA2I.31YRV21UEQO2T@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: k3: Add alias for MicroSD
 Card
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OP4XZE5B6RmKaJdagxurECd7FpYuEi6MPXkSg+ld0bWMH10JMmm8YyMB
	N/251yJ8dTuEhuFUTW9Hr42tckvHs/tGSHb+eIi1+JaG6utz1hPx/B1fby57TwPISGcBUDJ
	ari59Xvzf6lZL219KVOY/UXs3kOX/2UM0xFF9cgnfUHghg1juzoBpWWVBIZPacAhEeLBTIF
	Cob1DgDoGEJ3y4PbaqbuNSfbyrDhhSqvJ6/YHDhjhjJZ9jejywSj5/PTYQAYk7rWJgAAphw
	q1ejPh+KSRhel4n7sOOXRzETChoJxkUPoQwtG5PI0PTzbNwA09SMYF1g0oiwpWjH2W+TluA
	Uzs06iq8od58G3Hn2dUbPBMQMfzUwrFAZtwOxZNPqCIMjvrXsmezpmQf5cwS+F5TNuUAWA0
	zSsomKwWz1PkrZSCtNjqIPAKlWnB2LNVTmT3L7iQ5IL0+MqdCD4p9r2jEvpDAheeIbHEVv+
	ND7pM3vMOC305N0zWqaYB5fn1RN/SxLNfxarzCm2D+n5Jor16xvcATXP24vU1EopaeQPZGS
	ZX2PIChwQHX8caLcrZ1PRsYfP8JvUcLQrYUPMW3Q8m+WXWavQyHekFyzA24xkgu46s/8hrJ
	596OTnHAOWIhiFX/Pm/GKVy5lz+GWrE8jEUWvyT6mIHAsA0PlJjrMa4+HJXBAX789HV4zc3
	9/cHAK3DjglFmisOWIjmcgFiB8UFXobYHcP9L72OXPHoEWOI3vS/yiDCGZyX2WUDVN4bKQT
	Jx3zvSupUTvkEEFCSZezWmR4lgbheqvyNznfTmY8ImkIC0S7SywMzJom6f1j6RHhhXsl+dx
	wEDJlVsZISYet1vcOKt28imcYOFuut3FhzZ8nSrvs2ocMtV5zVCe4tRqiqefrADO4h8XCOn
	8ZNh7JjwabBwfWZTK72I17rYUzIhD7N/j03K69XEf1Stej7Z9cAta3sQlBYyMpSJ12xXVPZ
	sN7DGbXr50ww6mG9Eo1DhIdrkBThrJLropKlSCjwa6aKnmEYrtPttx8Xc6nC7W5lPFHNbUH
	VLYYvvPrpr/6xmHT9c9d6GaCETUfj0HnY6UPh6IHAtaVaRVbVfGBel0NWdhCAS36tS7L1nl
	WQDrHFBS5b+lcUprdYeBFXUrqeqlUnIZyQVY3t3EFtE/gFjMASHLoo=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Add an alias to the MicroSD Card for CoM260-IFX board.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdUCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/ntwEAta30V/NVIohc
hMoxmKN0JKEAvLmQLLUpsNQ2ycAEFqwA/jDC2OlAs1T+oRQtn9mzwDtIxwKOZTqN
V0t3Xn2x+akI
=E6T9
-----END PGP SIGNATURE-----

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6--
