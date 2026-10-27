Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101910;
	b=kEpazTEpDqntpJ+a16NXbjDZrW6JcZehvwpys2Ql1d+6OgNAyJ0X39gQ6+7Kl8dSnhV5
	 KkzMHacX/MTEFj9iUw8gQD0VbStpXqDIDEujBvohOzZ4xxLdeHmT2VY/qEYnqH8P5uDSB
	 paehYGHuEkqyAbUC5ljRl1vVbYWGvjywr7FoLnb6hvLI6XCZCDLtB1/H/48ffccW4Pkef
	 3Yas4ukAy1ARcjsE6ZUKZHe6vLat6xENQM7hkYuQlF5JPbte05Nk/SEQH1JOSaCxC60va
	 PyYArUx3rSWiUSHbOWM40Dmp7d8MfTJIA4Z7ZUv+YA/lsDCTT+ug0JW64uixa1clV9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
	b=cdmk0hqz9ed1vuq7sTEyXb7hHW0CO3KkZ9tsI4HRJ8dDKu9sgLeaJ3tAcjDg5GaOaOmy
	 9s/FUb7YIKkPSB95kq6KycnjBR6FI61PqrCUEV8/ywihgumxeW7r/pvXgqqm1zCZzLpgs
	 MWLCNo2afUdMB/OCy6tVm4wnXeU8oiLVD9fs03aQ0qyhBNWuM7bR4KPmqj9p696uP3eIC
	 34taxTd54BgZftFtvOuaXUHCKWsZL4dggNAfyKLoY6rP8Ns8brG5RZaA1RyR2ymea0kDY
	 afWXHriAtziTjyFMqjoG5+1Okz0Csrh8/PBPpRu0WgpYLgVdZGOGA3xJSQOxDfWE3vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F1606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwqH1061087
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4W3OqlKiBwfz5eOJMTRV/rIc
	RtmzZqXVHzyrSvnxP1E=; b=D1mfuL7SsPPdywV1ReO5FFA7LhAPLjwRRqGIXf5P
	zHtT9DGm5cK7aTPGPks/P9Tp3ff5LKQNkHUi1YVw4uQZDKdHMtxyca9OI4ORMxWA
	M0qHs20gmke7Jm1Ro6H3/CpWT8JkzH30zVEyPPuQ0OswNev4I7RQ381fWXOClVRR
	kQX9ZFhdwY6v6uMd2DyCDn12HCMkp8yv0W+efd9Ulldrq7jkk9bxcvNyyaiHrIm1
	yOCyBIWEwV9qfwg1kOiGI/p/GoLgs/KhI2n87VNnAom40WMY+IqIvknE8yLyux3S
	7OOPInAJcEHMHv+WquBkag64NvySmob2o+UL6KSZatGoeQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9bht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so4739850e0c.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101907; x=1793706707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=ODjG4Tp6sYiSpQUj1ak18Nww2EFA8xoVf4jLK4DanUOjGarjW17SW9/Bdw4Y/IYMbt
         UTTNizatXJaJs7YM0F3QMpZMTkpby4dHrLUk9ux1xLGeZvMzEZ7ehivcczSpuo8hpNED
         lpLKJZUCA1xJMNnkY+MEBjQFR5TFa0g1gSIWfq0LdmHoWKo1hS3ipCokM0PYhu+yVbmE
         e9LKIUzDl7oQOnBr8BjER4Obe1uPx5xEjmbDXi5mIk8fC7pM/UmJCxyHyzFJ+S/wmZdS
         IY9ssstHX9apHU6RjJisdqGsV0g7PMSFoe0MTCsw1vUP/MRcpl3nFeFx8uYGwc+5RK6+
         7s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101907; x=1793706707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=vgi+yPi+43skcRdQLnxmjSnGfhU5Y411n2Numci67smsYN9ts77+TWVBe11sGSL1SP
         IBExnsrOebr/1kKgDVqlzWj5EIwN/mZfZe54pEi7NSqPEw1q/eeKy4drFTdZ6MdDW91p
         yWRAqDh2KOH9ersE2fT0WHPR6GIH3mQugYUcDXBi0/qSjo9H7H/cQINsgDEBm5qV2x08
         ChCURgmQCkQfHEwm7V2g1pExtefL9OpxmpY0cT26dFU4Tl4qe329ceuABNQSK1a4GneS
         9rM2obHvSniEFDk01f7zrr399Rg8kf9GvlmPNTI9WJ2mQEg4j5yX/nIJCi7WSLLCtQeO
         TXEw==
X-Forwarded-Encrypted: i=1; AKwUvBxsMvE87K5kL+e5yGFaziAW1K8mEuNStzEjpUx4UhltyMIblew/iH045uCiv1Evs3r2U7u3bh3lVN4t@vger.kernel.org
X-Gm-Message-State: AFq9FYKe5go/xjow5pbvlUmD8qzBkDp4s7HhgJQ2PLuycCodfhBTaIh7
	qD3btGFilCTUh5lajTCTQ25o4IoRJguUIcXPzKeZz5n2p0q/9FiQOm+7gpyzjiSKK1H3KJz8DRa
	6cEzBTnT/EZk4G8RYTgDvw4ZsjStRW0JuiLYPT9mXlk1ffN/nDHiOno/mHoDGn1ON
