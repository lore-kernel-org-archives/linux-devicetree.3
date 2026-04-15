Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3CB2D8378
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244285; cv=none; b=t9aNOEZqtcmWbbhg5T1rYbEvJMQOReQsashqYn98VpzXIv7svBynpUoCpc8Dz7P2Pmt0W4COMLCbNOj7gAtnr9+AWZaAFAVPS6HK+52lW1gb63BgRTuw3ltfJ+h6ii8qfJP2jmgyqhu4WM2GLiZaJcmqK+oVPRB9knYzTL22YHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244285; c=relaxed/simple;
	bh=dB71cS02rGaAgGn28B8tA4wNBVV9+p9/5LSguSgT/04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qe6RGr0S2CEcp/MpIuOrZe5YabA+HBmYFGGwymRQ+llqbpuV9cdLjMMu0t6Q8Pckezexb4gXIEFkIoRbMQtwWEQ8PLou7IXc//WKpfg4tZMMK0k3h5AS+XMpE4tFomXAZrrue4usLR/fZxdc4m/uvQzp6KUZTwVeShioppYG+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgDWS1O3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPpCziYA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgDWS1O3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPpCziYA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2qSH7731460
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=; b=XgDWS1O3tacqbPWg
	AzmbYyVieoFFJT56jRs7AxuOnS37mZT8DynU5g/C4mLIP7gVjYoE+fZPMrnia8hu
	ASMtmf+R3N5CHMdVYyzErWSy/ylJcGNC/gGW+8bnsLYZf72vbUNC52Awvz0uLnu7
	k9DlpWwgLw8LDYQWDNlA/GNM8t/p/Gc4XT+ZeBRsUbCHsBqowV70jDEYJHKIiKjJ
	CiltXJRXcM0sv1lgNM5iAHbYFSqochCBhQnwOA4F1pLASvHWKRyfkQloPGJ6WiNd
	wI6TNeJrEO4t6/ndLrFT9L/ekdP9Rv4Fd1H1++w13veDWeFTw5H0k618+7AxG3Z4
	k3Q2TQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub1hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:11:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso17760006d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244282; x=1776849082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=;
        b=XPpCziYAjlv7pQ9rzM9BOLyV6hMaSZ1/x8FEkK+umOSqXOFIDsdreWffm9CGZX/Tb5
         BU6dE4Oebj5Eqg9618O8XJQmzul3xdHRxee7kYcmpjqsp32FzdlvhA2NJuktShGjV8IR
         DqvhfrsqWZ5PK4/kFWe2fhpX14B4aM2eqaGQxdjsqCUpntGSoHM+0eZSczpnSfvrUm+K
         H4MfBe+byEy0HRxoYTlY30dvJMB2xUg+ZBiHBzMd/dGXBEKj15wgYJPA3D63Ad1h3wNe
         bh0j5Oc2cnAJNMvcB35VhG0pvaSxUKnLoQ1dUOeKb7paQl3AoF/5uEAN320sXsjeuCVd
         /JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244282; x=1776849082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jo9kg9mt1deVXlF9JNMzXRhis4pebzFHxAcalQ8mr0=;
        b=dzdy8d51Fy1BPTr2zPO2FQHT4fNy+gJooZ/QlPQkmseDyB7BnOAoYTgfAMyuQajIpQ
         zqoZrpTTGDUWEIOlch450HlcnMWLmVpqQuMgmCJPOdApVNpmQZetlYIukVe5NLeF03ME
         DWqCSOCmHV0hJP0jiW6AJZuc7PYUDIxUbHkQSnXA+ajcevlZu56rqcqFFtnx3pNc8h7W
         Ugb5uDYJPpRUj7L3lHiaFAfosKIBlnRnZ1h3HNKupYR3dlKWisoUFc2z5s5aaI/7IPKN
         x7+MP+qUj/mD1jBWK0cr2YiiqMa83kSfe7b3MjCexkgUZeNfLoy/w8pIp4Q1WzQ5x98Z
         wIyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gRrCYMy4rDPWjfNdPYvR/2YR+wfl3dvS0XkH0KUt9jOxvsymJjK0pikJcO8uddbCs8MtGlkDVVBwF@vger.kernel.org
