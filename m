Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC94CDDCF
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413548; cv=none; b=R65O3ZEUtLovKeGkOuejm+/lQ6nMu9mtzigO3xbK2Rd2S9XViGeoJgMdx6HmFfyxlPf+UHAustURnl3mOPZFouI/63RAO4pXkcUFdGdB8zuzmlx+w++opDfDRstmz7k634e8xiMWjBPbKTFTmBLyVH1CcV7Oyw+Lolo9HXPRXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413548; c=relaxed/simple;
	bh=vFGazr0aQJt5RzuoQR4G3P0EOLka2JyrVxwz8bszgBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULxPf4ay9bOjPhhRIWucasYXJgog0xOEupO37VXtcjiXpFZKk/MxiSVMqSn9fnD120L5vv4Cm6bkarQ+89YwpaRRfKvHriDIzNjgN0H323U2L3cDGtNOH+LQknoDLQSW6nmHRJwG4e2LhLV+OvF6UttvP3SgunH9YkaEHx7OgD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKfriVX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwq9w2Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKfriVX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwq9w2Fo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P9Ru2753903
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=; b=VKfriVX6+qAmBvUJ
	S8rJfWLOJCjLIbcmSEVYqEzztxPtl5o79LqZy5oHNHvsBo5dEqLzhI0Rbq8QUBv4
	yYcprXqTM4vdCJ8FPy+oUSH9oSC/uPvJ7ZlTyryUqP5qnFXXYfjTyDMXK8RVdpgn
	cQRhy7ChJwjoYmjQ1BPWNVDeE70uOq31+d7ei4uIaIUpgiblSPihTnRbHj/CksRt
	iSx5UgSfBavR+b3Y0hCrFvT3G0LPYYP5npEQDj9VlCymd32jFu3f3Lg6qV0tt10b
	Bw2qjF81gxaHnF6V1FyvcKsqCV0EutBxEowj0y1q1+dHtYwHk7dKSFRDrdWNjLPZ
	7mUaNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48h2gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:38:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so22284785a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413535; x=1793018335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=;
        b=cwq9w2FoU4Je0ZSC6/u1Fy4IoqSnQcHEwJ3U+41qODM0xWP/M6q12XnCllCMoIGSA6
         hzJnZxydDRRt6NtH/W6gzVBkJYWFuk+F0vuqGY1ixfvVw7Bmv60qali56DGPfaJ0NnQM
         2VwU+0/T52ZRRuCWX/6eLOY6iIU3tGe1rT3G8rIEUptC82KVlWJiSyj3djQVs/NLOka5
         lFAXQthvE7+JGqItaHo4fEAxlgT99pjRexUMtAV3MVtVprWwrVbrIuOFg0XmBOUBsrEk
         oEKzOHNR6ksEgBOcZDBawimytQQn1NS43dxoIdklm7Dg2I/Yxcsy8DjeFB0/7jwSZaH1
         malQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413535; x=1793018335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=;
        b=oMEPTUe0fofy0pa3FKyXEPnFjt2cH20x80WeNvpvOko9enBLtnpcDZD2/DoJeEffVo
         Tz8CRsJReC0nVek29vBZOPPGbe+vLCRrcAubx9UqnzBP/DJSbeRcPNPu//SSc7K9MFIx
         ypfpdUltw+lGKP891+5ybBpiRloctsZ1dfzcedVDN5DQVhv6q6J2rU9XGmeFLMx2VuN+
         IqRYLFwdygh8AOKBtawUb9vy2sIfuAcr535WBevsCRvEUspjjeyBWQDV0G1OfVOru+q6
         0zawpXygOPMLot3D5gNcwsKMEFr3kuBQ/fylMvY79gc9qPE1RmHcfUsbcvq1oyQjz3Cl
         IoXQ==
