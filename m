Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268801;
	b=tA9iTlBOd5qUnHD65eh/khPJ/WY2RsfCHzcbeZ2awtQQUfujFOoEYZK3nOQq9YWOJa0H
	 2kI7AoZzaTCWgpmiPV4KZChpbZGaw3yFGrcPRjBgx+wkHPhIOHbY5w5b24+6GIXDbKifj
	 gP9o9+kg8Y69TpMKfz+JEcY9LJ0N3p5NCiWXFQzldK7dbm/NvdON24aM/RIG4cnTAkULB
	 5f8eCDyU5Af6oKvEG6qV5YUenQvvuMZumB2qBKvcvYi4okS4w4zf24GaUEmcqf3anG2QP
	 nyDowPqduug0duo4+n5Yh2zMFqPekt+NyJy2TjtQh3tsmfmg7ntDx8qS8wWBF9dekSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268801;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
	b=4pCfLF6rWO6U1bXavc7zm/h5c/TEUBuX7bKlqhYLA8T/LGM/xtI3yKDYPP9wfI9mApNs
	 /lsHlWwYqGgiSR9WQD/bjackqx9Az3m5iwXVQHp22ecMZtXFwIqLCUFIPe5V/zql5vgRm
	 FELwwcgrPIUD3tXSUgDWEPVOZbUU7gGBBXrI40k5mC5oBJO+72vDaYZ+kcR1Z2JVrY5Ea
	 GgeBL4ncCKRZWIWEKBOREMEvwIpbvUNheG5HBLGD1DkQ8ZI0SWB8brCKDDEzQExe9m9TI
	 ydukMMQ1P+v6u7uyUq7bpNkFSAgpQb0Ez8olF8f/fRP/Fpp9mU/DpdBUfLttqxxi7GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="G/XQfEtB";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jQQz7AJu;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB444606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB444606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G/XQfEtB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jQQz7AJu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793268799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
	b=G/XQfEtBXkndTUnk0epYFPFVwqNLSE5e5gBKnovUGus0JxgrbOoElfR1NenERKnqGOe94W
	yr/YZEo9CiPkZNDfnaQq5qrMpp5Oa6p6M0hwIEvKaXZ5ksLlZZTH+zYKKucZrvibuBkXSO
	5aXESFOquZyuVSTSSS1Ym2POBXfik/w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-TykuH3rXOXyjdb-YVqX26g-1; Thu, 29 Oct 2026 06:13:18 -0400
X-MC-Unique: TykuH3rXOXyjdb-YVqX26g-1
X-Mimecast-MFC-AGG-ID: TykuH3rXOXyjdb-YVqX26g_1793268797
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c4445512dso1701751f8f.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793268797; x=1793873597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
        b=jQQz7AJuwneaMydjQepZ+AHismEwv7Pmg8ok18y4ZZaoeokVRSSmNF763OwPuQs0O3
         4P4x22zkUsR8FMMSKHO7IxjUdXDnXwn06/WgPPJCGiVC1zfTeAD5MtMRUhVYgsvAmbnF
         gKMAFj62dRhNDQBZZAMmzd4/8YzjbBcbFQIq0NRgshHIxN+5Y7aEghDouaO6VL7/kWNM
         sKP5zQJXMW2wkSiG+NRUfM1QVjutHGv6Pisn9hPNgP2qpe52095oU0tdMIDN6uhK2sjm
         kG98JIrSqmHSsgkepntpH0lR/Z6yKZJ8rUiyh+Zqcu00HTEniHanje2FlyaTqiVXILma
         9BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268797; x=1793873597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0F6MwB09+OApBTQzzcClsM6qT4Lh0F0TCX0d9TCv1AI=;
        b=xvpUINgQ+n4DeZVD3gulkp3cvv5aVrvn93duY1TvwATnkybrNLlgck3crnju/JN95+
         M62IkLYoiJmLQeEIR4J2gyMqOqwz/QZ+Soc04L7V8QbyaVmq/6v+VVRGqFd/OM8dN0kK
         HrkGpCa8TWhS04DlDnUm/2y+nTgqE1OAmvz5pu600xpHRxu2oA6LuqlLL1IrAYbq6uCp
         x4OQ8rlN1wqNgeXZ9AzFQDAiVeB2/l08lMMmCYOJA9zXkPJpGNY5VCY47O3TlTW1mBpl
         1NLCMYiPH2sxp8Z/5fL8brfTgbSj3D1bxN8Xpcwccjz4jk2/81GAuY/9c2kufZ/QcJKx
         dIcg==
