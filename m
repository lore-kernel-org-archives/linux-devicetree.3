Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579733;
	b=W8G99+deCG3Pwh3Iegos2sx/qFY1wjY5p68nCC4W0sHGfxDyazaV2L4WvXBzqOsMgrez
	 0C0YT1nClccvaXSwtAyW/PglpED/wfRBJpL+yrI4CzQvTEIQ/dv6MLaAogdIrpTExhcD8
	 dofaK+R6HCyWeVaq0glxWn7KXtkh0GOFUqhUHUqMlaMFt9yKdk//fT9v3SeHuPaQ+CYzy
	 seMtAip7z3vyfkMBWYipfMRC1DO+IAGREn/2qN/PT47tkGjGUsulwWh4QuV5HW1dwf/Mn
	 /FqNjOeNoArEaZNuSUjmNgW4YummD+S9T8WZH1wZANnnhsJkxcIgsSBtZ5ltjgWxZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579733;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=ZG8EMWhctAf4hBlhV4nBt03pkj0jTyEdzET8AMrZ19I=;
	b=imZuPM5ye6LQNidN+GIWvC9W71PHjtlfI+bE1Sw45Gr0i7aZ4TEDlxMRXo8AOrmTHsd2
	 OkGE1KWxnSbpOLT99L2ibiFPLh3+I0fvXc9Jm/5Kb/Wib7YBSp7xXDAUZo6Mn4MQtyU4X
	 IYfZfo6YAghBWmqbth5AkqHtVjLTiFipqr6Xz68VBsEWMOACpEVp1tmrcDX7VPSFRuH6f
	 hwEZLmLNFn/lsHv0hiogHYvgqfvidU2jB2S/BRDB/fwb/eBSIjNzjDrdm/HWun85LxLzh
	 4onznxIxEV0yPaLRoWoGdLzknbWDNJjk619bL4SDJX6Wr4Pt3Sq9yfuk+HUfFHNu07w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="49306/x1";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DvOzqtUy;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131C606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 00:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2131C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=49306/x1;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DvOzqtUy
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793579729; bh=ZG8EMWhctAf4hBlhV4nBt03
	pkj0jTyEdzET8AMrZ19I=; b=49306/x10UCRUR6jExCEMbRyFc0aZorRTnSx/7F2SHJFTnYFe2
	eff4owSHoiTbbDs8RWJcIi8fLRv3kxeCrnBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793579729; bh=ZG8EMWhctAf4hBlhV4nBt03
	pkj0jTyEdzET8AMrZ19I=; b=DvOzqtUyJ0Y/RW7BF/va6FjWFjZ9fn2RxA02B6zMaRVxk5I97K
	Y8X9To2AnHFM4hAzxK+iaFTwgf3D/5mtrPric68Tp0rs6KClDQGnD+F0ZguMs1dUVj3XU5KgENJ
	3EZ4jGTT8/H9ALxUOLs+SCM27lyXX36bk17vdAEFU2CN7E1HLWYcYN/Rux4jo3LmXkxBHQxvSHp
	/xiKuQHJa3uZrY0Y1kWID2eIOoZhcBjqg+eOsJnVnV9sippNuqjUV6vbrPGhBv7T19XBTnBOpum
	etxh5kAXH/wbweBOfiReW2Ti14G+MlfQHI95bMwnuHNq6eJcNZWbw86AP4hTOjam+jQ==;
Message-ID: <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
Date: Mon, 2 Nov 2026 01:35:29 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-192768@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cC6AXiopkwI7HiSSjolv8bnl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cC6AXiopkwI7HiSSjolv8bnl
Content-Type: multipart/mixed; boundary="------------07k0mmuG0N6riQ0TbvE0P278";
 protected-headers="v1"; hp="clear"
Message-ID: <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
Date: Mon, 2 Nov 2026 01:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-192768@kernel.org>

