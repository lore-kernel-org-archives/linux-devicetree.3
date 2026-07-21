Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A2443ABD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626984; cv=none; b=NOp1O3a/t06V8BttdjSD7rY9UhdZtQ8ORHuUdiqs9LU2E0dl2M9LZcX0ejEQqCibvUX4baikM42x1jjLjRmXLnNk2hu/6S8GTm7lrTMNaYH0Heqjz0/9MIOABlO5dPBPCMIEzHr0P7vke1vyiQ9vCz8QQWLbXW22C/pHfhCso4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626984; c=relaxed/simple;
	bh=382s2GHsbvemZhVH0WPznSW6AFhA4JiuqW98dHEwEH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm2YH+2GtSeuucF+rbUTujQgkPsEUhEGZgp4GxEPMuTk1t3nQJtmWoIUYepyM2sXdJEx9fyfnp1/7sq8YBBT6MKA/Ly4tve2SF6ZKhUHOJvGquZphuLkK6KXra/UD61Olv8gJsZAoDf5etXJIbjsAz9igB9DgvaGVHnEYIf6O04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ge3RaMSv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLeRQE/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ge3RaMSv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLeRQE/l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8DtDC043319
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RB2W/6cFo1kyrM8hohHMIH1y
	Ve7PnX0DShuvEwbYNg4=; b=Ge3RaMSvTCjW/GSrDtUCeAP5TFYkvoh9NIKJRry3
	+mvsEwRRSmuMXUrc+ckGaHvYznTUQjSxteGj3KwqJrLBaIIUfJPaTPika5oyQpjy
	96sVMDKmpnfJDry0v3YQzTWQ3YDkkVtNpb2bgnJE6+Di8qJVS/xpxsvDIkddIgLK
	b1r+4a8c27aNlA8PxEcaW3DshlQKVKb9KYyZsh4nSroSZwAill9kz2Vp434hrXDB
	sdHddggerM6uJQCjrrTyHBdZtRMEDpkbF5imB5i7iCyqHT9ammdBSG/HBuG1mHN1
	abkNM2VEXaeuLQSo+5s8s2qUsavWcxNc2PMkzlz+5n++rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as1w6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so204518631cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626981; x=1785231781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=iLeRQE/lqyvssgQ5uH9NHfW/krCORcDqTfQ95ShykkWvHbIl1ES6Y75rLerl8hqafP
         ouBu7Ez9xJfdubwK5LQQ0fZ/tiWu20toU3zFi1rYmC19IexRvOt/iNLsTb843+MCF+EV
         NmYz+wMaI14V+8wtq+TRWC7loiurGyrhdnWbL9bQQzVpOPVQvSv2WEDwN/R0Qu9+DDLI
         r9rTvDFi5ZsC7ZUr6hi8QlSpzB42ykZm8QA7aYBzW53lIExqDSMNuWWTzvpBhjD6JQe+
         f5tJb2pVhRfW6JliRBMMbsCmOseB5o/QobHell5YCqK0FCDoguO9O0JdYPZqEwqJuX27
         k6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626981; x=1785231781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=fl6ILY8mPaL9cbV79Th5guawXwROaeiW/rZ3hrsebe73sUCWxYhplaGBOCFHE2oBEJ
         mV1R/ynRxLht/nkZtId5ajYBfheR55PTqAZLOySYnQi5iybDRbMPZ3u4eIQNSHv9il5J
         UU/I1JZJLsXZKxtXX1DSI65cUkWaWCqdNPdaz0BHK5ddM1Vyvy/s5ZoPRPA0kBl5QwqD
         McXl8psyflOPqjy/Pr9xATOU8LRd73Tml2nXvrYUNdKwrKUk57DDvQYC3OtcEtCwKHtH
         z32b+dswMRSP9MoIjHybN+CpUW106io3wAKHg5sbS9Y7bXxCBmG0QWezK8yB3Ksbvb7X
         m+0w==
