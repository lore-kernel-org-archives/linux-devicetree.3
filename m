Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571839;
	b=upLp6hyxa0y8PhbvDLbGRtcl6XoqQxE4Wy5iJpGsmkFB5NtPlVIk28FFHSpI9HafvIdL
	 FyXtXWo7rttbJupWXuWogdDCxsQEhEOsmCCkUrQxXMWuFq9ub4Yf9iH2ju5tOmsymwzL1
	 62FLVRD9teVRpnBr2JocX6eDuTdTsIgRbjfxzWzmkVTOXQvDfdqJNQUvP+dHbOpEOdoPB
	 S+GwOB7vfSR5qIUfjmRlQGMp0Ttj39LG4Es5nSGoqPyn+cRsmeqmVwPHkOObsA71E1yW6
	 JekInYqnmQGwO5RjHUHQV1zrW2UCbJ7DuCTRjxoDH/kPFZBPOudejaG881K96f5W9KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
	b=KuRkxQVN30lB+dR9Z9P+Ao3q0HKwgd9bYavF6kv1wF8SUkLvYqBFjN9Gy6c2MkYVrjCw
	 QA9fI6JZHaHqJqBwzv/6kCFQFLNC0lZu9GTTGoROUwVltQu2xHkmHJd2yXLeT9hFoRMyE
	 /ZBCfn/OhPukHg4sLdIgVp5h1LufSho/ye7st2XqkUT0F9U0xg+5zQdZzSM7Qk8KuiR1+
	 Y3umdcweJX1pN/zyjuutUXwFrggFxB3H0/AmeXjgjP+g2CkMo5hDg5JxicTJtovSu4L+I
	 5dlvo0doJleI5j19fQnLMTkeJavFqrT4StBacVSmKriK9uzMGDuexXoZ/g90DHBCL3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6pDA0Mv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC7606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6pDA0Mv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0xO7005451
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=; b=ObBtv92BXUpOERJ+
	2WgyEdl4lbkD7pOLZH5GrGlE+98lvcAtyZbrkhFvxZIDGjJzZVfGGQmQjOzKKPqb
	9K3j6lvWgfinVvqZG47jlC4w4AXyt/jPlZVU3WapMHA5Sy+vPNw8jOIillPbbq6L
	wKuOh5azgiMcnunj/Z40CesmKcHwMvZhU5R0KC1cbbj3u36fdS1l5b/z7PXJ2iY+
	zLZIH7q5h76zuRurP7DnTiUTYFek03tFCNYM1cnBI3UTlIm+56yJ1kG7RpaJMMys
	1+TvvsDds1L1WqJ+1M8yRZjaLK3jgQVzjL33ANFBF7C2BLbiqj6+tEyCd7ssXpN/
	08SwdA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwawnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc781089b9so10881137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571837; x=1795176637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=f6pDA0Mv7h+NLAPznkf87t003GPnTWnW5SUmYSmwtxWRlRRfczwL8c/e8IbzG1YI7f
         SqZZA8wNyCF2PfC2s8jL7HpezttHGn5ybk4tX9d5MCaZ0H7TmKCHlN0YxITUsWER4QcG
         vjRSh/bTrCFKG3WnTZqMs0pJGF/AImMEePS2244H9pXkCeVyjPrhZ9xPHtb7fsphDQws
         S3WCvIaoL46kCLUkD7v/Lf2hvkWPwYFqiFIaspgc2cfiyYHIJZadQ6nQoFaWiaSdekCL
         4SSzKQCJsH7q8PqndvB0oP+5344iJJYuNtJUEtvOhVyZBX5+iXNrpJUXGZweBD6JvOEJ
         V0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571837; x=1795176637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=iogvVHB7ZtDSB1U02eIULHXPJu3xAXI3NUvZH7squOoUkBx/KGqcnOQvUz2JoY6TkR
         4+yuUTsKpMpxCSac3agdCLYqZbQ7Wh6aPecihTXEQWzScwVMem9XdG/3ZNKgJkrE7qxo
         Y+Q8sZugasX7L+FPLIxmliOj2f08oKOQHZCeqZFmIaFBoqei4pMVMv0p+LrqeyXoAQDx
         DOWmiTnNt3m1Gq7eZjjEKcRUGlDiW2XLSQ2fgNsVtNFcHS6+oJaBY93HYYbwNvIs2T01
         d0fas4fQbTvOW+/+IDkAaHwAZlvjSV9WMs8dC0a6iWTtVNiLFE9tnxZ4CuTUeVsXOlGC
         RUEg==