X-Gm-Gg: AYBFou3/BO+UF9kp97aWMbzu+OH+fFrLYel5BFKmwpncuMm3xDb/H5LkrFPmO5wEmrf
	XVOLBV9jTuKoZBdvJroREA9i2ofp8akyIvxtPHGWtIPlCWlQotaZ6InF98L3PVgFpfarePu+zVi
	tDDgfuRZl98eGJcwGg0mF2pEB/DhrreaaAuB44/Y7dirwT57h1chHD8+I9vLpc8OC/RTNTE5R1K
	OCFNpemMUl4/zN4CBPj6EbQT23FWblT6Vqt20xIe3sKvoToPgqpNxmwwJ2+1RwL4wpWiJjOzUOq
	oePHpc0btrzrybycI3KMJU/qRcJzvW5TCORZj0znSQf/rZnKRFRSbLrBlhPKaFgCnOP0n4gJTYt
	pzUWHNsSjikPyWhywCZ7cOryLqvdKwAbyNTxBiQmQCSHW1lhDuM3YvoU1JxDU9G7Nu4p2UvUijg
	zMhVVk+Tl3cO+L
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936900e0c.15.1793101907200;
        Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936868e0c.15.1793101906693;
        Tue, 27 Oct 2026 04:51:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm24077941fa.9.2026.10.27.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:51:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:51:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Message-ID: <t3vxg46g7jac5th3hrrs3zchss6lzmgm2ga5qkro4cepr3qmnb@ddosuavblhuy>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
 <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
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
In-Reply-To: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae09054 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=75pfyCq1Idx6z_e0LXYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: FaJX2ChwgFto1jJQ6mSDC2or0mDgKojv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX9CuOJOVprUOq
 XzKAtYGyISjFCdp5OA9+ovQoztY3fL3oA2m1+6tJ/2Q9j9YQQKlifNXqxQ3Da7xkgUpxOb4g7Y7
 cQbq8lP39vm1973wN4h9N0fTXopEZZ4=
X-Proofpoint-ORIG-GUID: FaJX2ChwgFto1jJQ6mSDC2or0mDgKojv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX/1UnrylmJsTJ
 yMEMvOvaDMN0xjLS6tpGi1tBTBZGEhEEuLfofDd9TbE7UmINKxIrrgqO/AHajfbmPR4qtyXPN6M
 vVosBAZd/F1A1E7trXIyyfH67rPq1RW8jWRW1p2rZkW7zxuoMLKy/GXAQK/aMBqaOuGoq2oKMXL
 x+dsIXXPF1eTBaYe1EdgpBOwSc78xbl6ZA7sC4pmOUsw8IXKIg4NKL0SFjKjp4nQPoQu3Ou8U6k
 k5P/dE67S9msK+br6O/zwsqIVVg6RD2UYxtzE0kRu9j2rNB8vkqo6gO8S+xJrXk4TDcm+xxQegd
 7zssNseGq1vQEUfBRs1XcQJlOAtMCXvd0ZeJoKLkRV79hcf89eMuF/x33Jc5Fo4QeLI/Ek+1XH+
 uAprLa8+5Uh2ijU1q5n8a3CJUQIIfmcRdwaE9qIHbfksdA7fWU2b+/ZI8TsvTgbAUDt90JNKGJx
 s9OSbYw+WFWTnwlJzAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On Fri, Oct 23, 2026 at 12:37:30PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
> > > DCP may be power-collapsed while the VirtIO transport remains available.
> > > The host therefore needs the platform IPCC channel to wake the firmware and
> > > to receive notification that it can service HFI queues.
> > Is it allowed per the VirtIO spec?
> > 
> 
> As we discussed, its not compatible, will address in v2.
> 
> 
> > > Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
> > > before VirtIO queue activity, wait for the firmware acknowledgment, and
> > > notify the response queue when the IPCC receive path completes.
> > Don't describe patch contents. Describe your design decisions. The
> > reasons for the flags, init/deinit functions, etc.
> > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile       |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
> > >   4 files changed, 270 insertions(+)
> > > 
> > > +
> > > +/**
> > > + * struct dcp_ipcc - DCP IPCC power-notification state
> > > + * @client: Mailbox client used for APSS-to-DCP notifications.
> > > + * @power_chan: Mailbox channel carrying power notifications.
> > > + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
> > > + * @power_notify_done: Completion for the firmware acknowledgment.
> > > + * @power_notify_lock: Serializes power notifications and teardown.
> > > + * @power_notify_pending: Indicates an outstanding acknowledgment.
> > > + * @state_lock: Protects shutdown state and response queue access.
> > > + * @shutting_down: Prevents callbacks from accessing teardown state.
> > What is going to access it during teardown? Can we shutdown in a logical
> > way, so that there are no accessors after starting the teardown?
> > 
> 
> The access can come from dcp_ipcc_handle_rx(), which is invoked by either
> the power-notify IRQ handler or the mailbox RX callback. An RX callback may
> already be running when teardown begins. Without protection, it could
> complete power_notify_done or notify resp_vq after the queue has been
> detached.

THat's what I called correct sequencing. Make sure that events are
properly ordered. That is, disable / mask hardware event reporting, make
sure that the events are processed and completed, then teardown. See how
IRQs are being freed.

> 
> 
> > > + * @power_notify_irq_wake: Whether IRQ wake was enabled.
> > > + * @power_notify_irq: Power-notify acknowledgment IRQ number.
> > > + */
> > > +struct dcp_ipcc {
> > > +	struct mbox_client client;
> > > +	struct mbox_chan *power_chan;
> > > +	struct virtqueue *resp_vq;
> > > +	struct completion power_notify_done;
> > > +	/* Serializes power notifications and teardown. */
> > > +	struct mutex power_notify_lock;
> > > +	atomic_t power_notify_pending;
> > > +	/* Protects shutdown state and response queue access. */
> > > +	spinlock_t state_lock;
> > > +	bool shutting_down;
> > > +	bool power_notify_irq_wake;
> > > +	int power_notify_irq;
> > > +};
> > > +
> > > +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
> > > +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
> > > +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
> > > +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
> > > +
> > > +#endif /* __DCP_IPCC_H__ */
> > > 
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry
