Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364625;
	b=SInx5xQW37vxzrOESLFvpYgQ4j7uqYE+NGxsN1aFEIZ8W5n+yJ6dbyWWef5maSLVVEXa
	 ySA+DO/H++J2ch0Cst5Bv77wDw12lqg03LmGyXY1TbrkTFyrYiT2+TOSNxDhZ4IjNtDfM
	 3gu6O7QSF4qvQ9x9gLtN+eINub6GRStGml2t1gO7/9j9gf+cysPnemYs/5jMyLrT7hvNm
	 VkvoKQg7bmd8SdQ/EBWP1sLbzzSxjOG5Kq/AfvE9I2tTVWCpEbKgg7k8RhuZ4vXnU2quW
	 NV0SEw8QkAMxe/JR2DHzVlB1ChPB/IfxAjAqvDEN9CbKwZLHO6U1mQ/EVQtm0KUFDxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
	b=wHaxXNxiONB44FUmR0iBxKk6T+WCRBnASTd+cneB/qcVAo78+ItaW53WiX5RWPg4z7AU
	 7j4Xyf27ciXGC4r3EeHxUUdSt3f69qt/DTctrBHbJN8UVDlqBPEElkebSiqtOX1oP7Ovc
	 E8Y+u534doTHh4FzI+nXtKnhbKQhZ0H3bxArR5eTCNb55H5gSZX5dlTehwLnO9RwR80tx
	 rwu3cobKowWOhEuvIOVl6jdfn818KzFXlLl1xNjECJ88kcxTEpLD5rJhQHccw16KAtPKr
	 MCvosqm6PWUfcggs7Vv6EEqFI+6X0UeqSJr4DSiOIhavMs5VrgBIyujwc9zy9KluM8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597F606A31C
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2597F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IXMoK4RO
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso709416a12.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364623; cv=none;
        d=google.com; s=arc-20260327;
        b=SAsz+YLcwLCwhM0OmOE/yaxbe4kw8/HpRpHCOpT86ghVNlIAhsxHEEUlwFenAyuA8u
         S8kjLZlas5OtTBPe4P/EYIRnXUTmODxXTqdUUdIjbM6+0yX7Q8VxpVSjpvoFnn173r2e
         FR8zpZt/XjsdkBgfUtLR4vSOK45ORbt8Uxfbo7BJEo6cQg8DMKrywSXc650k5uEUxuA2
         ixshI5kVwCHg1HVD2C1oJglvlRI4rEKzvU3wRbPGRU15NIj+ZCcVxGmDMvdwmD7yxH/h
         CRqWtOuklImLl5LSUeH7V2aQekErI4vR6tOoPECJTeE2OKAJVt5zjC/EROPjkL9V7Kiz
         /Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        fh=O1JPTiH3zTsTgsSRbHvDHS+HQpSYP73KSrxVmMXZHyM=;
        b=rrNEXhAncmSrsZ/omy58Gx0VjmU26alTT24iKT4RbppwjXHR95xleyFclIFJebMh5v
         RKLyjc/MzbrC9STVIZwI04ObVklQfeSrqv+K6Iy0MBLc9dbS1GOZIiH1mpSAmsSsRcKz
         n8wVDesfm3Kbaa6UEkx03Digi97KGRnDjShJuKklCJD9/la+4144oVlWV1sp8fI3g2dZ
         1oBTPabeg5Miyb+Yeemw01P5bAjJqPBIEP+24F7KtklSWYlRrTXlAEXKXYupNmnkzqhj
         BgQEk3o51+QQplBVq3hkz+p2KzgO4zSPJqsEC2fgQaWCNCttr9wm+3shpWHDJNLG0JZi
         uzFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364623; x=1793969423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=IXMoK4ROJSExgomuZwg8qswdcktPKBwPHqGiOEHr5qz96CfBr3Ci2U5aigCM+XNVlt
         d4T3bV4fyvZCcRGQ8wR7TnpmNGTvxWw8DGL6I4xS5SVrwMyIFkiKV2sngytFIGePKPpK
         XBiburHB7LnFiaSIURjCaKL17hViAeGlRn3c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364623; x=1793969423;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AM7nJD0O+1QUuM7/HgR9qm/EChud0qm48kcPoOZ3y3A=;
        b=AbCMBXRnGBWDKzxSXbLh1gLkTCrlcI2uhHSTSK6eu7PI8ot2x03xRWRY4/wR4DqMvn
         SwM/UPsFImOPd+SEyaq87YYF0uItXvDCe/Cqr543YeBYUZVv8UETxXej6AI0wlfI2mIW
         qRBeP5zHlerrXnNTflaNOLKo37HcczZ4o5N4wzFUfYlzHsjTWXDHKf21s9jOL5whlDit
         6nnFqoOfJLFUuNTY86CrWm4VOJbYGSO+shHqybM1CQUD5iPNcJhwjVGrM3jTKaZiBpnJ
         HQUzYaOOo4fHRWAoPZPAYTLZoEzhBdtcKMzCBSfexEHx1EStXOCw7EdujQJHgoXskhY6
         1hbg==
