Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010485;
	b=IGVZ9ti96sBkxHmFWkPus7yyst4tAf7uwTaRFBbZstsM0hYSXhXw7EccP8ZqrR60h8mQ
	 NWFa1OxpiluKR4tyJTXH7Lcz7UZC6Bak/hvJgKBYuRuk3B5tJHGVhY+AQSd49BayTdXF7
	 QLCB8R+dF4ODvRoT8b2Mp9r2NRWHeYg+YZi0KhJXDaylo18qCjqgSVIMJkvtC6nJDnw0o
	 B1Rx8jqO1bow0M77eNvSnJbdZ/w2j11pEaxIS+wivXvAk1poCXMyR8lwqqmxCA0H+2/9u
	 UzJRqYMi9q2iq21p9q4lnPWa4r4K6rUSZZizImLVg9Nzaxbw2zSR8txcgsdbaX/YIUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010485;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=UKm9ySXwQuJcyRsHuWKDw96xhKlYJCQg4DigagLwOkJToWpofQWL8+jJiSLgFvhVFUut
	 k+6pjGrc+eT4CBygP/Drdb+ykjXX4r+nK7831nAEPxPqUxqVNjLxSRxgqqFPfxng/5Tnm
	 XCbSmVafGL1Gn3mqZFpXcPhr37w0CvUFBTSIDlGM3eINscGugbHmMi3vRqwDsX6BhKIAi
	 TMROM0gN4INNd7X3PvuAFShHJkAtMkB/WjMJEFbxdll0ulmdgHc/0F3AUwi+llepheRfN
	 RLYSoa1gceQdfOGaWOvTGZjOYhCcyCw2qnZJG4kYwXdNjrurjF/JK79VySG4r3ZxJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXVlOahm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F9606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXVlOahm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793010484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=QXVlOahmQ//hEXbyh5DKI6q9DyDg6+e30GTpPZya5Ke+cnA/VGeIDmiCviVjZ9E9mIIFH3
	gXHst8rmOx5ORld53/yzhM4MQD/6o3S3tmI9IvqOWENAbs5Ox15rOdSDpaKCjPAG+OOIcP
	+go4dZN4wrHg8eDS9PHfj+q6uWnDC3k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-VG0cY2w-M3GM_mhxKTRiOw-1; Mon, 26 Oct 2026 06:27:50 -0400
X-MC-Unique: VG0cY2w-M3GM_mhxKTRiOw-1
X-Mimecast-MFC-AGG-ID: VG0cY2w-M3GM_mhxKTRiOw_1793010469
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so2645915f8f.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793010469; x=1793615269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=sRiZt3m11RfvggKftBaVvpS+01UETYAGyxYbWp73pAV7ua7Ps5NFUlEM4a3wXHp/I9
         Gopn4ncvcFP98lxb/IH+C8XyGBE+KpOAPDHUud2MBaCI7PKtVB17+iKp6qhqIIlNNZyW
         OpDCp3yWbtc+wav91MW6LdJLGHmlHzzAwGtz0lIVlZ8saptgEONYa+58D/0QKEotNl+d
         R1EaH+lYSglh+Wa3dnLIbrT7+eBQKFXpgzMOJ1hMQol0V+rTTGNuiuo6JrBZHeWal36y
         +ap3YVyna9gyYGJULDYNIRwhEZwjnGKt/iiWQOwQYIaKvJ6PqKAEg40IUIQhYyk7RTxZ
         C6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010469; x=1793615269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=MA08N9YMmuRRPk5a+tMwwc2nbrqGPDUtljhpD4pl0e6Azh8YWBhNx+UDuvlEgisGo/
         kjTmjwuHAJO584IgT4vDxglKlBkhkylztv3C0D4Zc+TaiCVZJK4kqrcgTFNDfUau/36g
         +yz8pXJtqjeEOHmByGRV5LJ3V6dDiKhIPLTW0EyA8JUi2Jk3ZjFQvBRQ8I34rx1HNA82
         Lvhx/GRAy4ggt81P4p0rY6xVzOiHGKa8sP7g0dXYUCEzr7S17xSjafXw+IqUGIVYUe0E
         hSTwsjXNzeeNPZvkKjGXGNjeMUu95SoWclr3mgtRavkBKapOjMHf1EL3l1hqKe/C+X6t
         hJGw==
X-Forwarded-Encrypted: i=1; AKwUvBwVyj1qrcxs9i+49wGpoD+KxrISEis5e05cVA29guup8TAJTeXQW6j0naP/bEWUHz6M1sxcvdAF0GdS@vger.kernel.org
X-Gm-Message-State: AFq9FYLrZQaAuLKEe/94GRzLyy0bR6A/NCdOIArV4IL8HuS2czIhvGc2
	qb+PO6a9W/0yor2w9xhAuCDFmxK5O6sRDRoFoPDVUJtJZG+7UJQuxvuWa7BhM+7upZRbtHUucxq
	nAT8pzEkkjrFKF94eeBaqsYmpfjxkO9gRtwEyntKVSRg6ZlRXGWyIenkTMQieWvs=
X-Gm-Gg: AYBFou1XpxyDXCf4d/Zu0ZK/BWMqzEHD9aq8RZffl3+GT6dYwTxiOuq3A3AFdHg7YWg
	/XXVO3d57421qJnsavpjKdRvWmCZ1HNiD9Ej5I8fgHHoVE/toh7Ze15bxD1whE4NVmcwnCQ1cKj
	i0zh9GR26VHXG063lpxSGW2boxCMs1U3iBc30DuRHGngbs5pK8B6Demp+viMov3/FmAyVJywsft
	hu1SwChP724bq+PVdDYXXqlL0IS1P5apmimynDhrgvr5VUWclR/ayckFWaYZ5z3zLvv89oz0msp
	Ber8nEk1YWeJP3E057JBAWRm9FdnnrxcS+hsyiAmVH5EM3ENY9QiptIleAo712zp4ic=
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919731f8f.0.1793010468928;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919670f8f.0.1793010468317;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15899811f8f.52.2026.10.26.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:27:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 06:27:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	Mahadevan P <mahap@oss.qualcomm.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <20261026062229-mutt-send-email-mst@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs

virtio IDs are allocated through the virtio TC.


Reserving this spcific one as a generic VIRTIO_ID_VENDOR is now under
discussion on the virtio-comments mailing list:

https://lore.kernel.org/all/20261022091645-mutt-send-email-mst@kernel.org/

Please
- switch your driver to use that + qualcomm vendor id +
  validating the device through the DT
- do not merge this yet, before the virtio TC has reserved the
  device ID.



> -- 
> 2.43.0

