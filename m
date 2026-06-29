Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792A3B8D5C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729192; cv=pass; b=bMyIYL5iozWuJS7vBU/Yoeazn5H7QiOol4JR7XuvjnNgtX6G5fWoHrUV0oqQqE6xkmCile3gSko++HiRK5jp1a3j5WVaHJsBgTAZKeb+3vPKbCZhRpcwxJc7ubuYbsYFvi4EbvlthM3vqVWqbTgu7HlMEuE4XK9C4wFfrTx0Ihg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729192; c=relaxed/simple;
	bh=uPNUsV/vx8wHQs+ok7nL4vgz7UWd10GIJIYT6GJ1G1g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JUjrg5WIqyitxXPEqUW+JFgfqqYS4tivArxGsC/PnyD2FOfISZgW2dxX91DYm1lEtr0kwP0lJED5IGrv9VnPo6RZG88RIr0+GH/Hfy09QBp9Y9OSeJqRAWaU0ZAJQvecaCe10cIvV//QvCXhEFBMlj7fgvr4HgSzIiF4ZPh76/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE8qBn8+; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE8qBn8+"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-728f9ecd56aso1270478137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729189; cv=none;
        d=google.com; s=arc-20260327;
        b=rJZIP4DSJdemoSckSbmQNnJYS7QW7vjX3nEYJCx11CqWWt1f8oov/6rizAkzf5md7w
         QL9QpO+Ao2ZtY7BuR6ttmGRnnbSaCFthOlhWVl1GRyfkimh0b4fgyRk8g95gkDVUbgWJ
         Eui1sA+vZO2wiNbPBvG3YfV86B6+OWebt9YKBgiu+dM/5LoQyUFGI6E8W7/ZBuQPXsU5
         jdjd29NgPnNyNpd8ZyxeGbUROLcu+wFqEm4LvIL40XU4zfWObR9z+z8u+mt7uJtqdZ3P
         SBY8AM/9NROoHV1OAD+yLdiUkCY60Hq/h8sf+ncVwCyg5d3zc0ZZclHHzs4ikgmZHcNe
         wfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        fh=04y7VHtpHgwJYcTu2BZEpz0XkoXeZMWL573vb+lBFRo=;
        b=RoJ55tM79OrwVGGFKN1j2skiziegV4MpAP5vPJ5gmjEyMnZ7j2KFguRq2ShdqUTjAh
         Bi1J3d/Puk/WK6dt5XDn9EMXyYWptnOCXXOg+WE30fGmMm8/kLjElZ86lLQ47PnqJjoP
         Sktl5hHAR/vshyIkgEWQ16NyLd9PyYy67MKYWaA62gjLyl+MDsfm0MOUQa/2RvrYvek3
         rytbM2t4Aldeo5gCOOmKDDA9rlQytU2yL1YQN32LOXRtl91t0Qvfca2YibSi4Bdq5wCm
         L9UGOSQKNUpAM+mWrDjn51NrBMXA7cz5sZ8apxdmaRYm/NWdzGWTrVq0UAKYj5n8G0VS
         pSwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782729189; x=1783333989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        b=gE8qBn8+Svdzz/0YRdAMIW0h3wRt8vH5mAoBtF1WMw0EJlRjXZjASMXoXgG04sTHUP
         y1ZlWAglVAoAZlVqmp4LhKC+dgpW/ZEqSvogRnFuufZmnH0q7F8djvBnrlimwbkj1e88
         dA1vzRTZIUJUk8RO7DMich+QwPxxRkbFZ1B/D0e+8E/muUepypXscSzHh9aV4rfbrt/u
         VnZr7PZyhfgyubJOY0G82jNA5loe7Q8uT6a1quJI3OBMd1x3NSZFILT5q24Gd5HnY1/D
         NpHMNlV6niNK52BSjOaTCQrp5mPbVHvm1+re++nyk13wFOjqh6ouxNLwp/cufrRIXUSu
         SSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729189; x=1783333989;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDqMGYnVhsBZQ1sXpSP8J8dhP+q5GofYCfFvca8AcKE=;
        b=dHeul4/oR/CkWfS56lMBbBMuicxcg8GXykgMwrUTYjxpfazsDH02tvfomncVvQuSlh
         ltFMdgyEmkLCPjPrdxf0+dAchWSE/y321B9n3HpzMcUOWncnEMdDEIe4AocVmWlARr84
         v5uccB/cpnOBifwjyuoq/AtddwMeV2yt8NR6BpZYdWMqeQhpcya082oSSj3Rt+uieZQv
         xecCLBG6xvNsHJmDovR/LdFnkdqhyMJJtb9YJb04rfirUbYhY2R8TxxyNe82RNHHxaLO
         U/+GZOOQ1Gmj7385j1fqtLgI0OQtitba4FAFgLWkZVjtXN9Zcatzi0tLK6Xm7vcHm8SR
         V2bg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtjf/Ey1kVXspK+dmL5LfryIqlRg9DFzVLINAJF2goPvPBjkf8pLH60kK6JmwxGVcsdmtf8Szp7HJM@vger.kernel.org
