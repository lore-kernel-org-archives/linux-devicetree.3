Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655245A284
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388862; cv=none; b=rNOY5zI+u8ikIMUncgbK0oYu5veldRNMQb4MNDNtKsIsj1C+jQMnoBLxRYBMGaztgHBvKeoImrt6uIIUbJdJ9k8U5AmAnr9t3yk3oxe6nlMoZi7vvSFwI/2wPQQyEm//8yfV3ApGbrcSKpeBCBK7TPxDOwiv/XgTcO06xCocy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388862; c=relaxed/simple;
	bh=KsCEks0czQ3KTn9/c2CQL91GTdL3uRkDvEd+0HAl1uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlsLm326fmHYm2dLtiIuPF8O7KqtnvHNgGp+ADVrb1tsPIkO6qezz8OvgLXovuV/xwPEUVdO7qjaO9QccQvwzJg7h5mbseuMPKxGG6n9qxbbpfUBe35wo2PDr3KisQXLWD/Vjqv0AUMzmVpahu7gZZByseyXSDTKb3fGa3n0hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mecwkzyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZccO4Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mecwkzyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZccO4Td"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8bw530978
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=; b=mecwkzyoxz+wYDMk
	ghZM3KSrDi1ge0ZRR+sWxAS0CHTlDPUlqbdkz1nnS08qQlwGkIidKdOhabo7VKuN
	gF3YGjn/hc7wn+BKlr42gZvKAp/PU0T40bjodMnZr8hRzhj+UTfvwFGvmqNHVYok
	kTQCO6EqU+w1OCx6V6fktYWdcY9DIQSMK9sXnBSS1Ar0vymuYDQWRkKqN5fCvven
	t7HdgdYmqEB0Rsd3SnYt+wA9/aKtQuXe9L/BXWzmIVJlYcvt7XZ9NQzeyTuYUVdc
	+3qOPiSZi4549xJVLdlurVO1ZDJz4NcCv+EX934QzIZ+Aj0r+utSjz1vUhOruqtj
	w2yQXw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstdb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so115569e0c.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388859; x=1789993659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=GZccO4TdV0qxZRa5yR5UAQcXVFD8W1SQgIDv8QvTbtwrrR/MqPkatytWnRqMAqKDvU
         vlt3+P4df6vV+EKLoAROaRmIC9zp+k5IEZdJUuZjUtFAYrPejDpphw8Lc3vD/t1mYPpD
         TlI0hCpyOVHBoJFwg8ZvLLwdZkwNy41qUOiQakAg1pqvD5P9zFaviM8/ABKVNxx30itO
         bqdjPk39iGDeRXWW8SF7nMQu9hxDcS+uuSrxsqlutx678ZS2Cc9vCXqZhf39ELaYgjY5
         zYCB3lNapeq6AYLClXQrEddqgy6UgW4XmQ8MTPWRUqCgJc/xPqYbT+YD6pa/jFAoEJbU
         2vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388859; x=1789993659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=SKQRj6R7RPEZgmKIyATskD9/ryU1ICkuq0G63BjSAVXOgxHyCHVQPhHCLzA6Hr48Cr
         oecIQ8KBfOH6pvWAvxlRqVTU1Qwc7QgMZAsqYpkWIgF9yGz7eeD0ml/GheHBzEF8pDiW
         HcN1rtSZEM7oXcJHj4iqD1iSF6rcIilEMu4tSNsbMGwng6+F+PTb4eg99uotDlnWg2w5
         k4rLriEvi+tAB4iVWxTJqFR/Okff+I3Vu6kuv62pTQ3ELzTeXtFpYieA79a/e9iHYcpY
         EUOnaVbaFWpkRfV0rWHa9BX3a0tWXt0xX0sauNzBR+qWs0IUQ8jg3K9ds65Y3tmG3gss
         ERXg==
