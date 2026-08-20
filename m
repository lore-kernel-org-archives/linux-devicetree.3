Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF04734C9
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261220; cv=none; b=obm7ZA1LaajtDwG90TLzPurCJPutAUgDGaS0zm4lj9AMDCWqOz+rqMr3NQwbbB4PBLvjv6UrvTQbKjTBw9KvTzlu2FZXGNUx6uusqJUk95jqJwfSzngvpiVMAJR+2Lc3MuzrdS6Mvnr2/EwUaMTE6RPzROXWDqyUxbsyX60zNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261220; c=relaxed/simple;
	bh=flVWlbv6HVxee9sFquQe7n8ODcDyLvNO3XEPWMCqKBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9xYdtKggzVwm7VgwWqwCm15ay8blfcTV+xltaw20gD+ovVas8FEvPq2+iD80Eaj7+VW1NyKdnc4vBk6TUSPn3ydxzZzLGOomZY4qVSgpdqTOc4PRAtlE879T4aALdJ9L4WEOTZbfRzLyy5KOMBho2FyRzlN5UtFOR1Y8htpFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIQQTUBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4jQgQrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIQQTUBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4jQgQrz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK87fU067150
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29JvqW0qyorM0smiBWAgN7RXSiPY2l2EMYW4kmCkF0U=; b=GIQQTUBTS2jzW8Oh
	JCJ0vZS/ez9fV7J0PIWPBQ0yIoNBa2uPnTkbelnNP5kJM0GqQAHOWFXgdZxyIGZQ
	to3xZxAvGvreFkg0GezDlN3l/e4Hsc+4lS+hOsQ1mdxrTJ6kX6xsG6Z/FgzwCAiQ
	ctz1zTfB3TPNUrbCxKtETzuN8iVYeNqW5SYTE9mdr33/ogbhaL1gUpAfAraY6EuK
	EMHto+1RMefJa9so7A0owdmxd075BEBdC7jN6WrKJ1siYbZJROWr7ELLvZ3R5oeo
	h+wH287Zmbeaj3alxAXgibUJ0JsipqXAX7dr/BLyzWL3NroYKLUCDy8W98h8BNwj
	z9GCiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0jytn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:26:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa3d9dfbso35709585a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261217; x=1787866017; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=29JvqW0qyorM0smiBWAgN7RXSiPY2l2EMYW4kmCkF0U=;
        b=T4jQgQrzRV2z9HOleaoZvjcP79kX1ZGCuz0RSHdD+eLL4wccgdLRp1QAsR2JckjE1v
         j0kwawXnsSoXDReZPcwOkX9+ZGZKNVyJp1vGbxTHOYfcq4ORRd7WfvqxhcyfqveqBUSv
         ZMans/Aq/5dCIqMD096etZKrTmVzUdscr6UaKBL9QqRDKfdmGyWnRmolW/n/d25XDPAH
         KokndnUf+y0U88Ts59abX/Fv+US7pebP0y5QW6vRJbix5Dc3nyfrDU8SlVE4SQVEoL/7
         aNhqUokXULQZrBJZHFMfYrv9eqDar4KVSww/HR1kup7amQ1lZ3RTmLOA4lyeUY9M9Q19
         15jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261217; x=1787866017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=29JvqW0qyorM0smiBWAgN7RXSiPY2l2EMYW4kmCkF0U=;
        b=dHNrD+VNmbmONkgHzVDNzyRDqlaii8mtUti/dpsWDZNrJzMGwFXapEoY4jvo0dHrpP
         dOHj77M9+7N6sAfnJFjuz8w0/ZQjrBBX803EVGWfu0iaJzinKhcIaiibbP5eJ+F/pkZC
         gOtmlB+eiw4HafdLCsSqWsPeLEdT9ALFiuje4oxH5m+lPdfA7GdDsme0x9ZMZ6N3bNcn
         IxGgS2G90XUR4qPzxaD4gl75iTpId3LMLPAYyvyo7lBDjOmgfk1sYEojipyP7t1vJaAr
         40mAwK9hZ2vtychQ1bs84bz9ghAr8DkjbuQUrSYLwschyjiWZ9rB04uxBs5I9nhIkEI4
         1Hsw==
X-Forwarded-Encrypted: i=1; AHgh+RpIuG4sPnIn/1jOk5E2g8q5R/HGYSWSKSjWd/QB16irq7kNWeos51RJ1MpSpK5Jl9fCWhhtRu9/plPS@vger.kernel.org
X-Gm-Message-State: AOJu0YwKU4IGnKRlCXm9MKPfs8zoVtjPqVcGOd9XOBFk3+WAuJrUyRuF
	vEzo43iAMOCcr1+EYqqOxjWt6KGT18CdIFPSh4lTDGgWr2mQdLP/n1TMUnfdap1jOwkAZ+geQtN
	K4DseoAbbaVRxuoQ58r77E0X29IPeINVh2BoJGwYqQ109pCDoUgi/eVbn6QmdKbDA
X-Gm-Gg: AR+sD13nDlMSg7zx484cLYTm3+eURyXdIYVPU0RUt5aVNzsXLMLSSY7nijU3NW5vQ24
	+wa0wY3tAqO+9QAr8u9NsDZbcPlG+6LqJRgSXg6luVMC4DaJWcDIMW2Et1/nNZzyo9KjNiK8OJz
	fiCg5X8d8caWSX/S9xAw9tCQi37nVsQ7Q8uBehKxoo04Th/uaHL712bNrv90OiMBITiT/29jdMa
	TIhoxuZcJsOxN63CM1lzC7w1rvC5zjom/n8o0tGJ6HP3poIeMU93BmeC0KyUsYB9D16OlOXhj/X
	0ve8AjWspZAfSGrfTczi/1i9xfK4m3K13oWv4bfobuldxYb920izxxvVGQiTD2RnEMxl9/z1zTx
	v46OUzCWyN7cq/3AuQF73Y92CG1orRmQRXsHGdar7zOljTYap/X4mj9kdsH8uehumspMzzNaiOQ
	IhLehsVWfN0MCO
