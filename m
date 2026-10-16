Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232845D90B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161321; cv=none; b=fIIlleux24EqcMRVuv1UxaP/EBWlPdkITf+zQA66oaGs7CowBPW732G4I98Lm7z7Jq71xAUvSoOWrAGyZJdwlqy3qN+NqMvc0TdFbNTW375ftNZt0rzKfzNopaZNg7WoIdmI4ajyuE1B8eL4mRaS/LKQYd60TMpX7KytWTx7Z10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161321; c=relaxed/simple;
	bh=lTVEVyvxqPMEhLqNV+zfwjKh2AGmd5+/Os21Q0iXP9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuZr6K08pSYL0TXnmpafURIiNylLTLYJLBKOk33tzR5DgKPlDgteQbr4njip8vhDE9dy0WkBt+FAhlBEhg139Axf/TayEEaHbkLElOpoUTs/tXVcOUMwH/yTlxtQFk8K1gTnny8uvcZqpS/j53w87Yken60FM5CoaLJDC/sBJT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfAw1sbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHtYRXiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfAw1sbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHtYRXiZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Q3m2494922
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=; b=SfAw1sbBMmBWkIqz
	7zB4256mNHB4FyBO/QoBTiqXiGlf74lFUBwtHgEhfCuNRMn+OzHYFvMpWpznAzxN
	BwkaWjonr8YLPTvck8wTngWI+cwf6NmDkrjsTlHxr/wLfk25gi1cwebMrNQyVIvR
	O14Glegsbh1xIncjfZMlalWSLw4lrxtLR3t9kLeH66wnvc5pArpbXnAellaKhwye
	LLnU+JL2VmFKl5ZiPMs1iXmI3ZQJPKifTYP5jaJznEO7v+iOV0KO+HLZMlpfphHL
	Sq0r18edjAVxXqDDQUUWkERaB7n9LBwntzEHwCOmz4lDMi3nORl72lw9kWXmK2m4
	d8pyyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8b2g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:35:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso6785a.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161318; x=1792766118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=;
        b=BHtYRXiZbiqCIZa5RHgSS3CG8kS4p3GDC/qyNz3G+nTyyqDxaCNwAtspWUXB5OoE4r
         VkSkEZFSio1xWzalZeVo95/8NmFHmMIjwRk8nk/csbdUDl//e8WjrN47GzGu2qFgvVV+
         1GgXjy741kkq9WRCYX+v/FmqO0ECAvrOq4pUrl24aXhaex1sSMfYw1Pajm5eHjQPamt5
         MQI3nyH3uATl4vYYtO8WpZXWfLZDvbpHZN3Ebt6MJIEOvMUkExJMMrJ+0h8pegDiwoq7
         lh5gt/wenXZXCvT774fJNQO36NUq9HCIOYj3jY2F46W0QW8g3qtb03zqUxcaDVAtVFoz
         68aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161318; x=1792766118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIPFe0GbHM98hVhSZtxVKSxAcZVf/6T6nyXYDstJUcc=;
        b=QaMz0Yq4+yU+yoQN/AlnvrDjVOXjP8HwNvndG547grEdGgKmHie1muHMOPCFkQKv4y
         9vCgE2ODfRTY/IspCJ4aGXqdV+BtONBW3LWs+F+eiZLEzLD1DlNXLPB6XxNn1qMHe/6y
         rTfZW+0lsvjEI1p3XHF9gSqqZBkKZWF5HqCRo5fO+qm2UEKzIvMtvmfHByYRgzn+6ieU
         NcrdS3TsqQBpIvd5WAZNaEPj1F6XA5slO3pzBsaTxqGVpAxNOUD5RKlkZcQSmiNUN+NK
         Gnx5a1Ob9Jq5c0nLEba6ZgWeOOLNekMa1tATuH4p0HOondFGMc9huV+M7rP+QqpvFfxk
         rnTg==
X-Gm-Message-State: AFq9FYKN6S3e+0MGxzh90jBwGgsVonaJOJQsyc7/TMTPy31WOayRNSm8
	65jna3M+Oyuq2EeggEuoCRC0LVsh3/BD9gGz6egdkDm/ppHOr5+vCIumbACPQK8gYp1utUpSG03
	ChxKnYJ61dbOx7idj+Nbd45bnNpnxxkSeAA8Yv1/j9lKHmrGzhlxKylBlX/Vp0y7d
X-Gm-Gg: AYBFou2uSg+dmx95RORLDPQmJVFX70Y/qQBy8L16wMeJmzCJ0L4JnmBVZ8Y7SH/G2Kk
	JtH0bl3jQt0EyxhzKV/XYmKORJuOJM6kjHJY5sh04gJq3G5PSIRl4cgesyCFoh6WKbLmASY5jiD
	MxGLFbPsswcYDV1fwsSCOq+8skLK4IO0xjYXl7ZbeD+o23t7pU8LAJtqQ9UKDMM6Sv11/R0Z/iD
	W0idDwm9zpUkK+uvFb0opRLFWqgfvGXVZPTEISiW/8PRiwoSTFEIDYBHBSVLddiXtjKSsuBJEWM
	UUWzYqKdAj7Hd4Kj7XBmBRVf3Ld69VIgLWryGN7CSWOTr9tu+o1QBTImMittibLtl3gxUQwBJZQ
	97ev0BQIoO2prBqTyVLu1Og==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr3897285a.3.1792161317873;
        Fri, 16 Oct 2026 07:35:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr3887985a.3.1792161317042;
        Fri, 16 Oct 2026 07:35:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e8ca47sm5556891fa.25.2026.10.16.07.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:35:16 -0700 (PDT)
Message-ID: <3cb5c835-cdc2-4e36-9c0b-ff61ce3d768d@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:35:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
 <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-3-61703c6362e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX9zI/6OXGhbYs
 0fk4wjhVxpTtM/P5UE4kEm+Xag0K+hj+T/3UhKkq58J1uxuZjKihYQqxPEFKJXUMmn9/P40C+s0
 XGlVkPXyp6IEW5OKOZ56kz9PKB8mLSI=
X-Proofpoint-ORIG-GUID: vTEuPN1Ow-xL7UfhxUAlbbQ6KN0zFFq7
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad23626 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX1luGpxW0+XwL
 BCu+GV9ipnPolvQw940ytA22eG7rRVtX5Ae53skU9Y9eaMf1VVreKzDl9ACAqehv0ctWwQ57Yb7
 vjXQk3FSQBKMeoJI9/luDkAeT7CUiG0DgQmVbqofhWIMoGDRa/dnYnltx4ZpaC0dYBFFpAx3KU5
 aMJTDAYEGpOBVfraa7bivadiHK1z/IUTmc5dAC2txMHVwYQKxgZNuVEt30PjWqnDX86tpJLvKk7
 7f/hax0L6h0FvS4VFqq/bj7n/+WXquHmsO7OEUUxQOdjUKg6c1wxpH13pNMFp3g4eMvHCa5cvPY
 VNMC3HFT4RZpJDTZFCoeU12gh8X+rl8p2Sn61adjTQ/mxO6OUKE52DFCs00iO8y4q8pkhFq41Jp
 TT+FCMKyLCik3+2QW7s/A6cqcXwA97otld3nPgqhZHnqLA7xCA4/I3xlv+RuCJ83pgr6XZWVQcf
 8LGR1liqRvyo3TtTYyA==
X-Proofpoint-GUID: vTEuPN1Ow-xL7UfhxUAlbbQ6KN0zFFq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

On 10/2/26 3:03 PM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 80KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

This patch alone fails schema validation. Squash it with the later one.
Keep the per-platform split.

Konrad
