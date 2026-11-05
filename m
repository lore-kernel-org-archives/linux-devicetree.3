Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884635;
	b=ZtUKAdqcex2wmogoPTUGiqKb4ulpwgjCGuD2Vnny6rpDoZ7UMb3DP5JmcE4HRgeClDCi
	 AlDlTN9z4PkQ8Wv6ZUsNxp8T2OFnDC7leQ4LTALllthxreEQbLYOXPEKTkppBBDRAQ2C8
	 odAqkQzM0SUP+j5sJTWW557a9ErVV7FMWg4yjjdiiGcUXyQqeEdAIT9mbTCRtcwACP3qe
	 4Yo5R/WyTnZuKmwUMCrj1rgyxb+eBQT1K5w037IombYY1khaxYTIwDZ24NJvGAxqgK1NI
	 Df2E0g3bRCvLcONhhmbmEMUMo3F61dco6QjDnwnZKlEbTqfH7vWPQ7FWED/i67HH3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
	b=k/wbheLIu2P1s8s47lApZ5WUCOqJIK0fyAlWy6qJUGkpo4R2FSULj2tqohqf3OSzVQ6V
	 C4qGbFuGt23s3CYQ3iSFSRBRib+dR0VY5AxEeiG7pojfFyJDuYTm7Pyp3AmbnAY/FgiF5
	 wNe2cz2gLVmO2ycEwMaD//kI+pMmnPUw/RmEG/9K5QknduC5vRHjHrwYqnyt3nomo9x3c
	 iyA3a5oGf7g72XbxGlDTieC+HoCkuYM0BSvQIcIyjDrMhBP0hH2DeT9KIgcePQW+SxNht
	 fi/6IyKxSg2xYA6TQqIHbBL0jedSYfu2jKISL/mpYWMO2FCgC8KG3mRVYkEa13YLKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DP8KHpP3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552C606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4552C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DP8KHpP3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tKQY4084474
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc2jMiL6eFsHz6iqLjg5VRSu
	JjQ4citqkfgQCMTvunU=; b=Dbi5h6JlWjaYOfWrjQOqoghNj8LtnOidFwmRK8Tw
	WQKoiSsm0M0HDqYhlm+SMdoVcX8lXGD31qAlQlyNi14mpK95Y8AZfriSb/O/GTUw
	S0Cfh8SqnH8Wk34PlActYR5ETtWPhz23Bi/+7dChj9pwPfBiJydp+ThP7jKO0m++
	F6fg6PHAu6qWSrDU9gl5XZjUKlQwk2edaoohKu4CKpru8PvEvHf7Q3JggV+bBJZP
	6mWyYQvARxIHiNUe9gRcWTUzXa2DdIrxE+8DihXH7+hIu4ZUD/KcQ+yWFcgXzUNw
	TDFF/GkRXID9Ahjwfv8tgDPyanV/eqb7ioX0qQIa0qe+FA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrteb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:17:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so13059046d6.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884633; x=1794489433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=DP8KHpP3danA6xMDBFzNHjt3t+xXO/zlMXwHE6VcUl5TPfUIohjgS95qE0PV6V1Js7
         5x5oRFhDVJyl5Juq3jKRH/uma0VvdyzBcpBWSuWBIX+Mh4STxoBd2Wi84gBfRGnJwP5i
         z+WMV8ze8uGDpgyWeglCxF2ps5cc8dqWE43G+gqlV3WGgA/p+lKuz50mvg+Notsrd4gm
         JTZ8hVw19t7xo7990ASHO3vbS6YHXOCkRuqlU8DmYg0vu5+hTgluVUEje/aXririZDRy
         IG1UVay+1zUjcLjxfAgCwaBZ4AWLluIqJ9M2XUFgkMIiNnGzFvP2MrtV0NmdjDkb/z2D
         KLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884633; x=1794489433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=pzaixbSIrDDFNRmqORa5YoDBFJZnW+2D6mnkId1RYOd1dGGgAhzK6oe0N1tZEuGTLS
         3pF5hHGiuKVJvQPdkpeQlG0KsMeiKP7Q7NgTwvONLnHlXCv2wXHLaW8iu5JXMpEvNCAa
         Ft1/mrOOanjgiYLiruJUstD8IJZyB5ciJNdJmZUSjn3+bvtpbgvUWJt5NOln6Rkrbgqu
         zrsvmDOhWFIIsr26c04geIN2nZYoQVwNkeHz/HAy1Jx0ZuTeEhZt5OUfMNH+A5ekDM5R
         1CkhOns6O42sUWbvum1Vw0AekcGm1jQtzc6pmAl3e4RV0I/3pAxf4TlYjPdzsn9QFhqe
         lefw==
