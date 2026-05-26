Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A63CBE79
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781191; cv=none; b=LbAfX5xDn+/R3TxOxU96SJd9+Rw9k5cVhs5yh5T4yrfpEXasvy+iLjsfniO3tawxSLtXopyaWRmBV6xZ5xo6/9AvvfAl9kHk485go+5+FJ80CmIELKsibytTShwoR49mSQTsWNcGdq/HKVRnVgrh/g3qH0Oqr8tpylcBrz9qQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781191; c=relaxed/simple;
	bh=FdvFLx56c7j4Q1bvSn2/18ZU9bHg+n/VpOvn/RXofA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezwpBIGbSLuTHvNTbXvnmU8WHDRkHClL7APXTtTWGQ8s3pQXs+DtXIIxeF+jluXZrLGdL7ECXltD7tGwy9XC6q2Ued5lsTvDgZeJTrLREgLNytb2t/tbq4eesJLKMXUWQ6i/njgXotmpGohqR463+lBX3feQ9AsukC/r8jLcU8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSY3cwxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQBJXfo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSY3cwxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQBJXfo/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2a0IZ4117577
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=; b=QSY3cwxgSSGJTRXt
	j/6bxp+r29VpDDBrpRD+5yf1c1k2pLT/RPzuJttQCH8Fvw+j4cs2//QG5C55m40O
	LxufqYC2pQVing60Vc8Jq/3CWEZnzNZEiBInZlsYW7WIGWjHLkETeLh4rUBby0d/
	dyzmaZWXtHwux5uU65uuhoxu4EoloNfq1p1NXqkOiuBTW4QyWwZmV+qr7TruZl4z
	CPm5bBiZ+77fqHsf2hQGFAZfVrjjGdNif4CsAogc7h3I57AadI0d65+SOGii2xcU
	D9q0XEBq3JSiWQbYXOzemWjX2FMDvAQg0VaMVfZbGCivfn3zYlAnd8lkppCy5ods
	8p60YA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudaq3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:39:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso5292987b3a.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781188; x=1780385988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=;
        b=FQBJXfo/ClwcFVq31bBUw7Y6UXAN/A6P1fbnnp00WzNXT6g8vMF1T4c9GPpo2u4Kug
         aHlgelcHcjpagPMmLc6cH5mtxNGygU/Z/g48ykkX4yB0+PubpqDtz4iXzCtdFqfi40PA
         BhSJpQOV4r1z18CmXy2ZXnfGJs23nc1bb9wcsUTYLYeZbchsX4FYJdBc8Xxt2yJ+drZZ
         MH8J8jrHiwkyplObFGdHLsUPEUCIgQEZqlx521IP5MIu+FAQPEVv9il3fC1mJ687Bgk4
         1Ju3sx/lOLXohOZIABF6wXUHHFgn444NIDN6R5KvL/o+McN4YLFDewpC7GRGKRINGr4S
         kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781188; x=1780385988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66VnBCRfaV3S13YsfnYItuFJ43CHbHOZn64Dn/ru2GA=;
        b=Q8jZ0k/PsAoDzmfbReUT0hK6DM+ExBvAgTbJ3dtov4DmxrWxtLV+cuOQZB4PYlw4mh
         iCU1SbwB3vwieOf2f4yoG9zoNJQMCdVyy/rDnZ7ncS8lz6zYYo9nf23dQ8kA9aE4IJgU
         vBBH+6Phw7cUB2gZ4+lBHeq7CKIs3rnWMd2Cx8mpawu+fIkufAx9Z5vAfKYS2x2UuB6a
         VNYP53l/C9QkzwdbdctCNEch01Z3+KYRl4Yi6fSL82OT2mL878bZPI9UWKQsgkke6W8w
         R+6rR2jmE2Hx8LpI4S59otUTxF2ri7IxelNRD6QXCNanpgqSIrK1IvwCqyJoi00kW+Qx
         x10A==
