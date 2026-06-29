Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D43B2FD4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728772; cv=pass; b=m5GVXeh+RofKNZOUb0cPnV+AxG2rAcNsf7dzT/mLscACjy3T2kHc8fSndazdRGTVIw61dUzo72vz9HSodVw/vQ/vOD9vPmsRt5obEgc1xQq5Vx7Ic/yAW6NfRuUJiynqL8Gxd4sR/FBX8BMjO/7SWFF7coBCQvC9zQ3cT9Kbh38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728772; c=relaxed/simple;
	bh=vPo/+rqkfTUkMh/4zJfZSra5jkXnJmIDRS9TcFwO23A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e37RpD2QugCPpu+dR2P/3S8Zi29LmE4D2WwLbe0N/AFdqrurzjc8mxHifNZ+HCgW/WLrCYjnwJzqTgTnhB+iOoYTqo+tTrJ06DNGHNLyceGJGwlhIa7PDaFrN6JbVPQL6rQkMETr/Su6KiZwZ9zI4N0nc1pB1KgaTriQMMGiCWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhnGKKPY; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhnGKKPY"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso1186832e0c.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782728769; cv=none;
        d=google.com; s=arc-20260327;
        b=o7iSgqjtj/HRsX92O28aOFl4+u5cEzgG4Al6Oxj8pxT1CiBw0wsfd5E3ftzjKDEE8a
         0nOusFfoUcreVnAQTIx0CXyC3HVRluGzzJYqa8UMwVEgUtTaCSGorK/HDjVajYPCvwgx
         qJQRsEoaFpCJDjqKEl6Jfvys/otqRF4+5lY28fb9fQ2QKV9c9ATNvpnQXdnl7PpQky21
         55/POIf48+HfguSPStNQx/4QZmnH2FDvDvBb83MPkcCCPcnQjYDDDCN7wbEf9D+nWFne
         bVHlURgfEaKWRhl7Llr8fc7g4mYM4p4mTQieB/lhQLN3O7KYoRBFrwseAT2q1woBefhw
         aU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2+oMmapmkVZB78B8jlXLYw17UEpB0GTQyW8V6v9d5bM=;
        fh=7wwUEF03ghd/Lb7DO+g4W/W9MC12lsAKc07hPjC8DEg=;
        b=BzeHFeekvmaS/KzE7aKcGR+C4TwZZ0I7WRbwdGXciuyk7yawty7zyqdm0eEQMOhWUd
         QzwxPiPENSVccGdwzaNlLqNEtkY82eMGV/Er/LLzaFTftiniHA6B6A4GJwwNli+RWjIt
         CL5rXYyPr3BbjcuvD1XeFp8S0QalTOulIdIYTEm4jEVm3QbyddYMefvetW4DDXjtAhU1
         kGFlzLdzzayVTXoTyao9vKEjRiCiFL6qL8CcOtkj1Y4pgaT1WlaK0I1wds96aaMNVX1u
         jEWtue5qhQexZ3KqsbliK/JkAKQ2BttrdTbpJNQN/5DbsRDvceg0HTIuS8z1zqEXWaGd
         FEnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782728769; x=1783333569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2+oMmapmkVZB78B8jlXLYw17UEpB0GTQyW8V6v9d5bM=;
        b=NhnGKKPYfnZ/PYtJV4DkwDk7wPmNjwNj+DeiHVqHP1sNMHEk+OQuUKhksQYMfX5fwr
         vewfG63TbPyAfTSU07EikrZjm+dA/4+a8vTtqX3OGvhVPKo4U15YF5BBgdD1XHZ887Xl
         kyHd4EfRBrpsGUu5T0+plmOqe777w85t4L9pIxz0Ef1wlfSl5OIqY2pAfibgXFy1MQ7A
         NGV0IXmIGsjkoaPecphOD46Brmp1OzpKQLc1x5pnshvg9D1/52RsUkUe0fmlQ1RrZnu9
         SqiCOO5Adzpxf9zUPy5eOGUlvl/KtFcjh7D0DABitHROUMZ0wdZKlwJtbZxDzIah/xsK
         PW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728769; x=1783333569;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+oMmapmkVZB78B8jlXLYw17UEpB0GTQyW8V6v9d5bM=;
        b=bno9NfzrsRfwzOeW4ToioPiSONisnXkgstJM5QRLA15S2/f6zSZvrICcxh8jFlKFie
         RCF3VHUbAfuGLH7m7nzCgb6z+zh/Diyif0YA5yJuxBSECAWZhA/cNM/tgLU+ZHcuwCrS
         TqV8+UHtS08oT3HqtSzquKtIeUcWjbdM50B6VOeM8f9WqWNdqmra+QQZhLyBPBtLXLj9
         guRwagKV0t00wzQo4n9QzLLVQYMBNyrrD5ADQGTKCasJzxOdSPqVMIX23ag/db4STiyb
         Quv1DpVqQkWPqGwzYb70FJBsY7fz2C2Vnhs42FZXeDfSoboasDHtqW9FD7DgKZnA41Sz
         d8uw==
