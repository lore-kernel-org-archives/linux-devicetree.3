Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA73E63AA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094395; cv=none; b=S4UTc5MUH10j/6zuxLNYpJ7t/32j2SbiK3e7O54n5xmIrbYBJ4HQIPCfzKPzzjUTSBW1dZvY2pKPWAppzJaIoLaw5pH8QJi8kiwKnFryXXUulRT23LydtGyazx0ZD7+nJgOA4KHKQcrl2LNhFvyOC5+qu6XJ1tedrI9nNNyqrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094395; c=relaxed/simple;
	bh=VLymoo1NLN/4qay65ynTlcAnjVCFuFa9yAlX4jrrcdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPiO0VF+UbiI4Qxme7xJNYdTh5Jv/KFv7avQtezxGJIEwqQloggmtshW83hsShjPntdMKuygVhY9OYPVmD67drD35N8G6uzos6ZDdVj9kdnv72jctzJndCbOWXfzaWSePiBUTuXc+fhbUW7dJPsvDfqlQ0g/Hj+yJ7S9sBCdC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8B58HHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJvZ6cOu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8B58HHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJvZ6cOu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67782Krk3251955
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMGMIjVL9ndWb9OpAvANId9/
	R0HdmcQK/ontefgBJUw=; b=G8B58HHDuHSId2WqxCoJ4Nc3RQ6/5m/G8qk2U40S
	WyPn2AmVppDsRaclS4Gtf9ZMUOTWV7k3u5rYWMk4mYZBTVPLaL1HizgzoqCtNXn3
	459Wm8vk5DSF04f3UWY0h/PvTgnUhqipKDjYfcacRaQ1eMhkPCCLuZOQrxLr4j2r
	KRVFBmUr8c/V6qV5WSlmjkcKo7NZD4vsP0BKg1fkBjcKXLj3vLd3jlqFfyrzjmHv
	hHaVEO6EPMN/N0sawIQyVSelo5HNDjcpTrVArTtH4YGXcPEpJhaiI7u+tUMnZUs6
	w3jerkcprDHr8EKR2b1rjCGvUZVyq7VRuV4sT+J6MEBQMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k38s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:19:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907ca5abf1bso24923946d6.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786094392; x=1786699192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMGMIjVL9ndWb9OpAvANId9/R0HdmcQK/ontefgBJUw=;
        b=jJvZ6cOuOE/E5f3WxSIvqmeAq21GRRjm3SEUywlBsyy+m5J5EqNL6x+XP6/E+IAcan
         PU77sLR9xhStWvXZCNFLw6t/PB4w6uXKY42oVat9gj/PvlnKJHzgiNTtnbzt2XDPC9JR
         oXkr5JvwaxD0jRfrl/g8c1OcQX57dW6F6AdoAv4WZ4ShkzwXh0n2QKDITLemn/l6prqr
         KTyvHCPUzfeR9WwKERy8er9Z6jQsq+186qohaAnzmNkBgKXttLw/PhRLKaGlmjGoV+RF
         dIBifRJVOHn5ALLV8Cqtk8NeYBd6GoeHySSJTfmUXfTSk6SmGZN3Bp7HUEQin7hCvYni
         vp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094392; x=1786699192;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMGMIjVL9ndWb9OpAvANId9/R0HdmcQK/ontefgBJUw=;
        b=fMcR+JxCdHvE6o0tG5Nl/qWvmCZnf5h0NsJu568TV1rdb2OBxL/m1v0zzMKRgcaTf8
         l9RgRkeoBuhFEiMP00QY2IkkmJzxtNEAzsPgex6oXpYqxcuNWnx7d9cD/XUlTBCZB/NU
         SGl0aKL4Y3lWsxNQwzZCw9GenLyoIZVi8yIVP5kZ4GPV6ZxGR+jcftvHH8RR8cf76c5l
         h47fsBfKiI6KHOIUY0S9nm1PyfUNzYidjncKOLXbXVyzgBocYqHTLqY0V+d0aDJh8e+s
         22+hqV02Hu72rfyablPu4fDMH6pJMaaAR521EnFt8z0zwzEBneMxWEmvM7pnt9VJ7wZd
         8t1A==
