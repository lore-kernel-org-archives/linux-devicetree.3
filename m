Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129B41D4C1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431186; cv=none; b=Jfu1jXaKIVx0iWLhCPDxqdCisJyx2haF0Va1E2rb087GkgpSbXM6t/OzVUPYfZryiKjMMl592TzBv3u4jDBTDJA1ftr/knjAfG9Al64acHfnA2sfj9jFa6UjuUVthtE5sDqbj6mJFhIx7/3/bQjMFlQwt9jRCkjZ6aRSx1u1CaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431186; c=relaxed/simple;
	bh=QW66NHVTI6Oj4WQFVixJ8XidASn4HkchNXi+aEftbi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSpHnbCygfvbUJfVH0u2uX6erVSuI14FBS2zS3mWEPwkeBtZOHYpkt06+oVGiAkgKLWUSK8rkunCTbzpX7CfRv3otR1+bvRK+nmx/GTzw/5/pR5YSVnlGzNARiVYZO6s9r254Cim6qBP2YGEUkDBrUNvDEka02OutCBDJNzRqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klrc312T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT3Pok1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klrc312T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT3Pok1R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8fSk3606096
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=; b=klrc312TR6JIkbNg
	Kvp30MhZqDGDUr6Cok7o00LHV3rlEZC9UCRzbvKZrZydQftcN7J0BsOrtuH57MJ8
	HahYCLaEYo3j7595ExWHyVzujZs0fQ+TkEhESevi0vJcAe6mcYy/WcwuyWKrVCSa
	0uSYlbu2RBb0a6Y0B6athDDTcjuir1E2J5Trehoq+CcvAXOBdCMZ/RuPievSJ4Vd
	V512xfl2j6L78TLo/zB9WEHo18yFvz+cZaU+l8YNmI1MfstyWlMOal3pQsXTspob
	Ox67rUaZywidb7qehmxNKj3aiBAuI+tp9546cHbUEQl/SMSw0YVesCTCIf9jJfVJ
	TV4Bmg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j727-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:33:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9674fead9e3so542322241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431183; x=1784035983; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=;
        b=ZT3Pok1R63GBz4eHdlAN8+7z6foeSWqfuDeWBJ4cWKrfJ4OdI6sOXtj7Hkujd+PAQi
         UoH5xxi1Sfqb/sbHuTh3nwgw970AIpfYDyaQczLjKe6mAONBb5v6scUJ2mEcaDprNCXi
         Fh4iY0pRvSxDJFpKrCfmeluecZekVDkZHNZRUyK+5SgIUEYIDxLdyvCeDQTVId0uB5rx
         flzZWFTa/kXDHaYpVl18SygEaXKgXV42gmWQeYcxhVpQ48K4BYGtMoodyZlCy4uI9FQ5
         q6gTjkZLDJfJmiSwtMk3ZYurW6lCZ/lvTrMFfCll6f/+gIGlW6Kqatseu/35DuMZVtDR
         2fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431183; x=1784035983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tFefM7BuRRk3FDn8aw0Ky5+cc0k1y191ixtbbp19Gbs=;
        b=cDLgWDNCOS3bIDho9h6KWHWsA5z1mVzuZMNJxRuygV5NZHGLTtIzbqK4F8UBaGAi/p
         8b3A+Gnx7NUGlwVmS7lWN/E80FQSzVA00KJdJqh3G1adWVMvFRHZy6hR4tG3TcX78DB6
         B951jx/Cdf7LsU5M64xYqndu4bxq3okTPt7T5mtlJXN2trQ8q0HeXWj9oRlDNP8KYAdL
         nSSOloj9FEmlijisziL22ithMINiHPWp320ZX5aINgQ4wAKX4zKeQhH3oN+7BMyLtL2y
         GbQ0HD3br5FyrZWW9tCAG9xNgW1TzxFX32/2Pw/AH0u1XeETcc0OmH4KH5STy+OQHBIz
         5uCg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7WdKIiPEZWCjo95wpOIV2YmLJNmCGW5/HmP/U/730zNAGwhKswJQh89EduOu2Ywn5q4rQI8BNvVvh@vger.kernel.org
X-Gm-Message-State: AOJu0YxafT7tjk2LlqEhKWhhuhB8TaT44DdcbstKnH77stHZSbOBbxhf
	ilnbo8fLlE7xBWJXjQRPvUIAJDGw8fqMh2PRrp+EbVsUzhZwYMD9TFRQLzKKCdt9HAP4hGY+I/1
	QoJdinjgKTSizR11Zt/ob7H0sU/Hzle84164Ud9Nttje41KVYbnSzISDZ/MEBQNFE
X-Gm-Gg: AfdE7cm0Spm6jpSB75pLznANL/sYzSx8M6ISamTHktCYmDmQNIj5Ukrwu3t9OLJWZPG
	10FoLU45rJi+LZMBVh1pBBqgjauUfRnYuDgCVi8juJJqzLo5zB2p5SGQf7X5RkGeS4PNwEkFHze
	FSAOkYf2517nx7xM2zMyRa6r1pXq2ew3wiOyOJEEksGsS121Q1MVckAQJSsDZpxUdpnY+T0XTsp
	P5MdglV13RQRi2jYd2ps2fR7c1R5kdsNGPGnUtH9YWMAAS3TfKEg8HjufjTxnUBuHtgpDaa+IEv
	X84pYC/e4tsZi6xIriDV511q5cpK8aeSjJdlLpkyIn3TkYSNdyw5fSyrrMzik/qWShv6C5Hk0gp
	xVEvsixulo4A/+/CLWNfJrZlQNBVTnfCEL3MSwTREfT6zsrp06mgkRRU5DPI7/rdXraSC37mDLY
	dj5X3nHie5psRqHYHj14y9fJ3s