X-Gm-Message-State: AOJu0YyLm/AmA7TW3nd5fhhGcc1tOUpg/F5Cclx7lANWTxXo08bO7ncz
	Gihqqy8yXLFOuEWubHsnPlumzi7pZ2Y8oewPMK8hO9V4S5HE+2hNFAscfw1uxy46YX+nsF6pDgR
	hidtpLQOUikFF9CKJQRkCJzgzw8NE4mo=
X-Gm-Gg: AfdE7cmynZlhfcuVyThf98bSpZ8bjiITQu82WIvnocGiN5lZ5PL49sKMqk8kIzGYETZ
	0mkAIAhVcbcgYzo2p75F2pA2dejiaqXVuXivL0EtqH94tG9w+Pxo1aymgarZyJvr7DAHNwKuyF8
	FV7Nl8kFeJ0TKigtqgq5nGo/EyPCXGjDvGXm4PI5bdZnMSsRJpMtgSRrnlTCT6r7k8W59rHqEQt
	NRthzzMIG/zTrmT/r8Nb02SF4wt9mwVYUWL+Y9r0eSfG/AxS7fEi2/+f/UJe4CGd8BctF2HBpzf
	M0UnK8zT0gCN0IDfUFtc5dRhmnOxuA==
X-Received: by 2002:a05:6102:c10:b0:739:18ea:565f with SMTP id
 ada2fe7eead31-73918ea5a95mr618398137.21.1782729189290; Mon, 29 Jun 2026
 03:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Mon, 29 Jun 2026 12:32:58 +0200
X-Gm-Features: AVVi8Ce8OnbSifc50sa7-2oatyxo8iNF2oRrQajOiWvO-Ge81MADTdXhbhnWuCg
Message-ID: <CA+c=wxUU-mS=fiX2gCK_NH4SQPPWMqK6yrRSBSwvGZDEVaRkOA@mail.gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: fix Li-Po overcharge on Powkiddy
 RGB10 Max 3 / X55
To: macromorgan@hotmail.com, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000f2dfe065561fca9"

--0000000000000f2dfe065561fca9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris, Heiko,

While bringing up a couple of Powkiddy RK3566 handhelds I ran into a
battery problem that turns out to be in the device trees, and it has
already cost me two packs, so I'd like to get it fixed for everyone.

Both battery nodes charge the cell above its own declared full voltage:

rk3566-powkiddy-rk2023.dtsi (inherited by the RGB10 Max 3):
constant-charge-voltage-max-microvolt =3D 4250000 (4.25 V), but
voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
are both 4172000 (4.172 V).

