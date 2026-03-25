Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A377031
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478433; cv=none; b=ITy75GGjCEetBQ23C6Dx31cdOupF1zZksL+alnlzgcHUZtq1cWBnvq8hsxY+8JOND2iYNThzBIevF5iwPp9+GFtISrgye8nKecvyuwDaigMdPLa0xcXCO/qto8dhr8hZqMLl9dXUvq+5Usq+btW71xs3HRe3ywIr0UUjAOP9kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478433; c=relaxed/simple;
	bh=M3wrH4b+LRUZF3FN2M6DKwvla4BfXgDsUeFyx4ljtkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do2zashTYWbEKRIlAdJ/X24+5YQhFfPielsUQH3eCSvidI4YvR30NLjnhaxWVeExwOo2Z8IVuxm0DxP3iyBggWs9DpCnRaQZwizxL4BZ0Ki/fP8DflU8iKbhWZJvG7j3XyJcF+L8oy+gpJQ+cc9/yIUAf4SkzL9OlZQCkyueIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmro4bmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6G5CCca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmro4bmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6G5CCca"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKg1bd1965191
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKYqQ0dwW8xuJgMJdvmszTAy
	PcSofCCo8nVIzS48A1k=; b=kmro4bmonc+TqGDtD/9KUXC3tqseV7KpjWqogEj4
	a0QCUv37Nc03txe184DLxG3DcNMAEoMTWEjzHgCSmvePIvgsJHaF8W52m6k3v3Dc
	9/b7KDE/GLX5XqOQpOT3Vbc0zidboUWQg2D4Sw18NjSctgF91TSiOIRzm1XCnGAX
	4lO4YHdu/cCcyynOe5pr0vTJjSakbAKgZJDwQJ1RDaU2wS+qKW8MQtD8ofruTqO1
	FTqxL6x+n2LuTOXcPZ4IWvv7bC8SS6T0Ltp/uUP64z4DrIjp196uQhYvUpN2pkNF
	QY0MgplrkHC0MbmUB7H4FRnX0tT/Q13V5MA22WDY6NzdLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymgasc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso10575671cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478430; x=1775083230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=R6G5CCcau/Ei7EWBPVn13nr2bAFAaL9Lnje3bLaniCl4dXD/R/cf9sQDkqi7JlBaBX
         /jf+VS5aiZdJOioLxD8Tx+IQEVttNC0bofzg/V8Yi2kwMALFaTmYfRjBU1WSbA4XsFg8
         INSveh9k2z6SBfgRNYiTSkoILXrTnGrRmTZnJRKX0k7BGpB7XkAhREyQPYSWzxBizzdn
         UAMHTlrRjCzq2Gvs1IBsiPHvAdlES2gwQ1BI3ATv3YB8lzhF2TSPvuXHqzU8qzDnG3MM
         nt+crF+lvnM7FZ1wZvmafKF3+tO4Og+qSpUBt3HF9GNPwSBtbEEfWdf9qc3/ISfLa01Z
         a2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478430; x=1775083230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=l/m8+C2ljS/q1adz01HHjoyRKEQOIUSRdpUMogCizgv8y1JFP9mFiKCjxjO1ROfgoq
         WNFf841xCie7xi0yHZVuIw5vYpt0BqrXnGhUnQutCCD98L10wE8o6KHW0o/Tn/JXlp1g
         RJdBbfMJcmGU9JCY2TKPkyvrRE5VVTAUy8JPXGxbtQXVv5DQBR31BP7SsU9MomVPFHFh
         qnf/2O7XDU7L+aCLA3KIua77EM2Tg3zLlm/mDmGj9PS60FPsChVTy89uRaEW6eJsO+No
         mP47/Y9T7woB/+dLj5LaA6qDU10VTgtuPTRR9WJEo2DuG2LeRLWZKJmAaaVGdT5ZhA8h
         A5zA==
X-Forwarded-Encrypted: i=1; AJvYcCVs/v9KtApFip4SAnTQqcfGAL3c3N1VI9Mcj2T20zJoM8nZdZtaDCxHC+0hsJqZdQkAJV2GTqHFroeD@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgnYNetTT8PMMkwmY5S8ioGMKj3SvSsnslnapLZpP6ZXuH03S
	9DWkYsB+1O1XY0q5D79PporT165hb7oztEPiowgw+00mm2KpFReAEY5HzEDt+3PfNCElyoozT6s
	2XkXQ9V/65CH9RKm1oir4YaWXG1+T7EXDxSoAWnQ//WThyYG1Iv4Tg6tewEmxOKZQ
X-Gm-Gg: ATEYQzyft4k7iTAD1GLjY7fqAAZsbS0ek0dWjiLWxFAFl+YgbjMRPinCTLYttCDvtdL
	CEF4qGZZwTMCJ4WzKhVZtVC+5T5PpvHCA6K9VDkIblFIXuHG7xIFTj55FRGeawu/6mpQYSIN1o+
	10RYQv6uASfXmJ51GpXEuB82E4chrZVAjHO+pe4JX71+xpvAssEwKSYSVN5MR3TAADYJ6Z/Ct3R
	5UOrtunpKQrpmMsrSBbDCdB5TH0rr9Hi7XiCWu1DBlysNPvKdXwO8ssRKXSwT4+y/0dSH/NhWti
	isb90SjGUlj03A7m4Pc7PjZaHej0FxxjAclpeOLu2KPSKqREA1rtD3wdtuy5GOdrhYZ95uZyqMB
	r3p2RlTUBm5hVCd9qTfNlvyjiHOnMMwAEeuGX5S5hUj2WM1J7CBkwwnJP5qv8BmgrP4hGU4A=
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662461cf.4.1774478430164;
        Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662151cf.4.1774478429762;
        Wed, 25 Mar 2026 15:40:29 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm1810051fa.16.2026.03.25.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Message-ID: <67d4gbz5tccughmlb6tkzv5fgduo7ih6ht2avcq5o3deiwjkad@wt72gfijbx3u>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: i2xu42RUHAo-Q6fgUCNvN8vTuy_1-w2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfXw0/IJBRjABWP
 DJ6cNOlnZfA11gIUYq2mt81/nH8Xn8PKX4SDnSXVDxfVkXUheW3ECCNfBzwS5kF9I0bx8tneSne
 +nxHfXUn7e9o63E+zO9xbKqYvl3zPkFP1WACYhyEiUnp3tzYEYYQqNUkG8iKjxU4uEFgBV1jF9W
 +fp5iRU8T//Hjy2ZANd417ghIEN/WmxP87zabhNZrFXH8MFyaTEKAJrQJZ6cXdz6/4C4Ytdizgp
 zUDEh7t0dy2ewRUM2wmWMIh1d9/QZq8FLliJONjIDBci2RGiL+r6yFaOEvSFq18pD+MRPM4z8ru
 EZEiTm337He0bHUmfdn85UgfZN69Bqy8mFKUSplKhzJNG2Bm5NfEVCZyWvcygEo7MPAwxVB6yJv
 /EuarDiPNQuakoSf/L63TYgIaYPnViqOA5I+P5WdV6IP2FyAB8117keecMUbxC/FriydMKbf8Iw
 fC8HFP4siVL6N/fMRIw==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4645f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vaqIg2kkDvR5jWT7QgcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: i2xu42RUHAo-Q6fgUCNvN8vTuy_1-w2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:24PM +0000, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
