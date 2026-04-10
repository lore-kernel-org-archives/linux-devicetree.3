Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FE42C2360
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800011; cv=none; b=uQ3ljBELsjjNOw2OqYvlbCAJW8HVKAVPvsJThbJekUMDLPIvK2wiDFW0MQRSpRUOvi3ksEfqbJQXw9H6HYYYwFbE/xoSzaw0CML1loQj8CoyghV6JebhMhUmNvViuNVphPAGsvgvKVJT7vx/sz2yfYjD21K6fJVB5HmbompD6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800011; c=relaxed/simple;
	bh=fVzL+sSlRd/KUXDLXjHDnh2hdZ+3zOivohmQPs8xrBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMohoo7QyDo9InljhBDrzjBB1cOnf4u9b11hctcFItiemnkrGvkB/tYqTL3LHSV5WjQBlVm2g/ZJ5sQpPv4qHdZtx5tJL8vRC25BisQtnjyEbEAIDKOHwUPT+RiLjEMZVJeiNOuB8NNCrwkntooNq0qptaOcmOSckYLHMTwNFRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fW7Yvbv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnZdc7/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fW7Yvbv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnZdc7/E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KQfGt1729916
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=fW7Yvbv3HxYGOLVw
	G2nvFRqIJSayLL1KpAL4BDQiL0UzERgrY8ZutytnpNdpckuepgm7r+NiEMjCJ9PA
	NeO5UPKcX7WlqcaghjeEnGBuscga0ehBLsGvuAkAmMtg6P/dVlkrsB6BkPepEOG8
	M2rOR5lhdtNNr7CRMBufIMdQggx+sY9e34TAqGQZeDGuK7Ld1UiHMV0BPBzNBzbg
	Yf/U3ztKrj1CS+7b7Eohk7rogzCc3jCjbui9rTkEXMWjl49fHLZhHgFd/tDeCTpD
	djs5PayfXDDKMHmhUr5Wv6LioMl5WTCXlwpB/CltScmEqVYNz556xA1GdGcg2loH
	z8L45w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxjun5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 05:46:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso3550649a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775800009; x=1776404809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=ZnZdc7/E2/ji73pPliptNhTBJgxTWX0nvX1uzNw/T+xyvx0/hSja2qgOrhZTFRvLvp
         BQ9RdFQiodmQLmgmkCa7XNxy5+6JQpJEUZWvqE5firv+nCyMC+5ptzqrvozr014JRhuK
         uJk/06W+CfVx5hulZMitCyu5Bap+JQK2FdjNeVPuw4RACAV7rH21076fwc7yj3/h6Htc
         NDCludImtElOktnHVdNxJiCz5sc8GXrNvdHp/f4U3yNPLOVOXMqfFUyBpMYXRYhIhkem
         RtH8wdjOntA74BMgn7UBs7rJOBUHZRmEh78WDvdA0wedIlKlZjc9IS+5VgckaUBtM+4M
         dNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800009; x=1776404809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=Xahv6PQLmc+6fz+k2NVA0eYgyJtR54TMOVXLaFF06Lxlkh9KtYNs6PKcGdAYAb1OjS
         a+ZWioB1uFGVlHy9Y499GkXZa463L4gMZsADDdNVGqE89pfEWG/lPtOCyaxiBL2DOuke
         WZYR9rSWX59hKYiW0dmcFGvooH9U0mQBglbbVVOcFQLLI1ai77EYdWL9V8SZlV/HNIQY
         ZHInF85huiyifqAkvbC3nMtonSQxyWGsye+N6FUuYfcutNl5YCx8hTIPSGFFcj956W1Q
         TwfEJesJG2318sF1SsoweEiWN3Q3lkx/JziBWkAKJnN/uNo/MwEvGgQaJfRfAx7dcbzb
         yY2g==
X-Forwarded-Encrypted: i=1; AJvYcCULM3X7B2z2+tK+gKFVwuyV+QyV6dCZGN0S+Rd3cNFvokdkbIybUtYVh4Ls4O126c8W4aHaYHc4Y6H3@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgYoooo9rJ6EDpuIsR0NMi+QVUihd586bK750EUHncajKyVSf
	J3sKIr2DPKgkNXPknIkGDxBWLoF1gMaMWm+gzneeNs1k4bP7i7I2XX383rHaNFod5iKUt8KWyfH
	ivDs/RYprEKLRHcEqr7VyAqgk4u588zA7zYoLWZB2mSZGg3SNp2GKAkhxGBpdBEdZ
