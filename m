Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524A449EA9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116296; cv=none; b=AoVJQMx5i5JRstl1nfL5MlxH2lGmjT5EvIV5CdiLP6Q+QehIysOH04jxmtJ3wTwgX031B75vUUvpImPy7xxUvfc/ghKfQaAGU4px6KJ3lBxnChY1X7YedEC5zhKzelry+b2teqCfbk2RkNMpdIoG3fg6ap/jSdJKM6DhTx5bGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116296; c=relaxed/simple;
	bh=OO5h6kdUaYOo/76RpTZOa10D0aqNOOeEePpZ5Tq+Ags=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip8xvNZDSj4kBnb9ywRLNJ7GegTA7PedYqQizt0//lNHIfyFABv59yL46SpUCQ0PxFJlqU8Ed9WkGQSZu0GVf7DTuZHWN8JUXxD+KYrPsYp6yw63QjbGGiAntqmLuVR1Z9cPMeSvK4K7ZVUtyZevx/4KnktpqHZH+wdFYAS9r5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIchG1+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/c3CprI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIchG1+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/c3CprI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd4Li3579377
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=; b=AIchG1+lfKBwK0L+
	XefWd7c6x8iWNaoXJPR3JNzBoOkr1r3B+8aWCrYFIHaH13hEd2c3QlFATjlfabLP
	oHT/VApgWiGApcUeuTBSuUxSE61gT2qRRJfXtA31Tx2NLSoUy8Zt4gj17ogWfESq
	cZu1gI606v/AZzpSKLrF7vMNuBiXD+rUFOUICK4v++0XldM1MbEtmoyaNBQnv55z
	YuzXNEN6ih4gOFDuja2vIKdx+ngcnPgRgxHy03e397mpmZ/CY9EEgANF0nXNmlls
	sPcCiqK4PVFuxNHj9BqcCLlh7Uc6Vgyr/p3PW2kYD+v9uyTyrLYptKwODdHR4g+M
	T2MKXg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk32nne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:51:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so13076264a12.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116293; x=1784721093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=;
        b=P/c3CprICE1p+vkd+yyS5kwaq30x+igI171DbRIkGWA8Asu4y6BfGX5mumv0qkp/dz
         /HQax4B/Ydou+XjbZ9rYuqC2L1br3sP9OrTFcejnldxQIk6pR9tye+93aHaJBKCuC08p
         pKWAUbwCdIfZqtK7zBtT7dBc+tE/5JKXL+1l4eTjAbls28VdslJnpjCZqtqW/rOyE3xE
         Z9BAq0BrAchqwo/6kSXz3VhAZdSkT7j1uZS3QC1xnBkXjPcG9Fu3r+XT0RZuF8geEnR+
         FMBqefVbqofEU+bdfHbTUoALPMRnLoKkLrgK9yS4PudGEyKKkHsP1XDDvhSWhaeGwB7G
         9ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116293; x=1784721093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=;
        b=j3VGAZc9Aiwd0n3moPuSa0DgQ6d12yP4bVrd7e/fZYvRbST+6sJt1UPjhHNLk+V3Qg
         0SUk1rovwDZuezFdTUkUlTNaXvdS/8SVmGXPmkwWRlyaYvaM7j8+YIaxFy3YCilnAeSo
         vU/Y0XqNXOOxyOE+w01padWSiij6BPDrC2InW2lASS2APgNbMfWwm7H4JCk13HkHfLXq
         nh7xomC3M+GiPFv2grepaJAJ+0OiLKmTbSFnO1TZz/ul9tsgoHuBFApVswrFdc5U5lL1
         ZKudQw0KzJAg4Y1LdHzpfQj8xzQ8hwQIfrOb4RVf96zsNIYL7bcGTx3E6UD3Pa3yKvGC
         ZbkA==
X-Forwarded-Encrypted: i=1; AHgh+RooiFRSrDi1jfDFuLBQfBqho3Z418sKq1IUZqaN6jGxTBQ4H5fGmkEK1mHKk8bspq3zLQXC1PFhXftC@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvL25GrjXD1mqxsWq3U9/6TkiqMveSOYuqJvu1jIDp95b+/Xp
	lQfsGE+zp8zkzqCPbTbqeLOoj1dnGwYU2oosrtRbbrpiqQEGjJ9uTxfz7mcpIAnF8rOqfGeEikC
	mXpUbBxx/xfDZp1lMX5WUxN/hygdKdLCbne3uplu/reJ3HoTYndYh9z6E3zGZtXyS
