Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA242A179
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499455; cv=none; b=rILjohgkJzfkqzZKA5TejBJU/SLyxqrj9MbiNiZU2tNoqXkyvUGVHmFXk/dq1FYMriRxaePuejb++gnH8Zy0iOJEPfpzvZsmmti6C2qF8wPNauiDEAwscQ0Td01i7Ekxv0lH/pxhWcVjdZ5Qil84svdUw4dPhFEJZa1lscbTa7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499455; c=relaxed/simple;
	bh=AT61HUd5Sr/kNlWaDc3OcSlk+XsaVzhn5dCkwVJtWF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lx6k3OcKaw5CVoNiQzxFw52QU+jtfyxrD4C1H9My5XsyjopA22IChAZlpnPIBr96Q4nUKDiHoWdOd3G8tEP3AeChm5CE59TCrdnSTNxz+b21+NAAibftwdp8fUMEH5z7WHuW9JRTYzpTWjy1dgOB3sUhupqjWHOvkFWFZ+TKOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpyt3QQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBG3bZ+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zpyt3QQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBG3bZ+l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBN8Q24129391
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=; b=Zpyt3QQmT8JKhRht
	JLYoi+oShxLiW2MVmaFKfOX1bMAJOAGd+l082+dP1sYqi1OZAccv3rJWy/RVMOWp
	Rx7k85kr0bwLKc8MBjq5QeRvDgr2+euceDQeSy+/lSDu8qqUq0SIg0a0fxDRs7kj
	PEfZXN9bNhK2PSR2aqJKQgsnqTlRa/9//L3JpQ0Ft489b/SqLEMamf2TioP1/Mck
	TS3dE1BL/Jb6B1VapHPQwW2ipreUwHaNOz95NitoPM+Q8tQQ+y3E0GRYNKHw3olg
	ZH0BkLXDj8kb/WeGQ+g66i+Y8P5F5ndXd87sqp83YT/uAzAdyd8JvkhC3/WboJEg
	oMUXLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtka86w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:04:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93105103d06so16149385a.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499452; x=1786104252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=;
        b=JBG3bZ+lbM7VXHObyLSHw+FOeMh5taUKe8g6uMVvUmL9gIG36azJs0W/nka+D4a410
         HeHPZx5cvnwk7ZxbRx6xVaeVqiQxSDMpUxHx59cYo3Q7XvXq9WJk3sgVvlzvuTCLXmME
         2YqvJ3JeT0UO+XziH17d4k7aDPLzGOIZlnu1AbUPzZtPU3o7d32P2C6ZyGosTlmfBw9p
         IhFrNhO689QtC+NW05dx0O4U5yTltHcAAvzYaIxXSWzHwuachlymaAJgL0dWIgagGLQr
         E4uOBBCqm9cc7Fn8IiGa6cMYpIMHX3tKZD5ZEQFwbdWKfocOWNkfYcr1kYWpa4wcZaZu
         3wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499452; x=1786104252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=;
        b=oUtLd9kaV1XulXQtwACcBhkOoabB1lJIWXugnGzBm5evy0L3kEmgZ/CwID6WclfD+W
         nVVHOPcDb/G7j7kQ4xu6nnQ5lMtRXhKpVZsI4zF8gxUnGz1k2rlPJRh/iLz4+9wByMMt
         2YalICOnC3MYO1PfXa+TmtLKqh7qL+HtsI+zgPSPJ3kPRjB9NbhoAN596KeIo9GtvAt2
         A9KNc+0bpZQwY/xXG+F71BVj4B1vP5fBnPK/upfFWtPKjoO5MRUWripyh+TPqVyJfM4B
         p6ysmCLZRID/TQP4m2i57ch0MfCetbFQilmjubv9B2JKVbit7vM8xJUygceCW5cuU9Ju
         1eAQ==
X-Gm-Message-State: AOJu0YxeaG62BYRrZHIrwJ/OVWrGk3cT1SVzvRtyaJSAyx64xRqdV1WN
	ulQ2j9tPbJ0x0cHbWXXpBxk5d6PvBIs3erfNjZxsIi57bj1X+A7v6i5hOCqWDK+UJSF/9HjXzcs
	29yDjV8o5n/T48No6KrJxcep864syc/7+iVXeghcJ/5c4fjncEFrKdNQ6h8ffAsu1mW/WwG40
