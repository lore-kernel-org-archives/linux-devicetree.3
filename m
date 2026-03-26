Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2F83F7861
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527895; cv=none; b=VyPrWXmz3KP7+VC49AMXaTl98prr3CitPJ6evQyUhS6Uwp29SD6SRjhYCVsdk488Xqzw+zNGB3Y1vuDSeUPeqzIv3radzXWMdZPpNCKtvDV8+PXfux7O/QpRQc89sMzvsfmTeT6FX8uArkozoJ+4/+YF00hpX/KxFCIsRlEjc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527895; c=relaxed/simple;
	bh=mRH8dsJYsEf6aldFwfdTs6JkiAnPmrdYZd1nLYrfFck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBm/Av7/BgbKwHM2kwtBRxkXovUyCmn68lYYmqwmFzWMEfV97dtgXehc4bBPKN+LwZTBPHDj1kn+IIV2sse//XN3pr51WbUqHClebxUjgczHrCFZ6vvN5977zGMbFkRYk8B3Khg/nkRs/G4+fd/hPbnYJt77QBOQyAqE5CziC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7991db3dc98so9981667b3.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774527893; x=1775132693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRH8dsJYsEf6aldFwfdTs6JkiAnPmrdYZd1nLYrfFck=;
        b=o5tdZdVrGlTZziBS68obQ/J6PCHiR37J54NIcTCfLod/q4/9qCbqEyP1ThYUc1ns4/
         3GD7DPWaJ2rMN/nH42nt0A455w6IC/Ws4R9YlAr/pqSdiH+7S6dU7c0Ckow4zGBcHewP
         rBnxfRQj7PLE2uMwOt+aJLERgdicAVO4KjdlPEkKUeoGx8FsuqYZjWaDCTSeMy6rdGdb
         H2kF5Llc1NZPidGrwrNyH6pI8UQU2cnz2eszNIzfUBXoUM/a43TUAJZPIV3J6aCXO8NN
         9l4BeuJ9Dnmu1hL53o+o4Qbi4jSXym6Lzo2auHswBMXaV1ZYtXLQdqxeSS0XBb/zbDJh
         mhxA==
X-Forwarded-Encrypted: i=1; AJvYcCVOCYqtu4OIg3EVU4apSUx2AgVnYv+54r6GKcytLOiuOyEnmdqhP6f6sp1C3ZE2iGi+Uf5++BhFgIgH@vger.kernel.org
X-Gm-Message-State: AOJu0YxVa55dK8cZY/N1owJlmysypqsxd0FH6I+rkmFufj0jenJt9fK2
	Jw09BK1dd6hfWYTLjbXTX9IZ0DwqAcA9lTskjcXagRAkJPQqci2l7vGSEqF1V/YW
X-Gm-Gg: ATEYQzxUWwqc193OMqVgy0FgbGESFYKL7KFTH3Wo/akyaLCwIEP4/mqhXnBu5n1FH54
	l0NCKk3/twmuyh2BhoIZAb/BERxXGsruvlQrSnqxQtOH6rCu4plrja5Wmk5VBM+lB0yXq1GiIvF
	atggH7HfBCuBkvcveTIp31dthCkwBzypTdfD14F/+Q6V8A8sdGKg7TdSB2MoHMXl7Za/zxfxMDA
	BJzHvYTTDwic80cX/KBA9qSWLNFsy9Do73PxYRhwhV2PzNwHGhdXXEYpT6Qs7RACgGv91rGbrra
	/9Vx3ZbC6H7Czsmc3F+PbEtZQ3zOdBfBtJ/l89yJlT7bRE3Jbe7iOM00biUSPQRbvywhgNaNgAx
	zF6MFwQvFc18nC7RYEfzY4mUoNrLedvSrtJuYwqXe1PLS6DUC2O7f0NCqQph7XEgSAiRQHOcjr5
	RRUYDfZUiDSmhmc9qA54PQzjlMfnYUaJTdO33FE0CFlwY4Csm67tMyPfTCy2a1Z5i6DTSB0LZW9
	+4gfa+JnKXjGgOdQjn0Zdqkx8z0TMWsuOppOhPk+A==
X-Received: by 2002:a05:690c:e3c7:b0:79a:cd3b:d9ae with SMTP id 00721157ae682-79acf67f5a9mr78508017b3.33.1774527892897;
        Thu, 26 Mar 2026 05:24:52 -0700 (PDT)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com. [74.125.224.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b10d711f9sm12204477b3.10.2026.03.26.05.24.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:24:52 -0700 (PDT)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ca423ad53so897648d50.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+w4AsJdb11PUhViS7kY13kGH2c1ehg4RLyWp3tlbJBbJPseWK7pR+KkwWnI/Ah1X4jPr5eI/0TDeb@vger.kernel.org
X-Received: by 2002:a05:690e:1c0c:b0:64f:c830:1e47 with SMTP id
 956f58d0204a3-64fc830804fmr1809469d50.21.1774527892188; Thu, 26 Mar 2026
 05:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325202005.29822-1-email@sirat.me> <20260326082447.5e447606@jic23-huawei>
In-Reply-To: <20260326082447.5e447606@jic23-huawei>
From: Sirat <email@sirat.me>
Date: Thu, 26 Mar 2026 18:24:41 +0600
X-Gmail-Original-Message-ID: <CANn+LW+zqf-VwAw8Ci+ZkTO95ktASyUBjg=O8NAGjMc-g39H7g@mail.gmail.com>
X-Gm-Features: AQROBzAgQAUJ_PyzObb5sGIYSy3eHoXce_8tfyN_aOmeiG4bEBi1gQYt7vl5eCo
Message-ID: <CANn+LW+zqf-VwAw8Ci+ZkTO95ktASyUBjg=O8NAGjMc-g39H7g@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:25=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu, 26 Mar 2026 02:19:40 +0600
> Siratul Islam <email@sirat.me> wrote:
>
...
> Applied to the testing branch of iio.git.
>
> Thanks,
>
> J

Thanks for applying the patch. Thanks to you and all the reviewers.
The code it ended up becoming is much superior to what I initially
had.

Best regards
Sirat
