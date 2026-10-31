Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483333;
	b=gPs/pMr2DaQGEEiRTXZt9orEUcZIQXqP+WgmkhIrznccdU3jcwT4NdiLoZfoxp4IUGrF
	 pi+Bv6q5K5WoHedhPIvIV2VaJQfqne1r/O/z1Mg/eIkbtaL2KAdK8tidkz9xkVhPSkzhZ
	 dfKxuzpFgWLHm6T4Anyrjqh3TIqZG2xGn4+ojoMJTn5IkSgN/N2U82gVMwyI2JQlEpq2P
	 rhzGwFBWwRxVTJEYikk0hA/DkO5SYmCcbsAcU0dprlFQoTCVhQVndc60K2KmOyeOgxsZr
	 8kmC7YbnDBRy17EZD9fze0UU7Ky9OdLV49EYf22bMZv+yprFoMEHMyqqMsZ8TOjyVxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
	b=HzVAPDW81iiBvlyZ6/ANklGfjRT26liFdyw2skqEjyUujexK/ehmsN16Ts232eq/PkV2
	 jMpK6b0EY2LucX8jZsrJ6bX9H3tAO0saAKaZymHEhTPMCH6puxVS7oOvslYlWEFoTqpRx
	 Rn7+IWKvV/00SNW+MbFZAgcJXX0nl0G9tCAS45g1K7MPG/dMu8qW2AhzLi42+zYyElnmd
	 cNI8j+YYEb5sXlRSrG6fxemtA8RugJzF3exN9h8hz5br5m4LK2Zu8RDp7UXgwo261oPbO
	 I5kbygA9Sm9SUsGqjvDZh9YiPCAv8o2VBZhYWzOknJegMot/mgtFLrTsc1B5GHXdI5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E3606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUG10rbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC5xRwEN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF2kp2614251
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Lhjmp7pZXEoSu7S8VjkEKvS
	Y0g4l0O/7K8WaJ0F8JY=; b=ZUG10rbO1FpoTeNiOmCzs8M9cp+V4F7Kt9yOHcOK
	eyxrWHZY6Cm5oI9tudJT25wC+RPH3fVrJeXxiDrB9ZRAfcEt6r8xfh5UyfzJR4iC
	x7tf3RMbDGL/PGxKKNvC0ySFsjwtZJkG8173nYLK8KH21dEMlthhzc/8ypjk43Vo
	dvjr/kpXgLLleTiHgMRX/f4qzh7RfZBEHSjP3b0nYlaNT/fgtDNnjnnnGzHEHjSv
	I7f13wQiXGRaM/ANEXB+/A5eyto+2ZjMUOL0JWqnsOQmtwmVIsFDGVy1N4TCxn48
	VY8XAN9b5zSLK0XEJRTlyXYrU81rgB0t/xz5dRzhtD0ndg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nft83v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:48:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91256a7b7b3so35034436d6.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483331; x=1794088131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=VC5xRwEN9dJF+v0bQoqtw6h1aQYnrjoXNjuxvamOOLwJQHGTkCey6RYucq/J7n+es3
         GPR7uuW/3iRwOWBm/ZqoOix/cXE+N5r+JBrIZsdNyPOv6IucMe0b2JaSFoMEs5ZmJMBo
         XxlbpsuVUeejzVfdHZ8UkjcmQoGvrvQBt56Q68xnKKbF7T4AlY1/TDv94UAPIPy4z2Op
         YWr3IM1YQmTieTI9SYkEqcKd1UWWMHAHZNh5XP+S6ChNrgbMUNzkkCcFvcmyl27PbNFz
         mELxTNYxvN9zWJj7dtZt3zaHJ5+HVw8JWOoxzwuu/T4OtMnZZNVJlaEHHtnuLL2/riWY
         wEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483331; x=1794088131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Lhjmp7pZXEoSu7S8VjkEKvSY0g4l0O/7K8WaJ0F8JY=;
        b=avKdr6noU1+N6kAOjCzpn62D7qnpZ+w7pjsOo4lgMVzIScZ1N6PRf4SUEeqBoYJe1M
         Rg7YpIjVVrD+3/p6l2yXyq1dejaaxNXwiwS7Xlp3V7+RYJx7L1/YN01UobF8dh7wXVgO
         r+MmpdVqSCVnsi9nQHYy9ppOP+WG3ulwdS3n3TkPCSjapI6qBKZcqD2V6NHu0+eQfvff
         MqnZtSTm3lXV7v585Ppe879r3g4xwzwrk5RCM4Zy/4+T2tUJR0ygYFMVgExrvzhb7cVS
         40UJDgC4F+XsS1YeVKkK/AWgDcqaGPE/BkArc9aOoDHkQvcDOuvBcjQp67qxxUVG6/fX
         5lFw==
