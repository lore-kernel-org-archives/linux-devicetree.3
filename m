Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910D2750ED
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976218; cv=none; b=ppMaYJFh5/8oHXCg9p1P+PU0Ff5yCdqK0nlCN7Z4dk6ygEen/8Zrz1167lgahNBqq7z4hIoTyy27Mk6RU9sKOSFtq/y/HC6ForPrjw2skmRHJE/6BWT2eiDGswNjQwSI46gWiJxwVpJr9cpkiAGhNKT3K+P9b/5AJhtajHEGPRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976218; c=relaxed/simple;
	bh=vd/rQRJQWLIg+xDuYcY88Qbbo0c1bTx1+oaoNovwGyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAPr7Izw93gmxYBOt+LuKwWBmNJdPOH+m4obPbz46lA13aGvXYdaCMgXjT6gLIJ7M1rnnw6SO7TDgsIfUsTGPGevZ0pQUDtuQ1xK0ChGv6EAtDIU3gYH8xxEQ0IagXnIWSLwUcrUY3BDzfaVfO5DvR3Q3qdcjlcHK40tA28pdv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgX2AMwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdvJp/K5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgX2AMwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdvJp/K5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vq9b124489
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V1s8jKskQG0bDSH4tCE3i2dJ
	j/wDsiGH0s/CmPfjVgE=; b=NgX2AMwDdKD5hgnZ/aYfhZ8QKTSbIG1dhVGw28oC
	JE9VZ9pHC7Q9lp0qBxKGwnbXDagxOHrxzUaHpAS7hXdptOXPGCF4f8m6NQPyW6Z2
	KMjfUFxVH1jCEkCXkKVUaj4KEssFUt1vVfIiUJl2DNaN8YEQT7sFqEuD088Kv8Ft
	uJDIsZXU/ho+KkQKf2lx8e3lO5DUexyPcYZWGsH72h/Aa2tACM2fu8thXVZQYecv
	WE1IY48F8aA9vkYcxFlfa3PFRdXFvyjyO8YLJMueXqkInfP/Xbd6Hgptmp00SJUY
	zda8ERh+f/Z5TjiAA+dduUqaTkg5oqXjdYALwFWwdC1s+Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ycay0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:50:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63309595daeso18198019137.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976215; x=1780581015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1s8jKskQG0bDSH4tCE3i2dJj/wDsiGH0s/CmPfjVgE=;
        b=fdvJp/K5Q9X3GiJZCj+oDun76mibiFVvphFV8V7wH/f8dvY4BlIxrzIwgRC31A/Omu
         nhVRXT6LZMoz24Bqt3kzkOoUOdIH2oy44dw3bYxFmvOOmPRJM2LiR1gZPw9oezawVzA/
         g1B0Ovo+yyhP0hMTpa+TCHoUR6+Co18tlwHmtncIFgLtLq0SOOsp0lb20fYMD9PiqW4/
         +iJz7dAUEJ7tbusRiRZaLm1p6cWl715j+c/Gu1gubVLhwih2fVKH8QVkK0HZbANvsOH3
         mfoYH608D8boPTdhksT1p941dyivWSHI+StYMHqTxZm8f0wMdfYYjGQgeMnXnN9YUA5I
         w+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976215; x=1780581015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1s8jKskQG0bDSH4tCE3i2dJj/wDsiGH0s/CmPfjVgE=;
        b=oM7dblMtIhr0FuwvBmelNpwmiaP/RdvAmyWt78XzWthrqrZXWI3AlqqNbY1CtG/68t
         G1dXAdH3U6fhocxsHJgiGQEjKVB7KkK6APxRtKgq1N0y3nRHUx3s0f6QGuzAu779x+qO
         +Q1x+XjPHz7pE7QXVO0k0nv/TdwDkyRN2v93+Dw5cTJj3d+9AfA1vWtrxfZvAn77AIaW
         ZaRuDldEnNQoiXYflPhKEaYwFWrYjVPoLNiwkN0WBY5f9aC5390ARZ2SblgBhxLEKGyY
         UqRYR1l8hbAVvICaa2AQtmpJoVcbVSymL4hYhr8xqN06o92CJr5fyLNpjqy01p2FJJz+
         kYVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eyNe1n+CozotKOgfn4RVcGwDp+3lVrW9OwPDpzNrUGxCWgGrjeswPYm86Kf+ty/3T8cpa2LRewJX8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RAxoFt/ULG5iva4/bhTmSFNpJomThp56fwNRBevTIKF30SSx
	O3dorHhIDvTsuOCK7u8ZTRF1/d+XIZkKh9Buh9pTLAkD6zxigbXwAMY5+d073q0wL1wRkPXobE0
	CxnZO0axccZwOWF0/z7V3PCjJdAdbK4acIYSYz+b5KJRe+nP/XMMXob0pETSvbt4c
