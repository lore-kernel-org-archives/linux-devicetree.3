Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937342883E
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557475; cv=none; b=bXBx3sdCGONnFlNoKNRWHKJE0fkDpahscgUjWPRqf1wEgEaw7VhWRMjkW/FBXP/AoEWdo6/WmnIUT4vjdid/j3wi9OLltg9kTfCQfLvXLf7ZvsZ7KJpM1K060QO/EBtEgteZbJvT9NgWfQ8zl2msKkj15tYxVPpJGr0s2fXGeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557475; c=relaxed/simple;
	bh=fTxKIYzBNQgc7bk15MwsEQOCtxVJZwEdP/bFVuwu9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwDbqpbPAeT+hCRbmZVi+LBdoFqBnvZI5Vk+x3Sqc31qiYPA4lZdttCq/dXcX/tgiJwORjJoAO9RXSuZkZNCIW4N6kShU5xrMwLPhose6Fzi+1PTeCpWmBcKQhKUYfHTrcEa6JBqwRQ1EXucKEjKBykDdrIEZ3MmAq1hB8AbWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw5EZk+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOBTv7V3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw5EZk+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOBTv7V3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAlBJq2099574
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=; b=dw5EZk+1sIDgkvL5
	d6+34W+ajkbgrOIGcUOR2hFBaNE5BRoflHK/PZRwv54wkB/KovgGNd/8Qw16LyQM
	KsSQG7DYgF2mSm21lArz4LSzAQIjuzc9Cfk6gva1/U+ncn5hdY80RQNflqkM0V/x
	oPaX3AMDpEAexC2BTxwlEfnMfzTN893M+FCf6HLw1haxU92VplnXQBABiUwKYmDH
	0zY+apOrc0DAh1BwJTWYSSaRYHpIzYpmH9UEu2De2ahnRaTNmunByvkCaMNwNvRK
	BLmX2A2UP6Tju8Cqyry37nMVpTq48Nms38ApD7bUj7c1/25PdEOwqBuGv1HJWji6
	rGY6SA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr42b0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:57:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605a884731dso61711137.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557473; x=1778162273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=LOBTv7V3U2K/oZYTOmId2OkWpzVxYEb+m9Bn4SHyvwzi7uKPgvwe9uto3WCwDG6l13
         8ba39ozlqLXd8ARR1gPHMUOgYo2raFoKswjhEtnG6Aa2atpT5GMxWyVOOivws9aoOkbd
         5SGWR7HcpHkCOmtA1Fzg5DlgVhkJivi7gorJkLkHkf+k6DEVNyjdeGhYHoO2H3oTWYPh
         wtkS+OSn1gtz9gF/LGWORhn8riOgCdqYFqbdwB42++QsBUC1xQZp3K26XHXeOUmXpcse
         gJDTzSvz99rIeuYSgFZH4sD9j7+F/umwWAXlxO7LAUi07mzGHgpCgfgqAztMh6jKXl5a
         mb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557473; x=1778162273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=fQq9jDnWXEkmya0GpK8VbN2TCwX25DIAgMGHK8vFnpnqAVfnILgkmD+SLv7oImTnpr
         iGMYObrceYHK8ut07pOS0cC/O6pzImNaG0frvLG8XxXL0dA5Y8/XVORhK+2nGoICxxuV
         jRXcybvNU1El8nbcnIlkq/j/9WKI7D8762vdHs4H1OYZvvy5XqW3z7u1Fx0Frh+u5AI3
         Pj4s9wAfldaC/nqlbqBAaSAcplfwoUeMlL91LgncjOkw0sIZBn4EquNmHp58YAo9Qmc0
         9nWyiPqjzgQ/zT4KENs4KmXHhRMVDWAwCVFzbHlHbjrt577jXIvTTC1OkxI/Jnp/L4QH
         YO+w==
X-Forwarded-Encrypted: i=1; AFNElJ+7QqreKhrM225QAhHmzsW85uH/NSYu31JH5kwyB9uoqdcob6sbHQdvsnQZEpsu0J7hI3aZ8bmNoPK3@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5ASGSMGcgque3PdWtwxQ5TfT31XZmsozyL9kpPStDhZLGzbC
	YKCk2c34Ik8H/U0Kbb2GE3KU/LPR8kYA9TAUVXJ9EmrC2FCOQL66crC1W6CCZrv5SQ2y7c0ZZaN
	6zaMBlZdFYFL8DoYUNSrKTQnc1Fbi89Jn8Q+ZhsH+1IcNxNUkhsJvNDWqq5CVk+O/
X-Gm-Gg: AeBDiesaqMMuIHro4HaJYo4JBTIllHYzSqDE4rXM6Cc5Pcatahk/jEQch+mTcMUmLFA
	hXOBgAePXdNnNJTULdixsm0MkwHvaKwylO310TZdFYkK7mM3+CHNioiox4x5JJRr3CC5hdleJS+
	+VvCPUIwVZ3mOWp5GVyrYXwDuc+5NdRzESoEHmcqY2KGMQPLB89UF8mf7YVeuHdK3iWAZb+C+Lz
	LzqZw/6CHFJcZ5nT4vqVBQFDtp7afmTYh+o+KojRW97vSZ05mDTi/JnR1UIAVFM6Nfv95OcZPJL
	zHzFiShi5UWPB2jxwdR3QdwIN7Sy2W3NWTFPUzm2c9l9jwK5t50C8tFpk7/2zTEBTK31/g1J97z
	VZrGHpLomCVEMVM0xW5F6zJ4KegpXBKQSqOgO7MMnL3/qvzk270X6oWmeY5zbjx7TB+WDdVTHTP
	4z/PfzajZslAMPNg==
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440899137.1.1777557472782;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440894137.1.1777557472265;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm240296666b.41.2026.04.30.06.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:57:51 -0700 (PDT)
Message-ID: <05b25bc1-7590-49ab-abd7-7cf587845bbf@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:57:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f35fe1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fu72_7R4e9LhwPiyXh8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0MyBTYWx0ZWRfXxrOiEoDdRogC
 VIoGvu9lpUKl88JfixGHZPqEZWqYNMZENnaNoi/lSFg2BpEBt8dPjnExQLPmHkJS957N1gfLdP2
 PSTVkAOkOk9buRmrlZ+hCM9Gj8OPm39SjLcFPrdFln+ePFXon1MDv2YUpY2Y1CZ1Aylbs6FpNov
 ugoPwdPob5ukivM3Joh1rGTc09jnYulToXkRjnajs1e+d7bFfY/USPw0a9rXW+kY3bbMzLLkp/n
 Cj+DjoA9qNZX380rtsKvrwhZWXAlsm/pujXyVSoA7ORVZ7EXUXCJEmn9QDzgsX4YvJHqbXB7jOR
 jK49ZHeB7y/dbLYIH9cmW4BEGS1rpr6W+fLOXqhgeTvXtjdBFvMadXIesXEsdUTY/+pl/1//Hid
 PzX6LFSqiVninLHE3bHXlq8ycwuhE15hlIm5WNCYojfhItMKW1NeJpWwQH5G9Y34KxxLy+zRt6I
 X/B28cM3AtZQnIRMcrQ==
X-Proofpoint-GUID: XaPVTIU4P0sco1ydwaYXxKaEZJwLcF4y
X-Proofpoint-ORIG-GUID: XaPVTIU4P0sco1ydwaYXxKaEZJwLcF4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300143

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This will be used for audio over USB-C in Arduino UNO Q board.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
