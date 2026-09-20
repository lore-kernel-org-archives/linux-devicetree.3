Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81801799F
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877585; cv=pass; b=k8f5vZtMYQInD6z6zG+uhjvSCCU3G1qWprID1g+md+27FzTqlpqJL+ivkEQVwS+WnCZZPi0620GjJJSj1mB2p5jQNj7EyKlQhLgUvvlQUgKHbcWVhzTGsMbEjXhVq2i0h2qQJNIWMZQgGPb/RGurLjD3HYLhs0ZWZgTyFWyYmWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877585; c=relaxed/simple;
	bh=YnbfoGjlPz/vXewRAon37V0GQH2iNlW079+n72DtnPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+yUxESoiPTikxMGvukdQg31/5WR58iPyGbAj1wW7Ywf8jEq/+9+9ZTten/ttEo7+O4AWLx8JzzwCVZBB6pMqnaoeSdy9hohviVcYEkEaCCoNMw9ijzTViwOsLrLY63VjLV/0OsEvnKRT3EzH4ZOnHHkUPyPuhSDAv6jv15ippw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYtZjSgO; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYtZjSgO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2314694a91.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789877583; cv=none;
        d=google.com; s=arc-20260327;
        b=BF699Nm5XWheeOXp6MF/ud5s+hu4ouqdDVxTlSwg07OcSeYP85zsRWLiOj3SvJ+NX/
         Xf6NpIdFRxXij4qpjDIbRIvjUxtq3HcIaz2GFFWODLVG4kdQ+HoctrM2nhtE1+NQYqz4
         HRiv8vUWu+C2Juu0xP7lHEHGFGZXaQJ8hawhSvSdrgKkfGRdbZYyKWoBJzUY1O/qHf2r
         jP3T2zXYYH289o7rW7EiZtgfisaI2Br7tMu9l1UyjL0vfLztyX3mqSVCCR1VOlGg+NxN
         1qZQMw1QcLmTuqXvYz8QZeROdMeOa+HnkL4mDC4oT3E+ZqCgvaZPQBrV6YgzfZDXFIK4
         dRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        fh=Cj1+R66QabAyzQthCdxAO7bFW+dyOTF9tP/IEBy2bww=;
        b=OMK8WVa2erk+BBGvZzUIyLJdBKuVJthROtHIqx+b93rHIjfp8vknHWYBqlIb+ICXlX
         /0ZM3//iiS+Fu8l/hFfwU0Kz8tunmsIoTM5E9WeSrwXf80vQR458rVfil/iw26HsyyP5
         jme+zKsclEXLLN0QCToLfwV3gJ/HJLYb0wUCWVJPzPZzU8qLn1wWwFsZhUE40VtNQV6R
         q+UXnb8nPOItq1fbhlFEWtFJZwMdjZmUM7U7r75vpA706JL5Hd96JDi+vfdK9KJGnACG
         ObD9Rdpw6HZDLHK0ZjolMegRkm9yyD3GBPEYIu1KGN0Zx4SQEH+YIuJ7d7hZMSduFtSw
         rzAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789877583; x=1790482383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        b=UYtZjSgOb7tWjVBeUmKh94Ecz4mxJxMYlkMSojAc0SbuMaD9X/JbFHzze50OUNnDnT
         VsP536xgyq9Y179EtZVUsXc6oFXJNYzmn9unqKsal/81JM1xltkCMkwW+PvWF5HmA/UF
         fU3armDbeUKc6IKSxfH03JdciBAbVgY+J94E5Wx2fEhyn4E6LMlDigmnVVCuu4bvnHzl
         BeQBWdKIsPksQVKFByO8Q9uFyFTM8KfgQSmugBVJPsMyanfLCqeeCXqMHz2+pDAt83ar
         mDkn896cOq6ZbgShX2QkxH3q2Cr0bJiL08o7edTopFyXzEIc/5vOn9BKslRUm2YtaKnD
         m+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877583; x=1790482383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        b=B68DQVs0ymj3QRCedLiazDpI2ppxotH2JCeJ9/+94FscZBEyVl2tN7mtLExrWDgfSk
         +sh2jKwlE4Ia5DmaDOJh9emQytZo2Lj9mU9xkZ0bGAwM++9lNdif25QgmqAghgVgNS/d
         1JD+75+hKMwqmqJfdhhqSNeXZLQopXNkrrJV8zGlFn3LesvjX6VxI4ZH3iGwHihKet54
         chQise2kmXdovT4hIlIcx4xn7k7SdmN3UH2ieX0fwfQ7hDHppXRpMudMVU01qU3FGwwt
         hjd0bi+zhx/v62eojPJSks9EY7BuJtsAHJ5zmUVVOlK2W8qV1WfhgQ7vYERRMZAN7FwR
         jwJA==
