Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B339B971
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058952; cv=none; b=OAOzyCCaWXn//vkqzW7E96K2zTBWcGp/8VyAHb1Bdey8wxnTgn6dDN1jBjS/Kx/MAD5MKVOXgz/Qo3KENxwJN7sKr+7am/hW6C2X/P3U20HWn4s3orwogJfJ5nKgERnAkWEYizR/ib9bQSghWMlcMAB2PbJcp1isxpsfM2BsOVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058952; c=relaxed/simple;
	bh=R1VTK1OenYLQANLJ9pOLnRCk2qBsb/zjhelLvvj6tnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGc2d421NU0JUXHd2s4vQ4twDccMf5OENl1ML4vK/5AlMmAafr1pC2ma60e8OP7XYCX3bDpbZNwcoG5T3tuIF4IZyQ76wXa9yMs9ZmCDPcPWKb+SWRsR2Mq9JwSe3YidGTfU/tbpOlvEGmTtfGkc2hPo9m+YQwU8s1Ur7vXs8I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8J9P/cn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5ayhc/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8J9P/cn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5ayhc/U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646629tj3501554
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=; b=I8J9P/cnmTS9O5PP
	XV6WLRnB1XFDyG7zt5Ph+E0nZhhh2vHgFSiYkzJSEiTWuUnhQzpKyNfAb7hzfHii
	1xQLR62my+DOIPtm4diSwM1OpGiHNnR9DiujbFJ9J+6QIAOaPMzobsyKORDkT22c
	9zeV9dewYOA57kUkGv55rQ1+Ce4hqQ1GSaQQfMuRif9ug0QNEUPTE5MgJQEqMY9b
	JlozKTQJnkABG4orrhVA2bEXXSxFP+RkYF+lcgNiUPF/kVGN/DgxM9FuGyzkxNtb
	G52F+9xuifJQIVrJO2DgB8vbbfww/b83A5DWBpMSLIMsJ5u44+/aqd/2wG2rsy9R
	fcK8xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqfc490-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:15:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eec753a7bdso217450285a.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058949; x=1778663749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=L5ayhc/UAwlFi1nNhNzqU5DYH/6p5fKkRD96M2LQYS2sqfjYpLGJkPuSYQ4vzwnOiN
         SYORFEXMvFJfd/o+FY/xYwTC5KThQvK1cSFVuN+D85mD2ymP4HVN1FrtzkXLOVwa9yzj
         wyWPryLfxbuPuqKfCX1oK3j5GkXydUqbwvpHHkDBRmv+0HF9Hj/7rlO2JNw5dmxzeM9Q
         7TTXhwWJVeAvmieaCRHQuiPPuCPpNrWYfTzsFuVS+Too0ophgg+pb/qE71n9aDKwpMtZ
         BftZAzgSNdSrQgCW80Iq06dav/VbK9tJ+iDbyblpbGfI3HLoatFE0FnEGZ2uKr4Nh0YN
         bR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058949; x=1778663749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRUBvLbwxgleTjfqDHxt9FzjXUjxTlhfB1y5akMaqTk=;
        b=lXf3fOldSHXgw+cQzc5TyKs21iz1WAhY+SnmWqUj/WtHNMn3Guyz8pkD4JHfK6n7Gl
         gh/NxDkQBOWmYKwzfuT6F89GZda3avJueHi0LJVgU0iAWiDdl/b0cZmgcAXqkvirtxTo
         RYYf433He5+ILxnDabDF6L+5O+WJMo+Ft+TFMVU0TvRQ/z5+tbAHNYnPIZjWR0PcWThc
         nG6Byvn2C2XUM4Qhqb2oYCg95Z8HXlCl6fEBMU0JuKgcOlYwWP4rPtq3ieT7pMgy39jJ
         3slHhjYc/QWH2n+rl4ruuYdoavk76VmPqGIhmdUQm+FP2ROj9yr8ZL9y9K47AnQVSe3P
         OX0w==