X-Gm-Gg: AR+sD11g+xOMddA5ggUfbRI+55rayIh2+I/8qQtdgM5SLwNE+gO2JnglVVDSlBkSG07
	RyNN+iSyOLdOvOKNwg9hVhZ8RPfsDnZn+8ApRWvXIgd1juzrXhBdESE4Mw3FPtNj00tRaM5h07N
	VLgXUm4fTstRymindBoZE06iT5c9/IM9dUhnIt+V1g2FQ5gZConoeiyLUgkpjKPYzSDBfeS/MNy
	WzvOi/j4fpdBHKyAuldq0C9CweTmOeY7//sJihwfkNH+xpuLlvsP6x6vIUtTUotcfwrBORCuh/p
	DJvbbKf45te8ZjbPBhZAoibjTxcrfT0v5anLynAeiTBeZMyfdsqkSPXCMkyWTk1E/fqIAvggmuz
	6bNvTm6hrzX+yp4EiB7VaIoqi
X-Received: by 2002:a05:620a:19a2:b0:92b:7420:bd58 with SMTP id af79cd13be357-934963c058fmr235025585a.0.1785499451936;
        Fri, 31 Jul 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92b:7420:bd58 with SMTP id af79cd13be357-934963c058fmr235021185a.0.1785499451437;
        Fri, 31 Jul 2026 05:04:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a09acsm1181221a12.4.2026.07.31.05.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:04:10 -0700 (PDT)
Message-ID: <966d4093-69cd-4683-a98e-a57324dc2a2c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:04:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
 <20260723-imdt-qcs8550-sbc-rfc-v5-3-2fb988854623@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-3-2fb988854623@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H79lWZ2u-2Ls4iSDmAy2Rzc8hB9njGL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX7EcewBWmcqx7
 DUkAGFaeYf3r+Dyf2vCpwBpwTUo4LgwRcFTTC+lU4OhI86jQaJMOh0Ue6glVQMDO53LVma8YehN
 juEBVhBQU24NVbMY9gOg2BzqJtgbZpJs0krHBWbnKy5ecJ4VDQQsGq/rr7Zeh0wjOVgxIpqEMhq
 py2jtbfP/zneffM7oMcAEsxEL6ySpi/+dLF/ccJsLYa3SNIDxiODfqBGrdDbEH5Os4kRF2g6t7z
 ptZcnU7u5yC19PHAYft/SuQySgZIv3if5hgE1JnmY9pgvjvVlk4tPLN48jn1/t0SkC16VcQdOuD
 ZmKSz3DriQKI7bRX3urfA2CzPMGQwny0VMhnvwY01JjmD3G4LNqDZhBbWaMrT8Xh3aOxM3boc4w
 /uiY8+QOJs6wsgIA6G+18XF1prXxgfz2S0VZS9HIEko5n48Z4Q8FjaRqId9pZDN02wl3Hh4r/p3
 9biQDVna0ej7rby8zwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfXyQmw1f7R9qos
 r7oYhPNpfTP/Ymd9Iq9SsdF7qCIOukQOduY1Jkk2W80dhjcZhULxNr/S8DLo+2tSz3nwDPYb13n
 v9o7ZBizg8yZcritmzCvxTVVO3gan9U=
X-Proofpoint-GUID: H79lWZ2u-2Ls4iSDmAy2Rzc8hB9njGL7
X-Authority-Analysis: v=2.4 cv=P6QKQCAu c=1 sm=1 tr=0 ts=6a6c8f3c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gNcS5RXMAAAA:8 a=EUspDBNiAAAA:8 a=qfocr26bbEtc0TLUibIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310091

On 7/23/26 8:18 PM, William Bright wrote:
> The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. It is intended to be soldered
> onto a carrier board that supplies VPH_PWR and exposes the off-module
> peripherals.
> 
> Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550, PM8550VE,
> PM8550VS, PMK8550) and the apps_rsc PMIC outputs. Compared to other
> SM8550/QCS8550 boards, this SoM excludes the PM8550B charger PMIC.
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
