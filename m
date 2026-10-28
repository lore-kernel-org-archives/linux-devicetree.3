Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224680;
	b=NevRpAo4MC9BQ6n3qwagKXKEMFRSZfOMqSGc+kkyvlU072VZ1kC4Kz21adzCHhXFR1oP
	 F1t4w7QFbkXgh8GFoe7HfDzhd56WoPCH8oOaYuNRS4BBhe0SAd3McwFUjO2YSJL1+roqL
	 OvbNYK0bTc3Hu5ITxQ/TyiWv9Sz8XyQNj/yiHkm86p1vHN9HnPTNYs8x6L+Xi13GNIWP9
	 wlbuL8lRvoHcGhcf5KPqOHbtPRJqRCGOperHVabJ4cxkITRxGQeGKXRjgrboYb1I7nrpg
	 7yEBF4NmhnPIKWp5TK1OD7/EQ4M9D0yea+8pJNIfQDnqVkszBHlrWp0DzfAnA+YDLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
	b=NmgEFFuc6+fo44nf9Bi+BvL9bavmtxba+QJP0iGEjBgSRcnQkFL6ydH1PZnJ0dXl1vCg
	 ataI0z5PyeN+5ZXOlMIufaqgBq2+m6W7jV7B2/b6+7sov5oopvkRiabcyyPa3trXHjgqt
	 eDAs8oTKCGXH8zxYDQSLMpkJMKPla8PUUB5sy9o+nwFUYb0zuG4aHyH0GC7IX0fTJRqQz
	 mB1lzMEm8jcH325xCBjIEVrtcQzgWEI8SvOHYx28gOp2g30ydSaU4rOJ0+SiL8XvO+5y1
	 igOqtcD39FpW1rP96KasqzbZCg8am9Sz7xO/W06E5Tv+NJagDs8xHGVJJFDAGiaLH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TJXw9nVM;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D189606A31D
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D189606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TJXw9nVM
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c315869241fso235648966b.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224678; x=1793829478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=TJXw9nVMV5ca1wWRJJeuCJoMXbnxon42gon35HdaUzr9aUucl7s+jlFN+fja76/h2M
         x3b2DKzjWBc8kitVg6xOLO7UKPYt4NIC+gO8euGjmAXmRCgQl05kkfhiUr45Lfm7o6Gg
         O488ZVeHhHa7/coQFY2SiSsU1W0QSJvULRJZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224678; x=1793829478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=m/eEiMIRpxragRRa538xPT2sZnoH7jIku6X3dUM+7hZMs36kL9miEio64wcsrPu65+
         0GMfrAQK+zIMcA3BHpfM3hZLLD8iASZ8Cuo6JtzXAReJ9ZsOfKefGTQI+XEqjI5QubZC
         tuf4gSXD2AtYFo2KwVKsGOjEvnHU0Vtx8jG+QjMQ954L+dtPXUvSBPY7LpCnZJtXsV7U
         EtyCVs9o8cRVRDRnYQkNX6F3Gw+omcAWsGZlcpHWrMlxa5ZxN/RETnCuiNoeDIqztohy
         du2e8Gq2C2J3yZw8MiyKOIrrsdVnr9i1YX+AUKndeT4mPthQ4d0UOb0rkXDCjljc1Wix
         tTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTAUVMUjiRg7+Z5f5O3KS4t8/IxjuIYqC8yDRUgN2gAHsmKrnPdF5oxq/bMiE3n/wGqzaawQ/j9f+8@vger.kernel.org
X-Gm-Message-State: AFq9FYKAEXxvRr70XNGOnQxDRukTh+OFChjYikQxCJ4gBL8dd51DdGqe
	Mp4+tgDoUBgzewEmunG7rVloU+WI0g/t8NEE3rGXE+kK0S1hLcHtegzLwZAsPVYvEA93/30+fkI
	/uFB1ZhX6
