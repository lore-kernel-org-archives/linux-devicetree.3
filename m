Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36C3FE66B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375618; cv=none; b=jBY/TIqszkOqWmHUi61QQO1bfmBY3710C1WZHIIXrCIhvhCR/kw1Co8ONPTTA7NQyyADIIfJWuNFVEB0fgZ5ums5H73gPvNfFqvvdTg2iNZoz8fCeM83geydRajyOOsVT2g9s5JugnFYHXUO6Xic6AcX/Gp7hW1tzJROaHou/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375618; c=relaxed/simple;
	bh=3Rn+857zkrDFLYBUrf5Cyzg71vtUa3pKPZfiKCJ66mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhrImJ+L2a9MM4XJaZ+uZ1ACIwtzGi231Clp3MqUJbdwaybaZxlYaKTzYY63YhX3y1ndtZvlCe2nmxYE7KtQSGwmz7Wn0Ff0ofEPxEhzTGrI/LVZ4/lUVLTnAqJbxE/vsWx7r5Ughc24KHUan/OpDvdQmhP+w4u24s2zZ4YzoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3xrjr7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apvDNU6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3xrjr7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apvDNU6H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhPvE818889
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03ou02At5F0k5bHCtPQ6XIG8
	n23e29Vm74dcPRA80+0=; b=C3xrjr7kklHd3+PzukV1xhRynVZHADOT5ayH+GAi
	0P7QzGCYFBC3S4LWZ2MMuPW2GYyxJ9GG8DG3mWV2U+gCn+7DhJDdPvTOMQaXuMFS
	GP1L5qs7091NAPSnqDLCNahCAN2kkaaPcFvrguzkdHXvplCwma54ZbJ8dS1ikwd7
	/PdyeHRqdklazf2e71sKULD5zwZob8NJ8QYCzoDwl2rXT+nFw4MCDz6K/a4CdKnE
	iHKN6EvK1l390wzCgcK4zbXloO65pcZcsmkUiSgiqyfhrzPhrFQ+2hafYRdtxRkG
	eBOBilAO+WAsld64foNrFF+pst8pdT3/MpVJPXDSx2FDug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud204sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:26:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso147990561cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375613; x=1777980413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03ou02At5F0k5bHCtPQ6XIG8n23e29Vm74dcPRA80+0=;
        b=apvDNU6HbB3Ag8vUtl7MbtoOJzyfCz9pzzzZgntKK6YIrcoHQHwZak50HIb/pFfwJw
         gyTjCGe4Rl/FghMs1ZkoGkgKqCxMhUk9viieJpBhD50affwWiUILDF2ajbdaYTFaOGQ8
         yk6ShVWCT2mVS8tfibYyRuFJl9NRgtbaru8LIQbTyo1z1IYoaxjUkr/W+/bd/9smOd26
         j4ISgOaNe4w5WmodRMn2GDEQhcoRO802Lr10lYl+ejosh+gNNxvJH+HX34yNkVf0yvE3
         jLzCS7oHulPm5sFRUci11vOAYzn1rC9ERYg1O4akUjrkAy/lhaRU9XqPad3mpbSPckln
         p1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375613; x=1777980413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03ou02At5F0k5bHCtPQ6XIG8n23e29Vm74dcPRA80+0=;
        b=Dab/7uNEpgkLnN5xvACr0zBp1YeJwYFt7K6y64j5k2/Usz5FiSv3wUywKsB24lwZUB
         f6O9d/VJYvraEbiD83l32Oggv2VWazIYGKuCQor+C+deMFORgYpryaG7Da2JZXaAbeU4
         vw/AChnWCpeAZ+0YLhUbt1DiJBlvynNqe/ePU/DS5tIo+Q5XuWQLcltPZcgz4+iN+wgD
         oJfcg3P7v5ALFZSvZ5vSVCAT6x27XrbmE2HxlCMUVl/Ao2gidNtEP4NoUZunM9MY5/YD
         0UuzoyB6cpVrGHJN2dKTzcu/akQYK7hC0y0Cvku/l0PJcwF9MfuobtwWuA1DdTp6vrUN
         McXw==
