Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A553A7D81
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881861; cv=none; b=LZhRMVOt+D7c2bxjvk1BiujVWjhanhyKCd+3b1tl2B/mh6C4tbeq65iSBD48pMGoDrJ0n7YI/4rVfmt2xOjkcHv/7sGpO5WMk7tBNP2aXk1t0FvMfY3Lqq2xM/Pi8oagKXvZKhjXUDxgp9aEOKBPw5MTP61WD6EWNDAKyhzO9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881861; c=relaxed/simple;
	bh=AeTKvPrDbvesHNVWMF3DDI4ksSD0iRPc+Zl0VyGY2CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFz+oHzn2g6VAfFrjtZwEHAI+5sAXtNM6LJ/ezDmGMwf73MM4JV/LW2xHV2+hVC1xbXo4Qfs18FAmmYsGzvFUFlmO/91tVxFJ8vpvpLfw+gnwRjhb59dLo4IRfOClMnURGc+D1Agww9wfR2ouTozuec9fA/LrlaCumky3ZFZMt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYrvrngP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJiQDBpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYrvrngP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJiQDBpI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDCQ5n746477
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=; b=LYrvrngPG3xIiT84
	mQQBuH5OzhQ7WzVG7Ztjrj1xj6MKPQ9ZbILfHiY9OYpaFteH+GpNWlwH8HOPfLJ2
	phQMAKhWzNRL+x05i+y43+qw/Ttlytv3QetcsNMNcuszuNc44E77GojfWv7YJr7I
	/MyqlhQwt9jSN9RDoNHZEHcYjDsnkWx6QVfj17nMtIbL6XA6een4iItMC684htcb
	X6egO/AT5T8UaK8oPi595GODXDsjxypOGvCFrJ7yazA/uzvBymb3nIc9zOHnImzp
	BpLDxCqmnxTs/btfnvcX1A+CnrM/xKiAND5ciuMw7NNgew3498VRnLbCP7QCVLU8
	nz9ApA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sbs8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:10:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920b7e31d32so13530285a.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881858; x=1782486658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=;
        b=cJiQDBpIG8DzpywCZIdaZXFShScPt06VdUcQiU0cEZv9fnKHCyMISrR4oJWeXzZDkr
         EUxzuJYn00nNOwalNqmfMFHNPZV5Pbq8fvAuO407CFQesFoePwnmyogKZsCiPewErqhj
         G42wfX7CAU6e/qjfBfOBebIyfX2PvucSrC5DdqpDQrHr2YPZDj0szOQ1C6M0rgwEqVnF
         GmYZR5pVLdkGKn2YYk+QjtnWpC4Lf0l8SaUaWsTMH7lKUD7O9Bi4+DClAwy59N3D3N7L
         gKg11aop9Bewj7705smrrFFPfquBX9cGREPp2H9vlr6qZAwE8Eoto6n4CnRZeOzaHFua
         Pcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881858; x=1782486658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oylI3EcfIW8Tcl4JikRd6bbkNKI7hxE7g3mATItpCUw=;
        b=AdNQGDXzTG/SWFW3zyQjjgLNGz4ACzg3sdR/TlOo7cixPO4XPCGvjwvFQkTnU2Sd8a
         i9TNLV/9ChzgtC99ZyY6DffPwBd1kA1QJ9d1VUTqnrpu5fzPEYDUwG1naikfIffztMZr
         NblGFuu21OEhekU+4SKUXrJG4t0SQlOockxbP+jQ4udGg4Vn2L2vFVb+opzaM+Glco0z
         CmgHpHiCjdzm5sihlxw4B423+4bumZd5v03jSKEQ7G/l3EFszV0hBZL7bly8lJf+6MJM
         f6UPvi1M++k1mQ2m4uyuuccwiDo61HVGr6w4+6ypvPlY4YxD4GMafAhNqmcN1Q+9PITY
         4kXA==
