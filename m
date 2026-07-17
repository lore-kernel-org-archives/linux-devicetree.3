Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF72045AD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784251237; cv=none; b=c7lkRXEZpaO2gfvEUHt+5Ihs5BXN3CRxatRElL/0MUWsKkNWlXn0kjGLbVhDmrblq3BCBrxjxIpAwQGuUnJxL3vaiMBKHmcJP1mJeJFY31F0qIcE1P5Cv61vCw/HsEMvPAyH84xAk2dmEwt0zbMWxy5yfPFPFmb4H7WDyLC0Iz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784251237; c=relaxed/simple;
	bh=5NsXPGUb/KuXAEjnuHIpy4827pn3xwkzIN447h8hljU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDvswjAaBigq4dGBr4r/R4Ydo4cgmxGFB89DW1xtKxK2Fl//0zDzKbyga+AuXMRfjwHkGzaGyx1Ba3TF2RXT+DoiY7ukTAv1ho97sIR+gBlYUc9BVKAqMfO2DDj829OIJdXtp5tl2meT+d+dirsDAOBlVZ0JVkeB7vxWDfkleM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcrR0Dlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk2NFfEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcrR0Dlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk2NFfEd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIlOU3897151
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kra+P+CAUuXywk27UaplER0R
	y530LjDrBoa5YojfCqE=; b=AcrR0DlkTJV2Cx1v7CnQMoN/cAy7h2mGUa8BTQyG
	0O5NxfqTfMEiLw9lllfa1uz9zr6lVd1vOop5QJYH6q9fIbTobAsBaSZNbIuOw0KD
	c8/lgNNHacDtEn/jJF6+8urRbppHJjkjs/xnYnGIxj4S5IhqlrNIZCvxYPeRSabQ
	mufmCBOnf9rnOuTCIFAkPVEFz1YA9qYNpYBRR+JaM7uE8hYMhsnN8ScdcGIQt9TE
	87fPSjIH/MMu6GcVCyC+RCtIpGTUWgT+5480aULzb5dvezX6IlKUlqpOvNAMgQus
	KT6zohqo60Fgh80XZkRdKpzwJa2GuqH17nPBlNXZ6X9sbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9j45y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:20:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so487603a91.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784251235; x=1784856035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kra+P+CAUuXywk27UaplER0Ry530LjDrBoa5YojfCqE=;
        b=Hk2NFfEdTh1pVfG5jr9gw0hj5SvWIGy30PHY9YfUWbJ25C+48tPB51Sx5HASvLYAx8
         zx8YfShsWRE4ad9LFesX65Dwl3I8w/zfK5vn9cyUGzM5rYq0qe643og9e6jGuAG6wjWW
         14uVZRJK1ceeYP6MQqug9uBtPgdvUNeIyo4+roGdVRYBCKcciM+RQCBq2U7/+SBTq887
         nxKQNXXrScakA5qMhJiMumT5Ww+RNy7mE7jJ7IqflAS3sUeMW8N5yriYITw5EVNeGTZg
         nDbkBHbyw4Kw7rgQUpZ12v7rpccragyQm1mFIWsaJbpBXJnd09OwVctHE7QqkCy45MD7
         7ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784251235; x=1784856035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kra+P+CAUuXywk27UaplER0Ry530LjDrBoa5YojfCqE=;
        b=mqP2LjxB4LGqtTSbMA2jUJzb4vH9kTOsDoSscY7Fosss4FLfePSl3kem8hQCKoNxSD
         IPDrNbpIjDCfzrsCtfldfLdSHiagU995FdRxaP+A+rRQlTFvor7ZuMZJZW4IKyKFrEFo
         yvIyjlEySL+iHoQv05ux4fVcMZAXfD+DFL40y58pwfO3RpsB/nQ9nz1rxI7GQO5RC1XD
         oGEkAKS5IURv37oFIykVys/VMBg9QEBx/k5CKPIIqqRamyOQ3+A5FIhYMacaHwmH/9LI
         /egwcK4h+Er1ID2Ex48usaBGd3gW/QdNWTD61TVbXQEmFa2sZT1wYHj3CbFlTzaQSNJ/
         Vi/w==
