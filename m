Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18A3E1682
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058695; cv=pass; b=hzm0Wy+MUSjslSbq5fVrO/t3ARyXFW7QWJfwZp9U0XqKWv7Gl7pe6J6PsDUqPSbYz39+HKeAP2wltXIox0XVh3zcWcUHr/r15r0WOpKjJdZI6rf7Xne12ObcPihuLqYuzwI4r/IyFRUTvddweTs/thv69bfc1bHAHntyb9vtl7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058695; c=relaxed/simple;
	bh=M4bTXOPZH9eLQiy6ZvaD+nc7ONjW9bp2mJRz7DeWHFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEPDBE8WiHE6cv8Sp8FFxyAYPAMfrfCUVlqyCAQUV8yCui28GBJoEN8QW/Ac2bOJ5f/Pc7crWHKfew0+9qSBJHMdaaUZ5Z02cZsXrpirK7mgafKEKTAJZ5xuAwtXrmGdHRaXYlueB8BTnDjI61mA0NGk7hL+Zjek430Go3CSwwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6nNkuBb; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6nNkuBb"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1378943cd4aso3107534c88.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780058693; cv=none;
        d=google.com; s=arc-20240605;
        b=CoUhKG8V5YUperEyJS3gcnwf/fYSfSy2KVKiOGQv7uEuZ3+zo6jwqTiOHoN1QGEkI4
         L7n0Oq1ufoCBu/h0js49QJEb+O+zSNJsbR+K2W80OveRG4oynX9T4pQ5ZLaZMxA/kctY
         35jeWBREt0auUk48uZ9weM/eNlE6H8MqAjAJP9Mfi68n6oZdpohLUHBfKegWyiZe127q
         GZ6F2Q/0LAN6QAoyA/64cnyN3pMw5x2/tlLW+Gte633r5foKV1wUBT0nxn2VM8eSuQ0/
         luMo4EEMEO+d0Kl+bLowAvH0QvynRSbl0ViktZfH8NxSoNymjf9v3dMRPqIT41DZ1iOW
         j0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NNMtWPP10CT5p5rrDk2KTLCMwhU3X0sQZPLuXsdc9co=;
        fh=zZs60FrbIX9s0nWdnNWfTY0sgT3LEpSWC3qSWTqF+Yc=;
        b=D4zwKqtqY2ZiQVikTatEz0AFjAITlIk0+MXFpbovoJxGxO0OUOwef8/eopSqcVdoWA
         e+nx72/yrxzp/hqs82UOzJzdwQpT527w3TOh+32M3QN7TIS6C6BFZRYgeaIkuEmVI8hc
         RCo7TBKKNaAz8hAt+XfvZyX+YsAtqLj/zcFp/W46TEz39A7WhpPAKovtHtm0hzJhmh49
         G6EK5a+I15GiHdwDgDuMFFirMd/aW7rqHpdKT9D+M4ZMbLb5xmwsnVpiSxHeEzw2zF8b
         YxImb2EoHUz5YrMf9DhUhpomk2UazejI9ht2LjWEgPhP9J/lKOZ/T7VA6xMrqwNqqZst
         J16g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780058693; x=1780663493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NNMtWPP10CT5p5rrDk2KTLCMwhU3X0sQZPLuXsdc9co=;
        b=C6nNkuBbslbrsGvvFCaBCHckOGzeMu8PSRHGKiNk9xpPufpCSSYdlrQs/DsstBuUNe
         t8hUoECWnJK70gVXHR1dFI+TPJoOV3vsDQRrZxUIH7Kuj+k/LD8clZO4qvyWNIFpOquE
         Pkg/4Q/0DZDkMX9SjY+IBlVgxVlqzGzngan5b5vCJ9e6oSvNQMg/OUEQ2enW9QpwCcxY
         lGzUuBhezlVzPm6pigV9M19vnYx59SOkvZNVHMZW8tL+OWVr67Ow26MFb8+f0SO2xykR
         tpF4A6BWQzC5E6XJ5C79ZKkhAPAtIBVBJrDLRYeLTfXpPT9vLehX2o0MuGZQMHYmdkhQ
         h2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058693; x=1780663493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNMtWPP10CT5p5rrDk2KTLCMwhU3X0sQZPLuXsdc9co=;
        b=DeWX+u9Nbti07IgLHWVomSePOkx/hVZTczChz1jhfbqfOJSyi7T48b8EAzaVHLxOme
         LNVFlQtw43J4BQnZmFzGIQiznHzNuK06f+v2GqzG5T2u9rFmi7kBULyLB8HdETRP69xH
         Q4pmdxGqgfJWxtNAPk7gWNVmhUW+FT3/n5DMgFy8dH1dGYZJPwG7mz7+/LpxeT45eoRu
         3GNBHMs68EA3ObRrTawNK9scNdmUKzCct0SIWox7jP/z4sDmHO2dOp2WWCq2Vy6kKLOy
         gRlk04mUWgOjgWZY2M+OVt9WHYjyxm3lfhKxSXLDTJec5HuZmQYy9uHGTt/axj3I3q0t
         cpmA==
