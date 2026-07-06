Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AE35836B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343226; cv=none; b=IRBq1HGm1EBletRMEVN96eJeOSjupsEpcr+fdzpykgp6lLuXQl07K2PUvtsmAKTY6qxKMRJi7bCYrufoXK3kRQ2MLl6rJCzb5FUKvts2dzkL4eyAlxXlqt4mzhWTsC6Tgd9zlGt5u8lBEWE/K0VeXfFB2lN1WLu7UU2kvMYzK0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343226; c=relaxed/simple;
	bh=2/8uf/+qERy4MZwmlx1x9scy7YvKot5nqNIMyIzt8ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijhLyOzCYR//gpmVNzXEQO82c5lKL4gJuXVUdxuK+LnB+rz5DEyqIPXgzWkyPJMPCO7uIRuyvwSRC4xCEvHkF0ewoAUU4eCgH5Q4z87TjMwSNNc6+6m2BxBLAym8yCWngOoL7ZmqQk4ULNNrZfCIvsBhgnpEpPc/EG2HV9giIqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbOWvfYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GncpzDd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbOWvfYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GncpzDd6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJUt316461
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=QbOWvfYYxMOrrPp8
	bcZMRh5+gVIjxIia+4jGtN2gxG6/HBu+g2SD5G4FQiPmmCaZXxIuaxA17qiHd9FY
	JRMWrQCauBJjo0JgYhxypmj3yRmPWA3hDSD9tWsz7XIR77upkB0J+SsOrzvCRmhJ
	SlhobXzeowDnyvqIfgf3DuDSC53V6bKAf64nWQ23M4oSk6D2Sjdxakos63QbA+bL
	2J5WHHhpOPLcZl3/ruCBunw/xfgrnU+PPFzcdVn/iZHkW4+P/wKT8Vs1Me9IJjl6
	XFMYCfVPI2bjhGBGcfAnSVRSd5uhcnTaLDixCEPfrrm0/fYPG0BruYyAhcDWPjj2
	XVvYLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hc77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:07:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdcef5085eso113806e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343223; x=1783948023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=GncpzDd6GSXhcVDv4llMP3Rxv5Jt29eh170+StYPbN4SasTkgKoJs2ebJSwJVGJfCf
         T+8v6HMzBQd7iUvKel3zYG7Vd+rWNhoKrlxvY2ezHK1zMQ3/TXdyM8bNtCm3Op0htkMX
         Edfw5GLu19qVrnz3y7fizAf/foAYNSOvp/S83XQcWnRW4D3OZPNyVzpFDoslc7VT0YNJ
         P7czAn+o+fsWu2TrWJkkDOOfWKwbYiQgYh1eQkWd61xMAcxn3Xjq4vVVFAzJTnMi0tbY
         COuiQS+fintULPR+CLwImlFoYbzLWv/JI8q9W7QeBcbqtshXYmn+TNa2s9BW2tvH6Zhg
         FyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343223; x=1783948023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=QoGPfJwL+wJzCnGvHYrNXZ4Fwu622qmaa+Z6ab1RZPodHcNLJ2FsYYa7U5sKKpstgP
         UAzO9YUsv96n5uMraUJJElXVwHcpSL6w/CKFcuOKuPsHvXCUJG2TpxySubUjZUSB/Gn2
         pYuGCfwFFVkH1nn7WXkrmBAWY7i2ezzRhyYWuow/SJINJLS0eBdUmGCPiWRHjPPd3vqk
         Euy4NLukDBxHgDDH6TA3XfHlZ0tJoumnwR7nDFoJZjVRytkL/cWo1K3EWUsH5sNcBXis
         2h+IRUEN+/RtXykp/aulbyUib3S+YviXpaklX/bI3PllErKI5YqhiNYJSMSF1vvpcv3O
         9sSA==
X-Forwarded-Encrypted: i=1; AHgh+RqNWwH4Fdrx6lWehlEh4BOINwafBHvTEZHC9HpZUN7rygJHKQMLH7JZSeV+rmYP+k7qO2RgYuqZNodL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWTK/HlKq7Q3eMX94tHHbZvKcpWUi3deNLwrLWuDAQU3tSYwJf
	ywvslS1VeJRsOyLrTNoomfVPqvHgUIv6XPCRTrzVl0dLXjTPY3HAnO91DJvKHMcBp4S19VcdTjd
	jV8/aCJfT6Xd2N+dZF25iDJNG/bjvt64X74cp63Hj36eY3SNXrfptjNf2u+Z8Ncs+
