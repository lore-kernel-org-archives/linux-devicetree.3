Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2284A377023
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896383; cv=none; b=pY/1SS0oc3xkrce8xf2NF4SGx22GRJa5824ZFiWwKRETetJO1irlDiF8UqhnT8BgjaGFCc108yccWVQ50LdhDOVjFFo/NZXlSieWuxh31JpUiBUssz4TwiGC3ACqczTtK3pQmhJGwPuLamXBQimTXe5epR7po6J4nIEZaNAyefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896383; c=relaxed/simple;
	bh=S9lc86k/Y4qFuxBgxCfmBhcIc2Sx+VaWysuoANFpZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrOz1Ux6iua85Hi58gUGkPGvicNxo50TL85WA3rLiBpOeh9oJAu8C+I5zN9TnUggc6n0L/VW4VVh0O6Fgi5CHRWK8n+OUdzH155MiR+WU9zuijhAnkl3mZWnpLxVr9YYOEK4f1cTtkUcwxIpu7hD8+eup5OOmBM8vvnR9i4KsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiBx9eEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6Ut/joI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiBx9eEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6Ut/joI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UExkFL2391339
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YlM1ScDcIC7T/OBmrEsNdkdT
	nKpBO+7YzO81PCK6Dr8=; b=JiBx9eEGpxQdmtUhtTl5YYOTwFKWij16Of7HUJ8k
	PBC+ue9M779pE/hIEDdY1nESVDTeuPR2odw2yWYW6D1PR1D3Mv9RzpwZ7RsyORsn
	gDHw0iEddFs/cxeWThDWiUVfZUmIFiaOxDmT4NJHn657SBZWzCovyHhatx79YaqX
	K0e4rNmH8G5lYwtWGbmRGkncUeY+AufQCkBXUskyyp5f3XulVpXUSCMNQ+OES5Lu
	DRQQ/D5CmMpKwIx6IHJvfbe7rCA+bp6V+1mCOpLQ3Bn4xRiaSy1bys1kEVqoYSde
	1P5ddDv1K4yrdst6sryfdz85S4f6w3B2N+HNrZJXv54IvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7gwmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so91562331cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896380; x=1775501180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=W6Ut/joIXRxnEd2GrntVHio1oIJNeQryXydOoboV5+FC4GScy/y5sCaJSTRkmUEf+b
         Jmoi/JbQnXrTDYGBwHMKgcq6Bzx767QfSy8gdAY8dZpuDC3Ux7xmHcpfdqWr9ruWz+Nw
         6/nQqi1OTgRCbqci6+kUPwuLbixXCNqV4qV3O1pelSRGQHaoTnie7fd08niMY/foJFfT
         VQ9ex7R3+tQJ3kgOY0THNd35+pBhLCRiMTu9xANlaIpiIDYCl7N3S9SeBIakECBRjNHO
         UgoBqKq5OAl4Z3EUSO4q59ZMTQdobVQRkcKjWSFJXIMz5+TmK6FQBuwxzJhoRhu7K7Vs
         KDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896380; x=1775501180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=puPtlfpHmSmqQW9r9gsDzOSZVeLgqjt8GksU5BRO2zy1/a2IHihYEFSC0hCyz628Hj
         8mKdu6GFEHmO3Vx1jsQNu2d2HVmVSWRT1NcRLiOVwrlcV6pnc3D6RNx7zdnnUw/g+Uea
         R1QmKAZnS41ZWJy2jyiy82cbheRUFnN1qjjhxJv/KuxpApzai8KIrM73zhFQydFUawuG
         3QoMt+qz10b1XJv2U8OvIuNUxdGS/BvxYzpp5WfO96YZ4gT7y55GpfJ61sM6bh0w/ud7
         kk9KWRXUAf1v9Rb0PQzvPrC5/MkIVuAsdSq1pVvullthc8tUTtFZJekwYlHrx0EvEkhK
         KITw==