X-Forwarded-Encrypted: i=1; AHgh+RpPXoUBRIy5TiK5/judajW8Fz4VaMPHO2mecw+w1mdk0NMuXEzSFaF5NAlwBQbGUh/qKfmej54KYSSn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Lg4q3QCJ1PX4oLkpkAW0nPoBChBLdORn5U/4ZOFBAFdaqkjm
	9BRILvmB4JbJa4ZY5Hn3fS/qsqTtvH7cwyPW1jurbA9PEqytzClh394aBF3x7azz+opynPXrp3y
	OxyDlFsEzGK88B8GJ/sJNB8zMM8S71yQ=
X-Gm-Gg: AfdE7cmiBDteeb5zEws+bu1yRN50z8HmIRxgkB+Bl/s+TyuPCVc70Tfl/ujv4d97tSw
	NKcxeJJ7uLLsNhmVJBNRg/mVkhiMJUWrzAcncbWHejCee3du1ggGr0FRNrSv579A+GBvJdmdtch
	jwf4i2gyaLeVRnX8JoPoRJvJSUqbZYLSDINm1C/Do84/Z/YGjDdMembbSvenBRHUDOh5EfbbXKH
	4EQsyNiu4BHpkIYXezwCMGl8DVhJx90AFevIhCv4V5lze+RSwhFh3u3j0wSHsWyII0RvQBcjfQK
	Tk1BZCPmeys1UtL1iKL7yDgXLP6M/g==
X-Received: by 2002:a05:6122:a2a:b0:5bd:ac34:9823 with SMTP id
 71dfb90a1353d-5bdac34a434mr867311e0c.1.1782728769445; Mon, 29 Jun 2026
 03:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Mon, 29 Jun 2026 12:25:58 +0200
X-Gm-Features: AVVi8Cfv4WdSZWRGf0w7f3ZaAnGnrkOYjnYgSwdq5ZA_oLSQCELW1XzNXr4Ya6g
Message-ID: <CA+c=wxVd6Mq9AU6Oy+11KE+PsSpkQvokwNcbCn5P+tt6b1UTWw@mail.gmail.com>
Subject: 
To: macromorgan@hotmail.com, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000008cc18065561e3ee"

--00000000000008cc18065561e3ee
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

--00000000000008cc18065561e3ee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-powkiddy-rgb10max3-fix-battery-pr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2o79d0>
X-Attachment-Id: f_mqz2o79d0

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
--00000000000008cc18065561e3ee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Disposition: attachment; 
	filename="0002-arm64-dts-rockchip-powkiddy-x55-cap-battery-charge-4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mqz2o79m1>
X-Attachment-Id: f_mqz2o79m1

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
--00000000000008cc18065561e3ee--