X-Forwarded-Encrypted: i=1; AFNElJ9RHe2iHxhZjseOI16qTJ5J3mf0niHV1tdAnWUy2cp87aD73j+Z8cUQa32yAw14VdGAPwlwXmotR+d1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64GnC/gxs9sD0AD4oV5wsX6YjF/LpjY3OamcGtyaWtF+ZjBeb
	3L8wILGE29ERbP9WPwjMj/FTcaJQof/INORaNeWr8plI5GNDyxoWSfWUs+VuVrjSVy2j2+PdDiE
	NrOfYdDrq1WjT0gncdRqCd6RrvIv++kfdMBaafRqRBtOwsQOPiBb3FTx7uuEv1rHO
X-Gm-Gg: AeBDieurn0nUU8YsNM6172XOMJcyxtTCe9orDsbey98yXYd5HCaKvN0EhTCIVf3PDuh
	fR1adh9QCvMVXpf+6jLJJjEghQ9nkm6Jtu9jYhWQhoKcC/NPi0te+33hze74FlZvbBDETQHJnLS
	fhAcvPW6MaxNuYDCNjwVYI3/8+CZVRdnyRyXHIs7T4y/JGt/0Tfkzbe+ozf7LdwBcFIsOIa9CYn
	6lcoE8aq6OiRUxyIAvPS87GOW0EbXrfAZOJ8VKYoUZQufQoWzKOdc2xHjDQa2YTFTmAYDX+zDYS
	qSC+qWvRA9CkM+L+Jc0UuEck5jlJ5JNCoKoxawtLUush6cS73P9SV0S4AzbUwGipeEpadcBaO2p
	SYiThUiTcJMfp/jWXiSXMZl/TL70yJybyXLr5zPHO6f2NCibsWuSFVJh/PtBiiUP2LszAXy7pKR
	tqkoWIey4ZULz96z9Q1HbkwZWzPF+NrTtvPCgfFSjoEtgaZQ==
X-Received: by 2002:a05:622a:653:b0:50b:38c1:c6a with SMTP id d75a77b69052e-5100e1256cbmr34995331cf.19.1777375613235;
        Tue, 28 Apr 2026 04:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:653:b0:50b:38c1:c6a with SMTP id d75a77b69052e-5100e1256cbmr34994721cf.19.1777375612542;
        Tue, 28 Apr 2026 04:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462cfef5sm550447e87.19.2026.04.28.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:26:51 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART
 node
Message-ID: <ejjbhgo7xtkyggd3vobthtvep24p55bzqzfyogg6iemon6onjp@wch5b5jsz2u5>
References: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0997e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KMwB8ELdjFECEPWHL98A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hQxD_BPnHDAm_R3vmYwH0lTtMxqJAZoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfXwHZLE/XsjltL
 1+d6mMuaaJ9SAXXNdHer6kz5jJZpoAuLKCvYpzp1xWBfvgYdbCmcWvgN6s/PXNJpLrUrYF+PBB/
 7AfjSQIvqAAmh5gkoVr5mx9FWZHoO4TUgigOCwMATszvmtiFYEwNDet+QwFIki82J8Jf1nnxtFn
 G4kMDfitasBVuBX/9HMrS07W2AZuLkcjUaAS7lL1JuoYJQ7T68B7Xx87ssdhbw4SH2DbhB+7o79
 SSiQq2ZGFKyZog3JrPob4lyvxYbHjMv7QHkx4G39dD8ZYNTeMTVkc50Q/nSaBRcWwA1NVBBZRQv
 fFlb+YsrG+zS/uqTXb+Wqfg37RqAAPO9gPZ+UbrBDpMqmc7GTXNC1phujkPgQfxH/yvJnekU7Gh
 kNeypbxKHZhNMkVBxkhA4TmJIcKtUv9CfkId8gJqKtqk3CrclLLX6mMtbrKwjYvAzlo5Ithdu6s
 FjfsfILuzQXYAhzfUtg==
X-Proofpoint-GUID: hQxD_BPnHDAm_R3vmYwH0lTtMxqJAZoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280103

On Tue, Apr 28, 2026 at 10:56:52AM +0800, Shuai Zhang wrote:
> enable bt on monac-arduino-monza
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4..092ca0b59 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial1 = &uart10;
>  	};
>  
>  	chosen {
> @@ -454,6 +455,16 @@ &uart7 {
>  	status = "okay";
>  };
>  
> +&uart10 {
> +	status = "okay";
> +	bluetooth: bluetooth {
> +		compatible = "qcom,qca2066-bt";

What powers on this BT device?

> +		max-speed = <3200000>;
> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
