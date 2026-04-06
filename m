Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C538C430
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503689; cv=none; b=ukgJHKETjczNUFRCkKSR6eTjjSx7Rz4pYRGRiwloeSjJ1AxM+Phr4prxNKs9Ia7FO+IivIHOTAg8h8XlEp9HtYVmCwctnogtow3Us+Esgan5e/z3GzxnedEmJivwmB05bRjDau1xA0+GoS6eyi+BWIITK5uqlx5X+6eZVrMtMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503689; c=relaxed/simple;
	bh=Zv6fes1kojIHKKKul38nWbUFu2oxWmXjxpCtEeUOdz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxtWLHsGPEkuqIzcTsMwgpKr8EqE1VKtbfx/bHZzo8lXf07Jt61a50rGCGqCv7ueObayaruDvwViW02Rpm1cMpjAMiyT6EVZNx6Gn26DONqSAWbISVjGyeVOSSkWP3Wmjz+A0OzvQGsjQnpWehjjwK+S4++GvI55xWHXHc2ro1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggT9tsLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dib/LRtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggT9tsLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dib/LRtx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IflWd1058167
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xEB4rg1IxEHx8EOuLUHNP1KV
	6Y7uV2T4GkkjH/HTEnk=; b=ggT9tsLGxGqHhS3laSsbYxAkcda4aKstQvCcAg0t
	GOszp2Nlu+nEUeiBp9YuGEeyo1K9vuSQsKdXTdKLmEhv1pl/ny90BqqNpPlCNYLL
	7hyaSB25GH8J5AypsXbG8C3qkBjhVJZ7BKoriZ0RUf9NjzmONnyJfr/eAJkLk1Sp
	SGPW/CwEi39PtitxQofLC4zb1+6hCIICmZH4DO/JZ7EqlaFqBbzqKexEk2vS9/DH
	cLuGNAMkkntBpt10c924TNxQgJpJO6AGir+uJf+UIpzvG30f+5+3YWrEHLg6EBeM
	PxkNCFmwqhx7SnY5T62wIX5ISRAzxcUIPzzJsq7wVal0dw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf3r0vh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:28:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so45856121cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503686; x=1776108486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEB4rg1IxEHx8EOuLUHNP1KV6Y7uV2T4GkkjH/HTEnk=;
        b=Dib/LRtxSSrKT3Kq2WmiJAvcT0wSKE/wgUKEsN70jb88cFq1EMIaNU9X4wj8KNs1wC
         YCyyeHTLPgOMRoDZun1UNXiIhf1A7gDiPBdf/GR85kOlAXiGx57ZEwlWq7oHE9r6K8uE
         kNLQqyTOSLp45Cr3rhyu1izoPbud1895WOBCrjDnqTk/lw/O7rrQrmUI14U0fE70dCy6
         mNMbuAMdZF7zvIjmhMNa9moT5/yxa28o2RHPKSDWh9qZpPfS11I4d1TbuZJ0RK2Dsq+j
         0N0sFlE9PvSXqHUNo5cfakQem1DuB9hU34yeM0bUkxGerWIJsI/U7AV1+MF/q7shwvQN
         Ffrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503686; x=1776108486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEB4rg1IxEHx8EOuLUHNP1KV6Y7uV2T4GkkjH/HTEnk=;
        b=jncXnGesLx50I0j7Xhm2e9plNYunA3p/YDwYgW+E5oIBHEg9gk3JvJ6bQL814LJWO0
         lsco81mmD9yO/Yk+P+D5qlyKkBurqcZQjozgnbTJeUTdAIGYoToALkJQXFQkGbNW8CIX
         WeZPGTRWa4Mh/rJQVfDTyKqIXVFLVptC0GgrPGyubvnGdDxcS1aFdqe4wEpQPwIsRP4P
         7sRQ6919sOcKWwiCGF3+gajvgniqHWCBWZREF0tmQtMAMjv+yHVIu6ltAqj3HNjw1ZUE
         vxeNKTUqjuOJ1xIiQBuX0BC7n8tZ0Tb+jSXVDO9Ju2dHCwJiYWuaa2149Bo15eBPy9U1
         EyZA==
