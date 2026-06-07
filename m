Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F992F361E
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858665; cv=none; b=A3wJThS2MpQ0BT4tqPqkjqQ+hsqFrOS/VS0cEdAYLCP2nkk1VfVhKhHSbcjFybAjDoCiSy3A88FWWt1OI377ucOC6KybqY8kAc0ZDmlL6FtHnj1xTsRCHOeIsaBZpk407FYSYryVhT6gfsLQWUIh3/L5Mgxb+F5a0C43kHjrhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858665; c=relaxed/simple;
	bh=HE97CYBuZfWh5hCXzbpTHa+42Wpq1Ij1S+0IR0PDwJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAqc+JekTgQVZWajgGuw3Reb/NK04ovYIHkThWPv+VWahYP6m6CKtvAJ70LltXnyaq+AqFbI5BuApmf7jG06aem/8i0aDqnCFwmzJi+s+g7Br9UB2akbsoDcQc+otWIpLNVtU1LE1B2jNqdnWPszEk0KXwhu8lTGzULREdLXdJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDSxtlgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj83Gf1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDSxtlgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj83Gf1j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El9Od443064
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 18:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9Ig/iAfD2ohUcO5DV+Kt0nK
	dPVArZ9Enw9FlmNxziE=; b=mDSxtlgchbWe4fNq2g4RJOWjqZRspBg1jtzieKxH
	zpXqbd0pgH26iYcQU8pjvmLxYCyuyJB6mOfpo/uH1a4cGJL0Bqf/37sz7cgAHAdC
	NG85hDWDhYyGX2CY+kCPqjTOoBd2l8ml/WdePfORySnhpFz6vWAx3FE7WHOtzbXy
	yceI4flKh9zYa9lrKaqhVb4E821f9xuiuK2Zh1ZH8AmYTurwkBujtz87uVPRbeHT
	iGm5BFOkxvXuZLTzzbIJqkk73ldZlhg37S8k3g4ySkADQrCmUALrUU7LEK8yN9yX
	fcnds7Uk7396QU81fiFyyN9y1FjXCBmWWjNGBiG4U3m7CA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1ce1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 18:57:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517a00fbac6so18404071cf.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858661; x=1781463461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=Lj83Gf1juYT2ZHkEqmlW1aUh37S0x2rU+hA9oku/iB5aVxi8CDXDSYqjjEb1GxRxgI
         WhL+hRABtakxYK+dx0uHeRbff+qLy6tKGoU2np00usBhNihVR1s864I9FmsophJEyn2q
         TDzFkO42LPbr46MHDZHMmcmnNbU0RAQg0cnpPd5Gva9FDAoTXsk71lQV4rWfqKlJQu22
         bQPNLIttWPxqroSdiqK0P4kyXkN2ZsygfkfieZKdVGc6BFGP9iPrjomhw/xhupVOjTsA
         dMQUerkkXqBvi89Rnr3JepjU7mN/mCozYsBbXpGO54LpF2QtjWHdpB/I5Dap/JS2c3E9
         YqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858661; x=1781463461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=ephaZjnWuWfHZmqpFfGh3GGG7bAKP3Mc7zlAS2U8uNrqqQDJUFfbCLT3gNxdabIDAx
         7v3RDwUrQfA7fg+bvXkmsg2fEM3pxEbMdbioZRTr4/1wcIWeQFjqoIMxPNBBtBk6zw7p
         pY4qWD7kc2883QyRFDlTJtFNYMdDJI5+G8DWlxifzXU49hKQm+w+GZUAEySDKuHxFgjz
         MelnXGYrH+Ws/CwK0nMZwbAMt9ct1AjCOxXOwdYyy859huVKUNdJLumyav8gt2FxF72o
         NHc66ijEav+BI0GiBoa/7MwJHLMHCXj1bJ9BXtK5JPPHTixvPCZXaUpKyo0oEd5v8rE+
         RhdA==
