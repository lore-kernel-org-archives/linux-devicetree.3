Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5373EF0AC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179304; cv=none; b=Ew1fjjQRijVxgZhn4c+ySRpcLXKM8MijUTxvpWa62akl5xD1EH542juajwGZsx68S5zinw1TKc1Sxn45LIITHnXS9LB2FT1MFLBVnrd2GcLSS6X+v3hz99Vd00NW+LC3l0JBWocF8CzHB2As2L51U9tZ5ecFFxbobKCJ8gkD5/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179304; c=relaxed/simple;
	bh=UUASRU8qrMq5bxc7X2jqPLe9p6S7lopRBLYFDQYVE/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0cmU4msETDMIPbYR+v20pHIEZYBqkXro9k7K9d1+s/M1OCBWPmW/TClIp8M4T+zKuxI5iLCfg7+I3Yywcqrgd9t8rszYYqya/xTIxS0CuHpsfCAus7jZomouZs01Lv6GApoaHX2N+ZRQuKaTf79anrAKKaEtaYiLTlKiXoJ6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAZtb8EZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR/cIL+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAZtb8EZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR/cIL+0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xqrP214540
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=; b=ZAZtb8EZN4eZib+p
	As4Cey2lWAM+Iy3vS/dONwDJD7n0caQU8TEFUHv7/9YVYcGvsscXJIzbPua2FjP4
	rErT0VqMybbitS4M2MbbOfLVgSB5ZxaSxBk6TA1TpdobJu+HvPbFsAb3XUoRPGJN
	4s3MeqrW4R7dJKkZ8ldXc5cETqZhu5ZpdfWE8RopmtjQca8qFEVYmEZe1JNbIMDg
	W9ccewyewbk5ePVwSQ0HGnmaS4G/i000be6LvQRSBgSc5stsfq5MRqlGyBsMr29K
	7atVHXcTo4iamh1xyrKwbgMuutwl0O3qxFCPYZK1OrRrfEgAxJqS8R2fmQFnC5fF
	dLsTow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skay1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:01:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so11615441cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179302; x=1781784102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=MR/cIL+0CLIOVksxT0cGXFz0q8rQPwVxolYM1Cgvd5+2of2iGexu0WUdsiDqlTouVy
         pnd6RQK6vKGaO+7d6sgCQPRYDFMhwgvFzTR3UmFPf4epIOn2OIKofSCZpvNS/I93w/wS
         673TCOCWd5PnofOTp6CDSgDtV5yuveRZk0i0IwrigYIMsUaH5ZvKK0RqW4vII6QiPFCw
         s9W1t91LA56rNC63b5RNSeOZA9l1jP0vHPrqifP7m5+agKX2ImaQi1+KH7LkkrHUq93j
         eiYKSta3tCtk8xNjziZDmw3CMj+1obea5X+uULfgpMTzaTrqVqsr1z+ZlcX0d+lU1NGa
         dHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179302; x=1781784102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=Wn6AQV+WfE40iZXxHL9OIMMYysgWMI7EfXzn6VcQFgLcH/1KgJ7hidPnlESYdRA1+z
         RqfW6AGMGfHjUGGMzMKtUnLRPlNAUhwuNEOaSVedBkI3f8Td58AZW0pmzQrSvPhy3rhC
         xk39r+A5MoIaHhUWlN2CAxkTVabuvuIndAiR7cXraJauOYqHXi1or7waajhSIC2a2peJ
         0Xl0XGnVQ4oloYU9sP5bVS7wdRG0I39xCSlwCsOvO183MoxPOVG3cgtx+w5HYFiZx/TJ
         RlmnJf/jcxQyCeyQCX677dUgsVgE/mOFzjREEm7hhJBMfuLkmiWvgpdNbubKE0e09xFj
         FdHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+61WKNtrVzL9bAVj/L3HMBN/6TOGNIJc2aHFTFCO2OQsDq4RpFfoWhV0fShrcMPBo6kwliFELj6s9j@vger.kernel.org
X-Gm-Message-State: AOJu0YxlTHbziXgnJrBhh2f93+zXIpnfcWrS1dwrt98hKYn7LPX11wNk
	MQGPtJPdF5bXa8yP/LfI0zxKcfnyCe8gkay0sv10sK5g9UjhxyCf+uScqfOXNT3qliNNR984919
	R2TuHLAf29WKCx6LgKi3w+sWCbkeHgb4hPrcKlaBKhC18QH8ETzo0o/tk8ADNSwKn
X-Gm-Gg: Acq92OH2K2mrY2SsNVNoBVJ1aw6q4uWzjX2yXEharJKs+DrPOzi2HnDpErJHpQz/Ypj
	bcAGhRX6UOh6BMP9iq/8QGObDXzfO1aOo4Np8M1/MuqMKcuHT6nsxvVHp3QrqiAqDOHflDY7iXk
	Zj2heU7qepr6+3Upz/wDEEmb4+rTpMvLwiWt1tQvGW/7sNft93aGjXJUt3IQGAH8mSaE4H9H8CM
	6aVrjzy4HKeLv8tgcyES9Hu6Z5jdmhqlmE7DtHnd7h16BZRArcZJtIit9kyK+zwRgNwdtVvMtFY
	9Kj+dKDGp+s1kvbC0iH+ZOXIRlywAGH42sMjWst0nn7ktY9wnrf41um+huh01DaPwafCImvFAo2
	+9KBMDn+WXTOkqW7FIU02VrHJP1h5PtY5Su5B2piv8/rXeSRlyhrPQfXN
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23776821cf.3.1781179280752;
        Thu, 11 Jun 2026 05:01:20 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23747671cf.3.1781179258661;
        Thu, 11 Jun 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1607ef1sm54532366b.15.2026.06.11.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:57 -0700 (PDT)
Message-ID: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2aa3a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HgiURebnQJ4vjG2ds3gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: oORSZV7audo9_uZtXraxbaruOen2hziC
X-Proofpoint-GUID: oORSZV7audo9_uZtXraxbaruOen2hziC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX5C7htea6pw84
 oL2gz43X6y3ZqTIROX9zAuYa+mfU1ndiza2jpODqzm93bBNLe50aEWPHFJ2k6NGRJuHw9Mai6Og
 lQt1nxLyDIh7A6ecPL2VMeYg7VJsYVrdhX+M6NnDBLO3hOj2ryKHXrRiKAXWX0SKIwmOnnOzcd/
 KF+bmJ/vEaY3CvmbSugeimQGQCQDNLymRpXgWa8onq4koIcfOsXfsaRVmYjfh+jrwsRs2hWAVKk
 WwV++hS4mddxEzMpH7PxKK6acTZRlnus3kBXRM40vDnR4e1U96/fnzp5jkzOASryl5auvX6h9Eu
 g2GBle8Osuw181mAhWwwNlxlm6ZEuUVFhothq36X3ikJX+nqshDLHE/Mjuwr3p4uZAVJ5DFn11D
 73tyiyyM5hfXps3bUnp8nII90dhWAT7kzjrnlc3CsIHQaJ+15cerrgLiwYpX+Ij04nVbYY9JVOp
 f1gmQCyMdJqe67xl0Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX6FvfnD6mNlKp
 6RWs2UauejKsRkPjN++/DfGFi02vfbTsZgM0EfrRwrxc2rfAwVcYDpwkqQ4dfIxdNCzwMLn4Y3I
 M2Nj/ARtBFFMI6Sj9UKgqAqsKqm43p4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110120

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		evacc: clock-controller@abf0000 {
> +			compatible = "qcom,glymur-evacc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,

With the XO_A situation resolved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