X-Forwarded-Encrypted: i=1; AKwUvBx0mrsr0v3+mJp5Vj9Z3IitklBVhmJwy05iuA3Frvu+7CsHqJODziV2IFcPG/RipOOtoSVSKksgglRQ@vger.kernel.org
X-Gm-Message-State: AFuF++kUv1zcNlHIs/cppt+W0QE1qNQZ5qjvCo9CMDbcl4Wu9iXmYAnr
	RO3PguPyz2cWKIvAkYibu70Kz79UKST013JQqxH8rmmXp0Kwq0mOHgrWOk1vV33ijOjW2OR6sA1
	s7rzHb4XBhFkETiuIpxx5sonVgmUz8ycddxakOINKJWHPOPCc25gCAbYMoVArCiswsMcEogtN
X-Gm-Gg: AYBFou3bx+SCss/GhLXVtz0uUxsLCiVmcMHBxa0UZXUmvzTJ/wlTct94d8zKelIPAsE
	BtCdgJDrBRFOAjDW51HvvL01PJ796bzo5B4jIem9928ccEaYugo1UWh2ErQ+daOa5n0+LrcgPQe
	EOQm8pObs6e5pwDYDHyq4YDepCCP1/5hTumre0SrMj0OEJay8HZ02ijx2vxRqDPKIjt5eQQBqCU
	UWsZNQxvDoTRVkv/Rt7XKUO/GlQE7osiKum5sxandYTXs1XaeFVitjQga7m/tDi1pIcuFxWRxMw
	c2X00d6EeivrSiAwqoXFyyQYjpYZvlI+X6UneJrZ6cJId25UQT0NM1Sba7GLYY9G5jGmYbCGtPC
	wUuY+ueieOPtr8XlDC4JZhA==
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319142137.2.1789388859161;
        Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319131137.2.1789388858588;
        Mon, 14 Sep 2026 05:27:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2432030e87.74.2026.09.14.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:37 -0700 (PDT)
Message-ID: <1b4860df-8c5f-4ba2-bcac-6ebca94a664a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+NU3cFNvQ4rG
 sQf2K33xGl98oQasBEw7Bv5h2NphWQ1jHqj3abF/Q/i3Tbb0f9GeO4+hGVR8Lq/lnknLYLDK0nO
 ndkEfeN9iGqYgqXbeGbav1imy3Hfnp3dgAK9XvDZo7ydz/wr4n1nblqnOr8obB5IJCfE9lW+70D
 A8zBTDRe5GfflbqWzXI/OTURBziTlBI1qZXlWhgFptSAdGOToavCUvKzcmAYVoqhJCqUh8xDsnP
 kemXEtMXLFKQ52vYKUGhMcgxUQDkNu/+myu3i9m1iCO40LO4YjkglaYJP3xQNDOpMtEEro31McJ
 y8QpWsMMq0DrulRzeXc/vFSCQJRrjGfKp1tX8YuZ0eZ7eHnFuAxxyV9xxj3peohOYa0+Zrm/def
 AWYxJfnZm4RsnBW6px0q0lK2RvOmGDWul0UhFVyw3UwHi6mBJsQXGf7+Xwt5B6zZ6DsQAlUlFmE
 Lk90uubOwwieA0onObw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e83b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: iXo-qm3gp3z0sJl1WcSL_67WfAnzw67f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX7tW9ecojbMqm
 WKScGcJ3d6KorogSKR+2NeusPRI38BnjeHMakEWzUvyKRhO8GZCNtoeptBA0Z7QDnUUw+/RrX9k
 nq8S8LVugJmy0SOy8nI6rSatYXAXuRQ=
X-Proofpoint-ORIG-GUID: iXo-qm3gp3z0sJl1WcSL_67WfAnzw67f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  			gold_cluster_sleep: cluster-sleep-1 {
>  				compatible = "domain-idle-state";
> +				idle-state-name = "l3-pc";
>  				arm,psci-suspend-param = <0x41000044>;
>  				entry-latency-us = <2752>;
>  				exit-latency-us = <3048>;
>  				min-residency-us = <6118>;
>  			};
>  
> -			system_sleep: domain-sleep {
> +			cluster_sleep_apss_rsc_pc: domain-sleep {

This is really a system-level state and any overloading of the name
'cluster' is only confusing here

Konrad