X-Forwarded-Encrypted: i=1; AFNElJ9KntHXhFpfi9LcVZ2YuC4QYKMT24BTAuLwQrAsJbn9OSCbydCF/f4BaxbQGWxBqoxFWMihizRvCDLm@vger.kernel.org
X-Gm-Message-State: AOJu0YyFw5uCeQ+8KzH3agbDPsAzQNJIp7DPo6WXHL7SmXyQ2FLWOP/c
	koRCIAG8xZ2XNfQNecZkakIGjNugVBYIzHl6iAsxqB+kn8k5KM0vbUGO/fAmglogdhU6ymC8Hb4
	dUpzjRqLNSrR5RF1eKZ5ycEC7VriyNAD40beYHAIk1YYZQ7YfptsgVGCpfSYEiOHA
X-Gm-Gg: AeBDietA6R7+DnwpUGKRkZIGBwbcY7DC/T7qYTOJUohhntyk+YLD3tg1sc1fjQgasKx
	F69M4eC0GsR7jPCfKZIdAEpQe2Fn1fRzqKBe+fcTA6mYAAzFMMwm5y5O7Ii/1PEz35oraZhx+2r
	BmSSLUUGh1hwsZsQM4ZnZr0J28mldR+IsQBQUsQv24qt/imT4WXJEVzFJxOINE7RKWcMOMMS4ME
	ULZj5Euh84lOlpRbdRee4hmuGKTEC5VOktnt66DcAhvKyxKroZa8oBZlyRzkoJogbmhFqpPb+eX
	0OsqSFIYQHjYLQrps+tF+Qa3PP2G9nnaQmGiUjHaFrTby0C5rynUnBBxEvykC+wZ9tjLd4r625j
	dJgWmCH7k0ASnMY5a64iRXQzgVoFjbR8lTQlnUftGYJtFSjG4LVlV6TxGzZ6i2BUP0KBdgWjcqa
	cu/kWtNrdsfv60fQ==
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267956685a.0.1778058949486;
        Wed, 06 May 2026 02:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-904d10837bamr267954685a.0.1778058948898;
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4708sm1098481a12.14.2026.05.06.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:15:48 -0700 (PDT)
Message-ID: <3a4256b3-785a-4841-bd81-980cf4762d72@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:15:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU,
 MPSS & CDSP
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX71+AZzhZOY9h
 iXdMmZAvbHlaH3O006dOoTMb2pcooPdukwOGLc7bwKbXH+WOqVmRmp6peomGC/OS+v90ryQi+hu
 B/dAu52/cY7IF7fmn+lmn77H8nimVD2NChOpSyIEkGsl64s5KWYaWiJLCIlP2AwRENS1a5kCgIK
 1kVBXtrZbwSTuYC9zLIWDotjHagnzWBhhFuuvQ87lHwvmQs4e/nlvxsmIUKyRDasV3bWD+P/cQ8
 bk9wsqT40kqnrpObO9wIslURXD86PXx0AEh4lcSU9yajNw+qeqdwpWF9f/hfvOd1gLf90kLjGS5
 XgLsKhOOf7qPtFXZBMoBmh+Wq4JfwwdXJIwXE6JzFifomxxmJC9hsN7603Eyx1DHjv8JIISn83L
 McbiRQiaIswFha+aHqoYrTOYF+ybT1bg69QaunhKLujY1rXYpOl9gpXBpRMKv9uH6WEX6LgHp4T
 ptwACv2BTAPFc43JMmg==
X-Proofpoint-ORIG-GUID: 9hfUXD2Q-3YjHNso38lDW9O2S1KwHDIX
X-Proofpoint-GUID: 9hfUXD2Q-3YjHNso38lDW9O2S1KwHDIX
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fb06c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060088

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Add some interconnect paths for the GPU, the MPSS (modem) and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