X-Forwarded-Encrypted: i=1; AKwUvBwFOXw2aIoI4QFF/3Fq5p8C2Ch9rtkzv0q6QkGkGBvINc/CUqwL49wfVQ9oRF4wkpQRvIQ8e6tpzbSU@vger.kernel.org
X-Gm-Message-State: APuU4Z86+eEAJ7U5B95vALYw14Xfee25GT/zoGm4bxUSpwV9kUDhx3QF
	++cpPAnmI8KTJULYgJ04agCqiwXFCUN+tafnQnCvAzBsv5A1byXl/ikXnb+hEPaU3lX7NCVnhAq
	+oqBv+7QDu3Jg4N8YgwNI9mEZhKGu1+RXmKXT6E8i2Pg//JDcID21jxQGfydGy1lC
X-Gm-Gg: AYBFou3CifswtSB4S5pUqCCC5dBuRQr/cFB/VVQaCBTxJpWKYFv6Ph1ySGktS9clA8+
	Ctxx+D99nQApHvfr14Cba7N1x1u0ueDaj+mfbcw2hOExmWwG3aCt1wgD+JZeSyBmz5/qcO8ueTf
	VfbeAs8ohfqqEFqvcLAMlBkw24IBhU3NzzKXiEUI2CJHnnwOW7Z4krAqPB/afUzZhLbuxcOIQZQ
	60B59t+SQVLujgaK2kb74ZkBuZdmLUqHWm0tX9uNddQylfQbxMtDPGiAU2MV3ZOiFkL5agOe4y+
	7qbLVjATpg2UoL/KA8Sw3fANdpdDVu9MIxG38beRUe7l07XUaW2quB+0Uwr6540Lu3iW+2EocY5
	l/oXo9wjm4NQuvQ7k4K+v9+QuQGYiWtg5qrefGX1d6ljNgTRgDQv125/gzuZlIRI=
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398575785a.39.1793884633348;
        Thu, 05 Nov 2026 05:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398571085a.39.1793884632740;
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm67759415e9.1.2026.11.05.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Date: Thu, 5 Nov 2026 15:17:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
Message-ID: <rotiram4b5ah7luhhwd7f5hzhoz25p5qwz7yi4m6riu6spvxep@y7hwfdbmtcp2>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX7RhjKfRF4Whs
 yRE5Da+hCg2/Fq9zxCoinXodtTiQCE2F42rJv05yh6rbG6DeYYsd8029IBqGe5fgFhNTBpQm18f
 LZnjMTUlq3hK3Yklnq+rX4xJnJTkxhwhIbSFgJDLY4HQrfzwHqEKJwxL65pdjYSRozvETMc2k5W
 H19NB2Qz7goJFXitIutfqAOEZ2FEzUdfqyzIDQ+dq2q2WPxSjp50heXBUOzIzekfzY1+stB7cwH
 emBRqHKbO/72xTJP/o6fV/0ULDtAOxLEpE8CaTaQ3iAVXUIfs938tEIDJeHeqMo38YmMYtWoz2q
 POJSTUwbJWC7lkBOyA141MZT8fSWHpYJpIEQA32KsOPtB28tU+WVRpyRMstg6Et4RJ1d5gnS71d
 MU4zsxiKEcB9cwHeK7lAS90IZKmcIDtW/s8KNwi2KidfncqvcNZuu+EDuvtnWY6VruKv2AfSHM1
 yDwlHJA3EY3eZcquIaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4qGk5wuRXHiR
 pkXcbfwW8ScjG6Ueo7VTk29wC1U9YMD/QWltEkeI+D3uIJfKOui+fvFqARWD7CxmP07aGxg2SCY
 yHurwaZ8tdR1mg1B2dr1e2a0qhenDz8=
X-Proofpoint-ORIG-GUID: y86LN-ny2eYh5ikkeUxH5bpI253LNGLm
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec81da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: y86LN-ny2eYh5ikkeUxH5bpI253LNGLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

On 26-11-04 20:17:02, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
