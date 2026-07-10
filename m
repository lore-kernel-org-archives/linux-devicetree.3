Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A7426EDE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688433; cv=none; b=vGC5+hw6WSlrA/MMPaBPrLyP7PjI1W2ibkM4zXMyGt6TjBP/OpT0eYi7peKwPU/zYYOChlYZQ6rl6gcAWtpCjhCAjkWMgyOIVYi6MqBRRKP3duu8jrcL/Cj2WigZwcWD9b2LxuRquyb4z2HSSeW4SMaaAy7J/eIiIHh9lOzeF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688433; c=relaxed/simple;
	bh=PrNrM8/okdfhabmkkRQ5vM/7921V7k7ByYh92noXh+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qee5Pq4BnCP/WGWFVlDxVtlDtmXmYCDrDsqm3C/Gde8fOFfz9fGIWS8bCE4V4FWmQw4D47gtAHZRVEC3WzImt6IlJwF/VaBmSC44gGKPI2cLJwldFSOtV/WzfeurOAT87cBs97iI4A5veHQu/8LSyVdPbWC117MInw9zjU/tOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx8pK+3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3YtLDuh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx8pK+3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3YtLDuh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmd3N569362
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=; b=Vx8pK+3c7lDMMc85
	0e69atEm1LwPSHwT6NNhJcA4B0MCeKv3pjtz+mEf3Rajw1uv4+ea6GYtJiqqMIMG
	ax0pSLNq1Olt+Ua9CvjupZ5EVMjmtg9P8buvBtf60JGSw1dLJRIYUDdbAlf5Q9dX
	WdvkEuwu3NtC070GEC8tv45BGzUoxgybnEdOKx+g/t+xk9S+yYCbadu9rNcjJCMm
	jG+nbxzBShpe2gvV79lZ2lxA3ZPsjshkcWUI/BJdlSojkMixJa/VIXyo5cOODL5o
	2zkoCS4kgXTB+Ukgezt1zRDAeRi5zrPGJppbKldS8fCyD9E3pYoE3s1vD5gxF2An
	+wt4wQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8qhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:00:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf259655cbso35766e0c.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688431; x=1784293231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=;
        b=c3YtLDuhxccTS+sBXmVgXeXx9s1IzBgUcNq31KSfTJ9nBz/yarYq/tv6xLhoXT7bLK
         IqsWOERGixuzcxcTXvdBiVY/X4vM8A4CIOhn92xwSi/BgvCbOPc24N3s09aasgTc2hXF
         Vc+JJYj/oDzdbYt9/Ny0oWDhAunSAPz4JtVYs2kXnHPBTE7SD2jq/+51h4K0eteWbDnx
         ohyY1ciJWOiyqJn/iAYYtP4NHWq55SwhoYmUUQioWpcOpWI8aYh29yMiP0CBIBzDBwmM
         HlRQBLs8sKM4bQ/IgN/c7Rn91rfAu5upYcz/Ll1XMQO4gpP6AQSkZ8HIMEzI2GBMvbzQ
         5ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688431; x=1784293231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=;
        b=ZSuBvYiH0jnHK+Z1rIYR3aIgakpuKMi7UDEI8NjMJGdr4z8L0HfudqNjelugHbFiXz
         o+STXfAsDCnP1sLz+jUm8ok1aop3+zlEtzUYR7bcQ91tX93lOihaBJPAJDqg4u29FwMB
         nAZquGOafbcDGcNV7kzwv8tJqXHEFsIwVV+A2+RHH/btoAlfeV3jeOYEQZjSYJr00jFv
         by9Q5bDq0LtCui7Rzz/n2oPLTsG2tPbfe97dW4V6IpIk1M1qO4knH3lBpf7DZQIyiMxC
         +33xgIMKQyY4BPMBPxTFLTpA7QUnKdkE2CH9krn6fK/uEw+RSNZJQDL8I5xP28EcSuUR
         jSUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlneT7y1Bz2evV8mFExy9VPrZhsK3dnY3qph77EEwogvywCEdUES/6JTXbRW1tjMUruL7c4x5RdLvv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27pbaiq5GWavYrFaWHBF7tCd9dbqlEEZ8MgrRDBQsFO4qpvKD
	7XHSdcc1JMGbm9skMN9llpesz1CQq8F0jVHGACo5TzkFllGYAX7whALIpk/l01zK9/nxtnxYEKO
	EYKG8MKqRkMXN/uQSZevulRWv4u4h5hWNVkWhtWuINpXTmKNvAVRMcp5vRXmCjviRnU1mviez
