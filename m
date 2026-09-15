Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E8356779
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466686; cv=none; b=P4wAX2Ck+OoYZE6FhJZmQ0XElxyeKVf2sYsEMsCS/C3zfx46kzjfUopHgRtcemsYErqkaBAMBKVB2TvxWgFx/9yG9SkFRQYZVAMuvQoAgMGuRRKBuQ/YBizMptfTmiEm8k8oZc6ztdE29RxATMYZ1nyU0bSDeML27ru6F9ojlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466686; c=relaxed/simple;
	bh=PteV6l7Bxzq94VN1jmz5vOgiHEW3TRNyd88pisBgOaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI5Ktq/Salbay3H5cUAFJWWDhVZYFukT+WKCnAg1OEAXGXK/arH4m9jhsL5FZB/Y/Bg1Axrs+u82M/Sarj1oY44zGely96iZUaXqC1+O3YC+fMWyx3l2hvqzGnxTxuhwtaABWK9Gpp3xSfYqAr7WzmTonMRhJHSie7cuAuydGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+emWJZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC8yOSkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+emWJZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FC8yOSkW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hFTi2833254
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UleAVLVAdU/hmYZIAkmupw03
	vXUyan1+fZkjxbM+C1k=; b=a+emWJZZZBJHcidphzH6jbNdZLftPgClo+zVssSm
	3+sWgL9KSYkWpLjtn8e+T9N9u8t0t9nJsdlhD89oP3bhssWnRWJge96ajaQeowrT
	kwP71zhZso8gAgcjU941hy4hBARBVAVnUsEfIzomg3rljaeg0GO+sEk2L+wP6TmI
	tqtxhqm9mOEVmbwuJ681LLqktYeIRPUgmDzywwMavvQRoYuXzRYdrv4CRvoXp5kT
	DtjWFWWK3KcxB2Trxnf0C+VmXPP2WTczwdNeg1JSkYOVs4MqyMm+BStJ3eBobJoM
	fGlXiS6zx1TOyMB51AWLqm5MDB8QzIRnu7qaaUXM7RzRmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd98k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so663903485a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466677; x=1790071477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=FC8yOSkWVpqml5R5Hs1MiB5zf9/63niX+/DiwM+RIvc6/6dBw0U8JMsOuwq1tHebzE
         0uLBr/pwu02c+KxIkRu3mumn6XhSDnE+514Q2FK1kx1n6tlyxxX1EKj1APBrsjub2GFa
         lHL0ENpsFoX9VLb/6SAEAsex5u80qmeCaf0eKNln2exs6UIyYFzWAjZ4DX9C3zYec2cO
         fLAYj2PZz4IDVRPVgstaK+aGNjMUP73tbsrNPSlxSb0q7A4PlCtKAszvfSZL9ET0WQQv
         8vuyBJmECkxQ0a4SqK4nKNcX4AJjFAy78XQ5WW+szNBD8tgLVoP4Cl/utZpfiXByVQbZ
         c5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466677; x=1790071477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=m78Z+ObWBBQILoqfy4EejOZnT9j+TGrzfXguocv7ws0hniZZ5b3ULCJnoj4FKQ0uFR
         Le5rRJXMox2NI9kyPY/vS2uk0191lPYBh7N9d3t0p3MAMVu+CkY2S8AaZ8iOzqfxFiJv
         AwuFfcFYcPjCqUUvgkQiNyLtJTZ3BHi0EEOA7KYFNIHRWIy6SeXo96/n/ofY+14yz0fL
         odis4LLm4xOQaXunqZkqMV2nezrVTBMJ9TY1e8Fa5S3G57Za8w3vhdrl+K8R1tAB/Bui
         lWUeK6JDntD7DVoLP/NyMSwatoWCC7tcYit8AbzFQrEe+tUir8SU6ix/j9ThsKGthimc
         p5Pw==
X-Forwarded-Encrypted: i=1; AKwUvBz5zD10BatEvuakLSXjmA3mcCC6IUqlyUOm5JY6xBfqo3UQKJ5SdVXSA/gvuO25rsiCQaXpgdnGzRQC@vger.kernel.org
X-Gm-Message-State: AFuF++merkdoyrXuNq31EZ4OJfKyGwTkFz2H+NRhJCYrkA1qlAZ1RjGQ
	5OoaxvRo3UWjKAoHoF1tGvLDf/AKDM/YuvASmh8kAXYEspnxtSknBjwDNkrSrO/iRaNz897Hs52
	6U93QEIme3mVViZcxjiqqus0pzWo3ks7MwN6bvYVgqo8qzMMz1AbCPWzkO9iFnafF
X-Gm-Gg: AYBFou02ZVsBh3DUPEYF/sa+U+nkDR3ekxxmNg061t6CCYWs6WaBmKVRchIRDEf/hEI
	FOY+wciE7TXwLotx+mLjKICE+lOgg4aeZAe4CxePvtBJCU7/Xb4doCtoORxNFLME3DZF+8hWJo4
	QSv6eJVqW9maIWlE51Y5R1/p6Bdn2vYYw5P8QmlC2fcIm4AwYFmzCnff8Dqp8zD1qyP4jDY0Oi2
	RAmnHycTOX+itRhy5lOO2F5OvOH/O0TjXTTLlTCpli3GXWLUGcXCRi4DbktARq7+bg2e5O6kG4C
	dgWCBZ3B0PchraQGNzVC0mbnCxClsOyhdOJns8IHdgQ230ZKbhunDIKf7ok8yWYX2JMcmI6iwfL
	DOHpWKDVfSpDl0Fc=
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063041385a.2.1789466676871;
        Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063033885a.2.1789466676279;
        Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm70213915e9.14.2026.09.15.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:04:35 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:04:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Message-ID: <mynbkpoab2rwz7b4wa57jvw4q4aaye4xc4uzedzd3hn23lmehe@6tpd4o4gz3vh>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX8UoUGZL7UEji
 s8c67dWo/hNb92XwmjPw55JDfB16r599qeIpp5JtzLA/BRClGjgQ4ln32T9ntXhHKEu8JBeUBeR
 gzqqwvUXPiSqH8y9tTU9V8RI3StuT38=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX6dTwz44uc3Mm
 Adrg04oOMraFOpBRAwLZ3cGzABbObsg0EDySMnFWXV22Iy4NlYfRJCDWhBK472V+/iEH1gxE/7K
 U3a1Mgp45J6xMPyqA3e6+UmRbnTT1M0At7KJIBRyJwqbW7fBhUniVXoutD9uDqjlqwLVLXG5lxN
 vpqjNtYxdv8x72b/DEkg9qfTMFtkfPKNQzu2Kgum2xIqxmOCBz3kqPNcuV2qaFrj+8o7QdTXmiG
 9EiKa3E1itWXI88uyVPevMkCovinDwQsChlUBBGdy43DtwZmwPv+mu2fqS5VxjzQUUUFqPsG0xi
 DwSK7rPEaDtCMpMkjtiveGOL1lIBTlHh5oFnKMVlS4rll5RAj+YLNVP2OuJaS0baT8oJpHkqf3F
 MpUnK41iePnMgbh7ECgcNSoEJ21iXT5mG0hO702BtagaElpfpjLNeOJfAFGRGIZ43Qr7xNihwmD
 yH6+xi10wsGu8DFR66A==
X-Proofpoint-ORIG-GUID: rnJ7tLDXnV3mfgdFrk2YeyFsQ1KgDBfH
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa9183c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: rnJ7tLDXnV3mfgdFrk2YeyFsQ1KgDBfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150145

On 26-09-14 16:37:49, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
