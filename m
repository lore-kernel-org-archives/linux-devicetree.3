Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476891;
	b=KTSjhtttJo7xY9I/3V3V7TaA6MdyzT3owjKonHM7hPqJcXLEZzycBT9sVWoSAP5A8jkl
	 nmO6Uj1RwvbiaPaAqQd7aBmKVc+Zzcv/6OTKaDf0SE6o4bN3nVbqJ7drk7vNNsMfMnPx5
	 A/SW+MPTb//Ia8yQYBvSOgCCsF651g+LpTl0+0qxh39FgiTSba9YAja2GMvNDeqJGN1Og
	 l5wJ0AD0JVhyLYqSE1UypJOqq8REyI9tQ47eVchvq3bZEIb1K1PGD977p2ewwMfiJPc6R
	 Q2ajwZ42wclq3MKy8X/3kXPMLSZkl59kGXHV6459G3HXTKAe/0kIXDSDJU735Ixm6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
	b=pIWvEWT6QtrpVhcOSF8JWZUEfiLH/tBjSee+laXFAQfSVCybBud58H9spd3vkKCVgYav
	 EoNYffB2lJO9H700C4W4ocLMrfkuP/To4FoP9Fng/7B4uhBU7QvNme4olU7s6vhKfyoXT
	 aMGOkJj/C0wera0hMG03R09HTQ2F74tPWXh7DYJADyuAy6mxZUhdJnFOjkU0OuZryKM3k
	 p6JR8NAC8AO1fSEq32j3++yvEtqFprsKpPMyczebHBfXp0ppRIkLbgNPH65s5KEJhRFGN
	 P6KmWEZPkV21LQpYVmRF4J8UwN79cWcMk/oXt+lx9XwFhx0OLaet80bMkBO4d1ItT5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D12606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D12606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9UUoP903603
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=; b=lEYzziPz3E3wXE1N
	/r8Q21KLI0GSOoZbw37IOQi+XRe64yyHxO4KJMKXyD6wHBr3+uN2A2DqG1aZFVCb
	td0orAtjRp1dC4j/KyPqG5d96q5y7vKMm2BKTOKsdt1dlyUwp24z+1cEnebHmiba
	lsmQibx194c8rA9m2TXh3aOD9i7AI6KxyLK00WTHqjhvlhD4uAN/bB+W+ouD9DVf
	YFu1UNcSm+Up02WumBc+r6ikblrY5kMlzpu37riEDvTPfzmaBSpLyb+pCef3TTpE
	LJnjDCjjnF+Cz0U9C2aBPvT6jwMkRiiKlKn3l4dQXbHdnu8pkdbQTpnhKR5UBEBO
	sdPQmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uc14b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:48:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so3021109a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476889; x=1795081689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=SMUX5PHiPlllflKY7kQ+2P9BqTBM8JJeGTnpynpIy/4plAaNsF9TwoyqL+XvBHRNj+
         28svPS5oCN0pYbZA7x5hSysZQMu+UYrqCrNUicl/buFa1Z7UJXCoBF5sOU6RSLWxI9L9
         wSeyFn0+ZOXTsQ+mjijgiyzR1WJWms0FgCpxIuMmQqVK2rnDepNvdRziSsSjiw34+Y+Z
         bitq/ytWh3roml150G/yxbKueOVgPUT4rDxYc6yPqhrIHs5qxBGtuDBZdHb51PW9CUf1
         vrZrVpviKZ1hCLEHQG8orisSNVPsP55dNBv6Idx+DNUXaNHPPiMo57t8aUG/Sa/kbmKj
         G+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476889; x=1795081689;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=C+rMoPOimT8odQqXKZ60nVEfFL1+4JF371BPULw2h3G9MUApI+W0MGafCBMv+/PuWe
         TgvRaSdDMTrfpOiu+PVGSX0zN5Pi1m714o3gLNHDEdrNiZdff36jbCCYSRHaIWVX6Tcq
         EsztZz3DyRNSC7XNxnk7qzQP4XiDp+EMF+nz2eiocVEwlduXhTrGFskQlfF0f5cwC6C8
         bAuGcdWthR1J0HpFevmD2GoyTybJ8x6XsajN3zlT7uuJJIuFmpS77NZFrFgyuDtbAdI0
         LEjPMI123M4aTf2GHY84foQPYbEJ9BXWsLZrzps58sg0b79kx/YcoQHqxKqvVa7lqpkt
         XeLQ==
X-Forwarded-Encrypted: i=1; AL+hErHSpg/ab/6Z9tWc7v6eeOPMfjHnGHMqj6DFLULp3GJXSqNUjiJ3fnLRpzJMR5qHFiFmGHjh55TuusxU@vger.kernel.org
X-Gm-Message-State: APuU4Z+h71/OMp1dkHeMRactTTP7eTmXAMTvn0Y5gzOfLpLUknhI6XD/
	MJlt4aHa1VnTyZq56gJx7mk56B01iZSypyLtXZdsPPChn4NjLMFn+XkKUnWOSjnY3w1qEfwERVV
	/gIfJTffFOXQHqlp7/QT1fezPeOopJ2jsjflAMAZr7ciQXhKgwy1pr7qCZwfG52dq
