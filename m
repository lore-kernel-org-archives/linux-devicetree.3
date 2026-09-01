Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D733AFCE4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272055; cv=none; b=CzwyTuGzb+R2PZaexp7k3hxdv6gsmSZpprl5WC6Fufbz/NPAWWinwe/sCzX83iLjh/yPRPXnDaLS2IG0k8lGvl4l0WDYa6o2pylzixbyVtq3PfZqb/jX5IC45Dq6T2nIQVT5VFl/qdKFsvLaw1OpuRi4rHCYi+l7xpchWF/9KtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272055; c=relaxed/simple;
	bh=vMnnwb0rO3eK3ov6NV1/rxMCMSwFIvmsP/AaJmQCUL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcCaEO1+rPV0QYkWveZfqE4vYJh0SVTi66NsV5LWbNfQ6VTxkL14H52wcWicYyUbJsnU2ooj/VwVxqazg5Il2vlIQsVbqr5s7pVJSrQaxWsZOj3mCBxFZ9bcjy0pdMmDSl7a3xps7XzULap4b0mDje5P7Rz+URSFS2hFLGu7C7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvft3loU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPr2nBbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvft3loU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPr2nBbC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8fB52825118
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=; b=hvft3loUtTLHubGB
	ThFXEaHZ8MvwO4iDbUk90nZmCRgQSABpUKLQBlPcZwC1+bFvWajY31qsZSbl7hd4
	5S5xSVPlE3ejYacaOBHgtCve7kBV+D9+NNRCKF4MEslVAwAMgJCcwfxagSFmLwEK
	hYzBykFfQrIuB9CRWkIFXtuaMy5/8A38s3WcziWqqooKWBVY7vNxIiNLvv6z7REd
	SjOvUpR/aW32d9RtWRa8+IdnklYVT6jOQgH13AYW28ICqgzc82dRsfj9e39S3dug
	RmgjY7+53h9HFlKQXYTAKcFTjmK27htCwJoi3cIIu8IGRxLy2MKcYbsKXzK5IG7p
	FmoHrA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cav4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:14:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65904ade8so124247e0c.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272053; x=1788876853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=DPr2nBbC5/c8v4n9IvILJCH3yjsXQcTWpOs/sLk/Fw/FFgVyzQ5VJwyIC/C6UV+b/I
         JjH1DSxiry4wOJKvM/4f5mWJhUYViPRDPYMTrCVID0lrXoZWCBVNi01UxPQSIU56ptA3
         3+CTyigdtGkFKuqMptEztUy0hspk0YanCnH/A2fOKy6RqhcmUV3wpJu340cTGBXToTub
         An8RkZOvXOn7v8fjAOsUpz9V9onyr0X2kqY9rc7kamv9kk/i5LTzDgp+6d+FyqNKUYY5
         F5spiML97snFRGFbbhJ2BBU/6rzmPPBkXcvOUtsbo5SG9MFIBWrA4QGnm1CEMe4Al2Fc
         iGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272053; x=1788876853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=ZxSxhs7xu7KUj5KQyPEw2A56fAqxNl+D+D86pjwJ4fRIc1Lh2gsNurGWIHoFmSz576
         mUmRM0VfOLyqAI3j8RqwIvxJP5AGLaLZeSIWa/7o1KcPJoPXbZmaAsVaSHYg8jakBfJS
         QKNQjwPG4dwotGset+xrfFtqULvUA6qf0G6gbCAockp+L7xilKrX6MQ8jqSGSk8s38gI
         Trsokgk3J5NHmn2QBMAqWeu5NLolRMkI9rJ6SUZdusLbDILBl6UcwEq5u6ldAI9tBVUQ
         rgN8oSt+i1I6l3egTJ2dB1QM1jtZCV3BA+HFP0c3g0jB1DlXFViVqAtrJ966jjq0aCCc
         0Q/Q==
X-Forwarded-Encrypted: i=1; AHgh+RplnvG4lixJZ534GwOM1LonE7N5JCMFY3YiqO/DjbquNj+ueNhcQj8I6XI+N/kl69lx4xXsGEsCP5pe@vger.kernel.org
X-Gm-Message-State: AFuF++mCmu2tua/4IBU2Er1bhHzRyiAGnNzs1Nxya3jmtMKD+zZ2hTVy
	MkWAZ/rkXGW3iJoZ61FTjYdnrwAvZHkBgYPfC4fNmai1ETcQCKMwNswkHKMHoBnq0AUx1sgNy7+
	dg6siShGFgTIqKEgI0XwjiqOhEu8KcM8KiOiv3U3emDCjm9Cb53cW5NhI4YgGCWDE
X-Gm-Gg: AR+sD137neh9fn3JhF2c8KY19P/bC3fcQ5u17N8h4aTFUNgVSIWb8HuR2rOJSGNjspf
	MWGhNKgtM3eVyFt3tQeG/CadZBX5s+zE1f0SLPikSz3FvplwQIZlDv0c04G3JpJIaDk5c7YKSqk
	VKlEBA9xUlbBWdrUCV+KFZHWjTgA5SW9zEKq82SJvL2i9oXiiAHee6bhu5HdIuKj77kySqt5NPZ
	tF8vzLBgTZ9L1Pe2ELNOPuIV+3G2BIoQWDhPXGWmo2lM/vJDL9TqqR7M6NJ61zDXMehZ4lwGxy1
	CoNKlp5uNVES7YumwCaCtHESud9yIjFGI2jxKNGqO1ZNVi7dLxUO3bfrmjckDBjrfvFY2770vcw
	fKKnLym19EpT6aFeUudrf9g==
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189727e0c.0.1788272052481;
        Tue, 01 Sep 2026 07:14:12 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189697e0c.0.1788272051762;
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67c74bfeasm272224a12.31.2026.09.01.07.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Message-ID: <7943eb21-84c3-4708-a058-e40e66f9d7ee@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:14:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96ddb5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 55mufDCbVHiLSkcXRCHz-TAQBy48fGDl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX60WRFYP2VJsM
 iCImWHQ9CCWZtOvXn6ozfFv6PhO01r07uXOF4o8k3k2c9iP20eou7ENLGidlNGGUyWXpTBBy0UE
 8Uvqgu68Jev6oNvkWvjxaiZU9VMm/3E=
X-Proofpoint-GUID: 55mufDCbVHiLSkcXRCHz-TAQBy48fGDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXwU2SugCReYb2
 htDJurN0e49VLdg0QrbvZm3i+0KytdFRqNYNRg5r5B1Yusz/o7p5r+9OpoSx9r+FyuLPG+X3UKS
 n/i3Lm3PQWnAHbK+TXja7bcR5pbUBNV8A7DMVAVTSEfnVCBVORJjLnYAI64gqi187x6InFo+GOn
 1uYZQr3cXFBCr+41ITrUvCMDXSNwEKW4SEi4wWhl4kqGbO/8KX43sv+VRWDGkl9kBHyl1giLaPs
 NPbrrl4d6LEfhKdbwooftFDOwPx0mOVU3Ze4kNXO0WpvbBnlZWqX8UZb6X+jwsZ13BLzwZiH9BW
 sWVq1WNLEJIZl7yjFemc84eoSVRlZABNAs9e6jySP6rG5dpHNs5BS3GTNa06K5BD93fRWkAGsma
 wCGZf6nAxfzCBREJwxcJsqYvYdXQUNYgSIsL4GSbbOyy8YlSBfMBrMN+pYsx7ZUsePvcqsp8ODs
 C8OIFuZODy3asBjfD3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

On 9/1/26 11:06 AM, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
