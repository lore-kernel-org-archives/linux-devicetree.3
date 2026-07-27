Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E438889B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163072; cv=none; b=Ck5Zvmly0ie8HfuWvhTX/fpOAqqCZz2JwdEp7Z/0dVCvqcEcoLiF3yVZlQIyfSQCHTWJ1ACl+iHv/+MqufzY0OrJRXVfGb+sg2ILbpXDSMnJZLvLJeI48ldhlbqvlRUOPEfpxewgpk3LWIYRhI7D6MW6YxveBV05x4HAKOMttHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163072; c=relaxed/simple;
	bh=/Sd5w21hE402gi0RTf0vvE1rTfytQaqkAENCHLuji6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjBXm1fPBn0UmrihMWifAfG4AY2FUZi6mxv+zvsV+1jtTTHm9n/iVIlzMT8/FctN71R7dq/wYIOaTuIFus5scaQBuMkdez8Fenv1BgynMcXblYC2Op6My9VO2YLktuxjeLndnrWap/3tcjF2mB+dhmmgguriKt3G8wzwnmYUweU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjFFqkOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xmxi7i2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjFFqkOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xmxi7i2p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlVq63663451
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=; b=cjFFqkOomjkUB8pf
	7VtSPMl2YzD7D4tg2zqb0wxHUppeIqsvxT497XA6VNOV1UqVN3Qc3746XkzL7jsm
	zl5jsHUNuPwuyx+SBAgI2LmTw7x6p78p125EczbJ8l4YlKMtkRr7oI++2U6Gv9TQ
	yflVe3tlEGcPTWDxqqFlYIDJ9pCHgZagFr8yxspbuoUft39aL6LoxOUoDUaD07NL
	oSi91Pishz0IVY1HvcfndN5TMv392LCKSENJX74aN9KPu8dUwZEGfo1EbkyLHghS
	qIhWuGUvFPdbfZkUPhfMu6Yyuhhu/NdDV2MBMbk5iAhE43plgeJCQYD/qrTUd4qs
	GhACzg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashwad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:37:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73966c839bfso69143137.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163066; x=1785767866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=;
        b=Xmxi7i2pkA0SMqtBpu9GVMwkocgKUgIl3wUAtlJcAko0ToW4p3lttqe1Ysma4VFZyu
         p2encNBToIo7EFMLykajHXq9llAgN8k5hX8s6zhiCF/2GHqIRsmNAhip0O1Fu6iGUEC9
         hDJoIIjox8+MuLIB3+QDfb51JTqJ7FNKWQEiojRYrs/y8RHE4YEYZlQ4kR15TVFVkn5g
         Kw7Nhs3wxaG/yB92EIqg0nJTc3pHP1qwczUZD9YW3g9yEwV2so4qPf7ejMi9daS+NcGx
         hha2qWX8td1mpLOxlXiuBYaOXNu0WT6G747PbXkYNQ9dgip3ciZ1NCJO7Ei1XpN2zC5B
         9TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163066; x=1785767866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7eI3nzvmuur5DVPsNlaE7CCEVxLlxW+4krkIHKY478=;
        b=kPUofktrNTeXHXu5HpWVwtvSrE9sWngpmYGMI34F8C/nngnSvplTwx/QdUyZUf5SsS
         0ENbPMj1U66lEh6oDjt4y3DRgyi8Wq4yBZVhekISBDdfGrFLYPlxhGWaDCF7BeuNN+Y8
         w/3u5fEoTdIwjytK7HDdQ2Q+yBW/y21rYiqJy7g3FyZiR8k+tSgrxuHR7LEha/xvV/kD
         81o5QTNjhsnUBFu34VSbFpHJyQODOuVeB2b7H4D1SW5ZLQsCLy1qTCKiZk09QP+MVf+y
         ejwl6q7yDqE8vacQIkkqWV8VlAH5B2HuDOkv6in8oEqOw4bO+6ysZ760MoAPGxyzsiLW
         VbMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfwxjiTY544jhG4AOmyVpvWazVqo2jfFIZxSz4mJWlPsS6l7m7GnFhGwdnythoWJ6RmkTm9rLXMqky@vger.kernel.org
