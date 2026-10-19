Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445864;
	b=Oej1xHf8h5xFQyXahaFbcNM9nyE8CR/qxaiVCFdRwyNtpATJ4y1r5ryNwSeaW/caJbz5
	 ZNKCdV3KEczT6Z+vEHLPSJFEMYOHoVXBlLFE1QNp+J/AYkOpqdHqC/JLXqCoBiTGPK6J0
	 9a/9+ce7imh+5HXxXSRXpYB3NOVkh+ZW+sf0PgAVAXkxwm4TIE+/dssois5fh2RVZQzgY
	 rVI9fulYQI+GC9QkI2XZUnGSHmPnl18mSAJ/0t3zUtvUtMWJ1Cj0idvj+d5BXW5u/gevz
	 mOBxFA4erSJLzzRz9LVRpIG05PRc/sRJvRAoNPqe5EtGmuUmqqP0+UKaAIoMziy4QXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
	b=mVlYCbAqwQ2lrd4zZggw40Z/YsFnGYv0DJqZdHsRM6vuJ84B9dAf3H5gxEYHkoMMDRlO
	 jRvk0Q3kR0oZ/a2CT9wR5zkJadNY9/eMCKuXkowECxVFV0AWezo2zFYG/P4v5f4TEj6R7
	 X2PRPBzHzVYXSkKJmkqVI/5Fek5CCfHB8DNo7Gb9hJdJx1N+Aw33TUzWcKrDrruomY7LT
	 1hisW9gEivN7FrIQm0xoQT15NWGY3z2cm1WjofLx4cwYy5qAO0qJy8acAGl9j6AXRTzeh
	 d39hQ2q9NRwE8oUumgrxLtNIvxjJLW+1D3tF/ZHMRJ3VtArxB294qKCjeYqHUaVIfIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pJcK/qha";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j5MrQ/qE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A689606A31C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A689606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJcK/qha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5MrQ/qE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZdlm3389975
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YR7IFYT5RaUwifn6Orf77wIJ
	hbjy7lkSMcEb8T4uCjY=; b=pJcK/qhaee0RFV176+sf3IOhC1NqK60aNyrNHoxC
	vzkKauCsVoayYvpo2I8yLrSGFSFMPLd8xF0HNKyCBKC+bjqjqEN0DXLY5kg9XJ69
	ZJ9NsVHSbPcwzDRHAR97KUZithqxr7blLJs0EOxMfyitMXdS13I6kHzBGSCfqp+0
	HEgtv9MAJTpNXCsH7BDLnCzFZT8QyeUE1b+Wk45qHzAiDtIzVAcy3iCSu1xHNbsr
	zzrec/i2nffdZmRon4JdBk45/jHh9yIk5FLueo0qoVgwkyw3pYGY4WDx5av+GujZ
	+Y2X6DKFjg0WORhymslJXv9m5LYIOxTAMjcO4RP0GkHafw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4q0qcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so652172385a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445863; x=1793050663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=j5MrQ/qEij0K+79ExcdkQxLwYvojFKdtmSI5WOfWps1nhVQxnYZHrKKf8ngBkt9C0X
         jtTklS7vOAlI+bpKYj4dXhtiGHg5PQUW4yoolT64NsU59/ni6IBeHh29ougID5I7Bo6h
         KlcomfGBhszCYL6ZBGgvJo9fAcqni/GDUZ86HRLL9QAPLpg8IRhhYgMbalNdh/gD4xFN
         IINQgSr4mF+uAHKAuedXdGzRDjNCg5avOyiVJye0l2woeSttUnyiJGKyS9GDM5Jb/pK/
         7kA0oCHbQOYi5uw301JI9voAWQdZNs7WaSuDyMqqAINzUUyJIyYThWQuo5CMJPLxERUI
         Tc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445863; x=1793050663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=cGIXzC9H/5K+Uw0l9XyJgj6iUnDkiGcPCj/Dv8naAgbq0tv9bh3pBDbKWr21pbBr2l
         pIwlrXyx2h08/MGzAd+HD4iuvX5ijSX2lGfYzIiD8sEbCLSRQeB9rr36tnrL4FMv2o9z
         uKAPc7JOOG7EGo8W5zF+KWLANyEgzW53IBih3yrSp9Ojj09Q/gBYP4E4JvqNPK5u1PRZ
         vMj1Q1qr/0slFzt18yaQDB+cNx3NpdOBgUlRBm3RK9CHKUOuAORAxpwKCy73WUKz8DHJ
         2ITUASXBMQQhCypU6Ks/d9aMfjcigCeSameoy88GahFHofUF0qhL6Wq2MlcARXRUJWyJ
         ngaA==