X-Gm-Gg: AYBFou3b2inSrHJ5FoNIGJyIuoeJGIrE/hwl2JC+nvc8K4Y80wJLsg0dqDanD8jTbo8
	YyPtLc3grc+uY2djAYJouhkVM4ZmjldWg8lfw3cAva6Nm21qhABgz2p6EmHr7mWdpb1/nlhSRvN
	FiGZxZWZBWMcUrvnsm/V8tsTz2ZgEz2reNv3lJGUQYf5tojtBBueCfpZ0duQLDX1/Z9yX/Udqmf
	9cvum1G5oQSC9GL13gbAyxCNJv7dyB+zZqRjgj43B0Xgxpf+e/0dLG/tW3ZwM6IlGpsp43wc+TZ
	20xLVILdID+HbNQkKE31GZfA+IHdVza3P632AP4X6THUYl/f7LDRi1yPZm/TEx7gGZnQ2DQSF0P
	+6JFOTToU6oMHSY6kBmw9oi/ftARWLOqxWIGaYW7mD23mfqU/4S/w/x9LyA8qOa0mfhMrk/nqO1
	XX2afDMJQ=
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003614a91.12.1794476888778;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003594a91.12.1794476888303;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm3913394a91.10.2026.11.12.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:48:07 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2932200c-d930-4d5f-a308-0bde202af349@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:17:55 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
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
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
 <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Language: en-US
In-Reply-To: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfXyjtoC/kXpOCY
 Z98X4lLHFcyGF/j4VNZjYWmNrlnmEI9Q3BNRfNhlnZ03eA8tV+C+20vUYw7jJ0f/Z3fSwlrzW+I
 VYK4aRQVCkKG9gw6gblUTTHbC5sqyvI=
X-Proofpoint-GUID: gisvb2rxkKBJHTdrixrn_W-_ud45FfmS
X-Proofpoint-ORIG-GUID: gisvb2rxkKBJHTdrixrn_W-_ud45FfmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfXy7ZbvW9y6hOW
 ScpmpmI0lpKwXTUiGPPr1e5bTPkDnP65DDYz+7QSGeGZkYNakPYzeiXE1mgPJatAJQv+e0zpUrz
 B/UWtSk4KX8p31OFYjW/FetvnWc9LII/Al7Wna6NXLWDvF+ruYuzlQ/oRN29ZmhfNQWxmh7k0lp
 Hddr8XR9pOGnvclWaY11rCpW470iCFvxc+oaFhr+MocVS7l7tj7lLTLGx3NEMbcmt3di//GeWv5
 MB00H6MB3JkQG5x7TPXxRAKcC7xZIYrf9QnR7QCcsk8U9Qk40OuIjKYCcrO6fddc+OVOtFW+tL7
 0jmM55cPHgagDX4KvJ8j2KbdR6j1ql5KKiCf2p+Du2L56NJLS71Ozf1zBMg2z0KD/uSpDlos3Ec
 ZqsfhSsKXPVTB8wK06SG0uTrzUFwgbhuXvihzjwXWhoYeLAtLNBMtzibYF7AoYI4ZKvsmakLKEK
 01NYIxquXxNVolPIVGw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af58b59 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8VBehk7qD7xQtsfHT0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120038


On 11-11-2026 19:43, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
>> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
>>> On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
>>>> DCP platforms place the display pipeline under firmware control, so Linux
>>>> cannot discover display resources through direct register access. The DRM
>>>> driver therefore needs device-tree descriptions of the Qualcomm transport
>>>> wrapper, display topology, IOMMU contexts, and panel connections.
>>>>
>>>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>>>> subsystem. Document the IPCC power-notify resources, transport and
>>>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>>>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>>>> after the IPCC power-notify sequence has completed.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>>>    .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>>>    .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>>>    3 files changed, 334 insertions(+)
>>>>
>
>
>>>> +
>>>> +patternProperties:
>>>> +  "^dsi@[0-9a-f]+$":
>>>> +    $ref: qcom,dcp-dsi.yaml#
>>> When adding DP support, would you add more devices at the same level? If
>>> so, we risk getting a warning about multiple devices using the same
>>> address.
>>>
>> Is it good to model each firmware INTF as a single interface@N node carrying
>> the INTF reg, with the protocol-specific DSI or DP description nested
>> beneath it?
>> The driver can then obtain the INTF index from the common parent, avoiding
>> duplicate addresses across protocol types.
> Yes, it might be good, but it's not what is happening here. You are
> adding dsi@0, although, I guess, INTF is 1.
>

I raised that approach before v3, but the patch still uses dsi@0 
directly. I’ll update it to use a common interface@N node keyed by the 
INTF index, with the protocol-specific DSI/DP description nested beneath it.


