Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83623BCE3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602854; cv=none; b=OqX6I+tBM8F/YRRbuMqEplSOq9QeY4G5Aq2LN3EcGIzQ8VqtbO6PsKhyoHhBC66drY2fR0+aXhCU1zFd/hs0P5cOwISIxTeu5S12aeL+fRLomszIDh85zkqR7qMRclzpBPkJqosahLJghTwO/DHKytLfofGaGw9iirfLTobuhog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602854; c=relaxed/simple;
	bh=NgMTWP8X6uZPAe8E+uX7ej8MHiSFVc+1gGqdB6EWjBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBuaOvKbxTrGbigvZvRAkI6xdDE/GlEqitD40Vta5zvUFuziht3J+ECVCe+GVEqP9oxa2y8ckW5v3AgyNlL3z0emMTJ+nD+/AhJQ35DYcdBq5Z7fdbYeHhLWj/kh/qDLlDJvC3xoqTw+k3eLcHRkWefNOfKVV5TzengHV+bhNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3dhVFBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZcm4L2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3dhVFBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZcm4L2A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNB1r1575371
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=; b=f3dhVFBqJAFo4XRE
	qLnHVmtw+KFWh15TcfQNRKmuHgDSuhLrqetDDXrPicT5pWBiJFhOqqpPyxxMME75
	CGfoVCNjAexejIpms9FRXbXo4EMhzpaMaKEIIT9ll02VvZYLGlq1iWP6WqehdbSm
	Blh3A/5R96kmbKu5PNOMKOJVsKpZWkIJz+gjhn7Hgy73vEcY76IySVcAKl2tFgEG
	fb2vUNvC9j4iOK0HSMERe6I4doloxMkRtDAn4PD3/JST2rDEu2jTLdcVGQCZ0sZW
	BWhoCE1Q0dgTlUm9EqrXV5G5UJSBtwxUzFLynfdMOFJWdYDYXI12bn91EF8WABvx
	jU4YAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcbva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:14:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7579ded2so33610485a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602852; x=1784207652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=;
        b=QZcm4L2A3Y5ah9/s4330jSXd9Ua3yMsmG518DAYCrp0xNZeQdi2FalB4mXDCDUXN36
         DKOr2yMKrB66pSQvoVpl11WkqUi/61NCRONo/11+81tibeYdyDXsk8wR5RHSIxZkpnQT
         S/kPLcsenKgRmij8Sun+lnUUfrr5Yn7hnqXGV2Omit2Kk7ONJokHJmYBggZ5j4WJ7o4z
         e4Wi9xcsarniyW9uBzJHELLTD9Ix5v+G9JdCdrj9BpvLwO/Ptnow29ZAzhFglKDZAuS2
         6iDv8rehQg1JMtyoyCxGMO1svT/eUcPzoMOSsbta8m+JfohCoh3NtFBLuKKtsaTK2Bbj
         qUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602852; x=1784207652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgCF7INdM1grWynFhufM0Cft6FRfTAX6/q06lfXfPqM=;
        b=ZB0w0mh3ykanRL3jHSFo7Bsmyy3AaXK9u2LWYisBw829ezVsETibFaeIsc1jj4nzEF
         7tOBmRFaEGqJOeCtpKoBXAZV4n+Y4IlYr6VebNApgRY65gAX2ULVWM2RfvHBEG6VU287
         48IwpYnqSxzkM/nzL3Za7q6tTxLVqdG/+3v/e77/cwTKwN/gnR0zm4DbdQ8uIJExpIvT
         mI0ibVoGYwEc188YzK84a1e68+IFFH8qyn6Z5yYVXK2Y4rxrlxuyjGbDJ0VTUzO5FGpT
         XQsDudNkgPEF/qLtPVbll04XhcPpJcuXK+XpVzlpTQ1r10oa41xeFgmCWMhhuas5o7Xv
         N5Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rqq0SALv6ExzPcM9YmR9GqCSvHeGQDSIW6GbfaHlmQlRt1oAlfAiExv92N7Cx7J8uPzr8yNUJHwTsNu@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHWjjgGD8Icmzy0s11Bj23PmWn90P7EQodmUHYyfs1+C21AJ+
	+MYTk/YGCrjijwwJZ+LqQG18NeuvvOKFGqGRqOTtKsTvAho71ihR+LCRS5peOsR/cbhjX8SzIeb
	n+J0l4XWpWStTuAiaWxVw2ZZ7eBX+gdPjJgvn8f1iNkGGMpcaCfBYLswQnZmurbzd
