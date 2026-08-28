Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC12C11C4
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908108; cv=none; b=upye+/Yk78qNIZQJM8aW84R6GSrunQdBIl2I2aSjQ+kwr/RReB30zAZgTamFnh/58oXiT+OnIVaLsFY3o6k/1HMWQu2mHWE2LYUjLMJG4D/lZVnr56vMKIpe8FTowUaLRwDSKpVHVzPzddBIKSb8YOY1rw+pTTdQ/b1nzST56Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908108; c=relaxed/simple;
	bh=U4qA8vih7MzINpEd8KMPt3wplR688C82mT5m9URdllM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSdZKjbK/4ZfDz/pDX1PPf01HhvFMayy4BFqixpd4jTqSF1ybetsZarZwp4XFsDKILRc2xtzDO+PrV5EnTc9s78qJKJdV7oUXKgqNP+1U+knKJk6Kb45zwNVfSF6cT6zgVSwxvszlKE8ZYPFEfvLEcsU+/5JmH+SVuWxY04eoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHbwyY/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CASNPQGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHbwyY/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CASNPQGX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66iMX3205990
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9tVQheuLW2e6VRcfQh5w33UF
	FY45a+2U1jfjiSX3HUw=; b=VHbwyY/bNQX9JWaxjmLeDoZws2o9QaCEDgGPeG6n
	QEySchxLypwCfZo4duFGVhlZTiIo/LC4anqIycAMs7jLJ8Fkqf7dfhRZ0/XTROf9
	+8REQpFTmb2FJKmNoHcOrTeru51mnF0BrzGT2n5MwDMUnZBmTRjPyg+qu5u4+7BS
	sSfyVwhm5TmmxiLQ8zVpDolwdZaAYqxBJm1ygKkOHwxV/CqFupnUJjN6K5jR2c9A
	QLzmsStXP3PIygV2RgZ5jY/im/YKEriHvvJg3re0SQk0upH45EizJg0lao+HFs61
	EYFv0bUNv6FP5tHLYR4xWv205Z0IsmfMrkQH68vRCv8MIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatfxk931-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:08:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc3bff8bdso2347271cf.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908105; x=1788512905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9tVQheuLW2e6VRcfQh5w33UFFY45a+2U1jfjiSX3HUw=;
        b=CASNPQGXK71e4wD8HiYPrkKxpX+vFa18GRRwcii7D7siZcqDXBhmtrUlrVsNV21TO7
         jpBYWJxGQL4VstcQKUDw/caRwk2edkVPmgpHc4kyZDOyzt6VJD8J5QwHnU4x14i1okSM
         GXOBcqAlFjYMaoRHQ1/hMmFlRRsiHWDSx2F7Cp3ZKD2IEh4Xwr8RDqFnMj2fOx54TRZQ
         N6fEaW235CwmAYr7oMeNNdkX61n3pBwN90I/uQdnZUjkZHBD7OBvyDLCNwG2o2JrUhig
         a6pS06y5qG85TCIALwuoF05n0f0AZ4cp1klhzXGl3c8x2BPNhAQrZEM46kUpuvpBQ8TT
         ieZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908105; x=1788512905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tVQheuLW2e6VRcfQh5w33UFFY45a+2U1jfjiSX3HUw=;
        b=L5rKJP98IRDJY8TWteQDjKqAZSrW1XgA1nRNgrvAEX55+cHynCwyzVcRuPfadhBNPL
         mCCvkeAB8Dz8W+kmB/+haVjZgVC2gStQCS0rX8/VbCpteIA3xMctuafOO/6xXui7JJoM
         uY3XVvhWtxjJZppRvRnWmDBANNzbydXoLxUo5V1GBtI/L3lab5Fr16m6Fq0FLeJubocS
         83vDquiWGsCktWFX2avO/olQfy7E8PkcXpUwD3rMrS/O6TN4vTYmter1eWPjtiUTFO6J
         nfM6ks/dUID0XG86PIruYlW9PJLZYpDkH/iuSfP9lCGlsTcKkBVwXAPtGUZNYCpAKAIK
         eu4w==
