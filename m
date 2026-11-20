Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178116;
	b=xBECj6zNVEsda3CMjXAff/Ryc8Npy3ud9YAa7gHugcuPTQL3kwadpk8ReMeqfYa5uEej
	 rrzBqjMdIX11OZPSnDU1rBCzED7FmUNrj5myZhxNMwRlzjoTQjZcQmIYMv6D3HYYT38AX
	 R8BnI8X4e9Px92dkyjw/bj/WNwZhUu3K64Ts0Q6Hl8jy5wpulYIhgEfMeooDwxopzVh5J
	 80C/5vf0zTOyKvvTq6MnHc813kfc/O2uWusVsIi5zzjLHXK86vELW3GRij2EL3ormpvnt
	 qVnSn1aHy/m2RsS7cj3C46Jjv8olK4Y35+9d9MxI0K1RonvB0Cr6BUNO6lvUtIDgSnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
	b=ep3dW3IuNs4NwKIsozG9FxTve0QW66Y1Qw+LfJIUUj19og2ABGCX8u31jx1dvaBC2TZv
	 4JuW0vPMAjGphKMvDHnOWWoyxMzzrPNpItcnXNN/40J4j7XOeUiR5DY9GB0fAWQFgRAVQ
	 y7D9PcI6btSWbPcAvTCFMJGKJzE2j6hX9BsXHwtM1ytxunSCR9EvwdT5hVqIh35rhR6Mx
	 772JfWf13n17Gpwh0VCgj6xnnWJaWrsgmfA9eijAtSy1WGboifbIyBMt4BI+V14ZESOxz
	 oE0ZzAxRQ+8eMudoaBgBi6rnsuvL+QGVskX6wZSg3XMippKKZB2MTSdX4+Yz97tBAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQ4gEi8F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rk1RXe4H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF6606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQ4gEi8F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rk1RXe4H
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1X42433127
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=; b=HQ4gEi8FRZlbmoyx
	hcFr+Dv6HlcDFzaK6V+8VR+n1LBPEJPSINGyXhsRyjpuJmsn8xbox2xYAHPRn3xf
	QbE/OtkSWO7xwJWLKRwy/8VPSSKEc469Gs3ZBwzKtroSb896RiQ6Ab6Z9M1KZa2W
	lPetadYyO7Rnjrp9msTNhnU0e1mQb6ZlOQS4a4F9yUIU1e26Qn+ZOrew51su5bkL
	7qbc0hYOGR0OUGBoGQkZoFB08d8QANQGS2NqvCYBHH2CwHbwgjhLqT/tNSogjs9p
	4xeP7MpjISousbiS/gHOcLjF2lYavGUWDNzDB12DWRzYYzR+kUwBxEzlfJRF3IcT
	LGh3KQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9tgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:35:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so1292015eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178113; x=1795782913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
        b=Rk1RXe4H2pFFfaBGGM9Mj1y461rZLIul7Wclmu9FXBpW7fvxSQvaIOCZARcI/rvgYi
         CGi76DOZqFZJfcWp0TutuaFsqwuTGcPDLU5kO5odiEwB94auvcPtCQrVDCrnIW7+UqrB
         NXTZV9J+EKZ8rZLmlIhxUlJuKgr8BnK//Yce2X+5jJyzyRL6HgQcbAXQg7bHSVyVCh2z
         uInprlPBF/bBgg5IOO8jdp2fjVyT4YILgdIfKYpPhKwkb6jj9ZUb7NBKy6Cq28nwzmnm
         Sp3pgHTT0fXsqjhDUR/MuCwfkpD4L6iv3n/WFOD0qEEv/xor65AYi4ahEuaG5LnYgktr
         aJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178113; x=1795782913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
        b=Yi9VBSw6XdXUWp+8axJIQBkt6hj7FXIuT+Z6XXR4jMZEXSFk6URPZyI7DsBUTQwOLF
         RVI6vR0AYI++aWOMKeDq7oLzn4tAseszCqMrQO3N6oLxOeps33doEatxHSUL6VdrkElt
         pxBet9SQXf71QpQdo26no2rvepQJdGUjeV5mIM8GCZVkWEqRudbX/2GFrzPlMmovEFRa
         hYAyYKpYxM2Dbbx70o3JDxf7m7klppaqBXUP3kw+PNJLQJnfOue4hcIPHzeTHJad+UzR
         8to91Tuu0F/LptS0Vz1Wl2bYVWeRcbWCo/VrAGV2/qhHpGIvTVf3/R47+77TWJrhSMhT
         in9w==
X-Gm-Message-State: APuU4Z+TW4ph4tewAJkMs5Y1NmdjUDxHjFnvSIlSUaoAZjf23vSdVnKI
	2/xq8bFcqUUNLKLVN7beVUvbS40xh1P3XtvyLKwWy2b+0liaXUpSMrG0zGg/nM7ryNcsJVU9hPM
	DVjlMXBOHegEloY8o0zt4Jyc3cdSZ7va/PiePfeQwxWj8pN72aj3JjypRGabtthj4BM0YEbCV
