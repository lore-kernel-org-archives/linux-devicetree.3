Received: from mail-pz2-f24.google.com (mail-pz2-f24.google.com [74.125.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811442E1F0E
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876898; cv=pass; b=A8W73cADPzVsTq89n6ykwpbLcWM4B+E1nDO0uArYBMHBdHjPMEfJrwKCmvovX5Se54EmBvP4evcbK9DvTmAek/BOUgan2U7VdQFthf1OQyHiYT2DsdEGcwUa8PNrl/dm4qy/TzgVn4+IEyHd89bQdatjeraTu6qvgfXdTMRvU0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876898; c=relaxed/simple;
	bh=8MRsJ4ym5BfLS+pI4d5slk5a3DzlZM37ogJ96KDiTjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGeFJXc2t87H8vXREZ1MckuajpvWlZQpKMtlPsHY7w/Naj7weEGSsEabgjFyfoMjqPZpruRtOgO8ad2rn0ap3fkhvPzSG6b8zgCidYumucJM6/2DJeAtzFPy0j4C7eSe318f8OEkCJHitvugBalHhn3gWWgxeP4yf113PTxuJ/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oukYNOiT; arc=pass smtp.client-ip=74.125.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oukYNOiT"
Received: by mail-pz2-f24.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so553029a12.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789876897; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0duIx3Yx7VaPO46irOa8bcANOELyEsGJivYi4ufZ3bQqYRp45wdqxejTkg3U4l3vE
         0g1isoDNDIkQCnw7m0MZvKS2+cMhtgRmdtHYvZxpqJ/tkj0hk+hz8LcuLHuTb3V+Tx7M
         Ii6/EfUIrsgpCI4elh1OArwIiamzvdCcAWLP3hfc8LIvpggjEBDrq3ZmfxLqtJX8FkF3
         RDyfkyts1E9GVEO+TKDzaDzgs9D/rVTGE/OQQj/vpCEBXuwvMUhDKxnTZBjbypzwFpX0
         4yvC0Gr5OD7sfNu+i3IFSEcBFTKcXuXmlEuS/DLJFxSTU2FzgR99M15kMC5903KtUD3I
         fd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        fh=S4ooTtybEIQRVkp9BUgd/FM0im0D2CrfgZ0Q+L9cdi4=;
        b=YsSnr8/v1FJJHRb9OdtsdZyV3iU9dsD4sMxQQADvCA0zTAQ5I0GS28+9vJ8v5FNIQO
         srJ6UWkHGR8kbgWj/G5GL89MyfV5E8YCCMQXFKmJErUYk+WsHA9zu//9dVZFweYv/y7Y
         xc+vnZtq1Hv2u+JO+GQEWCMnPeE8g6JBOi5t78fG4cEMIYuJ9RvpLJs67iQJHc02Lcnn
         2fmoHpe9hZesDgnm5df+Tce4qkma4MBlPvLxDgG2rEfkEjmqUvgHnemnVkUgXTzdFzK7
         SCKqpSW0S4VaWEnEwyUlMxClFeDVcbie84zJFuGeO9yOWWNgV05r3H1rYejvV9ojKIcv
         3ygQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876897; x=1790481697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        b=oukYNOiT2lGJIwhN98PhBCjlGi2afFMHWaR4BmV7cRi0jlz+YuFpYfnqkwH2fzParu
         8kraYOC+3pkCMMjZ2hZ3HyXQqsVI0B3Rymz0m+Op0vYHqVRZebBe04lr3utC7n5Dwo6Y
         /wvp0uhmDaocXYqVnIdqa6PYkQNCoj/PsEGB7pMci1dr+b5Gb9m9ppwyS0Hs/dFwLsu5
         ZD2HHlr2z/RYModYKS/j08ZW//6cpnTjJKnkB1eEaQFkYCJur86yTnyJ3pTsA0xQZDbC
         6IEGE3AcUFwRzG4hQrf5RvfzvkLChDRoXpKc7qyX4GfaG9uArK8X3DoZt3OgQAf8kLJz
         Cxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876897; x=1790481697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        b=u/88tGuMm893HSsMqHHL34P7Y2Z0mAn94BU4YtdSbe6DW2Jg7R7NnxxtEnGvWTD5i2
         xFhyhnjfRPaH0evHDsPVVfKQAJYNSOS2IzgVHp9UrBibpPELSZdhNf7CZZ2l4nf5pyij
         /SszN/HpCT7yhftX8gsx5/KmMQ077bh+UhoAKjOy/+aiz1Xh2wFXJ/+BCQ2OHpnOxWDK
         1RtNv6SC54P0OVan63dVrrNPqCMaUDBv4zvRJZdiQ9rJJUfxgfwZebsfJ+B8gPoSNXAZ
         uuhbPYlYG8cS6KRC/I6Yw9n+/8u9KrW1sX9TEuNc5OG7RDg2hkbgOAH8T+NULiGbcwTm
         NTTQ==
X-Forwarded-Encrypted: i=1; AKwUvByeypxMpp+T6P3WCeyKM9rVoTbNRs7Ya5aiewcdBGvZoNthfAHJ/7sKZWLlaTgLDYPgQljZAtpeQu9m@vger.kernel.org
X-Gm-Message-State: AFuF++mlgRWthx3QGXiN0KKbx1+lzOsA/zOvRSTHaY8XoJZoVmTH8PR0
	gqsvKnaO2Cy51CfqAkM+dRR8tMV1Khaz5A5gGgvvetC1zkJxs/VXhqO8APZUKN2n8vewFZrAdD3
	7ZZ7HSnviGz/JynMVG2wc+ZtCg20U4PE=
X-Gm-Gg: AYBFou0MEaV2Q90HczIlURiqVIy/ERk7qNfG9QUHEwlWk7U8M6qTCLczj+5C431kMoc
	2uq9bG25a16kHEvQWlEuOG+7jjFFNF3gIBs+PzGcwT57oc1xmRwV+gfZx3H4pEAE9xSWkljdwu9
	H7/EQR4Hk8oildvnB/T95+UwRZBmGykJFzBzwPmbVhBs4QdO8oYFYw8Y18xP1AwiC2YUpvVrJB1
	HgkzZARult74yBdITKuWCENBuemvGQoXwWAUFu+oFvtAZQiP0hp7gpHPYk/Jd4D2X2RL0tu5qQc
	HBA1vy7QajHAKNAAyJ5GbzbwpOs583CvURAq/vNaOO5VgqSa5EOuDrMXpyviPc8flSY7TE0eNxI
	93evRFoOq7wd+A/kCytyb54MfkpBWO5BACl40rcII
X-Received: by 2002:a17:90b:4a11:b0:39e:6c68:fd93 with SMTP id
 98e67ed59e1d1-39e6c68fef4mr3902020a91.40.1789876896633; Sat, 19 Sep 2026
 21:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
 <20260920021420.5a13622f@jic23-hlaptop>
In-Reply-To: <20260920021420.5a13622f@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:01:28 +0900
X-Gm-Features: AcwNN1U3rQwmlJbg_g4DdTUrrpMfiV8bKNCMI7xb5i2BgcHIced7B7DCzX82g08
Message-ID: <CALMSewKJ0ejyGi3KFb-uz3Lp1E7=8RbrYpOzP9z8-9yk8bnBUw@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] dt-bindings: iio: add Open Sensor Fusion device
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Sashiko raises a reasonable question about what you'd do if it turned
> out your current OSF GREEN doesn't quite comply with the specification
> or needs some additional quirks.  Does it make sense to have a more
> specific compatible with a fallback to the generic one?

Hi Jonathan

With that in mind, I agree that a specific compatible with the generic
OSF interface as a fallback is the better model.

OSF GREEN is one hardware variant in a family of boards with different
hardware capabilities and configurations. For example, GREEN does not
include RTK-GPS hardware, while another variant does. The firmware
still exposes the common OSF host interface and runtime capability
discovery, but the underlying boards are distinct hardware
implementations.

For the next revision I'll describe the current board as:

compatible =3D "opensensorfusion,osf-green",
             "opensensorfusion,osf";

The first string identifies the specific hardware, while the second
remains the common host-interface fallback. Future hardware variants
can get their own specific compatibles as they are supported, without
encoding their sensor inventory or protocol version into Device Tree.

OSF0 and the protocol major/minor will remain runtime wire-protocol details=
.

thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:14, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:39 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Add a binding for the generic Open Sensor Fusion host interface.
> >
> > Open Sensor Fusion devices report capabilities and samples over an OSF
> > protocol stream. Sensor channels are discovered at runtime from
> > capability reports instead of being described individually in Device
> > Tree.
> >
> > The protocol version is discovered at runtime from the OSF frame header=
.
> > OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
> > so neither is used as the Linux compatible string.
> Sashiko raises a reasonable question about what you'd do if it turned
> out your current OSF GREEN doesn't quite comply with the specification
> or needs some additional quirks.  Does it make sense to have a more
> specific compatible with a fallback to the generic one?
>
> Or given this is mostly about device firmware maybe this is fine.
>
> Either way - would be good to add a note on why that doesn't make
> sense in this patch description.
>
> Thanks,
>
> Jonathan
