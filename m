Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E0E39891E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581257; cv=none; b=TnEaQWAN202a35kNUGrsQu+Z58/n/B1fnzml/jsKeO1xipH8EA6jtmhpFh1IDDXKXmtYu41hQ0gNTKIndYlpV0CdMaFjvuln5zTZK8UdDYD/7VOyY0dkhrsAU8D4r6otdWLeoX+VrfflG9dkar6/G8sVB9PnseqUKnLrCPyR1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581257; c=relaxed/simple;
	bh=MSNGEhj8vYE9lSz0TKEjAT/qRyMqzPRzs6HOUMysio0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejkl5BQ9tshTXkVrXCXjPTvabM7a6l2mYpE3oHSR1FsOCmS6iCNk0EqfaGv4NrwGfc9Sjxf+asC+lJR7NiJ3/y+2SsuCeI5yhFWMOEIl5BrBm3SE+BwXXgpa7zEeA63ylfL9i+ItHDvTpQJSj8Htj4GqtPikkAwA3y5sMv74qcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p50l1JZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wuv12V6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p50l1JZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wuv12V6P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xvYK710662
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMUjuP1x+cOa3BLsYFQUebKS
	5hEQlpItYKLuhasrbQs=; b=p50l1JZvaBOSP2oH+L+MS6IFbM6iRA1n9n2W8qGX
	wqERij/2LZVJYTZCaxbWS3c6imqWd+9OGb529to3588YRzZJ+1KYLPIRg7js2EdC
	q+No46EJCRjeyLQyzAYh59MhdCybF9caYqv5xaYwT7Y00u6NPNCr2L0F6rffnoSd
	wLIu4iBQ+YeGkmgrYArCY6c8ySThQLu4IuhUgsdsT9WOFiP7YuNaEnCB8shpalVH
	L3nNuhpHK8Pvle1VZjKoraIwrtvNT7jGNgU7zqfutd7IoqgQuKkApFd+fTcRxB9a
	mdEqvyjZN2n8yH71MK2mAx0fm+MWHOcYSLoLaCAzk25RDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgfmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:14:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484f26852dso1165093b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581255; x=1784186055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=Wuv12V6PA7nfDF7MpJi2R1ouA4Q+QWwCSWajLGunFYmLS2rHF3iwxY5lGBoLxY3XOU
         stX91UKVq+QGE0soXR/SGMyQaBQsy2LYj/frNiaQmvVO8vGzQDCbr0WuHwWCn26NDMAP
         BGwZfdm1tnhV5OTNCzgZQFHrhtEUl2VcFd4OCZaUf/3rpLY8YKfpXE8gMA0r4JPX8t9G
         wyXmD+GnejtwXpF5VcqcJOwDQY0o7W77O7Uh++8pKxJmO4wziYwn4ahuzpTaPeNcs4Am
         N2+oNXMubRdkqDTEnLlyiiFbT7oZuWIL82lZ8taCrXYz9LT9H6xvYsFYULS4LMkMhWvH
         POsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581255; x=1784186055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMUjuP1x+cOa3BLsYFQUebKS5hEQlpItYKLuhasrbQs=;
        b=eXdL+HCt+midf03z3ZkrRPu/NKio/mHSQKTJcIJl9LAaFiUBkOeAMLXVhDVY7GPO1/
         y+4hgzk5ost1LcC9a7pu14c5VKoErKSv47CEe1gN8dI/1Y2/KC6IPD8GmybcDJMWsCdE
         H7PtdBobUYXacOlpdCc7GJi4zndmh9vl/ZjoSgaj/8K38X/0QcpzmH1dqSE0lKEMQoWk
         oz0rYKTXXTrMiZ/UpUgVuUgKIF31V1OMbtZ4P8cByvy6TDDY5UAG7UdeOK9928JXfPyi
         Cj9gxcKhZBCYsX3mwQ1br78zPFDL/wIPsOFYWXdpWEduzGcOnIHJOM2cxmbpJIHuNUK/
         oDFA==
