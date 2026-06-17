Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2283BFE25
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689712; cv=none; b=XhypDalnoFWNeA5bh7+znP2l9LvWpLeupi62msGPKUzVgpxudyjbS1RVCk9tJWpWmb+26/AKXEY+d9QbD+NXns4Msrf3ewWmDgMoPClhvY0PcpuLI70ew78mHU5Nr++4VloG5vCfJq1ComCbN6ur+y6XRS9iPkplbdTz17cOHbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689712; c=relaxed/simple;
	bh=RDlq0QlpZF1Yk6nwIj57XH+2UjgnGQXUyT5CSkrput4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJNq35Iji5ukow0aum1Tkr/DNBIli+a8wKQ4R3UkRRUemqE9qLORNOSgxMd/+Z8RriTKB8zbSSp6JBPI/6LBS3m8pg6A7YFQUtV7WpQAICdtyoEK/y/cu6WMhE+mr0B2ak1axyXrqRZ/9zBTIIXYcqsURjEplnhEnAsSP27lfd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7tx5YRC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECtQk/eT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7tx5YRC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECtQk/eT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UU6G3273558
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=; b=h7tx5YRCnRmYZDXs
	MWt0D9ZXNWWW4NteemrIOjLcSQHaMvRNlyLyotm586le5nxORBKOAgrC99HuSNRC
	qF8fhOiG06h3/JbG8SX09dKPiVdixFaPiJdbV0xVL9WuHQQL3hLx03YCgtWApFzj
	T+VGc5So45R2gRO2Ftkr2Jn0kvpUMLBLrfT0khhX/9McXRRoBrJCV7HCIF4iugQZ
	ufWhtYjuF5QV6iBWF29ZPf1yqzwfa34DWibAKAmFegMiAvA8ZGZzZOJ+zwABFvhV
	CDXUT9qCni1W8fhsC1RDE20OZyU4PakkT+X30u/s7ZXFBwpjeBt3X1yFMeJ7FRNv
	a+032A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtgcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:48:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so15499001cf.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689709; x=1782294509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=;
        b=ECtQk/eT6RvNF5zyFZ0sQ1+ZmvUTwgQDmBZPZwYRIjOJ/medajyqWqpbNEoCii0u+w
         TU1lsby2XeW80+8zRhmeFvLXmhXMfhVOi294f4Igi4EaPFhTHDVOZEQBluLr8TPMfAMp
         1PT8vRf7/KLKTyNm2kRL3lSy956uMmSngdpfnUXnaFgrmdQnqBXweFpb6soqhVPl4M/a
         3Bfw0Y/tW3EOxqVGCOVW2Ee4xa08qv2FYDMdSJKDsMQ90jDI2FFrtsw0Mr1kYK++rk2J
         L4DyUlp5oHL9o10sYUTo5631AEA9zqhFmItWkSer3Y+QwEtZ2IbKwU5ZDrEwdEbwH33i
         kbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689709; x=1782294509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Rr/ngv/2ytVGX2mGHKNa46HYx0Ceuzd0Ez9qBttTUI=;
        b=CAUaTg+TJx3ulzoljh09ZU3CD2MmCQOYlQqpynL2ICkc7KSiY/CyZwGm+B9TocvkRJ
         5/03tVUCFCRJqEXJJ7VDtuYUVb9KdAAQ4s/CQet0G4d7iKi9po05F/LNuIFINt0H9giB
         68XQh+dOiMtmIdbWItmFt4jluKGMYu+N1+6jW3DVpgANaef8yGaqS11oZItBh/LFY28p
         VkTlYOzD/rgcdVUgnCD3r5XPD0l2+Blq9/NAKLVjy9uvYVVsLMxydwEgRVK9da7MbgP4
         5DRdpsqnp8q4LjWeLqK8RlB+GDQJJ2CxWmbY5mvMxroJGB9aKzH8dSve6EXpwgZl6tbx
         QQig==
