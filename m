Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9AC4AEEF
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844529; cv=none; b=n+fwKpXGwwMEghn5GzSUyCZLqLxrGBjRpdNv0z8ybjt3Va5fXtK0Gqm4+RJbbxmoyg1G9/mOU3ykHUM8g3AUyjM+pvUlMJ5MBLNn2oLs5ayBw/gMsGH7f7jI4FfkcA6LrggN5HrXbl1QAtTU5AfUUtDd47yvywBh1Yf3Pt8pKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844529; c=relaxed/simple;
	bh=2ZgH9JicCBPgNw6bTxxQzJNp05yNoxBhSbgRSDqS2PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnJxRlSkHD4z703Y1OKqflZaLivCJY4qUjgIxgtx/fLD3Waywo+LDUEDAB41YKBjyEZDhLZJW6Z1hBXCvUNuJCgwIgKEyLyE+forHGblqrcM5K1PjCWG1TD6jEhUZ1RwibJ2EauSF0QKP3ijYn4oxq/qTM5/yJLdug9pGTUQowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCpolzKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K55wZCJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCpolzKC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K55wZCJt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2selw1675774
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=; b=QCpolzKCrrG9L9gw
	rQqlyF6kEgZehYEIgRvzgYGT83U0zsVJG0wfPOMGntbgRHlTfi+whG9N8JqN84Hh
	b7Q6+mGh3eKoWg+UK8bUgRawrlQzPGIDwWnalJod7Hlwa4hDc9p8gVFqo4Hh2FMz
	MzdZjNoVGYp1BshOGaStMhlrHzr8txcNzrNuNMn5fFfMA13rqPywPeeqwxpFEfXB
	Y5t5/iIjKuSBEoGdzx2EpJLsSAVPutox1x88myjnxHrF7t+zRaZu7mNTs2Ei3tPF
	uln8H8QsIaXOdTZ2RtlzbGID7fxicktkAJnzIxYee4hyyUHEYXTqKJeNEQa42zGp
	ORJF9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyra71p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:48:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842446a3851so851078b3a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781844526; x=1782449326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=;
        b=K55wZCJtDaUlWke+1HPS3cfsUuKMhz25Twv3+rAfi/69OvP7XJVjIrqB+xv4qJIhb3
         eqO7Xxnqi09F9G8Iy/tCyiqMhZBwfMelzXKSfPUv8zEqZunpytZZVArgYvYBOWDajoQs
         JVx2BPZ6CHSHr0OB+ol1Q8VicoCsOPC+TYjXDQGmm9SSXMuxcXppmcROZs8707FC+S8S
         +QQ2ZNSqiIxD2VTcRm4QY14rOQjPilke1sJQDVMDn457ICQiE13pVudtIIF4FCIc9Nv7
         HFcVSlG20J1+yziWbuJiNOMhmyj7ZsTRurBnQrkkhCTZh8WewmQtgiGkzl6DOeuQf3iy
         KuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844526; x=1782449326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gpq90L0IYhWDMYyNYTQ1qV2iw2qlBFm7cIYJfW06+QY=;
        b=VvFvoNLAJ4GVCes4li4aLLa5IR23Q7+0HyECB2Omh3PCYRZEQbuY0Pk1ZEHKZuA4mE
         5UkGKKe83sbfmKDhlTcceex+Ph1/4xud+v5/gclwJGLBJTyiZQg3o4Fnb0BGJ5uTJmWJ
         k5jvlCxnHlA6XhLOR57OfJhpuA6G1Eq1gcC8EezeysI3opaN/O42ug8hsq/dpB2je5vY
         WxVGJYRsrhsjoyhNvuD57cUBxbgjAyV3w2YHllwI4drZ6XmKb+G8OoyIMT0egdCK55Cr
         jz32bRy8vKS22qqlZ5kbhDL7mrhZ8QRcmsqq/2aWDgaRvIc/jZENztZS4gZCSl1ZhvjN
         UUIA==
