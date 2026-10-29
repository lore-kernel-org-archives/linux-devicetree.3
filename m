Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266930;
	b=Ia3zA9R1Gs2jmpVThswPPkDOJxbAS7L6tfauLZU0KYus3JedV+nfHPz2h5e0jJnn1Rwo
	 P9ChjtobGBQX4e36PCjcuYXs2uZD1owLaYLekzZaTYmYCN1PtAgQLhs7ekjnHEMbnDLlB
	 a1ESGxrgDq6ydigxR9i8sae4j3g6zdz/O0s2JLDBnpvaeJO3QPv5dfrMtGyYsLSWz1/6e
	 TJhC/G+u5OKuZo639KpyKV+5ND3UOXL1tagcYNOCOwolBDP+mRUU/WfoFjnmiScGHlWJW
	 4EXmJv2qivtx0wCZDlOzDzLe4o5imswRltUL9VHBojr1J1x3ElYvWdsQt4D6VaU9ZAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
	b=Ohs5P4l1ayAPinjfYbc0pxpeRs1bv3/e14BCPZR1N0EWgQE93huZO/6IZR24m6GS0Gm0
	 52KMAPQi0l1bchZTKm5q+xMiRdVnZ4g6dapLqQjco3lpLLl7ylbc1Mt5ernh0JvB+QztM
	 reU8ajpNSHgKtgK9XiM7oUxeLOhSwhBH5YSisZjXipV3RldpahF+zgypYCMA1lYUYLENp
	 NVyMCRfBFsIv024kYy5iaMYveqWUP+zX7ujgIn7WIU+hcJj2zPsmmYGcMuUW8pS0/v+y1
	 8k22Zhb2ij+mcKAhgRAKI5sPwjwRU1coQ7xSGrUakTlrvwy+cHF1dRB+PWGDDK+GZGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeJiEnSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C4606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeJiEnSB
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1077145a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793266929; cv=none;
        d=google.com; s=arc-20260327;
        b=efdWpNUMeury721Jx70w0bjvkjD8Mp26Q8NnlQSa3RmM6WCnWtGaWryLMfPxN3Duni
         sYrvnFQ+On9krRB1YpAltVqGFs48wOZnTl/pxwOYXITF/tXWcx0zPGpYbh5sxftU7/pX
         IjFhvF/pCsKHp221UPF/i6XFsrWsJ5qCGqkUj4PrmzqafXbL79IdnU1fRt/1EuIIgBQ9
         Kh4uAkFQg4BWSwBr30NVXW1zLfqO+kibXGmC0VftYcr3BXefnu/nL4dagaQKx9WgBkbT
         GNiPWMJbNuhrzgzCtLmEmXSTaETBmxJd3jMmtPLZBtXmotO5shUogJ3K4z2c67AGOtzK
         uc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        fh=Rw8/SUki7aygrBwlKhD511F0XXCFWOyLyinjXEfHQ6M=;
        b=hh/FnvttY6ZgKFuKRnPIYdavFI2hvogV0oR8kyF8yqTYCw8qC1g2j5sfbRffgVLbjo
         1NDpZYdIg+gnQprwHauyeF9EM73/sT+85MhDChKmk/fAnaa/Bl752vbVB5foeE2OIFXC
         euutl42C6CmAe+nKaZmSM6SmuG6upRYwe5eK+c2qxZwRVZZ8lAgBB1is1lWmZAiuvpUm
         uj4ghQ1pmYHcVkfThSfKZN74mtyuRrrKHvXPceahsEi9uKCT7q5a2vDd/AZRAtiNRHfL
         +QbvKG7JlNaJ5MhRh7Hq3SaUqO4X+OjFbJw6+iskCNqSZZhMjdb4udLBCPX3TjePelBJ
         Y/2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266929; x=1793871729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        b=FeJiEnSBGzpALeBQoSCXqrXVeGtHIqHQm1RiyCDp8A5UiBotxzwPqFwSWnnc7nuNZY
         JSnGALPrRT3GQs2xMlnS5g1FTf59OsQrUCbgF72OzoqZHVHPt0YTgeEKtthiL0n6dyVC
         kwKQd6OoDGvEPHrE31nYo9VOpjaPik5vuMuYjNhLX478fl94ecZQ4RY4E1sz1e/re/fZ
         8BcDrT8xPKFoZaYoa/kXqd50Ku9O8CpmHUHK3zX3QwxuwZjE0o6mzSLVeOIaB+ZzrMPh
         GBi4kismPeZcSUvQe3dyrYgmHJnxwEX8o2E8jXTkZoNAfsNa/pN5CorJTudIasphByvQ
         hx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266929; x=1793871729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qtrtCCt8ajLlat3Ue7vXo1YFqTDCb02aV3VEF/yq9o=;
        b=bitsQMR8kdmjtskE2aUNIfSe6gLWLAWkriS/z1U2tD3L6hu6brzj00p7/GWx87K3xL
         gEo4MB65QaZAUx6Xvqi3BbaE9JS7SkUO3phFQ+3sJ3ROuzNsUSplqVzqURqBISs6UbAP
         6D71KPZy0w6oxoakTWXjqGsHJ9evg4VBLLLBOwSfSi9KP/Ze97IaMHUVyxWVgPyjHIT+
         xgA95AIP6J16fRXN1L54xumC5uJlQq+Qgtd+UuX+Ehm+HlsRR7u11ELUtL5CJycalCiY
         BO2aaPQRqWegmfvQCI8BBlxNMpKrUr+w945mo1yyu86+XudOux9WGERMX11nr73vMNVn
         SDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU/DeajtGFFhG53P+8UELV/qSagJsf9mWeFSFSF0VKxR/SaJ0dO3rNsh9w89c4CTRH5tNDqJw/vlAB@vger.kernel.org