X-Forwarded-Encrypted: i=1; AKwUvByPsUO0zuFfg4F5i/zAgaIuG/DcytgR3yfDuBck6p91VPXLI5UsnpqwakQ2MJ1KeW2sd3+AEkWxZlWG@vger.kernel.org
X-Gm-Message-State: AFq9FYJGY97M4iTsQHNM30403YKJeby1noH1Yr4aVcTS+dB8f614HHuB
	mMKxVBbhrWSbahy0v9A+u+PEo/vr4THvbm5JbT0nunsHmNsV3lx5U8f3GR/dcuCxZzl/Yp0Jm7S
	0DlRyXMppBTjdzjGQ5U0W2OmeoqlptZ22P3tHoF4xiXWbjarYOurewvF4XLFBe8OC
X-Gm-Gg: AYBFou2E9XeEKE+Xb5tCN328VgXe7aREN6mzXufyOiygXx/N/6ap3twx5Zzvd8Fl1/D
	qsBN20s6KyukD+lSZUKyc63cSOWEzGcHPMxKRqQo6/EWDdEotjnsBw9/AmMYZifrO6ruQnF/Nar
	YZHZcJSSRrr8w1/Ad9D822ir+DW5LLMnFGSwo/jzc3wtVbgIo6+aopqExoQBssQFdsQTz5GSSwK
	itZ7PTiKISrcny1flInCum6Mrra91UiiWzzynmLvQIf4gToraBlAlR3Z0HAIx7MzfvYy71oAG8L
	AoaGOpvRnzXxWjyifevSWnA7SbLyle5U75W8udQsrDZLQrm+OyjvoKeCQqttCS87fQsIpgNzN+r
	ie17uLabLKuh/oOuPlMOdkg==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1436766285a.0.1792413535136;
        Mon, 19 Oct 2026 05:38:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1436759185a.0.1792413534522;
        Mon, 19 Oct 2026 05:38:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcad6sm354612466b.52.2026.10.19.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:38:53 -0700 (PDT)
Message-ID: <577a1383-1198-484e-81cd-3de996cc7150@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:38:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Add a bandwidth table for the Adreno
 620 GMU
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-2-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-2-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX1Ic4zNx8piuR
 ces7oH/SF4hCaBWIfspn+TPgF91QLI8DCGWsZPwy++SrpirFklvQ23vyRrjOtyUlT8YE+e7U3GX
 zRExI01L4dJIS/fYAs0E8jlbeYHfFovY2EB6NQEpwbnvu43QTrYc5Y/1TVrZCeEN9oV0/k8ls1e
 tyw3QWv/l2hPzIKG2xNxmu7n2W06Uzc7locrCylNVACO3uFwPt8gvJAqEdF7Gq5mqAzbRQhPQE3
 KRjiLXHJHqx4btZWn+8rIpkDcexag5q9A0o0d4mCMGexyIMDMqkQJUxSm0gvLYZt9TiSjXI9dro
 iBF/P7MKae6fhzntcwHocmdeV0KxQOyfWkw6+hqR9jhPrZohsrtngZJFTN2fG4II3zcdmzjWopF
 Qn0saO5W6B8HxcLNzIYpQUK5ooP5MgT7CZxBhnO32LR4/P1bfiuo+/PmmQidvQF5RtSBgkt24W8
 ZKpxzXYnmE+TBfrAyuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfXxL9sKLiREt0u
 ZJv38reekKExV69yy9yNhHQUjTDFjsVuybKBZ0fi55fdTR0INJ/4t0jwAk+80cMvhpyc+NUDrRr
 sbeaWKfXpDpp25+JYLYt2VP4t9GTkn0=
X-Proofpoint-ORIG-GUID: c7jejjcamQpB8TX0kRHucXExGOF5BqTm
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad60f5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c7jejjcamQpB8TX0kRHucXExGOF5BqTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190050

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Without an A620 specific table the GMU falls back to the generic A630
> one, whose BCM addresses do not exist on SM7250, and the first GX
> performance vote times out.
> 
> Like the A650 one, send a single "off" entry just to get things running,
> with the BCM addresses looked up in cmd-db. Add adreno_is_a620() for the
> selection.
> 
> Assisted-by: Claude
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 6b34e704a..cab7ffc63 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -553,6 +553,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> +static void a620_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)

This is no longer necessary if you add .bcms in the catalog,
see a6xx_generate_bw_table()

Konrad