X-Gm-Gg: AYBFou1gPSwDULFRGFdHPSiNyJA1ofoh2RND95s54bpD3D54ARolIJvcNW7BzhItMHh
	mnspJ2gUc7k8DQXEpgR0HGxPgk4TK0gWUqA1JhoLjconPfli5NTMAfpYVTwlpbdH3UufBrGSvri
	Eb0ZUof1alUiJdMfrxzLxgBY1bBCVH4nRSlfjAZSWQ6zTsG88+hH5dB2VjrX7QAGDiu/7PAbROc
	bPUFn8MnsM0Rocl5Y4N6zezOAgF8RoEIctuuU8jrr9SCNW7L1pvk/MglBABWbz/OZPTs7FZOM9s
	W+Axt6CQpA0Rzh2Q3VpqKxrqMHSj3BWTdApOtDId1wqwFxRcpj27Dt9NfcBYLssIl7eiO4hNqoR
	J5kAp0Ytzg6LOEg0hV6y/i0iIlCdPzYL0GcU8ZQ2Wbm+sh1/mWhGWI82ort58aw/4EHbix7o3OA
	gkrultytqwEs4YYp1UiA+Kgi03vR2JfQvt2YiOLpuxnqDpKL87kEUWDEaX1up9C4DE1EuxMRk4+
	fmWqLj+dNOKH7i/ug+NfgtmPGFZlwi4ilW10lltYZVzhuMcN+UnBGkTuCNeGQD5P/uy7cw2mWnj
	HrYdvwHjWhp3d/6VlntWpa3m7y+7PWRCsq12Ra0d+c3aoVr4hkE/yVTuoG7qs5Ozs1f2
X-Received: by 2002:a17:907:6e8c:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c49bdfdf3d0mr325270766b.45.1793224678594;
        Wed, 28 Oct 2026 14:57:58 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm332921866b.23.2026.10.28.14.57.55
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:56 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b001cd92bso790309f8f.2
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLNqTQkiKVVws6GKk/XHEkqd+7OZDAQgxdl5PMpLbgUufsIYerjZvI4u4EY1Jq0418UhlUulXMOVKG@vger.kernel.org
X-Received: by 2002:a05:6000:438a:b0:48e:5d63:a4e5 with SMTP id
 ffacd0b85a97d-48e5d63a673mr7516209f8f.0.1793224674740; Wed, 28 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
In-Reply-To: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
X-Gm-Features: AclHuK9SPdgtx9SZKlcuIND28eXBX-71-arKGnifL9h09UJM3B-5CnKYQnrW6-4
Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -11,31 +11,195 @@ original device tree.
> > +    if comp =3D=3D 'xz':
> > +        return lzma.compress(raw_bytes, format=3Dlzma.FORMAT_XZ)
>
> Python's default integrity check for FORMAT_XZ is CRC64, but embedded
> xz decoders often support only CRC32. The kernel's lib/xz is one of
> them, which is why scripts/xz_wrap.sh passes --check=3Dcrc32 to xz. So a
> firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
> firmware cannot read. Please can you pass check=3Dlzma.CHECK_CRC32 here?

Done. compress_blob() now passes check=3Dlzma.CHECK_CRC32 for FORMAT_XZ.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
> >                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
> >              )
> >
> > +    base_dtb_file_bytes =3D compress_blob(base_dtb_blob, base_dtb_comp=
)
>
> If you keep --verify in the tool (David suggests it belongs in the
> test suite), it would be worth running the compressed bytes back
> through decompress_blob() and comparing them, since at present only
> the uncompressed blobs are checked. That is cheap and would catch a
> problem with the lz4 command or the compression options.

I removed the --verify and made sure things were well-tested in
the test suites.


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> > +         run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> > +             -b "fdtfactor_base.test.dtb.$ext" \
>
> In these tests the base output always uses the same compression as the
> inputs, and the input extension always matches the file contents. Two
> extra cases would be good, perhaps as a follow-up: a compressed blob
> in a plain '.dtb' file (to exercise the magic-byte detection) and, if
> -b stays, an uncompressed -b alongside compressed inputs.

Done. Added a test case in tests/run_tests.sh that passes a gzip-compressed
blob with a plain '.dtb' extension alongside '.dtb.gz' inputs and writes an
uncompressed '-b' output (plus another test exercising --base-compression).
