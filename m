Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9513B14B4
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789284513; cv=pass; b=JQtneArErcRvasXhkqHbVB/jwXJDewUVEr/doEfSehntEGnz0BQJ2IUmS+wFY4sUmNAItXGcC62J7jc+JZV6FWcC6ZjDPA5Xkp130PQ+yUg8Kex3fQZjy0OdGSG8ed2Z8oW5BMQi/dJFiGatc4f/ltXEeHYrLEpxNVvpwlnyGvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789284513; c=relaxed/simple;
	bh=p2soD2Rf2OOF+LUQb8CpDj5kTsG2MF+pujWfnBktrnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjTQODH7V68uFP3cy3NV2yq2XeukX01E787+H9P6DhK7UNaT25wlLhvl6aVIVaxtB2dc3tt31F8GziDNoZVbKcQl0Kr0g4HjZlkVrR0GOt2nzyHvdM7u4/R4qdeyI/JOsAzuWPriyiCJSAZwpYd/e4Zw64dEGNZ4j5PkETKf76o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViQrhRB0; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViQrhRB0"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2370412a91.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789284512; cv=none;
        d=google.com; s=arc-20260327;
        b=C0x3+C9g4yBhgD2AYzzjzJo2hF9cc3jcIqCR+UmeCylvwnIZgn3jcXvcIIcSzp7PBS
         mERSVuJeoYD+5ZWH9AiA9eN6xNzTfUIeIMgKk+JOvIv0I6YRZ6vk+gm6MJeX0aKEU/5Q
         hJyJsfldc1oembclblWxoEnjB3ubqD/ALQ6rPSi3v5xRhbrdcTeP89mLqe33WSP79lkI
         sTikNIR23jmWWDGj1Rc5KQjGqH4Gnfs3DFtu78dhrD8sL7mkuBhFZJ5bDbqMxKFVsMxh
         3oN8bDdgVL+tTvQBOUYuezwHPIULHjDOtjIY8nFXvJf9DuWPoG8sjoFVIBxrGVWgz1c4
         WrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        fh=EI9yn+sFDNq2DnmtDcrrCt0eQFNiLKsb4cWgwCgUKzk=;
        b=MWjlylR+08ePMwey/8mgi6NGpdvUNPAMKDaUyIU8dyFgic+DTm2kusyjwxC5fyQy1w
         ue96x5cYc6Iwobgx+mqRT3K/wDK0EY9xyktwf5TjWhzWNkZ9rSCJsrhhoPblRYDrINKv
         Ebm1zXmx4NPNI5+ZSTzMEZ2tTt8YGgOxHdwfVBrsRuXya0q6uzvIII5XtJ4AukteL8Dc
         W7A8bcVN0c9kUy4spNN9D8RSQ4Uda01RwsinWLuZd3hCdOHc/TAfnDKbYUWdG+Pvux8U
         deEp0XpsF1+Hu1LumINdIP0vri+JHG5uKgellVslWsfvoGQaHpmJ8QC4vG0GKG2aZMVh
         l1tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789284512; x=1789889312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=ViQrhRB02slxwxYgNDAivKcv2CGHVX5NwhyNfHNuK4rIMbqZEcylply6gVS5WXYPkW
         JCPbxKryRJ/IrIvlsyLxjx/oMPvEqfdUluAk/nZLX93uVI8Ck7fbte21VrNlIiMCSc7W
         7DJvqjg1H2/TA0O5aVwPnJGSQorvde/mMqwaDI5TmyLWCB5yBnsKXMegom3T1dpS8QsB
         n3tz8pC/Omy4h3lUTbH+syAOIZcjbN8FRikv5N1BmfcKTwTwLmYG+s3g9wYY0X9gHBv/
         +Dd5GZssyieK0QmlIvlTSb7LX+B0UktdIfNNtOT1TFRI3E5dHHPlAzlgtR3xxKQ1fwRz
         +S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789284512; x=1789889312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=EY8LcD5oQyoePiZNewHb5Kq+HlsZ7PW3BiIaLvfd0A6dDfLCyE1e79X3EgLU7+6APh
         GwN1JO9siwr3ixvG7GrZKAImeqjs7L/Sj924eJJX69/XnI867MDkT03Aj7htgAF29GCh
         xCZHvDWo0nb+/SasfTYRPZdp1AADYo9wVRLl2MavqyjxyRO6xH2gPbrfX6Gfsp5X7rhx
         FvdmJ4LA9suYsFyQrRxm8jod0c41LkRzMATcv2EX/QR+/RF2+tYXr72/vyp6PadUoIOo
         jycRwRUSkY0Lov4wnxM3qSYNiihzwSXoSMaE18nVtsqcmFZXJnsBkbtfyob5kcZh8ojm
         JHfw==