X-Forwarded-Encrypted: i=1; AHgh+RoULfkNqsH+NId6v/ABl4yQLIhcENOvtS0K8CcqWTFafQgx9v9vAIMhUviGPW/XXOUWRnnQ7b1piIZB@vger.kernel.org
X-Gm-Message-State: AOJu0YytZbpdRJc51kwUdaAAr9JUChNnsh0m0neUEkWGdARhfNtS5AFC
	yekmE2+ctNcfYUjSY53NNBT7oG2+bOaWHY/upGugv31ZPQt8xyDGBq1wi0AOBBqcNAR4A/BYgA0
	Uz0gyl+YffynS8OhFEtFbn9/W6brk4RVJ/2lbglFEZEXFATa1aWSaDDRXmakcDnbS
X-Gm-Gg: AfdE7cmuN4DD2TYuJ/IZkwg76pAc+FyYMGvL6v6DgG7uAUVtf4J+e2WNX3r/SASi7OH
	xkfM/Ls6fvPVw4drOHH0YY0oNwU6hQJigpTYlnO9J3nIsuFv5GcFZk0t5vjG2YKUhczfJDWq9H8
	osWvoXaLZxAez9cGVVTJ5B2mIfyUh5E37m/cn3lX55zKDA1QBzx565nprnuh9lDbiWEOykHKUlC
	j/UYEjC2diTT8AJ8M94PmX0JkcoThpm1eJsb1B9cZRsH6AfE1VuO1AmZuGTOy542V+3QZIMiAQg
	V+8dtvKzkjvR8pg+iJ8r4RRi4IyM1nCUXS5RAbjbVe5caBj1DzrT2HbgP/DIVne4rJ9sJJ6S+Jr
	g1xlBBHSimLHSm+pMqYhf03GgYtJLXvC50CwIPw==
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464196637.48.1783581254538;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c0bcb7e330mr7464160637.48.1783581254000;
        Thu, 09 Jul 2026 00:14:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm28740179eec.13.2026.07.09.00.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:14:13 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:44:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfXybAqGSPYgkaj
 DHJpDoL3eIHZJB1G6VCMnVAM2YtriLkwObRC60HUnCzqRv+qpHAmpShGTOKS2AL5fRPIMU3ophh
 cozrb8SOM73e7xOKbFMaIpF0Pbmm2Skk0wEr8CQ4ihNGvqYXks5QeZ4qATbkKVVOUAEabVMBuj8
 IVHbJGKR2peUqhqfVMgq9lzH68zW90RNAzrhSL7UtUtVTNKs9AhPwBPry/oZZS4sjJYF/8Picf4
 o3LVHAQSy4K3dD9/hLgSVOgGCzaRzW1G5dM/n+oUAEIBO2FwVnLsgsqIs4jqMBepuH8Hx2YmQns
 ZcYNRVhlx/JqCCyouo58+p5PRBGcSyyCvyY5njmKlz91/ikONldPvrGEkQ9BrcjBdRoYJ5CXDXR
 WxFla9ZWe6IbUGwuqgNRX8Qro2ZoH3hR8b3+jyI7/6w/qoZkmFy1vdQlu1MepCkb6FQ95D+343B
 Ev36fyMMEIzDpMRTXAg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f4a47 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pV6Zj0bAzI97IrYWChQA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX2rKF5jrdpiCm
 3aZIeYAGBlwoZoBDxJjtffki4QNUBRISM+txDtng+L+HS/6lcTs1tmPNkc+QcdC0+xYhPSOy11r
 ModU0ndIbxkL06aT1oyH5E3Z/LP9nds=
X-Proofpoint-ORIG-GUID: acjzgZyD1obKJI6MhcLy3VdqZRhTInUi
X-Proofpoint-GUID: acjzgZyD1obKJI6MhcLy3VdqZRhTInUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090067

On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>


It should have fixes tag ?

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};
>  
> 
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
