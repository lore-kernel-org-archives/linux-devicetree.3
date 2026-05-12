Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE237E2FD
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599346; cv=pass; b=dL98GpQ2T8c5OoGin/sxPRDbT5UGzN/3YUOhxG8GIwuRYy3BlNkxcoHGiHX09ZP5ZJntYs3/yzjtYZV+fJU7EMy/lWrl9zi7yHK/sQCZk/O7C1MBT03wZC5kVc4a5OovNRsSNsgBfJNSg8CGfe3hEqD0d0NKaJ74ZcU0sgB41XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599346; c=relaxed/simple;
	bh=GMqAJJvoKZAxTYL3ppmWAG2jFmXFtUvCYSYB89m0cuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1iTt7vB0yFs2Y3XDS7ak/l2sjiVKYMU2gaUMlurqX/BlUKdoF/XJ3od/ThWQOUHOjTrI+iVLklQfZhjtfy6AiYbRVAXxqFtquO/pp05TD0HVoLCofzTITb4esBoOShgaqr2PCJ6hlF4lHaax6unrorA55gPmY7gUX3wm89pgHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwUVAJn6; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwUVAJn6"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7d983f91so53981321fa.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599343; cv=none;
        d=google.com; s=arc-20240605;
        b=a+xqV3iB9FBAgjIX8PfiFPFeW81kf805Eqr/rjEo+zMZSzHdNsasKnavcNwWm4zbaj
         iJQ4yu8MHU6bTG6UjgFoD1tOTKisq7u8Tlv72p+WadugTMXI9QOiQx14oi2mGSP8nSgJ
         ZJtVKEhVW9YLG3D02r9UTDgK4574UHBNo21skzwEhXDqP7WCENXll/45gJWWHEhIl4za
         dlLngI+ZyTn9RU6nJSF9w3xrjxQf2mUSKR0uI4vcMHGSYbsteohbTQEwM64/QZ/RR0VI
         2DLV433rv7BdkChGebG6NLB/BL8SeV/+qiO8xWe0d/wVhUaRNYi1L8ztZYuRMSl0cju+
         WeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        fh=YQdL3cDVxKBnUBtUjYe8UXZiX6qYOd4iepFNUvMGp9I=;
        b=hjkEOijl67tkRN5CJ/1YJpVlNIcxYjLhUtDJAQValPILNf2ZJYZq86FLg6Gsu6N+ww
         bxxQp1p+pZqmnix+LMX9g8qOpDq/C8lW5nSDc/av1IDlvxS+BzqVTXZ18UixezRpuSia
         sHjcZzesqeJNuJzZDaeFBE8PYxSJPJC8eclAg93H1WHlGKLs1uWIbg5jDsHtGSpTjvDE
         5rg0lq+lkx36A1MOvofJXcMfPjvHAjwq6ngHTq8KhYNU+kC45pigxr9v+64NVHHHFXFI
         GudeNwv4OSpv1DnqIZa9dmjFVUug5RO/eEPm5Hq2nFxCCgnemsjg0ed3Wq3+jF2Yshoo
         W7zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778599343; x=1779204143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        b=WwUVAJn6TU0n1lhjNkg83Am9aNZjarCevbakj6oeB+Tvu+0J8GiUdLRXdietxAtfKx
         3H0tZWr8Cz99iH0jZQQEXB7v+238cE0JFtUoNGTsVKwgkjm8CHmQ5a85uhpG4boU1uCZ
         e4kt9wJQt8coalk9svMaCv1RvBwF/u0ngiooU0aTm4CYFdChG7rn9irw55njL90FtPBM
         L6R44fcVtWsEn8t6oOSV6qKUzNy2DrpdSTjQYUDYekV48KuTasWB5/Onr0pNoPGBpuxg
         ulk5WO4E6JWsGI5JCb2lDRhzFIRn5VdvYWMfQIVD1gH+9mM55eSQNqjYG1mVHfiFilUr
         HqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599343; x=1779204143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        b=ZzGRdU9m10dhmwjBFadNq2ALeocA4zD3zjWvfonnQD+ScKCX6HLZa6qhgPDGFWyr7r
         W4JntQwuItPZF+x8sKTP9INS9qJBNYyF3uOShFYuX7Y5bxq68ZLr3zinTPInVQuqu440
         r5tFHfkMlwfTeITvZvx6fn32Kp+DlX7tmOMbuTZwSlBJUeH1QP4lU44nplSolswbOa0l
         XNsX8Sc0AETxYeIrK1GA4W7kmUKn1Fn+yKCSHm6BVlxhJkwFYEHpuou6+rrcD4Nay1fa
         Blirbm+Ym3QWdHcEGFet0kQLjED4XA/cVBsAgYIGWzLuRkJ6E0lCj0moE2eng3zBh9Yh
         NrPw==
