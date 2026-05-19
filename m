Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E949553C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190060; cv=none; b=BN7YMcwMdoNNR5BAcYv9agKX7GY5eTZIwVa7lvvISBzuuMKit/WGwMdMMKqW0fA0mEU5kxCcvDv1nLOzE3y/elsjrNOdtSq6ZfEcY7+n7cbeuQwNtt+6C+oxrYrewPBuMoFE2RiLM4gWMDfO5Yx0BxfHC2xGzs6qIrWcZXOsIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190060; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMbrZ4E1fFLDkKYIOTA5jQR+kNt+pCVKB4XJQz+BbGTJvo7gpUExr+ypjYUQVnNd4tigJuiYUiSMuoIrzELre1TIkMq/+U22SM65jyUnfS0gx1qArEi1X9DbWHtZ4pgjSX7opAk+EO7KoAV0rPZMc7gMrYtjCNXLbU7NcwatO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuTp9rRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoOf6ToZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuTp9rRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoOf6ToZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6gl8K1737092
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=BuTp9rRs5R6zT+Tw
	+zhpAUVnDBdnaDpZx3Ei733Gu8vC3HKNssbvUhQrpDdutZe0R+A11riq9F4Lq6fq
	5h/489yExhijycnwwHNqKXNyXCMsejrjYJb6zEgKH7GJSmQcS40NBichptqGrl2H
	wj2YJHUpmzV4mXaU5AwXnXQNxWpTXz14JFGmfUbreoZE4NQDbvCor9tlrydDfPNh
	K6coSxLdhqsTSPHE5ym+pBh7wuKZxgdCAHtnYcWVrBVF8GBcrMCq3Z0Xld1Xb3I7
	ip9HMLMrFSVa83nTOxkuLabmSaC3jy1/UUSkmbRN5/6S2h85tthlJXD+ncOjAof5
	Vf3UAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju915rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:27:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso9453971cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190057; x=1779794857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=NoOf6ToZtNFRW5ckh6WTZN2VK7a6e7b2sEbOxcr81efz35TIU9wO3XRPQKXWyCJfpD
         XbFAFtMb4zs7dCnU8Surav9Hj7BxOS7uI4YArlvayeOtZaIyMkCPDIFFwS7cjMhPq3lC
         +AGS+r9ys0biON08aLFfbtXoC9UI51a5ec1NpQ78yLjDtDVrJ/6LXvbM7n5AqaYHRnC6
         e7EteCdtvVVe8MdXeK0z8tDHUitAX+TmBJ60P6dBRIMf20RYMB5RMg5NVz8lUutli08X
         rivKtTKkpTAfVm3WdclTeqVtg/XGbz8z5Cpdy4zo4VOtDsnb+NevupjjBjcQxevysmNg
         Tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190057; x=1779794857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=Heh+OdmyyIvY+gu9FIJDdwdLQlGvzuFdJQUB/AjYczpdCUICRf1orYP9iZP/W4tD9q
         bDLXzqB/Gm8hjY1z24Vl+Rz7YMARlayuzu/syFF+7I9SeaQjP5wNb0RGicaHx/sdPC/A
         zNaXCp0GybfK0zYaufUYo/YLDCNJWGYAapwkrjPvfg0rMRuscEL2V9LgrCMqY8HO1gOQ
         oaAT4WZ48qZZfj3YzGfMHK6D59QszGcl8gJeYbCMC1SKrGxoAiqzjHC+1vCv39pBSWev
         AGBUX/S/UxcQN8ZvLdMhtjaBoFkU89St5eIt41tRMn2F56pDOE0nNmmaoI2X4ndU+gRm
         2CCw==
X-Forwarded-Encrypted: i=1; AFNElJ9yM8r+8is0BZOtnLIP4NyS8+fdAmMZOIwXbRShSx9WhL9OeqsLprHuWwMn5XTmNZa6UdPyqgRb9yTX@vger.kernel.org
X-Gm-Message-State: AOJu0YyYC6oSQZosvbi2uaMtjShs58JFS/Epu6cLq8PeswR2RZeDRwhM
	2tMyASpFjDhB0DZA+NaDxhcnCeN5SASFDWLoMKTx1iGr1ApPdF6SJsCWo05L7eWRU7+qo//nU+i
	ra1Tsb/rw9Io+oaW+plUV7glcMXhv4oEGGKRzD/HtqPv6AqbhOVlTBC9jjKoJDBRm
X-Gm-Gg: Acq92OFTsWNKWCU/p8LHXsn/xAfPkr6upmh5nFbRyx8cocWf20NgwidDsuogkWajJy9
	VTCPrx481M/WNm+uYJ4ko5lIZ0UkXVF67XMQ+10R3YN4mSdeljdvHKLgeUX+59v9/Fc+dxFXHui
	el6+w4/CPlqr6ZN8QnS0aMfIl20+kL6T7Cao403ytm/f0Xqqkzf16rKCQds/nLTW4FJ0JDwHI4R
	s8aVh4C/TAyPFUCfu0bHaumi8ut/JaNR14lLJS9k6Mug0P6mDMUG5+J1A9P9L6xY6doIl+XesyO
	AnpdfyVMEYBAeohRhg1bKC7xHmmiBsi0DAFLRaftejsfmS/K/hXh3bElzQ/jRyvHWlY4Hpbsnlg
	S6nywhNUAJTD1jIhW0Wr/CpE6oHK3CsmhyFKDSIYbnKA5Adq77pD02Gl5sfXRdBr8zlDbspr5q2
	6MfIKurJT1EZz63g==
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr169080081cf.3.1779190057553;
        Tue, 19 May 2026 04:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr169079661cf.3.1779190057120;
        Tue, 19 May 2026 04:27:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm6307250a12.1.2026.05.19.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:35 -0700 (PDT)
Message-ID: <68b28b34-ff44-455d-806c-d1a7cee44a68@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gvjAhGmP7ezMIuaHsPfilKQ-ebPdM_Us
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c492a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfXyDRJAw0YWgiX
 b+SotvOeqaSB5w4F0g7RIJY3qiirBSixxj762Evyz+bBWzMkv9RUXxj8ToRzE8jmxkzG0YpMkk6
 sMa5TEsVlKyh1+3g6sw8ql99s0GBmy9KL8/qhvJF5ATJjWd2yUqF0WsvFIsQyJ9I9TXmdsl89+G
 enGU+X6yD6Gunev1zFhrAGsAU8TzxIHIQSOWYnmF0DiI0msTH+qE40ursy5pyzuhtEmmoXyldSe
 91YEU0d3MFABNZxFXl50sdqB0CA7fmsbdRqABFAik/jNHzEzHDb8nDdWuggfXIyHcjm0u6CpY5a
 gUZ3B8hZNKjkDl0aswwtxM45z5taVAYwL7Co6Vnh8s5XSVjhl8go8fuGv9lfF80JDd1HQZLhKtO
 nL3DJbYaJnykPMjT1V1TCKuUPaUijOqL9+Ft0kq1pk4m4rwbPZUNT0QcryS6oWjCnHCunG/K38O
 VQ0SZTcwbnygTep9EDA==
X-Proofpoint-ORIG-GUID: gvjAhGmP7ezMIuaHsPfilKQ-ebPdM_Us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