X-Forwarded-Encrypted: i=1; AKwUvBwl7SgnBUBBlsUSTpdDy3b8kYfZHS3P9a3QBCTppwVu7a2f/0nWc4xLmwBCt09+pdpkpBbgb/Z7zm8S@vger.kernel.org
X-Gm-Message-State: AFuF++nVbIiYkhpIhxLIQA07VDjLyEcHZGL3qmICCoNfKcTDnf7dBGLw
	HjBjNOtVV1aUbKe0rFN6fDjoxlRV9HNdfYEzUjngA5bWrqIRVCDG+1XtMYRKe1tu6UfnuxEPq11
	nIBKbEDnHXHqJROhXKiDAihZFKqJ8e+k=
X-Gm-Gg: AYBFou1x9bmmlFwo7g8rzz4hn/0Kd1G23JHqQE2v/YAYFOMmtL+T1fk9uOGEpGo3zIf
	4ZECDm+225OtCm6yGAmujZoOdCBn8FoSPDsPwGJ5hQpsyybDwPZks/tFkHGezecrfO1bO9OyEkD
	BslGMnlGoMswJx0dljXDQawATWv2NzfQyztFGk1ebtaEfmbOd7ARNAycoKohh3qIl0g370IN3LJ
	9mR2MZRhMl1d75MCyIsKQ/BQDzQn7KAejsz9+mIcBAP4cADIEjiNOGpKdlpcRGeSjv7RQrLv25P
	NffJaCMT04Nn/N5XOPvtB2kjDKw05NI9g/Gvb+jbCckw9LyYdqDPtPoFkoFayjQe8N4l0i5xa2W
	uUMEanEb8G0vf6YymFNcqqugiMI8p0Yx8eblNGv8K
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id
 98e67ed59e1d1-39d9c3944aamr19707975a91.25.1789284511690; Sun, 13 Sep 2026
 00:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820050608.5440-1-kimjinseob88@gmail.com> <20260821033334.400af4d3@jic23-huawei>
In-Reply-To: <20260821033334.400af4d3@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 13 Sep 2026 16:28:19 +0900
X-Gm-Features: AcwNN1XcNBJwG8gWKMDEIRzhlwe-EM9NIJU5D9mnXUFN01Obu2gnIbb9GqvbVzc
Message-ID: <CALMSewLdDGApqiJZGdTjKdj7RqLKahf66kjrJ5nRHCpj5p+V5A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] iio: add Open Sensor Fusion IIO driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, julianbraha@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, grondon@gmail.com, 
	devicetree@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?

my intention is to preserve compatibility across firmware updates by
keeping existing message layouts, lengths and field meanings, including
units, unchanged. Incompatible changes would require a new protocol
major and corresponding driver support.

The remaining specification work is to reconcile the draft differences
on reserved fields, extensions and magnetometer units. I will document
the agreed rules and compatibility policy in a versioned specification
referenced by v10.

Thanks,

Jinseob

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 11:33, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, 20 Aug 2026 14:06:03 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Open Sensor Fusion (OSF) is a physical sensor board that reports
> > measurements over UART.  Add a serdev driver using the generic
> > "opensensorfusion,osf" compatible.
> >
> > The compatible is intentionally independent of a board model or firmwar=
e
> > revision.  A fixed wire header carries the protocol version, while a
> > capability report discovers the available sensors and channels at runti=
me.
> > Supported capabilities are exposed as four IIO devices: accelerometer,
> > gyroscope, magnetometer, and temperature.
> >
>
> Sashiko has one reasonable sounding comment
> https://sashiko.dev/#/patchset/20260820050608.5440-1-kimjinseob88%40gmail=
.com
>
> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?
>
> I'll take a fresh look anyway given it has been a while since
> the last version, but others may make their decisions based on that
> statement of how mature things are.
>
> Jonathan