X-Forwarded-Encrypted: i=1; AFNElJ98m4De2CTk3HKyufv4/B3Nf+u5bTwWzzLtSwx+u5Uf7zXhFNIJCxokLCvsRmP+iOyIk8OtpzgFLzPd@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2yUvcO6xOtCqxInqZjTshZt8FTGfD/h21eoBw1+9WcISeVBy
	YyaBenKFwnba5lLymmqB7cv7MAKO7aeBRt6EKsTfZeCglUHTGbF26MeBeyxdioXs/5jFgH1XfTS
	MwiWaysWQu/8S8wkuqoLkOA/IepLaJey/cd7bvJkMqqQJyyvn/HBFFJfhbHv+xp6cXwm/COm6
X-Gm-Gg: Acq92OFvY7gTRrElXvgTmW6fscP1ZdYJ6pzFXb3KHfPHBdhUvamy5J5cpdDID3Ebq5e
	MA+N7q6QtxCmcH1io1HEeMidf6EnUr55W7ifZoUMW3Ma7MqBO1i0YD5q5uoDc3smJSKzA/WHyK9
	A54l4aYYjgsQ0U/ArD1a3bq097fQKzBuOeCX/MzwpVO35vu3pR5G3mffn1zUR+1Im7Y225nVsYw
	kouRhjIM9VxytElwYsv3Z1dg+om27VU1usNWEw/4Wo6wge0dmyc52FikBsfjExkSe6dwYfSUuzH
	V/AWyX0N6qoutNkeehAgQ4AMgdiM5rW4EtaeGZ0XFdouNNXFEu73yZ06KJ7lh5eimwjhVRX6LUE
	sGPfbouhBnyTg/X09DEJop4VlApkhKEqGA2UGb0DeL4wrdG9Z63lmQKnMbME=
X-Received: by 2002:a05:6a00:3498:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-8415f0387a6mr15970043b3a.0.1779781188489;
        Tue, 26 May 2026 00:39:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-8415f0387a6mr15970019b3a.0.1779781188017;
        Tue, 26 May 2026 00:39:48 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc6e8esm11131575b3a.47.2026.05.26.00.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:47 -0700 (PDT)
Message-ID: <a00286c4-3caa-465c-b174-928cae3ca3b8@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
 <20260520-calculating-ruby-pudu-1b6ac6@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-calculating-ruby-pudu-1b6ac6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qeGKJvxT6Fa4qsnUjrXDKfH3ZCPYs9s3
X-Proofpoint-GUID: qeGKJvxT6Fa4qsnUjrXDKfH3ZCPYs9s3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfXyZA85WWYTrfd
 QLFI0vHvtziPZ2q4r8OziVb49004ovYqqlVjN76wFZvlmCb/2UQZmUFR+csJb9ppODjq9KbtBm9
 ttchdE6Cnf+9wDOkHYWznFclc2FGZ5IjxatYfAk1GhdME1n4FJQ0BKwj/5DzqUY0RTXLPdv7tVU
 kGlZsGs1Y3pEMycYtdr3P3XaAHsQcEe//Vct9ztEayAuTbYeh2UpBHgFfKWDoOou/SAitmcvB+b
 5jEYJQxUUtcZ0aJ8XqfElSWFKLLmS8EG/e3K5Zf/k5Od2JREmzgrybq5WfJLA/dv0d5pO0DsvCw
 j4GaRXuJWtxYos5c7TOiS3owZVMCDgL1RVK1dD4aWaHX3YX2VxN0XPLx2+SKMlxJfNgkxwgsP2h
 0cJ8o634QuSdPSG/3XnCKbD/y6gu2FOVeeBQaGsS3GK8/ZqVEhy7TT4l5spuLkBwWfbjneeLwXw
 facxKW3a6GewyDn69Dw==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a154e45 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=2VFAxQgqWxs9CGHwOvwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064



On 5/20/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 11:51:05PM +0530, Vignesh Viswanathan wrote:
>> Add devicetree binding documentation for the Monolithic Power Systems
>> MP8899 PMIC, which provides four synchronous buck converters controlled
>> over I2C.
> 
> Ah, and one more, standard comment (so you could have avoided that
> easily):
> 
> Drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Sure, will drop the redundant text.

Thanks,
Vignesh
> 
> Best regards,
> Krzysztof
> 

