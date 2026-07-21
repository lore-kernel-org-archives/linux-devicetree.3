Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4B446067
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627037; cv=none; b=mUYcR22+33XflJ0LlgpzoN4zcjmXi4LroDz0622jvSrRoOlNJ2sYa6tWCEIK7ZpCo1O1a5DrLDqnb4PpaGQt8OrtT53xHLGBxzZmhqwvdJiON34unCYf9dLbsK23kLn6KvHaliFmNKsyIMih1BlDW/q+44vg27VCYMx7WUe7CF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627037; c=relaxed/simple;
	bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GogmW05qfHom0n2o/IwutlDSKbDG94YXLLwh+UErPzPlJvJRQlPix0j4so8GXLaGo5ZfvfQico1D5+gYqi32k4buRIbXdJgsdrjGzr/IQ2wRbTxdkvx/Gvaj+ZujUQMUK0ICMaFyvOtSi6tE+tw+WheEzBtZpK7EksddcAA6OV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM2zE8kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wl+v2Z8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM2zE8kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wl+v2Z8L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8hoUM534739
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=; b=WM2zE8kxQRWUGbM6
	b8ChIWo+2PIencV95iUP3LDCZW0ICNsFZJ7ZZIvNecPRy9PdyCOuz36JXnA1D7xy
	7o4vGF4/C6eVcPXyNi3y6oj8aTtcJET5VZ5HPX+jU4CTRR5HrMlWTRPWl6IyCEy7
	7ISYfj6JBYF9s/j8orn8V06nzDldBgtH9W8J+u9Ptu4kuQYni/cV4CMFXPip2G5w
	zUBOqn6YRLfcAZOLz2kalYqklx93aFH1oWKVSxbHTgJVNPkDByOm2ePzv+fMBME4
	AaguVk9mFaLnXS6BtPTBEeLuS0dK4tTUAJOn86UVJXSclB2OhHAb73AWB5KR/8zs
	9LmcvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhj0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so146191461cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627034; x=1785231834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=Wl+v2Z8LwNe4G+g/+cx19uKuXt4t2Pi9bSTo1RDOqiMjNhTRHlQot6BTUcsadIjZpQ
         bq8MerYjz1fQE9k8ld4OP/Zwi3Y/JfxMN5RSF4b4BJ6u1vbih7shKtAVuo8LbywasoTc
         Mlzml7X3+OLk9js3YHl/YXsrU4QyIlAGS+yL67IjsyANP+xNYTsE81dgui2NlBri6zzc
         LcDYAWbu3IHZALZmpy7kshjIdvszfS6iWA+8MDm7+hv2QLW96zrFa/Q95hTQDBYt+pVW
         fWo//5g2e0V/NMbsh+xxhTAL2qvhj0CHhEBeegWNHEPyQyGAZBt5XQqnDKd2rOdtm71Q
         h/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627034; x=1785231834;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=kb4O34/YnzYiYzlkr6juRsHr+1jN9YZYaAwMKWX6H93wI2/1Eoq2CSyOaojFZC+1BO
         bjIEBhOwWLBZKfgJIACa/7skBa3Ls+t2NIK1J0peQAX43Q+NFQJHVc2KCpNl0XtawjzG
         nEPetgH7+gOdaVxSflMocKBagzF8KYV7oGoLBPXPNIv/acKS9ceyxVk8btZZ68cdtHGL
         LWdwh3Fj52zSJHkgYM6iLnBycdXas14l2CBof2NooAgutZUo7KxcytGPu4KcwbNV6kQL
         eYj+ysJmLDScpF4e0YCEB447jDfpI4zyAjvZo5js6Ef4zBBOxxoFBMrF+s5/hGAQQHj/
         fE9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2eeGfKJS4TMajerxm5tFDagTDm8gseZ9j5nHIMt/XqCPvGaX/VDBMoRdDEbkGsmkh4Qbth9pwAP+W@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrTHzRpeUl/lA7APZeA9RJdUl2X1hnZLBuDauS/QsH9w+BPHP
	o8GFLuArDv9LERPVmZ7V+Pq1SK+18hlaB42xHjzw0VHZZL5AWyQ1PIzr1UYYPT/ZeCSjvEby+M7
	jcGyXk7oVkPpA8x/+nKxf+DcHbrPJ2c3G5c75CHsqitIbhwEdTMpq5CoeCxc5aS+Y
X-Gm-Gg: AfdE7cnUID8SR7DGQsjYLeBa6r2Go5SZKmva8Fb6QIQNXVVRQMo8N2lUqLPFtZn56G6
	oN9iMJrpor9Le1CJMISE+WIKk4usaeRqw6yUUtgz/+kA3DfD64fQAYhcTDYeiodCZXtRhwxrKTQ
	Th863OQGjBvs7AfV8P02aKTf9lm+BNFTR88+EIMx+YP/mI4EgHvMwf1uKJRns1Uro9uYMudurTl
	CTzu+v9h4S360Ny6HVpLARPfdIRvlBThrGsJJvqZybzhU3FWyidjAPjpR7KglyYnTkN/pWLv9zj
	PgvKuDuJXELAcQzHffqDqrmtMBWtrcB3Qs4fSMwq1c0WIOu8rU4OvOPipgJ1Na2CUzmO/Oc05Cb
	XMypsrKpuZ+uXStAHcCtzUwjX/OIyWw==
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989321cf.64.1784627033928;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989061cf.64.1784627033450;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm40615744f8f.21.2026.07.21.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:43:52 -0700 (PDT)
Message-ID: <19f5110e-ba27-4599-886d-2eff6d3f8b8c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:43:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8Wz8et-mGPDTcoFsRCX9JCwtEbmUHV5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX9URJC3qo0XuY
 CNGKJpoVPnuu8nMRtMvKX4UUK1dp4KNP7tZTbuQa8DnYfvVnBHdf04B0LwO4nCSGALtNFs8hajN
 2wZ3u0c9eLSKIfOZuH59NAgln7Kqt1bSZQb8tpFQQ+II8p28/kWftKBQEoOQBo4AVLr/3O0FYQN
 AfWQ1HVltKdwGqrT/i9k4IdQ6QDtiRKH7S4u3vTv3KOkJPhOhwmjDLyyuZJ2Uf6O9XtFZM7kO6Q
 KWCyoZjU4B1gxGKiQf3Wpgbi/l41a+dpVLt8vIPvi8N2WcP+4/J7x5gw7HIocP5/1HSHd1+Kj9s
 VEZC+g/sco3SMGXQG+gjCit0X0Uu76DOZsB3Mzurx6XGWCoFp9S9OKCxbcQVelRHnI7NLCyS6Qc
 x72HoB0mdWeT+ebyw2Zyed/9h06PH5/s4BNdSxVh1r0+7QOLLDQH0Paj7zILF5xfvBrNrAxRafa
 mJo8rnQ+FJrI0Bxj6uA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f3f5a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5Zs7ehh7ZNfAQ31CW3MA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8Wz8et-mGPDTcoFsRCX9JCwtEbmUHV5p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX/qBnZHCTNt74
 ZrNO15gvofzCFSF0X/r0aVgJNx8hj3fCPpbcal5Fdh2S3asYoAaKvTQGXDqlSWz8s8C61DaqGFY
 KTS5gKAgmgvW3qpw6XGcla2jbctn+rY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210102

On 21/07/2026 10:47, Krzysztof Kozlowski wrote:
> Add missing constraints in "if:then:" block for power-domains on ADSP
> and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
> were constrained already).


As Sashiko points, I missed a piece and this is a redundant change,
please ignore.

Best regards,
Krzysztof
