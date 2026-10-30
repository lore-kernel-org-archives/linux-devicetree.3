Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349430;
	b=cJknLzWKaXIudOOYv6ST2yJ9ZzHcVi4fb2ZLmtF9gKfNHCZtbA3gq0qr7jJGPjuKYKFJ
	 j3zU78atO1iNB13YxRg5pyN5n08RXCd2lcOlz0B+oOrG4yOwQsIgelU7CXMuMn/gj7S0Y
	 tMGEd5CVVUfX3XhXVKIyRi/LMndoTMEWziLcV/dI3t5NwKH0fpcRXOzQkNUqg2Cn8dYas
	 gwvYoYzdG3jAaa1iOjAcah/alZ8YK7sr3/y2aS4rbY1i+NQl6NGmKLqvEobb9j1FRjYfl
	 sg7/2fzyFQOrM9TbMte7K2cslQ7jM0LkR2S2ZcTYPIIA0+kdKSA2GkwI2tJ+ds1jIRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
	b=UlIC0yKMAA12nW0cH8X5u1AdsyMduCUPx6/N1bxxeFmngaTOvSCldB6sIRmcYGdmlLK2
	 sZDIOEoHmogIJdvDLGz9W80TAKEoOvI3BCUltatpO/O47KZOD/xFqUoNSSIChw661frjt
	 DgEaxqcCBsEhbEV7JIwwPievsq6/mlm4gkwP0AAtIubmU0qv22rIxiwl8YO1OzelAcMmf
	 m+eDxYJ07BgznXArd7i09fS8GVqPakE/HJXJ9L8NUCfE7yK4IMfX07/nOluErMxuhYhOY
	 jiDlA6EpVOEl9G2jwshSSWZFPvcfWWAxDOsr+5eQtna5Adr0TVCdM/H71zTz/FlGAaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F137B606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F137B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FII32733217
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=; b=X+PBhZTzsT2bbHOA
	jCzcGlz7AqJCqcFbHqAp6gEWqyn8ytJDGWMmZMhZHC8wrcHNxypK0C3bK/GklafH
	sqF0sd9JQMR/JXrOmtbEsCSsdH21IfNCcWRyRmiWXBDfkBWzJp4rYA2NhLVkDM6w
	15JJuJ9T7JSutyZozwJD/OY9GYmgV6qQUISPQRRXTYpxy/QuG1hQ3fmjbPMy5FWM
	WVUBnYn0DtjP1JTqOJTLbCtaiX/aen61I49nqu7qe4amudDJJwzKhu3SGg+np8XZ
	51U9+bS81FE6xtZSEXyhBzNYFS/4EXKTY8me4OQAtQaAu9RG8KqyPnbOZ1K4jB1p
	nPFzyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj15a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso9145185a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349428; x=1793954228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=OLJcIPXy24cFhsMg0ERNJDadrLkOqROLv6IereptNbZXfBNjLeMa9bbWnPFSxX1AjN
         bXcC0/5d4mcr6ocCtUGbjacZDdqBh2BTjneLzPgPxVD3KkjBz/ouq7WHqk2hqNkQoHlk
         5MOvSRw4InYQnKTtd530DzHapmiOZtuFJV1qRedO2VpC3MjCUpo2zyb84pfnQVMEYG2a
         2KXXmqkOrbc6uu4Pdn5ynL+B0JzeXqGoUcrs2v/F8Th64xWw9og3GC6LPZYOQTT/Twx5
         5gu3hK5AIU4AjFSKI9gxAbrvhNXF2nBtX0jcg4PQCOPXUKNEjpltIuLrQ46/DwR4NDXp
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349428; x=1793954228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=hFGSwDGDgxdfBv0s0p+9hLHgDt0HhAkqU3+yBfu+6yCp8PtVEvI2vle72n4IC/vD5w
         bIDVRQaiFez6GZt9gtIG6v/wJr1nnlcF4fe1aNKQv9l/gPWWk74cUXfwQtLDL+A3Vpa+
         jX2ymzuK6UEqoVCSOCOSc1EAjXPAAboYARwqIGy0fl93jVMnG7QY3hm25A0chZc/0dRh
         zjWGCdakO5HVqEqWZJwicEDjKxhe74z33nbAa0VLUqt34P3KqIFKldMM3Vv5cpwaNnCf
         VdAuC9wbiTPYnNvsu7FyXHMCNxIi00x2hAZixP7ztu/i0IwFUkBoZf4jLFdl3X/ozHxy
         didg==
