Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AB272803
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346609; cv=none; b=kFy7Fuc+xhqiYOE7udRZr4ndN2bxSVbSWrpamW3hptnMsQLwHFuvmNe0f+WmBXw4QINpYMSG2Xep4Bh0VBq3WAkX8veCXB8Vg2QdxY2WzoPFbqOa1PW5985aT51ahvvbgtSYaKG6rsjNlMWGCBnePmUsehQp0CvdlpTh5H338rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346609; c=relaxed/simple;
	bh=g4Sb+4EO6utuPttACpx7esnqjC4tL1wK9PbH7KgaxpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlpqujRDgFV1/ylDdc65SxaVJZLIV0t9oUfIyQr/Qm7m5S7g1vmd2zJ6EtAKFcoEZagAPDkYSfCL+IcDJxJNkoe/eWCz2ntCGbioFiw5zQn260rq2jqXj2xKWPfBfKpTnPmUtgzeKocRQCHDzgPqldXiFxlakHVLjEt4LzITr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgQfIVCC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoduFFMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgQfIVCC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoduFFMb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06kAC3132230
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lj9pFcVapk0XSSP7vk2Ibgx2
	B2uTAyJseO6HX7OHZTQ=; b=bgQfIVCCMV3iD6UZqTIHicnGFEy/PC9xmmStr4hW
	iyC32DhH9LgnCniqdkSEuCp+18iX2NujkqzB1cYtn95L8LVUk38FeprgNUjoEObo
	F1txYgUXb12oxATaUNxoV7SsKqhQbgyAqLs1qnT1eg2kzJEIYOFCvXccLkNm/YRd
	aC3vPCNpJiZbmz1REOfDqdv6wJ42UIKuVkkfm7QFOBiWNYEJThgAh3RD3xHMQdzC
	6Bbuf/rwqlQTj5DOZn+sS4Bt1FFCprFi7kiLdLEx0DvAjUEGldr9FSevg0hvgOpa
	ceQrTpifSKXCoMijz+EzO9JZOtJZtsFbE/l5hG2JPdZYmw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4fge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f2fe53829so2459304137.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346605; x=1789951405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lj9pFcVapk0XSSP7vk2Ibgx2B2uTAyJseO6HX7OHZTQ=;
        b=FoduFFMb4QvrYTNj3PWf/z6Ap4i/xSOfgjqFI2OM0T6wREgJ8V2SrrRVqo43GfE0T6
         JESM2OW3Gbc9Hzvd6/LJKrXX9L/rQBYWG6n55UdLGkMDYoo3SVbJaVAUMCBEnZP3VvFS
         UeAbPciVsZxkjQX73n3GqxuWFZX3aBm4VDqrCnOgtpjWUrqoA4nP4r7SRperejKEB6or
         B3RVYHtomKjQZAn49Z8Eq62I8/Aes5QfMBB5R+p73wWDCBqeIbAr/LILl/5PtJYe5U6W
         FwGVd2aQ50YghJ1IaZZiOa9byjL2zmG/YENAt7Cu/aU6ArsZmW2GQwuBQP3AbHB/i2to
         JErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346605; x=1789951405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj9pFcVapk0XSSP7vk2Ibgx2B2uTAyJseO6HX7OHZTQ=;
        b=cWT4zMQDhz6jboI7iMJdLOSM9dXEcE2deEp3pWGEY4Gv5GTWriSjzU/Hz5ut/PA68F
         GtgOCLHH5G29iyd4GwT7AsDujlZ78JWHK0xKRgrj0CKM5XlPr9YSWq20FDU+Smqy0kuU
         GgKtV6nCZCxTBUGiVXSKYVaWwbOWgAbx0BjL9RvP96kXpGYKkifSOfXNG/RURmTVBSqv
         WuG4Yukg4DSYPlLbxp7N6T5G8MFeWPZ6F67obTFHybxcze4rYoP4zX81285NF/xVl0eG
         gh9Z31KZPwjAsIBgtROlwQE0rSn89B5foyEMtlnqqY82c0xOftUxzVkUrgyuVIIxuCzI
         hTeg==
X-Forwarded-Encrypted: i=1; AKwUvBwepHm5oZjC4pVfYZQFcrxDcybG3jJql6VW8MLi/czEgoPkzyBopHewLdBf1zPauMbBAxnt1m9bWTWA@vger.kernel.org
X-Gm-Message-State: AFuF++noSbNFWe+AEsFvsbMEv19VXy7DrqkbyiOArnZmwymYhzcDohN0
	SXYmab/vo7znVHEmaRTYIvNqzC2p7EgDK0EYg/vod1tZ8MTkXbo5SgFeFYv0IMBY6oNQ19ZoTgQ
	JbfeNLvohC1BGuaqhnWeJq3hI947lQTDK9cKR07q1+fsJDYLQFCtMWvCMZqG2+ls7