rk3566-powkiddy-x55.dts: constant-charge-voltage-max-microvolt =3D
4300000 (4.30 V), but voltage-max-design-microvolt and the
ocv-capacity-table-0 100% point are both 4138000 (4.138 V).

So the charger drives each cell ~80=E2=80=93160 mV past its own OCV-100% po=
int
on every cycle. On a standard 4.2 V Li-Po that is an overcharge: it
raises the cell's internal resistance and kills the pack early. The
symptom is textbook =E2=80=94 the pack reads a normal voltage/SoC while on =
the
charger but collapses under load and shuts the device off the moment
it's unplugged. I lost two packs to this before tracing it to the DT;
capping the charge voltage at 4.2 V (verified at the rk817 CHRG_OUT
register) stopped the damage, and a third, already-degraded pack
stabilised.

Patch 1 also corrects the RGB10 Max 3 design capacity: it ships a 4000
mAh cell but inherits the 3151 mAh value from rk2023.dtsi. I did this
as a per-board override so I don't touch the shared profile, which may
well be correct for the RGB30 and other rk2023 users.

One thing worth a look on your side: the shared
rk3566-powkiddy-rk2023.dtsi default itself (4.25 V against a 4.172 V
OCV-100% point) looks like it would overcharge any device using it,
not just the RGB10 Max 3 =E2=80=94 but I only have the two units above to t=
est
on, so I've kept the fix scoped to what I can verify.

Thanks a lot for all the handheld DT work; none of these devices would
run mainline without it.

Juan Manuel Lopez Carrillo

