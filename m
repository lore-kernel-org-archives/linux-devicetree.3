Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125141;
	b=JqXpNCvddGnW8j88uSEvhroIfIRhuSUCeOjY5taswq2vUg05WiC3Gz+FlwQRrvrDlYup
	 r2BuLdhba8ACRNDqi2KPyk+j//YPZM07DyBT2dJXGp4aIgHBGIqRuD58waslFZlotlPhs
	 3EMmWRstDYrt0Aid2SS67JiEOgEktl+30DupOhkL2h+Xs2YWhaKbYrHFiMbvpYuWiYI2g
	 OnJQ5ES0aGWIezvFPlaszVM7Ylh4rT3VQAvPPMpQ7ry+EPqH939U8T2Pw4qAhkqpzJmqQ
	 GHAvWOcse09/dPuLQsIOFkm2d3o5C3EKvZNgZvIsFW/ug4UgG99PP7Vj4ygOJgZwe7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
	b=BY8HP5zoViCeyX4rZImkdoNnow1FFMdvjB5KtK+5o9Nk2FjgClE5WcFnjYaq810bCz4L
	 KP3+RCkoefK/TPuOClq4Ple1X7/5beN7ReehXZLPCOeh9UWVo+iZ/uKpkYXcmZ1miUIIk
	 6L4ig9/x/chgg9eIFjNOHRProBgBZTJHzYFyqaIKICWNwl9m2WPgn8B584A3qjUGcmSzp
	 hLarEbnXIuv9O26EM4aV/gfPp1M3V4Ud9RSZZfY2fgULQqBGQ6X9uBrYplzPB/afOApmA
	 kdIo2D2BZNiNzKJk5aMzwoEEok1wXJBuWXbqWR38wlvUEQhv8W9yoE2gIjpFpB9gs7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W96HaUKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aLl3YfD1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8781F606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8781F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W96HaUKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aLl3YfD1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIIBkt3486364
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XsKGOF3Zo4sw+rWuIBG727C6
	syOZ0rhbz1KXJVsitTc=; b=W96HaUKEm0F27a5C26UjNGDOmV3odkiMiDYrNfzf
	TXCTb7oJsqrFdnfdOhoy6Ljer7CUhOYItnrgEGdArYuXE+219qhaU9pRRZmMSbVl
	1kpKpOzMMAYGyvUJrELyvcu+Uj1A2a11cvvkrxHwMiGxuubu/t/SA+2ltWC3XePD
	DI4dV2jtSh5g2xZVPC/MZKl1Av03Cpyd4UjDmpgUu/vVoqw3Pa3ErFPkt3kZ3AQI
	8w2TeDB31bX3L8JMcZHdzhHp8jjgxN7Rzew9MRKukwuAD2iVOcVCNOEdZGW8aCc4
	GF/YfDS4nsSbV5waQGuKAameYQiBEqR0o3JRE6eDcpcZFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbtqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:18:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313b1501a0aso14019eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125138; x=1793729938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
        b=aLl3YfD1eEVQiizvJpatBtDue1K+bAY4nC45iKDjY6xgwHnP/FBYF0SwbH727VKuwZ
         6NlVIARdxDSqaFq3jLdTQ7dnJolUKb80asaRCyp7M1BotQBdF6oQr0z/QGbcUIIHi4eU
         YDVnkZlhKic2sGWIpkj9N9RCojPR9nYRuByORmbMQ57+z6PrTibMfWfhUPY/q78hOqjS
         cOFCG6kZHh6OCvluSo4Q6c9N6U/9Uk+JZWmCIAWQm5zuA6du0FdXE5FaxUljUVX37PHi
         EEJ0Szzti6S6zcnUkr/lqFxm2oIum1CtmZNlq7cWKLMALLBzkTU3fdrutKKns1a2u45V
         ncnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125138; x=1793729938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKGOF3Zo4sw+rWuIBG727C6syOZ0rhbz1KXJVsitTc=;
        b=c39hcRSTva9vGqGqfoEGufSwPeuyqxZmLOdEyYHd3OrWgkRMrcoOxQVoWRwyZeBFec
         gItWeIvQYZEmAZuYuQ75KIhqrZwKrd/moSZo6yxlStaQP5/rsovCCTGLZbxqIuLqiLYN
         QKLRfW3oed/HCL8s/3OFB9PruJcIT8fGIib8RJeYRc7x0rDQS8+E4O7CNpx+D9h2GsxG
         htELEW8gNfn9L+5YwDxBvpGnHkAD7emtzuV/EMYKAdiylWq21YjzHLgyveDgN8TZU1T9
         UveX342uwa/uuYfJXylsEF4LdyQCKxqD4hsu/+ozGWFE8Tk+LhtOpNVpUkqGPRoU44fB
         QSYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5VwmjLK3I7k6/4WBC6CN+ScSlnhyJFIWevpVHgqPn9ki5a2tAy/9rz3E+tzdccgC0ciTwI8D2DMIt@vger.kernel.org
