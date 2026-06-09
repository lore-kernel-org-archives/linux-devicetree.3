Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC352BE043
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011702; cv=none; b=nvHnUM3TU41SdzqJJ0/McU4oXX/OlrHHo8zANKajFCfN5NFHlfDRpc6IrsttBpDLi3hR9qE3wbzCS8s1gTwKk8ERD9l/YAradUaqSoT9uTATPbgoFFItm3eyi+vKYVrMdVU/Xe6RmCkItlTE+rmcF9EX7Eb2Yucqk8+n/eawAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011702; c=relaxed/simple;
	bh=lh7VcJd5s9opK+qhKTvgPwy9qXS6LiR7Bvx1T8En7g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtdiOkzvpuSGuHLcY9Ym5uTL3JsoQT6fEP1gf+7GPOAIfryVgS3LMcvIU5aLozxZzS/hlH5phIR2DaagQI37a/0FKtLyJBg1clepbXlGmvlEnq8IMjz7nCWawGCSGPNHOVCscBfMwWzy3jwacVhWn+eo4OBdqhQk3gjvki8vFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU83Q0qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gua2nliO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU83Q0qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gua2nliO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClQ4w2286786
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=; b=NU83Q0qaGMsKOQ8y
	vjR3I6Hqytny9QBqb1i+qplpOH1MG8n2qafEW/cJBI8+O+Hy2MMuMlpnwD0c48oc
	FEYRpJfMz1ZoxRjhglZdSr243khOfc7Xj9J+kPh20u+VjdOEOGLNz+52sqJRN3Mg
	pLYhTA8wD2GUPA85QjD32TDu0jTyzen+sYgGqCtvQbhS6hUb5WZLDN56sNe4oIv5
	SGpx7juakN0kJSuapPq7ovhUrX9y+o6NdCcx51vJy2jqGlwWDFaV+UODsr4ZeEEg
	jibqbcRaqlUFrKD31i5zoMx8LcretX3HJfQV5I+6+oFcGZYY4ZdxCkj8t0yXBi3O
	SnrTFQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3js27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:28:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5a5133221so199946137.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011700; x=1781616500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=gua2nliOmLV9232rI28au58p9+ELWLmZxBN+EwIO6WRCB5LM1kZOol4JUa5IzpXlfI
         /hKxkgl20Ig2kZ4aKdTgy3qeWrO4d8pWN9c0wH5n5DhmkTeUiiXelwoCkFDj8XQIuV8r
         iPvf/s7He2DdBBuHtwJyamHEZHywnfMqTmypWHm+ZVbgzVGznU+TXvC6d49orn6F30SG
         BUqAYIkRQITqt28sgIPyw57EMpuyw5+wOx2MFgGpobXJegvoPTK8C+qJYwspWNxGQpVe
         ROASZcYTP6GD/4sGGTgir5Ws7xnaPDXNB/sO/56g1H1UZvQUGDLxTO8QE844GCDYdsNv
         +Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011700; x=1781616500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=QntKk0DU1zL1KPg0nhRC1utMreUu8jAPCM0+RRcIi1TSwrg6yHgkaR85jzVPMKk/Sb
         WXv6uh0q+LYDpPw8TLHUB9q008wvpn2EUT73JkRGuj4WU4jLwGbEZn9hQP2geuy8Besq
         5bFvmhDqW4ichycfnXZRYbmSKQqw9rxZb3FNpdNJ07GTreXURxy6XTUE9pEVpC7EWwg4
         RzOeM7c4zTqu0DU3N14Tgnx33arlEYctN4cuPahFLO8UIGbvFYYw1GyWg+BU0Ou/zSIG
         fury5ASAPdy1ZS41sHiJQ0huoNg/JF8qByf6exChC/xTmpiMOD06Kjqqt15ZwIGCN/xj
         5Btw==
X-Forwarded-Encrypted: i=1; AFNElJ9VmdChuJ514o+JDZh8VgpLUEr3uLEVO0mKMUjvkj6wgCASUhztd8KwgdGpzz0JwdaA8TCCOMYrdIoL@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIuqVZ5iy03AsYL+cSmo9MfUKzzqZXCyaadekzEtnwJBiBs8h
	zuzPeo7FGqu7V3XslaE+uvlNznSsidXqmhBDhzc33c9SrQJ8Yv1jbVvdm1eUlAf5u88G4PyWcIQ
	la9HV7edCZW+hi+cIQXVjKEzmUgHpqSJEydFcfV/u5hG8i3+MoqVCFfpV0lyqgJgD
X-Gm-Gg: Acq92OE26tLAxth0S5aXI1GwxR/fXL92RzLVGnEeXQPezjLm9KQqAGMvBfpApChTuJd
	K0Albb7zsIuZ820Dz4IR84YEL8mVYM0DYCkx5HUOZI7kFe+NE7z2VHJhzIjbWdrPs2iB42ybyq+
	3E5Nj3z67OAEsA3rXtxIem0MxtHCVVkIcErf7+p+E+lVJg8vf3SMts4/1FSI4gy5TqJMjAE/bgx
	tlShQz/9q+gArlzwanTdalulk5YHR6ytf36QkBFte+xXQOJyEuUERnSdlwyMn6x47xuKkXTL+1C
	uNHdf5PI/UC5LQB7Kbbnc9NRg0YnSblLbUSPGiMaNb20CusFhMeyZnu8XOiHjqfm9ZZ3wlYNERA
	UbM88uqWVZmE5PZYUXwuZSUk1I4UkVSa1hN+0OijLTWaQ1mSyfrON9Vzp
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444761137.5.1781011699776;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444753137.5.1781011699394;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1038231866b.43.2026.06.09.06.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:28:18 -0700 (PDT)
Message-ID: <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:28:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bOEruRffE59WuciVYWeZfix22idBUYqc
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a2814f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a9V9PMWcc79cobRO0OcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfX9+ZvLckrhNy4
 uiSXCyqCUmFz8yNNQQKx2KYRpykW/IMMW7MgOkUzA1EYJNyB1qge7H3SbAUJaMmhVwfb9NwC2rg
 2yBuZhaD4fdH2E1K8mKt+/znB0FUODGisDP+czg4AgCPIMVNSKHDY1WIQs4emMFmGnpWMmK5z0V
 558i/oCgQyMHas94Mrl0XEvtVJ7uqIowAGJuGyotx7tD3Lx6Li/ck6pxN85vzO+Egg8EEQ/CVBo
 AK+aqI8IXU/8QT7t1QQCI46TL/TrS64gRdv+n3GGB2Qa3ewZzL9HOFwonpofObGES7Pccq7k/Rt
 HlpPYQm9UiOZ09G1UV8zb5Q+5HTJ8cwcVJO6DShSQizpdc6PgWdo4tkSk/R7FUtQQS50rn1eWJ2
 tIG9LKv65YzXAc/5tYTz1liQe75gDs3zOZs1ocBvFpCoCY907XJMaZecHZ5B+VMKhhytCTDD1RO
 wZvqBTulQNXoQVYq3ag==
X-Proofpoint-ORIG-GUID: bOEruRffE59WuciVYWeZfix22idBUYqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090128

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add pinctrl states for the GP M/N divider clock output pin across
> multiple Qualcomm SoCs:
> 
>   wire it to the GP M/N clock controller node via pinctrl-0.
> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Please squash the pinctrl addition and clock controller node addition
patches together (single logical change), and separate them per-platform

Konrad
