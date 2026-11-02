Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620164;
	b=UNEAEvABiChn/iX8tdUoASwnirx7xeIewmSWPeFbCiBB1PkOQ1PeIodJ5X7rTPxJahBa
	 g6P86K9Wr86ifEjwegZMvDvLvajk2gdV81hRP0rpKaJXevSZzqluWznaL8SSmfJH2ga26
	 UdngDDGTbBPQ5ABYZZD9kSlvUG9sOEDJ8FcGHynigSMNI+Vm8ceh/Swg+P9YKUjNC1/8v
	 angFwzZZAg8K0QUqGRV0kiRKMpGxFqY7MD+iygN1sbDpPOw6is1oxGsfOpsCVKBttm+RD
	 XTk2XV6AACC0nfBc4552kfw4Zj4Cb6Y2LycdF3BoE/9lVDuun4mUUA5OKQeW45oWdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
	b=K+mktCxPPuHHRSbKAgg3qACehmoBC5XNsz3QSFz7pjwsLtyQeTZVhYHCtbM4A0BvRUVC
	 5qOwgy7KSXBNz+LmlCupaJp+SUhwWNSwY/RYGx6rm7FKDd5FgIUwX8pOCoVZV4Bcr8Pnq
	 surt+VVDAa+omKVCwDRod1Sfdaa4MnQpe5V45pHxOXSWFUoNHQAZSbh+BMOVRg2YMwgQt
	 QOTWbVdXUgujIfJs2GfS9guzozz/nGhkv2hIaCZ8sSiKgvItBj+aSHvUqjEPiZnwOE8z9
	 NDoKU62jJjjc4wj8fvkKPF28dkGurks7E6dZMX1KYlS56Vv2vMu3E4PDT90RWbL/6hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcOIexe4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8860A2617
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A8860A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcOIexe4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6Pp2466622
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=; b=ofHmSgH9FKVoN6FP
	EZvtNVxIU+jc/kRrs1G26S5RN6Why14/9JolC2Eor5INtH3BV/IbexYikxiRnU0Y
	NBSn3RfePJCK0O8GLANKGocGJGWunwRYbna3uGmmQ2q/wtd/f7PGkOAM2+9F2frW
	of3Wu2rGREhEFuK+xehUq/u0NvHbwEaqN2GG6hrC9HY0Oe+SV9+kIzIWrU+onxiI
	xuC9P2/Ei6M2W6CEl6i2wfwgLIqMF0KyWH5Af1h7oFcaD7KhYCdedKfb0Iq+b6uf
	Gyt6a1sTqqhZ1qUadaKuk7yKlDHZIcIsLNBeOddysolN07KN2+GxL4lw5seOGw7O
	xvV9iw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhmfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:49:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c83481504so5781176d6.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620163; x=1794224963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=bcOIexe44hxN6grNco9heXNTgG7ByoSiJ1AbhpojTN7jVlOV0ZZOo7gOOk+D90TYo0
         /WHKnJ+4cd/zy4JE/wthJnTzlRJ9uipU+bnMOWXlnfxI4e+i+D3JFtzT5e/vcV1PFu48
         r8Wpwb6jn1YHbELgaYcgtEPy/kpn77IFToowBKasCkiVR8Cu0tDjiLPlqo1aPq5uW3pO
         wQ3CXIRelWW32rypfu2uRpxVvxOfDCz7JMR1WDlmpdu852SwwxxqXOudtLc8WCWkVGEH
         /mNNNyFvphGXjb5mU0JmK8KPJLZF4m1TGjHm9cI6o3airQMypDkiYEyWHE6GQV98LvHl
         JMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620163; x=1794224963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=egoP8BbGGVAwgJTji/d+NZh18XZkIX1pMf+7ReCiJgni3Pc6QuO++IgjcDNxXiGK68
         jxYwuqKwxcBYV08+/H3Duc444IVtLMDQnYcXmbbDyd+NOi1bWlW7Oo7/bSHbgC6FAHP+
         6THNaLcxXY8vrSUKqFXXf68lcpYKR5pinpR0DBIge7/TPJLR7o3lCh1Lk4//4414JQ9t
         Xq0LjoDs9D3EgGwAo58+Ywoxf/GM3ElhMHe9dbkFQHhLY0zsAxpO1E2nxlDLTjo5OPn2
         Kr1mxH3/10t6UvLJFIEKFdUeJvQ1OakHGyu0U2wG4I1GAO+VVFTEV18jePzPBvJZvvyl
         eKsw==
