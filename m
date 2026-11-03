Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699492;
	b=dS5pd+WuwGbx3LzK9GOwnpbSELNbH9vWaT+EYlo6WzGfF9r0ULKffNYuEoiylNaRfMTo
	 lKU+WXpVpkACAEcDIR+YhZ8rGsDvVr8Xzye+O7TEkCEgfzcryLhkP1iXmH7aD7WLJkF6T
	 KTWJ9z6uoV/ALi4ChQkZdefy/hfEGMI54FKSSZOyLyFEviha2Qy120JXG0dxo+zx7panw
	 dzzwAL2ZV+hZWb9ZTGiN+FeMOkBYxNqqHUQWHcXWtp+lltWZGKSjpuNkINT24PQoMxB81
	 mFodZJCLYCwT/U0TkSfMSVVfZJuCAydxTNczT96Wonq/sOrTHAuRHwV4VmjOcwC4Y9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
	b=uFZzVopc90XRGQ7v2kjkneJ/iDe8AB4njf0pXaZTEIKJMhTbWcscknpLRbABFFWnPoaO
	 vm+7eP+8yUujglrCUGiIi73yFtqLgiKOtEYNkO8NOpok3mhXd1a6+RZRl9LTu1AkJ7Y85
	 w+aqlUZwKQi7s890jQ5u2Riuf0S3PZGVqx3d8jwBaCycvZI1/fgkdOcvbD5qgdWmw7Ubu
	 nOPYs2UcHDuWbbuLyiTJ1l3cZ/uSDns5Np/GYGZjeXoyiA3cU7BWA9wnWwZ35PD70WmBr
	 JkkRL8Txm+pNJ2eYLw0Po7e75irwpPrYZr3sSE5yEIAPKZJvfHJjjLFfUFkblJNp8wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CD606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0CD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38bPpo2106752
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ndhs2gPZWQqMxGEvtstXED2i
	vhl7ySi/UCRjgZTdU7I=; b=GLY6HHxEgQBey5ncZnXyjc9HW32D04TovwDXn5gt
	m4tllotCuGqZnLA07vqzTV08uBxlaJe7GpGxQMmnvDiXjvL18OKxErsSjS7dijw1
	yutbpVNjGLfn+TjcFLlUqeyUjFsZoCPTwi+ac6X8VKGRzmiolkIjL8QDRihA3P0y
	X1joBtsE30L4pTvyxzCHr54wYWLF8rPQtY0Lg5uWsaARO7Tl64/zZrBXjSDfRiHj
	Z8/EqW4HgMiT5CzkTkvVSW23TqlOlWXIuyOwUp5QQU9gELWRx6S4sijd4bQycp/I
	sX21A38IVAt7+f9vQQtlMTrl4qtMPcixR937hRfrzziXHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99mj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 09:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so455378085a.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699490; x=1794304290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=PApfJzOtRCVsmfIPjSOsNGMWSi+3yAu2i13NyBDgEtBoBWzZ8c7ceTAmJNXC9cgk3k
         +nopD5lwiudWr0EV6+vUd7seCFk1GJMl9P/zAR8Bs+MsaEU1T2BvOhr75fH2Q89abSnv
         0Qru2VlUwLVRO3bLjmYXQv8Pz2nBlD9fW64HURelOvvvkAoFJfQTg8Ft4wyPOmaSrjry
         GZeSwc5iFcwN4i0bzZLVIaAZHldff4sw2cmWzmw1dX2KP4ktbhOQRHLO9EW5nMOCaj2r
         AJniB7RMRmo194urdwPg6XUqBaaHVWRbBk4YlySkHljwebIEBtA3J/18H69KqCWRexsi
         sz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699490; x=1794304290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=2KRquJ6ch5QoCF+3KnMyN5Ejnup8hmPbg7wMw73vu/K0MsQgEA5Whh1NtGNx2iotJQ
         xWosmndb3lUAWs3qNdpMMGLbHoDQAj2+UXTxLaSqq53BfjPPjRPiDJK/8rJ1/714lDQJ
         q5bnxlkFUmy5oPrr67qZcDwJH5ls0abr/Nwn4sabExcGoBKGu3S+UhF07KntAihQI8gX
         3D93vb7JBcfB+dwzLNpvsA1vjQPWrCgaoZyzCWbFwX77YaQq9rjsToWlKEGgHIUYUdkF
         tOxlSgGCS+1jOAFT+x/g+i7/LPl3ALX3uB8qs1/NzkALMPRN8fqeHz8PR+jy9wyi8jFG
         wpvg==
