Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE9380FE0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076233; cv=none; b=kKGlugSaSKSF4Gl0mSA3TMqEUyfE/THrzfwvAVdD93lFh+1lKgTVFi97RuHtAuETLeP4WDGfGphglhtm9h8tIneFJrz/xJ9BnFXCagHEbgSuk1LMnGKBmjkD8tyBwQIbVo7YsPqhnqYoXp9ljSaodu1xWKkwHFddK1pp72C+he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076233; c=relaxed/simple;
	bh=s6TRSHFxTTEhyWk89Cxr5Rj/a1UMj3/E/F+SxTbbJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAwEtN9FGTagvb1YQwVvAbNBv0ihnO0RwnW2PsPGSCFMACQPA2B2UCkZFd2s1bRkwV2rx5H0654bz0d/OBGsiBCBxcdfxbmkW+nGnyNIMmXuP0RyU6lY5tRmV9UkMEkH3jBie1oR2YdkXGnqfMZTyCTrtQcbnAB1iZnpij5Vifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHomkWnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b24Uwb9h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHomkWnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b24Uwb9h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s2Gf3126832
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=; b=LHomkWndkPhjuAkR
	5mMxUA2fxolip8NW1HnB8dPf7U10vNPu/JH55oYs8D9iUU5QaAIAw1AQ6wHDGhtH
	tpJ5pculFxjrJHLFhCYl7v9apNl09iqAKUlT6QX6X5TIZlj5h72DQJlLJ47uei+G
	MpUuubAJ3tqhRLXr7ONXGkRK2ENDShylqYdENw1CyrKAe21O9Du9qYL/CYgQqQIX
	NNxAuPNXmlHzAvoQw0WGAVg+wW60j4hXDtav0koPu0604EjJVm6e00iNQiR2RinR
	zowXE9/HncGmktHiC4Vyq0U/4UB9+UQNkw7uKzOMY0dXctQ8MG2RLLfpnoJ/AljI
	8ZahJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm2r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:57:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1fc94a11so1379761cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783076230; x=1783681030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=;
        b=b24Uwb9hg/49xCvPA14yo34NimYqFbnQqdGvF7Ct2ujdKNkinn9KQb3OqXjxhzTE81
         i8KDERsk5EeDEl2e9bKDvAcE8JiKlDfkmOvaVMlTkBmFtoCevCWuUuPRbJ3sd8/B4Sbl
         jfACsFcQNgCu2gtxfMwjWaZt9E5EZsGEIdnWDOPsYHW8FXwE/yqKuA6NwphNssSt9wRK
         yekmFLqnhU1LIjUW8WzpEsd9TewVZY6ec6nD8mP6v8GY/gk7Sfb8pSNv9POTXaVPQRcp
         Xzs2AsJUrogjKpcEKuZoNn+uRh4falF+tL501cXFQ3yk3goH3HeLb73+07+3Kwg6i+ov
         5kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076230; x=1783681030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqsXltvq9Um0I0ku3uOhQoMmt3o0ZYCVgjoozcaiSOo=;
        b=EjNn+1bFwN4Ufm4xEBGb940BUV1TK25990tcZBX8RlVRtKlG+GySTMJWEr5WRKgpz+
         /YEzMItqyoYUuxMejM6006nMvM9WcWsFtMsU4F2rMaEtZbgIM7A5WhDJ1Yx+OQwbcjah
         n+BugIjkt+UCflm6xyRMZxJRPW1mDV7zt0lv7TykdSHAr7wzmxToloEIotTCbDvPBXSK
         O7Xwi7F9lK41OgloVOHary1gx5dsFATnNlck3BEmVS1vdPflGAUXQG+099FsNlD96+TH
         tDmQiJb0OyUzeVVG6lOutYgw/cG12HOZLmKid3tMSO0hJuS3ISmWdYms7UcuZz8LofSe
         Zojg==
