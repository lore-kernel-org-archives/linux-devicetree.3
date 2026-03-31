Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A5401A36
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969424; cv=none; b=uQ2cEoYzDIuyT+ouYiVRCsDOPI718GWnnzbrop/joWTyrqggL0oGwS3OEM8ihqV4arxR52a3axeQCWqh3+9oPHIf8ddcJjCkHyR74bVMsoLUUOo8V3hxiDPhKvYG6T/q61khxQ9w1ephiSe72DiG1Wb0aRuqUgevblNUzoXXGog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969424; c=relaxed/simple;
	bh=w6QD941esx7LyJ+VMbF+nqp+RsNrknQkB/VMJUb79Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDJ159//s0tivKOUSnFRLafsWwHcgbTbPrzhcBnECxkd5Z+Qe2Schvl2w09M7UprD7gK2dhYUqm9z17MTkxTF4/+4a7bgJRHKqdSG3w3H6jdZY57cUj/xLtuBgSXfsS9fU7u1wI37GhR5TLpuoyqiBWCUDUk4K1Wd2E3d4Tx8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeSD1iT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwNz8w1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeSD1iT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwNz8w1s"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEGHXO2761618
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=; b=GBeSD1iTdQydDeOj
	M9v+sZK2X6pBotmRs1GyQZSGKTdSk33gPNfzqye75fT7M2ae8bBsdCFmOp5HDQCD
	F161X2m6beT6OV9zftNv3VFaK+YcIBOdo5y2U1HJg6ZGx/vFp1o4nxLNVnJMxTAN
	nvHqbyXIpUVGB5HYAVQvvd94tB67Aff+D9nLW8utSyIC++cr8s9Fcr2j751sbz90
	/3x8adVGEEaBlGYuVQltJhWCSHyilZyjYgb5OHRfIMMIJ2XD2moXZPApeSmmzDZz
	bcXMi03wpwlNfsrdF9PR4GbIRUJ2+UcpxmDd4ksIyIPG/7ja51HAtRm1Qq0qQn6p
	v5t3wA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931mhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:03:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6000a7ab3e5so171023137.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774969421; x=1775574221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=;
        b=YwNz8w1sAQAIG9a2oU3ACcc7ZQxLpr+nsJNmlVTIeIAH5tivS3MI/pTrJXi9DIwstN
         qQGApINhvR3nwmcFZagAtSePWiR/woLeWmw/M0x1NJSCTcsHMspNTds+/wueoAhXvzNE
         8AVa4R/vKK+3BTv8WjZuY/h3XW/V8kM2aICDg7Z++VCXv7e6Qw3yG/h7Y8J6vTqwY755
         BCwh1JaAHAFXs0yz0NqrEFouFkzwARCAtexDGjhvyIDqJfTn0WV7A3zB/9WMC8DGpHgo
         LIH4Bznq5qmo69gpMQr9Ea0lW95CWgQV89LFjbNUvUJ3DUNFSDldMLXd+RXaCKxWs1iZ
         ooVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969421; x=1775574221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4/VN9KIRjqt9HfZlwUk1P2QbGIevJc/ytb+pN0NAwY=;
        b=L28l0BygqN0GRnxettXzG4yA8ezKe8JNo08Sy/EsaFK1WMcnmkrYRE2c9Cw9tEmh/M
         9N5Ojo6UgRnvgTe3maqTLlcLkQAqhCvgf3BlCPVpv+a3qcOXhlTUouTeke/gBXw4GqgQ
         wv8QF50BZ1AEUArgf9cU4kU2kx/0v06wkYKPeq0ezZA5anZfB0Ed+3+cGsniNKKzT9e0
         TnjkG5XCUXif2k/3WcBACk5hzGAiBapohqV5Ai0AsuND4GCKjuWJMJ8PJjCT6HiyivTG
         2R6yf1joPNF82X0ktWtwXSMh2n+eR7se23WpVeToF2XCVu+KUZyS3LGgbT6dop/vPc9r
         me0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7FY+VcE/PVEG2y87LArOeCwS0zOY6Y3jKMfwzL7p1URj8fj4K8/aSeEbEO6Me1YDZ8/D5TSPWM4ka@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDX8FMhIeKGa8A9ARXAATzSxO68sOdMqxX7P4V4C2xkXBVvp7
	jkyVZFFqg6PGMOdndWZAqRpgSZKXeMokfUGo6MSoWnoQndZCF2oNoaIjzGVkfEsVVvsoU2YFwMD
	1Nc2JwOr9FDBqgm4loAfnXg2oMbFZwBLyt5114n6ktn8BBvRUc7laqN7B8axjkwiI
