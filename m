Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448378;
	b=Ak44t9TnB/IaddSXWNRn2o5O9L0ZUX7ilLY5JhQ06lKCY5/bta0NGX6kD6suCH7Z3Wtb
	 zaS1yyIgWBst456sNOwGRsudTSQkgZj31xsJnlnHyw4KUOdd2Iwge/gZ9aeB7IdI5Hd9g
	 1J+MygUn1C8DtHalaBNmPoao5z5p1qy91yHDZbRZPh3JzPf0rt/WajD7YXiNvt1jT8UIV
	 I4KPSs/3NFbiZ0C0jCQFI7Q9QtImgxAlFXSKZ6Ov1cZoBkbLCptS352/rD9GC7QQvecBv
	 HSFxWuY3mwSHrREvMV6MUsvaHbydda3zQ2uLCkBDAPfAD9CRt5MVU+LIG7Dx4IICMGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
	b=rk9d+q0GCZ9qyIHuGrh8SX/naUjOSMwyP28DgiGDaZV/Zu9ZpkggSgGrqaVgRHlxoY7C
	 bHH2IFAw5aFA2HT1mkoWVrbJ/E5vOB+NjZHD18yI3NE+XiN9duHOuRSiiWfMGDsEgsGB3
	 XbTkhgjRzzRiAvPDpFinI5838/Q3ejNXgvgRHCAyUlfCZuE6Ql7pKS0y8Une+utMFxBn+
	 D6v/b6KGrTn4+Rt91yJSAozzyVFjLKpZFaVpjEoTPC89CvvgvvQJIIXlpSjSUxna4FMKe
	 fjdO2vcVt0KSS56tbg3wLKS4foRJMAeC0P6K/UfqmsU8e/oU5IaKNQm7BvbTD81LiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF6606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CF6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKuBE2369190
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=; b=eThCyj5JdNxBibP3
	6Mn46VkvXbbU5MOIDoXPtfUQvk0/M0DvPuIiLlk9J57EsAu0TZabSuvy8wrHLq22
	rySVbHEnT8Fdgg/ry/BT56mtCr3m6HSbkEag77Osygb0lbATjmJrbmUj6dhHxFW+
	JOAp1nAU+Tyh2O6iw1iz5f9vNe4nZj+oiYkTXk7FMMRMOWz9JWNQISV+WzwNPhdj
	CPwfwHV1Sj47+VK3AnZfmKufp0V/QYY9Pwli2By2e21X4dm/Ge49auMZXv9BLdkQ
	vC56wi+KoF346ejDjvo7BCSonIJXEGUBh4ydB6613RbsOWHWFUPN45WIlwTgmZPB
	Y0gVGw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa3cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso94078e0c.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448376; x=1796053176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=SU9L7HdT33GJtLsdm1Gm9me3IELbRLH7k9X7Wtw2YoI+8xfO/1sdyy6GikzEguDA53
         Z8O88b9jlHd1e3sVInhEz2walGmme1gBHf/Ra3eE1tjubgxyNKcWU9WZ7k2F8glO3ngA
         Ubzv4f9h+vACPRgHlZzJ7kYrnSBrRAyQe1fy11E5zl9R2ie8e29H+jF6gC8M68WJRiWX
         5EE6CVho0x9CJeJ33vgcfIWPihbAz6voiFoDQjkXai//x2BPq5aZZS/MU/6+bQJs/E8+
         EInjQpibMN+I6nhjDxGoBgMuJrlLZNGvM9k+nBpimOEhpenXFQLLBT5rXPrkEB3tOLEW
         ZTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448376; x=1796053176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=dtmYFV7M+qciCWqkOAY7diGwlvJqF0YNhAbqmpnY3ycEGW3he+FpmpOWK47VlMmp5T
         6cj/GklVpT0bBlE/DdI/uaVmm5nNQ8jkRvYszqUEYTcWnh55W993WdT5dqvPQEqjB2zL
         Red5zHm+HA/j6xsGuFwx2isLDuvgYb6fYGi/w3MmaJxiX6K0M5yYEKjQbLTKCQd1ppGE
         jR5EvKVa9p0D2Msiqy+aiALJI6nRRRTyVkPmoNQ1T4YoyYqeLFhxYSzTZKPz20b6Rb7g
         Ueqo1Mgov/cO18ZgYqK0zZNHctOfgoblONiSd50KCd7UT9WfZFtQhqYHjConIaggofnQ
         HWaA==