X-Forwarded-Encrypted: i=1; AJvYcCX1xdONEd7tKZ1XQ0LQ4peXPAYW7CxkvFzRjmDMoJ0vycxxx7yGOUfrw6px+Yve4zih/eTJLn+qkbNr@vger.kernel.org
X-Gm-Message-State: AOJu0YwplOipxxJd/3mfEP7KE6/kkbDQAKpkYXuVfz0vKWgxx+z5FpO6
	j1Edr8VTnsWNQjh9z8XwrwraqF6/YLidAMnfkZkR17aBHX6tU7p+jslk0A/kqrEZSvmg8kMyzNE
	g3/7188SVXlbbV/afxth07sOARGY1cPTs+owCM1GUZtpMZ5ncPbv2849T3hJGKIVx
X-Gm-Gg: ATEYQzzrSxNg8UEzoN6IZSFV+DXwx5440okQbDWyRKsKfLPXJ+hU/XTHJ5YZNwwiOO5
	oknivRlCI681JIVp8amu3ceqpXBJohc638aw6RcklnhWv5MPKvAMGy0Pf9O+yuFahOIq16mGUCy
	iDYzlPqaYxEvdK3XxsIuJU7goPeyAn1ri3By1rElrlYxygC3SVYJx9DTWQnMx+7L1uivJ+9xoHR
	Pd93jnTXAgrw8JZpPt6FRQWO8Al1nDczOSf2ezzxuXDxK34bQia/vrqJjMFudpvhLB2psUhJjN7
	V21UjAEMDR7IEiTnpGmPrXFtVYMkFyT+0mpZl3mJ/dd6aYdXgBWY+qn84xdGmnlI9YeMahb4hIx
	cf55oWCYjQ9NSzPvDrM40gaCeZmqkhkjT8db3LN6ROXn6vhv6wyh7cCf7LLXivAF2qS4tGZ/bND
	hCw0khDyJZPmCmdmcRr+vEaV50pTAjnob4RFU=
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8895381cf.39.1774896380345;
        Mon, 30 Mar 2026 11:46:20 -0700 (PDT)
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8894871cf.39.1774896379804;
        Mon, 30 Mar 2026 11:46:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444c7dsm1859500e87.52.2026.03.30.11.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:46:18 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
Message-ID: <j2oopd5rmctqh2dpavwhertyllashi5h7gzbxtsfddoy35tpqs@mlxlkbatetj4>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-6-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfX70Vi+nSSEMpY
 B8vIwnvB/gdMJjBOES2BJrGYbkckb/EwjxnSTJo1NOc7MrbqFbnUfptdTnHAFWx9Cyq3IPJ33zR
 SRhqUxKKZgHSwVlRHIVl8gpr7tQ0PfLMpYNP0tDu3RYLCG3fuZV32YbYPtYxXuACQWNIHQAdXmM
 JwfcdB1gH5qWkYTxrYsYlvALJFTJ6jdUrNHfNIw6lRQsWmrR+Hd79SKazk+HRqbmH9sm/ng+yep
 /OKxpgR5y+d1hqlZjr/OUVlXPuqv1QUVHy3Rsyp9peha8K+svQWZTdzcv8+uK+EY1dNQXjsUV7K
 aipFxzTgcO0S8Pt1R27HlZeglLerWdLzoGSivxltM0psvuj2PTXcptUa9ckREQqdE9R8mDUpGaZ
 59VxJEKMtUMSdFofRSLdDeZLQZJTWbV5MqVL26rEYYiw7rjvdiHiaBO3u1LGRjCX0kiGDR0/N8h
 QsxCggLRZcupJLn01zA==
X-Proofpoint-GUID: kyfFY4t-t7gOUmEZXZLspi6hKdCxuk-V
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cac4fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vCJQlnQIZA-1Kgvoe8oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kyfFY4t-t7gOUmEZXZLspi6hKdCxuk-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300156

On Mon, Mar 30, 2026 at 12:47:07PM -0400, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index cf7b130ea0c4..b0da24fd1aee 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
>  	};
>  };
>  
> +&lpi_tlmm {
> +	gpio-reserved-ranges = <0 8>, <12 6>;

Could you possibly add a comment, what are these pins used for?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