X-Gm-Message-State: AOJu0YymauSjmBwMtiLQezzNbyLC7yQg9St4PoqvrCM6YL2YwxmU0owm
	SWW5T5K4LgeVbAOpiOQSlbFxse/Djeol0EIeoFdVw7CE4+xaqnizLafUsMGQ6SQQmRSlUN/3IXa
	hm39iPsq6mMdSKS/95n6GO3wEXtKgrBirTZE/ChNUQk93kuchKqvmB1NB6GJgvAvb
X-Gm-Gg: AeBDiesmPICNQn4YxEUGMQ+9n6IWmeI5v6J0BMMliq+xpUqqc5wnmoGRK5zKHrj8vNJ
	N5KcPtVaX95w6CL1m1iD3tOPOU3ZDX89iqmjjJ+9gjXwsTbdg6pPgVVj5wV+1lgiTi2usDj391c
	jnu4keinNidD684yZ7tyc6BmfRutISd60BRsPmSDZnGeIJTIp4Onf6u9AslgyXnNwMb8kVum/x8
	YPhhc4Lo8+r4XAcNxvkofwbdHOb0HUeKDQM4Ppv4aWa6EsNkh0O0npKkx8WW973o5OAM9/QOrrc
	aS4gxKVvIgZYJAPbYunmW4uitxd7pycCNuwEsT+Jnp+3kEsTOHBOcBOoLc5hDDKzZzSCB76C1Vz
	CFCMgkDpJkTgM/leJAVbxqqycqpwE2uoIYmnhYq39v9+trxiS34jK+Exbx7DnZjfI/8EtSktI+Y
	wPTfRUr69uu4VHKA==
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr19120726d6.4.1776244282079;
        Wed, 15 Apr 2026 02:11:22 -0700 (PDT)
X-Received: by 2002:ad4:574b:0:b0:89c:c2eb:681c with SMTP id 6a1803df08f44-8ae6a908bf2mr19120396d6.4.1776244281562;
        Wed, 15 Apr 2026 02:11:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177dd36a5sm35601466b.54.2026.04.15.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:11:20 -0700 (PDT)
Message-ID: <2144514b-6b0d-4d2d-815b-8d785ecb941b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
 <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nc5KzGz9EMe_X5vhNTcYvdgMOAWbhkWr
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df563b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nUGnURic63cDoyuK1-8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfX2J3E6D7YIrcx
 gk2fcrrXl9NyfkmFxCLKHKmqkJWsyE2ggMD3Tu4b0UWwUL0bJ+OU/te/i/b+csfE9f7LWt3V0aw
 +K3AhnEzO15Kav/xAO8+L90zW0uPYZfLyUZSZO+Lm8obcCUCkQsTwMb/NOE+MCJiIzQzxZGHNYo
 dv4CE+RBatuBOGkQ0LFx5VKfqJRUl5A73VV4o8l+T4PoLp81rWixZj27Jp4j27BJ5eATuTtvKBm
 PfwCsJaMhysMMPjgcLLOkEzDtjh5NQGwG9iFS9yi0OR4IDC8yM58syCgxyAJVMBApqEIHh/MffR
 et8VmUKNBfnnEidbUfdjIveX74OS1sO0DRzlYViUgOL6+kgfXQWTmpvz2ZfjSSdFSrmufbdbu6v
 rPSv7qL2o3XJ1NYv+JUIovH3qqxkG4oVWUAzCRXRuMlLs8umfllVNsGUdu/Oje0VizCJtrR4Him
 QpsQFT1x1ljYfSU71+w==
X-Proofpoint-GUID: nc5KzGz9EMe_X5vhNTcYvdgMOAWbhkWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150083

On 4/14/26 1:36 PM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the sm8750 device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
