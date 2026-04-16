Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12E33F595
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333276; cv=none; b=ndGV2RmTEUm3RQHAH1Yv78CgrpnSY17fz4xawvcY1DKe3F5GBDqqZAJq7Ji45COk2iBGOoNxWVBeqXzsRGBZ/9fTQgBr+0GRP02sJ21PzY/IdQ4Rn71qkdsPwYnkGnomEnvT5NZnRi5mZX5wZdh6NotA5j6IMFUgWlb4V2djq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333276; c=relaxed/simple;
	bh=UIXp/sGXuLKRINEvgyEHx7Gzfpv6ZaJ1YnMeey6+Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjiF/otZVjI0eBtIOQKl8vfRajxuAYElQU5QkWmmigkiDm+ev1aLlFsfoxUlAiiI6J0CWqTx2xNu+gCpHR6oiAwNvL2tRXq+FIE+pbcQ3QtfyfNGThetl6dAVB4VO/u1atdbpRj2CgmdLvhLKr/m7bBmZKRsJ2kCu8/UIfN2T6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMLlm0sP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt1XosU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMLlm0sP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt1XosU1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6Om1p2651713
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=; b=bMLlm0sPF3Xf5EJw
	0zmffa5AxDTQ6BMQu0NptUkSXA8IBU1kwUpTiHi2l7Kr5u4JMjo/znlBAnTzG8AJ
	o07x2uqXw2EVig+e2uhU9+d8V/4/ZcG6lzHbLVVTXg4W4kCBjVOtuHmmpoOEhjbS
	LbGOgBVuskYHcAsyifAmTxR53eleoua08AxJASv1qxHqmGDhcsTlh6cAW6Y8eG9p
	GZEYdxsFoa/MhmYNEHz0GIi0LUPaiF+XbGk13EFBe9lQ4HFYNat6/Gh7xmqPQsDi
	RT1B1bcFLq19NF2pgK9U7Rv/mUMPN6YsUG9scrOITtXAjOqIR8L++MDee0NC+9hX
	M/INQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfugsp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:54:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so44586545ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776333274; x=1776938074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=Vt1XosU12SCLp8MbC49qs904R/TEHXtZEWZ50Lj3CyR+g712TXzSX1TNu1YM7hDZUq
         O08kzdkvDUL0zsn+tnp+wpaVZMUORdMJdO8YjeDfL2yZ7ZjyeHJsdtLh+cjwYfj4ra1t
         frkQ9gGK6QvNULsETY96aTk9xPc0/2JR2x5VEDzeo0q0V/Vczg9EE/RAlQmzBx3gQCQI
         v/4Cv2kNAENKicWZhvblW54THQ10UN0SzfRIlH/gLchRpZw1+eywDGtxxlt4H4A1CGFb
         pbj2gU1+qVpoeGO2WfyTAACkeWC90QeCBDqytxR6V/e6zaNY3eAo2DyBvrH1K4z1b3AW
         YCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333274; x=1776938074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=WuplciX2SS++VnKZ7C6R0hJFXmO85G182xUhdl0qITR1QU2lve6o4rrHIEqpmsriVw
         YKKgoOZoADrzAKKaWiEeQE9uPrKFbPISuaEuOq5ZjZ6fSgxtVn3s7fRRW+KI0XOH6tQ9
         F7HYhUwHMIyM5uj3J9lZjOhKf6SMnRCKmpPDgkPTLxoNYc5DvcpbrCkJBGWjd95x9f45
         alkTMoc+8hBFU4vlUXCqwidGwyytGVNLgu5X7TkFK/x3a/DaGBse3qYTL9lZcAx/rRQi
         qSjhmjXmWYehx1FmIgHEmLxyyYtmWuYisPOVISbvv6BiOHEaDky0p4T1wPgF1OFzcIs4
         dukA==
X-Forwarded-Encrypted: i=1; AFNElJ94J2BARdjr9n2trLu31dgrbVSYh4z62bHkCfsB0kk32CyxfKfjq5Q7xxS6O6uVWeA6RVIaVFXNmVFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7YtMFD8RiEeZhqGjoRqGNUpELUVcfdpq8+IxpnHKdkcu9cGy
	Svwz387UvM7GXd52J2y3hVdyf+NiHVUMlLJNGRClqyg4+t/EzSi1RJ2aGOyaVtQCSydsQXVp062
	ksxBPm03eJF8Z5Etq8JTShclwS8Pl13PoLAeoXMrS4tFdvGjqAYWMFGT0S67pZ3l0
X-Gm-Gg: AeBDietZYovgl++Ta1+uFmeMe4q136mVfTZ+uySOG51yt/zkYL5Wt1UULX3frgGwP3N
	ni9q+r4TnQuJLzXFsqv77GzF9YTJfp4pp6EW4D9DtMpW3PWVLSl9+i1XwewNWeBCMsRgVslGOL9
	D2LAeCasYcz7TTN4/L9jw66HdMHeYfyAOtQMgVR22yVShXNZobNFdMoB+G4334USUy+F8Jd/wYp
	sY/HQtrj1z7sfZhP/29ANZjufib+mc4yrVFksxPITJEiHponuarAGXZWZh6pUprMjaUXQa+SueV
	L0HM/rCYq9hovKtWy3KzSbzx9baXOQhsjqIuWZ3sb1IgKa9k1+nYer9QmdXV+TXd0v1ZLmxI6H8
	Qx1uMVo0UxyF31xVMSYCgEgciGZiA7Ip8ftn86waEf4P5p3FsBV7tzs7r/MXDrLNYfA==
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420345ad.31.1776333274320;
        Thu, 16 Apr 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420065ad.31.1776333273837;
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e23dsm60434955ad.39.2026.04.16.02.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Message-ID: <6928a3ed-00ac-4e86-b5c9-c3b27f3027e2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:24:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WcbJ4L0ro5jSxb-YugSDeRMRcNwUqPrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MiBTYWx0ZWRfX1FCYjp7j2+v7
 BgCG5C+FZ+JGdwpVU3YWVmN0WoYslZgWktvIACaa/UYpRU04dwQ8KgDuxk0aPVBIdn/VLi7gn0m
 RJPsqWAaOpHaR7tZukg5y84aWeoS6PZkSTClIGpwoapnKsW9wdmpqV+qZdJ5rm9ttKSf5+d99tS
 CvTbnJnCVs7V2Ypf1b6MJIr3NhmSojhD4vVSCsTx3I4CpsNlli3n/gDMyiJlPqmMxpFOJQC+mTa
 cNyjHuPgc5Uv5DXUBjl26LeWmVvOHxr3nwcPQfHe/Wjxw5/ZfjQl05hdXqqvxbT5w2c36w/vdn3
 i4tP8d+nkmVm0BF5Cg2oagbvuGaqrDsdtUejHwxk1jmPG3UurHbtzkgvUymLIpUqPSlHaF3Jcmn
 pEF7CeZUPdzLWC8yE5WcKJnPE+Dkx5oPxal/Ky2ss3N2UG15EK1N8ydogfm9vFQ1mDo0/++oIig
 qypJrP2CbRqakhZZCcg==
X-Proofpoint-GUID: WcbJ4L0ro5jSxb-YugSDeRMRcNwUqPrC
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0b1da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=wHg0G52u6mwEmVL3RUcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160092


On 4/16/2026 3:05 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 07:03:19PM +0530, Kathiravan Thirumoorthy wrote:
>> +		xo_board: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> Labels should be lowercase.

Ack.

>
> Best regards,
> Krzysztof
>
