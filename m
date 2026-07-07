Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E83064B5
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430544; cv=none; b=PNimQB4nxPVgCuvkO5heE6Yg5kafnEXjRaC+nXMcq+RoYkBErg4L3ZuMwpATK90ZwXMP8Eh9+74azNRyZiFVtzgiqaGDppVcKa9ZBwL7ao960G5oopd7zmzKq7J4lwZdx7xDiyFH4pSuVoECd04y+tubU4NU45+3U2pzulcHZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430544; c=relaxed/simple;
	bh=JLUVtpAcR7Sw3pbtVQgfJbUd6mFFYioquXqjBsVIPE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHGe1f0WhL7daEffTj2fWwCS1aXI1Q7mnHajHw/uaqRGeO6NqI3wE1WPbjmYmsi4PpvUHXDfVens1WH7QAP3saVqh0H3WXzD9VAc5nUWV9FLMXCKxOFFnpZSJt5XekTMQNM2tuIFDWwLLDshjHferuiRNWjJ57BI/81p2SnD724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuIfxalh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHywep+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuIfxalh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHywep+1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8ZGe3783376
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=; b=WuIfxalh9GeqxVmK
	LeN87fp4gUh4Wd7ecw9aOrJf5lFttjyOj5QZ9Tt6KQbbkx15dpHWRB19m+2+EHsj
	+eNqrHUtxFlZdO5gD5hH1aJo8d+1hnE3+VwS4xyssoqHNcdyAGcXMDO7GH8FxJRT
	M/szL0fFkYSbmrslQ70RRhow4A4jiXx1zthcl62e5HB4w84R8H4FPTtzUtkl/Q46
	ZoKSGFJ2qiG6YewzVwULSaIylOAgw+MAkK/OmfSfMGXyRlYTEt9pEBD2Pb0euUP3
	6b+wEN86NLLRmMRuTCZaLX1DSfPlQKfaBxptBlA+6PgAqBUyZIOzTJslZ4tXESRT
	ZGgcRA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11scq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:22:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738ffe90415so960092137.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430541; x=1784035341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=RHywep+1AxCQ2M60OaaW0/Kzc5XkdZfFn5o+tHo4FjxAqhxxrnQkTE0h5QBvW27f2t
         Vdfcl4bUzBbcxArfwbGKawCAh5XDETzHygANODuIoAdhmsYaKAxROfpe8XF4CobWnJk5
         cH8pjC3cLB9q5SEuqbd7r1hVjgi54BL2VXuyv/OFV22YVDJEFVVdyblexzhVLH94Ib+f
         oCIoU2WLgBPGw6YgLeIZGfSv3L0yDUeULOZY/Jm1wXjUbEbAL6kS18ZrhL2J4b0M4Ks8
         UrcPfx3KPNgI1RyJPbtZLp9Zt5hvw2iK1X6RzNJbaCiVYr/ogHFCNTi90Rc2bJ5VkkzB
         MQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430541; x=1784035341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=GZ2KY2ks5rREAChmC5H+/1jrz4v/xKpv8a0qJRZhxHlO/Do7P3pt0Q9hE23GeHTBaV
         5P8hPUCGhBvPbh5fsgGlgX5jz6qXdv0woebVFRI3B7Sm0YosQ2Imcg5sr83lYjlMp//I
         qiBQe6HMrDgd7E9Rm43fKGHGuvAoR7IceeXFWglF/3gdnT4Ljk4/MJhsVBRaQI00sd3U
         qBR2vJqFNyB0nDXnREwp/1xIQ9qFwR2t7UAlBmepol+Vu1NauE8l1VcZAivpZZ3MpIOy
         FjlTkWDfYrNJavySuJxyIg4uoTobP+cpzaL3aFkF19ZLoT4fruyswCtH7YBjPAXcBBkt
         yBKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWpfOcfOz8UYoHqkF2AqyFadEmKPISDzBfN04GqVsOrKqM/iCps+EXq+ETuK/8mMHxZ5ApYEcv9vFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7m8PxswXgeEHe3WpSfn9JaNrNgnhHpoAOarrN4YG3E9fntZg
	n18beqkVgycntUM88fAx84j8UWuHicakwciO/r76ET+Snxb48CBR8upZOm1xvs+o/T9Ol9VtJEw
	zte+SoWAjpr2YrpqOfBOv0bOAKv6dvIWX3unLL/x4p7oAfTlZpxiRTLyB7vxudXjO