X-Gm-Gg: AeBDievGQezp0jZQjgOpnkZOxM5O8BjAUxniP/w2Qsz1Ay+BPRGBqY8HTM8IpXCxfOQ
	Ilqy7YA1HdRasJdAAMJXQPpdB5Nw5HJeopfUF0GGtapn8bY/GxaWsUwJ9DR6L9bprk3vVc09SU1
	ONEMCsp3Eq8D9bdVYnAvlwAnEKJ+zAveznPRxiIq0Vmx4FsFYCIb/IafJkHZhnBvCLQokbm9AqO
	pSomlXIvnptbk6ceoj5EBvgN5+F/o51V6pEYjhbVePDq52CygiWv5HPzERV13Gw2ajBmLCKeL2Y
	UWZLzIorT1MisqbgTAMClIKRd59hIWelVMrE7mHJBjM+eov08tiBDxsC9YVVIu6uY3xbtSfZc05
	U/OK9OMhd0/c/+I+KNjq0ePNBJcROwxoeWTvFRSO+9QAEDlP9HQ==
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026756a91.24.1775800008945;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026730a91.24.1775800008479;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e16930sm14363155ad.36.2026.04.09.22.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Message-ID: <7c244d02-ebef-4a75-b1b2-f55f8ce7c8dc@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:16:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
 <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BdZSTrPsG1-0aOXEqTDK_iu4A55w6MN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MSBTYWx0ZWRfX4eRY9WuUcrUz
 A6IscKD52ZBm05xKzYuV7UAJBmvw4uGF0KZtZrl60mP0poTOLkdHkEwe3qiZR3nN3YX/ZBmCjre
 jKZ16gdwv2bonwE+LcKtotZPcagVQJXrfOrMSf+78llW74RVaDi1ck724W8KMkKS2qTPnhKgb1U
 P5QMyQv0nvWo8XGdeXl/kpdXhFHUmpvwH6yNP4PrbLQpLD3QIc4EC0fzErV/h5YSsUG3yQisHqq
 x7T9KsytmpcDXX5lI/BZNdcmB7muMriULnVvMe5RiADHlq9TEZImMfkVLyxucXjFckiLnhDHHq5
 raQA8AoAZWQVXfabr7t8fnXTjuGdPtGS4EGoMKBDpOfY7VvEie8O2p2Ocv2jCyX9reZE2W4bI2I
 Yi1yx/Dzj16VGpoaSQm6FMA3i52Ze3q5riB59mmOWUBiPO6++D3cWNuznudjUrgIjaaArY1TUXE
 qjXCCWJsO/IsWP6tYaA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d88ec9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xLwlGchuUDJACbqrD4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BdZSTrPsG1-0aOXEqTDK_iu4A55w6MN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100051



On 4/10/2026 10:18 AM, Jie Gan wrote:
>> +    depends on ARM64 || COMPILE_TEST
>> +    select CLK_GLYMUR_GCC
> 
> Hi,
> 
> My bot found a [BUG] here, please ignore it if it's a false positive issue.
> 
> CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC
> 
> - select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
> - On an Eliza system, gcc-glymur.c will never probe (no matching DTS
> node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available
> to videocc
> - The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to
> resolve at runtime
> - The correct fix is select CLK_ELIZA_GCC, consistent with all other
> Eliza clock controllers
> 

Thanks, Jie for pointing out, will fix this.

GCC of ELIZA is already 'y' and Video driver probes as this
GCC_VIDEO_AHB_CLK is kept enabled/critical.

Please find the 'clk_summary' from device.

       bi-tcxo-div2-clk              1       1        0        19200000
  0          0     50000      Y         deviceless
no_connection_id
          video_cc_xo_clk_src        0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0_shift_clk 0       0        0        19200000
  0          0     50000      N               deviceless
     no_connection_id
             video_cc_mvs0c_shift_clk 0       0        0        19200000
   0          0     50000      N               deviceless
      no_connection_id
          video_cc_pll0              0       0        0        576000000
  0          0     50000      N            deviceless
  no_connection_id
          video_cc_mvs0_clk_src      0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0c_div2_div_clk_src 0       0        0
9600000     0          0     50000      Y               deviceless
               no_connection_id
                video_cc_mvs0c_clk   0       0        0        9600000
  0          0     50000      N                  deviceless
        no_connection_id
             video_cc_mvs0_div_clk_src 0       0        0        6400000
    0          0     50000      Y               deviceless
       no_connection_id
                video_cc_mvs0_clk    0       0        0        6400000
  0          0     50000      N                  deviceless
        no_connection_id
          video_cc_ahb_clk_src       0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id



-- 
Thanks,
Taniya Das

