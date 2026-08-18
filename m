Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7E441627
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062217; cv=pass; b=JhgA/n4VbE2CHKLc+CTqcXcgRkhe2qVO2uCfjvM3G5Vc+kwM5vK5w0j/Ez7J6Dw4qls4likrYAjxg+1eAXLf5pSpRX3LE3XNPAuHmGDjNfaO6b6ADdGRrfsy0eucBagqAaJqOQREAzt1UAYdMVmlx6VPcGdK/vrbBlWEiqY5brU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062217; c=relaxed/simple;
	bh=ftrznCscSqPlpj0id6UlQ+EeCoZdkszgo291RJdPy9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pI1WCvSnY4XVULoWpP4jg81BQxWzOBQb/7Rj4BE/hwo9HztnQWdCxaxdo//VcWTnyTYAxPro8ZatuGwUYpC5qcdV/d9jaEgnIlxY43XgqH85Be2pGHC6vwdLYxY/657Af3RlqY5cMtFqq1WaV9/ZgpNLZeJe2HDNAFKPe9QZjEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prVyKzZo; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prVyKzZo"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18b91fb1fso818958a12.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787062214; cv=none;
        d=google.com; s=arc-20260327;
        b=do7zbbpkzNyKjRihSyUPgb8Swr3TqpSkWFHh4hd+WLByV2JHapr3MM1B2G7DEJeNrU
         08aylHiI38tmVUgLBywOuoyEQ7WeiE0fX1Wo1brV/+7Sxz8foZesmqqxui+3Irh9iZv1
         fxzIYqEwpQwoJHU/Jcye7nDGLZpNUt4OC25oqyCPVZlrQvGRD9KPqNCdre4J6ZeSBI0z
         qv+uxp2i3a0SjTn8Ox3BYhbkPwL7Zcou86GU+d2pxcI2njrsC1T3TSxwawhGuMVYmbX1
         CeazAJH5+0AAFVLowluRjkOFq9Q4io97p4RUsD1xyP19rdywUmMZKo3+3/VpWyUzVzuJ
         nZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        fh=JEjTC6JF7+upemy5B7ADHnZyGjUNSjDYYni5SqPSmGE=;
        b=sSDE/Kie8yHpwqiLFi4noiNW4xeIMai4GzncKGT+xHmSETsJMAj9mPUGcwp3SqmmtE
         Cce2NK+CEXS4X/ZStX1umRrxjTdB6lnbeFf0VUOxcUrWx2Hy6B1s5fBvGUvC0qqQRm08
         pgv9TTtf2mmZMZzdSWO/sjCT9R2vSjffu/gekan6/ChvhVGFIMpziqYwBh1hkxxVyD2Y
         gZUj8rfeoJFSzgfXuHRexrxto55VDY8LwgOdKdxHCyRcmmd2Mh0cAZqnl4989i3py3l1
         nr6bbX46R3nc7i/oKaqW0/28au7yi3qcEC+zG0NqonaBFz96sVt7W5mA2AH5wQu1zQkw
         TuJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787062214; x=1787667014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=prVyKzZoo0CXBqsOPJtdwTJRkn6qXICgAXXVqlhxllVn3PWN178/f2pS8HCYnzz7+B
         KsEfjeM5jO0qMf1pUQy1MuvQ6FBanf+saZqLmI7IXsREdAEHbgrXLcee7RCexBhl7zef
         siiqwdVShoXICF2Ahnug99QshHr5O9BKVbc6lP4BuQjaUkLZOntzbTuCPJEWHwa+Pq1v
         RCG7pHrGGF3GdqgRREFpI98pRzrEpMWB32ciObfGXOpdf1eb74G0DJBecgm2+5KHCGU7
         LahtrVNYZCqQJanz8ExRIGHc2tfalTlRG6PjGpEaGjTxOw6WIejM8Bvn1bfVC7FVc7tX
         /vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787062214; x=1787667014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=mwJ+kRFBh88pcLSiuhUXEpv0fraByOel1hyNaUumP+MwKAZ+m+aD8/mzcR8mpNQEH9
         MZXPtTFmK5bpL9jRKMlkSeEB79Y+S9QyT1KF03I0krQ3mFm/Iqtdr7lFjQA5ey4Jn7sm
         TzwzeLshEb0OX9aF3j3cZ9QnmkVB92FRfZw0jSx7otSm1x3jBN3xrfz1naFWEnsG3vFr
         PnR1E1bHhHkdPCwPN8jktp4h66/mLDrV76QSmIWwWVNl/n7jTY3fdgueBe2Y/NsO7xCX
         rsaVKU4KBhpw1B5oWzlPmB3mKP6aXg6Uxrerm3fkSJokpZ1J+8rePxYe/KzZcBiSooUu
         kOCg==