X-Gm-Message-State: AFq9FYJRH7n1D+ZPyJcr8rCTaO3O7u3ufL+M2QPizVezJBYR1NeU8YWU
	uFn5R0rtwgNESEhlAydejUtDdQ+9AOxfrD29jzL3UkoC6qJMOl+v1+wzSdAtc38wsIPZq/PmEE3
	2q8yrdsl3nRWxSRnwROaY8RZYz5/kiY8wHjEnysZATg==
X-Gm-Gg: AYBFou0+u/to0UF4dO3LgLJ6LjiRr4mryyjD4skqO0fn/dSuCDDPQaQsNp+Aijz9OSb
	wraR9iHOUoFZqjw3RRNJsAxU4h0Uz7V+0aL9K9fd06MR7+dOyAFljfwnPxLrl3dGfQoBtXw9A2n
	xrbxq1yhKHH2ohbOXRlWXDtgr2+OQL83JJa9r7dyD7aSq+xFu7wDWC/RRiFN6jj7KLz8uThtWOj
	55bqT4eiPlwikdwV0fD8pTaalUMZ1LN2gMpIT/xmON0UPTH21sFXv5CwwKpWW8Mmd4Xcd0gFD9q
	NEjdmCe4LyWqn9YWKWc8Jspxo+s4bQj8h2qFlM8vkkYDA3p1LZznVYNijfZedZIAgsNVKSImokA
	T+0tQkQoIwWhNtsu9mJ/m+cFra04BvkLoJSdVnZL/n+PKHFXdRUUMgsosNOjmVrVKiDj5k6kP80
	rI1J+uGJQO5bFYDqJppws77WpSJLzOthHx9utn0MjNaPngdoWFajdq
X-Received: by 2002:a17:90b:4fc1:b0:3ac:ffb8:1809 with SMTP id
 98e67ed59e1d1-3ae58155cc9mr3605890a91.39.1793266928572; Thu, 29 Oct 2026
 02:42:08 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028194046.49784-1-lefteris.koutrakis@gmail.com> <3f909a67-ffbd-49ff-a51c-e08cc15a5ec0@kernel.org>
In-Reply-To: <3f909a67-ffbd-49ff-a51c-e08cc15a5ec0@kernel.org>
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Date: Thu, 29 Oct 2026 11:41:57 +0200
X-Gm-Features: AclHuK8yHJRvx79goquoGhQ3WCQBCYrasuceHrTn8B1eFtMqJ1aC_0GYMn7nf-I
Message-ID: <CAEFrfd=ksR01FaS49nPTbHQ4c6y6idPR-2EN8SkAHA_uqqXjNg@mail.gmail.com>
Subject: Re: [PATCH v6] powerpc/dts: Add Device Tree for WatchGuard Firebox
 T30 (v6)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maddy@linux.ibm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, sashiko-bot@kernel.org
Content-Type: multipart/mixed; boundary="00000000000043fac7065ef77ede"

--00000000000043fac7065ef77ede
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
=CE=A3=CF=85=CE=BD=CE=B7=CE=BC=CE=BC=CE=AD=CE=BD=CE=B1
10:48=E2=80=AF=CF=80.=CE=BC. (=CF=80=CF=81=CE=B9=CE=BD =CE=B1=CF=80=CF=8C 4=
8 =CE=BB=CE=B5=CF=80=CF=84=CE=AC)
=CF=80=CF=81=CE=BF=CF=82 Krzysztof

