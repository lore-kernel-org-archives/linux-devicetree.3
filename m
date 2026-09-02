Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85E43BDD6
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344350; cv=none; b=SCx0Al3iigMBRjPQstwc56zOoWf9sbyeX/hvDYlFAsxE8OKc1yKXpo9Zj4+K5u9Lwp4j2YvHjm+JQyOsOlhOikXS09AOwaieNLAeXsFwk8nEm9F+QA/BbQjupKEotdl8tb4Lb2Bl3fWUKgPOM+TLQRbw2eySrDPH1FWhNhiFCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344350; c=relaxed/simple;
	bh=9vMnaYYXwgmlr6LeOgseKM/hj4llNkR4VX3Uph3TBcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYUFdX3IWgoBRv07nJhdEQyyZGj3QaMRb/uSWa5FBMtp8ehbRuB0clqsGECxWfKVwoOQHt29JfEBBKwaaft975pJ5vDnareZ2gNtFoxebqlPu/7IfjLmwl+l54NNq0yfGC9HaPTSrbMjf2k08VKfXQYFuna76ecg2RPThb+6O5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhIV1m1v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rl0fkjSR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhIV1m1v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rl0fkjSR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NN67528900
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=; b=AhIV1m1vzEpXbxwg
	JJvQLKVeiBVVvl1382fV6QDrX+c1qgIuvnO7HKrF6pdZ948I2tVR9dBc7BoHUllS
	IYGnU1buZ1mW9e5Sbn0+rFdjWn+E7hiPDP4wUaH2ve93bWZnfPYngxHg2NtDDC0o
	y1Lx70RGzHh79yX9jZSCxodQ2MjalaYly1LYazZVGU2+ikVl9BNHt/LzfTV5z0G2
	cTZ7z7TARUcwHjkEPZJVH3XNMugf/tIs4k2iPyqtoyvk5dOZHK8JWWR+/WcRPTLp
	ued/frzgTtWWZCg1ywfTQX97OnUtEnZVc4Q6mrsBUxMHCqxkIFjIYT9OANcu9rjs
	VH0uSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397be95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:19:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so28054385a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344347; x=1788949147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=;
        b=Rl0fkjSRRCoFEMQycFXLy5mUckp8VX4Ri6xG2y3mN7PJ+J4FLIwTi0psXoD9MR52XK
         v2ScvQk8uNdeAQKRpTIH+No38KDZX7zFpphP4+dwpuNuuXUqdqb/e79lhrjvMdtB99HE
         dfYmaK+j6l/gQwQ9zxEW3ecgvTpko5p/Y6JJzYIQPq/HuMxleOfk3PibO+HiVSmSEicO
         7BsmPgjUuMVcueFL0NXM7iyrFLThO2TZW5RYiOAy/paygGwBQwUb7orLCimBNtAtbt4r
         r6SHy5nOYSojM4enl6DFs8JqKQkAPI3lZlMMiI0/7u/hbthZYJOUDMKNJGtGXZJ/T+J1
         yAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344347; x=1788949147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gTiCzv3zvd/vBxiup9r8p45zBvqIEwioYb96j/Z4UM=;
        b=ssgKL+XVT5iH+x4yD9nrDgFRNK1cN3ATeuXL0LqQQroAlvk4xSdEm8wbtK7Q+cjxjh
         qXRXB68GYJ2FIaLCmEUOogIqsJx5zSI+WT9Oulf0XsWFdsAyST0vj94eJju/d9+ISFBf
         ETUNpBTNnLW5f0GaP8kVPg1jK5QE9xVbOG9NhzUerhKjZA8hDATmkSM5+dTtpBaW9+LR
         KOVnn1HTv/fd4VqaMXM414wk1tWaqjmXzRiXDSSkNnLDsxhyVSG0ITLHVAlDmQA/jJeh
         EJ9QuXeaWySxzCkSJpCf3llTkgI+ueMUimuOfeDuQ8JlGBrxc/5pT9ffmFFzgdmVTFMi
         eXNg==