X-Gm-Gg: AfdE7cnVUVAAh/sSm0V0L/+M5yNCEM5gZZ/tXJnT6vpqIRw8zWSgOsCmadZVN5tEoN+
	rgj5BOxA/EVfK8XB6YQ/4O6lGSwS/ziuudGCDnNJ93uWTUdIu+qNmPwRxL1Mk+eUsXaB/TJ6bqe
	syfx6kn/ihPxF7UCbIgABLMmx5bHT/rUvJXlKwplknDXfTqsuo6tH1nQCODOK0j0+ClfOLSIK80
	mpNHl8T6dpdpq2mGbAqnVCPs5HDpHbkE+crzxCVntcsOOkRBcZQHaOi/PW+fdz+SFkuA9Hjj9oY
	dlFWQ+9DcG2zvirAVyyiIjGzFoeq7Bjn1Hm7CvH9sJUbqqi6zGF0hanZHFnE2YJz4No4QXxR81y
	pHkTNGDjcE07qIzkb3O5IkyDZ4S+8oas6EKB6grLX
X-Received: by 2002:a17:90b:4cc4:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e1afe7da3mr6232679a91.34.1784116292822;
        Wed, 15 Jul 2026 04:51:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc4:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e1afe7da3mr6232651a91.34.1784116292391;
        Wed, 15 Jul 2026 04:51:32 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ec32bsm614380eec.29.2026.07.15.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 04:51:31 -0700 (PDT)
Message-ID: <4dbb3683-52cf-4fdc-8b7b-86577f32f548@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:21:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
 <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
 <8b8b6ac1-d699-4ddd-8d86-9c26ee45efac@oss.qualcomm.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <8b8b6ac1-d699-4ddd-8d86-9c26ee45efac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a577445 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UlPZsjrVhAJa1NhkB2QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: MK_NDkGfmcYnZcKI90Vd-s8z5zM48OFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX4S1QqM2VwWWE
 axnKCnOj3UxC/OAUMjYsHrJE44v9P8lJj3AkPR7W9atWl+kbFVqmD9+1fps3GrdTC/up/pGqGS+
 1sCyE/t6Vkk4DakpFSHbjGQPtnRzod3lerCrNq3jkx2xp7N1QECv7SSjOpEKSNUEjbS6VN7bm50
 DNpfmYZf9JM8v5soziCgPCoi7Av+eofdjui8UHUJWsq00KymNMjga7YnB7CbF5wqGHRIqnhjtE8
 A+wfP//w0w6ablPbpdXvyTVxWlt2mAUrmLheNazt5KSg/QORMDKBIVug9sWt0TUTGDGtm7oCFGF
 gXqaFdQq/6cuRloY34smyyuq94q2NLNc+24Vr2UZjghQMMgEZs+L4U17LNBc/Xk+AQLSjXA43UK
 ZUT3NxGK+W1++CljeeMGDwn5D+tykefaQNF8CRDz0uA0hMRkMDqhrEkPiwmh9J4HCpHYQOZw9E+
 9E9Gfkh9iPGAJGBpDkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX39WKnooUNHTF
 NSvWthosZ/ONj8x5/vn0QCMC3oNuXYMDgKEbGjDK3P41OgeRc/2UngsiLNrrlszwlg4/lBhOd5J
 bkNY+I/q/nvx6jc/emtB7eHxR24R9+Y=
X-Proofpoint-GUID: MK_NDkGfmcYnZcKI90Vd-s8z5zM48OFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150117

Hi Konrad, Dmitry

On 7/13/2026 5:43 PM, Konrad Dybcio wrote:
> On 7/13/26 12:26 PM, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> 
> No change from v2. Dmitry suggested the panel driver must be updated 
> to handle this.
> 

Addressed here 
https://lore.kernel.org/all/4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com/
Please have a look.
Thanks
Arpit
> Konrad

