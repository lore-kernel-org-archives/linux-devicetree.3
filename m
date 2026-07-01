Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD92517A5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913805; cv=none; b=OinQIT8iMLNnmxmxJ9jhxNqnomOXu/XZ0IyiehS9jSb3ylR3byit5X8GrAK3zVbYdEkwzDkn2lmgwaa5oHsj8DTVmLFyYR7K51b11n25aAhd5UhO/Hwd9YtJ8AIIKSv4gVwT0Pu00dIPFny+WSBncW4L2TNBHo1ST/bmfT9unE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913805; c=relaxed/simple;
	bh=acgn6OY70PK+qOnh+hja4mnXsBwLNuTNt6VOTalVy80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOjIl+zb8JjBQwqJErKu0CiollZVcjSaGcjTUOb1gKPXCuu+B51dMXQJ365RKLcidA3eLldWHtEZoFs3sOZmqGtChVpZ6fp1xxcM5Wu3aX0wRtBu5XJTC9lAR0hp8ZUHe0K2wlNcp+O+UmyJs5W3+cBObMmfqLWLbzIzJ7k7ZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maUGJmTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXtE8+Z+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maUGJmTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXtE8+Z+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGECc793722
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvOIcF50K+uIfBJyPv/IJnwM
	Hx6DqiGFCP+s763et0s=; b=maUGJmTPZpvMmksY7ngZPTuq8RVPf6nZ/zNeiZUk
	z2k5EhjfGaGOp3Ouz7kJx25B5wHJ5eZ+MZ+cB5fdpBuWBWNPySKBm/Pqx/ock9Xs
	SEQbZsgdmKFrCCDILIRiy6tOe6RQqZjsIDbIYWW6zWaz9T0V1NZk4hRfVa+rTpUQ
	9TzyFGdJ4Ql6mIxmIRL7OLnGZlsmsZAxohpOhihUe7jZ/k2I6KTdTe4C37mHJnwP
	X2IlIll/7ryIAMVYfklDNo04aevopsjmpbpu5OKCk7mVDfpdUKPzzu73NzE27tIX
	vRPlauj/Pv3UWWFdgCOs1fB4VNVF2C0BZkKf87MfNpT6ig==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510agvs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:50:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737bcdb48d2so214301137.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782913801; x=1783518601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=SXtE8+Z+Xsm1ADSGy5IfD3Wv6Y/RAOEn+nb24QUfjv0063NpLEyr4mCof+Osvxaiqf
         s5a5S0/YP8k+cEFYIErsabHwyhhF8sLkJQ2NHkkO2b55Twk1LAzwf74m5K+KdMj8z0VW
         fH8+DnGfgop2ksLLoz6Kk+Z22GuX9cI5nYo0gR1VXjYrtfcWda3eGbamIbKZ2WDDfg75
         4jI37kIugw2Nxo8LJoIh9VLrNYxg5CsPQyYbxID/zUn2jM7aQ8eg7y8JDV83MsSkorQC
         1EXuCUCjYf8P4ohJLw6HWCT5fhioiCHACw78YNAFLBkmv3nXnLintETvBz+KDKmdgZPi
         O6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913801; x=1783518601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvOIcF50K+uIfBJyPv/IJnwMHx6DqiGFCP+s763et0s=;
        b=Wu1stLTm6SrVXt1692eXyWdI1CTKxEDceJjUCiW//ALPxK3De6u33UmDl/qRDc1fuq
         6DnKWE/V+TblL/OsYKFi+tJ2OesmuePkYE6zY0ZzP0jh390/asFdo2v3iZSqPcFFeySH
         GsOdKIwhpo9dWz+E1fmPLQLdAd9K9Umtl0s895wSSGp9KCi2tDkyfKYA8d5Z2FR0NAev
         eNUc1Ddf8KrZpH0K6/D8DLd621WHy81IusMfT2sJbuXMOqGMjNWTV5xjBlUP26lR1XIR
         I13kjIW8AAx60DBgkMV1Fotcn97JjCi1yvBR6WATqKd0cw4KqJlhEdOpljnWuTzjrBHP
         +4TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxtYL/KrmRCNu8cM6gfy2qN5ZU7Auk7cShs5TrRUu57eX3L4jFoI6bLJkUwG/uzUdDqq1xSQJpz7jv@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvralpmKKpMR1pVuXcxqYhZVPhGtNEYMlEDnD81n1Wvc+iPW8
	TCuPX6UUbMr9QDKBQUn+AR7eXF+2R/Y5PWcDRD/4+KeJT5GvJwVp9TupqmCECIj/daDd1dTS4wB
	ldZu/DxJkDbFRccZqozzZBSvwtUFQ/KT8jYg1cYKS1QbfyK6X4mDZsw84R7mBeaN7