X-Gm-Gg: AZFdTZerGsri5d+WWVSeypU3D8KB316OYbXebhpNoWenA7dv3sH6B14Q51qe7vSmk68
	CnUFCh3MjTKTe5585gg5TBBj5NW69VYCtSUCwEKItdcbd1+1okA+CaiH8007HPXu7qeg2gVrXb0
	cmtNC6KrLuKGMRsqYnar7TQNoR+dWukDQd5SbQYKMxC31JbQHU5h3aEUbSskaDogl3ijFFuHWjc
	w1rBkcLWvUTKUBJSDj43ekU4nFnXLnwillTzzOgInyrWTchHAoOvU2aHceX+w37/5u25yPv30Eg
	HscPqen5PTkjj1lcAvUnMloZVRVcqTl2f7ROc8b4ImhpfHcjoepfQwwpqS+hOxc0gop5Lfv1uNW
	6zVUVxQUXSx+khfT7Oq4RLfLt0NmVFMli2k4qnIfgRtk7VaUJyURB5FHIKhGyu37y97ctnhlNob
	9L
X-Received: by 2002:a05:7301:4606:b0:380:d1bd:ed2c with SMTP id 5a478bee46e88-3856f54aecbmr2594212eec.27.1795178113320;
        Fri, 20 Nov 2026 04:35:13 -0800 (PST)
X-Received: by 2002:a05:7301:4606:b0:380:d1bd:ed2c with SMTP id 5a478bee46e88-3856f54aecbmr2594181eec.27.1795178112439;
        Fri, 20 Nov 2026 04:35:12 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm10442441eec.4.2026.11.20.04.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:35:12 -0800 (PST)
Message-ID: <f2fd76d7-c66b-4def-8a63-91d4a3c7618f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:05:09 +0530
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
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
 <sashiko-outbox-223069@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223069@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b003e82 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A4kCXxDk9FfMGSrLdMwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX08C/5TdlqAZ/
 z61MU8hlOLH+55MNnLHdokbeZCVqUQOwiQXSNnlKxiQjAFPYK2GM7OEXgC4fJmJcfzrfsOcVF3S
 wvah4Vs7CE5sKUqpYjoN3+bIwiuDP4o=
X-Proofpoint-ORIG-GUID: X8a9i4xEgW3Zngp7J2_JJiLltPK86vpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX7cmqlRCGL449
 PP29Ke7St53UWsxO8knLFBMKfmFXIO0zmXoGiGys7mE5KZT3bdn7L3lkAHrTc7Hws4YdbLLfYld
 BRjHR7zLC22zQ4yRHRMYZMbfvAqtzbj7OBZoYZ6OKxPCj/X3giWZ4KRi6aAThiOUw9XiqWo4FyK
 fI1700YH/3KWpTpWVXZsPHbLXPhyo2Rj2oZVRYGReC2ukEPRUOKG5PCJqVv8N8+qQxeZ+qu66+y
 a4iCXNDNiqN1IrKe+JwXyCfDt/EnlIv3hpPIl7s4nM4Wq/14IOsV6bbsCwJSSfpyUNpAkVVNfaM
 Z5Jb8INrBnAsdu8MxqvEMzDq8RhP/8NnuXe0cWal5H8/XC7pfdFLnRfOM06DLuyzFqvqGrb997x
 3fRcS46+PRTfOFkASrH1w8LaOUk6UrAe8s7UA97rd2AacuqGDtVU2SEqBNKZq7tCRqiiQQxUOky
 kVknFm1aP+T5LldchBA==
X-Proofpoint-GUID: X8a9i4xEgW3Zngp7J2_JJiLltPK86vpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200049

On 11/19/2026 5:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: shikra-el2: q6apmdai iommus fails
>    q6apm_dai_probe()
> --
>
> commit 0d5069de0241cf74b87f4a2a71c79f4b11c8da67
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
> This commit adds an EL2 DeviceTree overlay for Shikra boards to describe
> IOMMU stream mappings for remoteproc firmware and applies it to the Shikra
> EVK DTB targets.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> new file mode 100644
>> index 0000000000000..89997ed7699ee
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> @@ -0,0 +1,38 @@
> [ ... ]
>
>> +&q6apmdai {
>> +	/delete-property/ memory-region;
>> +	iommus = <&apps_smmu 0x01cc 0x3>;
>> +};
> [Severity: High]
> Does adding iommus to q6apmdai cause q6apm_dai_probe() to fail with
> -EINVAL on Shikra EL2 builds?
>
> In arch/arm64/boot/dts/qcom/shikra.dtsi, the ancestor gpr node sets
> qcom,domain = <GPR_DOMAIN_ID_MODEM>, and q6apm_dai_probe() rejects any
> iommus property when the GPR domain is GPR_DOMAIN_ID_MODEM:
>
> sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_probe() {
> 	...
> 	if (apm && apm->gdev &&
> 	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
> 		if (!qcom_scm_is_available())
> 			return -EPROBE_DEFER;
>
> 		if (pdata->sid >= 0) {
> 			dev_err(dev,
> 				"iommus and mDSP SCM path are mutually exclusive\n");
> 			return -EINVAL;
> 		}
> 	...
> }
>
> Because iommus sets pdata->sid to 0xc, the Q6APM front-end DAI driver will
> fail to probe and audio will not register in EL2.

Yes, this is valid. With iommus set on q6apmdai, pdata->sid becomes
0xc and q6apm_dai_probe() returns -EINVAL for the MODEM GPR domain, so
audio would not register on EL2 builds.

To address this, another series has been submitted [1]. To avoid a 
dependency on it, I will dropp q6apmdai node from shikra-el2.dtso in 
next version.
Will add it back once that series is settled.

[1] 
https://lore.kernel.org/all/20261119164705.1594066-5-mohit.sharma@oss.qualcomm.com/

Thanks
Komal


