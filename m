Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3DB38E8A2
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973828; cv=none; b=Rez4yngh/RdJEecoIj2G2xtmj/g0NOZJG1rGsgUjq5C8OW56uKiXYxW3Ccuo2yvYaS11ywLK6twg6SAWDWm487EL3uEsEIlwNa8c/8vSzhQJkP6VlVf8goTtVSd4O3YtFtEumAcZWwcEotWKIUb9ABmlbpvHbKRXp8Q1SNCcAPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973828; c=relaxed/simple;
	bh=IRx8xDyN/OjDmwwkWIy6dTNITK7bGU2ZsXB+cADTgWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW1un8pdPgQyUCKAH1YjrqeTBp8lpvOWGsPeykGsqvIZRmJdr1MmWOC7+ZWZcl2Yc4KRt5Hgs3zDITUeYxB6mZNvAbUZuwpepkltJ832z1m38KvErpepD0Q9vXqc4amGNqDysfuv2Wf+dWfyZ71z+V9gRKJrL5vc6v03bd1PdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGHpVfrU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVPeyhar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGHpVfrU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVPeyhar"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZAoP993534
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxxN/THrSyRW5wXS4Y0iUrjV5rVX5I/Bsxrc5z1M8nw=; b=BGHpVfrUtTxhFFtp
	4B27Q2Ji+0WJwK/KVGNyE2Gzik2MkkhFo472YSf1+Ykrv7g1LqSbw9yhzRixDJL5
	NQXACOg54oXeU37fMrFlE0vhB5MVBdyeX9qxDZytw8cvKjgvP2T5D9L2vziWdBP9
	nyquOaTjq591p2UxjCdD3LOjW9RitYDhY3hy9lHi06VcBL3pbHt5lawtD7DB1oIN
	YybbmHWpnPEn1UYG7EteILBzC05Zf0ui4myHZnS5Smbqrb0mDNuNwUWVTZqwHZp2
	Q4MqaqoWhOJOLc7aDWGaQGIKuzlK+gkLzpbGHJCwkuiDejNomLRaGuDzKD8j5ZSc
	vIyyPQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v92c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:57:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1684122a12.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973826; x=1790578626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxxN/THrSyRW5wXS4Y0iUrjV5rVX5I/Bsxrc5z1M8nw=;
        b=XVPeyharNq6VDkmidor9HmtUeYijjgVEt/xpthaM530h3yz6cl4k6+syylA4dICye5
         3L/HixqE+5wrTCRgeN8U0I14GP/ZU8xlcOnQT2mV2vsGovhRUNfA+tuHuDNawTY8C7Ar
         zyM4tcWZI4aykRZ+POUTx6lT34cR5Y7RsqG5Furi/GB46f8OVnlFb6dylnMJOzonCOWE
         oIOugZYg8fufNVi26X5pqUUTzkae08mjoh6CuQFaEZ/qftxrYR/NraRNmR9o6lCJ3R+i
         1aE3wSABRd33El5NxG9j1vWYnTSOc0iHcXa0fZwqpsr1PEim0RFQuSGig3lqEiaUANaG
         nlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973826; x=1790578626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxxN/THrSyRW5wXS4Y0iUrjV5rVX5I/Bsxrc5z1M8nw=;
        b=yNdZpztzaMJTBQkTmKjl/pegA8SxKdnh3DdCAnUvB4W0g4pvtYs/8ekTltGAO7wBmo
         LyZRmxAdnPrEl0O+EjKs2MSZ/WrqiywOON41Mo3pJr6EytTu2CxTC2v+MRAK0xKkhqZs
         K71nEgS0hlihPG8WfgJ4C5bxjcayY4rqSCcPS1KsadXDfFyCMi/7AiG5NX6I0h5ZLnQn
         4SlmJkadMBNZ7kg5fizXfjnX+IHxSJAu0pDNuKwbkFyM3vwjhYrRHXtO1OLkqv0epnHS
         iDFZXQrK1GIHBjesCQbQl+a8XF60+ZxnwfCjCLhvoyUSB8K4Plco4G4G5/L66DEbDEyu
         Xptg==
X-Forwarded-Encrypted: i=1; AKwUvBwTLeTj9xRFl00SdRWnJ/n9nIi8vHKv0vEoxbudzjEdbsJLf+4nAlwBqLf4vy3Cq8HNvrLkxS5+j4hf@vger.kernel.org
X-Gm-Message-State: AFuF++lGSvU3MDzm3/UYU+dE/W42lXBC2S55lHQ3rhbHcTQFu/kLNw7C
	FKLu4cgPBoCh+Rwwucak8Tt+Q4VsRHxOlYDYrh2V1i/MYeevt6BvIP7OuJMPdhL1N0k299YgNDv
	CHz1HzZjZwHaPugZ6ws2AquQLD2DXGFTdgXQNvjDAC7IXi14sDNDV0J+xkxhyizW+