X-Gm-Gg: AfdE7cmv47f7XS06Cj9JXDWJx3YgxZRSmHaSFCouF5NVG6WFyqM2rp7SOT7wTe06tvr
	xe1Jhv83647d2ZgBW60Y7EXsCDfxYvN9eouhDIAa885pgSBT2Btpy/aAqM6I7IOFxbzrHgNvAaL
	hIqy1fGzNQTdYBO02CJi9yrM6cvPJ5v9Hw77o+SNbx6z3lPWsdEqMJHEQS6UA5NJnGV4GCyMXC+
	aT8zAiDmX5cgaeSwcWFI4sME3GtBuzBN9yMVjXWK+fMFUwHewa3zJQ3vvXMcB9oCClfzB8P0k1g
	Z2LpTK3MOP/cIEALUdkw6u28eJzJZhk0IbHvMuVG0vasnkAJSRiJa6IeTPahOs3yXQo4uBFp4nA
	9HRMV20PeGhkYqdjlqLG1rHkvgQb8S5l4zmgbNhxBLQaOD0YitnVB5ruRpYIsQ7OlXU5CVbU3R+
	bkdE/PKavAqF6sB/zwrBHTjLLu
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586070137.22.1782913801359;
        Wed, 01 Jul 2026 06:50:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f87:b0:738:ff1b:942 with SMTP id ada2fe7eead31-73daa9bb6c7mr586044137.22.1782913800877;
        Wed, 01 Jul 2026 06:50:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe49855fsm1248078e87.44.2026.07.01.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:49:59 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
X-Proofpoint-GUID: Qk5xeDeWkWIQMjlBM2XMMQgfaJHpuxf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX1GPgm2qlWSIn
 S5Nb4n8JAdO2Upv4vH+uh7+Zh2vCjXSZ5VSMXFwR9ud1un31Fxb0Fa6Ha8NoFosa/Mrrq9B93YQ
 bMAiQ9jDrW9Q2RQIFuOSHcygWNa7YIjhwZnmylz+vnd2V1SFckQLjKQcFxPxB5+YQqMAZfkfEXk
 mzIv4+EtmgBtTArpPa8pXy6oPEuWVNiPrfTJgVKKlle0YXXuK3iGc2RBJKw41WLl1lLW5IgAvMJ
 uwJwBduk2iD9tu3LAarOPlZ2i9ONs64BEYCIXMMSm5gPjei+yxQfxQJpw+a2bqPtGOV7yDH5brV
 tW8lcmiQ3/wO1QWqc+AtATr8pjR+z0n8h8s82nxSuDmy2CrleZWonxUR2xzO1VjFyX7Y/PCwZec
 VdgahTBpdquiqOXUdT64FCi90m2CuFuz4vR+6zXEE8GzeIS2vroj3ZMc/VX2r/D0QiAH19QfFny
 eO9zyIFwHR63IcTw27A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX46eOY2fqfiOP
 SCW0EADZbvDsZ5MZgsyAdHIrjAgUxyueo5E++IRNbjrDcq0WNGvJZwGk9X+ZRw68Xp03OMTQoat
 EiVw/S6aET6dbSnOqhmoL28HzAJDGHo=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a451b0a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DNt0h2T3mK1VvZeRrVoA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: Qk5xeDeWkWIQMjlBM2XMMQgfaJHpuxf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010145

On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
> 
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > 
> > Introduces AR50LT  buffer size calculation for both encoder and
> > decoder. Reuse the buffer size calculation which are common, while
> > adding the AR50LT specific ones separately.
> > 
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
> >   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
> >   2 files changed, 438 insertions(+)
> > 
> > @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
> >   	return _lb_size + vpss_lb_size + 4096;
> >   }
> > +static inline
> > +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> > +				bool is_opb, u32 num_vpp_pipes)
> > +{
> > +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
> 
> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
> other.

I think, Sashiko pointout a different issue here. Should I be calling
size_vpss_lb() to take is_opb into account?

> 
> > +}
> > +
> >   static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
> >   				 bool is_opb, u32 num_vpp_pipes)
> >   {

-- 
With best wishes
Dmitry
