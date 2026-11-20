Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179559;
	b=09tQzXR9VBbXYiyT66vCzfvoo1poUU0bCw/hgLNS4W8oejiTfL93GwpMCOPbZbI01BMf
	 lGkAWsFYopjgqvz8gVvXRTSWV/JKkuz9PhxXp8VXjE0bI8N/NONNknHUihExGjx2Ec6nR
	 RAyVIkfkX4rdwNEBUjdv/sLBRXShFypNUiE2paG4ZFnwOCpISm+3CpGsueoMy24TEqG6I
	 TIZgNGVNtP2moseTV/QBx8jwCXOhJd0G5ARgr9kYn13SdS4FeMN2dr9TU2XjMCk1jRsUg
	 oMFXxG346MbK5ma5PnoHV5Oa8wtEUtdUP+vZDtr+vg5Ecsnbx6aPegHGcwvksf3AFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
	b=PzkhpfscYDj9nnJbm/kw0jwVnLlQjp4BSZN3IZoPcZniGC4TSn8rtutjjwyIWiKFKnlD
	 jqoxUShLQkZtaneD3bNRaJrjyt31Sq6e37BDJ5F1xa/wFKcF1AIBGK4D6N1p5MeVzI9Af
	 z05W+0uujHT8ra9P4ZCxWiWzAoS78jNSsLoO0KgrwzsiWI52U3GWwNwz1eNTwEyLIJbPT
	 DBv6RYPhV0Fd0ILptokG9KOVdlpWAXHSZAFOb+0o8PDWva4AYO12pdznENcn6JE3Ccl9w
	 wGYv5qeWTSAAXJ3kk0gL1XNFq8uVYMV4YglaMnAYTvNR9eVbM4vmTbBuUEcQqvnBq/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+zUxjC+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PWu2qHfA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0F606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B0F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+zUxjC+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PWu2qHfA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwGb2155236
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=; b=X+zUxjC+ZOBpHwt7
	ry1zTdTsCdiaudCVPib0IFZefr/MVaXsaoVj4Np40OcmsvWyLI84NpKmViz/tpsI
	4mQ4ZhmPA4G364akYg4wXIw+zT4qk1SEpvTB0Q73UjLa5MXmg/XtKESS+7XgWSK9
	bufZGclCLhEEMujKfcbl6+3j4HiNRU1mvwm9LO6bfA0NYG1w73zj+1EHsSbO7PsQ
	Sosu5jskQfx4WZQZ72Pg4WMVhTIcnaDfXSp32AKrPe3Om7pUognbbOGLmdSSnYiP
	xWz3JkfSOhY3s2YpgzBEybQ2AxPN4Pcl6UrfqnaWjl3RHgktLSaIr93u8+02yMFS
	9ZomoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj0pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:59:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2733309eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795179556; x=1795784356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
        b=PWu2qHfAwIuI/6jfVxUsf112EXs6hnSbi92Xq+GJffqhPItA2m44u1Red2PEfOb91Z
         /hNYXstLa68g+hbYF2C/6FXK/D6iuCZUvs2JSrN27u1I4QheAygPh3FGVZloiNJKkzsd
         1SU8co/jPKOqC+m3kVvTveVaIoLvHF75G8KCqOot0jTKxx/+TjAg9AFMUN+w0t9Zuj6R
         h6woHFi2haxk2rhzvoJRM8YkR3NP5qPVwZjQkqfWGY5vXnGsHgm/AR8dkxek1T+cVr3P
         1CPZ0lOdfHjefbrXTFSA5lOsm89Fs7zzKuDCSSJ1SxlceNvnmBmBDMMayuSNHvI+Op5j
         No0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179556; x=1795784356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
        b=bZCMs1jh/S1kGZ89SgaWTprBnhP5EH8MbEs0bjL2CYl+tKLcy9WcxxaZwQb7fN7Gbe
         s8NSKhkU8+8oNjhDuCr0lK446vUgL28j7X087f+mF80ojICrHdMDwWiFSK82p/xKxAto
         j0zDupkcxmNOwsoQACl1N8K4he/d27CvfyqOr4eWklc7fvj66c8RDGPrxgEjZiZ/L+Tk
         A+E9EeuK8RfTGBJKk84k3whA8wmTOsPdYzauWYxFLNhUp8XVLucZUZ+qHcT+td0Gznll
         sbhPB0apN2a2n3G3NBgRblmPF2cUqpZjv1VE2pweIX2u1bw+jSkwxpi+wl6JOXRJlIFy
         gUqw==
X-Gm-Message-State: APuU4Z/Tx+byaRVAFkTJgSs0/Vv9yS94B41aVEVCkyoALnFHqIsmPwfK
	Jg9rSZ63Ls8NrkRyvw8U7eMUq9bwudydux7n3sj1UwlWfuN/n9B782piUHPygLqJ90fpF+7ZZik
	SIq2TZTencRwXI7q6BDB073Q72K8ibDiDpS0gMtxg6eifpkKncAlacTlkYatF9PAQM8AMNdH8