X-Gm-Gg: AYBFou2fHc/oGj+WXhQQTwk8cX/m6+kl28gRqwa0RMrXHhtD2FcVRMGftvA4Refj+Y6
	IDZDViex2yYIOVpkKgT4w3dHUdKJxCnJ7FNvliseu/7tKMIq2jynvZlrYfjeeNjYb+o7BDzEfQJ
	MZiTMbV5VX2DsE2imyj9r3Gtk0lb9tmXwtczsNEPvTf95XRTuyvnS02APDF2oRt+byZfuy18xkV
	HIUa+oyKNCQ6/SYV3LgFTU5Gkm4pS/1kLZrez6+3BiTIfSFLdlugTaulIZvOSLDSsxAlIYwV/pe
	IgMdwL3TtIGme7hX2huWvMA7tayk1WmTibpf5YKSn3hhbgJs87q5/EHL2QK4kd+7yUY0p9ApVNs
	kiNyImk+bnLT5kx9gXweFqGS/YOmv5w==
X-Received: by 2002:a05:6a21:e0a2:b0:3dd:a196:9074 with SMTP id adf61e73a8af0-3dda196a6a2mr8758758637.62.1789973826132;
        Sun, 20 Sep 2026 23:57:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a2:b0:3dd:a196:9074 with SMTP id adf61e73a8af0-3dda196a6a2mr8758747637.62.1789973825773;
        Sun, 20 Sep 2026 23:57:05 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.232.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33186490sm14551450eec.18.2026.09.20.23.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 23:57:05 -0700 (PDT)
Message-ID: <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:26:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
 <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0d542 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=u/G8viX4uCBxjZ048G+IxQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JS77pFG_HBBnnPoPU-kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Pk_x49z_GUKKNL-7gs_hcoVmLpGhP2iU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5OCBTYWx0ZWRfX/gYS1cuQl+tl
 4tucnMNB5jmVo7B62aDQt0/D63fZtvniWWxHElWjqRhvKIsUjr+Z2RYuZP06dNs39/DhtyiSYGM
 031WlF8tNjlH5eXKcWj96VitK6d3SLs=
X-Proofpoint-GUID: Pk_x49z_GUKKNL-7gs_hcoVmLpGhP2iU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5OCBTYWx0ZWRfXy8rMDiBTH7wS
 mNvt2dgWpjspPTq4J7rSD4/swi1D1D8DBSq6O3bsX73tpgnlkJucTip2N8uT1cBPrEMzfJdE4I9
 CcnCYMWL/tWbeR8Eknui7jRcJk2T8zPkT2VXyMu2TN1cIKZzN4v46HDsik09lBxOhe4MB6ww/kV
 U+s8tah7LVoUUNIiCStumVOJ0QMTXQcEu27YuBhUq5sBtFrW2ckxZiYMi3siwqN12CTd/xHxu11
 FrfYs5Lv0mbC3gPZWNVgThyS+47MRswsXvCZipJGrxAXtnf4wHa1WokZNd3iPhFRqcDLiFkweUr
 Hh9ZUBVuHDKjJWjzQotrJxFA2vvRN4h9bHJGJbd3qcmHXjDrD2eaX3tt6U37+TWscHGSS670r1q
 j3XosHB+ucv/guy32LKLoBIi6zV5XmXA8M1rRMwfkshDITJ5bz2xKX6ctVNB0qxIH7fXuOPfAXw
 VNUXpT6EdIQ48t1noPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210098


On 9/14/2026 4:59 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
>> Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Does it use ref clock?

Yes, it is using the ref clock.

[PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem nodes - 
Shawn Guo 
<https://lore.kernel.org/all/20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com/>

>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> index 0bf8bf4f66ac..91d7a5c8e19a 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
>> @@ -19,6 +19,7 @@ properties:
>>       oneOf:
>>         - enum:
>>             - qcom,glymur-dp-phy
>> +          - qcom,nord-dp-phy
>>             - qcom,sa8775p-edp-phy
>>             - qcom,sc7280-edp-phy
>>             - qcom,sc8180x-edp-phy
>>
>> -- 
>> 2.34.1
>>