X-Forwarded-Encrypted: i=1; AFNElJ+3THgS5GtW7nhYIOYgLcPoiu7zyPrzSKa+tA9Ur8zXJuNg7qT3JH1ZE5x5Wn4hroxSWFEUf8o1jW9W@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/qEZ33QrWqFZ7R+JvZrxvIzBH1+OL7FVjAXtdmdvHSYhYPJ9
	NaHsCH1ocmM+i9uFE9LCLAR6MLhS8jCyICtr0QSMZZieTaYVRWkAmdy0jt0vcAgl0Eru7WfM3bY
	ytAU913DPWlKTr+EUkULl0B116+436g2Wv9GMNm7pEvWjJynH7Ds3mKVqQwIqK7w0/AvjN1MR
X-Gm-Gg: Acq92OE0vNLZ4fSo5HuPPNO4LuGS3+TpnTGtcFkcIDMW4R6WiumhNlhARVBa6pTX+VZ
	ZnIs8WrV7wzbd1VNpBBPmopEkmUFxurGDvvxM7BsfN05RfbKEAw1bTnUY0mKl8G7aw6WsoDvULM
	b0NO6N5Y9mP1i1pOW+eT1qsxg9bAduPN6eR3OOuzUbwrymXArzGoG9Ev08zw4DepDeGvor/ZKcC
	zbPajXAW8PIw+oOX50YZZUOZhmLyQXVL1gEjXZE8YRz2MGXpDzlG6MBm6QdUkcwlRpqNQ9JWAWK
	LpGM8e4hOk495ULDZGX6Mvw9LzKkqDlL2R2FdHB68BQQ7GNUflPcE5lx8hB3whTiagOxFBoIS02
	PWaTl3whbWiNkVegTvtXPshIqzffCwUzhy9CZaL17/2kqQ35AOtUW56v5p0qE+yzVKplZGdGa9e
	qEjHgYuoJnySMcjmros7u/lo3519RsxVCg8fetlptNMSVDZg==
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191324061cf.18.1780858661144;
        Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191323771cf.18.1780858660794;
        Sun, 07 Jun 2026 11:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2e9a9esm39513741fa.36.2026.06.07.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:39 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-shift-otter: Convert fb to
 use memory-region
Message-ID: <bmvmi5tomnndpmk4aohv3d4guxjfbea4nckljawk6ez7ovz2hk@sshjz2ynd5ba>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfX/MH4aZDbwfvy
 jy3WkXhLiz19moFkcTZahdqaqJzyQV0d67hdjL4j1j6Mv3WZ698rirYKIXTwovkung5m7UJ0yZd
 OuX8gynnzQS0WD8XgggXYZmtyn1M+yMLt3e+UkbafXvZJoB3nRPhN1+uJvYzEpiB4THhPSfG4Fj
 +FRaygTa9BA0tSjGXVd+b4J2uXScaaMVd7M6mopZc9SRcBK4fdxv2WzklrGsNPculIMljvdpTAF
 UK1MicEeGW+nhcsNKXVf+4a/aW8fkHiwYKdO8Y3Fjm62DtEW4S4H1nqg/v6N19cc47h8VxhrSoN
 cE7pLJwOssaIwK4PIv9vtn8417cA4uwQnv3YQ3J/IiznKjsP/yIg+yWuy8t1sn5v8vaf6dwlflh
 GU7IbUFiaSPq49YpQgzn89APAYEalE9l95V7OYhwrbUc3a0/oWvCaAN5LinrZeTyjGoyE0lYDP4
 sdkIiEvZMj9yjZrCiFA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25bf26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5n3hhTqFa8u_osrWbq-FPI7g5-Yqa-r6
X-Proofpoint-GUID: 5n3hhTqFa8u_osrWbq-FPI7g5-Yqa-r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070189

On Sun, Jun 07, 2026 at 04:12:18PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