X-Forwarded-Encrypted: i=1; AFNElJ9/83IOuQXGn9ChPK2M0yQu5yJKtr7o0ZMVhiDV3extGMazsdwzxGB/2KIpBocyz5Z5IyaVRX9/MpV0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LlKDSZ1idu9s8oMCuecwIgVYaoTyuhmshJud04fZaszcrM5D
	HVbRCEKWB8GMNfV/oi9uw+s2BeCqtW3Hfwhc3da6ntO47fS/NTwQnPYEDLNTJhCOObSDuzrKXZD
	aBRP6qmrwqIBfWn9q1+/47KoqDf9hP3DDqmwOvZPB74PEUelCalB29rIiubY2c1uh
X-Gm-Gg: AfdE7cl3/jLAUtS+luPkZO9gzU4O18ODsaSKNLUesPdPT20/An4II02SnSlRVs/zcHB
	IP3X10SimwcOH0j0n7g1Z29wD/KqjVXJ7HlkgMLsm+RFoeiym9TmdoNtjWrLiOvDayjYOXuyTi1
	0i7qt0xiW02xfDg5TD5jsAqaNXLgH1x3ri21mx5SFcqUiegfyYq+TzTB69IJXLdH1keKzhq4mQ0
	m4Vpi4WNnH6VT3TKfBgFjYaMPXhj5nxfpu+7gldQvRT8qEmsGVd1kRJSpVGmL6HPlNVJW23zQOy
	lGxR5IOx/0Q1UgA7JI8itJ+lfwfgfOLmAT3k4x4WNrcMMl9pI6WNWDAVmZ/SS8LzXWi6qB1II3M
	48iD4qFqyhrYFWqBcZmijB/TDAyAPlz9shDs=
X-Received: by 2002:a05:622a:102:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c26a7a55emr95821881cf.3.1783076230516;
        Fri, 03 Jul 2026 03:57:10 -0700 (PDT)
X-Received: by 2002:a05:622a:102:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c26a7a55emr95821601cf.3.1783076230028;
        Fri, 03 Jul 2026 03:57:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62d1adfsm267905166b.54.2026.07.03.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:57:09 -0700 (PDT)
Message-ID: <53ec69fa-c840-41b0-8a53-3197fc5bfaec@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:57:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to
 usb controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8EPQoRZwUVYti5B5uYme8yBkiLEqC6LY
X-Proofpoint-ORIG-GUID: 8EPQoRZwUVYti5B5uYme8yBkiLEqC6LY
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a479587 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KQhYNC0tuK_561vA5pkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX5pWo9Ktg9wBN
 pRk8cLbMh20ZVm3RPJ4DDgxsyGGmqp0F00fPUREBSyqsytTqrnMV2PG9EN6zuRRTctsleoQxUNp
 LjXykwq9hV7H4ltJGKdUoTXCwm+FkIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX4ROcQ8rIjvrG
 8kxmhYhwJU3t0kGK0Fb4Yg2bn3aebB8gv69P6PZQTfmJk1ocHlRSUu3vG7uSdIQO6hUw4BqbXGA
 DNSUwaYMXpde464/PA95Pbz7snSfu5IjCrf+ZGvdwWS/e8wNizdHxet80u90b/yk1gnflD3xH/w
 s20cOP674moCblXP8oQ+oLf1HLB4L/378uAMpihj//9B5cwh1q7UTfa2pcd9VeO459ng+hO2KXi
 bhsqC+9foxsm7cuYOcklwly2tCjMvGs0xsLcnPja/3Tm8uZNyI1YNFCzt5IRj3BFipkmCxWjNDM
 Ea3HqrOCqbR22dgvqePjePIZNFDnTLfKhJMZ6EyRL9lTvhC5E2ZrwAuJzTIwE7VPsdTOZg61Edr
 j5K0/XzCwIHvK+I79KIVltCewqWgWGUDqZR6m81vpiiP2Qj3/XsSKheohTLAqLX7kAXN6kJCKNh
 aPUTP3EC4AEbAv1y29w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030105

On 7/2/26 8:44 PM, Krishna Kurapati wrote:
> USB controller on Kaanapali SoC is capable of switching role betwen device
> and host and also is a wakeup capable device. Add usb-role-switch and
> wakeup-source properties to the controller node accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
