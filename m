Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172383;
	b=ersTCK3gzE0JN4/hwsM6CKp053nZ6+CvyHa4QIebe/rUE/pXFjrL1ITPyH8U/dSLmA0S
	 0c18A6/jfpqFaptATO0rIYsfeq2x4RXxm5NK6hpAHIV31/nHABu8Br8/DZBdvUG1FUHDc
	 Br/Irjy4xp2jJAAoriLe7e6J6QBC5wAA8jKlm/xjcl7hYps8LvSp2ZQcBVFpbSTxFBLE0
	 Huv524iKE4XvZVyubYTTFDQQVba5iWEaO32XXCJkI+wFHTcoxOcZ053o0ow6mygRU5OwY
	 asxMom9m60GW8ZqeN4PUy+i5xy+tfEQqaTfzGvBQrU+6zYMu6n3rsz8Td9nCsBj5SMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
	b=y3oRYnhYDjq+roohMBYed1F1Q7RnEz/m/QB9qSNf3oB8tE32KeVKDHEH5WTWc7e89k4Y
	 JXWS406axzNRqk1w/2r919LatC1JV5gf/tF2o4Cxu+3N0lXz8pBbpQ3vh89Yc+N1mwWQC
	 yk76it1Hi66Y2IYfO/BU9kPDX6MTlfTJgB2VUNM51Qi7kmVjo1OvRX8YWmlNCWrhJQ5CP
	 uRUhGI0fVoJ5tW8+eiPKpgmtBxdh+zhd8uN3JzZRci1i2j8+37iv739KZkr0Vvwk+uqU9
	 aM5J9nUvWYPVT6c9llnJH5fBTzM4+zhrVlyot0P7/lVrw74tmfKFEIgCluB0rjGpkuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pqffzjLB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59799606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59799606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pqffzjLB
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c05273c38so256504d50.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172382; cv=none;
        d=google.com; s=arc-20260327;
        b=fl4SFqCc6pVuXPqtxuvl16p39iKPoE+YchXtD3euipK33T39kQmasWUJj7U2EDBt4k
         bIcIBguPPSWwm7RjBFqtY6dPabwXwkdREXOquOk8sWh8LpN8tm6SyVYf4DUhPlcYOWzf
         /KUXtvNHg7zhK94zrFGIMIrzOiSMuWGfbWAXleXgEp0UnQr01rXn0xYPzKV6yKYTK4nq
         q5I5NuMEAcDPhuGDt3OUdUPC+ApImNT5FJRRUKyOud/cnhArvQGgCoSY7B5C6T5ABZXE
         qcQdhCfHH9I3b8TpjdERF1fhPuvW7UT3Fpb8OIlryYJFogivAo9g+h15K77aPikz+Vs2
         91dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        fh=+Cc+8rDJrIbXwiU9LfAA3FaSUrJpxsYbrqQoi+2/rSA=;
        b=fHjl7SQwmPwYMxIwqDwdWI/bk9LRuaTwC0t9cfapJHj68zxOUv8aejo+tdZc2k65Fh
         HsA7vXXhwRXqL8/pRtB2HCb7aX+2r0SCVmVmOgXfo9niA768xUY0NLlCdiBTkOod7Ymh
         RoHnOhaVe8UAxwv+7DufVX7epMb0kA+fduyAgc/OG37/uSmvLFTyUnM65MQhbUJuB0kw
         R3ztfJsczWf96DnPsKr2aprlJ8EyGH2h+oB3BUaNWYb0GgjHZyN/jC2QFTt4Bpl3zQOy
         MJQC1VhMOlv5TGMvFssrlasz3HFqvvL58py8eO6YYVxv5UfMEGGDiMVTg0zzCsyM7wQL
         svrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172382; x=1794777182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=pqffzjLBdDGNrfHUi5kCes/ULy62J13uQQkGThThgnMDZNzJ+gUxu3e6roaR6ck31d
         fRwLxWlkBfGNWm8/uEAQ1UvjSv/rAdjTp4+wvHgX4gI3KiQ9sFcvCgZzvbZEEbRbhaFr
         sCv9kiRelvwO1+1flT1owAsmcTE2VBWbukd1mqQ9Uo9QGFL1BKp02PQW4pqpvTj2no/D
         KcaQWbRImQ9GgQoU4eMui2hmBkrglw4Ee2vhVn92O2B2goN5LHxGGtiKK0j2x+vdlKeV
         +FCgbnYAeETXlghQHSrdGe+rfYP3XVvTV321FcbgTbC3gcyTAtqsvkMIale7nrytTOzv
         0vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172382; x=1794777182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=zPQzMJPkhG4Rp8/iTCv8GZitqC0BzCA67iy1xuy3rIYWAWkbebJHGHmb2YZ5srmU6j
         /XgnogesyvINDMiLpFtvKFeqFFkrXN960HA3VexhVT36YOKiTj5y1wWnt/P1n72zIe7n
         ZRu7HmaPKNNIdwTdmtz9xUfC27Y0JfX2ELz3PZsGFx/aAsBtp29LC+bf1qdOfe72bsIJ
         LJcn6ILVTLKfGsFcPQzNmKdXgPZM8YZYRp2EPxsjM9cv7kZq6zGDhyvC4jAPSLf+yHjq
         lsefd7DOA4VDpKenz3vUR47VFFdIljHUATCxlXgd2z4gyQnp5Mk+qKBHWGI4J2rOz6Nw
         RWQA==