X-Received: by 2002:a05:6102:41a7:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744b7dacf37mr2764675137.19.1783431182754;
        Tue, 07 Jul 2026 06:33:02 -0700 (PDT)
X-Received: by 2002:a05:6102:41a7:b0:73e:c6a0:328 with SMTP id ada2fe7eead31-744b7dacf37mr2764645137.19.1783431182172;
        Tue, 07 Jul 2026 06:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8b5bsm3805297e87.80.2026.07.07.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:33:00 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXxjEu3SNevVxP
 g4G+s+p1/1k1YTMcWQEM+eclMzARUlogXTiIZCiSoX7nLCpkHSRCyE8RSshlaQy5Mdu10MPhzeb
 wmAo+pJsVc2PWvc3zCIpbyEMKiS8+wCni10GfXeXvQX7oGQCcKwTiRE0ZV2Ss4dprE9lIDatRg4
 ZSPUz8fuJsRcGqPbhsq3n5KIHYk5CecGRD5iJyoPMtxGt1YcYZkFG93vANeyMzzSQoGIgXG0I5e
 kExrk5z5yhYuuGR6AovYDyFxi6KZ28U+hHzicX38yD5tkVsk8T2fhMNd+2INfch0KviBFYw3+7M
 TWyJrWjw00heAQFTAYlZT/+zed7f56DereDDKCalen2HpnafJvVP9fBur09FXgIVUqYX/Bjc5/B
 syBcEDQrZ5mWTng+YZ4a0sFcLZEsZigsQf+fKzCOJW/LzzPdFTq34JAtJNc7mKLjAu491sWGSmF
 U/S+RNTjFP8lXUBbfqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX6WHN9L05wdsv
 f4f+SEhcV/guExIgqCDF7NlthzbPzjfkjUTVPkcJrNJSFB5yyx8TjIE5gF2Pix4WeQqz1PnLXg8
 5J6xS2CCA2ob6XQXjtKNLC/GRcxvajs=
X-Proofpoint-GUID: Lpg8F2W5u3T15XKiWJYY3EetZMDL8or9
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d0010 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ahtVEZUH5jVL-0juYUwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Lpg8F2W5u3T15XKiWJYY3EetZMDL8or9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070132

On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> <snip>
> > > 
> > > +            interconnects = <&gem_noc MASTER_AMPSS_M0
> > > QCOM_ICC_TAG_ACTIVE_ONLY
> > > +                             &config_noc SLAVE_CAMERA_CFG
> > > QCOM_ICC_TAG_ACTIVE_ONLY>,
> > > +                            <&mmss_noc MASTER_CAMNOC_HF
> > > QCOM_ICC_TAG_ALWAYS
> > > +                             &mc_virt SLAVE_EBI_CH0
> > > QCOM_ICC_TAG_ALWAYS>,
> > > +                            <&mmss_noc MASTER_CAMNOC_SF
> > > QCOM_ICC_TAG_ALWAYS
> > > +                             &mc_virt SLAVE_EBI_CH0
> > > QCOM_ICC_TAG_ALWAYS>;
> > > +            interconnect-names = "cpu-cfg",
> > > +                                 "hf-mnoc",
> > > +                                 "sf-mnoc";
> > 
> > This is the topic, which may raise a disagreement, but I'll repeat my
> > position about the need to remove all "CAMSS bus" specific resources from
> > the device node, they are found and should be allocated on parent's side.
> 
> The interconnect has functionality to handle bw requests from different
> clients.
> 
> Yes the best will be to have camss interconnect, so jpeg and other hw's to
> vote
> 
> on that (actually it is possible in icc framework) but what is the benefit
> of moving
> 
> those to camss? Is it not better to create camss icc. I understand

Please fix your email client and stop inserting extra empty lines.

> 
> you want them to be on parent side. But how to vote on bw? Most of the time
> it

If the driver actually votes on those, I think, it should be fine. This
patchset seemed to add bandwidth voting, but then it dropped all the
votes in the last commit.

> 
> depends on the jpeg encoder configuration based on resolution format etc. to
> set properly average bw.
> 
> So i dont see how that can be done with not explicit dependency on jpeg with
> camss and some exported
> 
> API's which we discussed with Bryan they are preferable.

Interconnects should be fine to be referenced here. Especially, if JPEG
has its own port to those busses (hint, commit message).

As I wrote, I see a bigger issue with the clocks. You need to have some
API to vote on them (and then let camss driver aggregate those votes in
a platform-specific manner).

> 
> Maybe i do not understand properly the proposal but can you just add some
> pseudo code
> 
> how you see the things?
> 
> Regards,
> 
> ~Gjorgji
> 

-- 
With best wishes
Dmitry