X-Forwarded-Encrypted: i=1; AL+hErFdM1cUGu4ATN25TTuuo7g2GvfR/QOIVu2vK339Gxw9WzQ9/5WVHm7thvpMjRqvGoKznPO/zmLh26Rn@vger.kernel.org
X-Gm-Message-State: APuU4Z8m9bQLmg6SZP6idWG+7rI0c+qJIYNqmSPr4r71go7iMBw2mPRG
	mS1LNdEzbfj718Bi9Qtm/Fv3fICwl3RndxiXbvDNmsMUb6QHR9sttXl688bxjWPahP+a5EexcIC
	vOLB1UTPOl1D+GSUPYrbX+JsPwi+cHHn3q+Wl/5wrp2JtLfpSeNdjFU6AsFSCcbHW
X-Gm-Gg: AYBFou1Sa7i94VpLQUufkj6ssAQBQg/tmaUp/erL8LuNC/cvpogX2nyV27eq92WPz6G
	kvyLIlS5qdr6Vv0nBWI6DwK1VWPNiXA3be4lbljbg2RvHcnkwSbgUAtsnILseI5iIvLhw4B7EW5
	TJtRWZ8fDr+oSLpM5ChUB+aIYoDj5EgdSTecK4tBbGNGKHA65V6YKurJj054WipCE8GiwMZrhZY
	L0jWnoDGFtneqzkGD23v7b1lDJfFSNIkOE4F7ZrTkVnzz5M0pSAjWqkJAGAywsOMUhFVCKTEcId
	EELqNX8FppWYU7IClCK52G96j/yjpwU2gdPpMPpflpLD6K+z3QwLN7zKdh1wfJTlAHCKeNJ3sZe
	gRujGMBcH07Ry7C98uRCLp8624sUZXuJwS0pmKbyOktQANI3DjFQDL7tXqZvwES+FNLqznf4=
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550094137.2.1794571836893;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550065137.2.1794571836420;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23ddf82sm870968a12.26.2026.11.13.04.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:10:34 -0800 (PST)
Message-ID: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:29 +0100
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
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6fe3d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=U5E2jiqv92kUeAjINO8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: iOuA9FelrJ-5eFdRttSZI85kjYviBNts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX8fRdBcd3gWlj
 WCjhhmMRLwAfLKfXekY2rTKw7xwMYLZwAFDGKDdjkGmry7ZJVw7dA4Tvnx3obldbB0WRkJu/+2y
 h0BW4UOdihJjNt7F0yQqXb5noQzNDVthxHRyzFHL3HzbcOsP3OozTqaYv7Rz2PR/F5ofGAeVYxU
 EAxyQnxtHCTCYCPabZNyiaaNdsFimEJ/AZEwYChF0q4alsuUbub3CSGssbZAniXNcYYnkwhXBbT
 Po8gKOpXbhPA58iIY9I4dYz+GfJVzlLBNr9YqJV4Mxs6H+JXvrEmyaD/JnEbE5Zjh+MGifd/YRJ
 FBL6Y7y7o4jvhPw2bs6ocOrZAJZ0oBWe9TQTwtjCGc8wIuTY/NQFOJhu3TNaDrrXx+SB5vXAT4b
 o23HVxUDqnc9OyzvxR8YmUvS+jHBcSOdAHV1MKP0Qxc/pZCJRhM6p2KL6P/A82x3NrajxDHj+JC
 AIW6DyeHZ5Z+bxwWGhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX0Wd1YEpVr0x8
 G3lCE5Om7mbWIgT4xXl6p2W87xWTvCEVEplcy66693oi5PXFmUy520DQX9g+eTJojEewaP6CLAS
 4GnGxmdM4yO6rklMpDkFbsRQOGr2E5g=
X-Proofpoint-GUID: iOuA9FelrJ-5eFdRttSZI85kjYviBNts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			gold_cpu_sleep_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "gold-power-collapse";
> +				entry-latency-us = <400>;
> +				exit-latency-us = <1400>;
> +				min-residency-us = <2207>;
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x40000003>;

Please add the other idle states (D4 and E3) from the downstream
devicetree and match the order of properties (psci-suspend param)
to glymur.dtsi

[...]


> +		usb_1: usb@a600000 {
> +			compatible = "qcom,halliday-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;

Please use '0x0' for zeroes in reg values

[...]


> +		spmi_bus: spmi@c400000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0 0x0c400000 0 0x3000>,
> +			      <0 0x0c500000 0 0x400000>,
> +			      <0 0x0c440000 0 0x80000>,
> +			      <0 0x0c4c0000 0 0x20000>,
> +			      <0 0x0c42d000 0 0x4000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

Let's break up such long lists into one-a-line

Otherwise lgtm, very nice!

Konrad
