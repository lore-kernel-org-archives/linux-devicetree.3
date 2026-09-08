Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EAC423A85
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857110; cv=none; b=s5CrmhfK8c0naT4ppRIS9VbjQnjhkpZLQXT53IiVlCahh+YYA/ZHoLDsXGODieQu4M3zvmFgtEBEGki6P1wmhtp+QBJwpR1OmRZ1nP7kg/zn93CmRi4Ca/cyx4eBxWw1FmR7G66H3FaLGrqPitBelFEORrjgRpyGPHeHOh+zKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857110; c=relaxed/simple;
	bh=rqQzBkXLE1s3C9fDauqcJQsG/1ffI62DmHui3HpO/0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEbV6pScJPFO2zg0CrH/dKXaI1Xvka6MKfaXn/SS/e+yBySbrUdimziI0VZcOYzw12aCyelc7HyRdFSLdSjboIhE34PLVCbZpgVn4UQiEnU7pGP5GEpOU/zoQPeSEjChCbPS/z/TjKrDVdlDHvLZI4YrL5Q6MFf03TTJiDu1Qww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqLGz+Tw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYaBKazs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqLGz+Tw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYaBKazs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LjMe2172630
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 08:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=; b=kqLGz+TwQMzOjLKa
	ulg1wd0+6WRqw9I2yLN8Cx/GeMqcY/unL0U6eYe2ge1X6HySWplgTgqYlJen88Cj
	5Qpyf1T/b05cs+mFFPAJleKMR7/U5DJ3j4onKe1y6Xq5FNgcpUljlSUY8m+afler
	MUu3mqv7IbG9nD8mC3OtFBOs7LAGkXStthIwcqMpGr1WIq4+LSv/onKlo4HAyqlV
	nw6LLt1FLilemW3Jaggw5+lvdqaMEMFCcymOtXbBUMvJF8FBaHEOwGfKHBBlbDaU
	+DCZJ6LVztiGZtho6HCkVvLnFESIMwik/5+ZFcGcQ2gCyBuugY3z7hVV6bds3MEL
	wCmL2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrjjh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:45:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso107909371cf.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788857106; x=1789461906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=IYaBKazsibwSYAdAvUmKzD1Sfsh581Ws7v7L49K7cpX5Tq4qdVYBCO5c7VVrU5JiE0
         UWJ8x7hq/2oiL0jI89hfs+jqt9o0zpYGU4lPuc5oG4SoVzrpxXkjmsJO9AHjVpltJ0ZZ
         AWHoPEiLsX8ykOIcO4FDCRBQdsOM1dKIRWH3E1PLGdiam0oatpWWuBKcFLLiS4yeOBzO
         9i+ESEinhdnLgFlPr2jneydGvsyiSCIUGsOhxy58ZyJHTx9lBg7VFASa4KEqD9d0QNyF
         aOK402pZmzoYa5JDlyj+RxlxpKRgKofOAkl6Qdjx6Kl5YZSfhB/wflP5e68VM3gqvLlI
         IRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857106; x=1789461906;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub4569bRPlpOHYa78WABwl6Ou9bAMihTjUsTBS73P6w=;
        b=HoddSDuAXyu7QBsdNxpF43IbFlwIss4kkN36RlXyRSkfdA9/qiQVC4gg/Z260dXPho
         6to9KrQ1EuHdfxqApcu1cBoOa+58XHP4GKy3+7P+dzJOtIso7X0tcDC75HOC/zlJ0JtK
         0oY0oOyTHai47DThWRmPk+xoJTZ8coumTCQXz6qSHy9s5kz0XuVAjDPHpy2bDtKIfpS2
         gJ3xsVN2PhNa9mgX7Hma3FdXSKD64GoDe5gCp6/xAMIXwRatPPMMLNHvnJQMFj4RjR4o
         0cXiXoe13eO+b4o9i90aX1jAqxvjbgPnjFTFIrzxLaGp0v10PUGTrCGgy4kVEcc3ZLGV
         YhXA==