X-Forwarded-Encrypted: i=1; AHgh+RohZYYgCc9thQQWsF7XNrnUksFhZ/iszL9Uep7FkuABb4F3ertWCaP+bL76w/zy3dwDPBav3THCaLID@vger.kernel.org
X-Gm-Message-State: AOJu0YybRukfj7tXKMZ8ZdTMp+j8n2vCzfvBMKOTV9bFqVVjk0MzobhP
	pd8r/FLD20Ix2d5PVR4LvuW4tWwLFgYA2QFpJ16ejY2g+Y+bCdJKPEB3f51b0wdSqns49P4SEvy
	6xiSnEOVHtap8aBmCs8Gu4e7sKBp/AxhruGn3VmOCDM2QZwLyIS0+udr3DsRsHZ9v
X-Gm-Gg: AfdE7ckYtU7MdloJnzrSUMeQtPrWcvBeN75uWNWugj26M9cCoRIfygR/8iLIc1OITYs
	8slZAlDKSrzZNjV8RZ5teW/ilTxIt/SMV1qLDwAdU+MRq5M3jCNdP2Uz+xM/4vgfpuxmqGCB9hN
	wA1vI35nQGh+QL+WB28amQ82svFI3BmwIPn/mBH2qqnnaZL1q86nWMrH1bMK6rXZO/FDmvrN1iH
	pskvZGE8ByrzwWBtqoUnZW2UN7J8WpcoWkN4E1hm8pQLHkMUov5M2wVqhmhUQ1ero4X4UgvHeAI
	bGkiT9grrUfBCNa+Y2Dym5WJhD9O+/JimI8grVOUg4u15M0mbGi+7GoUkq6/z9ifXTqN6VXIm8Y
	TgXjTeLYCt+V+vJkRFvv+gpM7ZnOtawqnn8GkkSdE/rFRbWuVhg==
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr339825a91.33.1784251235082;
        Thu, 16 Jul 2026 18:20:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr339776a91.33.1784251234452;
        Thu, 16 Jul 2026 18:20:34 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm853004eec.7.2026.07.16.18.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:20:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:20:32 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
References: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
 <allvBYQN_0QkI835@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <allvBYQN_0QkI835@vbox>
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a598363 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gzHRHKxzVZXRfne5p3sA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxMCBTYWx0ZWRfX7oF/tVg1PP+k
 opIH7gRUn6bdvGReWSzT4NUEh7mBStPB3EVZRYjAX7lUzFV+5mpMdamPxyVxY92Zt5atl0uqlff
 Lro6tCYdNICJxaduQKsuJQYlvwEOMaEzE6LGPimPgUryXnhP3BH9G5KLRHAKhxAohDxhIMB0QNk
 T4j//FbLBAO1trj+NYERb9XSMvrbmismrrd6my9mKZhEi3hrK3nX4UOE9KelmI9NSYp0BQDCZVg
 /LWAPgFJy5gqbKvvLNig/Inh33Ia7S0xqVatK+Vvm6JxlcwpMKS4kArAswsNjqPg38+0VOZc8U4
 evmTmof029za/KBIRUCXzev+rjJhCKqQopsktCEw2E11lgbRgdeoi1DIop5Q5fXEpd0RBzoTPrv
 9e/kPi6nEDpq2xkxeAtfu8rlna3i1dElWrMqGGWfi9vBqu3aYzYw2prMFdTLbzc3SWI+jqSlTQ2
 VQbbUeKt5htJ5V1nonQ==
X-Proofpoint-GUID: ULhQRqmiR2_4La3MGFpWf0UVCmJlmWBR
X-Proofpoint-ORIG-GUID: ULhQRqmiR2_4La3MGFpWf0UVCmJlmWBR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxMCBTYWx0ZWRfXwDMQAgzouAS6
 Kn7aJpLP5k/s0ehdtvtjorVb3P3vtfWFfbc+nrTu+q8M/dfK0m0vDSttmI5kjngk1uRRlNDubk2
 k1omS5xhzhkKwJRP3/TlBRV1zQ4YJiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170010

On 26-07-17 00:06:37, Thinh Nguyen wrote:
> > 
> > I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
> > core uses it only for special cases and the code was added for
> > ten years ago. For the default situation, we may not need to
> > change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
> > correct?
> > 
> 
> The GUSB2PHYCFG.eUSB2OPMODE is only relevant for host mode and mainly
> for electrical compliance. Usually by default, the CoreConsultant
> setting should have this set correctly. So not explicitly setting it
> should be functionally fine (IIRC).
> 
> That said, this is separate from the GUSB2PHYCFG.PHYIF, which the core
> uses dwc->hsphy_mode to indicate whether the UTMI interface is 8-bit or
> 16-bit.
> 

Why only rockchip uses this "phy_type" property, why other SoC vendors
no this requirement for UTMI width setting? 

-- 

Thanks,
Peter Chen