--0000000000000f2dfe065561fca9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2w1d90>
X-Attachment-Id: f_mqz2w1d90

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWFuIE1hbnVlbCBMb3BleiBDYXJyaWxsbyA8anVhbm1hbnVl
bGxvcGV6Y2FycmlsbG9AZ21haWwuY29tPgpEYXRlOiBTdW4sIDI5IEp1biAyMDI2IDEyOjAwOjAw
ICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBwb3draWRk
eS1yZ2IxMG1heDM6IGZpeCBiYXR0ZXJ5CiBwcm9maWxlCgpUaGUgUG93a2lkZHkgUkdCMTAgTWF4
IDMgc2hpcHMgd2l0aCBhIDQwMDAgbUFoIHBhY2ssIGJ1dCBpdCBpbmhlcml0cyBpdHMKYmF0dGVy
eSBub2RlIGZyb20gcmszNTY2LXBvd2tpZGR5LXJrMjAyMy5kdHNpLCB3aGljaCBkZXNjcmliZXMg
YSAzMTUxIG1BaApjZWxsIGFuZCwgbW9yZSBpbXBvcnRhbnRseSwgc2V0cyBjb25zdGFudC1jaGFy
Z2Utdm9sdGFnZS1tYXgtbWljcm92b2x0IHRvCjQyNTAwMDAgKDQuMjUgVikuCgpUaGF0IGNoYXJn
ZSB2b2x0YWdlIGlzIGFib3ZlIHRoaXMgcGFjaydzIGRlY2xhcmVkIGZ1bGwgdm9sdGFnZTogdGhl
CmluaGVyaXRlZCB2b2x0YWdlLW1heC1kZXNpZ24tbWljcm92b2x0IGFuZCB0aGUgb2N2LWNhcGFj
aXR5LXRhYmxlLTAgMTAwJQpwb2ludCBhcmUgYm90aCA0MTcyMDAwICg0LjE3MiBWKS4gVGhlIGNo
YXJnZXIgdGhlcmVmb3JlIGRyaXZlcyB0aGUgY2VsbAp+NzggbVYgcGFzdCBpdHMgb3duIGRlY2xh
cmVkICJmdWxsIiBvbiBldmVyeSBjeWNsZS4KCkZvciBhIHN0YW5kYXJkIDQuMiBWIExpLVBvIHRo
aXMgaXMgYW4gb3ZlcmNoYXJnZS4gSXQgcmFpc2VzIHRoZSBjZWxsJ3MKaW50ZXJuYWwgcmVzaXN0
YW5jZSBhbmQga2lsbHMgdGhlIHBhY2sgcHJlbWF0dXJlbHkuIFRoZSBmYWlsdXJlIG1vZGUgc2Vl
bgppbiB0aGUgZmllbGQgaXMgY2hhcmFjdGVyaXN0aWM6IHRoZSBwYWNrIHJlYWRzIGEgcGxhdXNp
YmxlIHZvbHRhZ2UvU29DCndoaWxlIG9uIHRoZSBjaGFyZ2VyIGJ1dCBjb2xsYXBzZXMgdW5kZXIg
bG9hZCAoYW5kIHNodXRzIHRoZSBkZXZpY2Ugb2ZmKQphcyBzb29uIGFzIGl0IGlzIHVucGx1Z2dl
ZC4gVHdvIHBhY2tzIHdlcmUgbG9zdCB0aGlzIHdheSBiZWZvcmUgdGhlIGNhdXNlCndhcyB0cmFj
ZWQgdG8gdGhlIERULgoKT3ZlcnJpZGUgdGhlIG5vZGUgZm9yIHRoaXMgYm9hcmQgd2l0aCB0aGUg
Y29ycmVjdCA0MDAwIG1BaCBkZXNpZ24gY2FwYWNpdHkKYW5kIGEgc2FmZSA0LjIgViBjaGFyZ2Ug
Y2VpbGluZywgYXQvYmVsb3cgdGhlIGNlbGwgZGVzaWduIG1heCBhbmQgdGhlCk9DVi0xMDAlIHBv
aW50LiBUaGUgY2hhcmdlIGN1cnJlbnQgbGltaXQgKDIgQSA9IDAuNUMpIGFuZCB0aGUgT0NWIGN1
cnZlCmFyZSBsZWZ0IHVuY2hhbmdlZC4KClNpZ25lZC1vZmYtYnk6IEp1YW4gTWFudWVsIExvcGV6
IENhcnJpbGxvIDxqdWFubWFudWVsbG9wZXpjYXJyaWxsb0BnbWFpbC5jb20+Ci0tLQogYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHktcmdiMTBtYXgzLmR0cyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS1yZ2IxMG1heDMuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHktcmdiMTBtYXgzLmR0
cwotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS1yZ2Ix
MG1heDMuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTY2LXBvd2tp
ZGR5LXJnYjEwbWF4My5kdHMKQEAgLTEyLDYgKzEyLDExIEBACiAJY29tcGF0aWJsZSA9ICJwb3dr
aWRkeSxyZ2IxMG1heDMiLCAicm9ja2NoaXAscmszNTY2IjsKIH07CgorJmJhdHRlcnkgeworCWNo
YXJnZS1mdWxsLWRlc2lnbi1taWNyb2FtcC1ob3VycyA9IDw0MDAwMDAwPjsKKwljb25zdGFudC1j
aGFyZ2Utdm9sdGFnZS1tYXgtbWljcm92b2x0ID0gPDQyMDAwMDA+OworfTsKKwogJmJsdWV0b290
aCB7CiAJY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0bDg3MjNkcy1idCI7CiB9OwotLQoyLjQzLjAK
--0000000000000f2dfe065561fca9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Disposition: attachment; 
	filename="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2w1dh1>
X-Attachment-Id: f_mqz2w1dh1

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWFuIE1hbnVlbCBMb3BleiBDYXJyaWxsbyA8anVhbm1hbnVl
bGxvcGV6Y2FycmlsbG9AZ21haWwuY29tPgpEYXRlOiBTdW4sIDI5IEp1biAyMDI2IDEyOjA1OjAw
ICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzJdIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBwb3draWRk
eS14NTU6IGNhcCBiYXR0ZXJ5IGNoYXJnZQogdm9sdGFnZSBhdCA0LjJWCgpUaGUgeDU1IGJhdHRl
cnkgbm9kZSBzZXRzIGNvbnN0YW50LWNoYXJnZS12b2x0YWdlLW1heC1taWNyb3ZvbHQgdG8KNDMw
MDAwMCAoNC4zMCBWKSwgYnV0IHRoZSBzYW1lIG5vZGUgZGVjbGFyZXMgdm9sdGFnZS1tYXgtZGVz
aWduLW1pY3Jvdm9sdAphbmQgYW4gb2N2LWNhcGFjaXR5LXRhYmxlLTAgMTAwJSBwb2ludCBvZiA0
MTM4MDAwICg0LjEzOCBWKS4gVGhlIGNoYXJnZXIKdGhlcmVmb3JlIGRyaXZlcyB0aGUgcGFjayB+
MTYyIG1WIGFib3ZlIGl0cyBvd24gZGVjbGFyZWQgZnVsbCB2b2x0YWdlIG9uCmV2ZXJ5IGN5Y2xl
LgoKVGhpcyBvdmVyY2hhcmdlcyB0aGUgc3RhbmRhcmQgNC4yIFYgTGktUG8sIHJhaXNpbmcgaXRz
IGludGVybmFsIHJlc2lzdGFuY2UKYW5kIGtpbGxpbmcgaXQgZWFybHkgLSBpdCByZWFkcyBmaW5l
IG9uIHRoZSBjaGFyZ2VyIGJ1dCBjb2xsYXBzZXMgdW5kZXIKbG9hZCBvbmNlIHVucGx1Z2dlZC4g
Q2FwIHRoZSBjaGFyZ2Ugdm9sdGFnZSBhdCB0aGUgc3RhbmRhcmQsIHNhZmUgNC4yIFYuCkRlc2ln
biBjYXBhY2l0eSAoNDAwMCBtQWgpIGFuZCBjaGFyZ2UgY3VycmVudCAoMiBBKSBhcmUgYWxyZWFk
eSBjb3JyZWN0LgoKU2lnbmVkLW9mZi1ieTogSnVhbiBNYW51ZWwgTG9wZXogQ2FycmlsbG8gPGp1
YW5tYW51ZWxsb3BlemNhcnJpbGxvQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS14NTUuZHRzIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHkteDU1LmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszNTY2LXBvd2tpZGR5LXg1NS5kdHMKLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazM1NjYtcG93a2lkZHkteDU1LmR0cworKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU2Ni1wb3draWRkeS14NTUuZHRzCkBAIC03Nyw3ICs3Nyw3
IEBACiAJCWNoYXJnZS1mdWxsLWRlc2lnbi1taWNyb2FtcC1ob3VycyA9IDw0MDAwMDAwPjsKIAkJ
Y2hhcmdlLXRlcm0tY3VycmVudC1taWNyb2FtcCA9IDwzMDAwMDA+OwogCQljb25zdGFudC1jaGFy
Z2UtY3VycmVudC1tYXgtbWljcm9hbXAgPSA8MjAwMDAwMD47Ci0JCWNvbnN0YW50LWNoYXJnZS12
b2x0YWdlLW1heC1taWNyb3ZvbHQgPSA8NDMwMDAwMD47CisJCWNvbnN0YW50LWNoYXJnZS12b2x0
YWdlLW1heC1taWNyb3ZvbHQgPSA8NDIwMDAwMD47CiAJCWZhY3RvcnktaW50ZXJuYWwtcmVzaXN0
YW5jZS1taWNyby1vaG1zID0gPDkxMDAwPjsKIAkJdm9sdGFnZS1tYXgtZGVzaWduLW1pY3Jvdm9s
dCA9IDw0MTM4MDAwPjsKIAkJdm9sdGFnZS1taW4tZGVzaWduLW1pY3Jvdm9sdCA9IDwzNDAwMDAw
PjsKLS0KMi40My4wCg==
--0000000000000f2dfe065561fca9--