X-Forwarded-Encrypted: i=1; AHgh+RrCk2CmybY50Pl236fOCj5pDwLDe7erLJM/MGxJ3hXwGgSoCVIMCkec8S2hZIcUv3w7vTduR+j6L9Gj@vger.kernel.org
X-Gm-Message-State: AFuF++kGekgJkKwcyUAnnEvtW/ZusY4kdASQzHmpoQqifgCM33veHvDu
	5EC312KN4XmzwzeNzjCkzjsz5EqxKGubfIm/1qbMVviCucVcrybmvGbnA6KDiJShFi35p20swUF
	ehf2S8ne104zGML0J4Gz6tGYKddLwWUg41bOlMSdblo1pDyUI2DhgknuMOMIjunvh
X-Gm-Gg: AR+sD13Y0c+EmjQ2JL5GHVUEl1NFlBU7XFdlMYG4OK+Tkqd1ut0IICTNxGeLO2mtsxd
	E9G70fUiEDANoTmf1cYwL0334O2OU5kN5LoytkzVuWA1zotHuXllb3ppf2Lh7PVpCtfIV9kVWiz
	xcb6Uqd+0C2gbfRRQwX3SRUAJJKjVJgqRQIBSjTKtN64qlPu29EWreFWGnuk9QCVf3M9NK+cFF/
	PKEDsPyJEpQjOeuoPQubHxXvPaUAsWbAEatlO6t4iJ82jkskXKj39pB04/5WWCdDnmTa4JfMcNX
	dV+etiT5iF/KzDiYeSmT8A4l/77zpURgKEhdEArAIYrUNysc5Wm3ZuK7wXcwMJFNffmGbKkLLn6
	DyzM/7ehS2AkVqHBOMtc6cw==
X-Received: by 2002:a05:620a:6501:b0:92e:6485:f640 with SMTP id af79cd13be357-9396101bfa1mr220042885a.4.1788344342534;
        Wed, 02 Sep 2026 03:19:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:92e:6485:f640 with SMTP id af79cd13be357-9396101bfa1mr220039385a.4.1788344342101;
        Wed, 02 Sep 2026 03:19:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041d4a8sm107060266b.54.2026.09.02.03.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:19:01 -0700 (PDT)
Message-ID: <a2775821-3f3f-4d78-a1f7-a27f4865df8c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:18:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX2OV8eIHFvRQ2
 lYPfyzercmVhQOq1JPXJ7oJ8sqIWL/1qaiZrl7gKKV4+hcNtKiBFIqa31aJtjHkjob+v5nY5UXR
 pz32uxZpR2N+xcxOJAu0WZMpVKnStFfQgwvoRtl8HtQ7RDRfNxn20aFV3mCTYTEBybI3K/A4xQe
 3rM7cMQdUYKPG0Uav1DiUi+MB5rIrij5CBUYELDlfT0yd3gAX2yJ/XL1UkgsdGBkS2IM/WZ26S0
 ihiWFiMppfCVF+c0b3amCJ+MTR4HZ6KbRdxUlZaiTZTJIj+0QruCNPFy+zBRo36qINUKdDSqEx3
 gDkPyliZvh0ZtteTe4GEblHWyRxLqOLmhOfCHI/CXro0s9i5Fcldhh1CBmNaOhRrO8MheK4Jv/Z
 JbS38WRF6VNluuDadRBwMsMKnZyC5NwuFcLUnzG8pGmELcygaI1qWDYluzMNQDJg08pznIQA4ub
 mn8/JM9QcGsi660hTlA==
X-Proofpoint-GUID: qYh-HRq6cuNGKDquw0iMNYCv1KCnU9oX
X-Proofpoint-ORIG-GUID: qYh-HRq6cuNGKDquw0iMNYCv1KCnU9oX
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97f81c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3T-LA-ZRmt1pDai6GWAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfXyHRFDFa6bG2c
 OzGzdV8wbylig74R0rw/MdE0iVuWEanOg0iIBNg4bNvVw31T4NZFXVpQno1AgfCRs+wHimV3QxL
 z+ohixJXGSo5EZwm2Xc431qbYhhDdzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020090

On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
> PMIC, and essential connectivity, designed to mount on carrier boards.

[...]

> +&gcc {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> +		 <&rpmhcc RPMH_CXO_CLK_A>,
> +		 <&sleep_clk>;
> +};

This is a NOP override

[...]

> +&rpmhcc {
> +	clocks = <&xo_board_clk>;
> +};

Likewise

Konrad