X-Forwarded-Encrypted: i=1; AKwUvBwqfOJzMfF73OYxMxBVfOwIGjL+mGrbTnFgLTWpbL4YrMgUqVysZFb6neuwbY7YusLwdaOjWauAifwy@vger.kernel.org
X-Gm-Message-State: APuU4Z8bF43bdvReBzGiDYWLTy6gUqRpPjigi0X8KowO9rjdOWFvWca0
	20rsWS1xf5l6/Lf4fAONEn+9120PXmlH57hPhv2PGOWRJG1lVCuwttPOUivpDVpQm4aYjkbwW8y
	e7YdrbeJURVnsqMvwG6m8EZ51a/JadsLkYvm8Ah/giV5kD9UUT9Ubc0wuh06OIblx
X-Gm-Gg: AYBFou2dY6FEtFjxgckaI9PsXtmZl3WW1LwHUTTmPJ3hbYWydLwjXuViOYkHDIBjz2c
	PtimAEWf5y6S+BxD/FEvcpnFTeVmRjwcwa6ox8PhWOzsKv9HBvm7Hmnq6PWTy9MxlBZ0ZKK99rf
	J29W0d8C7GoTXEw7vLOEHTwAl6TIYmrYeRqIFmA6pco8dWWRuUGTUVqQGglHuYuG/fej+poekUb
	93xwRXuYNc5B+fK4Am0HTkJ3t59LvSVef5D/jXh2d22pJY0NSyQSP5mbI6Ib+cnB79IxLk4MKcT
	Wp8CwnPnKCIh30gXghP7r9VIgmCtQ2KSK+8cUsYQtTW45iDbA3pBqyp37UbrBSqHCHUsFJCuVGV
	P1X/enJ0InE42as0ZwiebPCxUVsbswugtf/7Y5jKdfX/rBa9FLeOALtzFb5T9ZOo=
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014617385a.63.1793699489805;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014614685a.63.1793699489133;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm2186495e9.7.2026.11.03.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:51:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller
 as a Type-C mode switch
Message-ID: <6d6aic4idenq2keiqa3jngibrurldo3krytmvjovudo3k5wlmw@zsoujav6f2jd>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-4-26rote@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102215121.738-4-26rote@gmail.com>
X-Proofpoint-GUID: cXn8YiRQzfyZSEKOQRjT1U2sNxO96zY9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX7sxio0odFdqQ
 AYtiuKtIJsSzGKq0m3u/SLRJQOR7EUE+6qpOvfya9Yp1IVFUTu+5xGch2LqQJFj3/LMnH5q16R0
 dnDmxTnpOQxUyrdD0nLuBjPLpspZfIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX8wFiLF/vYV8b
 wBlWbDsQP8tTi8cF1WS6Grfq6crDRNoK9W6CfBQJXvnUTtm+hEuLvmfUvMun8lSuUSs0Mrh89UO
 oM8UQsGnGeIfp28T52peCXL/SyZgdWvxEBnrJTKUtsC8+A3GLPo6uztiIBnGdI3rES4DJy+QRWo
 7rQs5Qb4pWITbZu+VJdY7hb7YqbcUR5FfkAEhKSZmOShdqmGVWaTg+CvFnfKKmUa/g+riZEVE/P
 O/zd7Y8P8Q36wc1j4j3/siQfG3htuptENS2AP0nK5OZ7IpLBTwRLmy2UQWWqisTBRrlX3kpUXss
 FFts/+LnH0Y0hycraK7/U9wU5r6QW0Z0Si42XSct11mRV89rhEleWSvcGFygh+DN8jWzk+yQVtB
 dQ6vbRS5ndLwW+AH8Sp9Hp40Yu4t+uZywdUtIA147E3Xfa0XAbNFbLuU3HHLUuM0CPvDAQBRZ2n
 1DMxWX2FaArYoUGQh+w==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9aea2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jTYuYfucqK6tsm4y4RIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cXn8YiRQzfyZSEKOQRjT1U2sNxO96zY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-03 06:51:20, Joonhoe Kim wrote:
> When the USB3-DP combo PHY is a mode switch, DisplayPort pin
> assignments C and E put it in DP-only mode, where it stops the USB3
> PIPE clock. Make the USB controller a mode switch as well, so that it
> moves to the UTMI clock first and keeps its USB 2.0 port working.
> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
