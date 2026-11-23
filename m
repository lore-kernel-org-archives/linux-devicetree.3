Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460792;
	b=0F2oth0GKTsDYDh6RUvRSzU/qsRD5Y9PH1Y21LKCXxoiYwvvKah0YBE38olrFShgC1Pu
	 2RIEVB4Kd/6cMCB4Xz884TO+uUY0f3LCyn43ktRgfE4w/CjOFY7ti6MUt7bnb83CieTYS
	 66NxxkvYC3a7k5/zbQiOM/7dCxHL+aONBQb3f28sWHNQ+U98inwagX38AGIhazEcyLwLk
	 GA/0FXj6AWTYWxBPPqx9Lt/Wp5zxgNQNNKLOD/nne15Ubho5SZoEoHcp7x9WM2UZxZ6I/
	 e+Yi2b+jXM30BCoBQ5E3irsDNsL0ckbr33xT3H9eI9rMbawTK/uPFCtBnCqehYrdXQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
	b=jP2+ZIVP10Uupw2Aqg8VSEDNW+B5ZmHYVFZdVtq/EK1uxl/KNHvMjTVzUzwDlULLs3z3
	 NkHx8WW2PtzYeqBEA3WTVJKpSzwaKj2TCDVrXunbZOQbwtvw8nJneEyDzDclTJqXRZe1C
	 vO+bmcEd/B/2rwOftdMcXmPKQQm4TczxscXD5NrNCwLmlYASY/VH+Hmd0tpLHthUGZYZo
	 /YdnVgL8DA6BkhkGKpdIfyvHM4HTYaLMVEJvvkZbppUE/iKLMYPzlT+sv1DFN7CoJpkfu
	 3NEYon4YJA6+CFv+VRtLULWV8yQP7b/WLJEzm1ODwncK0wrgZXHWDVB7gztVlkL6fDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC1606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DC1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtOv2340269
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=; b=V2Ndm5pst2LttLdd
	m2l7dKji3WsB65MiKKrgjJi5XWBNT1IORbR5UcCrn8c8eDP4lw5+ToHAWveqUXy0
	923iq++6EIIRIFA7wcpqYjkGsJCqT7TDW/HLA9qUqCIOrJ49uwZN2FVju96mb+rL
	AIXjyZkyxLZFvWP/kXHZtesVtPfPKmATb0wtix74YW7lemI4ofh9QDVg6wxtSat8
	nop23RGxiP97gPh4l1nT8aO77dXsEFrSgThlUo4HXyulqXZAsjokaPaunJQo6FQj
	53phjBBd2Pz84kVSK+Mic7LBnAE/wrPw6GkxilHkjjnVqTYPjeVzm7aOhoiqBwWP
	npA7YQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3759-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso129513e0c.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460790; x=1796065590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=jlsspv7T/rnV6gJHWwM2AYbxAGAwKfPeYhFnWXxWXdATDKtm9HUgg6QkLNjMf5s31v
         Tv9HE8Ier3lqfhUSA9LJHyDjRNtHhtADMuAHhntVMEOzplIoLh6lYjVcnEoS4mnKSV5b
         mjQ6Sda403fd86OhqclG406qP3J9WsCkDLtuqs8Wsz4rU6x4Yst7QmVghALlzRapTWn4
         xIzI/zMxMp1P8YnZZFK2A9KZg0VdHrz+U0PqdvXgyjU+luoji0vsz152H91Pi+ba3nrV
         GLSLZlCW5S1VGz3iQLfVItw5q+0TbAeipCOj/rhpiyd0c2kWmubspMgWb558y314RAk+
         nShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460790; x=1796065590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=eKIv3gFICPG2PTWrFn+nbzMxmSRs4Uxxi/OMqtn+aL/ch6Utiilv9v1m+RHzLtxMkr
         RWR3ALT8N6KdJp1xF6pgFmpE08ghc3jum+mTdtSTs8EHyD+POnrP4Ws0IDDmCQvIRfnF
         ENKvpuKS6Svn/AqlfZhxqOMbPIAWVkeoGbw0Qpim20aVTEBH1pdeex8JnhUuuoI64CWf
         sypWkfEnLoRxI5e7SYJxYAmd/jSZLCG4p0Xy+sc459yCqZoqZLHkSZBgM1DvjO3AQLX8
         vas4vdCL9Wy+zWMQop980uJ4vRjmsVC4hcfcRtQLDpo5C+nrITUi6JXxd2RxQApadLuV
         bauw==