X-Forwarded-Encrypted: i=1; AL+hErFoQ7qYDlf2FZZB1sI2w1cbYr09YI6EVtlIv8hhU5jQ3sy3JXQkEqe5FYkgjUXZRnYID5+bdMK+5kUT@vger.kernel.org
X-Gm-Message-State: APuU4Z+yEDuzOE4MaYyZ+Rt+t9HcN7WU6iLLSEWrQ7uOmZlsSe5ZTfrH
	7/hollI6RAoNBU0GeFB4EYTykHRhbxsDBpVQAvsx8qzdY7tofZrmoSuKiwY0Jc6UhX9ivs6Dbcc
	EPpkfR/9Hy+LtShezSi8mkK+j1fO7Lk4=
X-Gm-Gg: AYBFou3XSNIb45ynW4U+Jn35Qqs0QGCLKl+Dcig7O5BKn+1Vuy00c+SM1yoAKN6clRp
	onyJLNcvjJ6HCaoxiYwhBcrbot3JZ3jkZOINVt347G9iEOe0ZYMGZcT0z+8hI0q+vX/dhepjmkV
	d3z8KkZLUqcIeaclp4/JuZFlYSMJTGjGUHp8BjIKrm/nDs/uiBuLN9Fo089cHKqTeW5hzujSfxk
	aeMXTLwP4E69oAztwUie4VeHvzMqg4eadxOPdNGuyrfHLIvSKREqwrKMVyX1MuGtcJp46EeaG8H
	SAOZsEv1cJ4AkFv7839gGQfDuUTUmZ/Q4gIe9QLqD1dRLxc5583rAZEnrIkKUyplKQXPK5C40s/
	d4mkF4S8GnjzH4YfuYiXuTlZPKgO15k7x1WKupvb1qKJnZXvOc2K9b2q/UJx6D0ns5WCokyuyHj
	DsOKxNMuYY/YY+0KM=
X-Received: by 2002:a05:690e:1917:b0:677:ceec:5eb6 with SMTP id
 956f58d0204a3-67c3da75649mr1372951d50.91.1794172382380; Sun, 08 Nov 2026
 13:13:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at> <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
In-Reply-To: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:12:51 +0100
X-Gm-Features: AclHuK-s_rDsDj1PWZlIOcV5ImuQxceuPlDPh6uQEE-d_X3ekVMWkJWbJHC7kWk
Message-ID: <CAFBinCADS55=UYVXRFkavSXQFtpCGG-wiXG9r2PSRWPFnppcww@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:07=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
> <christian.koever-draxl@student.uibk.ac.at> wrote:
> >
> > From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> >
> > The S4 CPU sensor reads its calibration through the secure monitor and
> > otherwise matches the T7 setup, including the separate bus and
> > functional clocks, so reuse the T7 data for it.
Sorry for following up so quickly. I think I mis-understood this.
From what I see in the dt-bindings patch the thermal sensor(s) on S4
and T7 are fully identical. If that's the case then sashiko is right
and this patch needs to be dropped (and replaced by using t7 as a
fallback compatible string) in dt-bindings and .dtsi