Hi Krzysztof,

Apologies for the double email. I forgot to use "Reply All" in my
previous message, so I am resending this to ensure the mailing lists
are properly included.

Thank you for your feedback and for pointing out the issues. You are
absolutely right.

My previous submission was a mistake; it was generated from within an
OpenWrt build tree instead of the upstream Linux repository, which
resulted in incorrect paths and redundant files being included. I also
missed the guidelines regarding the imperative mood and line wrapping
in the commit message.

I have now cloned the upstream torvalds/linux tree and created a clean
v2 patch. The commit message has been rewritten properly, and the
patch now only introduces the dts file in the correct
arch/powerpc/boot/dts/fsl/ path, along with the necessary Makefile and
vendor-prefixes.yaml additions.

I ran checkpatch.pl on the new patch (it reports 0 errors; the
remaining warnings are mostly about undocumented compatible strings
for older chips, which I hope are acceptable).

Please find the v2 patch attached. Let me know if any further
adjustments are needed.

Best regards,
Lefteris Koutrakis

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=AD=CE=BC 29 =CE=9F=CE=BA=CF=84 2026 =CF=
=83=CF=84=CE=B9=CF=82 9:17=E2=80=AF=CF=80.=CE=BC., =CE=BF/=CE=B7 Krzysztof =
Kozlowski
<krzk@kernel.org> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> On 28/10/2026 20:40, Lefteris Koutrakis wrote:
> > This commit adds initial device tree support for the WatchGuard Firebox=
 T30
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
>
> > board and enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
> > arch/powerpc/boot/dts/fsl/Makefile. It also documents the watchguard ve=
ndor
> > prefix in vendor-prefixes.yaml.
> >
> > Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
> > ---
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/powerpc/boot/dts/fsl/Makefile            |   1 +
> >  arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
> >  .../arch/powerpc/boot/dts/firebox-t30.dts     | 386 ++++++++++++++++++
> >  4 files changed, 775 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/vendor-prefixes.y=
aml
> >  create mode 100644 arch/powerpc/boot/dts/fsl/Makefile
> >  create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts
> >  create mode 100644 target/linux/mpc85xx/files/arch/powerpc/boot/dts/fi=
rebox-t30.dts
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > new file mode 100644
> > index 0000000..c78a53f
> > --- /dev/null
>
> Not existing? You are sending some random changes to us. Please slow
> down, read the docs how to use Git and how to generate patches.
> Documentation/process (including submitting patches) will be helpful.
>
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -0,0 +1,2 @@
> > +  "watchguard,":
> > +    description: WatchGuard Technologies, Inc.
> > diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts=
/fsl/Makefile
> > new file mode 100644
> > index 0000000..60caf36
>
>
>
> Best regards,
> Krzysztof

--00000000000043fac7065ef77ede
Content-Type: application/octet-stream; 
	name="v2-0001-powerpc-dts-Add-support-for-WatchGuard-Firebox-T3.patch"
Content-Disposition: attachment; 
	filename="v2-0001-powerpc-dts-Add-support-for-WatchGuard-Firebox-T3.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvtcpilx0>
X-Attachment-Id: f_mvtcpilx0

