Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F710395AE9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427419; cv=none; b=hBhwajIcvE2Jn/SSH2tSDSSQ4XAR0mpoFliyS1Yz3XfHYQ1sVwoBFETxe+8OYleiZbm3tA7Zf5kPi7qzGKmJ2crlhtbPoj1kvhth+adUDvOKQdpiMFw0on9RO3kY/ugwQCIjj5yuuqmXIvFUJQL04g8j5jyM4/5uOxcTPbpCm3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427419; c=relaxed/simple;
	bh=jPGxyZaN47OWHEnJ1Qeo4cbJKb/i6RtVzZlvRGOu2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVRbgdLMHgpHZ2DwnKF19nFryAkKmh8TQLTM4C1m4uIdJpFQ4EkFwsWb4497wUozFxI9op2rpcTK7YKwXGWbeanS70jhr/CEEVeLcT7PbWDqHdlTt71eePw5xT7ahnmdqiOAGBZYduHW1UQmg2Hh9o4esX/FPoyifoorBRdDkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUGke+/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaDuYsw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUGke+/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaDuYsw4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Al31158710
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=; b=NUGke+/cmxlgZYfR
	sbe3UJhvHNCcNDelA+O9xetBiJm49p6v5XyUbQC9/7rI2QEL61gIu6euxFT05QPX
	jN4vxsrGjE9Xjbe2Qo0BWZmLyD0K3Jw+AzSL/Hu+jLP49dby8AWbxZ5AmMMAPq0Y
	QI2kpZ5YuNvzeTF0o22cPxkjVOWeA9ar1sBDbGH8vfgy8VoaY/LUbbBLKjW5Mdvc
	LZgB4QRZboSIsuP0Tj7AP2nKfQlLBqg8kFe5P17r16QAF+NKxaBppc9Qofa8pq6W
	/oCuTribxfqoCqE+mUnzUiMpto05INmZAmxGLOj82zIzQktmnYHpvKTwIDF4aV83
	PhggGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnma5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:23:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso51901985a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427408; x=1789032208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=NaDuYsw4Pt7tb1+ekRIfRZHbbkOf/24kw34ENnOI+zaN9L2xkJk1902qNWvCkwXyFO
         G/r1MRuh7MUv/PU3dpcbwX0s40aZUNTyWc/NB8sO0rEJyt0iUDC9VC2pVwpstFD2xZvE
         H5h/2WPC5B0S9TLmFXz7Py+XWxUQdUTnQ2xmAJ0nhkZjRoVrfKcz86uyqb2WNfC9H9s9
         0jjfVdIWH59EYdvU28lK78nUQUmGbBLUXCCXxbWNFaoHRN65JolOLI88t5PejhBqCE8I
         0Qf8LApYqgsVFKCK45XeBBRK5c7AR3fQgKJSTOcKjg1gbsO3z+y1M+hPyWFk8LdP8OmT
         bnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427408; x=1789032208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=rCp55YFbps9iO2uc3y5BzSAXtc2CVfuNsPGAOkZGaD0EjrG/uWNNt7pUic+ZYDYyYB
         9rKB/ehu8pT8tGOWzybixJSKQ3UOzYMmZIKKfDsWsnOQKu54uRfdOAOM5y1VXQ4dPALj
         8V3yZ8exU5clNOrgrZ60Ms0sqqi/mTPBYnvDp7R+yW7R3fHp5tZO1NSHF2xwUf3f4acJ
         oZjqVR/ZG2hcbgEuXtmDd0akQvB1gXe4jcLfN2dJnI/EoVWXJTmtNhzOSXBDCRYsWEDF
         SV1NhqGJHO100J7UpKDUB8ms0Nf/hTyPxThXdiV3f0sobi3kgyCRKG3G4pdWcSbMyjuG
         ToOQ==
X-Gm-Message-State: AFuF++nLs4RhTvIuHA/CGoa3JkpnTMJUeTgKc2MnZjtn14xZKN+Eyt/C
	RD0hRcUXOMpa4WmuD6gKErJCEIM4Nas3mpjOlEbRQKuQx65O17qTFPa9h8S8BGVKYdkUnwPRark
	t360DzLSeRs2i9QRIBYSlc9g9vMRVPZJfpQ7f3fyOF0V9G/6gMzk4+WNwkKT7Z6ux
X-Gm-Gg: AYBFou0k/YT/k4W+yZucVFNnr2A6xwsGWacU0z5IBDJYWbON2i41HIBASZdUUodyWcl
	7nQPtecu6yIN7nTj9vrUpVM18RE18Wp8msiR4UA9CvS713kS+QCiIiZCpLRQXJHT5KB6l/jMlA2
	zdqBM8/P/9s4kWMJua9e2V+gNNXQrEcTvZS08/GqeoT67yBR6DTm34uuBZpCk+Y1ALMfr4fm6rB
	2I2DJY6euuKfEzvYAfymi+sEnaldb0YT5ySqAfVZ0+kgs/lhD7Ww3mSMsv8LUQIE7u9nf/F0+1i
	oelI0INhBC7nQMrpVIGbmehW5yaKbWsbkkqevT+CfUXEmkX4capKiJ4xQ9fxgWGok2yxSg0PR36
	IB4+r98VW+fOWisA2hmz2ag==
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808295085a.4.1788427408604;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808293285a.4.1788427408155;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm70787166b.60.2026.09.03.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:23:27 -0700 (PDT)
Message-ID: <92d30223-26cf-4b92-b7ed-11fbc5bd6d65@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:23:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2VnDaMLvXh0MLyy1q__T8M7caXaKXXa3
X-Proofpoint-ORIG-GUID: 2VnDaMLvXh0MLyy1q__T8M7caXaKXXa3
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a993c91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6d4l0p3RcBnI2BkWs0gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxMxvscbmP3ys
 UB4rcd54mIyTlA5A13prXxd+jnf73UqzbFfXmcF80XwxlRNC2AV7Jl1P6sZ8/fD0Zf7XmMEzVzj
 GnozzP6fY8S9PQpSUCp5ZH06geOiKCC6oJ2iUXUe7bk1NiR8SRafK4mjrSmMz0Tup2BRZLHJG8Z
 pUSpnJr3arIxOwgWMJ/7jrJvYZuXBe4sGzE6a42krDfPQFzJZ1rW+e6gjgbenEnaRRK908L/5WX
 0dKvQ/3gTxY5TGwrBQb4R/KF19Fdf6wnziLBJYMOKEkrGah2Wfmt4rd7QO2hcCWuiGPLkjuU09m
 /JgXCH7/Olb8dL3xLg7/AECvPGRPXjXEeI52xp6Ay4CKM4aHj3JkYPoMXRzTexM2DUBxqe93aJi
 5Dn1RFyoHwdnAYQnov6UPeXhHjc4j5OvS8G+Hzb/1vfQO9xSL8IEvOFjL8xPMqY1r/X+yneMBnX
 YwAaOYYjLnuH7VNVuZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX7Jk96oudFUdm
 I7u/r8rKTGUPLjpx4mfGKB6TXTXGmZH5MjetZbOxgSd8M+2rc6IUlTs592hI3CWKiDPqobA7THj
 1rBHHTh7P/pGMjq0cwOhEZsye1wwfvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.
> 
> This is based on the support by ROCKNIX, however their history does not
> show who the original author was, so direct attribution cannot be given.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