X-Forwarded-Encrypted: i=1; AFNElJ9ZqXT0giW+y54yZT4QTvatUJ9Ff9gq8GZAQV8uOzP/Mhq2fcByRhtkJZpXDApr9jwsxa1zftrj84vm@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFYzib+otxviVt2ic5BRcyk9ijSSggHslE3ufxm8rO9vzisbg
	AhumOvCa20HyzzDtnF53EjrR0GMdtlYStOKfMps6U2vB7vB66X/CE0pf5a/GZVEtLNulelE3A46
	Ma07UDif227PFzbcuVoK2dIAr99TmBZ6K/9WVw3RnsTtFwSsjwKcud0eD+sYbGdam
X-Gm-Gg: Acq92OHQeigJ6OGk1PH8cwvuXazWNYfDcUTsSkvAUFCMYnlEzMYaBvB0MyBkiqzl6VJ
	YQTdZigjJXTJkvG/0qfs2vGDG2k0bv/h3+E0tfYqYt9fi5/uhSRsERehwBFfII4dXGvZsXIFtnm
	GkwFzodkWlR+ixQkt4PVMSV30AoLeb/4ygNQAoEwYPvahXoA1/5Iu+y+G+q6xTuqFmX7bsHouX3
	0l+mUqztU+UupUzDgdL+PZQ1HiNk02UJPbEZhMJwHtUdYD05/dxWcBp8sKAF+IGYf7hWx2tF2jC
	8VDpekNZYeBvm2Z37ebkRAXnEyz22H4BmNc2pHVCpIMgbspf1Lx3/E/Nqb4HcsY3jwybRYzCdhB
	s1dMexftlHY1m30R0p9HjFB47Df4kd5bxH10=
X-Received: by 2002:a05:620a:4410:b0:918:588c:d095 with SMTP id af79cd13be357-91d8e0ab2c3mr313538485a.8.1781689708728;
        Wed, 17 Jun 2026 02:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4410:b0:918:588c:d095 with SMTP id af79cd13be357-91d8e0ab2c3mr313536385a.8.1781689708347;
        Wed, 17 Jun 2026 02:48:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d9b7sm771513166b.41.2026.06.17.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:48:27 -0700 (PDT)
Message-ID: <f5bf56ef-a57f-4b1a-b18b-63aff94a3bcd@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:48:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/12] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
 <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-11-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -GR2zcWG-ZXMGPD8HP7JlK7prHT39ORk
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a326d6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LDWERgqoa3hHt-U3m1oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MiBTYWx0ZWRfXxQaH1NfGB0pI
 hVIE+arWI6C7HSPbY8CVHcYx91lU7P11V8eynlUxSDQxkvCkKAPEJeGGb2H8FtRRv11yWsXkync
 Xz0yrNAmo4ZfUn2MoGrr+oJPZFuJk2A=
X-Proofpoint-ORIG-GUID: -GR2zcWG-ZXMGPD8HP7JlK7prHT39ORk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MiBTYWx0ZWRfX/n1SSmynqxt0
 /8Q/A9H8XuBG2L0sVQwpk4XX0u+CBRt+6J0mtO/ha6V8RmrACxTury/xBYIiDT2ypJwKKHdZKXW
 5VKW9COCsrfK8pVVSh1sU6dfmoeG9dFTU6ruwaliOakQvTPVivn3ghP6IhzCPUdQWatnDAY4ZVu
 t/Ddw+OIUMr+QC4qFbDSYfXCR+oYP2FwIh36rgWna/hJ6ux5Si5aTpZLxKERpyvSEq2juQAh9Zc
 E4achatoBq9aWzHniHupZO33wtHl50cEE1CffLgwsipqYtrlJPinQh7GwoLSGLHeKC69zUnADKz
 cCjZQuK4z85qXWsTc+VUV1lKwkQrUsKpjnWuKFhJUqemyJVrCV9Hd0a6cNFK7y4bT1zIZ7J8qbV
 ZnkPr5zkFn76vdQi3NMUHMbz+r0mBYX/u1JGHJBmF6KUYY2KsDc/Hutb5E1u9hE/BR8Kdt6zrvn
 lsSMT1SjliWQ9LPoV+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170092

On 6/10/26 8:29 AM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..42bcd03c4d3e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
>  			};
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;

Please keep the address part padded to 8 hex digits with a leading zero

[...]

> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";

I find this comment superfluous

Konrad