X-Forwarded-Encrypted: i=1; AL+hErF9yVpODvJ+7pz5wgPzbVxypXCR302bnYcw/PFUPlVeHjvbbaH+HZrgJ4Wu2CgG+KJOl2dB+/I/qzYL@vger.kernel.org
X-Gm-Message-State: APuU4Z9mh8wcm6V5LLDptKGPwOR4mIs5OgfRdx/1sAk3uAoSZGyOA0Y6
	As4Pa76Ao74F754n5AU+ZtgGa86gMPTtRQuBcRNtjsKJhcB17yYu3quO+u5dmH4rtjaJdHa7M8z
	ZfrDPD35xyVpLWMVP0XkCZzFQi3EOEABQlSTI09GGg/58SH70L+YnygEEG58Zh4U/
X-Gm-Gg: AZFdTZc4ZnOPdCTmDnXermkOTqPruYk1o8lEH9mZOx0EgB5IEm6zgI4NE4jm9SiQZv1
	9nZsYkYhbwfBJrP34R4uQ8BebcQzcmfPGqzt+VhkTdKqNy2FGTn6BQG9vHnyr4eUdvLMvKCFT0+
	7eB2jauKEVazJuX54BZhkCQBdqAAPJ8vDisLV1I3TbPgwBFswvCc3jxwsqsHckysjRdNjDj0+4W
	364mQ4DZUoZEJ7bGoOGHq1ncLyQOPH8LAm5A5r0zK1KvkjeOg4CTdF8y2FgZOfL4AmVDQvo+rQe
	/WF8zpSJdL1UYHedO1HXcFOf6lCUOD8WXukHqsPGCz9Mz3V8PguH2VnyboFw2Kxo4ImNYjyQ1iN
	SoLnVlHP8741+movzGukwvgC7uUZlDxuHrFPRrQIcvYYMjaUJLGSUPKBTVtSOFq/KEWfslVA=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041949e0c.3.1795460790152;
        Mon, 23 Nov 2026 11:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041913e0c.3.1795460789779;
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3651400a12.30.2026.11.23.11.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Message-ID: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:06:26 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b048eb7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09P9ZdklQj12kDAbNyMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: xTYL4ifZkcplUu-3nupyVPg8gqa05m_a
X-Proofpoint-GUID: xTYL4ifZkcplUu-3nupyVPg8gqa05m_a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX6ED+QnEOdPpu
 8C9rXIXA7HVR7bdvsN8Ecv19nfyrEMS167L0IhJsJWXOFllKpuWiJ2FhdvH+GNtVZZsxDYWfxKh
 p+9ZzXWdxuesJ845qRo7EbMmwaiVbRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX80L3gkzY9PkT
 8LuaqJpkEhUbLwUA6dT3yM/oSSA4rlU4vtyA9THIDC6a/qex2naWGQXMNBveT2rYBc2SFK5jYs5
 gdQ3oAjZNV30VrS+Thxge3FbbntPPnRlu/W1uOAvb1CCzqZs7Z5gbiNL/pC1D9q0BnB6a2fru8p
 uMd7qcO+QJ5zl/BRtK+J45u+NdF+g1Dr7K8fXzJ5tR3jzdc7yK0DrB+ENiTtmgyhXHPXQ9v8rKh
 WH4X2V8fQtI7D1CLsJ+SLjajS3/7HYefEOb4sx+3O7Dx1cgGtYwcpYCXuQTCgN+X/TOJXcvSFP6
 J7qU9CefoSRc9gvcJIESV9uPBq3OTy0vo6OlXHsWgg7UJWIIuQoTXVppprfZR5SnCK++IHU0Fow
 VRrgEamdeea2D9WEbSBNDFu2jm2g0zS5pYUVCB8sGzUfFQAwn0wxlGej7/aBz3fN/NMnUh8kg8Q
 hPtb9WW1mBKSBfpLlsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:17, Konrad Dybcio wrote:
>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>> currently used only in the socinfo.c driver.  There should no and there
>>> is no in-tree DTS user of these, so none of these constants are really
>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>> that part matches the concept behind DT bindings.
>>>
>>> Driver have local copy of these defines, thus these can be dropped.
>>> This has no impact on in-tree ABI, but any outside users would be
>>> affected.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> I think we can move it altogether, to prevent a situation where one has
> 
> We cannot move all, because some are actual ABI. I could try to leave
> these ones only, but that's a bit too much work, IMO, that's why I cut
> everything at ~450 value of ID.

If you mean ABI as in "used in DTS", I don't think that's quite ABI
(again, looking at the glymur-ipcc.h case)

Konrad