X-Gm-Gg: AfdE7cnsyEk0M+4wm1SLdB4KwXwtWq47Tn281vsOB5nXnuZzkZS6nA964gC8XeQAAXH
	om8fiBBE1TjFeiSxOjcVfs+yChRdl9UAfjypk+9dVRJLvwD0aeLAn+lEdCKr83manYqZicvlOsK
	9ZME/noWaJxX4jfPDqaX+C8RmVFu0PYU9oYh4Q9+gsWSLO8k8tEtq2xwbV5LNGvNBJSMpztVIwj
	HKmbdvE7Uqb7YqBuxXkEFseEAJxB4owOCy/39AYv0ZegftuFvZJyAQoXyzw2nWmfl4QkFQddryX
	ULd3fJx6pyPzAdZC9wTO2ac/mmyCD5UBTWCBQEWSnRlks/Yytp4KukMwFhZv8l4gSyWIhTQoG/f
	VguKkTiYUMADuRHxhHx5FQ/pwFCxm6sMioLgYUoNn655tfdowwOyhu337/eARAotPlaHZbGNEjH
	4UqY0YliMwoxGh7qpPKbURAvDs
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826794137.2.1783430541073;
        Tue, 07 Jul 2026 06:22:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826755137.2.1783430540395;
        Tue, 07 Jul 2026 06:22:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377075sm3648101e87.28.2026.07.07.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:22:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:22:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@nxsw.ie>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <w6imdnlo3xron3f2cw7fq5jtwcgvyijciddxjftwf46kltjjqx@inipxbghzngc>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cfd8e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=17shpdAnEHHmTgLBXfwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 2qqRKktYRHctp3NgNjvpKc159QiGWbnr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX6iRJHn6jB48F
 H43a/6C/hlXKffu9fBtrU0MIZq01HrseXH5N0qW78hz/qBWlFpj1gj0RdqMHyXKoZ+OkBClEFMR
 tRTVEgk0RfBHpVDhHjFTOrMkiHmF3fI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfXyoVASUNE8nmn
 pHFmU0j2PUfarkCXGVDph1XmRJJTFZA1bZYzfH8Gj3GTpFbjve5tga+JVePzh5fwQxQPEoN6g/c
 lov5O5s+XWq4ssSK2SONd+4lHdMs3G39UPxaZvnrouUgRDb3itYlnxfeAkUVowEn3LRVxqK6zgM
 YXQnfgKo5adwQzPANDdmWzqpLXblB34OqCDySYbO1Av14GdNsHIEU+EAVs8H3JFo1DJFX5a9y6/
 /k3LCj3yJ3zsiHWKAXeuPydUQn9cIPhiqfPh+mY560Pi1O4ihuXVw/cLFlLWHkiVWyYiadmo5I8
 TeNk5HkJHsQBoKoDWe9OCftCvlo5euoQyxD8mWPyzzWlmW+ekQf5yqtYBFxveiWSDGibE7rHowR
 xh+OlTVEhSKBccqh2tbnc/PyVepfgZTsS7uNRXLqMETP/lqwGBqn8wFs+3pQ6EQy1jJgEJlfrCp
 2mL9zZD5H877utdM7Uw==
X-Proofpoint-ORIG-GUID: 2qqRKktYRHctp3NgNjvpKc159QiGWbnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070130

On Tue, Jul 07, 2026 at 11:15:40AM +0000, Bryan O'Donoghue wrote:
> On 07/07/2026 12:13, Bryan O'Donoghue wrote:
> > camera-bus {
> >      compat=camss
> >      power-domains=<whatever is common>
> >      csid {
> >          compat=csid;
> >      }
> >      jpeg {
> >          compat=jpeg;
> >      }
> > }
> 
> * compat="camss-bus"

You can't change compat. There is no separate "camss bus". We have camss
block on, say, Hamoa. Or Glymur. Or CoolPlatform. This would mean
exactly qcom,x1e80100-camss, qcom,glymur-camss, etc.

Then, a part of that camss device we have all the IFE, PHY, JPEG and
other blocks. Each of them having a separate compat, etc.

But, there is no "camss-bus" (okay, there is a camnoc, but it is not
represented as such in DT).

-- 
With best wishes
Dmitry
