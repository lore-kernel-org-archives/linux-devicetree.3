Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DB39E16C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997468; cv=none; b=YAxfJObgz30/0jvOzQOKdBRtCGVZLRd48R2/jzNa0EMKNvng0mhK4mrC406hldBUaUMNcf7kxMeTxJxSLyGx8/ghVV2Q4k2HKHKu2OKyAxsyLk6+t8k4GT4W3YqyF/r5Qa4ZjysEGVvphh0AZxD6tTQeGAuCniWlCkhXx8qXcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997468; c=relaxed/simple;
	bh=MNkG34kMsVvnIhkvNI7U4mabmb8YGJmSa1V1L6Dp6No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJhn0zAjiPcl3eJtJf1M/RbnrZ5Cqfd/eV15WOesCEjgs1hDuTy0/VNETsdK1IE0h7IQYtoxq5/Jg5RngmmfhPtdYEGNf/ZBijxWYCWJqgjUISfcd3cYHGElz1t3+ytgVjuTBcOEde7WgAE0IC5vGJeNPc+fSlEwop3wXSHKaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiQ/uF3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVaX12XM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiQ/uF3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVaX12XM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597s7kS2001869
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=; b=RiQ/uF3mP/XnZ6bU
	SId5H3m4HAASGnXJXGsMf3odDzD3ZsQxdsKs5Z1hd7j6+ZSLE7s0pe8eXz+9OW2w
	GMFWzmITNWuh4yYqvd26yhZrlzVN0cX0JuLPz13twLM1ot3WxcTckKFb8jQPx03t
	OcSd8PRmTgKtgNdP+Xk8GEEV2L3UKVFwVrCEEVhXzX/nhA0QBg0yjXBTl2aAtMn0
	tmAasEXfrPRJwouMqnJRQoRqdfaGWhh13pFnZpAgArLuHQAuQXpfoweFq01jvRHd
	+/5QA0EvGOwZ8xB6ezMvYtshvnHxUJtD/yG88zIVAKvcrdTFEkURRmjrS9DK1o4+
	mHj4MQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rkxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:31:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517865e6219so11229051cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997464; x=1781602264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=;
        b=NVaX12XM42/UxPdmc1N8Cbn+lmwD9K+6LsrQq52HGDCLnuG74sSap2h7e5LMhxBfsC
         9V4JuWUlm+rJee5Yj9qeNcGyi7HIZaYLboFpZhhF75OqmmxdsgkICvC7VPTVze2psSM8
         PPO0qahvqXUYrYZybunKiDUMHVk09VojOe4MSorDfdEdA5tc+tkCjbxqvIvhcR+gHRqg
         cFTbAxZ0z3inw/zoOPXs17hStYNQgxyiSNkofXBQ8PNwMSQwMcVE+iHbVvptM9Uif0O4
         rxcJ3Pr02afvk5Qr0zSPtNMJiC815I1v4/OX+LsugL+BCQk4jpCjU6fo34zGsHPVg6jB
         BKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997464; x=1781602264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMa3qXAR5txkpAwY5jpKqli4jX9daJVnoCU3TE9NuOI=;
        b=TtQuBb9cvpgoQa9L0mAlSMyMqzwR48JcDbd3+qiMte+VyrpEAT+xvw8kZQik2taBem
         55w6X9qHJM39KZ4DXQPx5dndVH+D8Mpy5ee072BlAI4Zu/Q6ldSU1pXY91m9Q8nAzVIS
         nM1PfdoYH1nozqq/9BsXhq7zox0gdWz4dsFMkbD4ZjAyA7KGH9axXCOYM/GMOKFx/rRR
         6GOQsw0NCbipZ3ycbqrU+Pg9WwrmzPYRZHp1bdjLiLXH3EG92STvHUwyv7fq0T1IUjQT
         CLcIf4uXJXSC2uUcwrGOQpwrvk9zpgz/4krF7w24u0iheL0pJ2pu3YUlrOqbrdg4T15G
         oXUw==