X-Gm-Gg: AZFdTZcigsYTrz5bZOEx8MerbhQ2F9Mrk6PKV48heKCgLTznzGUqDd5WfayjNpthEDs
	XqwZyCKOiWsr9BVtzrw555S6yHI/eCLrlHKvtjMR3UMYB2hUafha3OBKuC47Or5oEcCRYC+lRQ9
	FRhnaDrmLR9sUc6gLRKmeJN+YYto2mzuQntK3GQnqPgHpz1GJmV5MsCBQQ3VnF5sL3tvIxCO173
	sGBlH324Z3JcgVBeDf4aAR1gbV5llFK2/KeaiRwuV6zp5toxoDsxQcljr8NFOOoqLUTDN20l14O
	gt7ib/XgrrDa8QTdaYLS4AdsWPRiZOgudJMkOgx/YJLHWk76JvFt0J0TO4y/CgwQbF0m3C1EA9C
	suK/vk+9nzBMvSyVECHbbwrzciPKwabneQYbcnH1UjNJDuBezE/LhihlbLt3bnpVTwnTuskWgV+
	Hq
X-Received: by 2002:a05:693c:87c1:10b0:384:4451:f6d with SMTP id 5a478bee46e88-3856e947af8mr2734857eec.11.1795179556330;
        Fri, 20 Nov 2026 04:59:16 -0800 (PST)
X-Received: by 2002:a05:693c:87c1:10b0:384:4451:f6d with SMTP id 5a478bee46e88-3856e947af8mr2734839eec.11.1795179555873;
        Fri, 20 Nov 2026 04:59:15 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7801022eec.16.2026.11.20.04.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:59:15 -0800 (PST)
Message-ID: <439d7620-b701-428c-96e1-7b017b16ba07@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:29:12 +0530
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
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for
 remoteproc SMMU mappings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
 <sashiko-outbox-223064@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223064@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004425 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AWZr7nFnjNTLzfHANTgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfX2dvii56/T+oC
 rEer2Vne5btOn63/8QDHs/XJa3k/DSFmeO2PHlSVGGrVPt4W2oWZB47gtXAun51wBjY4yVb1YYB
 mPbsmH3mFgOryAY05PxogmnVtV6pZwm8uLTBaCDXj3V5hs5frZt7KuGs6VsoItwfiBmPOqEUF/B
 dFqQKhRI/a8QzqML8aRqfRrLVdVCUPsj2aw40lGH/9FMwO6jxda6e62mcE3/8TTHFbdeAUcslmx
 62PR1SmVFzkScrffAFNYtjDyG9Z8K9LR4krpL4QOdRCQRit4/qGsGkw3P9kYHzfFrSMt4H93ZnT
 AbWXwU20WFPxNeb4mrMkeLPyKlIporvptbqqVwJIKAt+kF+IZcSkYZhHqwbq3uoWovDlSXa/tF8
 jZh43+ivhV1jrhYjV0iffkrBQBuOSzNTOgnAu3xDNnc/7a/271O0MZ628v/yenokOIIWzb+yvkd
 LROoIcA9EBI+0lKr67g==
X-Proofpoint-GUID: BXq4VhZCPnvk2qzRwXM2lfT3RbfcijbU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfXxXZrdCovqWMa
 9r2CGIOPyWW5+yaUoBUqKkwocrPNNYYPa71Ov1agF98tC9p6kLwdRRakz6Hfj5MqpVUjZI5enW2
 rcgPjA2IEQVeGj2j3cdSnssNZvSre2c=
X-Proofpoint-ORIG-GUID: BXq4VhZCPnvk2qzRwXM2lfT3RbfcijbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200051

On 11/19/2026 5:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: qcom: commit message mentions Shikra and omits
>    disabled nodes
> --
>
> commit 4293b12aa38fd366536aa13846bd84f70cea3ea7
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
>> arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings
>>
>> SM8750 board boot Linux under the Gunyah hypervisor, with Linux running
>> at EL1. Linux can also be booted directly at EL2 on these devices.
>>
>> For EL2 boot, describe the IOMMU streams used by the remote processor
>> firmware in the DeviceTree consumed by Linux.
>>
>> Add an EL2-specific DT overlay and apply it to the Shikra IoT variants
>> to produce -el2.dtb artifacts alongside the standard DTBs.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> [Severity: Low]
> This isn't a bug, but the commit message mentions applying the overlay to
> the Shikra IoT variants, whereas arch/arm64/boot/dts/qcom/Makefile applies
> sm8750-el2.dtbo to sm8750-mtp.dtb to build sm8750-mtp-el2.dtb.  In addition,
> the subject and changelog only mention the remoteproc SMMU mappings, while
> arch/arm64/boot/dts/qcom/sm8750-el2.dtso also disables gpu_zap_shader and
> iris.

Right, the commit message was carried over from the Shikra patch and 
does not match this overlay.
Will update commit message to address this.

Thanks
Komal