X-Forwarded-Encrypted: i=1; AFNElJ/n6Q4WIa7AuOW3IBgdCfqlCTuNRJaRc1qMQERf1ry/XEN3OscAy2/sC20C3K9UAHHixNQzwwehhNoF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02TT3NReN0ifk/aZH1UuQszm+/cyJKRVhIZcISDQ1zMUYhpCs
	yagj51Z9XUQzxvG8u6+3/85xC82Qzi3nKSKI3nRtOhdyzQbiiApXI6MmbRyJahr/xRSIz2Gdrkm
	vataV30OmJI1B7DvfTwAxzyA4oX/EevI=
X-Gm-Gg: Acq92OFbKZq60cpW9+usD5bar/FWnmp5SFqfnIJU4aB2brSECB/Bf1rWD+lF+roEyLV
	uogEo2HIKBZOvu9HavRSut8eAWNJJHcFlpbm6ug0IE47AfgQqHxv0xGIxlzfkgjmtaJ15RYwCXB
	omZMkA+Q6aFCBmv1vL8ZdTNxGV+m/e2ssYBQe4fK39B4qIAZIVqlXdGWOHxaUZCnppV0Q3RPJ2+
	t3A/VAghChdiLfnzf8j7jBH81nsR4q+Jt7jNh97vf5NBNlrSvRJey3frhANd8r7kKkarolv6sZ9
	FiBjshZGMHh64XEsWxBwNzyFc3pQ1a581vjk6nhw4i1AB5WcpbASywLcAxMWRb38JGeL12gxLuP
	sJAwf3Rrlb4DicOI0rg==
X-Received: by 2002:a05:6512:3b97:b0:5a8:837b:3d62 with SMTP id
 2adb3069b0e04-5a887ae201amr8896955e87.9.1778599342529; Tue, 12 May 2026
 08:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <20260512123953.40d80bc9@jic23-huawei> <agMnWzMjW1LwCSyT@ashevche-desk.local>
 <sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
 <agMvlS3-0wvGmBwh@ashevche-desk.local> <dxjg2sdyxb7ieb4abmeyyye7qok6cczrxabpsjyjhcbehwoec3@sbbqoo4wmzre>
 <agM8pWrM6j_XksvN@ashevche-desk.local> <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
In-Reply-To: <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:21:44 +0300
X-Gm-Features: AVHnY4IJuef2B-0A9_3FnyNbZ_uaS-SA2cTNaTffveNp5l_4SxlZqwsSXVNYeR4
Message-ID: <CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and kstrtodec64()
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 6:11=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 26/05/12 05:43PM, Andy Shevchenko wrote:
> > On Tue, May 12, 2026 at 03:12:24PM +0100, Rodrigo Alencar wrote:
> > > On 26/05/12 04:48PM, Andy Shevchenko wrote:
> > > > On Tue, May 12, 2026 at 02:21:14PM +0100, Rodrigo Alencar wrote:
> > > > > On 26/05/12 04:12PM, Andy Shevchenko wrote:
> > > > > > On Tue, May 12, 2026 at 12:39:53PM +0100, Jonathan Cameron wrot=
e:
> > > > > > > On Sun, 10 May 2026 13:42:20 +0100
> > > > > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.=
com@kernel.org> wrote:
> > > > > > >
> > > > > > > > Add helpers that parses decimal numbers into 64-bit number,=
 i.e., decimal