X-Gm-Gg: AfdE7ckK4HaTYTGffn+I/3cez/h4RcwW04K1sIg1EiNJKM4oUrcO7ANcrm1xCg9yvqW
	GDq4o1AyMbQLG4nT3XcNrhlywMDtsCPv4a2UeiRrIpAY+WXZLBZ/yoVoQfhnWBWeNfwRZxi0XpB
	L9Bhu4CgLdTYicShUba2Z1HlxMUbDWB0sN6s+pvDbekn3HcfDMQgykqWPICIIka1TO/fR3NqgOq
	RyD5W3n3TYRF2X5U2tMNW7Z05gV+d4p56Xbcz91BlQOH62U7sJroarEUSetIK9HeWVaqDJJ7fGH
	lf2eTe35Ks1CXMjPB+6x/07qk45qG0Tem+KuMxAioO7RcqMsmOsyq4vn2PN++0IGf84flr+3QNm
	F1ped6yD8Cai70Oj5nv+M9Cya0TFMljIyXVk=
X-Received: by 2002:a05:6122:390f:b0:5bd:b5ce:23ba with SMTP id 71dfb90a1353d-5bf861698edmr1887998e0c.2.1783688430392;
        Fri, 10 Jul 2026 06:00:30 -0700 (PDT)
X-Received: by 2002:a05:6122:390f:b0:5bd:b5ce:23ba with SMTP id 71dfb90a1353d-5bf861698edmr1887989e0c.2.1783688429954;
        Fri, 10 Jul 2026 06:00:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa5c4csm598195e87.57.2026.07.10.06.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:00:29 -0700 (PDT)
Message-ID: <984287fd-b1e0-4dec-806c-19e9243f9b28@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:00:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50ecef cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pqOYGSlSd9M5UrVTkMYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Ee8DvlJutg7AOOfS4svSLz9973Bu9_ge
X-Proofpoint-GUID: Ee8DvlJutg7AOOfS4svSLz9973Bu9_ge
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX/9eiyKh/lRGO
 sP1yP8CnhKQ12RARZ0IS5WFTT/lu3ACYcrDLsAO/w2UU5wgt8yjh6ljrVOqtl7476wU0Cl7AH67
 EhRk3825wvs8rktfVUedNoYY4VLHB7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX4EyL+QJ32sIX
 ha1qwJs+SQ/ZZ6/Hpzo9QhmhI4GT0MbMIeyNZh22xL9bkTx8G3V+/DIglqTzUKwOhyecKFXkkDP
 wYuWH/7aClSRi1E1B0wC3Ux2t+12I7uKgKWdFUCJn+p8vUu/EFbQ9vdXLZz6/NGpEcD/PUACYzt
 NA5DVwRiQS42r9jRUTK1iYiIR36EIzk+o85tiylyxXWWK5hsRPrp8oe6EbMQTDYDq5jn78k1v65
 2thGC1kt/ysjri/inBtaRkMyF2Qhawss1luA7jCZaUDLQC5nUsVGQ1ShyxHPqEFlCg1qwuGCxEl
 wmiHewrsu6wzwXeOV8onLwLtmZhadsq5/logM4iqjhUWtIpINHhdzSHisGVpROtKEEC9nJd5bNx
 nEls/EH3noqIlzQwQAaq5qisG9IU/ZfO63lbfM+YtwpYvBvbTypScJTUttV9qSW/07aV6tYcAVx
 Wc6rX6ZHfqgditvqVoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100129

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..e6f188cefffe 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -4,6 +4,34 @@
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
> +/ {
> +	thermal-zones {
> +		pm8005-thermal {
> +			thermal-sensors = <&pm8005_tz>;
> +
> +			trips {
> +				pm8005_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip2: trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "passive";

hot/critical?

Konrad