X-Forwarded-Encrypted: i=1; AKwUvBy/rr++/gEsIz68fXzvKFppZYI8IExIdXYXo6BVCXrvnWgphvulW+7TTh83ca4XVqNkB8KwRHEtNzwr@vger.kernel.org
X-Gm-Message-State: AFq9FYIx/lKrYsplK0wsA4vPoMe2lekhhDIVbXXDDIQ+RhGgU9BMrt/A
	Vxjzh22OZXWBP4dkvB7Ss0bsqw3UhYQAvOnSvYJTv9EkpROFns8Zgizje3W0wvYOJBr/h4ZVwtS
	cTaiPDBJxV3XW14rKikm9JNmO7Mep/YdH2+c+1HCUAFFe0z0cfsEXWXwap5+nWnk=
X-Gm-Gg: AYBFou1NCfATHcARmGuqBy7o48FFtpBmp4T07bE5FiABnscEqLqoNsuFZ+vtpsojL1M
	CT+66jnPS9uY+f/oEsrpH6j7t7mOLAOBIGminwCvfkIHrMYVx3kxPA6U42P7t9AtaQS+xFdw+R0
	n9J01aaVhoxyAIu1VZD9tJzuBmfNBYMLHrCFxJr0OT6yWqvZ33fYJOoU3XwgiNLRkmdIDmJCmZ4
	z9r3w4Ha6wbYYSosuBViu84eEerbyxGRfuy/gg4L1Ywfixoc34aKRnwiFEKTi37U6jocEIf7fvG
	TUBr+8gE8H2VZtmLx1STZRT5djxwP2GAayasWsIE/H4MRh5xxuSaRd3tMysBfck4D/+m7Ta/Bya
	WuR0gAJvI77vu77MVuEFFGWQVMkdQHEGEg8pjUh+OLs4=
X-Received: by 2002:a5d:64ee:0:b0:48e:6309:cefd with SMTP id ffacd0b85a97d-48e6309d0fbmr6302504f8f.46.1793268796709;
        Thu, 29 Oct 2026 03:13:16 -0700 (PDT)
X-Received: by 2002:a5d:64ee:0:b0:48e:6309:cefd with SMTP id ffacd0b85a97d-48e6309d0fbmr6302426f8f.46.1793268795997;
        Thu, 29 Oct 2026 03:13:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm33021365f8f.42.2026.10.29.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:13:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:13:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 2/2] MAINTAINERS: add Francesco as spi-virtio reviewer
Message-ID: <20261029061258-mutt-send-email-mst@kernel.org>
References: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>
 <20261027-spi-virtio-bindings-v2-2-67927b24b9d4@valla.it>
 <20261029-lucky-vanilla-spider-f9cefd@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-lucky-vanilla-spider-f9cefd@quoll>

On Thu, Oct 29, 2026 at 09:26:00AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 08:26:34AM +0100, Francesco Valla wrote:
> > Add myself as reviewer for spi-virtio, following the introduction of the
> > devicetree bindings for it.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5724645bf703..45a29ad08096 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29673,6 +29673,7 @@ F:	sound/virtio/*
> >  
> >  VIRTIO SPI DRIVER
> >  M:	Haixu Cui <quic_haixcui@quicinc.com>
> 
> Please drop this email with reasoning:
> Email bounces and maintainer did not update it after changing
> employerment.
> 
> Best regards,
> Krzysztof

Makes sense, ack that.

