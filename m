Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0848CFC
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917936; cv=none; b=Bl5MaBZO6ai3JFCZ61sA9iw7JLIgp/t2xrmy+KGdfIVanCxSMpb/hc591AIcom0ixKI9VwAiLC2M//9ttdZMJ/IXdxy3VKx9EPeyW0Wme1ygaE+T02s46UOu4XocVai1MfpfAaibOS2sBR6CJjzUqj+XSekx1l8qdf9EJb47cYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917936; c=relaxed/simple;
	bh=O6qUX52tUJ3KEapFZVbL0RG35dX6gQjsnyPhWLm+Oz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKi1e0oittvO6S+3vRVOu1XVsUuIS82IwLdkoRQD/C4S5uL01qpZtxKvUb8vdhhI13mKdX7GHomGQa+q3VxEvx3KGMqKs837JxzVpZ6u5lwDigfmZY2G29ns3rqrjOn/DEeoYJzNLFQGCOb5ShOtjuaH5e7ggwiUKuuof/fbiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4MYeOhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVMwKYLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4MYeOhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVMwKYLe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B46SjI2624912
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwToZBYkR9ugFc+4CpkXl4SR
	RQEJGXYdhdsY0zhrdgo=; b=p4MYeOhlEu094PV906M5hgHhGoJCcglfWUrYBh98
	Eaapc06kA2VjXP+E/oHAzMOvbT1RsPl/ZcD4k+6zlLOcGF5k37xDGhRmwQghd3Ak
	+PHt7SAYAC2LRv/rzhBFVC2NCccZGyO071IgNp1GWhdViU7/Uo1bzClnB9YEqyku
	3j739cQifmR2x/sALjdEjPuO1k+o29B4eFZtXq1kstGd4cVxCscOgnkwJE7cRWCi
	YVlh1wOx2GK1OUIFG5VbcplZKoDjLMTHlLDeRK6GQCfFND7KgC/WLGHe2Wl/ZDlP
	PqDNiXGgBUwCF6ZsBgGFkvP5AnqCDYsUy+W1TYTePbdG5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyyrv3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:32:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56edc119c1eso2996670e0c.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917934; x=1776522734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwToZBYkR9ugFc+4CpkXl4SRRQEJGXYdhdsY0zhrdgo=;
        b=cVMwKYLeYsSXytzpNegSswJjUB4DhSAs959Aj3Rw9jQaM+7IF41Yxz+PYvyepxYI8X
         l+ETHpo+YeQ+d1Z8fGpxd2PA3tt7nq7oz3VJQlypA7+EDRrqyzolmiSAUPN1Pb4zf25T
         mg9SV9L1T/uMVKbTsXeI8TcvlptnmXnfufVAJG88lGzlORhDEYBJPT8maGcSUSrO55L/
         WFRhlY90NOjlvoW9BS5Lfd3fNSKeyrHgpoDsD4dyWwsQe9gtO1BPHf/yhzgIrEcQsV/P
         kSUkGHbH+0jpY3ReLYZdckC1244GYxY8RUEi3wYjYQTSyO2l8MI57XcLWgNmPHky+7zs
         +vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917934; x=1776522734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwToZBYkR9ugFc+4CpkXl4SRRQEJGXYdhdsY0zhrdgo=;
        b=UNxrzqWBcjOvk5vsPDdA9eUPLM1D9PHiaNvB9UZisYypVwDZ4teAzJfEbj1C7xZglx
         J+lThbM4DDuX1i7qFO0sb1UnSwJLkwTYBjfP/cMqf5NzHSnB2ZY8po2mqo79HS9nmS+W
         64YOkAFn+B9rEWGo0awzO8kRqq0eUdBkQg66Ke3UhAeWZU3AMp3vjGjh46jmY+7RpZZu
         +dRQmYZDvmlAuNvhfSgvujL8XjiOSaqty3byIoytuKqNiRGO7haNqkJdrRNDrGnFoDGG
         4u2Gl5G9CVPbrE1igQuYQ7umCEaFstZu5olpfPNot+qZz1Fyk4hk1WtXB673rzY7wzqP
         7wrA==