X-Forwarded-Encrypted: i=1; AHgh+RqUrvx9/Za0vRw5KltDK72Ml1yzS4iSpYJviCt5uN5RwGjti0zz7N4/JzoWx7Cu6tAawj9xm7yOoQfZ@vger.kernel.org
X-Gm-Message-State: AFuF++m9VRA4bAmw4ecpV6jRERaZ04JSUw834pHEvV/rL8q2klkoBPwX
	6EoNkNB/VF+pxzUSB8SC2G7/Q694eFqAxmvb0E1eS1GL7E7auDoacsRQGJ4xiHIXuR4S1DMyCn8
	Tjhir+1MEF8aQkqr1dyuaFsHoLC9hmyHyWvVIXa42EyZZc/RN1MW4GbEoYSZEK/Z/
X-Gm-Gg: AR+sD11pFNS7pXhIdWSEupFCeS/CTC/jDNZ56t4NbFuY1ixOa6r79fs5p9jeVDs4l8u
	xQCSUP0nzEuaiZ4+Qady+Ri6WTgiFmdX5x7JHXflg4Qm5vLnG3+w80Gq38gHTp41gy3o9Lk9ZQU
	ZX+pjhhd5ODz5TIId8DnreyJ3BcPYzYxu63hhsjtIPKuu2qshlprQ5UixFNfdDZgEWLvTgKF2G4
	2a/KQ14vAIlM+5/y3iJfh2qmq0ivqfo1j3t6XhGtVVgsaOZYg3px79kgjQzN1QAEdjI5Q/X3Nhj
	vIA7oAyi4QADXe73ATMkQOb9uI6ekIbrtdcL9KluTYMYz3qJbuv4tbw7oaAn+FmcsZyLqEgXrsW
	SDT1xXQJfuz1HnA==
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr75597101cf.8.1787908104535;
        Fri, 28 Aug 2026 02:08:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr75596411cf.8.1787908103985;
        Fri, 28 Aug 2026 02:08:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm2646753f8f.10.2026.08.28.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:08:22 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:08:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v13 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Message-ID: <tljh2vtbx2gt6fidw2b3pro6alx2dcpdtpe2z5ccyg2vugdic7@6q5p727qn7p7>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UKLt2ify c=1 sm=1 tr=0 ts=6a915009 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HHB2upKr6LlMs7tUYOwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: e3Tit_hodt0GGFOjveqTRyDyufhp0px_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX/Efj76XqCLYy
 laEKoXk2icumc6Ki4J/xGAue3LEX60i+owhMOLrPZFMok9CqDgmPmVWUm4BD6w4JmB1laSSj2Pl
 j9GBfSdt/CcyIGg0ZOXf280N81MyTbHvqAi5UqBfWJzhfU6mYzTYTeTNm3nYMxwMS407QOBL4Ya
 O0MbLve7zx8NAzTLv2mZFuDojIZJjb6JRmWCvRuqMs64wy/Eg0eRjOL9iBY6hECvafOaCiXYIR2
 45HjJjroFR/DdtnGhm4hjw23yNfflg2i3cQ5rMYf3+648C9HNELfynjdb96ouyDPzPTunZzAEav
 1SdQEjpKUbyMgMNscVreQtcHP/fvspDct2c2wGUlCc2/Ay1x4+ZXjr04t1n3Y6YyHBbQGlMeWZJ
 /UROVCxf2iivGO1GyAx7p0AL99hgcE7I4d1MqoNv5txYx+fTshJgdXBQobMEmnnb6vLJ8MYs/QE
 P9/j0HJFZLwmk0gYs9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX2pWorFBvy1hs
 uCP4FbXuet/ZbXJEt2/1HECE8AlpxxXO9RlqM+aSDVdt0ART3eva/enBnHCuqWdjswaNH3Clg9+
 G6ffElwPbAt1vyMmP98CjcArAErmIkk=
X-Proofpoint-ORIG-GUID: e3Tit_hodt0GGFOjveqTRyDyufhp0px_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280077

On 26-08-28 11:49:57, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
