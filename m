Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674476;
	b=JiZoYoDMzYUQeQ2ZRtoT5NM0LiTN6djazQvZrGs6mbyzDB5JpmmC81wZBxvqKkMbi2X1
	 pvPQGkz86QRJ2OywuoKCFZf7DDTdrqGrGLdqGBYtD+gFS4XBPsKFYTkx0wIh7vOtiPCIq
	 Ga3cSM2IAYV727N/iUJr273JD+SVri9gRcjLtRyKQv4Q5HYG+BKr2WUQBsD/jmiMkONOU
	 wcT93dnYYAb8z8F6Q0dn9zTIsh0uiGg2bFrhx+hegBiDTBiOH5VUVwDTcpLuWbC8tjfwY
	 doXbhjkkjstC4kv/Yh8WPM1FYou2smyd0YvTJAM4lmY3FpFpoN6zvhcWfGpfis2f0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=iuraqwI75fJxUqXNuDGoJd/83TkA/Mt0D001le+Xc7nbRIQEhMfrfLqeHKSplxOzptIH
	 zrVsFDch3gF6zFGKpjFA1szFwfxSunHBMxmE/gelsda0+/X2cTy5EQYbXmE3dcHUN+NgL
	 M2PzrHaKdBtk0bFyLNGccxgKtHIoouHQwcXsK/eG7gtmsyfylo6g4M+CMdQZQAuoogSSR
	 v4d+Im1x2KwxCoHV/2G9b75sItjcqf+gAodZy8chVTZ4jV8/m4KfseV+vRX6JHyfJskru
	 Dm6tyCqO6f7uc/Caif3NeaGx+3REItD+Q097eM/aTywcuUEbmbgTJ+VjgasUTfsVT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU+iUfhZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09829606A338
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09829606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU+iUfhZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795674473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=hU+iUfhZfyXQdnhNzpHDsM/mFBVtS/fXfTU1i9BGshdJ8ACg/a1Hmmc+DqMoUUUkk9DHTT
	a7UqHokDLz93N7GgABLm++GfldYvzZxpfJ3+MN7Tvc3JLmAHWnprh2PUrhJTgsfbl633d2
	68cphqQritvYmYNgnUB3Sa9PMLeficg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-MK8VGFJwN1uQoQF95tvgZw-1; Thu, 26 Nov 2026 06:27:51 +0000
X-MC-Unique: MK8VGFJwN1uQoQF95tvgZw-1
X-Mimecast-MFC-AGG-ID: MK8VGFJwN1uQoQF95tvgZw_1795674471
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso46710975e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795674470; x=1796279270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=UsxCT3+vcGpHo1FlQa5wibNzAz0XKjPBk9+2YofaI0NCCQsNsQm6kzCV36Z1yDQZ6F
         3obzY3PeE5b1wTTpin3eFYcQWixPWs425/MsW/w2K+R0kVxC1lMS17t2UaR9Lqc4mG+8
         IZKDJQJy9YvakuZaEnMFS1xFVtpWqAyNLdk4ZAukXt89HKh4MtAwatL6kGZz2BNd3wvm
         CwtvxQAJmITBj+G4vTmut2zK0Vi7SRnemSMCP36XQ2PGdz9ybeR0pvoHlj/QPxXxlCtU
         ge5qBKSjz47zCJdIDK82X+G4QxBYU3DM59pIq5tGlyPK+MsjcOGAa+nEfKh0KbIEpjcG
         f+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674470; x=1796279270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=bSf5FLIFKWy0oUHSUgLUjl3o3Twkx/iBw8OXYfveFhzxLc9bawEWm4sAGrmXzI9dRi
         LXrd50ZPeQaEPMGPyMBBOkAmvbiwNw6ZFr8HjXq7M7d7z1YhAg1kqsmsaMoaWTlxZ3/d
         GBCa8j/3mYRcbeOy2tcFZWwRlqGyCVoMc00vO2uxdMrvxObKyxmHbYQ0kGqzyxeDg+MU
         NrUOM9Um3OjBAor+ZdzfVKhJIa8qrK+G/U5nNbUTRKt/MBi2wB6x5CXT/+EOYcJbdGGG
         XNQWUCrz44tjkTFw59ae/AQyO9xH6weyraie0FFDZyBCQPAtIO3sH0JarmVuW20aF4pu
         ciUA==
X-Forwarded-Encrypted: i=1; AL+hErEj6x66NNahfPJEy6ciqv4v/9JACK3gavvoNY4mMm5ECfZGRlYQAxReziDQDfsu1DdFUb5lqTzwZUJG@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Ousp/CJV2cinjpfrkFV5J2xazoxpLwttMF46MSiWN+dTifaA
	l7inFTWGIu1GvNZ4QXV+JeZR615VpVyNRmWbIAxWtZBit+D5MMnFm88eO/xUqdk0NKR/VpCvUVS
	jinhhlQCBEjTtO3WTDGSpHXuTT8/XFnDc0/bDPLHltK0Rs9IwIszkYuaC4GrEfQw=
X-Gm-Gg: AZFdTZfmnkj8Fcdv2+fwQmhndH5N/L0U128zJx/SzIQNQ2RvUExSq5Sn2jyE++FUpsJ
	1QnOaZ8m51vs/4AM7zgEOxGZO1C6lXpa/ZCIVKkUMhfSs2dRqvO1LmQVy2BstvjS63zhbECHXli
	fmTi7BX9c1GrD2e1N3n0/CHNfPEs2szLQHM9tz7OFvGxIUp9IiPSIZfvo3vDeXfLwO+Wrnzn8W+
	TkPmBtccC/6CL30cLixhFzQFw/Nmp0bh+L3DQA7YDGOgMjEaOWdA5xkpiBmSubCtfXd+nbu7TMe
	iZNd8nw7XSSipuUzn7tSq4tRWh9zhnLaj4rEZbPcqannAoELWd9vMdL/3AD+YPHOVjoTdUm7uMK
	oHuYf+3nJP2FpoE1QsETU0uAWYS9zERK820lrqhfTQ+s=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405069375e9.4.1795674470487;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405068955e9.4.1795674470015;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm44293956f8f.24.2026.11.25.22.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:27:49 -0800 (PST)
Date: Thu, 26 Nov 2026 01:27:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] virtio: Add vendor-specific device ID
Message-ID: <20261126012523-mutt-send-email-mst@kernel.org>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:00AM +0530, Jayant Shekhar wrote:
> Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
> vendor-specific VirtIO devices. This allows vendor-specific functions to
> share one VirtIO device ID and be distinguished using their vendor ID and
> platform description.
> 
> The value is proposed for VirtIO TC allocation and must not be merged
> until the ID is formally allocated. The DCP function driver should match
> the generic device ID together with Qualcomm vendor identification and
> the DT-described transport.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..9a8b6a6a03a4 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */

I am fine with this. But it has to get virtio tc approval or you risk
conflicting with someone else's id.
Please request a vote in the virtio tc going on this one and resubmit
once it's approved. takes a couple of weeks usually.

>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0