X-Forwarded-Encrypted: i=1; AFNElJ+6EIas6PUjZjTAZDBjCrHvlyeTw1wERVr9dlhZxnVKDtzQnrsm81MGrsnjbbw9PKSmaVowXFAHalIq@vger.kernel.org
X-Gm-Message-State: AOJu0YzMw7JrAFXN2MyCfnIs4vYZgLJviTEFR6cS7JRWHvNS3BwLxLd7
	HV3m6eDJap2UTKm+rqmMrGOt1/jEkRciso10d+XikqxaniGrmkmTQcQmFgs2NP+CRLjJ/tdIZx1
	COq4ZiCU1RKz85ECkDs7pWHuY0f39AEk=
X-Gm-Gg: Acq92OHf5t6CphCAZr6q5EP95m9KDzDYme1e43sfD9Qn7ydZ5JHrbNa4h+lnIb0vsRv
	MgNokuk/jyXFQlC9NV+me7vQwW8dGyVkzbCpa/9SgswRjH4QKWocLL3gGh5oHm7KRgxOhaTw9HQ
	7DOosCM/e7NkJh3H9ndBD7TsRO5NlO9YvNRLY/h3nIEKvIKRlPSoppd0ujFegBG5xywnpzSRQiP
	fHaFVMfkRhaPVt8Zpuzyk2La2EdMTElH5kcDqe3pcKY005BMOZqNXVnXAQT2mtzxvOMJN2kX8Ni
	r8LNa6TH5VGFZvWi1vJlCR7EbQ9ScdwHJ2YVgMAkt5Gb1wy91a81fAclm4Ssosq3i8KMbrw6Y8v
	8e/SRyofkjR3sybKN
X-Received: by 2002:a05:7300:1493:b0:304:e2a5:689e with SMTP id
 5a478bee46e88-304eb0f1942mr1157086eec.2.1780058693522; Fri, 29 May 2026
 05:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-5-kimjinseob88@gmail.com> <20260528145840.0329992c@jic23-huawei>
In-Reply-To: <20260528145840.0329992c@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Fri, 29 May 2026 21:44:41 +0900
X-Gm-Features: AVHnY4IcyOp5CZC6i3jxkpOuG2fXWQ5C6S5HEB1G4kbbTEN36elytsTpf7dHQ5o
Message-ID: <CALMSewJnv25V6ivT5RJmUvGVijpOK8YK+6-dcn_RDLUPx8eDsA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] iio: osf: add stream parser
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, May 28, 2026 at 10:58:00PM +0100, Jonathan Cameron wrote:
> > Various minor things inline.
>
> Addressed in RFC v3.
>
> I applied the stream parser cleanups in the new series.
>
> >         for (size_t i = 0; i < stream->len; i++)
> >                 match_len = min(stream->len - i, OSF_STREAM_MAGIC_LEN);
>
> Addressed in RFC v3.
>
> >                 if (get_unaligned_le16(stream->buf + 6) != OSF_FRAME_HEADER_LEN) {
> >
> > is fine. We are a bit flexible on line length when it helps readability.
>
> Addressed in RFC v3 where it improved readability.
>
> > As in previous patch, how do we get here with any of those being possible?
> > The last one might make sense as it's about coupling between parameters, but
> > I'm not seeing the first two as useful unless you clear stream->osf in remove
> > path or similar.  If you do maybe a comment.
>
> Addressed in RFC v3. I removed the unnecessary internal-only checks and kept
> the boundary check for the invalid buffer/length relationship.
>
> > No way for first erro to be set, so same as:
> >    return osf_stream_process(stream);
> >
> > If this changes later in this patch series then fine to keep it like this.
>
> Addressed in RFC v3.
>
> >    copy_len = min(len, space);
>
> Addressed in RFC v3.
>
> I also reviewed the Sashiko feedback for this patch while preparing RFC v3.
> Normal chunked reception is no longer counted as an error-style partial frame
> condition, and the stream/core path was kept consistent with the revised
> validation boundary used in the rest of the series.
>
> Thanks,


>
> Jinseob
