Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008796;
	b=3BfUAuhw8OlIyMLV82AvNTiIif555i+tem9Q1bSvkCz7Y3lmiY2uoBKwuoycZdkVqbwZ
	 eFW1zW5ltF5kBQH9rxIWpNgaALUVDqXlrCOxCRX7B9Jpxjom3rttM1LI2dkmGt80IJyAj
	 uoZQQGNSf8qMgQO6xSbItoJcxwH+M5Mkw4DDg2IB+DXOEPZGWX0+XA9pKwUImGxuAyZaI
	 sm1kCNC2tvqkGX1dOSxoXRpgqfqugZatz9hOqMhIgPwd/MyTjh72/6WK80dFHWM64zKYv
	 DCjnEENEAVFevybkOGjVspDrYOUaSQMEVWJtNJlBAiCg2Nv3qqZeSTb9LbTRTT1vWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
	b=FH3FhwCCq7KJnnEM2fQWe8Bvn+kL88s5jldkEqCosdYntU2+jDRdwWE+2zxUQnCC+tGn
	 q7MqAR5o3F27ClqdQaP9byqS8ZbiGHQbW994FRyHbz3O1kHWBkVe8RRhS4VlLYRDXLVip
	 7J5DxdgtkkfV1ZHxN7HyraR3FCoaR0dUd9f4nZJWu69XJLjgHJzMOwRIv1kuPvPhbBS2l
	 84NUs8f763/MHjIPvO9dUoTB8NGGZPvlNG5lFWz1Og16xpE7SjWlrXiDlSriqsR1VHVLG
	 4TZ+1/5VwYAOmkxJYd3HetaucG5bcsbydl4xYQlfYpzROrBE0Tygx6+Oo5RaOusd1iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E87606A33F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E87606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1RJ2206202
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EihPl48XyzquhIbKjuEyAajD
	35LkfbvtwIfgKv80/jQ=; b=duOPPQmSNBtx6zhy2MyD4npHJuJX7Gm6wHBXP8ce
	gso6SBXwNnKeARLD/e0CobapPe+Pf7ies1PCMX8l0Ug5iwRxIVau+SXTqeR4fsTE
	bPqNxK1Bfn5d+FDp8KiVM+Bp+TZkWsYiaO5Dxo3FHoaEt9Yu7ndZYJNRki6RGyau
	e9TqyPtI9Gei8s75Mu/XbJ23qlTZsPaJIRg3qr0eUH6Wvuq+DaaJU5SFPTDHFggF
	7OibQZR51kSYWjQNBxzIW8c0qzGWVc8rErJCz0VI/N1iO4JE5O3EbCK0hg/I3CsL
	BG8uaN7ChjqvVzPqPBbYVSwVAksgA7o7Ey9Rzt7q1IwiOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruntjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:59:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso427753137.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008794; x=1793613594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=Lq4wGaDOBpVkSPMT650pzVDZ0ZdqcSGrAoZzfFFdM518fJR89ZIGJx6eXL4yL13Xrl
         9oCqAU0R7kUVi1UhMw8akonpcHbyZwFuJSqb2u0tKGPC3YAvtla7H51NOZadFUZSmL2Q
         r16hd6Nxd/2pcqEyFFpl+3UUTK8ynsmIJlWYJhXm4y/6UIroUCCKK5bS4dQlsFUeRuZD
         +7dv+Yy+eyqDqM0WLJ19pWBstqB3OdBiZ+hFQNu63MhCIR9KRwPkVXUIAerjgns2bfb6
         l4jF9umI9ok5cQKWo5grKI3y0p/QZRQ0T53+Wdpe+LNpYXhCZaRkEVf7sKuP/riR2oQH
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008794; x=1793613594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=FjtNZVijHkJ3DHj8i5LTMHgk2eIKCqAnV2dAXxWzSmrvEI70n6Yrp80aTUi56DiWWL
         1S3VSRLArJZH1tzpKsv2eKrnPWrWWgax9XRkbluu4fh2C8xWV520P1yTurifPD2QkchS
         xaLbu95STWxBHh7JphZfhCZXc+N6Jf30q5xTwrEzKXnm8awSAHiVSx3LFEv4bTUipP65
         p1bpThmSn6xXXJIXU6vQotrrQ3pPsx8oyZrGWv+6EuDRohPoOUOPBDKySJOd+6+8EZ98
         fjUS0+g8X+HRDH/5gtMu0loE+6EputqRjlE+Up3lplWMHpXO9zNf8EfffxytO1h19TWV
         A7pg==
