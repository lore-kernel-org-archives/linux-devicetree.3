Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1D1F12FB
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409287; cv=none; b=mLBPWD+pSozJRlPA2v1XBISID2Bj8gum7g28kvzWnuwOjhfxZJS7rtrAbC2JVlipYLb+bjz15tIVU4yiF5sgZm7ODtnGKUr924nQRCuNiaXhz/Ctn9DeSdU2+Q2CSbhIRcK9Fw5lr5uuTWdGGgNZX3EsCnAkASh1tmajaJ7DH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409287; c=relaxed/simple;
	bh=+vNq6/RxhkvdZqhGjvDSU/Bd4k1GmZUzb3pjZz82Udo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/Wk8JPo9xBvnOBJnBtSEJ28/EdixUBo1lXE0J7Ynu7WMWPp1dalDLEbtvDHaNdq+NEGUVhM7fNo1CwmA4csYETgUQjbMRHWM+6fBKQmHjVvUmSCPGxXo8gFCiFp17W5d/XP1VCXqrDWXk3N7TJcG1faPDPz0+5AVLM+IP+Ge+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE5XjGbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M79wM8wB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE5XjGbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M79wM8wB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqe9w3049535
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UKPDL4P+yEb0xM9R0moRa8Pd
	vDPzhUws2r4woy5Zwx4=; b=iE5XjGbpNklYeh+DmZLNZFciH7cxMepKOYrDR+No
	tIHsQtfvQ6+WD3Kdvsj7cNNXPZXKyMiBiwvjBWlJX3be61h2jT40T8qZgvqu7RMd
	LzP6aP6/CHR7wiPSx298f67De1/5YH5ztu9pi8wEwCw60RXYUb4of5XU+3lUiWW4
	hxtx5TqD8DoBl4lz7Gvk5yUlBizEC+x+PTOVXqsl+hAnwrNLeX2BOxHv+rj6NDVe
	J3HPHu+OiXNTo8CsjTEi7eXUgcSvGn3YvuF41J32y4oog7TPfrLyVLepF4xOxQZn
	krpYIPqzZX2WPv2hrnGkrrgkNTzNvtIt4hvuhYe63OLZMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk21rdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:48:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so30590461cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 17:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409284; x=1787014084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKPDL4P+yEb0xM9R0moRa8PdvDPzhUws2r4woy5Zwx4=;
        b=M79wM8wBJgR+ObVZWoSI3RTYD9i3V048F2qyh1vB+JHqHW1yT1nv95JIR6dpFBhm97
         YqB2n8NJ+rQo70CrDyMFXvMUs/iRDQzk7Z/M4acrvHkAgL0PTheuML8d9RFL9b7RRP21
         vMTNz0szRw/uXvt5z00xg6XNDgbQLiei4YeRwvLNYQjqWec9bTqxooiNPXQk5fkIcx7N
         yZMhiJp2pF2rqVJHFpXpUYyw3BhoE7YtlehS1AUvKUFwSFhkc0YpjOUlSFtDTMErfA3K
         YOZpq2dbHPpuc0Wqvaoy+SrmkFIphX/TfpFXcCCuWUDnKtEpF/vkfvr0M620A3LmQktn
         XPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409284; x=1787014084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKPDL4P+yEb0xM9R0moRa8PdvDPzhUws2r4woy5Zwx4=;
        b=EAokT2FV4W2KhFmkXMmTpo2r+P5T7uOq9zxNoBksG+sUL/ffcCZTOpHVstGRLFSj6V
         8+e5U0F6/ghHeeBDNp5oDElfHDedMJo4qua9OA1pggl0Hl6p4GUMAA0UX2HRCzMp34QG
         DIxHRE7ETKglyEuF2T2kICuiugOAwLTsYQotZZP9PyDXfsDrOYbulDmP9+tWTBZtcyfj
         vwsb3lhktYNrozIIAcVUE2TagSsnJQiVkuqrrGjdQnX6YNFJ7GtfGUqaqK0BkEEL5jg5
         MFW9mkPEGjM/ivg6lU6Q3emuCWrpcqBu0SgslFVMylL/tq/9COWwpWNnQnfmf/c4VFet
         4Thg==
