Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0831F992
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113725; cv=none; b=dh/RBoTytDcg5bpgWyQDXHOrgyASPfKKMN0oyF8NhCV88ByAYFloKNtbw1h8KU1uEOUqNrf58H0VUVNC2ECjEhVzXAt48FTz8nM74/iM/Xok3gH+8NHA/lfXiPoZDIK1Skr/fEcmcu5ubYqciyt293Zj7HzXEtZ6fCQ1X5u5AyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113725; c=relaxed/simple;
	bh=TN+RB4MvwPNVjTQyrOZFsnKn9SeIOzNa7rKStzEAP60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeEFZHZEPLDG9/+r7yPH2wTlt3whA/gh7eiCOpiWwtWKNAhaAm0qd+ipbKC96Bo3vIwHwX5ekHdY9ClKz3nywev0Dm5w/hUbZDE4s5+zhYGEve1VbxASlL1scvZcUCOHZA5IoHaqC/i47rTwKpGclMFKmuaxWMVPAqmjA6vZ0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ9b7bFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdjpCfgO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ9b7bFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdjpCfgO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICpBlR2438195
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=; b=IJ9b7bFAeMpd+FjF
	HnelMReAhJzkanlPDuAR+teQUGers9J7Zm+ABfthhX07bh1Vc9NxWJ6LodphBJlC
	kalNdJjr4FWUtP8gxZVN7XZdimWtPEQFDFylsCWPljAECp+cK504vDcpbzHSwg27
	ciL1j398fRSEi/OjY1q0cHY1LOryCmqztZLsYSjMUWunnWr+CJOG0gmGE1zq2UQN
	YIXnXeR+yjSWx/Hqn9DuyAeX8yj+Zlw6cxXS5E9HYLv1iJdZW7qhYpP4mcl1GfzC
	CmI2BrqrSnry+0cUDS+09kki8WVyQFg/tqW8mg6wm76oTtbYsQ+RF5fAvloNPAGq
	FlO5dQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v0af2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:15:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313443ffa2so119935137.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113722; x=1779718522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=;
        b=RdjpCfgO17VROALjGIzVhekyfhuQEJMnmgknIg7s0E+joJtqPKQd9fox4i+sjVkd7U
         wOFPy0nNM1o2sX8aa2DhCu3EEUsHlv5JQW9DVc/dzbXG3ebzDkvZxFLwpcJLUB9p1eNx
         kLXh8rARqeFtNuD/O0EypY3nmdsC5oBGV6DJpH6VW3z+JoEEinpFNpm8seRNyDipX4Sd
         Q/03hnrygUj930pS7G4agJs4tQ9f899ruZ1TxYRyaiurOEqYPrv+HI7dQsf2oVUli70l
         2NZGbQEyh43XZv8uy+aUADML9yCiASl1XLFktBqTQpe/diioGt6fiSNZDFA8xfzYCDzM
         dvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113722; x=1779718522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=;
        b=XHLVYviH3sdc7RGgnvjUTgrVLMybZgDap8vuGOBH4gMkq6RC7N5y+QN04Yhdrj9xiQ
         FfAQ3UvUgAL5bl1UzYPgWN/QKUK5/5Ym8IALn70poyk8mfqLNKG1oHrirNM0vItEINW7
         +3ixaSRadZ8zSKeLZrWAz8W7w2NhzI7ru1u1gzQTCBMwvY+PkjArRIa8zTgRnt2aUHQ3
         thi/8wo788NhkCB8xk0AR9dQajI2Av8K5OZy3YvMErCviwy7g4yZZrP5RHfb1Ar/poGQ
         75O1vWQsqcDAch4q71D5uzeT67RCmFOJkPDK+u26FmSFkWhOOia3uz0X7EI7thsQ0jNT
         Kycg==
X-Forwarded-Encrypted: i=1; AFNElJ8vNwhzT4FjfK7PlRw3eJV0zqzNhmaqIPTXedekfyCgHGycVu4+wSJ1VHfEA/PmLs160DbShE4YGGGG@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLw90NEc95EeApYcgGptDN5J8CYYaex/yj7unvFrjBu9nERTw
	U8hcpqysPKCVb/BVp9SLSF1Hu9Svo/DSDcJOhWaPcSj95QeiE9QE5qAxDT7xj5pAeTsahmnN5VJ
	m0ylyGqFUYokk2DIZq5WPaK0ZcJemU1Jn8ietI3IvMyeq39xeknVuyn3wvZ8s04Iu98S1ansP