X-Received: by 2002:a05:620a:404a:b0:936:cd76:4d4b with SMTP id af79cd13be357-937395d4298mr113971485a.42.1787261216895;
        Thu, 20 Aug 2026 14:26:56 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:936:cd76:4d4b with SMTP id af79cd13be357-937395d4298mr113967785a.42.1787261216418;
        Thu, 20 Aug 2026 14:26:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189dfc265sm15991681fa.19.2026.08.20.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:26:55 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:26:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <bqcu6de5gitz7oo7tyyutrkas5rq3u6bvfbjlje4afofscycch@2l5g2pelxju3>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
 <h7e5t6rqvrlogj4li4incr2pog57dfal23rqo326vi2cz4zpxl@m7orpk6dftty>
 <3c70019f-28a9-445c-b2be-fd61fd13be50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c70019f-28a9-445c-b2be-fd61fd13be50@oss.qualcomm.com>
X-Proofpoint-GUID: -GsItWI6wTuxFNAdacYQa6h1nr10OpQL
X-Proofpoint-ORIG-GUID: -GsItWI6wTuxFNAdacYQa6h1nr10OpQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX8BHs/EovlTKX
 V753eSxGmvqoSh21GejeXHPMp7480rj34fAyp0HHTXDTPdee8C7rBt9zakK2hUbjH7Vy3h6EIE3
 cTAnxyYlORfnnnUOSR3mflGspg9PoI2eUVWkVTF18EirpVLqcA2XRoGfnBoBHGGceqAlR5GpV1C
 NjCSr0GQy/hG1Mhwsz7tugwEXhi2zxzrcv5RG0mKQFIAabcW0gqBpeNroSbBgdadO9tyFUKtcWx
 cRL1vLjpiQeLHblEw41jT50+DSBnJJ70gQXWeCLcAenYiZb7l3puHG8+hTsmRsdggJ+7ulH5Zqx
 E/5n5ynFvDCrHomyusWhrUzHBf7nFscxf28u26frzve6jYHttaK/yDhMvbrvhfKFzk2KLBwcEsn
 iYJAgJ7vUDow+D/ILV2ZqnyO4ZbfXhsNQSG2+DfWD0qYOVrsZpgQe5823DQhIsoUmsSGDLzfh99
 tbkyPk7ALZszjZ1DYFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX4KjCE9YTZn32
 fFTCKHWsoZQ2CM9gK3SGSBErML0w8WzYeXiEV1JFqlzzh135VnAjWXIO99LF9MF4toJm5X6ndY/
 j8p5Wto+c+3cjNLHVov0yLCuW8vBRe4=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a877121 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=kBAx4iqJ9KIqBnPNQ-4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200160

On Tue, Aug 04, 2026 at 08:53:36AM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 8/3/2026 9:37 PM, Dmitry Baryshkov wrote:
> > On Mon, Aug 03, 2026 at 06:57:09PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> >> Hi Dmitry, 
> >>
> >> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> >>>> Add a Qualcomm JPEG encoder driver implemented on top of the
> >>>> V4L2 mem2mem framework.
> >>>>
> >>>> The driver wires vb2 queue handling, format negotiation, JPEG header
> >>>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> >>>> integration for the standalone JPEG encode hardware block.
> >>>>
> >>
> >> <snip>
> >>
> >>>> + */
> >>>> +
> >>>> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> >>>> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> >>>
> >>> And you've ignored feedback here. PLEASE move all standard-related
> >>> defines and code to the common helpers. Are there any other drivers
> >>> which construct JPEG files manually? If not, you are lucky and you can
> >>> just push you code. If they are, find a way to unify the codebase.
> >>>
> >>> At the very least, it would make you split this commit into at least
> >>> two, making them more readable.
> >>
> >> Yes, this comment was incorporated, maybe partially, or it wasn't fully understood.
> >> The helper is used for the quantization tables and wherever helpers are available, 
> >> similar to other drivers: hantro_jpeg.c, e5010-jpeg-enc.c.
> >>
> >> The missing JFIF tags and additional helpers can certainly be added,
> >> but is holding up the current driver just for that a reasonable ask? 
> >> This discussion may continue for a long time — is it reasonable to wait that long?
> > 
> > From my point of view, yes. From your comment it feels like each driver
> > having their own way of wriing JPEG framings.
> > 
> >>
> >> I agree it would be good to have all other upstream JPEG encoder drivers move to shared helpers,
> >> but the effort isn't uniform across them. 
> >>
> >> Five drivers — hantro_jpeg.c, mxc-jpeg.c, rcar_jpu.c, gspca/jpeg.h, and solo6x10-jpeg.h,
> >> build a fixed byte-array template and patch width/height/table values at hardcoded offsets, 
> >> so they could plausibly migrate to a shared builder with a similar shape to what we're proposing. 
> > 
> > Can we start with something as simple as this for our driver too?
> 
> Yes i agree we can add helpers, and qcom jpeg to be first driver to use them.
> 
> > 
> > Then you can converge all these drivers to use those simple helpers
> > (this should not require the actual hardware to test), then improve the
> > helpers.
> 
> I don not fell confident to touch other platform drivers which i can not verify, but i think
> that can be done as part of separate patchset after initial helpers are reviewed-merged.

Ok.


-- 
With best wishes
Dmitry