RnJvbSBmZmYwYTNiNTE3ZTlmMmU0ZWZkZDNlMWQ5ODE5Yzg1YjUxNDI0NTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMZWZ0ZXJpcyBLb3V0cmFraXMgPGxlZnRlcmlzLmtvdXRyYWtp
c0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDQ6Mzc6MjEgLTA0MDAKU3ViamVj
dDogW1BBVENIIHYyXSBwb3dlcnBjOiBkdHM6IEFkZCBzdXBwb3J0IGZvciBXYXRjaEd1YXJkIEZp
cmVib3ggVDMwCgpBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciB0aGUgV2F0Y2hH
dWFyZCBGaXJlYm94IFQzMCBib2FyZC4KRW5hYmxlIGJ1aWxkaW5nIGZpcmVib3gtdDMwLmR0YiB1
bmRlciBDT05GSUdfTVBDODV4eF9SREIgaW4gdGhlCmFyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wv
TWFrZWZpbGUuIERvY3VtZW50IHRoZSB3YXRjaGd1YXJkIHZlbmRvcgpwcmVmaXggaW4gdmVuZG9y
LXByZWZpeGVzLnlhbWwuCgpTaWduZWQtb2ZmLWJ5OiBMZWZ0ZXJpcyBLb3V0cmFraXMgPGxlZnRl
cmlzLmtvdXRyYWtpc0BnbWFpbC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgIHwgICAyICsKIGFyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvTWFr
ZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL2ZpcmVi
b3gtdDMwLmR0cyAgICAgfCAzODYgKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDM4OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2Jvb3Qv
ZHRzL2ZzbC9maXJlYm94LXQzMC5kdHMKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggNTQ3MWEwNmY5M2YxLi43
NWZlNGJjYmU1ZjkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTIwMTcsMyArMjAxNyw1IEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOgogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIC4uLgorICAid2F0Y2hn
dWFyZCwiOgorICAgIGRlc2NyaXB0aW9uOiBXYXRjaEd1YXJkIFRlY2hub2xvZ2llcywgSW5jLgpk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9NYWtlZmlsZSBiL2FyY2gvcG93
ZXJwYy9ib290L2R0cy9mc2wvTWFrZWZpbGUKaW5kZXggZDJjYzhlMWYwMDdlLi44YjVkMGFjMGVi
YWQgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvTWFrZWZpbGUKKysrIGIv
YXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9NYWtlZmlsZQpAQCAtNDQsMyArNDQsNCBAQCBkdGIt
JChDT05GSUdfR0VGX1NCQzMxMCkgKz0gZ2VmX3NiYzMxMC5kdGIKIGR0Yi0kKENPTkZJR19HRUZf
U0JDNjEwKSArPSBnZWZfc2JjNjEwLmR0YgogZHRiLSQoQ09ORklHX0dFRl9QUEM5QSkgKz0gZ2Vm
X3BwYzlhLmR0YgogZHRiLSQoQ09ORklHX01WTUU3MTAwKSArPSBtdm1lNzEwMC5kdGIKK2R0Yi0k
KENPTkZJR19NUEM4NXh4X1JEQikgKz0gZmlyZWJveC10MzAuZHRiCmRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvYm9vdC9kdHMvZnNsL2ZpcmVib3gtdDMwLmR0cyBiL2FyY2gvcG93ZXJwYy9ib290
L2R0cy9mc2wvZmlyZWJveC10MzAuZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uZWM2Y2Y5MTFjNjZmCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL2ZzbC9maXJlYm94LXQzMC5kdHMKQEAgLTAsMCArMSwzODYgQEAKKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIE9SIE1JVAorLyoKKyAqIERldmljZSBU
cmVlIGZvciBXYXRjaEd1YXJkIEZpcmVib3ggVDMwCisgKiBBdXRob3I6IExlZnRlcmlzIEtvdXRy
YWtpcyA8bGVmdGVyaXMua291dHJha2lzQGdtYWlsLmNvbT4KKyAqLworCisjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQu
aD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oPgorCisvaW5jbHVkZS8gInAx
MDIwc2ktcHJlLmR0c2kiCisKKy8geworCW1vZGVsID0gIldhdGNoZ3VhcmQgRmlyZWJveCBUMzAi
OworCWNvbXBhdGlibGUgPSAid2F0Y2hndWFyZCxmaXJlYm94LXQzMCIsICJmc2wsUDEwMjBSREIi
OworCisJbWVtb3J5IHsKKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKKwl9OworCisJY3B1cyB7
CisJCS9kZWxldGUtbm9kZS8gUG93ZXJQQyxQMTAyMEAxOworCX07CisKKwlsYmM6IGxvY2FsYnVz
QGZmZTA1MDAwIHsKKwkJcmVnID0gPDAgMHhmZmUwNTAwMCAwIDB4MTAwMD47CisJCXJhbmdlcyA9
IDwweDAgMHgwIDB4MCAweGVmYzAwMDAwIDB4NDAwMDAwPjsKKworCQlub3JAMCB7CisJCQljb21w
YXRpYmxlID0gImNmaS1mbGFzaCI7CisJCQlyZWcgPSA8MHgwIDB4MCAweDQwMDAwMD47CisJCQli
YW5rLXdpZHRoID0gPDI+OworCQkJZGV2aWNlLXdpZHRoID0gPDE+OworCisJCQlwYXJ0aXRpb25z
IHsKKwkJCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOworCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkJCSNzaXplLWNlbGxzID0gPDE+OworCisJCQkJcGFydGl0aW9uQDAgewor
CQkJCQlyZWcgPSA8MHgwIDB4MjAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItY2ZnMCI7CisKKwkJ
CQkJbnZtZW0tbGF5b3V0IHsKKwkJCQkJCWNvbXBhdGlibGUgPSAiZml4ZWQtbGF5b3V0IjsKKwkJ
CQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCQkJI3NpemUtY2VsbHMgPSA8MT47CisKKwkJ
CQkJCW1hY2FkZHJfbm9yX2NmZzBfMTgzMDogbWFjLWFkZHJlc3NAMTgzMCB7CisJCQkJCQkJY29t
cGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTgzMCAweDExPjsKKwkJCQkJ
CQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9y
X2NmZzBfMTg0NDogbWFjLWFkZHJlc3NAMTg0NCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMt
YmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg0NCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1j
ZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2NmZzBfMTg1ODogbWFj
LWFkZHJlc3NAMTg1OCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJ
cmVnID0gPDB4MTg1OCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJ
CQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2NmZzBfMTg2YzogbWFjLWFkZHJlc3NAMTg2YyB7
CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg2YyAw
eDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJ
CW1hY2FkZHJfbm9yX2NmZzBfMTg4MDogbWFjLWFkZHJlc3NAMTg4MCB7CisJCQkJCQkJY29tcGF0
aWJsZSA9ICJtYWMtYmFzZSI7CisJCQkJCQkJcmVnID0gPDB4MTg4MCAweDExPjsKKwkJCQkJCQkj
bnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKwkJCQkJCX07CisKKwkJCQkJCW1hY2FkZHJfbm9yX2Nm
ZzBfMTg5NDogbWFjLWFkZHJlc3NAMTg5NCB7CisJCQkJCQkJY29tcGF0aWJsZSA9ICJtYWMtYmFz
ZSI7CisJCQkJCQkJcmVnID0gPDB4MTg5NCAweDExPjsKKwkJCQkJCQkjbnZtZW0tY2VsbC1jZWxs
cyA9IDwxPjsKKwkJCQkJCX07CisJCQkJCX07CisJCQkJfTsKKworCQkJCXBhcnRpdGlvbkAyMDAw
MCB7CisJCQkJCXJlZyA9IDwweDIwMDAwIDB4MTAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItY2Zn
MSI7CisJCQkJfTsKKworCQkJCXBhcnRpdGlvbkAzMDAwMCB7CisJCQkJCXJlZyA9IDwweDMwMDAw
IDB4MjAwMDA+OworCQkJCQlsYWJlbCA9ICJub3ItbWZnIjsKKwkJCQl9OworCisJCQkJcGFydGl0
aW9uQDUwMDAwIHsKKwkJCQkJcmVnID0gPDB4NTAwMDAgMHhjMDAwMD47CisJCQkJCWxhYmVsID0g
Im5vci1ib290b3B0IjsKKwkJCQl9OworCisJCQkJcGFydGl0aW9uQDExMDAwMCB7CisJCQkJCXJl
ZyA9IDwweDExMDAwMCAweGMwMDAwPjsKKwkJCQkJbGFiZWwgPSAibm9yLWV4dHJhMSI7CisJCQkJ
fTsKKworCQkJCXBhcnRpdGlvbkAxZDAwMDAgeworCQkJCQlyZWcgPSA8MHgxZDAwMDAgMHhjMDAw
MD47CisJCQkJCWxhYmVsID0gIm5vci1leHRyYTIiOworCQkJCX07CisKKwkJCQlwYXJ0aXRpb25A
MjkwMDAwIHsKKwkJCQkJcmVnID0gPDB4MjkwMDAwIDB4ZTAwMDA+OworCQkJCQlsYWJlbCA9ICJu
b3ItYmFja3VwIjsKKwkJCQl9OworCisJCQkJcGFydGl0aW9uQDM3MDAwMCB7CisJCQkJCXJlZyA9
IDwweDM3MDAwMCAweDEwMDAwPjsKKwkJCQkJbGFiZWwgPSAibm9yLXVib290ZW52IjsKKwkJCQl9
OworCisJCQkJcGFydGl0aW9uQDM4MDAwMCB7CisJCQkJCXJlZyA9IDwweDM4MDAwMCAweDgwMDAw
PjsKKwkJCQkJbGFiZWwgPSAibm9yLXVib290IjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9Owor
CisJc29jOiBzb2NAZmZlMDAwMDAgeworCQlyYW5nZXMgPSA8MHgwIDB4MCAweGZmZTAwMDAwIDB4
MTAwMDAwPjsKKworCQlncGlvMDogZ3Bpby1jb250cm9sbGVyQGZjMDAgeworCQkJI2dwaW8tY2Vs
bHMgPSA8Mj47CisJCQljb21wYXRpYmxlID0gImZzbCxwcTMtZ3BpbyI7CisJCQlyZWcgPSA8MHhm
YzAwIDB4MTAwPjsKKwkJCWludGVycnVwdHMgPSA8NDcgMHgyIDAgMD47CisJCQlncGlvLWNvbnRy
b2xsZXI7CisJCX07CisKKwkJaTJjQDMwMDAgeworCQkJcnRjQDMwIHsKKwkJCQljb21wYXRpYmxl
ID0gInNpaSxzMzUzOTBhIjsKKwkJCQlyZWcgPSA8MHgzMD47CisJCQl9OworCQl9OworCisJCWky
Y0AzMTAwIHsKKwkJCXRwbUAyOSB7CisJCQkJY29tcGF0aWJsZSA9ICJhdG1lbCxhdDk3c2MzMjA0
dCI7CisJCQkJcmVnID0gPDB4Mjk+OworCQkJfTsKKwkJfTsKKworCQlzcGkwOiBzcGlANzAwMCB7
CisJCQlmbGFzaEAwIHsKKwkJCQljb21wYXRpYmxlID0gImV2ZXJzcGluLG1yMjVoMjU2IiwgImpl
ZGVjLHNwaS1ub3IiOworCQkJCXJlZyA9IDwwPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw0
MDAwMDAwMD47CisJCQkJbTI1cCxmYXN0LXJlYWQ7CisKKwkJCQlwYXJ0aXRpb25zIHsKKwkJCQkJ
Y29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisJCQkJCSNzaXplLWNlbGxzID0gPDE+OworCisJCQkJCXBhcnRpdGlvbkAwIHsKKwkJCQkJ
CXJlZyA9IDwweDAgMHg4MDAwPjsKKwkJCQkJCWxhYmVsID0gInNwaV9tdGRfMCI7CisJCQkJCX07
CisJCQkJfTsKKwkJCX07CisKKwkJCXNsaWNAMSB7CisJCQkJY29tcGF0aWJsZSA9ICJ6YXJsaW5r
LGxlODgyNjYiOworCQkJCXJlZyA9IDwxPjsKKwkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAw
MDA+OworCQkJfTsKKwkJfTsKKworCQl1c2JAMjIwMDAgeworCQkJcGh5X3R5cGUgPSAidWxwaSI7
CisJCQlkcl9tb2RlID0gImhvc3QiOworCQl9OworCisJCW1kaW9AMjQwMDAgeworCQkJc3dpdGNo
MDogc3dpdGNoQDEwIHsKKwkJCQljb21wYXRpYmxlID0gIm1hcnZlbGwsbXY4OGU2MDg1IjsKKwkJ
CQlyZWcgPSA8MHgxMD47CisKKwkJCQltZGlvIHsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisJCQkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQkJCXN3aXRjaDBwaHkwOiBldGhlcm5ldC1w
aHlAMCB7CisJCQkJCQlyZWcgPSA8MD47CisJCQkJCX07CisKKwkJCQkJc3dpdGNoMHBoeTE6IGV0
aGVybmV0LXBoeUAxIHsKKwkJCQkJCXJlZyA9IDwxPjsKKwkJCQkJfTsKKworCQkJCQlzd2l0Y2gw
cGh5MjogZXRoZXJuZXQtcGh5QDIgeworCQkJCQkJcmVnID0gPDI+OworCQkJCQl9OworCisJCQkJ
CXN3aXRjaDBwaHkzOiBldGhlcm5ldC1waHlAMyB7CisJCQkJCQlyZWcgPSA8Mz47CisJCQkJCX07
CisKKwkJCQkJc3dpdGNoMHBoeTQ6IGV0aGVybmV0LXBoeUA0IHsKKwkJCQkJCXJlZyA9IDw0PjsK
KwkJCQkJfTsKKwkJCQl9OworCisJCQkJcG9ydHMgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCQkJcG9ydEAwIHsKKwkJCQkJCXJlZyA9
IDwwPjsKKwkJCQkJCWxhYmVsID0gIndhbiI7CisJCQkJCQlwaHktaGFuZGxlID0gPCZzd2l0Y2gw
cGh5MD47CisJCQkJCQludm1lbS1jZWxscyA9IDwmbWFjYWRkcl9ub3JfY2ZnMF8xODMwIDA+Owor
CQkJCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQkJCX07CisKKwkJCQkJ
cG9ydEAxIHsKKwkJCQkJCXJlZyA9IDwxPjsKKwkJCQkJCWxhYmVsID0gImxhbjEiOworCQkJCQkJ
cGh5LWhhbmRsZSA9IDwmc3dpdGNoMHBoeTE+OworCQkJCQkJbnZtZW0tY2VsbHMgPSA8Jm1hY2Fk
ZHJfbm9yX2NmZzBfMTg0NCAwPjsKKwkJCQkJCW52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJl
c3MiOworCQkJCQl9OworCisJCQkJCXBvcnRAMiB7CisJCQkJCQlyZWcgPSA8Mj47CisJCQkJCQls
YWJlbCA9ICJsYW4yIjsKKwkJCQkJCXBoeS1oYW5kbGUgPSA8JnN3aXRjaDBwaHkyPjsKKwkJCQkJ
CW52bWVtLWNlbGxzID0gPCZtYWNhZGRyX25vcl9jZmcwXzE4NTggMD47CisJCQkJCQludm1lbS1j
ZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNzIjsKKwkJCQkJfTsKKworCQkJCQlwb3J0QDMgeworCQkJ
CQkJcmVnID0gPDM+OworCQkJCQkJbGFiZWwgPSAibGFuMyI7CisJCQkJCQlwaHktaGFuZGxlID0g
PCZzd2l0Y2gwcGh5Mz47CisJCQkJCQludm1lbS1jZWxscyA9IDwmbWFjYWRkcl9ub3JfY2ZnMF8x
ODZjIDA+OworCQkJCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQkJCX07
CisKKwkJCQkJcG9ydEA0IHsKKwkJCQkJCXJlZyA9IDw0PjsKKwkJCQkJCWxhYmVsID0gImxhbjQi
OworCQkJCQkJcGh5LWhhbmRsZSA9IDwmc3dpdGNoMHBoeTQ+OworCQkJCQkJbnZtZW0tY2VsbHMg
PSA8Jm1hY2FkZHJfbm9yX2NmZzBfMTg4MCAwPjsKKwkJCQkJCW52bWVtLWNlbGwtbmFtZXMgPSAi
bWFjLWFkZHJlc3MiOworCQkJCQl9OworCisJCQkJCXBvcnRANiB7CisJCQkJCQlyZWcgPSA8Nj47
CisJCQkJCQlsYWJlbCA9ICJjcHUiOworCQkJCQkJZXRoZXJuZXQgPSA8JmVuZXQwPjsKKwkJCQkJ
CXBoeS1tb2RlID0gInJnbWlpLWlkIjsKKworCQkJCQkJZml4ZWQtbGluayB7CisJCQkJCQkJc3Bl
ZWQgPSA8MTAwMD47CisJCQkJCQkJZnVsbC1kdXBsZXg7CisJCQkJCQl9OworCQkJCQl9OworCQkJ
CX07CisJCQl9OworCQl9OworCisJCW1kaW9AMjUwMDAgeworCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKKwkJfTsKKworCQltZGlvQDI2MDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CisKKwkJZW5ldDA6IGV0aGVybmV0QGIwMDAwIHsKKwkJCXBoeS1jb25uZWN0aW9uLXR5cGUgPSAi
cmdtaWktaWQiOworCQkJbnZtZW0tY2VsbHMgPSA8Jm1hY2FkZHJfbm9yX2NmZzBfMTgzMCAwPjsK
KwkJCW52bWVtLWNlbGwtbmFtZXMgPSAibWFjLWFkZHJlc3MiOworCisJCQlmaXhlZC1saW5rIHsK
KwkJCQlzcGVlZCA9IDwxMDAwPjsKKwkJCQlmdWxsLWR1cGxleDsKKwkJCX07CisJCX07CisKKwkJ
ZW5ldDE6IGV0aGVybmV0QGIxMDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisK
KwkJZW5ldDI6IGV0aGVybmV0QGIyMDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CisJfTsKKworCWxlZHMgeworCQljb21wYXRpYmxlID0gImdwaW8tbGVkcyI7CisKKwkJbGVkMDog
bGVkLTAgeworCQkJZ3Bpb3MgPSA8JmdwaW8wIDIgR1BJT19BQ1RJVkVfTE9XPjsKKwkJCWNvbG9y
ID0gPExFRF9DT0xPUl9JRF9PUkFOR0U+OworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fU1RB
VFVTOworCQl9OworCisJCWxlZDE6IGxlZC0xIHsKKwkJCWdwaW9zID0gPCZncGlvMCAzIEdQSU9f
QUNUSVZFX0xPVz47CisJCQljb2xvciA9IDxMRURfQ09MT1JfSURfUkVEPjsKKwkJCWZ1bmN0aW9u
ID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKKwkJfTsKKworCQlsZWQyOiBsZWQtMiB7CisJCQlncGlv
cyA9IDwmZ3BpbzAgNCBHUElPX0FDVElWRV9MT1c+OworCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lE
X0dSRUVOPjsKKwkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX1VTQjsKKwkJfTsKKworCQlsZWQz
OiBsZWQtMyB7CisJCQlncGlvcyA9IDwmZ3BpbzAgNSBHUElPX0FDVElWRV9ISUdIPjsKKwkJCWNv
bG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47CisJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9X
TEFOXzVHSFo7CisJCQlkZWZhdWx0LXN0YXRlID0gImtlZXAiOworCQl9OworCisJCWxlZDQ6IGxl
ZC00IHsKKwkJCWdwaW9zID0gPCZncGlvMCA2IEdQSU9fQUNUSVZFX0hJR0g+OworCQkJY29sb3Ig
PSA8TEVEX0NPTE9SX0lEX09SQU5HRT47CisJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9XTEFO
XzJHSFo7CisJCQlkZWZhdWx0LXN0YXRlID0gImtlZXAiOworCQl9OworCisJCWxlZDU6IGxlZC01
IHsKKwkJCWdwaW9zID0gPCZncGlvMCA3IEdQSU9fQUNUSVZFX0xPVz47CisJCQljb2xvciA9IDxM
RURfQ09MT1JfSURfR1JFRU4+OworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fUE9XRVI7CisJ
CQlkZWZhdWx0LXN0YXRlID0gIm9uIjsKKwkJfTsKKwl9OworCisJcGNpMDogcGNpZUBmZmUwOTAw
MCB7CisJCXJlZyA9IDwwIDB4ZmZlMDkwMDAgMCAweDEwMDA+OworCQlyYW5nZXMgPSA8MHgyMDAw
MDAwIDB4MCAweGEwMDAwMDAwIDAgMHhhMDAwMDAwMCAweDAgMHgyMDAwMDAwMAorCQkJICAweDEw
MDAwMDAgMHgwIDB4MDAwMDAwMDAgMCAweGZmYzEwMDAwIDB4MCAweDEwMDAwPjsKKwkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKworCQlwY2llQDAgeworCQkJcmFuZ2VzID0gPDB4MjAwMDAwMCAweDAg
MHhhMDAwMDAwMAorCQkJCSAgMHgyMDAwMDAwIDB4MCAweGEwMDAwMDAwCisJCQkJICAweDAgMHgy
MDAwMDAwMAorCisJCQkJICAweDEwMDAwMDAgMHgwIDB4MAorCQkJCSAgMHgxMDAwMDAwIDB4MCAw
eDAKKwkJCQkgIDB4MCAweDEwMDAwMD47CisJCX07CisJfTsKKworCXBjaTE6IHBjaWVAZmZlMGEw
MDAgeworCQlyZWcgPSA8MCAweGZmZTBhMDAwIDAgMHgxMDAwPjsKKwkJcmFuZ2VzID0gPDB4MjAw
MDAwMCAweDAgMHg4MDAwMDAwMCAwIDB4ODAwMDAwMDAgMHgwIDB4MjAwMDAwMDAKKwkJCSAgMHgx
MDAwMDAwIDB4MCAweDAwMDAwMDAwIDAgMHhmZmMwMDAwMCAweDAgMHgxMDAwMD47CisKKwkJcGNp
ZUAwIHsKKwkJCXJhbmdlcyA9IDwweDIwMDAwMDAgMHgwIDB4ODAwMDAwMDAKKwkJCQkgIDB4MjAw
MDAwMCAweDAgMHg4MDAwMDAwMAorCQkJCSAgMHgwIDB4MjAwMDAwMDAKKworCQkJCSAgMHgxMDAw
MDAwIDB4MCAweDAKKwkJCQkgIDB4MTAwMDAwMCAweDAgMHgwCisJCQkJICAweDAgMHgxMDAwMDA+
OworCisJCQlhdGgxMGs6IHdpZmlAMCwwIHsKKwkJCQlyZWcgPSA8MHgwMDAwIDAgMCAwIDA+Owor
CQkJCW52bWVtLWNlbGxzID0gPCZtYWNhZGRyX25vcl9jZmcwXzE4OTQgMD47CisJCQkJbnZtZW0t
Y2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisJCQl9OworCQl9OworCX07Cit9OworCisvaW5j
bHVkZS8gInAxMDIwc2ktcG9zdC5kdHNpIgotLSAKMi41My4wCgo=
--00000000000043fac7065ef77ede--
