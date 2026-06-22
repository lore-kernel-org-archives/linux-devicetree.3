Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C23369D63
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129710; cv=none; b=njTBV/CDvZH+KtHvDAM36Bw0ma4zMIS5HffgBVvFmdQ6y6KhmBhIpZgW6yxVnAft87SkPjAige4LRBgGaqDrsbQYzwr3i2t0SyykqwOwG1NifGDEubbTvIdVc5nTtpTBLoNfRAc21tDJOzVmdHwSeUACSeBKs1GQu6xxH53rnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129710; c=relaxed/simple;
	bh=uD0QZs7VddbIkPpXuaeKB0CRTKrerIXmBiXWi39VyX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdofWr0faBnZjFTWxuW1JAIW+xowJbai9UXzxSOPPzhqnz0TPq/Z5bxvmKvM1CeFcGechbdiMrsRmJMff2EOVUWKkpRqf6ncTWwBnL7Gmx5uqBVC9LqJRQDOV/0M/pdN1T/ME99YHnn7x8P6QSWUtkPHDAj0KnsO4YXD5SWqMuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYyjg16p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diwm+Lcf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYyjg16p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diwm+Lcf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAn6G1452379
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wLg98q58XffM+jX/2zG7PwjP
	TKcG9BHbX0CTkaDmaTw=; b=EYyjg16pIRKO4mH5JpZt4gpxoDvkygXDItJBkS3s
	I1Eg3Vm2PlHrh355jSNb2bjm5519ry4zClClNFaQBdlOT3o/NnFcdotHo+MMHpbc
	Y8WWPfIpHuDPICKZuilIivlxs3Kr1UKaw4WHo0pZBpjqJ6a+FNahQnXsDbEkblTl
	EpReYUFYhMIylQ+3YdSb8aas2pKHnuPQK/1vPjSWNvnWcbDgPYx6WQDzq6Ci4Ktt
	lYu4cfynSt/1g8jFrfSaFI8pImvkUBOm8utL/p+ELD/14gPZF4MtcutOUUSrU8gw
	UCm+OXaNEqC9rtNBOQekhg+z3yl9TqNU/EK7YUEiiAGzVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj8cf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:01:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8ab01bc3d3so2081180a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782129707; x=1782734507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLg98q58XffM+jX/2zG7PwjPTKcG9BHbX0CTkaDmaTw=;
        b=diwm+LcfAR2oOR3EkrYoSNz3WMO7WJwQmcGIAqo95nj8JCuRihXrCV2prWVGNv3uhQ
         kwsmJbOYwInyzcv4y9L+IdqGXjk8v/a5fOmc5kqHz+8qvUA31lJH3keDmqArsnjZnpnC
         jwAvfla9FW9nsbKEGfHOu0FljgddQ5zbDuye6QHrzlJBebe/ndBK/h03VXYEYj9MNVrw
         JdgQ8ilRsfzT9qAVZGld17f5FCkH9w1DYsNbIFyivMPYro85/kWv7/IluCyLAJu/XE/A
         +9fHKxja/qjQ7/w3xPFuwxqsTYjDKcmFCUnrnR0eYsa3/fTWnAkuGAz7xchNFO7lfAcw
         qVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129707; x=1782734507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLg98q58XffM+jX/2zG7PwjPTKcG9BHbX0CTkaDmaTw=;
        b=KzqMGfqgYjVFDc3+7l5xvNCgemK3V9rtOlZrtYDgZWhRcqkmKiam5tufiJC8Z/kU2D
         z9hkndkwvQOiFLhPKR19stEA+EMRUG1W0YbJxFeI7YCUuzd8Eb0/CF1ut/LHgJQL+KkK
         XBpP/krT3/YICqTzcLyCmhZQ4nXuh8TvQDFG5j59IbMivMUs+qho/L+hW0lNMTtCdJc9
         W882R/lbKN7dwNJ9hf0Dna/bzef8y9lRCWJe8QehK/xMxXtwuV3H8Fvj+7bcdOl0H33X
         TUeQp4RGNCuOxBCTjcfWfTdjnpbIRaaQ+cz6fs1/gOwQCLki/vcAZZgXoJT84a382bbt
         w5mw==
X-Forwarded-Encrypted: i=1; AFNElJ9lVy0wog5al17rR4I13f+oUIU47dA4wVqm2AL4dBLsIfwXVJkE/KmtJ5E3nz/tt8Mslfg5Q0ZCjQqq@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYRY6K3/Dpc3P1+JHSS0qcRSP8SDYFd/7g6CDKYbg0sHpMWdZ
	9YbfWgy+Mwoh8eo+MZfeubT6r74GV/CcB2hzDKAFau2COzW5i9Mptsf5JMXAUitVbGFtw/XX+9x
	ysueDbYvvZ7R8owvjxcSJ0Y2j5Hx43CBFZovGlrC4wBc/UMpcioIko9KhtjMO7dc3