X-Forwarded-Encrypted: i=1; AKwUvBxYDL137QkTXycYjaRlWrpIPVV4WxHWKWXZs7JgFZlzQuS0+MMrBKOYR3TFfPpvhTFbOvtrTBpyMUyN@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6kpbHsYudaEGIBxM85K9ZVPs54OnI/RhHxBsE4ldPQr4owCNc
	iQZXGBlxAqHQq4DSIIKV6NUbyE2WJ2n7hq0EPembQ8yUFycFWPvT0xemh/7ULaXYfiU8Pdg1jTY
	FJJXJxt6w1VXyBA1MzNXWfIUxo16i8KPhb1f2TGFnSz7d64Xy8QbZ69MM/QKDPsGE
X-Gm-Gg: AYBFou3ZbocivC4+0elmPYFi14YWgx1tmNbKe1xySI1szcxl6Q+vU6ffJPShc3OQe8V
	bJhcNgGxDScXTVMPZ1OVIUZITYl7U5ZG7dXqcZWRTAWruePkjjC1MhBHV7QdMPUBU5Y8qUwXHA3
	NOJeqOHWhr9x/iR5RZDitOSQppImYCjj6pJse8V6CgSvzwV8lC1QM66LF2SUBQ9DaBVyM3ZJH2U
	7FmpI0MCcNSPMCWxDJ/8ULp5nKRHyjRjSJ6CiO4qC0L4mGsOPsVKnFXgVuL/kxQqfaY1XfN6fqH
	aWQ+iZ5BcNKAtBw5t84BVLeJwAcb5nwpmW0A8NP5pdzS6FKDVmk6I4DdqbRnGovUcHSK2EEkAvi
	IzKUi+pmJdNEAu6o+8MNnlEiGAIv84jibIsAJYgxpr/SfMZL1g9T2iFMOh1/xrha9yOreUjoFMB
	BpGb7FqwtFOtkGBrA5V/UwqeYxGYoiWWikVtm9pS40JPMm1wuufVc9/O82D+IZ0g==
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988446d6.54.1793483331067;
        Sat, 31 Oct 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-91ca4ba268cmr99988266d6.54.1793483330659;
        Sat, 31 Oct 2026 14:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm13744921fa.20.2026.10.31.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:48:49 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:48:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
Message-ID: <ms272llmwo6na3e3i3qxv72zvxedblxdisxfb3lswmjrbobbej@zq3hh6srj3fw>
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
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
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXx24i+XNQmDZ3
 ahJ98ZLrFjKMWCSGOOhqsy3VOK0JpnjcRrpoyWTPJF7GnhhgPjVuasiwoon+E39/IyM7bNkCyLX
 eYPQwwJW429uoW1S86AYM1pmxiPp4eU=
X-Proofpoint-GUID: TTcqmCLaSLDgnSglAPMKv2PGvsE6JK5Y
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae66243 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=rbLHc7TusOZuPl1584oA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: TTcqmCLaSLDgnSglAPMKv2PGvsE6JK5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX9+cPrRISUmQ5
 TjGdgK8HVDfVBc8AcumDLaVaLoURPIb9V/4tT13Ngfy7VHsrwei2eyA8HFZ1kbFSVx+NduWLpZ5
 2rfyxsHO3Gt77yHns3LFHRzdpkPOUT5eO5JlQbfk74RmlPOy5QdwazFzti50DhcDCBpTd0B5gg6
 fDg8nSPkP9MlpkWJH/hGEJHcy8iTuU0cUpbRe7qJcgNNtVfYPQiS4crlpmOrIOjc4PlRxh42VpN
 s/hwumEjMAgIREx1MK9f9FMm9Z4KXwHf3cHlD+Tfps3Krt9LJYF7iFhFsQ2/U6+jj0FxxWt+/Wd
 Yt+6Dms+DvW0p+AkGUs9lwS11aipeCgwrbVQpbB8Nftkh6tZn5Jde5x4xbap5F0K9QzN0qYpot8
 jAYd3GNOHteooiFOgR49cy9n3DP9l5tplya9BNlQ3R4SAcce2wDmsVr36ZUT5Nl2U9T9/5vSg9P
 0Qh0HHpcmh/7wuFFwtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Tue, Oct 27, 2026 at 12:42:25PM +0000, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/interconnect/qcom/Kconfig  |   14 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7250.c | 1489 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1505 insertions(+)
> 
> 

-- 
With best wishes
Dmitry