X-Gm-Gg: AYBFou255ba3BmdRMan9BwjuqYCB5fnrYsWuI9vkQ0V+Ed+eLpZyOhemW9Q9r7xCuKS
	yKU6zKDaLrIZzaAqwSse4rSwlV1AYjMAGtWnvfDyXTlNS+YL7WCrFtB94k/RyEYHqxQF753tYpa
	ZTiRK0jueyTT2TlAv8Gm31APpdJ/v01TRIz2UZ+1d9SNshhvW4ocEAnUi1HvEJgRIKNPU5/5b2s
	GoiEt/eMAanBumjVpyQjqhkIuG0CHMcgn5mZg/ZCJDTn+I5W/+MQb+4ekeccZqekRawlHfpLEf+
	ZTV/C9poj5MxhEy3EGFu9Oc5PycSFzI5e7WEOFlFJzUs2syHBBToTn/BE1HuFK1JhavFlFvMjU0
	cAuKWq7ZDrDnIP1xfyQgIuTPKaKPKwiLDBRxGAI62B9rZx/ItVIHaAAFWmJxCeSNMr/VkkOo+87
	4rgERanV0FG0o+
X-Received: by 2002:a05:6102:a48:b0:79a:1d27:a8ac with SMTP id ada2fe7eead31-79b5878ad50mr144537137.5.1789346604708;
        Sun, 13 Sep 2026 17:43:24 -0700 (PDT)
X-Received: by 2002:a05:6102:a48:b0:79a:1d27:a8ac with SMTP id ada2fe7eead31-79b5878ad50mr144521137.5.1789346604268;
        Sun, 13 Sep 2026 17:43:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm23868501fa.6.2026.09.13.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:43:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Message-ID: <udst66v6mxlbugyqehsrluvf3nvuw34plt7fzj75wwzrwgev6m@wzyiuexzeu4o>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Lewze0MmgciSC04fQq9n2_PqLOiVf64n
X-Proofpoint-GUID: Lewze0MmgciSC04fQq9n2_PqLOiVf64n
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7432d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yaZh0le1K7A__2Wy8xAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNiBTYWx0ZWRfXzKv2EURb+w3A
 WMUrgRpvdhoLN4T6Hd3kRhAZcQ7fW8iIhZXmjCKHbSpiYxub4MJY10kUQBZ89waiXaMIw1QZ9FX
 ERypPsmBy5Lz0zpQ/0nxjELB/ayZlxiZT6ZLIGb1tLQmEsiSCML46ih6xeJqYk5JUMkygkliMX6
 KyqYjcQi8iniPTmwmj7s0awWqcNIJ0ZIiw9eHB8D1D0KnNt4+ntOCjgzOWnob+YuVuloI/apl2N
 vtyjb2e4VzabGY4bPQHudPCZ0EVI+96nFsSRFjzMrs9ScNdDAlyTMx6fg+4/vyN2s4A19B0SWI9
 mcL4H+ABqvleAFhuGEXyTfNpGm23IsU3U7KpsVH6vAViGrfTMA0nIYaApISyIeb0+rouMgg1+9z
 rAeUBMVcEW1JEIUAXyMEaE0T6WLKZ3R7ZwpuIwTogLW167rFisgU8fyab5u2YN/bWidR5MPTEfy
 sa1kqaXNUN59oMEyBqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNiBTYWx0ZWRfXxoBzZfRGUCDe
 gobkvsOUr6LBl2IJ9V9esXE/OemmGymdMus+aRa0ihXP9XzryiCvAYdzrufvj7G1hQU/ddjgGTu
 bpAIGIe73Rsdi3r7DQrhE+21SL4VWjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140006

On Fri, Sep 11, 2026 at 12:29:35PM +0200, Krzysztof Kozlowski wrote:
> Properly handle power up failures during .atomic_pre_enable() by
> aborting the .atomic_pre_enable() to avoid accessing registers why
> blocks did not bring up.  Otherwise this could lead to imprecise aborts
> when accessing MMIO while entire power domain is off.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: ba3d7bf3a7ab ("drm/msm/hdmi: Convert PHY files according to new design")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