X-Forwarded-Encrypted: i=1; AKwUvBwIGanL3lgBpnXYhZm3r8Fg3U+NyWydVvoaP8/x57jv0zg5B3UUzwojE4hnWD3Yky/oTMceAoUtPJjF@vger.kernel.org
X-Gm-Message-State: AFq9FYJGwXqyeTF/WIotHFsOvyLet3+mCH5i/YJPKdJ/2edNO8AylDKT
	tTX1snsXAtEExMHw2ev3laZJZiUbsWVm3+A/ACmwVrDIxzf97HfLDRj7E6hEUlEL1lzgNo14rpv
	weUXCDBQ1WTTHgOse4mPw9OyS+FBO2zlFfgjyaeJk
X-Gm-Gg: AYBFou3zgFOhcuuYNo7FoVvLJdQPW1ox3kFEAGbmeSobCqfJuFzWBbgBIRAU1AyUzOW
	pdtkY1s+XtRxpSYR8t37umTd7mG5YkNUYoh+nqatitFVMAL6CTBEXsRitEclHfOLnNVkhhC8+wa
	XSKrOMivUEJB+1TxFGIQsdtxRKqlmB/1KPOZmTEof/vndAaH1cRol/bldZSa8rbeZWgKpUMevI/
	CcrDHltktN2E6RMXLWP64BAGP20qrniOzKMDZYB5fSOgi6jMTrnhFTpeoApNm4vy1Nd7kt8oa15
	ow0+Ot9YyXqyg4lWj8ZrERvZXiA1TYzqj+QJM284mm9nuW8EtMkuA5r4PGVp3wASsuEnsrj0jPU
	rcKFLUxSNJ6M0G4MkoPLnCqc/gPke89FWaKEktviY+OAiyt27aqYXgNWn5uKpd7toyme/Dxk=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:b9da:2047 with SMTP id
 4fb4d7f45d1cf-6b4d4688ab9mr1142320a12.16.1793364623523; Fri, 30 Oct 2026
 05:50:23 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:20 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:38 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-5-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-5-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:20 -0700
X-Gm-Features: AclHuK96Zoq6b12CCYQmhyhkE9oH8gdbmzobxXBS8az3EflQGAJeY3UBNWa_dYg
Message-ID: <CAFLszTgOSFyu8PLvYwpTT5iOkENQWthmNnROrZoVAhXnCNG2KA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Factor out fixup and fragment path parsing helpers
>
> In preparation for updating the base device tree's `/__local_fixups__`
> node during `fdt_overlay_apply()`, factor out two helper functions in
> `libfdt/fdt_overlay.c`:
>
> - Factor out `overlay_parse_fixup_entry()` from
>   `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
>   `/__fixups__` properties.
> - Factor out `overlay_split_fragment_path()` from
>   `overlay_symbol_update()` to validate and split
>   `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
>   relative subnode path.
>
> This commit is pure code movement with no functional change.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 154 insertions(+), 72 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