X-Gm-Gg: Acq92OH22CFR7zmRFjZTLRsk0ytfUPomXH16CcSj8VW4ERMOMzmImO++XhaDgeWbUJc
	te4u05DdjD99znqyv5ouayfqff7WnISk3/6JtkywLdFcq6BbxAB4r5AdIn8fBt22T1CYca9LvsA
	qJVmk34e5gcTu8QzWLcAHVRsH2xlyikmvEkylkY8SRrst8AcU6sX5GjZTrRq8m1SEuYTAqy+OUF
	O6JR6Iru1XbaBlTO/p34lkWDdOA1uBcg/YoqJepiQG+tAdiq1EEFP3UqZek6lbkbup0m2idglwq
	ceX19Z1JdsAqLb5Pmg+Fz8Q4eiS/8U6NFVI0D3i4vMvOymZY02la1ffuLM4eIUrmu6wBx9AAsXP
	ASbGhnYPD622UbhRlmVIwWwc7WAqSWDh2hiCp0D9A1R694JnDyrgI3d5f5jAze9E9qiFfHVOQOa
	HNBgR6zTMpllSJ+rcvg3ILWDudUNm/3EP7FXQH/6mF4KiQGg==
X-Received: by 2002:a05:6102:5ccb:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-67c7f273532mr15881160137.7.1779976214951;
        Thu, 28 May 2026 06:50:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-67c7f273532mr15881139137.7.1779976214562;
        Thu, 28 May 2026 06:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc45b19sm39183511fa.40.2026.05.28.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:50:12 -0700 (PDT)
Date: Thu, 28 May 2026 16:50:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
Message-ID: <lj7geczhthury476ilkjym2k5fblo5pqroefsbdfgh5jcf7zy2@qrss5xc7umn3>
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com>
 <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark>
 <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark>
 <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
 <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=VOntWdPX c=1 sm=1 tr=0 ts=6a184817 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7wDE0xjjevibnHHXysgA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: vvx_OnASo4Q2ZGNpMbzthgoLbsoSAZkT
X-Proofpoint-ORIG-GUID: vvx_OnASo4Q2ZGNpMbzthgoLbsoSAZkT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX8vpYsjZbZK4Z
 kI/tqs+O2ZR0oCL29pqL8xnQ0w1hzndIYXSjClcVsqkcZL6vJCXWG3irByWQc6MuOreeiQbHsAz
 yedk297BAHesvBTH9hGq96meg1n3BOesubF7hBp6SUZU5VtNs+MJTWH6b2W/aoLoAOA5nAj0AvT
 P0u6Wfy0+AZ5Cog/R8IfGBXHUUAo6zY56TVFM1zLej/DPJdxJloYJCuYLe1VF9a6TWv7GzTNgj4
 TDSr/oyd9HH4lvKWSsZaa4DBA0q9kVtxXfMaavBEg25RtSUUEsoD4LVodDBnC57qDxUx8Wfl0g4
 GJ2I+7BQHOSFZfvcnCvmvvbbsK9YbcAnc1KwwuOYrZ+zY4ngCWwqIrYYYwY4K48O0t79lfLw9H9
 J/9JxpR2Bk8+wZQRa1cpw5Fo2KTDGGsipkYdorkNUYXYkqaLJEKNiKDShGttVoXu60VS4wIAzuQ
 khqS+5Xv3svoSeZaq6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138

On Thu, May 28, 2026 at 09:13:23AM -0400, Bartosz Golaszewski wrote:
> On Thu, 28 May 2026 13:54:51 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
> >>> +Bartosz, Gaurav, Neeraj
> 
> I know about the self-tests etc., I will address them next.

My 2c, the self-tests would be more important, as they are fixes. Doing
the crypto in a wrong way is a bad idea...

-- 
With best wishes
Dmitry
