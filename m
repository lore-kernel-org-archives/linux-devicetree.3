Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D253D47B3
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650869; cv=none; b=eV/TKlK7mospDyruP1xmnDZnfA5WNNnELFSJNyPnSTraxZgGZlW+vVYwm6TMV++020jh2xqwvveJw9Mwg9YXBN7PtEW6wI1iFQgS1RhH0QxunogjMnRMNsZpPfqKS1GI8+4Xo3IXp1amSuEOQ49+2YfU3n9dsZOYM/3ojUjeAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650869; c=relaxed/simple;
	bh=tzFtmovB9wZ0wo1v/yiTjf/mh3kSjnpT14RoxiOUwug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qi+ii/uI4yLpHFLVN0EA9WtZRxHM9HOYVMf8GFLLlGZL8s6tl4SLxo6exT4IjceelYpIswSkc2llkB45NwD8T+zWVuoTiR+Z4SVa/1ao6oDKFwHWwIFXk0hXOnnB7+p35fU7Axov3tCYWw/xyq+Pdv9Ly0ju8Pf0un2iiFvDkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ/TNvzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCHnQ5w4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ/TNvzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCHnQ5w4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88Hv71706691
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=; b=eQ/TNvzYSgB3EPYS
	2kpVd6ZgmSp2nMu4NLIpB3a6zTbHMoiYhj+FfWUutllUHi/NDYn+zDnxfkpdCUuU
	duUr9qPI0C83P+smTqH5B9AH5TROcQUTFDs/CQ1JhlebpVaCttoK3oXMr5hQNtP7
	ayY1ZzzKo9RZl+eXfi/KQCK0WbqiTR25V1LWSeCInshTKDc2YZJGa3WVJ0akvz4a
	YWB6E3OreVO0yZQ3yST2eroBY5Vhta1JiXoaSfBB6HOmFMkRLQ9SDAIXmeZPq3jN
	/DaxIBHtSGNRq7VM7y6vGUJWVU35NvCwmmdq3ut8J1bC6hlniLIwUYu/e9K9sMBK
	qc1zgQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvs8ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:41:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7570225606dso78414137.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787650865; x=1788255665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=;
        b=CCHnQ5w4MbDuMIwBpYyjbvy1U0lrnIUbL7SIds3lp5mmPu5fuMU4pUd1nkfBTvUR4O
         4XOIZ1zCmXSkap9ET1kMyn/kL4gIM/yhPPL3BFSr64SUJxBIo3jvmTQzACl/LgmFwy5B
         LpuXMv/t+8kAW1E2/FQjJGRq6HwJ5jNWS88Th5BEUHU2YmpnM9haisVuaPEKfgA6FgFL
         MzhK4uFJCi1EHyK4IL2DiOIEOHf92XkkL/YLwAA64C/BxfAfyQyJ+iuUju4+2WzaoN40
         hXZ5M8Ni5+obxVIGn0FeoiIvyKW0oCO/eTcMXopLCwiucZzzmJGNHItoJYsLy4Y9tfyQ
         ppow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650865; x=1788255665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=;
        b=UdEgShm3qMzvA+DljbVthrtDXUdHM+NjWzQE+76V4opwpp2a1wq2RyG7rTBYfLvNzt
         aJPcapwHQf9MbotlU44pfxaRfNqcm5fAiuEjOcnPNQCOC6As0ee6+x0oTJhhaiB1Kq+B
         7yyvEszLffEr73Kmdx4IoGOAWZMrPVQcbWDi5cf2twEA7a3gMdFV0nwp04k3BKcLowU+
         IBLQeJqjlGg3QtBVkWVgiQP+FL3PfMrj80+0z6PEPU3XcyEWIgiLMgqLwvYvIcWyS7F6
         2jVdPty83qSCfNOE8CdehlWrRX191QUgChvE0cdHW0L7iYXubc/3pszIEl2TlQ7nwGPN
         5bsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW1N4GlFKEiqe80KSYpB8jvlQEH09hDn1teaOwOUfRxxlB+ecf6lTOmgvTOCl85Nu8bRz5KgsZAghZ@vger.kernel.org