X-Forwarded-Encrypted: i=1; AFNElJ+4pqJCNuWs4sU6HHNT48UnT5FlWDiNEa9PWyXuWZ+4QBfV5C25Nv9B02rvzyRu4d1YjLTe0B4+5Nwh@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5+Ho3WC76l5pn+ferPN9e3YtSnXgshYsZOvBaHiNSSpMFzPU
	Is7NlAWEvbO8KaxkV7rFgnruyqA6wHR0+L12P6P8Y6jv2eX1O0peG8RnswESUEFh6PQK/Jqmlxs
	sxeDIHCzBuqr8XqC/GfYzxlhT+hR6QU+2gHYaEUkqtwBqkQuQpMdDaFaYc3tf16ty
X-Gm-Gg: AfdE7cmgMaN7CSxf5LLHJNOtUGVR6HXq+CuKx98C0dMUf3WV1YXnjM6PAL2kaNmTlr0
	3J3+Q807Hc048UNDaY5gkjRhtAgnzmDaONrSMK9Ir3/LqDLv+rrf7sd6SIJd5Lo+qzQNjuiAGoV
	JYcTMkECVCG2VC6btUl6pghc/oTQkITJ5ANQjQALrHEAK0arLVbWOezsnrOytAeKysvsClgB8YA
	osUQLDR7LdM/bKK7fiQyJKUkJoPB6Yk5lXwBJUcbuXCCAcjJHWbWD0SW4O+xbvqRAo7jnkTW7U8
	1nvSfQw9YtPgFRjCvAeiN17sTnAVKWa6UQMygLb6RRJjkfPnrbgMh+YVCvcEGHwTpc+rGT2U+Yj
	YyEZ3QzS+GmRIJjgnFI2+OkyRWSPwsWpsgJA=
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr353728785a.7.1781881858549;
        Fri, 19 Jun 2026 08:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr353724385a.7.1781881858021;
        Fri, 19 Jun 2026 08:10:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a84efb7b4sm94628766b.28.2026.06.19.08.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:10:57 -0700 (PDT)
Message-ID: <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:10:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: me@samcday.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: euCE_L7s1OQ_bTRiBAJ73GfbNfwe1J9J
X-Proofpoint-ORIG-GUID: euCE_L7s1OQ_bTRiBAJ73GfbNfwe1J9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfX0L8A0VNa7S17
 1e3oOdbHoqAD+yqfJ3PYSwqyAfldaHjpztLuJlBDZXfLrJq7PKajbuZeTX3HN8NNG2GyllzFUid
 sS+Dq+Drsmiu8MGxCV4EFqiSL6O7vmWDMnKUp3AyC8z+esmOs/laKnUf5K3TW9rYwDEGX/ALw+p
 9r1CEfmgIp3R+4BR13EC8OUBe7kPEy0Ps3WxV2whxWdF+Ba4l/jIegsM2caZKJ6kcTP4uYkurhI
 0bI2zLrLHn8k/NIQuSCgz5XZWktw/2zQ00jtpxR5s3DgMNd9oJUC4+6Kicsm1tA+4ehlNuW3FgR
 M12P5huuE9wNk3hbih22ejRFAUooK0Cg7lmrs0Sq7oXt8XEtU8kQ+VcpsTK8mQU7RZFl4A2tHAc
 Q1uIFRZwgh4qEnOVgJPCoC2hbxR5PdpPwjQyPc8QlI/IPw/vOsNV8EayQSq+HMtEpbDZu4iC6ZC
 9AXh3OFrGSzIZN85iOw==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a355c03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lKQ-AihTAAAA:8 a=5egyQXd6wVIim8t2i6sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NCBTYWx0ZWRfXxSXU67hzGK7o
 ZtVQeFd+78hBaWPEpptJxJ4D2uVwBAhqKvdl6u4OCeRtQFRi4T4im7UfagOmAA4pYhWbIi86/Di
 WHBFilTBDXuxSx7f7z37cmF2JzahYNU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190144

On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> These regulators are marked regulator-boot-on, but that doesn't
> guarantee they'll stay alive as long as the simplefb does. Adding the
> explicit supplies ensures that booting with MDSS disabled doesn't
> switch the panel off 30 seconds after boot.

Why would you boot without MDSS if you want the panel to function?

Konrad