X-Forwarded-Encrypted: i=1; AJvYcCWMl7J6qwFG0q4PuvolWtiDrGhCfMrXyRm5dGFHr8LL1798fMA821lpeEHi77ZrtSEIX/gk6rFf/87e@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQ/pserVTn2TUEDCKvKVXlmrhfNsIjNRr3xsEqldLDkuXZcsN
	l/KKQbjAc4T65BxLxf9YlZB9rhnooQ+HWyQ42HdYZ8BeR+uLMvg5l2H9P8fC08xeQuPln3TOQY7
	PIc+1L7Yo8Tw1APXc2XrFwj9L6E6PsT574Hqyd4mu4p2C1CX084wwtcYYdVX1MVg4
X-Gm-Gg: AeBDieufb0bu8D5e9fUe61LUJJ/iuPZN8vt4dxvFVEg+HggCA2JoMxexn7sRF2tZGE6
	+rietfqdxCnabA50HPQ84DjY5V29TFhHXLBMi7OUrV1cjzR3Dev4feQ0vJasf8Szr8Az2EXeRVS
	gJ0FHVFNBE693h9AZbZqJ+6KNyrFTStokRTFKlrL9EM7o4E65wYVxjCEaBQuyW1IH/zV0Gv9vOT
	uFgQSoYwO3n4fiLVoMU+7xKGmVpff64tDLi+JLKRQ55s/Nia/nUJp1BAYj03IE7F152GiUV2F1N
	t4tKGl/nhYgOXY5X/VlO5UU0hhQ3xxB8hnyq/AhGia/OoG/3i6cN6iLikn9xXznmpIu/F1Z+f0F
	S659n7yaGmQ3mSYGFSMf8VSjxF1gEHCasxb3P4ARrk3OLnkcsEZ/4ORVIR608xUprtzG0gXlXA7
	V0hOOltSUgddNkdsc9vPgwBHljU2VLsVJtT9s=
X-Received: by 2002:a05:6102:6a94:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-60a007339b0mr3081280137.16.1775917933584;
        Sat, 11 Apr 2026 07:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6a94:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-60a007339b0mr3081222137.16.1775917933192;
        Sat, 11 Apr 2026 07:32:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef06635sm1485923e87.77.2026.04.11.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:32:11 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: EuornE6-jH1bQaRHv16_9QdP6DG7_Bv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyNCBTYWx0ZWRfXws14HKtYNtYI
 lJL6I33FrkZuJSAgWiR+YcrFrfhW45ZlM8US1A4d4TO+RLX/vQAIW9PS1zltD7q0PdDvjr/cZNP
 bSh7vgMUZ3GRHr0FLOZYTOUBqqwePIs2Iziz6JxTx/eAwU+RvsIKNzgp2OcwnsjDw+CnHW8CWiK
 eOWofos8oovX3wI/v+rneRJLGkF64jxLklngF5x3jPn0A+1gn5HUQKrBPlA65RAlQ3Z1pZd/0br
 79gw0m2HJKE9HgVTIrRu879wTUqf0/E4mPJsdccF9YlDQjqhq0ZXr+f7LZmN/JaMy57VJ2YPws7
 PYqnqGwJe3KdY6s62ow5VCqLX4oXtXmoeIKgbv1C6gyITztHpJzdf5wj9oqoFGQJ8QS1REWEW44
 NzwLBHHsrEvPV7UUzlah7yvsW7FkIOOxE/EvZsKfKmRUDWK+8T6n7wcDZSTQYvP2J2PQ8WlKcAJ
 WYaze5/8/fdE9Vwo1kA==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69da5b6e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TkIDJqtRBj-jA9Rtr9wA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: EuornE6-jH1bQaRHv16_9QdP6DG7_Bv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110124

On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> The PDC has multiple DRV regions, each sized 0x10000, where each region
> serves a specific client in the system. Linux only needs access to the

Nit: there are other OS than Linux. Would you rather point out that
other DRV regions are to be used by ... what?

> APSS DRV region, so the reg property should describe exactly one DRV
> region of size 0x10000.
> 
> The example was using 0x30000 (three DRV regions) which is incorrect.
> Fix it to use 0x10000 to match the single APSS DRV region that the
> driver actually maps, consistent with the DT fixes applied across all
> platforms in this series.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index f9321366cae4..786709f2d13e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -96,7 +96,7 @@ examples:
>  
>      pdc: interrupt-controller@b220000 {
>          compatible = "qcom,sdm845-pdc", "qcom,pdc";
> -        reg = <0xb220000 0x30000>;
> +        reg = <0xb220000 0x10000>;
>          qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>          #interrupt-cells = <2>;
>          interrupt-parent = <&intc>;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