X-Gm-Gg: Acq92OEgBpcurXdkxzS9OqxxvVB8KbgXt31kQulnRUgpqiTPDXpK+3uwDrFegpMGFL0
	Xsfd0+yJg5Qe3H1TVWNhcbprLvA+SdL1D37cjVD373VMfyBbuevSNR0FR+QfNgplM5g1fLc1BmB
	u/nyvy8FWyWyd7SKFJyP6B6DcDSTCXnG98U7+CgJb+l0XtLCwzA/gMmcvAgL7i39N8qVDEEMbfH
	g7g1wRWd+FGd5d9I6uE+KbZVtNcRkAxNtu7yE3pArvAW9cE6JAXi6pd3+ZBtiAD8isPtqVdPjfT
	jnqkb0hrcpkZigGh64Fqzifvj7dy3yu1sd1gR2gvL0KF3utrjeV6jrkOYCCGqULhTL0ntQXNpua
	2w2yNgI0luK2T5BxzgK1W92zc2rrKVgEbQOlIvL6zt1dk4JFqKS6dPx0N+A/z6EykIIPu3mOXqA
	s0OO8=
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr2115113137.5.1779113721956;
        Mon, 18 May 2026 07:15:21 -0700 (PDT)
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr2115097137.5.1779113721214;
        Mon, 18 May 2026 07:15:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd7bbae7a93sm132624466b.22.2026.05.18.07.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:15:20 -0700 (PDT)
Message-ID: <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:15:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b1efb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KUSMMZrqeANCeUtcB44A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: cTDb1CAU4-mOilqxjqIqMOeLFiwFiWHy
X-Proofpoint-GUID: cTDb1CAU4-mOilqxjqIqMOeLFiwFiWHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX7Sw8GZoM/l7+
 I7glxnSLViuEG5cKL6E5xJCRjBv12I3lvuqGLNpj5EvWdgIKTcKhBH+SazkwXhjeLSCHqqH+sij
 U8NUh1fCjraEywo+W9noO6Cive0Gws7x8CLfwuzC5AmqNzEt0tv/ZKHl96Z6krjKXx4zCKcMjWL
 o3sBMn2HTpQt6tKXowsyAgLx20XQcmOgB3RbhId+w6wMAVHgyhEHCe8ahVCgEykE6rI0DfEMlL+
 02RiGIUWDn5SnFBEJeWKYstJJunpuyk7u3oX1akgootFFbnlEDKPYCviBfZPwlYB43ETf/jNWQ7
 CPXQhPIqPmGrs7fLQtPwvGKmtaBeYkUVYlFBnoJMEhJvACnGi4jOvv5TA6BlhMPSZiQESW+H9+A
 t+KEjSvoLJDEzOD0L9SRA8hHeAEj5P4zd8KPuO4BkkB9K+QHjuhRpxKlC2mzoVzzDRNc6+rImWq
 kus7RpXuwC0LPrOkj1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180139

On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>> and DP signal processing capabilities. In that architecture, USB3 and
>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>> The DP part is roughly the same as on the instances without USB4.
>>
>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>> Only one USB protocol (and flavor of pipe clock) can be active at a
>> given moment (not to be confused with USB3 not being able to be
>> tunneled as USB4 packets - that of course remains possible).
>> The DP PLL is still used for clocking tunneled DP links. It may be
>> turned off to save power when no tunnels are active, but that's left as
>> a TODO item for now.
>>
>> Due to the nature of USB4, the Type-C handling happens entirely inside
>> the Host Router, and as such the QMPPHY's mux_set() function is
>> nullified for the period when USB4 PHY remains active. This is strictly
>> necessary, as the Host Router driver is going to excercise manual
>> control over the USB4 PHY's power state, which is needed by the suspend
>> and resume flows. Failure to control that synchronously with other
>> parts of the code results in a SoC crash by unlocked access.
>>
>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>> submodes.
>>
>> Thunderbolt 3, having a number of differences vs USB4, requires a
>> couple specific overrides, pertaining to electrical characteristics,
>> which are easily accommodated for.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>
> 
> Overall it looks good. The major question (after looking at TODOs), do
> we need a separate submode for USB+DP / TBT+DP?

The problem space is as follows:

After a TBT (collectively TBT3+ and USB4) link has been established and
we have a link partner, we may (based on the HW capabilities and user
config, such as kernel params but not only) start or stop a DP tunnel at
runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
as a separate DP AUX host)

Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
(and each of these routers is hardwired to one of the PHYs).

To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
super high-res display at one of the physical ports, or a long
daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
we would only need one of the PHYs (associated with the router that's
wired to that port) to provide a DP clock.

This, along with the normal (logical or physical) present/absent status
can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
or something along those lines to toggle that bit as necessary

Konrad