X-Gm-Gg: AfdE7clHtrmRG8QWwso3+T5i+Wp29Egg/lEiWcVq4BB2yK9D7E5GhvPNk/TEXAwRbLt
	48+Rnofgde5oBa4dQMLwF88PH4r1J1FKcRGRCRYnZySfm08SCAyh4+duLXl340hITl5Nr0+/T9g
	iCiMH3ZhIvOjyz+9v/YSnk8vnih4A0fmQQgSMrr+1OsTG3vLsX7xAQXKxNyOA2TGmvrZpqvxrJw
	SGh0mC519fDuU8Nei38TYXyl8c20IwT4Y1hFZBiJNkLns2A7UcIiDT1VkHH2Zm1nim0lf/iIvUx
	NHQCOqbT7/vxQOL7O06ODradMOK6g1R3mkyVgEjTyI5XzFpuM7ujokJb6FkDR09/IkGJ6epB5pH
	1/aowx42NdI0Aw7zlvmyVk+CDGmlKMSygBG4=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233246137.7.1783343222817;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233219137.7.1783343222369;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19db05ecsm3945114a12.28.2026.07.06.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:01 -0700 (PDT)
Message-ID: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXzBkm8OuxIu5Y
 gTladG2fgp4MWEle1Qo3YByi2GynlAzLDmymdjEKx1zFwsXJ36KkvA41knI9B6NRFvYkJWWFRZp
 sNiXd6hIJedNPmsuww1/cUXRuxbl+yQRkst7nUlgvn9cOUlDBN+hSk4Bm2yM29nd5cG548Zx36M
 oDCfvsv1SS1WfxjwGJk9ebqTsd5KVQt+1TvS9tk8VcJZZIeEMy0s12VXcOWv49SiObf66F8Nu4W
 pSAujBA/MhsEGfrdAfsabxfkH7BI37JTF5WWHJFS4PTmP5pRGP/QtxYmAullOFJCQKCu4FNR+/h
 seFu6KiVEOqyOgubLOvkAjGOxAYj5GEmUML0BAjgY/GFnSh8SgvE5tG3NmYCF+p9r4LV2PCeywV
 4HxDlNbX92vY8kPoAAgHn0QG15ehWukX8N0An4We5I5Powyod3fL5NkKgA/pvbvw8k1dUY7YcS/
 3l9ovN8Mamwu6Udlxlg==
X-Proofpoint-ORIG-GUID: ylqCVKHq1xOP6dclqTUamUSyBAPH6lXf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX+dGJI1hJBrcK
 9/6C6cs9OqCfenfEVr9lG14l2dStX46u5NvwFvZGlf++1fUQFFGvB+eBqwmNE27ovYQpOw6Kd0V
 Fzd9MTC9pIKuwpvZNyyubw/Ygk8zFvQ=
X-Proofpoint-GUID: ylqCVKHq1xOP6dclqTUamUSyBAPH6lXf
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba877 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uHYfjYNGAha-st8cwW0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133

On 7/6/26 7:28 AM, Taniya Das wrote:
> 
> 
> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Almost all of these nodes lack power-domains, meaning the
>> aggregated performance state requests will not be translated
>> into RPMH requests
>>
> 
> Konrad, all the clock controllers are on CX, similar to Milos and does
> not have any special voltage requirement for the clock controller.
> It is okay to not map the power domains here.

I don't like repeating this every two weeks, but each consumer core
may need a specific corner for operating at a given frequency and 
the way that is conveyed upstream is via a hierarchical structure of
pmdomains, where the root of the tree is provided by the rpmhpd
driver

If the connection here is lacking, every requirement specific in the
OPP table or in the IP node via required-opps goes to /dev/null and
RPMH may do something between aggregating to a lower state (because
there's some other node voting on it by pure coincidence) or shutting
the rail off (because there's no votes whatshoever)

Konrad
