Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29F3B71C0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895619; cv=none; b=mxI3BG7qHbmUGCLjh9GsEv0kncbUVqeVVMjMJtgBlAuwQVYjyGosg9e8djec+jtzOYm3dp0g8R3OQNn1vfmeCMJRoXOCQJCl04JLOwIdUPMr2ljtfKsH+ZYgKZAfJKsm6NTR9y+vj+C3XMGQvcFjPZGoPspLzAApcNlRRRZvZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895619; c=relaxed/simple;
	bh=2/N65LdBK3aWBuEUGJaENLU/Tj7MhD3XAL/9iOeMu/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCj4QaHcUfPR/nB3bOI61sHQkMEteWO2w5SitkmZTESwEhGUwUj9gXA+bxA/EepDjnlGWOYLtcSvIWWtabFrT0gNqXvjrD6/pPubT04Ety0TGl9uyyAvEnGM2cIOsy2swOWqdCRWbfCTZy+ThwZGz3NZggZo635+HcD3B5ePwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyMydtNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGq5W5tT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyMydtNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGq5W5tT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvXA790856
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=; b=OyMydtNg6QsUgyw8
	7d4qSpd8Uz62RhksyfnB7oIC/MZZAVWd4Kc362dRz4XG/x8znkECVA3n72odQOfq
	IHw3NHOT6GKTzZvpgVXGDMxMZfns6nrW9SCxGqGk/3Rbh7z4dm2zaACp1wxnAo5P
	5KpBX2uc6+e3BMgYMTxAgRYBZOfKFFJnlydOVOrPXcx5yXIQbI3aWT4o8AjAHOzn
	vKg7yAjfvHoMlrXGpyzfSWMSR/LFIEjsLQ1H2g3iS0S5OshyMSBdZxe2dHt4QZfh
	3Er6NfErh4lZSUuBaYeo99knZWwA0ey7dTum1Ncv1yTlK7aUUXPESPiQt0KQ30f1
	HRgGVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrw9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso46998885a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895617; x=1792500417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=JGq5W5tTDJ23Q+ckGAliAqLSHfo9WObuR7Qj93jBmiNxy4jjKaZElx6ivcA6kWM/H+
         7Yodozrl5RldDQJ2g3+5uyftltNRqUF7dBiMYYWVmXL5XNpsKeHe8afAQOVBoVTCl6UN
         jQkpiJrDAYVDRgDX+axGO5EHLLdpz098YeePH+2UhfYKzF4LBhcJlSbrtHF5rBHT7WR0
         sOVVpcXcO3gL064o62s3onpjVwjdwatFV4mcNQbbsr6nD72qD5Ep8qWlz8/TvNMo+bEF
         bKKjvU7/zw1OXiasExSkWJnUAFS3d69PF8SgOCQaSYX1ZQGC8G8BwrDWP5p2uIRH4Mx6
         JaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895617; x=1792500417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=rS2uSr41iNqQaMxVxf4Gw2WbLjAPudp69ob3aIKronIs21eFuJukXtu+LNuUNGNmq7
         R6K75ukMvLdd2wJZYyTctblt7tQFC4m91L1r0CP8Y2FM9myi2NBwZR34/sFQB92aJvcm
         7o/WxftXnLXH12A5ISd0ffogML38V2MxZG0sdGRxuINzTvzoHxfM1551wkJ9xUNhPSh+
         ABT3ix3r+CIet7Vfr1rdbfmyhS4sbwJ+haxjAcAWXldk0c3qJWKRL9ODC396tlzMmol2
         bUMlSnHvnFO6faYEGhMyHtxsXqgb8a+O2IuOJ4puNbOXTPpLY06ItjpWmsP9MN/B266B
         ktTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdeO1M8i5wH69bQ6vX5zseFnV7hzT4lBhiymy6E1Qy+GzowuDvdHj5ymTHtxUNBtMzRnFyMU3WE+dW@vger.kernel.org
X-Gm-Message-State: AFq9FYKL/npFVQ+9U/cR05qc/PQxNR7MrNS8xwqbZBpVJ3AqMkGK+Y0s
	rx4ec2s5ZjwT31QmQdJcN38s5wk6kmen4Wd3Yrztnn2693560F2lkw/ZNftYdzbZN1X+vJht8kh
	iLOvogfV2N7/RkiDqAleic+01WOxN4KjFjxcPvdSnxqTKCr8c1+99KXCdH8iW9tgf
X-Gm-Gg: AYBFou14qdq5Nls489nYmCC1k5gJIbck0HUKr4GxiZ2dOTpIZbDnlojt8a9fqkUVdH9
	c2GrtPnBJr/aEcC1u4JEjUR4qjT6rzby5Zr6Htsdz5Li/zgFtyudVXGLkoQuCA6tpvhWLqKR4Nu
	0cj+nVnvS2wvnnabPhntApB43Gvpve9/MrH1VgICTmEvxzWy+yUApGsyTPJCD3nYsXU7p5Emq7K
	pRgfV5Xg2/1Y+0ZSocfX5kTShWUYSDB6vF1gdeh4v/Ww1BuM0kPN/ettzXRrHFUTJHnrhAVS/OF
	AOn9oTSxb4hdkWOwrvAVSbfv54dytfectydZt2WAJIrXy4qYfsm45DhBtZFmVo/qSG5f7eX6vKa
	aazq8jey8/0X5D09dHF8VbA==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219330585a.3.1791895616696;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219326385a.3.1791895616121;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caacb0sm38641251fa.20.2026.10.13.05.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:46:55 -0700 (PDT)
Message-ID: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:46:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX+f2sddgMS0fc
 AeZ348n4IElJ0vgyMaxlFrst8AVbUUrqE/WJGFtLOBnJDGcY8OFkbCPgIaL+IO2fce9yetChskP
 53pXsBdp0WfVyx4zZBEhatgZYWqkdms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX9+auSyPh4Oc4
 J7VN2pfs46RGghMKHWPMYHwMk6VMqIv6z/0Xi8ajNLnzlOP8s+4oAr3xtb09KnL+z6l30EY4laa
 D2NPgzw7cauhodxZ1m1WuKPm7al5eQS+jD0Kuumu8FMbTL2ClqXicEkSdIIATdRAsggsbNmR4Dh
 LMmRqqmACPM2rXhY2MRPX3+5G5lPpj80dDPcs81XaF9F9S9QJcLljw1DIZdoaAhsQRVUdppeddO
 QOfF5N/3kWI2nieJgqtUbn9AxyKG5CUEpChZixNAe0pB19J5PSJYsPl/V2+NLVv09TbxJ9iJECR
 UWLWLVn6VMMiHiEIWI89cewPl1IA/zz+1Zk4zJMfLvDNUUt62gcudhLnXeKpj3D+vpTrV+ZMBwu
 swEDFCD2j7JaPiGfwZb624Wgc2xCXhZrslB9HvcPqRzB5NNz5s1NdIxVBUs3pHwRucmeh4ivfEV
 AGIEFMh8m+EDE+XQ+gA==
X-Proofpoint-ORIG-GUID: BcNG6rwl5d2doD-8NJ3A-G5UsDnYcw5D
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2841 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BcNG6rwl5d2doD-8NJ3A-G5UsDnYcw5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETM,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the corresponding
> cluster_pdN domain to each of these nodes, so their power state is
> tied to the CPU cluster domain and the runtime PM core can power the
> domain on before the devices are accessed and let it be powered off
> otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +		funnel@12080000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x12080000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {

No need for power-domains here? (also same question for the other
platforms)

Konrad
