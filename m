Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146C38A701
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783447885; cv=none; b=N5/DJWOQMtWZ6yamGMlRDMKoE7MreAjKOa09I7ftSN+HeQjeRPTzWlD6sY4F2w5EtHnBdeYIbHm53PXFdXKKU/wHrSiYcKt2T1QlF54NS05vmUU2JO0T6iUngDpPZ+T4/riWfWoC6qO9bSyZTqDDGMSpwkYArZyHgO6z8GhKcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783447885; c=relaxed/simple;
	bh=/PqkFVL3V1e5zqzVDMWl75F6A6rAoKuhxRurfkV/b/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm07H6nnn6rIKhhGErYbroL0LH5UiQ/3mu4jvu+RW7AL83Kq2DHLCcSLnAoAfKnVy1Mj0lnj6lSNDokC1Vk9JtswAa2eAFKSf4PcJY+6uXrS8GVdtsf5EOXEwBZYLbHC2pUurQDTs7qBkr9tbK0UFy5GjFE5zRLmEHaagKwqzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP2wUiVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbBKwr3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP2wUiVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbBKwr3/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTLns018214
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 18:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uizMv5rndZaKnMSeq/RzfiTV
	y/30IGGT9SfZu/MIkEw=; b=nP2wUiVg3+z6Po18v0V7Igbx/yzDxHgnB6zSd/nP
	uhG27KgWsvpnWSUQ0Io8vyUHIsRzlGIh4inAtzTLFqVlg0eP7b3pziK/VrkOKKTP
	xjpOdKRaQoOOdKFfLSzF+dxYjGweMDvNPPGduz5y0esUNEdDCmTYBc8Ps+pRhoXq
	MpUB3eKNwFsHt3DqJPk92194i5CZVlt0blPMqHnm65lpEuSakY6Y2vnzM8nl6CnZ
	68NNKOy3vU/XbkNFfvkGZGKPqjNzduil1jJc9UxxbFFs7oNTD42O4363INzHKQMF
	5UlK2y7n+1sZ/gIfalMLyQgW0GBC78xd824agFKsTC9ORA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2msh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:11:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737cd7b76ceso646222137.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783447883; x=1784052683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uizMv5rndZaKnMSeq/RzfiTVy/30IGGT9SfZu/MIkEw=;
        b=SbBKwr3/V7EORoohDxRgn9n26Pkba9MoTVXQEfhl/Q52ttFIov+mEqJtj9AIUkD3cJ
         /3wb7rzlCjsPGlhpRPUQmHCjDtHtStPnLEP0dHUue5LZ8D0Wom01unnGJ5oZO3C3iPJD
         uoWc6mIZZ8VstkS9BgGM2JnH91DfUiiGIvyxA+LUBhnxPdCfqr44YtxV9fcsWQP56bEF
         BJsawyXsE+yGNzC9wvNYPH+rLamHAcwI6VOfS8xI/1r1YtZjNH1dcZkBlr/pnBXL/kFG
         lsij8rNn3dyZXdbtO4rGGxqnWSRGr/SHY192/quJzjw4YsGwiG9r/PL5s9kUR5vngvaW
         7pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783447883; x=1784052683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uizMv5rndZaKnMSeq/RzfiTVy/30IGGT9SfZu/MIkEw=;
        b=qChER8DMHFA/ZH3q19AKmWm2Oe3BpeOrICJ8c3fMuQ9+j1xsSA5YQ5i6s7+6e+2LjK
         QyULrHXrmOv/XLByp/3j4uJUteYAFAti5qgSp5csq/gbuHggCT/xHh14yJpYR2LljiDm
         kHkvsTtKRh9mHSzDKsFMHGn0DPWPXoJf/EgLTVdjE+fMDs3Uulxf0kl+iSHUwHbmPI3B
         tTZdhqGD4RPfZo7jfLTaRVXL9lCneGpfY5kfOBl+QFD8A0j33VL/WX81Eb3XTUf2DLGh
         rmXu69+bHvmcpEaxeumDFVNSkLexUIBiRBXEue1iPSvyJ/zgNlGdh0Aayh8ulxH3zQUQ
         DLXg==
