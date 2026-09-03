Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAEA371D05
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427019; cv=none; b=UBIkrMM5u2jq7d1mo/XvTLku+SugcaXXieUfaMYW2Dkr3FuwsFmJqudgxhp/Wtdi5ikQqJxnpKz0o3pLq3k0Wlahd/AGa9wxm0/DGpgO2WnC/k3PtWk3+fDVC8f/uRhNX45CaFtOEMKh6CoEZI7qFC60y2VLg+EWnZ2bTXS7nOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427019; c=relaxed/simple;
	bh=7Zfs/6hhRgyw8fL1AnyWaQm3thDH1DSMxrgvQJFL5Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfrQWlctnKE4V1WbU0bkMbSr79+vFHOEoN/IEHWLnwC7V4TL1bcvb0caiWpyFBVGxu1Lyhs7jCDL3ujPtV4JpfRcgVk/J0skyJ5V6C1o14NF1ALyT33C0I+fRsQWmADZq774RLzWyT6cfa/fOrBAIPgb6ADsRumuY6VbiJ3FJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUVB0c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anjLQgQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUVB0c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anjLQgQO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392DIS3612605
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=; b=oEUVB0c59HzMRCH6
	nzPTrI34Mxo4NgolgRlnmjgd3cauFHGhBQBbex4wnBC6TavADg1LgHYBRAn0v5dv
	9wX4VJur39fJlZu5Z/x6vKDmpaalTNtaxSWf4tJwTUSwE/i/VQzJu4GKZmzOFGDT
	adPZjVro0kvaL2xhmVaN3nbkeC6vc1bFcnlnjT9Lm/EW0hPWXk2W6fMr1K+2XrJ6
	4uy0v8ABbs3gvyNzKO8ZmYyj9oAzBvcPE+84b5TyP2YxrPcxOaEkyT5AHFVg0EP1
	aI6vCZx20bqOsCtjjfns/FuD/Bg2SZN515CFx2tcAFoa8aWj9NhYxkI7Zr1wphn+
	nZGnfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdr441-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:16:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso46280385a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427016; x=1789031816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=anjLQgQO9m0juUZ0ca7QmWlQJmzg2rz+0mWSTtlde+Z/zlUCK5AhPX/Uq0CAObJ/SO
         Gk5ykmjZ3y4zWgGPVmD39np2Kc3oIpLQr9pHIIv5TRYQ1hVUiiBNCBzsO2yugXGvfUQd
         JOFUjNxUFhV+1FkkWvKBF1dFnOxb/O0WYVr9uoeAmLWwT5BRXkhuUEBYfS4kLd11T6AV
         WwBIhKI/6/zWkMWz1f3+uoYEPRNoyAjHpghB7T2U6ZJDMxmrh2F8SSAmjJt6AoOAPlHg
         nt2/xyqLOADCZ7bV0Q/30w4UWPuyuoGINUw8viwXPs9Pv/53CLmSw5xFrxkixq87d7ho
         mSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427016; x=1789031816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=MZQUHUnyLpFQPbXlDIS8JJk6w22vOU52le9a9/JDsnEydci7L358UpdS3RaAgo0gbN
         1OlIaFYEGyX1DsNA3z3YGcjJo51zEAhKmRxaAefD4vCQ4wgMmj/2Ozv3Q/TTQVgCaH/T
         CMbHHYLGKLbrsW4Fn7HtQSh6oneE9Ei1xBajhE3JijbYGdKs46XseyhoodEXa+UhuD/L
         m10Z4au2fb4yFU0pnCTVaqXj7QiWJATrdG8+WVL8vppGuUFK3NsqSaZI/dAf7eXAR9rh
         nQEKRUOswsGkrHReKlI942QGlkEWWTRDUOWpUrSp7kqk32TqqNvSiy22YVaZxXrbQ7bm
         O4iw==
X-Forwarded-Encrypted: i=1; AKwUvBzgq7bGS/5TDokMtc4IdUDccX91+T0J9F7hjIkTHIJbhVWPHU9lbO7TSBme69F0zBQsKgll8cu7GM/S@vger.kernel.org
X-Gm-Message-State: AFuF++lx1TiKYxt1IgJAmAdHlR5k5kOvuPjH6Qlhh6gw2SDYC3Eio9AC
	dUkddANyIctwZAqDR9O1dyZkxocNR31roo9UHAbypu6QoXByjTDGDh7JbCDRfc6kEksdySr+Ezn
	UhjXvoaA6X74jw6asGcnV5GA6KwR8OPvrlVU6BWM4vYQvkqjCknxQu+8voc8HgqOA
X-Gm-Gg: AYBFou32OiHRV6tmRPAcpudZvOJAWHdAimR8pTBYfss2ftdwqqXV6OMbiMK9p62VknD
	xSX4g00m0A18bQPwCuWDyVscVD7xrLzVkOBzKx/in7x1Kqks6jIRCOW/lh5CNhhqdrOBRQZ71Vx
	OHwQRbj+sb7D5+Viyw1CIaOMlj6gVirl0LAGbtV3Y7aca/77kLTHGc63IO5QDZumA7WW28Hnx2T
	rsh38QLtwEDafwccB+ee9rF9/df/+631H2Vu/DnJeEQ9yB4nKZRdR5BDPjDRgnlqbpXyN7HX32m
	+SGVVXIXoaVK5J5Vw+QA7uiYUeiNN0iNPF0/A54v2PRbT5qizCxG5lpZDvlnM+lfcDQcet+Y0MS
	CFSol96SZ/u+G6Zg+TF9m1Q==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746529685a.6.1788427016582;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746526385a.6.1788427016118;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41e71a9sm72173866b.43.2026.09.03.02.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:55 -0700 (PDT)
Message-ID: <8fe5c6a8-5202-40ca-9d44-aec284a90042@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXwf8HYpwS7e1X
 IJJVhHJiTTmEfLswaJ7GHoZd0MjgbF4s6URjbFnLkSKttBovEFegR0d2rD266MGr4cYBRkZgOkc
 DzL3geqJEUdX6bFpcesQY0YP4oiUMHo=
X-Proofpoint-ORIG-GUID: TMcbzJtNA6uGRFChmi227Crhr3E8YSLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX4feFcihRDMi+
 WvMD7gtPZ5KjXfQJsqBp3zp6+JjyW3j8QGrW38fMMy2NqXZogOkqkP6hlTo8HnXeKugEq9isIbF
 c1hoc8K8BgisKSrEkbsSISjXTbHzsivu03z9V8sNhVYXGW1o6TLbHkUi8xwWTZtF4u4yBMBcCr4
 9i0t335gpHj1TdOrLtXk7kJVfCxdY5BKKnxmEMtXhFY0aDBlcrqe6nZPU8pWY0WB4mGXgbwVwIo
 AV0YpsvginZ0d8j9WBXz5WmFFnXw3LuLonrDsmLLL2gzNz7mD9wDoATsEZvODy7I1i5MS/RYEGT
 +3vCxg3cpdIu7R3R6qOECNkEelFpRXbkCdtb6W469pTvbGqb0tiQfkY/oq88QEDi3rfgohNwpNu
 zpHavT42YvlKs7q6WWVGCS0QNmpfn2K6BFw0ZceGt1KlxIi86aE2UXKapin4rZhqJqKoBycKUX0
 9fQpjwGzvUV9TOo71dw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a993b09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LvqhzNTnz3AqRsj0EdkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TMcbzJtNA6uGRFChmi227Crhr3E8YSLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
