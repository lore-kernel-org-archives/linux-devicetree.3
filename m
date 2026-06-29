Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693773B3884
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728463; cv=pass; b=JvBbl1oqWGkEoGbf5sNTl/MYoG8k9B+Y2MTdm0AHmdfcYzgRLmRorQ2upuKVQjdzsp1wgdBtXf9f7s4AFSn1tyQ/n+AfR41DkW3UpQ2rC7PwM7BE087tXwqsxbDqbcVFKmU15T3KIduGznZYARfulSC2zXtB4xynbfZVsg0lbXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728463; c=relaxed/simple;
	bh=XPUlhNvwbPfV0piojj8TJNOH1CRHE4toNmc7FtvpkNg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nYmniKywsO2UsWWBVb8ESkHhs4SXyaG/T4lLrC8+nkVY7DbZAKXMHsoW2ISdOynDL41dh6yfwQ8Q5K6h2CVwyatNKWGq9WAVkOQoE47wTRkIlhVfSzKqHiAtIjkYQZf5OP4ekRIMogs0+paLjzu5H4UQkmIUjW9yz7Rq9Luf8xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spE7D/rl; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spE7D/rl"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7380954d1c6so387780137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782728460; cv=none;
        d=google.com; s=arc-20260327;
        b=szGwFSE96VdAb7mX0tKq6rs1Qt48ocWsZFqqCzCjbxiU0YxD72f2gKqn0YCspPExHn
         yiNke+hMqeCFHVViuvmnnAv6OkwwZcjRsnMnvuHBqsO9GEgASNlFeG9C/d32Bz/68Yqk
         VZbpQBj53zZiKbEtCAqyHwBf6o6Vzs5DWUjK4WwigYSobuQ7M1vq6wlJvpf74RrKeKSW
         C/yRzTAto74j9dIGtZIwD5lN8GWyQ4zHlPya6wEUvzz/uHvoqvOLWuhIRXUjy6zq1JID
         ij6Dnq35igN7LxzsF0gf5DcukjaNlyKvpdx8AH4E3/FTSDzHjX6zx8LhvlUmalNfMWK1
         Obkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MLImbyxpXyACNMXvpjuwyMXjbSQbatPo/ZCDzXRbWMo=;
        fh=38Bd8Qu23Zc56YQ/aWVQpGtTQlCLocMI1AH4bYP3AvU=;
        b=LqysdrKl+GgI/pUBYTs1a8/OvUpoGNvyo0eA2EmFzk9DAR6WMfgjqllNuPhGb3StLe
         RPSnhkRIprLWogK+0+dTYcrFaLVWw6U4VVnNqLefzlIwUKLgTdwdFd/wfgbttIoUlKJ5
         IwOyLUqODMmVx1KNc14rg2Ni2raeoU89iRAU25psg0ObENuMU2hbjYmu9Oq/9jxbtobr
         JmAzusXORSzoIHwzkCcV8Eme5hXVrpgjIworWApuuKoPmz9kMbRwIoT0c+Kl+Ck0Oc61
         /5rY112euBmSOGUOY2+2FZ6VtzRNBCg2glvz28HRF2aagbRXyHEl8LvD0Xxr+x/CkptA
         wkxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782728460; x=1783333260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MLImbyxpXyACNMXvpjuwyMXjbSQbatPo/ZCDzXRbWMo=;
        b=spE7D/rlVtXkqp90esHh1pXaE/JVM5TxvgQp0et+aqCxeMxIqn7+y1BjbtspPvfS3Y
         Ee4FdZ8zf1W3pyZspf72ONRz9A3I7xdkmkAjwRIYILaak45d0t3p5eGZvp/E2OJEyuh0
         NR8cYHWT6hqW1Bud4vCpH9A7+NX+TlZgOHfP6JEfUbdIJ2dauN5gwst9mwAVwVRflyz9
         cVUWIir+jmrvKUi1un4lhw8iCgvzC0pUDQU5Q+oXePFKXAmehnE9NkvDTdTAZyTfyz0Y
         MToVObotOGUcexmBHGrqBBYlQp8bh0EiRbe7pYrFyZqLjBqgSJKFiUJMSw1OWbMLvLY4
         YutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728460; x=1783333260;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLImbyxpXyACNMXvpjuwyMXjbSQbatPo/ZCDzXRbWMo=;
        b=oh3XCCvVQrPpg5YdPmLbyje0ytVI0QfLQ20V5h2iZJ9Hvz3o8PAySlDD1Ru9N7OGZD
         qHzXW4CL1f+HMXlmuBC3zZqdC80uVUZOlcZuXJ8BhcUqIKsKtPPql1phAH/CfZ/UfPTl
         bS6tB+aZ66AsrtddvXIn5r6iNbuvutuvUweEN51a6lm1ClinyF89OBIEgshzHIDlV9CD
         ksRrZFr8Y8RiHBCZgncczAmc1UjQpUJI6ejw8JE+utvTldkHmyt2wFESaLudNevNTf4w
         lF2/MrHSctqE/TicQOp/F0wXczXbRxOSVmsUHe6tnnqwfCj9hFKBQlM/mO+ZRRCEFcR8
         dt1g==
