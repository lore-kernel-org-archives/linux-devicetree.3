Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93557356762
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293918; cv=none; b=M65AznnIQ+zry1Z826h9iEMP17k8tKNk/mvEl9Wqy6dnwDFiOyK2+66dAIj+OXNrP5fo5ttob0l0oWn3X+6QqfZ/SMC32X19PB1ffvBMoOxuwBvELikIWXMlc6FN7C2rmu9u8lHP8//UFDbs6mHie4nXyf4pn1Uw+Euu9pL8rJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293918; c=relaxed/simple;
	bh=WuqQgf394shb8dY1Y/yOPUDON0RVNRz9T9zXKgEbZso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tik35B/X5l8O22gux+Jz4yqCYdMUza976eBYaYbAe/Xv0ivB1C4apkwtlJtpQmSOsXEs33XSCJKFC87tPt3leG9JF8IZg+oS1FQ6OacasVYaQhzCgtD2mmtIWRqeoR7NDbyo+qopzCQ/cG+EhcdPtzZQpoO+SMgHJ/2u6EdZ81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1mHQBYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etOCAZK1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1mHQBYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etOCAZK1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2MEv826564
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OejxzjR5/OFaKWBu3QblcnyM
	paklV8SItWhiVJcgI0Y=; b=a1mHQBYSz8kbrIYxgAxhl0pjQLj+2BrnZtlkfbAG
	C5Q4SiBW1ZTB6VmA3qtX/2BKNCz2aZdBk8lyinsiYw91dVab9QPbg3qN39MH51hQ
	6FCj/t/bSr5quCUEslmHrNA+6HNfMCojthIhWAExt7jjqxL7/+TZCMGybqtvpiq8
	upxOJI4C2HqWaHBEQFlmMb1kI9RFcj/xul1vnBPuVRCk4Ptz8y3m4xuGuLJ891E7
	M8Vrtk1hTKuwCtheuhUZtuEGyz5sTotn0iCwhJX2GbyPAL2G0E+3G3N6Ii37ZWoA
	r/gyh/0G+VkFMazYHdVHV8Ocwhw26Wbc6Y0QnKF6+1mnyQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecagkkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:18:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-576008a385bso2773465e0c.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779293915; x=1779898715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OejxzjR5/OFaKWBu3QblcnyMpaklV8SItWhiVJcgI0Y=;
        b=etOCAZK1IzuY+/K8FewKOADIL8I30Wx/gnT+gVMOwQBGVw8ICXiQ6M/EjvRk6CdVjC
         Wvsz+T7jr27xR/6/QUucrQQ/+usVtoPKmKyw8F99qiw4Q9hX50EJnqbC2RCIbbTLmUT+
         DgwCe1DL0e7393Zc9QpE586+GHRLFlX4Ngj+dI2okqVs1rCkB86j1yE3lb/l6LwOzmFa
         1kSrLByvhK8xD0wcECHoY7QHX8qQVIoIkQzO0acQyYt6Dt82mnKxw+P82hexFgawQAn+
         kwNoKz5cT6ZOF93QEa6v2aLOmCgJTQ9M0AHXFcBc+DHAsxjg7G/TFj7TqQeoKSuq46dG
         yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293915; x=1779898715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OejxzjR5/OFaKWBu3QblcnyMpaklV8SItWhiVJcgI0Y=;
        b=V0Vv1W9eAXpf8YMO73oQaQDLnQnh/93SQsOQC43vRdEnUa8ZpFL5q0Z9C8EiMyFlqV
         PpIXzrQQIT5tR5Ac5A78qO2+IV5slm5x1RSSg0FDQlRVMBgQpbD15qIwNKhR6tY1ogFk
         xkYGLiJ5y6CiAI5g2zQEC8b12ChfyIKYBFzd39WC3qhS1ORmm5/sUS4iiWYUObfDuVmV
         eUb3wISt2p2DnFdbnBMY8cAFxsK8UekqQfyHjZrteWxwtunvT2VKKBHekefxmL3f9XSA
         469XMq4x0UsVA+3zjVZwCndtgemHpiSpElUHIW7jmywiWtEc0N7XkJU3BUinrOKgw1lr
         k8/g==
