Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD144C659
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152188; cv=none; b=jHqZvHET8xv/yPA7/TZJVuVJ3hdCr4T2UVmgBtHwrupauwqn3JPXjpoDi6vEqv9sboibUKPoZHmsFHoRdXXmLLAhjGXYr8rodyMOLPX7Xyy9r4ZSKqbingrURa2VcabwWbX1VDpKjIoB7PvopIIUrycs5s/rpo4oJkV0XpXZH/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152188; c=relaxed/simple;
	bh=SAhkw0bfytYb3FTzJCRNYTSW5l51qXJupqJ4BUIGy0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INUS5tSmDR8fESewnW3jzo29QkYrJ7fsf5SxXwGcJW/7V63Ve1VtIY58MTTwyUcQ6DxrNhqV/LHfNjXeD3ohE2oobwA/V9x5rFY2bpaAFulYHv5zmnEjyCdn78JHzYCRKnw9Yh9wZaYE5/HRxDH2fbY7Q/jsrM0q0q8Nqx3lVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uen1aJ0O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMWl6Wy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uen1aJ0O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMWl6Wy1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2YB51173969
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=; b=Uen1aJ0ObHuv95vH
	nKpb36NuX8aPsUtRDk2iygHYI+5ff5FLf3pkwRH4mH9rBJ5T4oHpnmhtPqRJyrkC
	Z1O7mydR6KVlKwzXXz36B0ku6dxsZLHaJ3uvqLob7DpbVlfqGk9oq8aw6sC7aJVF
	/oorHTtJ2wck1RPkGlVeglJBIc+rOmkH+7WwRyfAIqvvebGyiW0K8OHl7GCihWO1
	63EJ8+3yHHROJYwpT8fXtZlRS/YvfcAH6jPfZ1VUOeZFa/6L+nJr8V303QHschhE
	2exTQLNuZSA82e/wpIwWyvjnDuXnw2FRw46rEARwuxOiAm9NNp8IlMrPKHFaXhmL
	ODj0Bg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj012r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1985601cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152184; x=1787756984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=;
        b=FMWl6Wy15mhBuclVanh1+iYbb2svAAEGHmDD+7kHtkZR4+MGz8LC4jcUmUrL6EXPhU
         tVC96pLbeWkFFBJRq5SM2XGqiWUyVLKKnNAQrHT3uuhS/canisodUFJIFFJah7FmuwcX
         cCrxEX0i5E4hK92rFUCzLTKBiPom8aSCR0UIJIRwyc6UzATPIXGvBuFnAUyZi7rD3A2a
         MDNJY6z+pUNdbzBRr6MIGN+F168ScVeKpAyIRCIMfQMKCIehasUSv3raBphQ6q57xTES
         xaqfVQSiD1bloAe4nd41MkpIaEIWv7/VBnu5KEhY+HhFGtTWaI6WrohkJHTPDdIhVRUU
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152184; x=1787756984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=;
        b=l0VKldRmA7Xg8Co2G1wP1Jyy101TVfM05v7ta79NRe07gta0wTZJPhgbMWR9DbeftE
         WCFO5a9RMRF622C/eZiwEJngJvb1cfXaPYX5C2Wiv5sz975ST86trHZRxXcvqgSAoVJ6
         TxBVqWvI7r1QMtS2ImFbWuq99wA39DOE+r2m0KEzWTZ0RT0eqoTvjQtNzR+ACiNyjx9e
         F5Ep1FYY58YAv/K6sS08PvIdSc9FbCaDN0BjM1sdzFMo8Gb2lvNdkm63GrajNabAkF53
         SWopQGYxSObtHOVLJWzddhQUk2VWCm0ZS6SaY7lnkr4fXO2+Qw1QULfnUh0UPjdaf6Mb
         igWw==
X-Forwarded-Encrypted: i=1; AHgh+RrxlL2ATM2y0h790bxBL1VuV9SjuwhGGHUivzMos9PpF/y2ACkRtOYVD71PkbzSTva0z4WU83XrvD8e@vger.kernel.org
X-Gm-Message-State: AOJu0Yydks+2ICn4HXpnS2S9sFgfg/+jtvAtSHZBDXm1jDzVpxMDC8KY
	TR4AxkGcw5qEOYWR/DygNv+r7ev2juxg8OuCQqqlpmub08DkJJs0lARF3hf3l+BHtB9dep6KAqe
	StPHU2McJrO7HZgtfYdHzCDcWQ7OfHWMEHQQVMorO5kEJskhccNEz/i+D65vivmfh
X-Gm-Gg: AR+sD123Im1GUHaz5Ty1dfx3nGZsG8sxxjzqUdhyoXIshDZU0IBqs/RdT/5DpzwEpBi
	0GT0i6iFjwjeeYdJ76Lk7BMSc55TNxV/YrohA1zk41iRg9daq53VqD5EnuYPqZa2/iGZnkczuLX
	5jywYjSg0nGmg0iS/2bBL8tUVDyznmfTEs3trDUzYZz2M6gSeWwo7Y45KFhlJP5XmQYyWtU11GU
	nQ1k+gmqV6De8Nw/BZnKY0bU/WHfcE1Wp0kiUCjN9cdpXgtYcLQcM1u9cYr/ssEMAXcam8y5QcC
	7fUsVgmWpP9ZhCQDaYDz8RQNDDe/7xxvU4sE5gFy1PMrXD+YAVXE+fcN3HMc5J22T9eBhmIYydC
	rUyInSE6Y/DQ2/SGdHV0pqajw
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr37247501cf.3.1787152184209;
        Wed, 19 Aug 2026 08:09:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr37246851cf.3.1787152183676;
        Wed, 19 Aug 2026 08:09:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a6be4sm93083466b.21.2026.08.19.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:09:42 -0700 (PDT)
Message-ID: <8e3fcba1-dc3c-42cc-808c-4f2e5b6ec7cf@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:09:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oF753A6PhaHbKaL6ocA0zfwJnSs3SQRs
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a85c739 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4PMlgOObqc5rzRHRgksA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXw5bCtbxQSUs3
 Tv9I1+U+/eeB0fqBP55qSZttz5OKSchxFKHzSbcscYJze1p2xlCFypih6pGlZ24fRH4LnGudJS5
 QebHLW+uLXVIHUzvolSPOO68MpLR4fLrt4BGD5XdAbwODPfbsJJqANGXmQZZZ28p8soLSD0wZqn
 q6rXof2N382cULV+tUUcl4UNHZBOMAgdNJDqkn0HHdO+65xm3eQBhTq0pUxvbwb54lXOoweHqCE
 qSAniUn8Nt3JqNs/Pz6xMGApR0DEdNNsy4kmyTAiPzA0lSSu0NRciy0LKHnef74HUk62GsFagQE
 HxZQ+2s71TxfNZOSLqbizY91ax88d5ciS7CCKpJuYV0EqvLWc5cg3mNgJrxO0TmZyk6lyuXMVaS
 oScRMtaJlIOm06UQNoGG/rgugSszXr0TJuDKeytQDmfPLExvxGMjaWnwuAb2Nw0zEYivgIDnE9E
 h0M58asEQ9bTzTHy4sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX9XhsN/RNSpfn
 2AjeJyKBKeCgX6oTmz6o1paYz0ZjRC8xDAu3GBTGNXkThaPVmm9qt/923XTYToCFfOMN5mawl7t
 uB4fznzmz545mB1qgjIW1AiSZ6B/Cz4=
X-Proofpoint-ORIG-GUID: oF753A6PhaHbKaL6ocA0zfwJnSs3SQRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 7/28/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 7-inch OLED touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
