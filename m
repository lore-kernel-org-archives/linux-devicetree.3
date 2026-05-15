Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE703C8C77
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844582; cv=none; b=HVtu+2ZE3voZSa9u420nvLLumgJfrzl1FtO6IhcwRshO3UeYfwV8Wm9lz1KuNyHx3zYfi4nFfnYj74oG4zoWRPCi/tBTIREx6JYEuC1vtopJ1VyALU8iuDRzErnUCteNmKqbp9MwSyBWYHhygSWXuBsGQvK6K1kakdZ27J0Xkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844582; c=relaxed/simple;
	bh=HL4XXTwUHCtAfy5lSSZ4iq43KCo7QdAzVeZ7SuFGm0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOGihYhkqEAzIBRGL0V4jIMy9ln/WXt3GmRJI2U+8lTUdLhxLxS0Exbz8TQfYvTT138ZA5YpeI+rBTepT0c2TJZY2UN1FS9UpO9IEa2NzDs6hqNDY9flt5SnnzmHJq7dFSiaD5nHrHWRogM81EQjs8nbHT9EVlA2HkE7oid7RAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJJieRKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6jY3bT6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJJieRKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6jY3bT6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFmsd3219663
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=; b=oJJieRKP8dTpMse4
	Pq8uv+TXTlen43ebv+V8S7rRCnabDSqn5REqUpO4Y+Cb46uV8OZx4LfsnEC0nT9F
	zoYtfUGDUyQT4db8Cvp0i5vfidgVXVNWSBhxPJ3POQ+W/DXynVGxKIp9yZIB0txy
	keWABJJNvKNDqBwMClrKkL6UJNzOni8pyoXCNZCPOJzHc/Wf3f5DUh2BDnDQp5IG
	mOUBrAKoC7ojAVRFh6+ROMYA5phW2gHdrD3VjE/sfii609OffJL/vYv0niUXvaJJ
	CcUsWcDidDwm33giURzNXgUud/+er8FNNqm/HtMqPBeVJBrQYh4i74wf/hXSB/X4
	6t5ftA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s315g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:29:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90d102884f5so101201485a.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844580; x=1779449380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=a6jY3bT6CcWzxWgF/Z5kh+AG3aAuol2PfIjOru2X0l/ILPlyYWs8mhUircb+/Alvoi
         4X3E//b8AfYX3bOMwVWh5gDufoV3lq27zdZXmhnf/HFkjdEeVsQzNNJlkuij2qBzWgwm
         VYkgnlGUdBftg7XBxrKR/NpH3czX4RrOKD53awh81H9ODEGjQE8uiAvf39jsNyuV2cEi
         nmxmDWRAlIHWlRMTsoA/7pccBoA3YIlb6R8eEc2UKfgCwWyUJLsrAojQUYiVqTSv2yO/
         33/Ty2T3zdoUdQjU5yCRSdXSayeJ1HSOsbUboFdXUmWvOAoAXS9irtXLflKBcEXAPFhd
         nmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844580; x=1779449380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=IrwOqyMiPH2ovGfSTiHi/9xUSmq/oEhvX5DGrYxX35y0rltrkdmD8MVip0rLA7Qeq8
         KtDr3M8JXsqxJkP92aTUgfUNyRnOZrBeOCopn5SHa18BDsmAIa6I6ZZ9nfTpRrKqxE1v
         cFtSwSKMEzNePgk51PXSsJIV4GEwjyPQE1LVdU5iVLfaUFjjS35H5O+XFOK3XShpbpeX
         EiLzm5t73g0nDTfLHeA8JiWaDTpC+SnR5IrO85zEWYNH0d45GJ+7nf/MhwkFABCtp2jB
         5SDLjBWsdYuMjlVQGk/yNWO3VjUuPa5yz6GpbHZSMD5M6BfQodGG2468eEghSP/zO0MM
         PM0w==