X-Forwarded-Encrypted: i=1; AKwUvBzB/y2eRljUHWzNCJY7iridNEOB1+oh0PjyydJDLLpdEd40sdrIceCu3JlbITIUWi+6CsPhj3w4ANIy@vger.kernel.org
X-Gm-Message-State: AFuF++k6RRC5BdFxBDI+HqnSiCoD0dxR2N4w6W+DW3o8QvXczLRnBtpT
	2K4jhpj9t9yqErfLYwe0JmsCujk6nPL4g7/jtzGXl3U19HgbwBiYcOfamFr2KAxS9btVWhj2PQy
	OWikHSpnleBGOEhEptdSa+B5IyxrdAzWrFS17kejAaOlRgpkjfGxSFLQ2iiEOqpxr
X-Gm-Gg: AYBFou2lRKn95IIOQmfMubUcZJp0QRDwVvpU9Onre/4BTbtUZpO1Zf2+mKwLFb61fOH
	SD7sC6SiNdqMDQ9EEJV5cig8sqTbF6YnGt3MEWCAYTFCxgriISur9MK94TRADUGWcQgwWVMG+7s
	/JJ2QtjZpTsyd61GMqpK2zEbiltdHNBppfqGT/EsCinJZBMHiXoJjkUo27pJvyUR5+A6pKc1Pjk
	lx644KihnOhT7tRSw9qRfNuNmqgJYqltmUrkSuGAjecQpILPB76aQo0d7suS4+qSUq/rX13CrQ/
	he2kZ2tUBXZLUIKcGxzah/QeKWgI3CzspxuRvEqmfkPL2pB0UQHWfce6wTd9NAVvZNxLtDLZgDf
	LQC8ItVpMFSARjptGYIEaYjDqopa0An2u9n0/nboEl5ayDnfhuhj8Nwwvr2Ga9n0=
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345337391cf.34.1788857105996;
        Tue, 08 Sep 2026 01:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530549ce605mr345336831cf.34.1788857105476;
        Tue, 08 Sep 2026 01:45:05 -0700 (PDT)
Received: from [10.38.244.120] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm107174381cf.11.2026.09.08.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:45:04 -0700 (PDT)
Message-ID: <82b7c6f2-a45a-44b5-919e-ea448a3387f6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:44:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/13] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-3-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfXxiUCfD2lIqwg
 Bw2PJf+Niz8rBDpWICLTFAR2r+Y/iEsMDz6Qz69lLMcToxhxxmbliov/OQi/onHSqEHNn3n8hWx
 oxpAT7VQJqM5d0bG/JRUD/RxRYrcNss=
X-Proofpoint-GUID: yCyQkS6XpPnvjkX_Igs9_lIBwYA0u2k6
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fcb13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MSBTYWx0ZWRfX5au+mVz6Um5a
 bJU95uDJ1AAJKVxhLR8QhTTbEs7YESIghBfL3LoLAPBX1njG5XMSZJM8CCA3nhWO5iQ0GooUakT
 khimRD+zp1Fnnucu9yA/GHwpUhq6eUFh3eVwcrHb3VmsIYUGJRrYb1Zj3oRfmnPg2o9piC1x9+g
 NJYwlCykYI4BZU70IviNoeKu2qP7BFN44y+NuIV0/CRh49e51RO1T8tksulNVc1xTP/QBGiQawc
 HvXyT3SfCS6WYm8oOqm4Eeiq+sJaRw2e/ED9lk8L6SZubOtDcfMJ+IYIYGSYzbnrlsmyqMdSWaf
 5Q1XgEWSUIvT4/P9iIKKc8JL48l2roP687nRGwg/pr7uDjCMhBK7PyXv14v4+/u/xrsZggP96Z/
 3HTQMM+lD7Fhdd6maee5n9kYhY99gNVAuoT+bHWSM5LUk9GFXvAjaCpY41eWA2EuYr2UVFDktw2
 aEyDYCi0yJOEpL/1DfQ==
X-Proofpoint-ORIG-GUID: yCyQkS6XpPnvjkX_Igs9_lIBwYA0u2k6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080091



On 9/6/2026 10:20 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142b..9a8d6f020a391 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>   #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

Hi Bryan,

The latest code already includes this change, so please drop it in the 
next version.

Thanks,
Wenmeng
