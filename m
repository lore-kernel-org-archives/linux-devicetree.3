Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568256;
	b=N8IXKvc1KZ15e55m1wHojiUGShD1kN/Imd1u73PvfPxNu9AEdnaRSOfLSMViWcX+MmSh
	 kDdyar+Pt1dSnkvKXzjXe7GEWO9Pq77nNOsLlKEbKyJJre1Z9vUuCwMrV6mALCjveiiYN
	 AJZ79Pp1cc1MpcUNvwXdw3M+69KSeajjiu/FmCOXxtL0z4s2p4XcJaj8HiKUH7z2iqZjl
	 0mK23IVKIoQ+Pe1hlambDbhL279obsYbXK07DIvDHN/Ij+w+HeVZc6pK/+FhD1GFvZFnO
	 DPK/aczYeufbI3PQ7VYjKUO65CyafuGxXyDNWB9/Rl5ZmlxOamTiorVebD8h2qKCw3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
	b=3zbDm1OqQPwxYE+EntA5E3brhIlgI6sOcWfZbt+xDgXLnKX432+0L5njdVAc415srclB
	 4KCbAlQXIQur3VL4+dxpXYITON1aKkGVKdk4lT8FDhxiLwJg2MXkjR8KaBSUd1XL+G4ru
	 YPJRDUyZ1Q2jeAInh/DzG0XuECxg6HerriA0A0gePqMnQVabEc2vgJnen2hvlO9hV4B8Y
	 Xa9aOZkI6SpAleRspPSTGnHXORNXclkEJi+g7ztS+JSwlR4m1EfCBzChI6rOB/fuRCHKo
	 R88l5TunuVOoSNzCFzOcNY0vyjMQ9t5L22oGFf0E6798rUarTDAkJPRGlWDfew1fHmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm5M0Q44;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUySk21x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0A606A337
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A0A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm5M0Q44;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUySk21x
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iwP2164993
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=; b=Wm5M0Q44optcaZT0
	/i+YyoPHVydnXjvQR3qcZYpbWq7gi4bnFCAPsXtg6FRAc0rCGIN3yuWe07FRLGDv
	NQyqLLOjcG6XvXnnqBUfvhcbVzcGNqgLg+S1n50J4/WRPSTkeMP4paJA/EARMjXo
	G6FaI35xCFy0Ia7/1gc9PZcenicHCNMGaxFilD3skvKyOMBZMivbua4K9njzIO+r
	6yls5z9Z+93DMRvvJyyc0V9MSG2XhQxdwDZWycSjK92vjtnfXFuj8piJL0+VKUn3
	0i74p8nQJ8X1cq5WoLNebfHfcUSzk2BzAC5SWW0pPh/IZ5QIfHnrHHQPBL+yPyBy
	3Nla1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01sqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535066512b0so15764121cf.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568254; x=1793173054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
        b=YUySk21xANGYpoY7E8c650Nm6OoQEYDR8x0t8vRgyptnFIK05gbDjk9USYbVA386lY
         d9aXioTE5W4UoPf+vWXviaDAMV00rR4lPgNUH4Ssuyv8COcv+6CWiikUekJNYcVuasW/
         OCVld+0VobkUF/lxyyIgeCLh3SxnQIATO6k2dJ5pNcPOWMXrkg3ScWhAWXEBqAhBSDmg
         E0wNI16oM9OMY8lM+BecDNK5Uft9B2zp35A9GP+uQn6QauVLyiesKxDUZbn1OH3k+Vfk
         zLmSmZdCqSVyuRfFDyvWK0bAUeG12N70UxIh3m90+54j/Nx1tyW7obd5SUa59dOJzfBT
         wLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568254; x=1793173054;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
        b=bJ0ph0Nf+wN4jFdsi7EdYkhOw8+PjcF0Z/FcXllqIHYj6KHN5jBbtEU8awerzXZbAq
         bjdwUNe5FqGqjDnw1XbUwOYWX42SqIJccD5xO8MM58PdSpkidCRJukSi5q4p5BQQC8WK
         BkrHmhG9Fpqe28xlIYBgAb1e+cRQCHL/miZ9AwQih1IwNZRm4W7p3ANusn9VVi6VlVm3
         O97aTzPflHEAZRXXMsCLUu6Yw8fX79lSDyJKsaUc5mcAtaKBkyxk4dYsLnV7bfFwCdzz
         ltMXhRdfJgyKPhPWILRp9HIhyOFyQla4gN7GlQ6spaKmW+j51RXhaQjIonmsZOYi6Xec
         /Bkg==
