Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E68472084
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039352; cv=none; b=bx59qHoA1epu0bURZZDrPkIVSvyHzKN0BUPQh8KQA5k+B4wtfSw0XMPmECXmxZHqZxya8XufqBpqW+n2jfpYpcZJkddqmABlQ5jKo1R3yE5MEj5++W2sqncY2N/f5hydMPkEfe7EMENxN2iYi6A4G2RpSkINRZ0OuVbRRFxOpcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039352; c=relaxed/simple;
	bh=AUBJWJWJkve3e0pYxDXtyEsmvYME9Ru4V70ME25n62o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h3pZ0dSPS6aNECOgBPlES/MRI7GPOCM7xZcoKLoygvIyXwcjQveimBiQDxAzLcU5mCjWD92MWel0DZdkE0JlLvrDiOA9hmVb7TXAHlTK3bPd25zZfDJLuCN7DMYQ7eYnBckzs0wTxHGg4aSTihdLvoPOa5aJYwkdCU354k4Zc4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCNMzlHb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fjcbd85h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCNMzlHb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fjcbd85h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
	b=OCNMzlHb7CLIbNldHDIx+qQeP0fCgpfAz0AW0BCEu4PlMNUh04R8KS/Bq13L6PsivVEkni
	lB6SCZXySXVdpyKc/CqOIhoTnJhi/gIddaqEvQZk4oWzdaOCGzppvcekYr2GP5aHggo35S
	qwWGmJfygh48ibVrVp396I7Lmt4zykw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-R4RHHEE2PJqq0wsGA_zlWA-1; Thu, 10 Sep 2026 07:22:27 -0400
X-MC-Unique: R4RHHEE2PJqq0wsGA_zlWA-1
X-Mimecast-MFC-AGG-ID: R4RHHEE2PJqq0wsGA_zlWA_1789039346
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-499b99a8a10so6771545e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039346; x=1789644146; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
        b=Fjcbd85h46KdsVRF35vSD+EN65X+OSVJXakJyiei+K778e/v0qh7lv8fuM5feNNxOD
         npQV4LJOpqZ+ocjuW3NRIrES6qGN6q671BHnHFp+sLjeTngwijW4IX37qs3w1ThIiuXp
         I2BMxICzcYWuBsRrjIaZyYNN3lnfZg2ojAEWnMDuu7slM+FO9OtIYJ8TelzzUmCvsnYC
         4I65oNnGw6XmxHmMIl3+mCBid7+8A4a1wQYYhc58RUR89CC56FVfXJJCsdJg9tmE/J8r
         n0MKcwdecflMyW6SJHyKwyvYPrTT6pcEdPGhtzqZiRP+Vt8gISoGmxXoUgsttoS78zKo
         ZTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039346; x=1789644146;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VW7WG5gI3vGojP7Xj/wxG4Oo1lstFTv7nlO/pfTslGk=;
        b=CUg8srOC0iMcei0tWdx2YFVPK9U0YvSrX52GLYNP+7uG+l0W815acDtCP27sMj+xo8
         ioUlmJwyvi4dj6iRBM81VbmRT96oBU8ZflUT956hf50QruPOEccJqHq3Z/eK1+ZJx6fI
         YLTOyIh+N83SQZ69KthLNMgRakzhGRRXWj566lRRenXey9mf2oXKWeuJtcE+ivuXAifc
         VwZqoSVhlO2zaaIJWpNoNWu9i/e63eFG+VRi8mAiztm7dTQuAhB0C+hlGWOhHxkP2/NE
         /uzfIxfrRD0RgTjlt+gQF+wxyPeL62YJ6BH0z4TLZ43nnjceSAVTe1tsD7LWDwzX4sjM
         Y9Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxxo8jMYIAH3mAwjeUSaQsvAN2DPIeSOVJbZEuOU7yMBzSr46ysZm5eDr2f5v86OQ3IWyHpFFVGUqgc@vger.kernel.org
X-Gm-Message-State: AFuF++md4phfwMnxi/NiWCLzXNnA3RgPh4vyOUQbVSEeOWYIEJT8a0+p
	9lLuj0Bz4ZHhgrW+2f+detLkUOO0M8+ma4b2Av+o6RR4DgL0fv1LA/W+N57VSo6ZzpQjOEF5JJX
	cHhX94xRzABY2YMerxDf0dL8LKOb7lIOhnfgs7kJV4MCKkdBqwWAgoojqByFTzZs=
X-Gm-Gg: AYBFou0ACV6ad9CUR5IWwILAKGaSPXNuD/6hE+FW1i1pZNEtnifR6rS3DAjIknyOzwv
	p0vNS0eEMX1QM2W7PrU6HRRchS+KgeNnvcLmp4hEI8lWazzzBIE5QRcxY5ebJtI3k+dE0cuO9/j
	XUctcgOOAId+LEmSNkkmLfiMODlvVJrZf9xcb4fVg/i3qCI4akt5g23hY1qIPcE2SvRninH0Szc
	DOwYWHl4zKq4kBnoZpto2+GophS7XsWnpvHd88vt4yIajivN69t0sAOjArVcEI8q9fVXsIEGD8x
	E1rRITp13QDeRPtrRfUFZ63NhnQx6Muva9K9EXHfK8j1zEvReVlI9ECyQH0MDAlFzi+tKC6bqbQ
	wgMdPUwxgEX5w8I0NujfTYS3ptENB+Wval2Sjxof4CNE7vZj4Db1CFwF9tw==
X-Received: by 2002:a05:600c:164a:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d26d863e3mr29452405e9.3.1789039346105;
        Thu, 10 Sep 2026 04:22:26 -0700 (PDT)
X-Received: by 2002:a05:600c:164a:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d26d863e3mr29452165e9.3.1789039345750;
        Thu, 10 Sep 2026 04:22:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm65309185e9.2.2026.09.10.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:22:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v5 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on
 top of ssd130x_write_cmds()
In-Reply-To: <20260823111959.17029-6-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-6-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:22:24 +0200
Message-ID: <87wlstl5an.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> ssd130x_write_cmd() and ssd130x_write_cmds() each carried their own
> regmap_write() loop over SSD13XX_COMMAND, differing only in how the caller
> supplies the bytes.
>
> Turn ssd130x_write_cmd() into a thin variadic wrapper that collects its
> arguments into a small stack buffer and defers to ssd130x_write_cmds(), and
> move the protocol comment onto the latter, which is where the loop now
> lives.
>
> No functional change: the bytes sent and the bus transactions used to send
> them are identical for every chip on both the I2C and SPI transports.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

