Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34BA27FD6D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864560; cv=none; b=EKuGO8Ee4Yex7lA+l9vcS9L9neenN6utCCDodw8iIyZ+CVXNW8BmML4q+lHhBpzZIVmpCi7D+whtL1Ad3D9dkMibmr/UjYz326SIJpRE9uAw8/Q13HPCE4UqqV2CVkbvilYQjGHYk2TTMIoT6LQkkVCNBSTAaHfbNMIzPDnP5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864560; c=relaxed/simple;
	bh=zChUuesQPPZ9Cnt7BEFeTnXGNo0HHH7PtLm790I6UHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+8Ael81MjgwXtH8tNgb5uJu2Gp2H0obP4RhaJBE5RmoOWtM375OzW3Zf2DCC8FXF338dVZQzz+EsHb+9W+JBEoj0LqNMJ1RHx0QAbHrvlktOSUvWgoYNgi19dSfopY2GYxaev6q/7ANODiZ7Lduju/Pgy1mUueeX++vUsBY+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7TrfrOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaM28+17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7TrfrOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaM28+17"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4dnYD581611
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=; b=N7TrfrOcqlxzG0mu
	AmYq6rvIioRQ+E6RYjrOAHN6xc/rqAwUKrkFgHBUY1pFv6UFWCITRQWkYg4ZGHg5
	MUiwpf70jdqLNpjsWyOVQEvIouqLPRk9PDYsfbUrTovxQbhA6i+xt3OIBVCObTYW
	FTsHvgB8J0XtLZC2X5ZzZiivCdqZJzQ9T/EFECAFwR4f1wddTRxaANiQoywYa1Cl
	N7/VSGR5GGyScdLnpku2gjvmGCpFn4M9uLhJxGOoGWiBMAHemHanSWU1Kmd2Bhch
	5W5h5R3NhjrAeENJJjNEYDeOiEbWoommKyPvXbOazsBgxJoxgQyv8nQBZRiybG3B
	4F4x+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnqr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:55:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8ea43d4eso101450785a.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864558; x=1775469358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=;
        b=LaM28+17/ywDqfuplSn6BL762LN0tMlVKE5IVCBLlEQs7vcYPvTXYmnIxeYWWGSKIT
         OZm7haRLopdh5NmykdKR4nkHu6O6pVC3jWFxSa8gj+xZQ5b8upQ9DytbGBqDrbbywnYQ
         vaxtN54UtqUd1PHgpH18ZsGu13KNaHwzVwBls/fO0G4OWJ0epVdjK2ImnQPPb+aftrw5
         hY8kAM3n8UZiwOOeVAvVqd+mY5llcErd/vmb06feR89QapXmiTi3gNQ0nnKR9lv3S9v1
         ZjcTVL9veaujm9wK5h0dtAY0jdnod43saw8m+1H1o+S6vO9m61b/Oxqb74DONdRlMrma
         OB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864558; x=1775469358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=;
        b=gqJfpjNt/QzoZ5GLupIpRusCpq91fFpzbge0XeyBYX3jMDLM7wgThy3e1OXzFSSUb1
         j5pyKWz8rVo1lRG2ThzFrb+pFzZ+aJ1CDhYYC6OitXeTtnwHED6Zo7YVnDNOXxs2Jkjz
         MqRWyzkep7uvlyqz2PEdypSdgsMWb+I2OE7zgBkLXgW7BVWfstqfeRr6jH+EZ1Qr9nCj
         NZBRQ913KW8OFGrulHaEY6c51vBn+3T6fvzKKcrQ6OovPUqzWFl4KZbZzg/jIcMZqBhv
         1lhEZQVDS5wfwzxAEOR3zuOKQqKeMhxAvWu8pS8y4cisa6sblC1mxYLWQGrQDDgSt05I
         QNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfetGCb11V4yzDg16BmKw2sjAle/MXTefkG4axqA04Oe0XoWd/GB1StBbnx+bpM3PtXuLWzj80KhbR@vger.kernel.org