X-Forwarded-Encrypted: i=1; AFNElJ+ePVG+y0jLwMssDd3rqx0FT5Gk3uDUzozpE4r8RqWySbbe4EqDmwoBXBp3jgZuQArq+Bjx0xno6+v/@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQy/QM5EawodAp67P3/2pQ5jfXaolNnNVAmgbHSiIL7YWO+cs
	L6eFZppzXa2AVjPKLygoKTi4z9I+7ZMFPQAbCmsYQyL8vox2jQQE0x/FEUCiO724GFjsnHDew2C
	jnS/S03nalkR9cr7wcA1ykTgw77XczlJoMHQAbOR2ZgJvL0JbwxLoWpmFD0jI97rf3NrrSW3U
X-Gm-Gg: Acq92OF4PPH82h0649exVJn1757jAxbpiexoQjOcj/aQHWShXoDlOu22mdIVamCKzC0
	ONXSbMgnkC7LhVmlwWK3BnzkypvdtR6zSAexX5B+b3T8s+AHsMBJaVLnm+bZbF+2a7x8vo1bkbR
	C13UDEbNS5J0WVGPbOz6iy8NkM353QkMzbQHGPjoQANO1aY55gc/ZIniH6uENM9d0xR9u/oMPdx
	JeLajb6VWbZH5DUlqAVB1Hl5oxOBipuMOsEKMYFfGzi5uZISdgyqdsxBMZGr+IyzgYjH/ICNoBk
	b72Ndj+TlIaa+6Ce7on4tujGu3vJb9N9zLoietRnPnqy4Y8Ep8mGJ1AEHaVURGiPvyvZq9zAKMm
	tATVCfaWN1Xmdk7XCwMCis7OqHYS6RdXMmhM9EP9zA9JhfIegYFVQgRm4
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr168230321cf.6.1780997464167;
        Tue, 09 Jun 2026 02:31:04 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr168229991cf.6.1780997463612;
        Tue, 09 Jun 2026 02:31:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05228a16csm1005080866b.28.2026.06.09.02.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:30:59 -0700 (PDT)
Message-ID: <4ced3207-a132-4ec5-a0eb-79f75f5cb4bb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:30:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
 <20260529011619.9586-3-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529011619.9586-3-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _KCc24UbLL-R6MSO4BmKvMuvcCzhOppL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4OCBTYWx0ZWRfX5SouzkykPxcL
 e0WTeWlE1kKOpzFgR0dWOPncLPAbwM11FXaZzsCVuHG3uylPBGymnqtfwGKh//b3Kwuy84CWkWy
 qjfQ1mYu4MtXxNBSneEIHa9VKpgVl/uG275VDKOgk6itivcCfsL3ZxR2Xd9Y7U78nRbMvh+ZSrD
 5wNnWtg7oDMZKbZ+TLUT+hOGHxmTIO52SihnvC+7NbtDiJGpWFVO8dq4eSM+85Qxco6UWOdl3Lb
 DitZDC3i93ysZ3d3Ns5f8UeFMEKgCUT/Gh/lG9pDOG3T27K4UPD1Q0BbktwiIBRn9+wgFDZGyPt
 +H7Kr6R6A/MQyjD5PJEMi4RpNK24FEkDpa9/kA6n4fwMLjMgqAv4k4vnB0l4jH9tXkqvy/mbR7+
 5VJCp2unNHp9/rSfpgSvxGYOG9Ev4Q1qu8rHO44GSDzAXaM+3uoJrjZLeJeGuSizjkJFF/+DCjH
 CMbegLkOhRxTdwD1NBQ==
X-Proofpoint-GUID: _KCc24UbLL-R6MSO4BmKvMuvcCzhOppL
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27dd58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_XXtN2VGHKrtNHovNKMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090088

On 5/29/26 3:16 AM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

lg, just a couple nits


[...]

> +			codec {
> +				sound-dai = <&left_spkr>, <&right_spkr>,
> +						<&swr0 0>, <&lpass_wsamacro 0>;

Please align the <s

[...]


> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	/* NFC @28, commercial devices only */
> +
> +	status = "okay";

Because we'd put the subnodes for devices under the 'status' line (DTC
enforces that), please move the comment below as well

Or since it's @28, perhaps it's just nxp,nxp-nci-i2c and it could work
for you ootb?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +				   <44 4>; /* SPI (TPM) */

Please align the <s (or is it my mail client playing tricks on me?)

Konrad