X-Forwarded-Encrypted: i=1; AFNElJ8l4be170SB1tvF8H1thqrRc7CrY3dlqF5Ho65o6ZqDHYcjAVeSQn0unxfd5hwPJuPMMJlW6wj6XgUi@vger.kernel.org
X-Gm-Message-State: AOJu0YwwO1TBp896VEGUlXqrLMQ7PMnCtGGh9ciaB5BUcXB7ojrHizxm
	4Fe2bBnBXtv6GLrDj1Fo2TaNNu3X3ludrE3fsObT0altQ6Kf/3qfA0z8L+4E+at4xhOePD1kMLI
	hFaXf1EIB2utfHeVTBBpyFIWaB5dUW/ymCoN3BQEOnDZvL1IU1wx8ZVIDVWE2MVlj2lfIsMIk
X-Gm-Gg: Acq92OF7m+R2ILU0gy+Sw0TX59qo2ATKui2BVuHjJn8bBlC7DRISlQpTI/TJef5i/fd
	RtPtlrFPVErC7HN/rQz3T3JNfJyOMixBKrDz+HR8Cu+e8Kyx6UFyEcJmpn9FNacJljzHI9vAP6h
	qK6USMRD5hdhQhSnHYrKTg86JK0cfNV8nojVNyqwWQKXTJB0pczBMMtyPlDFESQxvvez7yDIgGD
	NbOML7nqgy4zRM+NMVW0AHHN8kAhNi66g5VofXhghgQolLbirolReD3ZV0Xmvw3B7IoSKYDbV0I
	/Qd3EgSD5d0299KXFGdpkMBQu3TOXpeIrGrPGN9oSW22D9C1tfjySxyevOmdJ3K4/j2w8y8nV3P
	GoZ/hs0lz25xmhT5/Oo6rY1lS/z+VYrlTddVU1xqi37hCX7OUWbkiAHM5sQe3myVmz33htwgf8N
	ASU+A=
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370339185a.8.1778844579877;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370336785a.8.1778844579499;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f6bsm1874474a12.17.2026.05.15.04.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:29:38 -0700 (PDT)
Message-ID: <1d559fe3-c488-4c23-b3b8-4974eec3e38c@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:29:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: qmp: Enable ipq5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXwyWG9XNwfijI
 Og7vcxd/HjAZrZfzLryjHCfs2DzJrBtzQ4Az+T2bfaz+WLz5W2CQNwaC0MIyjiNaV1AyZHoH6Hv
 /veYsOG1myvJlDE0OCMbhRQMpQWCC0GP4V6OLihGA8/Xm7WypM7PEn8KidGmlXsS1y9ap/oNHR0
 cRHlQV/FA43Tb+OfLLEA70o8wOqEH30BNz/lhdp2WX0lZeu3QYONZVAIO7gwFw33t55fPFXpQh8
 npjE7q6/nfvBn3w2uw2d53VuQC75Q9emmWQL+yVwoce7D7RArPLQl3VjSoH+j5/mM8VqEHXAuh5
 KdYpm/mD8kNGBEPtaOJ/68690TgNAdb1Cp9qqPAB5Adq5/m4vWVHZBUpd3HWWmm7nhUcre5WQsO
 xN5zf0n399Gqk7UUEWDzB1+EpRowHkUeUwTepMw8hbS1960V92ZzXEnEMgafT3oBvp7k6XMWTWj
 bZDpivP617JUwcYajgA==
X-Proofpoint-GUID: 2qzRv37C3xr2r-p657ivrvsnb9HyfGXx
X-Proofpoint-ORIG-GUID: 2qzRv37C3xr2r-p657ivrvsnb9HyfGXx
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0703a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7VrQj88toOM5sR0hJNsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

On 5/15/26 12:47 PM, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for ipq5210 SoC.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Since they seem fully compatible (also in patch 5), could we simply
use a fallback compatible?

Konrad