X-Gm-Gg: ATEYQzzMuK/1BASkVMT3nvyaliGVBcOejZgPng1ZzGxXQh8kF9Y3d+IfjXQc0cqCMfY
	yOAdS/uyBbCI/usmqx4zK9HMIu1HG100CT+h1CqUBB1pgODPUuKKGX1Z/RfoOWksaOAslXRaXAI
	HKF1dnH3ccqU2X4vJ3Tpygz+/FdmnruHHJk1DZrFQKvoKdZDgMXSuS6sdQKouGWGerzU1SKuaRZ
	WG4Y4QI1Ob71bAZPHoZydM8xz3n2VKhRD8nWfiTpYCKze0J5el3MIf/5amdtH3BbY9vocuM6KoJ
	w1nGt2F/KeQGTNNdQ+5TwHHilKei8WSQab1HPPAvpw8/OpUoKGpdjOIntuDQIHKBJvtbFEep+ln
	fQNKLEfKsAdxrd7ZGTHHIk1Az3YvOZ+dRFcQwstVkpMa3pzHW3zA/YSQvnYXzLLtz5dExG3aMvm
	fIpyo=
X-Received: by 2002:a05:6102:441a:b0:604:deb3:6e2a with SMTP id ada2fe7eead31-604f92960c2mr3134778137.6.1774969421461;
        Tue, 31 Mar 2026 08:03:41 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:604:deb3:6e2a with SMTP id ada2fe7eead31-604f92960c2mr3134759137.6.1774969421013;
        Tue, 31 Mar 2026 08:03:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b22530dsm416060266b.54.2026.03.31.08.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:03:39 -0700 (PDT)
Message-ID: <f4ee7476-74d8-4e88-b14f-64835e6e7fbc@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 17:03:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <e4cad76c-09ad-45e9-8725-ec156c121bb8@oss.qualcomm.com>
 <b3b96c87-83dd-422b-a67c-cfe41ae94a35@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3b96c87-83dd-422b-a67c-cfe41ae94a35@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NiBTYWx0ZWRfX288vDCIUMvI0
 zAMmBoq8F9Gvzw6TFKa2hUNiu+jKDQDmhlg8P1RB1QGt/zi2i58EApVcnP5bZo71gNJdCcB5gz9
 M9yNonC3cj7jDzS0zn+6OnLbKppwwQFKH+9DsRSd0gXxfVB4ibpxfv3XCjzplBkrD39G7+Z5vP0
 1BXAOp0+OugVU0GWC5FcQ4BKUkxoK1Rk8RuxcVhEOnRXMStUs2Q3Am1qK4Yka/MwKTCoObcEIaZ
 Opy4BadeAZN8MtOYZWhQS6PXTwW8L+PquLDnTQaEjtJhqCyKNwTNl6qLdWQiX4yap6vu5QWO0xs
 02ZJP9Zg97QWT5t8KvgI3TardgqtTleYsuNpPH5nTMj1+5rZYmZqj6fWQ171lqAgOtNfFd0VkJN
 PcKpBkcGz+NPWzUPlzFb0AHVyRcB4lLQDY9swiy1sXNV55gmM/ME/1GRI4L6g//ZW+iGxnH6Agu
 Kgcnrtz9Sj969LfdctA==
X-Proofpoint-ORIG-GUID: Q8XO3kcr4r82jh4IwDsCCwqD95P5MU39
X-Proofpoint-GUID: Q8XO3kcr4r82jh4IwDsCCwqD95P5MU39
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbe24e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fGO4tVQLAAAA:8 a=BFScfxxKtYKQDNOg7CsA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310146

On 3/31/26 5:01 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 16:49, Konrad Dybcio wrote:
>> On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
>>> Dependency
>>> ==========
>>> Depends on USB patches, which are being reviewed, therefore marking it
>>> as RFC as it cannot be applied.
>>> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
>>>
>>> Unmerged bindings used here
>>> ===========================
>>> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
>>> (DRM MDSS bindings were applied)
>>>
>>> Description
>>> ===========
>>> I did not enable DisplayPort because it does not work on my board and I
>>> don't know why. I double checked QMP combo phy and other bits, and
>>> everything is looking fine, but still no USB display, so maybe I miss
>>> some other dependencies as this is early upstream.
>>
>> What was the furthest that you got? We can certainly try to help..
>>
>> Got USB Type-C mode mux events?
>> PHY initialized and configured to 2/4-lane DP mode?
>> Are the AUX transfers failling?
> 
> [   43.975329] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
> [   43.975410] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
> [   45.780383] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_access] dpu_dp_aux: Too many retries, giving up. First error: -110
> [   45.780463] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
> [   45.780521] msm_dpu ae01000.display-controller: [drm:msm_dp_pm_runtime_suspend] type=10 core_init=1 phy_init=1
> 
> pastebin: https://pastebin.com/BVXy3Qeq
> 
> Abel pointed me to the phy problems, so I focused on that.
> HSR says it is exactly same programming sequence as SM8650
> and such was used.
> 
> Just note, that we have ADSP remoteproc up, but no audio including USB mux,

Are you talking about wcd939x-mux?

If so, you need that or the lanes won't be properly connected

Konrad