> > > > > > > > point numbers with pre-defined scale are parsed into a 64-b=
it value (fixed
> > > > > > > > precision). After the decimal point, digits beyond the spec=
ified scale
> > > > > > > > are ignored.
> > > > > > >
> > > > > > > Whilst Rodrigo has already replied to say there will be anoth=
er version
> > > > > > > I'd like to request final feedback from those who were involv=
ed in the parser
> > > > > > > discussions.
> > > > > > >
> > > > > > > They got very involved and I'm far from an expert in the righ=
t way to do
> > > > > > > this stuff.
> > > > > > >
> > > > > > > I don't think David Laight was +CC so I've added that.
> > > > > > > David, Andy - I think you two were most involved in that disc=
ussion:
> > > > > > > Any objections to the end result?
> > > > > >
> > > > > > I already said a few times about the naming. I do not like the =
kstrto*()
> > > > > > be semantically different on how they treat the input. Second p=
oint is
> > > > > > to avoid code duplication, but this one is less of a concern si=
nce the
> > > > > > new code is in the library close to the other potentially dupli=
cate code
> > > > > > piece and hence can be addressed later.
> > > > >
> > > > > I suppose I reached into kstrtodec64() and kstrtoudec64() because=
 it aligns
> > > > > with your expectations for kstrto*() semantics, no? Those include=
:
> > > > >  - overflow check;
> > > > >  - extensive input validation;
> > > > >  - optional '\n' in the end;
> > > > >  - mandatory nul-termination.
> > > > >
> > > > > am I missing anything?
> > > >
> > > > When we add scale we basically make that not true. Moreover the cod=
e in this
> > > > patch makes scale =3D=3D number_of_characters which I think a bit f=
ragile, however
> > > > it's about the fractional part when the amount of digits is equal t=
o scale.
> > >
> > > That is not really the case. It is being set as a limit, so it does c=
heck for
> > > truncation and zero-padding.
> >
> > I do not see it happens in _parse_integer_limit(). It doesn't try to pa=
rse more
> > characters than it's requested in max_chars. It doesn't check if there =
are more
> > character nor their converted values.
> >
> > > > To make this work as expected we need to add an additional call lik=
e
> > > > kstrtoull() (and perhaps drop that \n and NUL-terminator checks) an=
d see
> > > > if that overflows or not. Since it's a fractional part it must have=
 less
> > > > than 20 (decimal) digits there, so we check the rv (or how many dig=
its
> > > > were parsed successfully) and compare to 20. If it's more, we got t=
oo many
> > > > decimal digits.
> > >
> > > For overflow it checks the KSTRTOX_OVERFLOW flag and leverages check_=
mul_overflow()
> > > and check_add_overflow() when combining fractional and integer parts.=
 The amount
> > > of characters is not really important there. The scale cannot be bigg=
er than 19 and
> > > that makes sure that int_pow() does not overflow. The code uses _pars=
e_integer_limit()
> > > due to the nature of input and to avoid 64-bit division, kstrtoull() =
at any point
> > > (parsing integer or fractional parts) does not make much sense.
> >
> > Under 'like kstrotoull()' I meant something that repeats needed functio=
nality.
> > I believe it's parse_integer() (without limit).
>
> I think we are going in circles here and we could look at the code instea=
d:
> - integer parsing with _parse_integer()
>         - overflow check and validation of the return value
> - fractional parsing with _parse_integer_limit()
>         - overflow check and validation of the return value

No, this is not fully true. That's what my whole point is about. The
max_chars parameter limits the input check, then it skips an arbitrary
number of digits and only *then* it checks for \n and \0. What will be
the result of the
0.00000000000000000000000000000000423 in your case? Whatever scale you
gave it will return 0 without checking on how many digits were
supplied. All the same for 0.9999999999999999999999999999999000423. My
point is that we should limit this by 19 digits.

On top of that, what about -0.9(19 times) ? the fraction should be u64
in this case and it's fine. The sign applies to the combined value.

>         - extra scaling and truncation happening outside if needed.

Right, but the given input may be way too long and still needs more validat=
ion.

> - check for input termination
> - combination of integer and fractional parts with check_mul_overflow() a=
nd check_add_overflow()
>
> > > > Maybe I'm missing these checks already performed?
> > > >
> > > > > > Having the test cases is a big benefit, and that part I like th=
e most.



--=20
With Best Regards,
Andy Shevchenko