X-Gm-Message-State: AOJu0YxGabMZTSi3UVMKr9CHF2WQDccLTtjYN/HAX0RLaSx8Syhfb9MN
	ZgiGJXpiRADHB0oVaawsKSwiZdPitd0h1h6M0RO/CH3hGilk+jv3EAFANbfXN6K5Yq+7V1XpvQ8
	YXwjQDsMm3JhPSysAOMi3eXcT1oGKd84OS+TNLpKJIxtidZhmB9epj4QNqdbs2+qg
X-Gm-Gg: AR+sD11R2k+tlAu1Zcg26AXd1kJGNosHUdIipuMPw7PLH8ScXK/GJKaTXOXm6gs5Ftl
	Dxu0XU7uOb0E0E0I5I8NrEdqqc7Mb4klxtJfqDWWwVRIaDQiBLyiTwTAtxu5nDO7tSZZPBGGLZQ
	oJyH6OilT6WPQFSXmFzKDRp3QXw+fW3LXeiv8ivAfhjCcbQx62XHivsF6ETIZL+ZtHS7/0vB3VD
	Y+Zt19MdEbQ1dNU0zGtgMe8UiWu2AQlq6oRq5jnJUHgb2OZNczwAKSzcqlP9oYfP+nWzcmmxF/4
	JUKkl1/PMHHMAJZ/ibSQ/45cFgrqr9+hEEqTQSGSJcde7E4w6fqpXyAPu82jo+UMN60o/CroKKB
	Jr3voZkqfFUwnoh2SSRaS/jDN
X-Received: by 2002:a05:6102:c4b:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7503db4b803mr3414056137.1.1785163066395;
        Mon, 27 Jul 2026 07:37:46 -0700 (PDT)
X-Received: by 2002:a05:6102:c4b:b0:633:3bf6:977c with SMTP id ada2fe7eead31-7503db4b803mr3414018137.1.1785163065947;
        Mon, 27 Jul 2026 07:37:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm654994466b.20.2026.07.27.07.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:37:45 -0700 (PDT)
Message-ID: <87761a9f-6bc4-40a2-8776-368ca963473e@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:37:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX66xC/Vd0w0g1
 QiLiLUiGPEqxMQn39EF7/HmmB9h5+wlQa2BXo0zsqcFVH2ZDzzx4uOKX5qFtxGEemoYy6ciyYUK
 Iv26qGvqnaU/bUrpG2t6TdqV9r+YAlZg0hsxdc2ExPSSevM+7q+Xi6TMIUBconis8Z/nPub5yUd
 gGEA9AlV/olFZVIiOQkgqVsP9q2WODXBn/6qEGKsoHnm4FWM6jlKDwpZTPe2mYfokN6Q4glvM6o
 nAtLTLTBOYlOgxeChJKsX1OipLArLXk/vG+C4DSt8XhJ6294746BhHs8TtgJIl9kmyIk3MpWeZz
 uUm4IauuyZguMtNQgw7XSoCeE3oXqUc/n+HzzQLU6COs/chdJj0pCtqcDp0uOGS4ehUi1ibLe5w
 yRhfuEH40CI8DdQB8puLllE9chHHngAYtegoAcEZvHWH+YdTtNEXLu1NS4t0FR0dAF6iRC2JO1A
 1DvolNThJ8wE624LyuA==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a676d3b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xRDQoa3q2EOgHbFt78gA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX1JA0zeM4gP9n
 NiaOTqlHUAFkYhY396dgl/2yPEvxBodzKGa1Jd8NJ67B4ZfSWUcv9kbz5TIW638yVYpQrTGj2Nt
 pml9fkaV/aonz2Q1zUSDYs0bjOP0YmA=
X-Proofpoint-ORIG-GUID: yYSMvTuH-cELPe0NVY1ePf9VoD14rVRC
X-Proofpoint-GUID: yYSMvTuH-cELPe0NVY1ePf9VoD14rVRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270138

On 7/23/26 12:33 PM, Krishna Kurapati wrote:
> Add support for both USB controllers and their respective phys on Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