X-Forwarded-Encrypted: i=1; AFNElJ91BRxVyH7YrtoMTTyr8v1obwwOzVvrn8PE+HKUpNRp1ZLYAYBvUKOVkQIUBwqYVkVvoYGGLaiZ6laz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32w5kbT44v65tnczB/adiJWAIqZrDK8cDtf50Jql9LwjhZvRC
	1Vr/KaCofrD0uZmP2Wl5LgPv08zM0xTUr/prbS83XoFWZ0P/oud89j5OO5yfR7hqas7yX0LAsfx
	AbvH8BdhjWzXYfNqkyqGFH26XcTS5qZTAkvVMW0We0F0d9SL5YfWSFhWRm2S3UVpr
X-Gm-Gg: Acq92OHuaEvTo5JpAgAQ5m+AZdij37EuXLY/z1/pUQdQaxQFROJ22+Be8Fbo5WrngGZ
	UAKwCWczNvUQTksKR1I9RqlozJ1DEvhdcKSGNSA3Xs/D7IP0NAlERcT8aY2YGXCK7iiomXowTQO
	xOL0g5NcbjSauhsTakSyRFujPsE0yxs593Q23AnjNmA7fl10eakqcbFwWudQNelmZuF0xwg4qx8
	ZNuY7RgW78r1ix3PTR6ak4rA+SZdpcnFzNF4KfSqSl31qVyuKr3OSgH1p04WjOY66PJFLhQ74v8
	V1K4IVV+3cT8UysAFkHyN6Ds6cLJ4vn6sbVzcubJw8iFZCcu+kSUbNgs+hAU4OHFBV4fnPUvuEe
	pQIcjwjkjFhylLYPjXxkXu6BET1cQo8Km20WdS3jZ710BZsOZPMtSEx1qk/USRNcxjXZ14vbJ1o
	iW9Ngb3+H6oIzEvte1EoVZkRDxS4I32nGLn68IqylCR9JHsw==
X-Received: by 2002:a05:6122:4d06:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-5760c0943cfmr13017459e0c.14.1779293914741;
        Wed, 20 May 2026 09:18:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4d06:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-5760c0943cfmr13017417e0c.14.1779293914261;
        Wed, 20 May 2026 09:18:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm5023245e87.24.2026.05.20.09.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:18:33 -0700 (PDT)
Date: Wed, 20 May 2026 19:18:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
Message-ID: <b7bzxkagiqj7aptuahpiwmvxdxitbwozgxgoijkhvi5uymqigb@scqo6uj2lzrq>
References: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
X-Proofpoint-GUID: aNycWF8lO4wmANTs53GlTQqy572KLNGU
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0ddedb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=UqCG9HQmAAAA:8
 a=ZZPoSoA1xvr9cSmOo8YA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OCBTYWx0ZWRfX3r2zvQyZdewq
 ayxxfGW2evlTaNgF6f7K8e40kWEjkS0h8r7HixbPJja3PZH23lLIDnvPo6NN80GKOMuneXCnt7p
 nAT/x+D7TZhR7WtQxBNGZ+t+QoJc2fGrRfEDvkq7ganToHhASmj2NFGhvjMtU7RKBKHycJ1ucsK
 kN0KJBQSKTVHlz81QgWInM6AsOJJFQ2J4Wr07/spDE4XbvQaTpktHtQJKZjznkeY181r20jEHQb
 VzeBsMYuBtPL7y4q5GWayAVNxuDEzd8FY32rWViq2UL12N3FZigMbbh3G5mq7nHE1Yg//lDfrOq
 73f7YKa390D+mOmEUILwV1Yxgssn7Bo2sCzHndTY81sxV/JFcJ6adbKxEYwVm7v8PMzKQzH9aJe
 2CJKI1jTcd0UivubigcF6IDK5q3OcqKAS5C8VYsBfczD9vMDPd+EXc+Hylt1+4aNJmZ8HKJYr+i
 H17XCnsKyQoSJe+Oe+Q==
X-Proofpoint-ORIG-GUID: aNycWF8lO4wmANTs53GlTQqy572KLNGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200158

On Tue, May 19, 2026 at 09:56:06AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
> 
> The CMN PLL driver did not account for the ref clock divider which is 2
> for IPQ5018. Therefore, the computed rate was twice the actual output.
> 
> With the driver now accounting for the CMN PLL reference clock
> divider (commit: 88c543fff756), set the correct reference clock rate.
> 
> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

There should be no empty lines between tags.

> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
