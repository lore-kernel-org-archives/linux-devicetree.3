Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9D344040
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484694; cv=none; b=WMpH5Up6DBpA8ASKK/DvefoZBKCykU7ifQcoBlfz03gcqhYtUGabq0HHu8I2IIugz6AMasE+z3vOzWYz8nmwXzLnQvnL7y6yUfd9o3/OarSRlQaWrCbP1H+3Qoty/CmPiVhbh3g1s+3SGgu+wENeCxwAfZ7BxQa3wiFvQwkhUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484694; c=relaxed/simple;
	bh=9qkwSkP9DVMjl8zenyaRqwdDdnZS3TpBC7V0mAMwGY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbPJVmeizGdOwrSam0tr47lRxcXlUMsqnYeWiSTq89NFMJfCPqlf7R+e6qSDZbPBSPX+jE3xsQI3Xy2FnDwbzW8g6dg9xS61LrGIO2tHfH4cXfOu+My/hE83SYh3gB8mMKAW35VoC685Lv9WvLzV7acExhEYCKsK1jkODS+y/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9mUAVTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2y7A4MO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9mUAVTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2y7A4MO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLbCDu1096748
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=; b=i9mUAVTP+e76A6kf
	qXEH4UBXn5uVQDDhFJ/7otsyGf9JiB9/mZB+MGzbS7vsOITCDuXtDC2+FmPCQpzz
	0UVjlHyk2TBYPd1zFRChCSE/0B8qzDtRGyVX9mdrOTIkiazr+noB7NOo690iSkdk
	SJNAgeh4bBvYWXSHHe+VvV2bQiA16ri+ib93DiIg9GMyMy4osSwrIB+jBAp9WZm0
	eokWnJkeeqjuZZEGMqRXDbLvJ7aaZjl3PMvr25Om0Rt7el+ibZeniWpxLGV7u8yC
	AKzOINdQ9EG15YWdZ1uGtFqUyXGfSHDrKXaLH1ikOqQ6EcL90bUz3D1ZGFbHrD3f
	3C6lfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g2943-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:44:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso6401901cf.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484691; x=1787089491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=;
        b=D2y7A4MOVUW+xusBCQZBPXoYiwgy7CKRXJF6HEWmSA+bL/6NLl7UjvlT5Z4TWok2Cs
         ODmnAa/u5iDix/KoRpvdu4PLzoaAFZxm8x0nP+DYeSoRpWsDedinZnyBG0WLztqtwr99
         hMBPbP0GKTYI48oSNJ5PnLZByyyGI0eXxZXDQcrZ7hsWiMYWfxFCFzgksfypxveo1cth
         GDKUZzqkxuNQgQM+ESS7spWR6mFRpBc2sztmWGwiBXfhEZ+O/hPxw0OvPIjszySS8Tii
         1I6MPNzAke8dqCuf8ffuHcKJGDwERojx6wR8anrraYAZ7JgcOu6ZOqXEjPcBUBu8sN5l
         aE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484691; x=1787089491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=;
        b=KVxQH/b/zm9wc3VIvNt+9qeK47fkkyvecHG+PF0FVzCWqXRD707PCjBFnD+n2ynB3R
         5OiuJjI233bxuDjuP1yvYfLLS5TrJ1xyT5d9aLCVoibUljlU6TdBmSp0L2QrJEs8+vX8
         DGx5i+qE4Cw4DjTsA1LcC7NmFaf3dEThNc6aa5RUuXkvbJikTBJDXelw+7od3ky/o2P8
         hbUsIGjlswwgO1y5WT3cxv/Xf6Hxg2XQpVL8pH3ucZC6Y+fCFw4GAFwEwnBTMwcBXmmv
         4bp/gFBQVFd0imY0z+OKrtD1sHRypWZfyOQZ1wpvcBndUDI6EhncSIOF/BEq/ajlpXsn
         mbYA==
X-Forwarded-Encrypted: i=1; AHgh+RqYSAHqF2UYaPdp1ekN+dmTDhUXBzM9XARqAIv2WHBdD+uZo1baltGOipzb0+rwWTJF6ANXTV5EwQGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8PL5rHVaeChlM1uiSP79enbo0qyvOtTy9pgNExLrwQ/JR/9Z
	VGydIixSVfYpj8JVts3lgmj244DBMwLJ9pLV7+4se85bMhLHjACt1bqOQj3HmpNuXMa4Yvgl9Tf
	dWg7RC/82Hkvo3bSYv+OJ+Vuv01px+Qq+MgR3Wl1RB64h9WT4z5AHmiFB8tOj6fS06ks/ugC2