X-Gm-Gg: AfdE7cnRlRN+xOjtDJ6126e9aVgz20v6DQR+pDgvA5XXi7c1xPjWHkCg1jCez3ltGrI
	I2bBw+0NBt8EVM3/tJ9vXxCIPB/JpSjPwJkR0qybgeeBAOmPZP1fy6RM/N3OEpTsVW8tyRGgD2L
	3jFcuPLnckxByz2T2SoEOfvHp2lmiH6gxwbdgan9AzjSRcPw6d0SkJwlc8rUxPvCOBJmHrsiei5
	rZABKz5S/8EiaWYGixy5u8/+6WiF1RxK6sQ3ZURmozwSlV3Oq4SbasRbIB4c67NcnhArhXUIgHA
	cWffkgAE7InbBf6ZYRIRKMyoprST5kXC4NbYtYUzoMJq5IuC8ABbXJ9qDF7e8N7yP7dUr6KbuWU
	2lC7h9ask/vf+UabpcXNg+xTffErceFABlcOO
X-Received: by 2002:a05:6a21:1493:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3bb3608225amr12571602637.33.1782129707303;
        Mon, 22 Jun 2026 05:01:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:1493:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3bb3608225amr12571433637.33.1782129705662;
        Mon, 22 Jun 2026 05:01:45 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8f392sm7019090a12.3.2026.06.22.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:01:45 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:31:36 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, boss@oss.qualcomm.com,
        qc-display-maintainer@oss.qualcomm.com
Subject: Re: [PATCH 1/4] dt-bindings: brige: lt9611c: add port-select
 property for LT9611C
Message-ID: <ajkkINI1PzxArMzL@hu-mdsor-hyd.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-1-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-burrowing-fervent-serpent-584cac@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-burrowing-fervent-serpent-584cac@quoll>
X-Proofpoint-ORIG-GUID: IjLMB9M2s_9Hpx4Buql_pRnvSC2AEhbN
X-Proofpoint-GUID: IjLMB9M2s_9Hpx4Buql_pRnvSC2AEhbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExOSBTYWx0ZWRfX3p4A5uHpOxbe
 FmjRxFr0tdOE+mdGguKqDUrcGHGEijvXf+q144dq2HAwM10vZfd+SI38Xv6aFTGSM5zaCbjILg8
 JnLNJr11k7LsTyUAw1TxiiK69ZrP5C0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExOSBTYWx0ZWRfX4P33nka0ZEoM
 OIf+wJ+Zy/6AMKmpb8fqW4PsqNPUD7gbkNNtsmrovtS789g53AzPlmxNEcDBux87Q087PPuqHqx
 hWCEc3ZQBBIE7lszdEVPu98a66+4k75P+3nuMF7bx1TcoE7enRSDvLkZjfGOqS89TMLCFeq/nOB
 YV31Q7Eul1AoQGkyWjvJkdjD6SadBP/UR4pL46RnVcnw8YZCh6rTHlSc4K3RZ1YutfKfUzy5dy6
 dpEdtBcXLvN/4+fbCyK1OKGkQBs4E9Muo3XcGzfZ8pfWkInvyDY/UilIlZeiuY/dMLxAlCdUidu
 Kn1nR0kv7mnFr6zj/4bTZt9wYnBNhdEd/18dQ+BmHGU2DGjAx2Uu70cx9YsU0ybcDrAmm2KDobO
 NVdJsX1jrfBGYnwoMKl0NBgw4U8+pGl2zb5HjFdhuhpSy/uWAD911tezvphRk7roPn7rYY3tap/
 GJt70sqKAX2tvmAG3Vg==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a39242c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=biyRtXT4hMIPAN2vSTIA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220119

On Thu, Jun 11, 2026 at 12:40:38PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 11, 2026 at 02:44:56AM +0530, Mohit Dsor wrote:
> > Add a new optional `lontium,port-select` property to describe the DSI
> > input port configuration for the LT9611C variant, which supports
> > single-port (A or B) and dual-port (A+B) operation.
> > 
> > This property allows explicitly selecting the active DSI input port(s):
> >   0 = port A (default)
> >   1 = port B
> >   2 = ports A and B (dual-port)
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml  | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > index e0821a63d9d7..77220f893bf8 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > @@ -41,6 +41,17 @@ properties:
> >    vcc-supply:
> >      description: Regulator for 3.3V IO power.
> >  
> > +  lontium,port-select:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> > +    default: 0
> > +    description: |
> > +      Selects which DSI input port(s) the bridge uses. Only relevant for
> > +      the lontium,lt9611c compatible.
> > +        0 = PORT_SELECT_A  - single DSI port A (default)
> > +        1 = PORT_SELECT_B  - single DSI port B
> > +        2 = PORT_SELECT_AB - dual DSI ports A and B
> 
> Why graph is not enough? Seems exactly duplicating the graph ports.
> 
> Best regards,
> Krzysztof
>
Hi Krzysztof,

Thanks for the review.

The graph describes the physical connectivity between endpoints, however it does not fully capture the internal mode of operation of the LT9611C. This variant supports multiple functional configurations (single-port A, single-port B, or dual-port A+B), which affect how the hardware internally combines or selects DSI inputs.

In particular:
- The graph can describe connections to both ports, but it does not indicate whether the device should operate in single-port or dual-port aggregation mode.
- For single-port use, both ports may be described in DT for board consistency, while the driver still needs to know which port is actively selected.
- Dual-port mode requires explicit configuration even when both endpoints are present in the graph.

So, this property is not duplicating connectivity, but rather describing the *operational mode* of the device, which cannot be reliably inferred from the graph alone.

Thanks,
Mohit