X-Forwarded-Encrypted: i=1; AHgh+Rpr4Z1abuMN107S1FTwE0e63Y6K3B7uwi9t25OSZjhQj4Nzs72TiMK6w2EblTLP9++Dfd433WlQI0KB@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBzzvcugAy+sFYFxFygs5y13UqgTJgyXRBcUjCKKsD+suvH9L
	TAn+KNxl3unRHblTIMkw8UXKGF1vAUrFyIjK2u7h4AqA3CHrg8EThhwM3N+anP4uHxBZzrvX90e
	RH2ZXS93ffBxtlhFh5gTIxgr67wJjmxA=
X-Gm-Gg: AfdE7clqS4vam4N/WWpvJrB+yl/N2DUsdIn0OvxYeJq/+lh11P0t//vpbbL+3FnRGpV
	A0DeSY6OsddVxyIUzQTv+OeKe9KWOuFP9xiQ/tlKBBr1nHlH4sTHKZ56ruwApDUmugC8AEjeXjD
	+MiLjLmVgh+qvPoNkli9XQAox8s8RrsVeKOJ4Wb4VWgrflJTLPLRrdy10IATt3Z8Bpmw9Vvv3CT
	77vkFjiaUL1xUfOhfrWPbclt6+BR3E0KLNt7H2zm/fmipHpoBYz1mpP94k2AdxnGvmNMnPFtrl2
	+w2W9ACZF8H5gDMWjLpsKWYVqh21Bg==
X-Received: by 2002:a05:6102:4b16:b0:604:f849:462e with SMTP id
 ada2fe7eead31-734366c93a2mr6477477137.25.1782728460247; Mon, 29 Jun 2026
 03:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Mon, 29 Jun 2026 12:20:49 +0200
X-Gm-Features: AVVi8CcdfHhqppWzPoZ2UwCsu2T1n_krbBEngAghARXV1fDAlFq9kPI5O2kqfLw
Message-ID: <CA+c=wxVGQM9HvjB6OR=+yznr5mW5+7SY8i=37y8y9qEkf6c=rA@mail.gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: fix Li-Po overcharge on Powkiddy
 RGB10 Max 3 / X55
To: macromorgan@hotmail.com, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000009ac299065561d0e7"

--0000000000009ac299065561d0e7
Content-Type: multipart/alternative; boundary="0000000000009ac298065561d0e5"

--0000000000009ac298065561d0e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris, Heiko,

While bringing up a couple of Powkiddy RK3566 handhelds I ran into a
battery problem that turns out to be in the device trees, and it has
already cost me two packs, so I'd like to get it fixed for everyone.

Both battery nodes charge the cell above its own declared full voltage:

rk3566-powkiddy-rk2023.dtsi (inherited by the RGB10 Max 3):
constant-charge-voltage-max-microvolt =3D 4250000 (4.25 V),
but voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
are both 4172000 (4.172 V).

rk3566-powkiddy-x55.dts:
constant-charge-voltage-max-microvolt =3D 4300000 (4.30 V),
but voltage-max-design-microvolt and the ocv-capacity-table-0 100% point
are both 4138000 (4.138 V).

So the charger drives each cell ~80=E2=80=93160 mV past its own OCV-100% po=
int on
every cycle. On a standard 4.2 V Li-Po that is an overcharge: it raises the
cell's internal resistance and kills the pack early. The symptom is
textbook =E2=80=94 the pack reads a normal voltage/SoC while on the charger=
 but
collapses under load and shuts the device off the moment it's unplugged. I
lost two packs to this before tracing it to the DT; capping the charge
voltage at 4.2 V (verified at the rk817 CHRG_OUT register) stopped the
damage, and a third, already-degraded pack stabilised.

Patch 1 also corrects the RGB10 Max 3 design capacity: it ships a 4000 mAh
cell but inherits the 3151 mAh value from rk2023.dtsi. I did this as a
per-board override so I don't touch the shared profile, which may well be
correct for the RGB30 and other rk2023 users.

One thing worth a look on your side: the shared rk3566-powkiddy-rk2023.dtsi
default itself (4.25 V against a 4.172 V OCV-100% point) looks like it
would overcharge any device using it, not just the RGB10 Max 3 =E2=80=94 bu=
t I only
have the two units above to test on, so I've kept the fix scoped to what I
can verify.

Thanks a lot for all the handheld DT work; none of these devices would run
mainline without it.

Juan Manuel Lopez Carrillo

--0000000000009ac298065561d0e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chris, Heiko,<br><br>While bringing up a couple of Powk=
iddy RK3566 handhelds I ran into a battery problem that turns out to be in =
the device trees, and it has already cost me two packs, so I&#39;d like to =
get it fixed for everyone.<br><br>Both battery nodes charge the cell above =
its own declared full voltage:<br><br>rk3566-powkiddy-rk2023.dtsi (inherite=
d by the RGB10 Max 3):<br>constant-charge-voltage-max-microvolt =3D 4250000=
 (4.25 V),<br>but voltage-max-design-microvolt and the ocv-capacity-table-0=
 100% point are both 4172000 (4.172 V).<br><br>rk3566-powkiddy-x55.dts:<br>=
constant-charge-voltage-max-microvolt =3D 4300000 (4.30 V),<br>but voltage-=
max-design-microvolt and the ocv-capacity-table-0 100% point are both 41380=
00 (4.138 V).<br><br>So the charger drives each cell ~80=E2=80=93160 mV pas=
t its own OCV-100% point on every cycle. On a standard 4.2 V Li-Po that is =
an overcharge: it raises the cell&#39;s internal resistance and kills the p=
ack early. The symptom is textbook =E2=80=94 the pack reads a normal voltag=
e/SoC while on the charger but collapses under load and shuts the device of=
f the moment it&#39;s unplugged. I lost two packs to this before tracing it=
 to the DT; capping the charge voltage at 4.2 V (verified at the rk817 CHRG=
_OUT register) stopped the damage, and a third, already-degraded pack stabi=
lised.<br><br>Patch 1 also corrects the RGB10 Max 3 design capacity: it shi=
ps a 4000 mAh cell but inherits the 3151 mAh value from rk2023.dtsi. I did =
this as a per-board override so I don&#39;t touch the shared profile, which=
 may well be correct for the RGB30 and other rk2023 users.<br><br>One thing=
 worth a look on your side: the shared rk3566-powkiddy-rk2023.dtsi default =
itself (4.25 V against a 4.172 V OCV-100% point) looks like it would overch=
arge any device using it, not just the RGB10 Max 3 =E2=80=94 but I only hav=
e the two units above to test on, so I&#39;ve kept the fix scoped to what I=
 can verify.<br><br>Thanks a lot for all the handheld DT work; none of thes=
e devices would run mainline without it.<br><br>Juan Manuel Lopez Carrillo<=
/div>

--0000000000009ac298065561d0e5--
--0000000000009ac299065561d0e7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2hhs60>
X-Attachment-Id: f_mqz2hhs60

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
--0000000000009ac299065561d0e7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Disposition: attachment; 
	filename="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2hhsi1>
X-Attachment-Id: f_mqz2hhsi1

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
--0000000000009ac299065561d0e7--