X-Forwarded-Encrypted: i=1; AKwUvBw4kueOr5gdI9Rr5TK32Enqr1s8Oz1TWpGDjY2zCG3YhV4RGNZm2SkaC0FHsbtStOFP3g7tmvGaqTf3@vger.kernel.org
X-Gm-Message-State: AFq9FYKSngQnLncV49zPThKCsZ4dtXERYAbfBhzQe1NhW4GFm0D/FRy1
	HFJ53TkLMPQCQhHUN4W00IYF0YzACGsTOTU437IgU3vtj8YMFL/9XtFt1OYU6Ru9SY4AztP1eko
	ZCLTVW4PH/llvLiuW9vO24UD68CWYDU7uGwESoKkbaNLhDdoyTYOFcgSLPI0r/QfA
X-Gm-Gg: AYBFou04sc6H+VV5Uu5+l5CX3/LMM77evQwQ9boDR6yitj/emJUoU721rzi6XQ33mOi
	jXhBJ2sNYTlCncFzOCT+lpxcsvdnlzLcL5GGtYSEVa1b5boC619XUtkHQgXqm0bbpYmmX5WuOkn
	c9p88ZzhkaJ5WOi6GEUCYWjbBPcJUP+CCAYVdsKx53gswIJRQmxB2we2edu6QPx6Vyal7crSBkY
	fES67tUNhZkGOu7LxMfFOPmocYlfS2ZtHugQ32Bt12h5O/gBkKHgJrb2xMFMwOuolUw7OuhOqZl
	ni56IxtLO5Nx3MIKay3z4gF1WKlujeFcoaPvyTamCfm2F8t7i5D+oQCChSA4b+8Qfl6rn9P7riV
	7O3lZDv+vMYtXmVA+h/1fir6cNRm2ThZ1H0D3ZYOgH2qcn2Nu2veZom5cHRcLxFqahikNmZQ=
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263599485a.0.1793349428386;
        Fri, 30 Oct 2026 01:37:08 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263595285a.0.1793349427936;
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Message-ID: <9e8468ec-c9b9-40c0-a219-1c202a5e7c6e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:05 +0100
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pF4Nuf6_Md9YUyoCL627fSzXPG88TEmZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX+H/4uHyvI/qH
 n1sAsNQNpWvGaIygFlxXh5Yrq3k3RjdNtXY3GpIwuU1QZomWKZUkV/vJW63yOm/Ne7px4yzEwOa
 tqO1IghM4nVv3QOTu+Felu0O3rAW75g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5HbTp0BH8N8G
 sOfZNks5lLFU4Z3xLxpGfmd0TXD3T4XvGEsk6mryCxYR/VC9qmH1V3vsELbCmgdC+B1bf4R1c+9
 MjEFx06V6IFaeU7zWyrit4FP6DltFLK+5XFz3pdIcITAbMftfo6p1aW0EMtLA64ZjJhizNRHpeI
 0U0k3UUfoO5mpxIfHfsDQYgwfUXbGc8Akl5FFfexFzxnf/jogsCDXRhmzjLVLQHbv+CSQtI0aKb
 HJrqt2Sy+GV9r6tyyJSA5hBY9dXwCga6bEoHq8ntSBG3OQD9EFRgr+uy8ozMuO+8VjiYGxhUH0o
 HHp2lV/luSjBs8XVypE23kaFYQrlKdSvoFk0rPSyGGUOXkSz7gGIjaQhagdV8aW6niqWJ3YRPLM
 03B6EoWtaCPV6/Ue4UjA3PP3oeuUwAr8PVhDxAJmwYEAQwowF5mlKFZK1q2PTPvknAnoOMtM422
 aP7AAvkXgAhSZpYKjOw==
X-Proofpoint-ORIG-GUID: pF4Nuf6_Md9YUyoCL627fSzXPG88TEmZ
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae45734 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ekXOaHz3wcDJCqmUXkoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on SM8350 are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