X-Forwarded-Encrypted: i=1; AHgh+RpdW6XJADHM7SBeXEdAnt4nuVruY7znpEVM48qhZyKt4W0/4nUU3RJ7Gjsazkh0VKg4A8drTLogZ3OL@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtRs7tCCN7YyUdOhNOKzxqKieyZG+tx1EB7KOrLfC18PZ3v8Q
	1nOB5+DqoX3N+bcvM5HyPA+10e5KERzuOdJsqhGpwI/XOC7w2ieyfECL+bY8LrTOEiXCe5N48/o
	OujLZpcJkLAFv/kmBZKCvNZzN6KsxxgUFtBfePdGbzMcnMtTkdXljAmx37FLqcYHK
X-Gm-Gg: AR+sD117BV4VnXC7GPAEIO2/IIXNg+H3VG8KUG46TGV4zRFTTMoHXo9BFOPXYlYg8oQ
	msIuVOSoNrh7EdxkMlFQIpg7MCEKCA6qz4K++ypZHYtk3Onyszux3gzHXfxfwOlVroQbEIz6AU3
	/WIiJOmoVj9ba+ZjxR45Oqw0frlIIYlJN/pwMAqKfdMrJ8EASSXBbTFkojhuASnJOeAufhZ6W3f
	7d/1fCGj/PqGFP2pO2qNNI9PyyGTlm0MACy4hJURB8HMa36kngXvoY9ib2N6MLur/+EI3uLbnuR
	ZXBC5xUtnULsc1dRbplxeZ7RS6bRU/0QTYzqWYIFppU3Y9pRo/Ys33iHgUrcR5KhV58zzRtZmPO
	c15QB/J08PEihxTi3IBpsgTh3ycHx7kiJWMxevFmNCO2bTRG2RWn4FyA3V4lkeGzyOFXqc4nfuD
	mtiJIFTrH9JjLcJg==
X-Received: by 2002:a05:622a:a07:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52d4bdb78b9mr80523151cf.42.1786409283739;
        Mon, 10 Aug 2026 17:48:03 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52d4bdb78b9mr80522841cf.42.1786409283329;
        Mon, 10 Aug 2026 17:48:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f2ae3sm2220366e87.67.2026.08.10.17.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:48:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:48:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNCBTYWx0ZWRfX6csJu1hSQ3UM
 H8rBQVmhBFJNL0exOLnP/QLu7yrn3tSJn+V04aBKn7TXEsMz2HTcH/bTvDJZMY+MvQ7LpyFyltp
 VoNoQeKR2/PuGYfb8Z1klAFkuITUvXM=
X-Proofpoint-GUID: 7P2xCmotR1eSB_9Uc_wuYJa_f3e3dLi4
X-Proofpoint-ORIG-GUID: 7P2xCmotR1eSB_9Uc_wuYJa_f3e3dLi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNCBTYWx0ZWRfX7zPooQNWr8Xg
 sTI1LFxxCk7Vg+YtwwFa1NxIBEu4KozxiP3TyT4XMMdgYZGvMsw+G9pWXlBP3nd5WSC9UKEKc8w
 y+BN/yZHBUkl38jOpP4w9qxHGWVipJrANSfSqQIimCPjlpyg670DrJDrdN0qzvPchBO1qtbECWX
 J11rCgxJiWEM+xNTfeZm3LBY7O0T5RgNTYvJfPcahqJwR5oSz3v2E5AXoDI+3kQnH1i/FhpD7gj
 c8JGh109gKOJ7cgT9DrTnlZWH/tovZV6X6IGlQ02WeOmDXj0VjMA8uaWz7Ks4ub4lDvoTLT/Ncy
 4xdFw14iO642H6G7qY/UvfbchFMVrMl6AUmnN6Ay06wxccR0cW5cFxg9xFuENpyJ4d1qnTKJAFb
 MicQV018+sqMtDlJ8huQXqJHb72FGQZZSZoL1fzjzvA7npNuYMP/t7Su1D8C4ZdjglKC7NSAjd+
 bJQb4nvHunbydTBCdOA==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7a7144 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LBFwYa_tcEek1wEnYlEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110004

On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> hardware.
> 
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART, so this assumption no longer holds.
> 
> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fd4d4ecd2df0..5b3c9d31fd7f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>  
>  config QCOM_GENI_SE
>  	tristate "Qualcomm GENI Serial Engine Driver"
> -	depends on ARM64 || COMPILE_TEST

depends on ARM || ARM64 || COMPILE_TEST

>  	default ARCH_QCOM
>  	help
>  	  This driver is used to manage Generic Interface (GENI) firmware based
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