--------------07k0mmuG0N6riQ0TbvE0P278
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDo0NCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IFNob3VsZCByZWFyX2NhbV9zZW5zb3IgcmVmZXJlbmNlIEFE
QzVfR1BJTzJfMTAwS19QVSBpbnN0ZWFkIG9mDQo+IEFEQzVfR1BJTzZfMTAwS19QVSBoZXJl
Pw0KPiANCj4gT24gUE02MTUwTCwgcGh5c2ljYWwgcGluIGdwaW82IGlzIHJvdXRlZCB0byBB
REM1X0dQSU8yXzEwMEtfUFUgKDB4NTMpLCBhbmQNCj4gdW5kZXIgJnBtNjE1MGxfYWRjIGJl
bG93IHRoZSByZWFyIGNhbWVyYSB0aGVybWlzdG9yIGNoYW5uZWwgaXMgZGVmaW5lZCBhczoN
Cg0KQWggeWVzLCBsb29rcyBsaWtlIEkgY29uZnVzZWQgZ3BpbzYgZnJvbSBkb3duc3RyZWFt
IERUIGFuZCBncGlvMiBmcm9tIA0KaW5jbHVkZS9kdC1iaW5kaW5ncy9paW8vcWNvbSxzcG1p
LXZhZGMuaA0KDQpXaWxsIGZpeCB3aXRoIHY0Li4uDQoNCj4gW1NldmVyaXR5OiBMb3ddDQo+
IFRoaXMgaXNuJ3QgYSBydW50aW1lIGJ1ZywgYnV0IHRoZXJlIGFyZSBhIGZldyBwYXRjaCBz
cGxpdCBhbmQgc3R5bGUgaXNzdWVzDQo+IGFjcm9zcyB0aGlzIGNoYW5nZToNCj4gDQo+IDEu
IEVhcmxpZXIgaW4gdGhlIHNlcmllcywgY29tbWl0IGZmMjQxMjBhMDhkNiAoImFybTY0OiBk
dHM6IHFjb206IHNtNjM1MC1sZW5hOg0KPiBBZGQgUE1LODM1MCB0aGVybWFscyIpIGFkZGVk
IHhvLXRoZXJtYWwsIGFuZCB0aGUgbmV4dCBjb21taXQgZjE3YmM0OWY2OTNkDQo+ICgiYXJt
NjQ6IGR0czogcWNvbTogc202MzUwLWxlbmE6IEFkZCBQTTcyNTBCIHRoZXJtYWxzIikgYWNj
aWRlbnRhbGx5IHJlbW92ZWQNCj4gaXQuIFJlLWFkZGluZyB4by10aGVybWFsIGhlcmUgcHV0
cyBhIFBNSzgzNTAgdGhlcm1hbCB6b25lIGludG8gdGhlIFBNNjE1MEwNCj4gdGhlcm1hbCBw
YXRjaC4gQ291bGQgeG8tdGhlcm1hbCBiZSBrZXB0IGluIHRoZSBQTUs4MzUwIHBhdGNoIGlu
c3RlYWQ/DQoNClRoZSBib3QgYWxyZWFkeSBjb21tZW50ZWQgdGhpcyBvbiB0aGUgb3RoZXIg
cGF0Y2guLi4gSSBrbm93LCByZWJhc2UgDQptaXNoYXAsIGZpeGVkLi4uDQoNCj4gMi4gVGhl
IG5ld2x5IGFkZGVkIGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oIGFuZCBkdC1iaW5kaW5ncy9p
bnB1dC9pbnB1dC5oDQo+IGluY2x1ZGVzIGF0IHRoZSB0b3Agb2YgdGhlIGZpbGUgZG8gbm90
IGFwcGVhciB0byBiZSB1c2VkIGJ5IHRoaXMgcGF0Y2guDQoNCk9oIHllcywgd2lsbCByZW1v
dmUuDQoNCj4gMy4gTGFiZWwgcmVmZXJlbmNlcyBhdCB0aGUgYm90dG9tIG9mIHRoZSBmaWxl
IGFyZSBzb3J0ZWQgYWxwaGFiZXRpY2FsbHksIHNvDQo+IHNob3VsZCAmcG02MTUwbF9ncGlv
cyBiZSBwbGFjZWQgYWZ0ZXIgJnBtNjE1MGxfZmxhc2ggcmF0aGVyIHRoYW4gYmVmb3JlDQo+
ICZwbTYxNTBsX2FkYz8NCg0KT2ggeWVzLCB3aWxsIHJlLXRyYWluIHRoZSBhbHBoYWJldCBh
bmQgZml4IHRoYXQgYXMgd2VsbC4uLiA6KQ0KDQo+IDQuIFRoZSBjbG9zaW5nIGJyYWNlIG9m
IHJlYXItY2FtLWZsYXNoLXRoZXJtQDIgaGFzIGFuIGV4dHJhIHRhYiBvZg0KPiBpbmRlbnRh
dGlvbi4NCj4gDQoNCmFsc28gZml4ZWQgaW4gdjQuLi4NCg0KLS0gDQplcmViaW9uDQoNClhN
UFA6IGVyZWJpb25AZXJlYmlvbi5ldQ0KDQpNeSBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlz
aCwgU3dlZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNClllcywgSSdtIGEgbGFuZ3VhZ2UgbmVy
ZC4gRmVlbCBmcmVlIHRvIHdyaXRlIHRvIG1lIGluIGFueSBvZiB0aGUgDQphZm9yZW1lbnRp
b25lZCBsYW5ndWFnZXMuDQoNCg==

--------------07k0mmuG0N6riQ0TbvE0P278--

--------------cC6AXiopkwI7HiSSjolv8bnl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnoEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufa0QUDAAAAAAAKCRCOr0AybgKufWVq
AQDj0uqQ9RHnWCiwFufyZ23NXdaH1uKck1ATaJo4EB+6/QD3dgNEXf3W3KPQ/RF7KjnWzKkF+twU
rYm1kRAJY8dZCw==
=kb7m
-----END PGP SIGNATURE-----

--------------cC6AXiopkwI7HiSSjolv8bnl--