X-Forwarded-Encrypted: i=1; AKwUvBx+qlUg/tkQ1SgvnHH5VjcmoZq76y32OsE58ER/UDpXcCb6YoY3gn5sRmlXGAJP7xM8C3hkfHi9rPiW@vger.kernel.org
X-Gm-Message-State: AFq9FYLawJFHMrn5R2R2qX+dj/JHGfQyPbVcAwarel8lxo36DToHGPKe
	fgrnVwntJNHSTR+NvxvuN/MTVkoToSNbB70IwxJiX1EUv0gYcZbiYbEpKBseexB5xUoMZ5u97cZ
	CXsTZiZiY3VLtYTbjuwVTSzyo7TOAy3cnAu4FnbSU5cWf59rYDpQiIf90iGLHvanxBFD01pHS
X-Gm-Gg: AYBFou36DbnwBtP9tKyU30WyhxkzP5CJ+G19lrHMcHPKJL+g0am0DhMoKkzRpgbLInx
	nju2Okw1MgMb9z4V4uJT87KprRJjtj/zZdVmA4Gni6TZnSDDRc+99aiUZGMiiynuEmdFtQ7AELG
	Qqg7/L9irdAbjltJcmNqvYS+dA4dTxP2/hE8w/G8ElxaO3e5t2dTuxiXkM4Yl6zPBRYx/PNT3ij
	NUe/XKrzDSqjeIhbYsRS2RSmCRhheD1khUj3gWMaULBq+wM/+FK5/TV+QCvtOyytlYjwrnxixPj
	+fwpIxK8RAQhSK7lVtZDwQH0QpAKEVKWAXUBxzJwcPzoOV0Ttx+lOaupl2veWSGR5o6WhLPpExS
	B9g4i+5pTGx1hINd0EVwGSBPcAUJv5p1sStESTpkra+nTNcr/lGO2YfyQMAHUpKNVAwmGDoazBg
	ahSi9DaT7RHZ5Q
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487452785a.32.1792445862546;
        Mon, 19 Oct 2026 14:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487447385a.32.1792445861844;
        Mon, 19 Oct 2026 14:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm2232451e87.72.2026.10.19.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:37:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
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
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: 96_zd667hxE9ggEoEtecFpvUvBzl4dbp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX1yY74aM1nJxe
 UcTofx91vpzAhRL8QHfDfFQnmT3d6wdMCxhLS26GivgLLeFcQSgjzolU2Mm0EtTy8Gh7nNAHKuM
 sHw89yzhojFZeHPQzr4Bn6opgXBBTg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX8FNR5YVWbzKT
 3Wt4thSUHgWjR1XdpIebFgIXsVWQOyRjD8huQ7qchItWed6qStxLHBaNf2Exbi/1goXMYibW2Xf
 rjfLCMquQ7hI/Kz+64oehUZcYxSnIeoF4372IYXcRv5ZkuRSvQgqKvfWyjYiaHpsY1JktzM2+vA
 5ioYldoiLCVuMlbxEbMPS0UxPT8hi7nt5ix0mC/Zq6qTRcq8WorK/VlV3ch8SvonK/ukSUiiMcQ
 UAPXfu3JEp4U9LpnVBjlZEvp9H03Dt/haPwutczNsAz7WX+U4ZNzGwsqrZ9w6OtiMXGsoqteNJq
 edzDzBnhlw0kLPN6gfAKyr4W9ViMxNmUYP0pgTRfIXkj4E0zepYJsT7grAmWUUrXv60m43VkcB8
 2Gz7d696I2UalVncMLY1IW+oFwOCH65g8rtePUDih/PAv4FvFmP3AMIrz/CkupXV+LS1e20rtQa
 qir38RlznCwYxMrrFww==
X-Authority-Analysis: v=2.4 cv=aqsnmiZV c=1 sm=1 tr=0 ts=6ad68da7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=7JjGCdC6NS0evCYxf5kA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 96_zd667hxE9ggEoEtecFpvUvBzl4dbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 
> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";

Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
fallback here? Then you can drop a driver part.

> +			reg = <0 0x62400000 0 0x4040>;

0x0 instead of plain 0, please.


-- 
With best wishes
Dmitry
