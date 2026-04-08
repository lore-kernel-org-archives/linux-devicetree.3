Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B79396B8B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639927; cv=none; b=UFjYNyYM7AzKwfkB306QguBrnbvuVmy0tV3CoPhjYj2lgPWGyVZ8D6ltPoR4jpdcZuG5qpUJJ5KzLLz0Cg7T2mB5UvMhBgYims8yqn8ItqkUsGL90rzt/pCjPzAmfOeaqSUZNxiFYvJ10zgpdDYUeoJy2ViJLe6GPw/xeBkXuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639927; c=relaxed/simple;
	bh=rHs54eKyifg0zRf29w7NPPQaQurNzYkTJX50IBCYI/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAkJlHhFKxueYFTRcqmmM3OUqS80QMmNvU6C1rDkVV6uuBa2GPlEdeQdBZVtcsos+EYjLWqaLTZbLoC977t3qre0h5enLfOrveo4IAy9/DZYe5jp7JKV3HS+eOp4AcPTwf4wduGFfFtkiPeFmqrmcrtIJiUfy+4oKyQbzg8Zltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7rCm74s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5afp/XH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7rCm74s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5afp/XH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63838Xxc2411822
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=; b=C7rCm74sJpazlT6Q
	BRQ2xR826TS7ThDgtH7wb1JkYJLL5v7In94MlDjkHNPj/7NSEFiMaMcOuX89bD4Y
	Kl/eTZUXzOUo+1nmnPOZZVmaTF3zcIwbzz+enOSLuUTEYstNFJmxd4xnrtpUXKeN
	+P/1Ha9Zk4atp64tPOCc0BIIslMQwkCQMosBe4gd5rqaESN9Qf5fxsfRAu+6XxRF
	VdD0pkDWTvCInybbvrQAkvU4DHKjU53xCFri1aMvPgRjYrkjUNRFZ52HkClEu9Xr
	r5Ty3HeEjrV7kQgn34fF/SmP6kfpyylic0fP5Ay+8LakT/uDxeRVhutmVTFew+bA
	nTHOCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb1sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:18:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5073ed1ec6fso21297321cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639924; x=1776244724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=;
        b=j5afp/XHfS+TR1WuzSJvyHg8v4XqnwVg/WdWdv/a4WoiF2CCgxyoJAo/ftKNDDSEHE
         aR0JhUmOXt7apeC42XuSCgFEhlrisI4jwhLXsu8UJu9gK4eJlIF8I5xS958mc+8SCTe7
         8Tf6bQUyya0o/NwVtm4VEapvPQq+nsmqru1+u8sJs3cQlocEbKUxdkkBQJT7uexpC9i/
         Wz++2sAGHTVpDqWZq81F994wlKmg1iofsIxC7cUvDBtQ8xM+11DQg6+1exeT8S5dM7p+
         fnbmOn3AUPzTQgD5yRH+HzkYJIaPASO8oV3uBveNV3CZVDbhQHebNwrIeXArkEIe61MZ
         GNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639924; x=1776244724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=;
        b=KV0k5EcnpgRcr9Z0UUAsTrYg2/kozlyz6VTV/NUazBREEAHULLsixSS/yIUdBXj0cz
         KpHkDwiGeu+Ay9mcWcckp9XYLqKkGgXYuzpg7SYMeC2WeyhcUkdPFuTl/qs3bY/6jCai
         d3OHi9dF782BrxP96lQfqeZH0CGF6JG6sUMfscT0VUnpawMUFU+h/Tz4UczI4ThgQcCD
         Y44F8Rs8IkoIKZbCJa3GXu73Jkd8OYtUc5ywdvu95FkzkjDFoJkLndWr07n4szMn8twB
         AKqHhPND7zKTF6gCHImesGoIur3wB68uMh9gqfOE61faVMGzoNpSwdnttW1wvzpffwup
         Za1w==
X-Forwarded-Encrypted: i=1; AJvYcCXLmgNfCpxT925H7L5G3ZKPP0ekrpp9NLM2TIsyYmz0eJiIs7IZsoKKahS09zjbELzN86D4OP/ZadDP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqekd6I8Buk8p13xjNB/JbGoseOL58r5QjTV3pUgjVbgs4extX
	G4CSiBOozYrsrry4vVbfuz6RwPOjTiJqK8s9KFC2HWzAnTq3uEHACpIDJ2pwop8zqSMkxVBM/et
	wZi0bwxb/SxaqWyfaEV+bSGjTcl46MWT6ci46xUHIytm+9we51+A/P7xtfl3hV4bx
X-Gm-Gg: AeBDietcdk/FSaIaakYqkbDU+7VkXQWHU9B/2O48VQPL9kAqYrfhmw9W8BC285pkDBx
	+RG8BA9uo0xUF7lpWqVGvNX4itjvau7nRNzINPVx+0pz1nObUVwi3cHA2WintutnRYOAllvMh9D
	R+jJFSW/ZBq+Evh0HzK+iVHDLuHSEKrFmVNYuesIz3rND7zFxLtd2jTyCgrnrB6MN19oSkG8Puy
	j+Gbac9zX+P/+I2L906e5arFa/8QbI8ApjGpnC3T8ejr2Ds0CkusCcOA+q6b/tea4FyagdowElR
	/6IDxbyirqynzM1vOcs7UiopsolFN6/sYHC1vDewlT/1WRwBI9iP4okGJYhWnPk0LALgdCPzNX4
	s68eB8OLeUVjaL1Q7T3fJTbItRNj+RXAsDX8L/ftTKM3SWNLrf1Aiay9PNsWYBFoc+WnWVuI30q
	4wIkQ=
X-Received: by 2002:ac8:5d10:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50d62d4a14amr214065471cf.8.1775639923878;
        Wed, 08 Apr 2026 02:18:43 -0700 (PDT)
X-Received: by 2002:ac8:5d10:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50d62d4a14amr214065171cf.8.1775639923394;
        Wed, 08 Apr 2026 02:18:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cfef4f9sm615267366b.45.2026.04.08.02.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:18:42 -0700 (PDT)
Message-ID: <6e248bd3-1692-453c-9012-cee1bf1cbb8d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:18:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfXwA5MRMEkeaux
 Eb76ZI+WXCbqEyJkls8OR2MyyOcmTJL6eNsI4Du6yWwRnsHt9jXQG3s59vkFxo3+lrLObJbFOEE
 mq32E+t0d9QFJKspPUAyg1SJaBp+aLf+Z2WqVOmzYli8LW5Lj4sdif45ebkZef7rhsY23Rbdg2C
 NZ5QJ9+CIMlq9YKWNcfXpj94R5Kfqm/hf8Txp85dTqa2m+xolrzkIQT1v/GIyXoIx2S6eUPxo5N
 EWfVaeg4LdLfN35ERDmHbtt3dSgnTJf97tkK767rRcYuSasIY345GFbdsCprfHYKXVmOQct4+rg
 p2yc4Ki7KtrVE5L8xQhr4lNhYbEbKCjzcHIphi+TkponYZHhwqh1lGRUjYkHGk/kQF5KnN6Ofgr
 Vw2ZZocL9S98Prr9cggng48rPPYNJJXnrSVPIsXs91U7fIkjgNSAieA2/0yC1Wl43UqqOa8gGIU
 uY1ghTOhZUpcpqdRIxw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d61d74 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nywFluPYp3eM6NWqt-DQEKmYAE3SJqyP
X-Proofpoint-GUID: nywFluPYp3eM6NWqt-DQEKmYAE3SJqyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080082

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add the nodes to describe the GPU SMMU node.
> 
> Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