X-Forwarded-Encrypted: i=1; AKwUvBxC7PaSD3QuX55h9bNQpvjzlzQOSeXvDFfC1h8jcnDS2MRg75HSbS2rDmtScQoRF9pWpqoaPz0WlppW@vger.kernel.org
X-Gm-Message-State: AFq9FYITdVgfsAKpiIgd9VwihmusInrEqc5VR4J4CDbO4sOkLQH334+7
	VRGqUn0ps4pGdSNteR08xN0GpXYlgc22dD+4F5CaTDVVlQHJLcS1XaU8sf6AIkzddYbdst5Z47n
	UWbtrWBR6WxaMjmkk/3ObJxi5FsoiuMDdN0NOvWr80dS6/wTACY47TY0tIek3Wx4d
X-Gm-Gg: AYBFou0OvMEXpehYTfkSogAxhyhwaqERr2BkI6aI78qBW+rtHX6U51B9/0uAyH264AU
	c3EtqPnuzREKo+OsuUQCE19CwCkrW8T751kf8LPeCJLK8R9nBFm5iW532tbbxUDd8hXq/Q/5+Cb
	oK+BT3mxJkWiPz7N7d3bvyNCkhahmJHRpneTx5R0/jBgRTY5u4DyAyeyk0qcfZTqrAlPRJ4HFdC
	GKRA+OA1/cQ9MLjwmCT7vcLHfwBWNEk8Uj7U88Yk33EaIzKPgiB8zi2j1zvILxmRcP+wbseUYnL
	RmO2W4Lxtuts4l4nHH+c01XLYSZhDMLwS71kYag+FHKmC6pd9Dy926Y8XHHe3N9XZGXLwTj1zYF
	oo2YQv3lsCN/h2XEyCww88O3J1GF6B3pZxg40gz38ks4prJMmZRmi08+PGbgchtLM6fW8vms=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795218185a.3.1793620160660;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795215085a.3.1793620160155;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3301742a12.26.2026.11.02.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <d6126285-97b7-4424-a644-23828d58cd82@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:49:14 +0100
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
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: Add SM7250 MDSS
To: Krzysztof Kozlowski <krzk@kernel.org>, Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-3-159f403ec405@brar.si>
 <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5e8evp9AuZHCHHpc7EoXa_84I18yO8pU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXyMi/RJTF8cCO
 E+LwGu/WfQfEPtafaTrpQkoKaVyeW6uw5dgbDZphIY3ernpQVmHJnDBKLZSxfIBo4hvyxUm3+2d
 agDPwYHDvbyfjxDRNjIE4du4ohTgDGThTptSI5y51gGN6cGxU6R1xaHIZyZU+/9L6baqtkCxxaF
 r19ieMQVItowXXiL31rGbCDaU9syvc4Fz0WXnOYXuKJZ/uWEUQ8Pm47lNW03rM51jOfOoLVM2eD
 KSwqiG/910Q1+ymxPtE6pxDrjXX5HaWBNV3ratqae33b4u+LND3D5j15tTpYfcwQHLqiSo4iP25
 5OzON7zJUfgJT/dd07imGTbBvXhQeqcfuCjmQR+ptuYAfufNq/xFvZxP2G+rzXQ30P9VR7kXYD3
 rKpLg8fMqDXIX6d42Ibj8WAYspDbBcoH+rMdoEdphuKck4ZGpyu/cf3YdMxU1yT4/RgibJ1WFgy
 goEkA0sLJiB9F8teAvw==
X-Proofpoint-GUID: 5e8evp9AuZHCHHpc7EoXa_84I18yO8pU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX7f/TjdKXnDHM
 4AeFgJh4ltINHZ1ISPHuln0etNUcDM4zgCT0hUb4BzQAnQVqhc+C9a7xk4HG24TIoSx7O+vouhV
 3kDsud5ofNYMBqjZl2dqECOCabn4Chg=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae878c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ujgWmTuqKpTCez_IP1MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 11/2/26 12:35 PM, Krzysztof Kozlowski wrote:
> On Sat, Oct 31, 2026 at 01:23:39PM +0530, Ishu Brar wrote:
>> Add the binding for the SM7250 Mobile Display Subsystem. It has the
>> same clocks and children as the SM8250 one, so it is modeled on
>> qcom,sm8250-mdss.yaml. The example uses the SM8250 clock and
> 
> No DisplayPort?

FWIW This SoC has a single DP controller

Konrad