X-Forwarded-Encrypted: i=1; AJvYcCU2KAFkPAAxuMdfB8cXU+RwwPiQ/XYJCTCt3s0w4XTdEyPaWfpwPyvqvm/VvKXgMWYoKMbCyvkhYVt5@vger.kernel.org
X-Gm-Message-State: AOJu0YxpEgzzPHMroucZYqa5qtfIhPScHPVKSX/HFBCE2piIbZcRETnt
	csMNkOfBqob7SxOdnW3E2IqR3A87BVt5iqQb6oONwtH7HoJMmxS/9y0+wHexVSOfW5ExiTe3Krg
	jT94dd4V5AZpqKpl724lGgqa9+MxgTVa/EBT9twgDXQZzL3FTpmMdp9l3UfvmIqDE
X-Gm-Gg: AeBDietM4iZut4qJlIbMFi81NpFEdExjbTGKHbBgGUqnQBT5BpKAeLgbic2/bC+WCGv
	U1c7swnBS2JW+EH6qsMgJDxZmSdplbWn/uxD8BeVXza3efkEQJz3MS0B2lukeaOFfIKaOFOz1uT
	iQ2XgZ/lYRKUcHCwvuOs+wtf8uPY0d56+du1jt3g2s0DaqqwbPgFlrTuPEFaIEWkXT2gOhtvLE4
	sh8krhXWQVologdc9ohx9FB38+poviIdM2iOqOYB1QC8dNnStXJYQaUyZ9zhJvJdRTdR8ppBizt
	eSQmWEwEKQu4CiWOjk+WFLFvdRe95SYciIpMbfIER/FBp6woXqHKTtcpqgqpGRxLHXVgCEnRdC1
	jmPKcXj4Ost9PFoY0NRXqBOLBWY8DOp97ZZLfVt6lPWqZkkhPFLUCy7Ochb+TdmQwzgm8V0HSg4
	sYeuzESvON1IxneofumPPHMz1l1V0NMeZb1Zs=
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr36248461cf.4.1775503686331;
        Mon, 06 Apr 2026 12:28:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr36248041cf.4.1775503685751;
        Mon, 06 Apr 2026 12:28:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95288sm3628908e87.14.2026.04.06.12.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:28:03 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:28:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <3hvkfg5en2bxlljcryd2qkpunhbxdc5m4ish2j3xkbq2txha3k@v7ipzvhery4g>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FAuc8us7ckvVfUq6hFC3TI2VvSngB-aD
X-Authority-Analysis: v=2.4 cv=Us9u9uwB c=1 sm=1 tr=0 ts=69d40947 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YTqrmQZhOYAkcZPAGwYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfX2WIEYXESqOlf
 67VUPTz7GjJ/jUjTOzK/gL1xq+rdstT5BrCeBsTjl/dnOuKdlrGEteJF8WN29B4/9R9GXhqQ+fX
 HngNzbj9aK0eLDurEBxb14aWdb9USvK8MxHKe4EQh3H/UzTixIAVEFjt3tkmWxjskQLq53p8eGS
 n8cGOsSA+2ZykcfVsZ5+v0xikMaVpO+PxX2WVWR7jid64zsxWZtZ60tLp1dTB6MvHkrDiSoSLRO
 QzNY2CAkGrpsNzfOzzRTlL3P0ZNuDlDSLnN2I33nPd4VVNZ7t4SesMGp0Pg0NMV8s/UIi8zxoW5
 sODpI7b89TiW2Jket4jQy0ANqRlIOSypdTr6JoSzSeMJq8nsVqlVMDgNwnCqys9/6VHUIjlc3Rw
 6/XShAL/tLAOAaMT+GcT9cPdQPKOwuyR6LSI6wEa5txFWUqY67kMAJQ3jAR3UBdq4RKXSaL63Yy
 1tEAy2SvPUTYdfzPGzA==
X-Proofpoint-GUID: FAuc8us7ckvVfUq6hFC3TI2VvSngB-aD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060191

On Mon, Apr 06, 2026 at 11:16:12PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