X-Forwarded-Encrypted: i=1; AL+hErGNT+yg3wqpoZqWU20DMHOWhgj8if1Ymhqv9U/a13PqaISSfNOwyMxor9iyNO+TXKsKC/AgLLwGyal/@vger.kernel.org
X-Gm-Message-State: APuU4Z9selLSg10bQimTKWXbTy6zDNqj1o8WzYXVIoT01TjaP1VssDyP
	BacxRhlsFJB0uicEBSyZPNy+Kzjn3Xm4IB1oqwruRCMQ2TdKt8k4hCuz4nWj2R+xd9pmYToxnVt
	3Ea5SOjrHHOYL8Sv/lbfD7ARtlvMT18T1yS3Urxt1Uzm5ZICTAla8F89X933osMUZ
X-Gm-Gg: AZFdTZeevWqY3TVrxRSQkAALj0ui0d7sboDqJnQLrz9PGpkABkwy9BqiHtOTdmWqOJ6
	d3q1oHqYN4muQp3aXphJEgMPUNFFuK6XO42CXtvn/E2YBYnJypU0QeGHo67NFC3fErMRfJczv2k
	MT7ukCgZbRz6VcwDPPM41UlRWbP+u2fwxv1/zyR0XDhKKEfmB4ap+RLkkujI+D0D6EUesdl/gDO
	BcoitkP1aLD3Emdkw/05+Sf/k5DkW0KK3jc8XAY50ssfiCEkkEbHoOBf3ueaDiDp+aiF4o1MXs3
	cwT+f0o7kpi1av0jNJNya+aBXOy1I5S24kdqLnqYzz7xuTrRJ+LDZijLI6CsDhd63sE1N6lE7Y5
	x2OEbNmbErZBjxdi+um03ldJjPSfvyIoKZ6iodmxyqoRJ8YybLb3GA/IRzcsO70/8Unid2C0=
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021118e0c.1.1795448376159;
        Mon, 23 Nov 2026 07:39:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021082e0c.1.1795448375818;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm425248766b.63.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Message-ID: <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:39:32 +0100
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
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX90YMujP35Jmx
 vYKXKnslixTmUs98zFB2lnH46LwPnXZqm4Rj6Fa3ZeXQqVFjxVgY4zx0kYs9YgwErQFrqDgN0pb
 ATGIzNdb9HelDwtQKJqDzwmrt2k9mQ6we1iS+eY2hK9qNFWZLAANbwUX+OoJGriVxxWtx9aCeHB
 niNwUITdzR4dSCQhJHHeaCawf2xGwiVFER8M9kjr5DFrUQoSiIXDQXH270bbsEtOYUkzBqPSjOL
 0TbOKrAZf9cxD/hCEuClyx+Pg39Xpw1k96YAMQeUToKxwNSq2RUrdeJ0FDvLEdEGWTOzy7y2heo
 rp45Iw4NK1vYHSLBxGPmkxDMPTMuuO0UYCLoYoLVGH+1Kwk4U7pAVNkI+wcgRFsLpznbkKTzePG
 G1XtHJ+xvNEJIbxMgNvqt3jT/K66nB2tkUfoFCLPI0jae2uG9MCR5JVrpRGQIrSgDr6NqkkM7gV
 DDtiLUwmrNYWIZn6W6g==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045e39 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Knk3v0qlAAAA:8 a=wt33j95wQlzQpC1BO6QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-GUID: 4bGsOK_-lQUDpS4y7igZjVeqnAcxbySt
X-Proofpoint-ORIG-GUID: 4bGsOK_-lQUDpS4y7igZjVeqnAcxbySt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXzBdTEhVkM91i
 +37OnF0WGJSEeXGCXnPWJivUhmc9ItYV13H71mx/m7DJCeWbw+fQeNnbcK39FBs0RU4yCp+8oyw
 cucDUOsV2m/6QFhceCr0BR3VU3uTmuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).

Drop the last part, this won't be ""previous"" patch since it goes
through different maintainer trees

Konrad