X-Forwarded-Encrypted: i=1; AKwUvByCysmhlCRGq0E57omMmOuH496ENfyUNeSlzOOXoPVQ7a60+/JbUCw2L9eRxPAd5XPE4S+zw4qfSAF4@vger.kernel.org
X-Gm-Message-State: AFq9FYKQWU/bjcvE68WhMoEu+BkxxKQWXlICPdvczVmjaDy8BFIFXz7S
	++xmx1huu1ikyCRrawZ1qTIZcZCObDGxFF119Oz70NuSfwSGDKgMPfRN3ldRqV1deOm65NFwaP/
	XQI58jZLshd6BLfJZmZ029ql7jxyTCWjQz1mv7olpINVuOf/QoHt3KMfhDMuAcEeE
X-Gm-Gg: AYBFou0biHuNjSNfRZvxK92VeVohHeQ7ACv3ARTjLarDyQpoJQzK/3xdfSeZ4V2GIFI
	DRdbB5hwBn+fsQJfq3jjWw8vGQRgqeLGTc0Ln2ffbowrcu65+wcIl9N9e7ul9nLMy7+XKW643Lb
	oJi8erS8/Fk/WJ1sqraD0cqerTunUs4gKUgqQaIXRkDZOQmX4TVZRRaSipTlKlgMhT4hihlhQMQ
	5sOwZENajStk0e4i3KTCEYJFbLyqt/M+UNkD5CdbXoPLhSKTgnGn5l0wjJ7YWE/Yr9utuQJgpvZ
	B/ivo0X3YjYe0+hKgjA/ZnGiyQc6Nb8UiaI6kiooD3hm2CTfTFfU7D3K5ZbgZM4BLSH7wgjfmCq
	V3SnDsaKU69/1Sep6wE9onl+N3xNqum3dUxxl3skPoWPOOBiKCA13mFBsBCgq+OF4eEYGRw3Bwk
	AKRY4yXNSN/ZP1
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586648137.17.1793008793925;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586636137.17.1793008793315;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm16973671fa.14.2026.10.26.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:59:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <lisaligvjmnnib7gm6klab77jfzyagn5cx5pix3isodu2cjvrr@o6efvpyte5yg>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX8QeWVcx8QBPD
 0+cjF6+it/RqhmCdMWNKXgNjAES0MI3Ag1GnXWKuY2CiX/B8E5ruZwKfgi+qq41fY8128X2ghuN
 x4eaxNKxsv88htU+kdqMKEZ8I+CJAsgQYANKapNAg2E72hUskNcnjcQdyjJvU6mVnmGnCBjk9QT
 NPnYN3GKPahRtnyY8LYRSocuP4dcjaF5UYsQf1ijGt7q0vDMWgMWNlz6oaeTt6IhwOT2KIsKur+
 RaAFQ3o7PrcZJmP95cIzJXeamjUBNrws88dHvGbH52j406TT4T6GcMuASOVBUr7hl5ystpjfXPb
 EU3ch9l/Q8WzXgUQReFizP4HZSsk6dmin9pbiXIsSygN0QZvT8HDzBm2AvgMSRuIWTipQ7dYG0B
 ma48hi0Y6FRj52sQvG54Ar52JozJTYkO1wdBW4EJqx0JCH/OgMR3iSlnQgHsz88qGOh5tH0htSx
 xzRNlfHJWzkZxp+SlvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXzSpXGgr42+SY
 g6OlYrVSY/CL8NBzHshtxws80mCtkPWHovNhILU+0nHZ+uuiTHB1dEkyl4MIloarMczlmsllSxS
 uaiASWUgL2vRRl04FuGy+WNcKHqemM4=
X-Proofpoint-ORIG-GUID: xqd-7rpk1TcTKjBm2r8pfbJqYWaQ4Uu5
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf249a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dTofmrguFlo4DCddnn8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: xqd-7rpk1TcTKjBm2r8pfbJqYWaQ4Uu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed

Can it be anything other than the DCP? If so, how would you identify it
on the Linux side?

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
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