X-Forwarded-Encrypted: i=1; AKwUvBxLE/cXsh5+54kXYK5k9yvP4fsL0EBp14GbbshXlwTyOcRL+Z9sjOqfI/LcFHJi1IitGbiYZycJSMZ+@vger.kernel.org
X-Gm-Message-State: AFq9FYI88bwKTQ3mLmeO97k9G6dD8xdoqfl2/gb5PRhlonYNxUkkbxUL
	n8Zck5STSAEhNWFgNF4SxvfYArxDkGZgagVUdXr1ENb1ty2rBWdOgn4Hs8qtNTHB+qjx2SOyoTR
	wSBShuDhteuxqvQQnb2+MGXBursFDNLaxjiGwkgvXqi27RpSJ95KdgVq9jZuNQXsa
X-Gm-Gg: AYBFou28Jmx/CAihRslnGUlTtd7+5xoZaKNMLDBrOoLfUK3YAFostN0nk1QGIALRqfi
	6O7xOPQc3Z21ZmiyWPfjmddOu24ljqHBwbuggkWJUpLLkeQv9hUvQcA+XpudP/OSCfZBYw3prf2
	Sq+pSnGpJdGy8wUMc2RxyQ1LNSvKJGCpdr0qtub8szLoaNomcA6LMXCUbadyvFGkJZQ4agtbzSq
	pWM7QKkqHOxmMb9bR8X4Cjl5kEYD+kfWH9Ydk0fNzziISg/QWtN0ZO/VWqWN17/kQQDhPBirhr9
	fPVxcJNPMfv0kbAT4UssJZp/YuTS+pfdfqX5ctA3Z17ylamtr8mOz2xgiD3JSrmrydnR7mgG5LG
	wg1Y+dBgikNzKy8JYg5K8Boka+dF5SYf4zYjei7dEykrRoOy+KduI/TGFz0Hj3vU=
X-Received: by 2002:a05:622a:1345:b0:531:2243:436a with SMTP id d75a77b69052e-5369b85e19fmr17392541cf.55.1792568253883;
        Wed, 21 Oct 2026 00:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:531:2243:436a with SMTP id d75a77b69052e-5369b85e19fmr17392031cf.55.1792568253317;
        Wed, 21 Oct 2026 00:37:33 -0700 (PDT)
Received: from [10.111.170.159] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c0bd4csm18301266d6.30.2026.10.21.00.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:32 -0700 (PDT)
Message-ID: <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:37:23 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad86bbe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0Hab3u7fAHnAQfOSGZgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX/acMfh4MDvMv
 1SmwRRxvxR3UOHhxIgfizLTMs1NUzVHFjLC80uL5qdDUqkEz3knh8SCjzue61zlHeR7oacCSl4n
 IBQ46H5y8UbWeQtOGmd8Y2NSwWn9xbaeTS7CJeitOrKgFerNA/8HwFkRIfEVD4sUCtECMSd1VS8
 vSiXTrWQMLNW+djB8vgLtgXVqwvnl2wrmtdLBjuvEKmSmk+6VP7rFuu6PMM+DDAn/WdFvWeu0x7
 xP19Ticcam4f/rsNbsFHGSDRRPzz6IcN0qTgCo9GTfZlq5W3q0NAk/U68cMjelld+hK/f36pcPp
 l9KjG5zcZSHY8c9C5i50qiiAzK5dujXEm7jwl9vbTCNgJJu2dM0CQKQfQgY45qBUd7YlxgOtaLH
 HI4/JdIdr6KvFkybATZRJwLtViT85EkAUHnmNX2AqXarXKH3ylYromn8TTv4rQMHbKX+2WjIOnz
 W3pp4cyHwT2KA4WSBFQ==