X-Forwarded-Encrypted: i=1; AKwUvBxzkpInVFUOeeUkJzMvP8mk7DU+ExWKgCTH5R0T19P+ZPdoGM0Nsk/VlQsJvVDl9tQ2RZPrq88zBC6h@vger.kernel.org
X-Gm-Message-State: AFuF++nnIYUlmWYLdvJWmYa1kgvBiXGkWmsAIJyfkPZ4KnWw4O1TCUj0
	2NKNVAg2wRdJHDFqu4ZWLbjODBlHz49BxXgBna+NF4o2vB6ZNitRLcsboG8WH4AC5jZnHHN4WM6
	yZrv6Wztb21jOVJ9K9fV0BcljFMFraMA=
X-Gm-Gg: AYBFou0/EKh7XiBi3mGBwbpt1//rTqtZCAOCjU8WiZXOiFkSnRDoc2Jz1bbLEYg23Fv
	0gYXC8OoPXC4IV19tB0pF2HTxehXt/bX/hfKcOSZBH9Uv87fNFXSKNIfNbY0O+dS0lYb3AcPNyr
	FbgTvapWScs1MlZOxWY8Jdy/zAFalMuo/GgG3Ii9QA0LmHWHMCCCDLAxCqRmgtNB7Zyvz/0I6mH
	s+5fzRS6FDC3lVqgjOz/Wk8tZC9NqDSVVIKuzEHxznb4Tu2fvHzOVNXtfpvhzydwFO3W0b2sNpo
	+noXl52rCrVqEfaxkqPhAAzSMHzJTNT6Oh9Qhw35eb/76UkcLmByPx7DgPfvEM+JTUB5CGmHQBK
	yfar54mBLileCQgrvbAcik49WvXAfxki6n5LXq4bP
X-Received: by 2002:a17:90b:53c4:b0:39e:d2a:e2dc with SMTP id
 98e67ed59e1d1-39e54d1ea4dmr12330513a91.12.1789877583183; Sat, 19 Sep 2026
 21:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <e9d1f8f8d69b76797d617965f263df97b2b586e0.1789753020.git.kimjinseob88@gmail.com>
 <20260920023057.71ef0eb5@jic23-hlaptop>
In-Reply-To: <20260920023057.71ef0eb5@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:12:54 +0900
X-Gm-Features: AcwNN1XJYd9uoJcaQ1q60GQ-gnIw90dguuHYkkkGbV7JngEnuOZEzR8A-Daiweo
Message-ID: <CALMSew+LJjky+3uSSL3kByzpT-tkNmJTDurykNmH-nj9+zxCJw@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] iio: osf: add validated stream parser
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You could reorder these two functions and call stream_reset from
> stream_init. Would make it clear what getting to a 'clean' state
> means.

Agreed. I'll move osf_stream_reset() before osf_stream_init() and use
it from the init path in the next revision.

Thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:31, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:42 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Add a UART byte-stream parser for Open Sensor Fusion frames.
> >
> > The parser searches for the OSF0 wire magic, keeps partial frames
> > buffered, checks header length and payload bounds, and passes complete
> > candidate frames to a registered frame callback.
> >
> > Candidates rejected before validation drop only the current head
> > byte before resynchronizing, so a corrupted unvalidated payload length
> > cannot make the parser skip later valid frames. CRC-valid validated
> > frames are consumed in full and classified as handled, ignored, or
> > rejected.
> >
> > Use a direct callback member with an opaque context and keep explicit
> > statistics for validated outcomes and framing failures.
> >
> > Assisted-by: LLM
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> Just one trivial thing.
>
> Thanks,
>
> Jonathan
>
>
> > diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/op=
ensensorfusion/osf_stream.c
> > new file mode 100644
> > index 000000000000..e262415e69b7
> > --- /dev/null
> > +++ b/drivers/iio/opensensorfusion/osf_stream.c
>
>
> > +void osf_stream_init(struct osf_stream *stream,
> > +                  int (*receive_frame)(void *context, const u8 *buf,
> > +                                       size_t len),
> > +                  void *frame_context)
> > +{
> > +     if (!stream)
> > +             return;
> > +
> > +     stream->receive_frame =3D receive_frame;
> > +     stream->frame_context =3D frame_context;
> > +     stream->len =3D 0;
> > +     memset(&stream->stats, 0, sizeof(stream->stats));
> > +}
> > +
> > +void osf_stream_reset(struct osf_stream *stream)
> > +{
> > +     if (!stream)
> > +             return;
> > +
> > +     stream->len =3D 0;
> > +     memset(&stream->stats, 0, sizeof(stream->stats));
> > +}
>
> You could reorder these two functions and call stream_reset from
> stream_init.  Would make it clear what getting to a 'clean' state
> means.
>
>
>