X-Gm-Message-State: AOJu0YykhHcy8HpU724NxPeSh0M2EpCkc9bK7TvAiYeiRZcFDW95BMzh
	cEFwtWNrfaCx0KPAEv1frTgud/LJbMMoKnw7yJIgXleNYQpW55eYeF3bbx1Kv6YojhsQmagiI7h
	LWCSKb5oHo+qOMlGGHJdz3ZjsKv3rcWNAjvCs1BDnsZjYwIvlqpYhvJjZmy+SV/uw
X-Gm-Gg: ATEYQzwZ/QrjC9V7jiyKMHpfZIahEOI5QrIdWYyV9X2Mh8x1NWd/I6n04Aets7lAdqY
	bkjZDPOVq4J/F67HteJ69Sz8W9MHJ8sUfUIRvTSEGwfI4cezoi/1ZNdhpNHsbwUgkdXgGQJ2UnP
	dEE7Bx2MpgyzT+beG3cZiOwfo/Q0r1fCkJQ62gTawcLNVjkZAQr1F8F/xuisCL+5beFHf3AXH2a
	Xzvd1GzWD7qiYnCK1dQe6NJiZmXc4ZmGdMNouVMkGZdl7lvHjyJ4NdZBNPjf8oYZKA2v8Zn+2HC
	68DbR8Ob7OfPXUmvKbjmgeJ9BsdT6IId4B4SevQimpIiGvg+7vBnPgRCSecXHE2A4wFN6Yb9hfx
	s7Jauf44NF+/N2Hq6RMFfVccyoDI4a6I98bNzwf3mZq1KEEktole7M5zGfscJjBxeGyfwCGUJ3a
	qloE4=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr116889101cf.8.1774864557946;
        Mon, 30 Mar 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr116888971cf.8.1774864557560;
        Mon, 30 Mar 2026 02:55:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae256bbsm265895766b.3.2026.03.30.02.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:55:56 -0700 (PDT)
Message-ID: <2edf563e-ee32-4ecc-b912-d0a19b8e5d67@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:55:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: milos: Add display (MDSS)
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-9-bc586683f5ca@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-milos-mdss-v2-9-bc586683f5ca@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aZnYgw1tOF4EuSvdP7tAKHUD5nQd-_DA
X-Proofpoint-GUID: aZnYgw1tOF4EuSvdP7tAKHUD5nQd-_DA
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca48ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfXyi0sS7MBirFs
 RaXE3/DCEcLit5FR/0slsCHlnkITJktAaMLPozQOyGDixjPk82FLAUTxK5sDQ6WNAkaojNDMen/
 7EX+Z7I+lRGe6NAtHVsSx9cv3WbTlnHHIgPkuOusb7GFTcu1hK+Fa1XilMNic4ka/7IbC6ifdXB
 zIxUQmBnjOp8LdOiFuIGbBNxTOVv4hss7kwohRImgAhD4l9NqGdeutijnxEER4QIkSLPa9ycRgs
 AyVyZmqxdAl4WdY1YIj1vwkdnHdXR85dpx8mzqvYE/P0run4iEy3JnokCUQKneCjHmrFtQqBuBW
 e3xbpF4EAw0+AiTow0jn0tgGgrF8M5R+xcp+h58zck4qi/JvgCFT7xe8OXVd6pLZoyqJe2nQxhj
 7z8Phon9BL1yLNqI5qmr/Od+XEpxvjNk4v9wtRJw0ia78NBHvbg6hsvMB6I59GBTRE22qowXqpn
 Ks5L1lgUu3mMqlBx/bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077

On 3/27/26 5:12 PM, Luca Weiss wrote:
> Add device nodes for display: MDSS, DPU, DSI and DSI PHY.
> 
> DisplayPort is not added for now.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