X-Forwarded-Encrypted: i=1; AHgh+RqculridrneiH0cLc6zUOrZhUmgsv1d12H7X08DyKfGkLl+NlIPNJQCPhd9lPnpGDkWjSLbPXN/7lJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIh/+AozruetJCsU+htOWQoRPSC61y7Vew11IQIzbJrf5eZE7N
	SCo69wZsM48klBWeuHoCCMJTS77s9T3HFHGF64uy6jVf+OZ++44V8mPF9r59IFAwDZ3Tf2JzxeC
	O2UaTyh+1CJ7iKsTBBhTZbKHQlpMwoTAloVlMRJw/3oZiB5VtB5dksW6uKN7AS3tu
X-Gm-Gg: AR+sD10VLv1/5754dkeyayXS490WPqEIouk+KmTdrEdetEQTdUPNuUDndhGMH4c71Xo
	uQ0qkuQaqu9gddBj04zhgta6B/BvFM7lt1foKWfghc3i2iw6kf3LzykvEpko/KXMONbwhhbgDm2
	BdcJ+gH+HNKwAMUuoOKAanxhgIX2D9OMug03HufsJZXZTWYCItDr9UNu9/Yi4o/0AvkpSXKNBYm
	bscMBRMfCK4Hx/L2jkYurdL6zDsGZ3osVKZSWDw/SO1s9e3zwiU11iB1b8BeaOMrq9g3fkxo5I8
	qlDO/H7wDkL520B9IGuVKHgP+teQiB79YimGcCxZdlI/R/xyZNQ8dhb4fHxuYLYc8A2XLd6EFpt
	SjF2eDW/q+zyTwplP0pCgBKbmsTdZoirCCST/x2fzIhdWA1tBKprLLpIbQxKNyAv2rB5hpRSXpk
	9IZh2eS8azlKMvMQ==
X-Received: by 2002:a05:6214:3187:b0:8f1:1bf9:5119 with SMTP id 6a1803df08f44-908811af231mr275772856d6.8.1786094391927;
        Fri, 07 Aug 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:6214:3187:b0:8f1:1bf9:5119 with SMTP id 6a1803df08f44-908811af231mr275772516d6.8.1786094391448;
        Fri, 07 Aug 2026 02:19:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd26b6sm371552e87.10.2026.08.07.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:19:50 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:19:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Message-ID: <tnxp7geljvcoaoa6vjxhqkgn3ljx3pe3sp45ddtqhbdhxhenac@ggpantlfnvvh>
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a75a338 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: YlhAT8vDna7sYMLJ02GbVvYwliqQJEhr
X-Proofpoint-GUID: YlhAT8vDna7sYMLJ02GbVvYwliqQJEhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX5YFtUlJaDI+y
 OGgt7WiG79hKrmbDirNSlyzcUHM4cP7jfJVbbAHCCN0jk4vhIxtkHicu6NCt/L9K6FM/EzNaikw
 p4dqaYGhgtj+WbVu/3i9Vq0yI7UMdvUsBQzunZ7Aov8J2Vb13KbQ8HxN3XmHEDY1462bF+JOAKq
 DspgRW2omGC1JHD/m93suhkK+1+/d01QdUiO4dulqv6676jfYU3hGezSgS/KfJhBEAC2YxwRgfR
 64I6bkALO2PfjXnW/baQQ5dMpze1dwnCmECJATMOIIgs1zyql0p4QhMcREATwRfKFbbaWZjkYfX
 4nt+iSzdZoy8IQqZqI7hDIdoyyq6lhcoxiDEbBiHTDwwyRY1Mc+4+1VbI7EaRFyobOGis3MSK8n
 t4wkgFuu+oS8fskyAkQVPFUJcNrUkpRr9kWs9dh95H7hzMFGxiUwDqb6gur1fu9Sy/7sM4ONZGV
 m7fEbxwL2HlIDM+uZAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX9FkZDd8tlWNP
 sPanx6YeX+ljwjnfTqPIBzqlmxECqei5jZRrDLYD0KRKVZ52F3qVZOxKoghzzwTbpqzPQReEl35
 F/N65sron12a4FACrON/8ZEy6Tz2x34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070069

On Fri, Aug 07, 2026 at 11:20:56AM +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