X-Forwarded-Encrypted: i=1; AHgh+RrbrHrI5dFSKjdSjH2zCzFyjfrhSHojnPoj7IIImZkH+xhxzj9Gh/y5i4+uhssPad0UgT3Ff/ex4R5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zlKnv5Md3pXIXwHagc+vhE4+vjnJCXiF1vzkttDxU7ElYZtJ
	lvv9UaF9fTCNVjvHCiUrRmq1iu5j0NjUJKmd+8gOQMSGviIZjX5hnx2vtPYRlVNcizfrGODxxwd
	x2/8/vlCPLdKa96DimwmH1jk/HeNmWaJ0jW5rshmBxa9BEZT7WR3RPcx4H0Bhcd8i
X-Gm-Gg: AfdE7cnBOT9uv93Xtn1XYIBdXQs0AI/ScXLgWUjDfjiAnvryXeNPLzT8pmIWv7xAx5J
	Kyt8h9TqJOHdJa7JPc6FTz9bJS00v+IQedsJt+65s4SDH6FGbjnQFyXUom88AZUeAjLHkY4FJBi
	kDY1tg081UYdS7QqeG+/bPOaAWlq8Edp2TDP8Mx7Rkbbl11WGAXbYzRX7n7Yl1pc4coU5EkaG+/
	TueD7AkhYgalsE+iqAn/Sa2fDt1b/2obnYz0tTNnsPR9EVl99h/1y8HPVU3QtPqmfn8Dy+j9RN1
	PeBvJtRu150/J8KYvg1IrVKN4B63ixMJV5fr5O6lEckCoL7R8BLrCSX9pBXe8Wm/yPUmOp6yMzp
	j6QZrjKV2plSf0UU=
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168662171cf.76.1784626981095;
        Tue, 21 Jul 2026 02:43:01 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168661901cf.76.1784626980305;
        Tue, 21 Jul 2026 02:43:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6980582csm29681062f8f.13.2026.07.21.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:42:59 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:42:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Message-ID: <6tmbpelyk2ngvrfmcpb5owli7oo54u63i4w46jxbbj5g3fppv4@4amnegv2u3bs>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
 <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfXyzIUl1x7g4xo
 wJTC+7D9CBG8yB81GX+W/tukIQ8jmZbPuxGbsWxuhuNvf1ALANaSKye63+NEXpnCHjimaHzsQiE
 d+HGy4JHG+P56v1xIKXXo7ksACfi4Lnd0yvTWvVjUdqcM97FRA9JPj+FWJCeQVNqtnWkoX3aBbi
 R2X+4mjEI98uAJVYl9TORwrmHLSR5Dq73du8/Cgtp766xQ2zMDklen/XvASB5sVv8p50gaLd13q
 802BBShd5xJ0cgTWIHY3Cim9pdhgaoUhPjR25XdD+KRyb1I/axun0PRKLxH1Of48X+XK+m2fhL3
 BJkPsiYeBuXM9IzRvyFSOQAMo5FvLiT93Dj2U0qPclrLA5iMzCP5OiRCN8uztY01uomYJL8XIr8
 USeYi2bugVN5FQLHKg+DhKaP9Hndw0WabgvRIguExox8lmq38JNzgIAV4EFU3KEg1x4Z7Nm/+n+
 UXJNa+UwHNSA81TiquQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX/5ab4sHh9K4/
 424bIiDT5Zb9UpLf5Bu/rjLQ6uZcf951AQCIE6RHDqAjOGFBQi2YjJoarC/GzYtEbSQ6XB2O0fU
 GDaCVjm7rxckie8nbxpx7ybTWxoDOvA=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f3f26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8OKT1r-RFD2mjBG_JK0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: P9NpqYXapEKWrs2NEpZeOwq3OXR8gxTT
X-Proofpoint-ORIG-GUID: P9NpqYXapEKWrs2NEpZeOwq3OXR8gxTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210102

On 26-07-21 11:22:52, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - qcom,eliza-cdsp-pas
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> > +            - description: NSP power domain
> > +        power-domain-names:
> > +          items:
> > +            - const: cx
> > +            - const: mx
> > +            - const: nsp
> 
> No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
> get why it was and it is being added here.

I'm assuming you meant SM8550 here, right?

Why does Eliza belong to SM8750 but Milos doesn't?

Was Milos also a mistake?
