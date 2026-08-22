Received: from benson.vs.mythic-beasts.com (benson.vs.mythic-beasts.com [46.235.224.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B3249364A
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787393511; cv=none; b=EJpnmX1VbhOkvse+iEr/1ijFyWZRjsCYAIAvtXkRPkwA4S9HDBqinAX8TwkJNYN6P7cXLVPKWSSLxU+hZiIkTTKZtozASlec0Gn4LiboFWG/3C4IBZ4tqbvo61syOAFGSItX16BMYe8n/TpJsOxxXLfQ4fDU3FuZpcg4OwQM3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787393511; c=relaxed/simple;
	bh=7sislAKKJoBglGtS8CbS9U54KiYdtSVQKpDAw9xLthk=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=LY97VKWJN/3HLOsCtBtxo5MB+Z46uX5BTpaY8+BDZE/Tufo5tb6QI0zOsNI+o0nTtuvB1iiG/SW58SycL1SWu6EBZeZf89uy+XzHGxUAHK8m9gbuIL2IsXvTS/a+5gSHkZ1etsO/C/7wMMVGsxn7vJ8oZ3QqyLmM82UFEoWoroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hellion.org.uk; spf=pass smtp.mailfrom=hellion.org.uk; dkim=pass (2048-bit key) header.d=hellion.org.uk header.i=@hellion.org.uk header.b=ZXs/pLFF; arc=none smtp.client-ip=46.235.224.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hellion.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hellion.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hellion.org.uk header.i=@hellion.org.uk header.b="ZXs/pLFF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=hellion.org.uk; s=benson; h=MIME-Version:Content-Type:Date:To:From:Subject:
	Message-ID:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7sislAKKJoBglGtS8CbS9U54KiYdtSVQKpDAw9xLthk=; b=ZXs/pLFF9qfoDdqTaVPykLZ0Yz
	Xh3QzmQj0tfegNcz88kdzLb78DLBLbvsAyYd+vOCtgoSsvgMjBqQmf2fnXHR8Wyublhfm67+coUxw
	LQPulLo4PGwSKC4C/uYNXtxTi8kJPVtcivy//mlDf6vP08MQu2MPYi50YlMECtuL3MfL0Y7fgpsqp
	E6tNLvYYQp0Emtq4DhIDEeiFVJkyey9TJjY8eopOTfpSOdxxUcSZC3fyGYbKNEngxVWEy39P3rrjC
	sDA879TeK3EHcuVbYxAeKhNcMdk8cUR/EAgafS77mB5vCCj4QNKrIiWP7U9DPIb8Q4FBD0hEvv519
	HXV4N+4A==;
Received: from [2a02:390:60b6:0:692:26ff:fed5:7515]
	by benson.vs.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ijc@hellion.org.uk>)
	id 1wxi8J-00362D-1G
	for devicetree@vger.kernel.org;
	Sat, 22 Aug 2026 09:35:23 +0000
Message-ID: <fe88ed4f288c261373d2ad7184f470a8ea19ec42.camel@hellion.org.uk>
Subject: devicetree-rebasing history incorrect from v7.2-rc1-dts onwards
From: Ian Campbell <ijc@hellion.org.uk>
To: devicetree@vger.kernel.org
Date: Sat, 22 Aug 2026 10:35:16 +0100
Autocrypt: addr=ijc@hellion.org.uk; prefer-encrypt=mutual;
 keydata=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
 ZunA==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mW4J39Jqe/j2PO50OelN"
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mW4J39Jqe/j2PO50OelN
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

The split devicetree repository[0] currently has an issue, from v7.2-
rc1-dts onwards (including master, all v7.2 rcs and v7.2 itself) there
is at least one supposedly rewritten commit (c0abe0fe479e) which has a
parent in the real/full kernel history rather than a rewritten one.

The net result is that the repo now 2.5G of data instead of the
expected ~200M.

I am looking into what happened, once I've figured it out and fixed it
I will force push v7.2-rc*-dts and v7.2-dts tags as well as master.

In the event v7.3-rc1 happens before I get this sorted I won't be
pushing that or anything newer until I have a fix in place.

Ian.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-r=
ebasing.git/

--=-mW4J39Jqe/j2PO50OelN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7fn8DiT6MgcCyDswKi4ln2laRsYFAmqJbVQACgkQKi4ln2la
RsbU3Q/9ELBF/RtbyEBCbj+tc6vGQcT2e1gtG5QVC6iWOvIo4f+rQf+h8TQi4qPZ
fu/KPD+uJpcu4XaIhzcwuWzD6FuIBMH1Uy++uQTtqGzFezoHQWykvlwFdpdafEZz
srJ7zaXvil8YUf9YUIYanInTWscSb2xQ83enROACYRKdgnXIfRmgNEeOaWJhzRaD
XGNz3C1NlyB9ND0GC+9UWaQ6X149iFBjDKI32jX007BmdRgn9qO4rDrVWW5f/EBy
2xtGnrCN2zzAlZE2GwoeG+GQSKcRCIeahL2Bqm6ztG+W1zCOImYiPUgSu0t1QILR
88ys9aqsoRy7tbka5tWEIuu1lC1Pb0fIktfA4B7rg/jF2StmvVpzb9kYv2c9Rzkj
YDaQHZZdcwXkzF67IEdOEZLs+puTb3y73wPlA3iYOacXGxV5+HBxWg+tk5kkMEbs
0WvHgMpKAGQqV5pILYJpVy++j0uETKP24as/i8J7LJ8IfxeuYlFyQwn5w4XRRDJ0
+q7hXCRoOtCDwPhOKRlkd0000HbL+T5R8Y6PjxIc7f/aHYRgrCIjaiT0sC0EwDu8
yRnxhuBcymw8kSaVzJUdVtuAtoUpmRJMlke4y1yzte3YimhrS02G++M9HjNGJOzD
EAmmbXcwwtj0Ue0rIHu4uwMkGH7yKsfD0VFo1wIcCpJhD6/jzIg=
=S6AM
-----END PGP SIGNATURE-----

--=-mW4J39Jqe/j2PO50OelN--