X-Gm-Gg: AfdE7cn931ROPO1dxXazw+lAyUSKBJe312N97W7w2GYfHXLoShui1Js4t58Cg7CoMIr
	BGx374lRWcmoqq4GZrF/umYBQW9JN62ghKze53ztH/WyrydoBpwF+qJUh1uaZDjixe1Qnpduiew
	VK/ODLVlgOBgDQmBEZdM2m1c7GAvX/yAPii+lYd9WVfm6EO+9gTVvbieyK/c5T3ES8/7IQn6KZx
	N6ILl7wJkaMZsSmKww0CWfVyHgv2hrLN3yV5aoQgN+65uDZ3Z6SjmcGPG/nPOSfp7GUlp7tpZvA
	c0ijs5sUJYmv2Uo8cc/gTimtPDtK9dPR8n7MaU6CrSrqs1LuPZrB1b06nvjm0LB4Ecb743jJHs8
	iN03fIJeLjFXCKI+LWmc+9ellWR4tle5Itx8=
X-Received: by 2002:a05:620a:2987:b0:918:588c:d095 with SMTP id af79cd13be357-92ed7a583ebmr337941385a.8.1783602851902;
        Thu, 09 Jul 2026 06:14:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:918:588c:d095 with SMTP id af79cd13be357-92ed7a583ebmr337936085a.8.1783602851259;
        Thu, 09 Jul 2026 06:14:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm255954666b.44.2026.07.09.06.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:14:10 -0700 (PDT)
Message-ID: <e32950e5-b11d-4924-ac3c-692707a880a8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:14:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
 <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX7hrqTd0R/3ia
 HUGAf+bXsWA+QlYDjE3FgU5whCu9ECzR6UGkrNgwvRHqnWUIK8Nfs4QrDzKnqe+IqZKo+JWboWo
 JcV/1dpUCRGY64aXsMXr5kpiVTMfT8O8MnmNq14OfyIhl+IkZVrKWCLafWOMTGtc2gNpDFz6qdp
 oGslHiIqg5ixQ18p3Ubqm+5On57RyQevhjdsQtJrNyLhpqjt7qQLFA25TLEcI/6D4EenWLJErbn
 5aNGhw+qegQeDDOuo2mM/gCMRkMc8UmfbOkEAwbdhsIiLHDkGHn3yV+03lxBm8J/SmBv8Tmi2ih
 luMV3XlxpL7oNiDPzf8sAGwVNyK/m0JfqUmRWEOWIdYv0aJadiZ9SW/J4yHyOvy207zl2i5+dBW
 xUY6Rmc79hm+npmrw8eAdbY8qsNc+oMbxqXTVaAxXSB/e0/tOY9HqCyd802nzMWAOUSnsLMFXeM
 loqB59EQCZaIbxaY4DQ==
X-Proofpoint-GUID: mMeYPrLnTjs3rksNJvHT00q6qsBTKHy7
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f9ea4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mMeYPrLnTjs3rksNJvHT00q6qsBTKHy7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX19FQvSJJC6d4
 0fZxQJOhmUlH3/RIL//bBZKrKteRSCRh7AHb9vald8VvSBPe2OBM5ND5c0DmS6cs5OSrZF1oDuQ
 RHxNCykzNET2s8+4HDjWuFsIUHT3Sh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128

On 7/9/26 11:44 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..051cbde20983 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -4,6 +4,36 @@
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
> +/ {
> +	thermal-zones {
> +		pm8005-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

Also here

Konrad