X-Gm-Message-State: AFq9FYJchadBbpyp3qmLN9aAzF1JWGfuJ67A+yzeSUX1NFxp54+u33+H
	6Ztj+cfV4k7IwhO9Mh89LmYzsEfU0UcaErYLzSFcVJIXHV9yv5qPnOqawfw04Uif+9AGWbCVVTg
	Jy1m/KTZIcbAjL3laNuRI6BYXdBCbtC+F5ZZ7dJMX/89g8sU4g8uTnoYwHj5yX9yo
X-Gm-Gg: AYBFou07ajZFo+WQBYP7UHpAaDCP/6kNwANqpzqL7TlWQ3wJdnxIaRmZd6aaTY6dUek
	z5g7I8GE/GWakGWvF8eNfQQPWlF3N3NQ6n3LRXKdZQl1uaxGgnLURhAUbhTVmt5Q8lSDuYMV808
	E1kD5qCDkbWff/H927A5Rr+cxz+AR7yEq6CAmIsoIAPbPYVCxf7hSkBBrDEK31l1cKWOcJzW7RL
	WQ3TRyuBLKEwVazGBkQ5cTipbxB80swEQVFut3QJogi2jxmUkihRpuZfwZ1YvWMmgPhqzQ3pKKs
	oIeLtAJfspyHdgWt+CXCI3+RJoY/HEYeSLQ0a/AI9JkJZ0ULy7nIvi4JDAxl60slrCenfwdi9QY
	NQGmuh0IMV4OaWwcRuTOI5h+UyMkdXgnt7OJOF7gOibdriuxLYqgLHOr2PEJ1q+SI8e+18yfgsY
	GwOOdcvhY5L10w2QwOHtmYY8JmCqIdBmGxgrJJVOz++J4qv4IO4s3D
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a1ffffc09mr654511eec.2.1793125137808;
        Tue, 27 Oct 2026 11:18:57 -0700 (PDT)
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a1ffffc09mr654425eec.2.1793125137119;
        Tue, 27 Oct 2026 11:18:57 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm29475546eec.7.2026.10.27.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:18:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:48:49 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auDrCTMk3oCLa91X@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
 <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
 <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
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
In-Reply-To: <c58c89cd-94a5-4776-b186-44c4b1b3c3ab@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX+PNO9bCblvEf
 Pw5yRiB2ij3NyaB9zZzXbXJgv5P8soJCLPz8VgHOfpIODnth1Ozd+9r7TytjBVFuAouF/fb9Mor
 hmbdDQW6bjxXSDtRsb+5IdWWaYN6i1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX+poZDtj1bdEk
 ydYD7sk2tDREx+61FbYE2CQYKgf9JaFQdBUuvc+0NRBWLBtVmePz3S3rSM4XNewj/81ijRUA5bh
 YErEDJM74TdUp85v91sNqu7fRyjX3QBF924Ookc7UL1PrLSs+d+sEm8bFsuin+E9in1BkJU9fXw
 sobkWVBO1oAJTCWI8ub0bo9RiYbrY5DMh7DQbh6GxgGKRH94RdvJaQ2UBR2/iQvEOKi32pgQwbZ
 TZeu762qBjqS4yU/PKXexdH8s4W5aDls0LoY7ZBGMWaiXuWXOTGGzMcgwVJOKRKWyA4O9ImXlTh
 IadQfS/OXbFapk/ChYhLkHlitXvnBZlwXje7NX9MKs3/SP5Sjjqw4xqXTnWwy49UlbcbmStwgFP
 EHbQE1wTnMYEBAjtRDC5XHH5Kfe47XikYWOxf9o/bypWtGnzG26zrtPRxxskJ/Edpb1BQ+mYhTM
 6MCE2sj8UOxcmg6IiCg==
X-Proofpoint-ORIG-GUID: FwMWfFYGMu9Ny_cbPmhVYPrdR9a-iuf-
X-Proofpoint-GUID: FwMWfFYGMu9Ny_cbPmhVYPrdR9a-iuf-
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0eb13 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7rEk3nLCdkWhF05BNvEA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

On Tue, Oct 27, 2026 at 03:34:19PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 11:57, Vishnu Saini wrote:
> > On Tue, Oct 27, 2026 at 09:12:27AM +0100, Krzysztof Kozlowski wrote:
> >> On Sun, Oct 25, 2026 at 12:18:17PM +0530, Vishnu Saini wrote:
> >>> The DLC0697 panel is lit by a separate backlight device, which is
> >>> referenced from the panel node through the common 'backlight'
> >>> property.
> >>>
> >>> Declare 'backlight: true' so the property is explicitly allowed by the
> >>> schema.
> >>
> >> Why do you need to explicitly allow it? Since when?
> >>
> >> I see no benefit of this patch and commit msg does not explain me what
> >> that benefit would be.
> > It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
> 
> How is it required? You did not really answer, so again:
> 
> Why do you need to explicitly allow it?
> 
> Answer starts "because ... " and you provide technical arguments, not
> wishes.
Because the DLC panel node references an external gpio-backlight device through the
backlight property, but the current DLC binding does not allow this property.
As a result, adding the backlight phandle to the panel node causes a dtbs_check validation error.

Adding backlight: true to the binding allows the common panel backlight property used by this DT. 
I will improve the commit message.

> 
> Best regards,
> Krzysztof