X-Gm-Message-State: AFuF++kZHUjLNMP0tImXJDaUCG/fa5BMC+Dyq0R8jyGoaN/1dnlXLD0N
	fq/1U7w/WsAqP82XMDOtFkkAeIHLspdNHmdruDH96MXTY2UPCwUg+4RaeX5GB/b/Czzu99NuYQd
	+DvTgD8o2BSIVd5SiIQ3U05bT5/cUd6UeoAEMSGrkRTXzJTQIkx3FYIoMsOOBWkQE
X-Gm-Gg: AR+sD12J8sHfs6+5FqQ5jq/QC5SxpG4eVAa5lN4s/H5dflKMya2pImSKAfdrSlWLEBo
	WF9B/TlqQQ4hoeJdoxuqgX7P+PJ7oQsLPyLYoZbYT9AyjR4zbwpDoe5sXSo7tZCBAKw+PjwDLGE
	gQg03iDGXcWox0+hWZfvUtQa6h/CXC68L9OKhFKR5AS4sL9HJf710ZFXvLOIO/BMnNym0eiPvjl
	RrdZyG3hIv6mOzxwMHlW6TF9+CEVi0VwbdpUIURv1FqguVd8gFBVppHiEYbHdmZxTYujEJ/Ebbq
	xIcutCMWqewNViELHP49irWFQx+t+86nBE4OdjdLp8C9vzGrrtD4KEV1kJER/lnQDImpKA9wx1+
	NITrxBfMFZxpzfr++aPxXdHYS
X-Received: by 2002:a05:6102:34f4:b0:77b:fd61:ab6a with SMTP id ada2fe7eead31-77bfd61c1e4mr2511514137.1.1787650865545;
        Tue, 25 Aug 2026 02:41:05 -0700 (PDT)
X-Received: by 2002:a05:6102:34f4:b0:77b:fd61:ab6a with SMTP id ada2fe7eead31-77bfd61c1e4mr2511505137.1.1787650865058;
        Tue, 25 Aug 2026 02:41:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm12971578a12.27.2026.08.25.02.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:41:04 -0700 (PDT)
Message-ID: <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:41:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MSBTYWx0ZWRfX1ys8aRkxw2Ng
 v+UpyRo0uuZl63SLIYT+m5LJscvGMla4GVBCostZXHFdmzQgVHLWJOkxN5jWRjQXl8xcx79orfc
 vBnPHTK7jsob9QPdw4LSFfuDEnbuindiNrTFL4I71N4uPwKwLzm6eINz0f9UKfiDtPOv+9vquBi
 OdBq4LI3qmDrC3ERAS+9MRdB5JMGtiW17RvFbR/gqyRUs3X9iOe5H40uf0Q8DtDy31GpUX1mYLZ
 V0429OzvcD4W//SVbJgNTjPoDrdOuidfqPFGzninaSZh4WWuoPxFzYO1trimjQasNyNIG2ZZWxL
 oRxhj4kmTd5L5OLTTd95bxYDlEziww6m20cUyNxlrW5HwrN4a7H6bHVbr+DeZICT3nLj81MrAB9
 OIUluKvuJnNJVHQfEKzpc5IXQ/Ud84P6Sa5Pf3ruNgxhM7G4SOZhSlTH7hQAAWwdrAE/lMNZs4i
 LraKpRBX8w8lKczVejQ==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d6332 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qjjNvQ9hGNcemuQZb4oA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MSBTYWx0ZWRfX5llWn2r4eij9
 abB9c+c+fW1MS+RTpM7qlc+MMmYgwgvIk2jfZanO99yc0EtVpE+vtR2XOarOj+jjUrsE8JH5Nei
 AhMWlPUq3vFJcvR/mA+10+apyeRzpho=
X-Proofpoint-ORIG-GUID: zILlFxWiAbmYaS0REQ4-PPiFQ9mMcOdw
X-Proofpoint-GUID: zILlFxWiAbmYaS0REQ4-PPiFQ9mMcOdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250081

On 8/13/26 5:52 PM, Viken Dadhaniya wrote:
> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
> controller that operates exclusively in target mode. The existing
> Qualcomm I2C controller drivers (GENI, QUP) are master-only and cannot
> serve systems where the SoC must respond as an I2C target on the bus.

[...]

> +	ret = clk_prepare_enable(target->xo_clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
> +
> +	ret = clk_prepare_enable(target->ahb_clk);
> +	if (ret) {
> +		clk_disable_unprepare(target->xo_clk);
> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
> +	}

Does this need an OPP table? Presumably we need a power vote for each bus
frequency

Konrad