X-Forwarded-Encrypted: i=1; AFNElJ9AjuzHyyafxGmAZw9UzZmE+PnxIX2mTbqwxuJiS6OenCPZA4McBGWlxr2pKl6NPa/YijYybDQkaPVo@vger.kernel.org
X-Gm-Message-State: AOJu0YxsJV0dqmzSolqYHOpbQv/DhPtaTE9XXcAA8S9NGquhrsTDTiLs
	42cL3tS3XqPYY4qzo7mslLIKOh1Q9vaey9dDEP2DBD1J9dB0qiUKf1D4qwOkQGRShTvnCI7PNye
	B2nsJ1sPch/Zr16a4AY5Umk0GwNMcKCJfkDe3s+qOLK3qzyZ4AShnHDlqBvcsehU6
X-Gm-Gg: AfdE7cnhf+sI0X3hXZ8KvdEYenfeOBb67/+62q3Cu5ed7/EvQ3BFxxyEyMCApjNnRhQ
	MeycHThbPAT0WMB05S1vyXsESTaFL3oLXImZhsf5I8C7SV65yZsI/1Rvze68xGZk+fw/N4x5gZl
	xP/ksiqpQfkv6FYdHc+GASeMUs8MyKC5Q9djScQO0QohF/QGuvOP7qHF5A0RokfYWLGQozRXoqk
	bTpO030CeHUdCIWTvDFtPO8CdodsKRfGJcAN7/TVL3NMb+jHwsN9OUAHh3E04r9DMJmG5QiwuLb
	LuCSvoM1fI54aEJbKgC/6nUb/XXczPgsAz+4A8hjPE3II3+/RVOmiCTF9spknK0lV+nHz8xByyu
	GCT4BjuoklgEz9wFHt46gZ53s+VwYc74B5tNad4kTP7qP
X-Received: by 2002:a05:6a00:2304:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-845507daba0mr2152961b3a.18.1781844525858;
        Thu, 18 Jun 2026 21:48:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2304:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-845507daba0mr2152928b3a.18.1781844525428;
        Thu, 18 Jun 2026 21:48:45 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553854057sm873036b3a.53.2026.06.18.21.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 21:48:44 -0700 (PDT)
Message-ID: <db5facab-912a-660b-b688-c99041d1e866@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:18:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-3-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a34ca2e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K8JZiejdjy6CsQPdH6kA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: VORv2RqQpZB9JKiE4iC3UzYRJOkKn4qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfX9VdUVLQKrfvD
 028QZni0Ppzd1T/oe+cIjUOkxD3FbIAJQyn2QpZ4AOVpmWggyGi+HUBgZeNrLtoFM4EP9O9CH4T
 P4FEbVTqE1HD8Yfw1U3QcksDtxXR6/bJEyFGQ5zKKGeU/fKr6cBV7rwBWR+EslafqY6Y0tOKEUe
 NX14B3DGoxGi0c0qxIBh0EW/LsMkmJH9gayitQz009SUroL/gHHaNxoOjR9UBC/ZxyTImnXqgrq
 2TAHHpFHmBUpdGOfiSE2I+o1Fb9+HEwMHNIliZP8ZI8jWs1PCeFIJ6KQ0AoTFfevuYGMQvE0y6L
 p/Puvl0epQbbEQYJCFEHGPhcul+Rpp3+068R7+f1A0Y4HcMYcjclWSIYzNQti1PcmCGCXZm9iFF
 rFIiUUQh+/CxQgxqSEpEeRoblORCdAIn8/uCJhawgmRcodsdfzrjf5BhenANCYl7/yzk2spuIxZ
 EnT5DBiNvtbU4SrUQGQ==
X-Proofpoint-GUID: VORv2RqQpZB9JKiE4iC3UzYRJOkKn4qC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0MSBTYWx0ZWRfX/ZOL1kgL7SrW
 6kj4Y13rCn/x5lGvVzlK+NKnV6rHv+kD0cQF5VdXQb9y1qDmWpDl+uHkHEnyIWEowPUCony9X07
 UYmCoGwmBfszfZj8GSPHnwEwtoPQG98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190041


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Enable video en/decoder on the Shikra EVK board.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -3,6 +3,12 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> +&iris {
> +	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
> +
> +	status = "okay";
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/shikra/qupv3fw.elf";
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