X-Proofpoint-ORIG-GUID: vDctik5b8KUG0McU_fu-oMIb0DAexMhF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX4cId4O0QjIdY
 E3teE3bx/B6Od+c9dxGUWOdQXXD3cWb0S0zraZscKQgmOAZVJogMwbjFOLOVgv2JYmQpGUZzMOo
 xCRZnNsK8MKIGW1w0bwypoH7tcQ6va4=
X-Proofpoint-GUID: vDctik5b8KUG0McU_fu-oMIb0DAexMhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030


Hi Bryan, Hangxiang,

On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
> On stream-on, CAMSS starts the subdevices upstream from the video node
> through their sink pads, so the VFE is started before the CSID.
> 
> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> rather than the VFE. However, vfe_enable_output_v2() still issues a
> REG_UPDATE after queueing each initial buffer, before the CSID has
> configured the stream. The VFE then never signals BUF_DONE. Therefore,
> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
> and CSID Gen3 instead. The operation happens after the RX configuration
> and before the RDI path is enabled.
> 
> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
> the VFE sink pad implements the reg_update callback. Platforms whose
> CSID does not provide this callback, as well as lines fed by ISPIF,
> keep the existing VFE-side REG_UPDATE.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++++++++++++-
>   3 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..556cdfef6207 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
> +			csid_subdev_reg_update(csid, i, false);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..830c9c818d3d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	u8 i;
> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
> +			csid_subdev_reg_update(csid, i, false);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..16a0b5663fe2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   }
>   
> +/*
> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding this line
> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
> + *
> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so the
> + * upstream entity of the sink pad is either a CSID (possibly with RUP) or an
> + * ISPIF (no RUP). Only enabled links are considered.
> + */
> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> +{
> +	struct vfe_device *vfe = to_vfe(line);
> +	struct camss *camss = vfe->camss;
> +	struct media_pad *remote;
> +	unsigned int i;
> +
> +	remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
> +	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> +		return false;
> +
> +	for (i = 0; i < camss->res->csid_num; i++) {
> +		struct csid_device *csid = &camss->csid[i];
> +
> +		if (&csid->subdev.entity != remote->entity)
> +			continue;
> +
> +		return !!csid->res->hw_ops->reg_update;
> +	}
> +
> +	return false;
> +}
> +
>   int vfe_enable_output_v2(struct vfe_line *line)
>   {
>   	struct vfe_device *vfe = to_vfe(line);
> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   	unsigned long flags;
>   	unsigned int frame_skip = 0;
>   	unsigned int i;
> +	bool rup_in_csid;
>   
>   	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>   	if (sensor_pad) {
> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   			frame_skip = VFE_FRAME_DROP_VAL - 1;
>   	}
>   
> +	rup_in_csid = vfe_upstream_csid_has_reg_update(line);
> +
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   
>   	ops->reg_update_clear(vfe, line->id);
> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +		if (!rup_in_csid)
> +			ops->reg_update(vfe, line->id);
>   	}
>   
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 

According to the hardware documentation:
Starting with CSID 680, CAMIF has moved into the CSID. As a result, RUP 
is now issued by the CSID and propagated to the IFE.

Starting with CSID 980, software must also set the SET bit in 
RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware 
ignores the command and the corresponding register update does not take 
effect.


Bryan, according to the HW documentation, the change itself is 
consistent with the required programming sequence. The main question is 
whether this is the right implementation from the driver perspective, or 
if there is a cleaner way to handle it.

I have tested the change on the Hamoa EVK board.
Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK


Thanks,
Wenmeng