X-Gm-Gg: AR+sD13tzEyHJrNbBCIeYIpCZblUUUPnZJxDJ80ZpMJmlUQ6NKF75ct6rBQnrkoVas/
	K4uOBpFGKKV61IbYyRm4EBnjmYDueKbKB7ystOvhW9lC2gVhXkfDTOcE0mOgSFqfW9IxSzfxQou
	IkRdEbmgOyCmO1MdbheAcMVGJvp7cbPixSLWq5k/xXKmLodL9vU2CVrb/hDyqzuYmvSdHJytUfy
	LBZ152f8iux97339WSc/SEF1xu5mdA0WwO851dMg2XifArdL26YEvYQnCxFapAU+HZNlUGdFwEE
	S8CbrfQrPe34U5KITbkPjA6rTEZy3qvIrM6YA5k6tX5Y9k41ej6Aog6CAk8Xygapslu5nSIv9FM
	7nuJOPLObZf5gMxCDB3ld1HMkwUkL/8HtAxXMD58aV76kvojtqk9O87aoZkK0h0Ym/RqEX5VMLI
	fVTTtsCYVZ6n8zKQ==
X-Received: by 2002:a05:622a:a19:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-52d644f593cmr4953881cf.0.1786484691528;
        Tue, 11 Aug 2026 14:44:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a19:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-52d644f593cmr4953421cf.0.1786484691093;
        Tue, 11 Aug 2026 14:44:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1084e5b74sm768071fa.41.2026.08.11.14.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:44:48 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:44:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Message-ID: <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
X-Proofpoint-GUID: xrwMNwA1f8hNgrFpnAYoZad9cHwfc01X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX1xTVrzZTjSOe
 xNSdduFaY75MmDTRYOFBQTwXPHsZv1PJ1tjGE1RI3gkijk8YzRqYa6hwLfzw+6bzAvk73L9yuMF
 Z6yUjUAzHlZm48sQro47lMhadkotyOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXw1Taw+dGm0/k
 gU++lVyfbzA3XcKemScEQpeOGrH435xQHJIDyYmWZBECrAkFft74WhOm40605GmG/uzGRFd5fJN
 R7OXXwpFv69sCj+2cKr+k7l5K937LeG06jxc5v4AvcURGkmRYkV9DBcFxve/UXwqt2/po4vxgwW
 mKCur/a9Mc/nj6jocbsE9SS3/nXy7TRW2QzcDtoWEG9sQ2aEo6HuiFce/QH2xhyPoGXeUiJ40wg
 Ti9Hq01s9auJ6mTG+cbQEnUGwH8QvPJOQIR7Mn2btWBZ82fejKaLBmIelBaEBT6X8Qyw12tWg9p
 oaljG/HG89pKXUhEMhD8uBiS/eFem2xoC6nIPqUa6N+L05Gg3Cp4YwtoWjwGoYmQqbbFlPSb8wY
 WiRxlDfWpvjMRdSglDf9b+LfhoWV1ceB1eE9Fn1zM5y9VireZWvb8GndWrLp33b1GfUX4i83hxQ
 0kFFgaEvDsM3tEkCTkQ==
X-Proofpoint-ORIG-GUID: xrwMNwA1f8hNgrFpnAYoZad9cHwfc01X
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7b97d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=4nw3Ypk4z19PjJKWGPUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

On Tue, Aug 11, 2026 at 11:24:13PM +0800, Jie Luo wrote:
> 
> 
> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
> > 
> > On 8/11/2026 7:06 PM, Luo Jie wrote:
> >> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> >> TLMM pinctrl; without this the pins are left in their default state and
> >> the bus does not function on boards that enable it.
> > 
> > Should we move the TLMM definitions to the board DTS file rather than
> > keeping it in the SoC DTSI?
> 
> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
> these two TLMM pins support the MDIO interface—one for MDC and one for
> MDIO—with no alternative pin assignments available. Therefore, the
> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.

Is it expected that the drive strength is also common to all boards?

-- 
With best wishes
Dmitry