X-Forwarded-Encrypted: i=1; AHgh+RpgGtV/QILo4sIEkz6rn2B199Bx+ikYQjXAMpq/ez/PgEJ/qumwf0y5V0n0zxX9lWEX29wF9KbTEBH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwXlU6lR1zbeSTWvFmUacny1/r5qgcLnTTwPgprcg1JC+O4rv4/
	yrfIBcgZohxIFOMjzEkXOfbUOo59qYvuXC0uZahLs8mgygUTHEOcYNFwLLSe5S5GZhPI32Wqy7I
	jNiCvIBameMAILv061G6Q6eCjzSNIXhI=
X-Gm-Gg: AR+sD104oiMEC+EcHy4oeTFrL2FJA0sEAJcCx89t8/8wx2x2yA3rvmLYdY2NXoYii4p
	XbfPzDNGNOeJfcUxpjb2AeJ5gbue5peGRMU+/g6Z6lM2qMYL1iKs6Rsv8/g+tVvkNsfW56yq/Pl
	cGbKaGpEfvMtuGGztppTMDN6eYLkhkDlH96nWr14eCTJaSHk+4NlWzdBDx8c1Ec1o8AuWlKEulv
	UYFn0tIPAkIP5gPNXYuWho3LmeEyXsDUXoH6GyRZFpo1r42rnFuwNfx/Wyq4trTrBBKgTQ7cdNN
	2GvzBOIwrEScwxnElj2zNRxZ5W0xSmcSlFUg2DSbq2ytyZkJCCTfGc8qOb7gutuCQAKV6wB6qat
	uXPuwr52ApFl2SQ==
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id
 4fb4d7f45d1cf-6a38a8b7c62mr9115636a12.1.1787062214328; Tue, 18 Aug 2026
 07:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com> <20260818-convivial-manatee-of-jest-acd3f6@quoll>
In-Reply-To: <20260818-convivial-manatee-of-jest-acd3f6@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:40:02 +0530
X-Gm-Features: AcwNN1VkFAcXdnV8Yz--n3a3WkMmue2uYHuue9khptiKYSaOQgn4dqIhHktkVKs
Message-ID: <CAOWyW_4BrU+BO+KQjH1M525+0y6_YOa2C_3sjrxPzzgT46aNJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Aug 16, 2026 at 12:23:00AM +0530, Bhargav Joshi wrote:
> > Convert the Texas Instruments Keystone Device State Control binding fro=
m
> > legacy text format to DT schema.
> >
> > During the conversion, the following updates were made:
> > - Add "simple-mfd" to compatibles matching existing dts usage.
> > - Add required bus properties #address-cells, #size-cells, and ranges
> >   which were missing in text binding.
> > - Document child nodes gpio, interrupt-controller, and reset-controller=
.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> > Note: Running dt_binding_check on patch will yield a warning for
> > 'ti,keystone-reset' in the example block. The YAML conversion patch for
> > that child node is already in progress here:
> > https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-=
1-189389503324@gmail.com/
> > ---
>
> You need to send dependencies together, either in patchset or even one
> patch, depending on the case. If this has warnings then it cannot be
> applied.
Yes, but ti,keystone-reset is now already merged into linux-next, so i can
wait until it is merged into mainline then resend the patch without warning=
.

Best regards,
Bhargav