X-Forwarded-Encrypted: i=1; AHgh+RqVdABsHzit6hsWSOIgfq2mlHRPQj1FIW/9tYa57XXno2JAylTVGa8EmqTt76rUkXbrrz5Dx1iJQ5mo@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZWb/u1z8HIEA3c17XaFhfjRGsa0YoN20aHWucUTIxBcN+3QR
	sAM+6mxPIvm9FUfiDCzKPT64SHkniFCljXD9W9EQfxBHmudABQzCTdGT0l5UdOyjtYuHhVJOQqN
	mcVW2MPCAyzhGPkixC0x9XobG963fzTA5AEfSU+Zi/EEZOkyew47vKm/kYna7mKpd
X-Gm-Gg: AfdE7ckHtgtwH/4uoooSEFibN5yY9qqAPVnoPsdokJPxFj2mdwQbrJUG4fgV6RSePHa
	lnLts+Pzmlw/eyLF5PNUaQPFc0CWbB1bxVcNI8lFeWJrR1Nz5zgZmhEgtiYTXbdjJMlqrQ5ewWt
	DnnwkMLUgCKaOVf3c+IyBsOZ3OXoqG6T0ylVbpy48rYzIxhxzCM5iKGQJhr8mS+dIpTZNbSkoya
	bjRHNBPRO7CGUuhVfH0aU+rjwxzkZnQoFMlDPmsEPkRjVVfAwFUQIiYhFNteZwZdevXwFxqUMs5
	RJ0kVYmq2yoUwDIRC3RPVk7P/C1cuqS8V/jHMOW9v3P/obp7YP7l6cQMRvweaAvlewtSZflUo7X
	hG8fNW7AK84hV9WWlATvIGgTZBecC6gigoJhx5het08x4wCNPNFBQObOCtRmeYuiLBNWPDjRsoy
	YqUmQ+69ypHhXLt2b02BMkLece
X-Received: by 2002:a05:6102:80a5:b0:738:20f:10de with SMTP id ada2fe7eead31-744b7bb68e9mr4020113137.17.1783447882660;
        Tue, 07 Jul 2026 11:11:22 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:738:20f:10de with SMTP id ada2fe7eead31-744b7bb68e9mr4020091137.17.1783447882195;
        Tue, 07 Jul 2026 11:11:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1bdbasm30377771fa.5.2026.07.07.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:11:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:11:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
Message-ID: <4mhsors3ueu5hreokmeqirr6fz3gd7lk2rcisyjppchwu6gwut@5lf53jpzlc7u>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: N4vSjojLczbuCdCfuXQ9m7GwlTJ_Q15L
X-Proofpoint-ORIG-GUID: N4vSjojLczbuCdCfuXQ9m7GwlTJ_Q15L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OCBTYWx0ZWRfXznNmJd8U8F3m
 JQXg0EoZFrzNRaFD9ZnYwG3S5j0+gc4MhL1IzSaeYpG2AijnOTLOccThyxHUrv+pxh4CuPGvyYA
 gdDfwbEZzhROD5xtEDX758xp0BUEu9skTi0EtMNxvP8RkV+NPyhRm05ufVGW0d4T9sP5ICVspX4
 2Osvgffzx9fuQOW38ttqjRqyu3XBVDs+rCmfrJc6VwvgtMTp/hLHdPd/i4CsaBOLIM1pL1H3MJO
 IiuUPmY5/T1WYJxy/kiUJbpk94Uu4TmZ/gK4zC1kK74unAMdLnlwbtQOroymV/XBDK5ruXaqzVA
 RjOhjkkeBQ6gnHmF+wPF5vVs5wKT3WBgWyg1m5q1c6SRqGTNQ9hJUcXZrBl8eK85onmTXbR/sQY
 zyvhPm0/6zAHSLChN6hgePyxFfY7/qsbiKAmCX0kgEO7VgsSH2iF/93BE8cVuqqYTjugoX2z188
 TYTo9+yL5rL8kq42Q0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OCBTYWx0ZWRfX57oQNy+Clovf
 7tIn/yz1qR8Xkqw0ImlWhLwh9vvAIVQckIPTnkTaMVTh2R9fx8M3CcOkyqo1kWjqqWaE9HLmhm9
 P5RBB6UX3nqJIjL8VLlMv7pJe4r+hf0=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d414b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=txcygE_ixo86pFOgItcA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070178

On Tue, Jul 07, 2026 at 05:37:01PM +0100, Srinivas Kandagatla wrote:
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
