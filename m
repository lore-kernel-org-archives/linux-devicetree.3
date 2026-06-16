Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9E19C54E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568924; cv=none; b=jD9WGXYjWZ5G1s/lg0bk9on5F8rkDXyP6Dw3DLT/nS1oyVnxUY3SBMzTj99qX6lZoNmgvcaFedUxDDu8YVAwYhxp0/X+wGC+E+aHi0tul07Spe4EWrc7K0Z3sNUWw0RmZk0grHsMGMvjaIA964mEUOZOUgICHz5tSehLghBeo1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568924; c=relaxed/simple;
	bh=F0dxFyh7+0Lx5WTGp0pJ8s9poU5YYBdfAd+ODs7ztQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLGzKMZElFqjYNOZ2X/DuGCeiYc0oxyhlZP3gGQfuFWHI1BSovhCjZQONe+Z1q2we9kMLUsahgCkcup+pLLZ+EVwDpICuHC28Tx8Ae/0XtXoaBJUGl51WYWVfHUbHsiw0IqtveGSev1Bc/nfzlpHoH2cQnE1wsQFpDLCD/9V+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3bH+pTn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtJiCWR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3bH+pTn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtJiCWR8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ17OG1454047
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xOJyhGHw0YkzQBzfvXwCpUig
	IAyGz5Dz4EIUhlUhfmQ=; b=V3bH+pTntsNRC0WIupmpFnnbLbT+4KI3jMYQRYgc
	2PotYsY2j1ev1A5QsVpWsNKItTPs62Ih6xJYn8AJVoYhMO2laQc4eHMqmMSzxjVO
	bGAkRVK3sd8FZIiK12P8fbxIo+eWS8ISMrpXmyDPIgHp/Z7O4zvbV5HlFIS4c89p
	9vxRROJV0yr02Sid8m7gvkbl6LDhmGXylxxA7HLdwjIAzeU45Kv5PCmhMI3Uqkly
	8gnYp6Ico8aaCX7iSjuLc9+BJ67UaagEU4D7BpACB1bTdNJ0F7MwECOFY8SDEK2J
	zIdwRxdXC7sPzDJS3J/RVTuGtsiA63i8KX5STP2VF79QCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cc8ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157d38ab37so398537085a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568921; x=1782173721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOJyhGHw0YkzQBzfvXwCpUigIAyGz5Dz4EIUhlUhfmQ=;
        b=UtJiCWR8DtLLN05hzQvVur58J62JZP3b8ScokzbL17vS7vCoJAj0pO1kI4shqWZp1S
         5tvT3VRTcU+xPf/m1YnSGRPAfhOB2d3Nn1CqU9kQvvo3d1wgoSnSw6f6cuI8Hl5sy7qv
         NkzGWVQ+lOGUCPwjX5Vcd0QeqbMpK/LV2A6WBhJN1gm7NReDlowbyj5+34T6J7InXcm+
         +0o3YnhvrVMV+3Urw4ODvUJmt6cgNmCxZ+WgOVYpr3O2lx7TOfUO6mPCAOFR3kJG0tRh
         shPEpGWhMvMF3vGrqs1VQ6zPLw7S/Tk6wLTgaPMKD7piZB2mVxBGt7dzB71p9hXHG5FW
         +g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568921; x=1782173721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOJyhGHw0YkzQBzfvXwCpUigIAyGz5Dz4EIUhlUhfmQ=;
        b=PEUBLD7Rba7VHxbgsfptA9JgDSENd4i2bZoL3mDN55Qzby1w2Vm1RWu+Zq52Vv/Bl0
         mcc9V4gvWILsvVzEMkwrvD0bQMJeN1EqeHAm2ecgiIqCElnvCzpheO03SPnHznM8AAcC
         faqa78CaNH3i5RDxRToWoUpO543GmEM+L8cAU7+jWDLtLbPU4yjQ5LijceIhGo13+E++
         M0MDLaMkVOtzeNB0/3NKOSxhyy54yoa9FF+K7OCHWSwwwFmhF6DSuSZjGYSxwG+O46xc
         vwFGUgeRNZCqOJdjTRHdk8BZkQBXUzxGpvvLc+CFUxvzA5KrsDswANQ83GeBK5UH5dXZ
         ii6A==
X-Forwarded-Encrypted: i=1; AFNElJ/xfzw+oaFHDgW+SFf+9yuWENmL+F4MaMmO2Q8rDLKaYAtIUxZkN6djnVBrO+Bvj51Z2h8gcv3pTA3w@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5eiMz+/4AuFK7lzdHnZ7XF53l0APcS/f1XTpEbEfNBoV5bMrY
	RALrU67vIwTjt7rQnwc0XMzPF9psq20qk68VBsn8FnwgTvPCxIY26iSDMhuacZxJ/rTgMVDvswt
	NFnSTtJioMKqVRUx3xM9EfJFaGtqCQJeNiHHCXxXbjGrYKwY8wJ/L7MtGOIibzvhE
X-Gm-Gg: Acq92OEY9kzuFa3eSdUahjFcgACS2VTZR0MMqTbp5KT2hjNCsOBxmCPSPF46rdlB79Z
	zO0c2EKDDpZ6gFeB7gTCU8kAAdqlvQzbmxsuCm/c3ygoNquaGaeOMKh9znvvj4f8yING4vBTQjW
	bRWoJby26pzojj5HQinJnGpH+iVPmDT4PxWlOsb4XsK5c/y1QEksKUgZlqSDIF+uvj0bfX3EDej
	Z0rQbPknRLg3FXXcsxmFma12NsM10okvRMXrsneWIla3ZIM9MD8fhKwRqAAWfBZD4YBtZT5g49b
	Ixr3mOx6U03S66YQv1fR6hgP971hwrXHFA3vppSar7xf3YMgo3lOxlv2wpOE0+hBPufC1nJhZIQ
	z85VRXFLq0LnF2uH1Qs2N87KDN5VRkk0k4wpqAtifm4dWXZxnkBG9/Rm92Rzf1XLKd6qMNL78uV
	4wGQnJiaVeO2r4IfYfSRSIFmARCSgj0jDgOyc=
X-Received: by 2002:a05:620a:d8b:b0:915:5cbd:1d96 with SMTP id af79cd13be357-91c475a35dfmr219473585a.33.1781568921110;
        Mon, 15 Jun 2026 17:15:21 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:915:5cbd:1d96 with SMTP id af79cd13be357-91c475a35dfmr219469385a.33.1781568920642;
        Mon, 15 Jun 2026 17:15:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fd9sm3094630e87.46.2026.06.15.17.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:15:18 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:15:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc8180x-primus: Describe the
 display power net
Message-ID: <32shpoxn3gfohnnpe74bh5v6t4lsvhe4p65a7sd62pdnsd7lkt@pd2dmftq4no3>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-2-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-2-18d36b548c48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX/ya1Yg1VClpy
 5kRr+0ZKACbYfVrZJLz4jIS+boRYwy2kzQoPLDn7QMFB0DrNsFy13mIkmhMSBf/f68yKjEoRL4X
 KW/KCc88Op8XiKzO/ODzjA53D3h4qKi2K/JW5I8tGwVv+a12M9bVGFhkOsUR1k91SF0jbi+AjhW
 g7AdPFNYBZNlepthK1DAGOCAxtfMos1Y/Ujyh2xSmHMSHjymmhsM/L0HFCiwX85wn8i4O5tQYZr
 GD2z7jMZVtoeUiAlGCESPAMJbSIPajq/3fxpsje9cQEUtmwPQysOhEy2ON5p0VqSh3q9Vz0deU7
 /4WtDtj35tyf1rd/VCoPa75poiUVj+A5y0/m2qN7l3QBC3b6lTamtq2JjEK3K0BcMHbtrJQc+RI
 aOUXh0kd4mvxsN+NPkjCcwn5TAIcwm6hmQMRL18KbfdNQkngAIwC7m9ASz1OLEsm6/ih2BncHw1
 ubkOGSB5FyIbV/rkncw==
X-Proofpoint-ORIG-GUID: JExmiwcf60JunXDSqJWaeyNp1DtyPpxk
X-Proofpoint-GUID: JExmiwcf60JunXDSqJWaeyNp1DtyPpxk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX2evoyLFj3SEt
 AsxSD1BG7kob58Z5Kr2/Wx79gFPDwKLsai7bXz9/mZ4tzCJmT1vlPM+bqYJQujA+jbu/X6FsBl8
 oO0nTIhSpgZBYZrGbRUn/gk9VX6wxtA=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a309599 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rJj1s7GqljL9zuNtHbsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000

On Mon, Jun 15, 2026 at 04:22:05PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe and wire up the power supplies for the eDP panel and its
> backlight. Previously, this was only working because of settings
> inherited from the bootloader.
> 
> Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 48 ++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> @@ -769,6 +803,12 @@ &wifi {
>  };
>  
>  /* PINCTRL */
> +&pmc8180_2_gpios {
> +	bl_pwr_en: blw-pwr-en-state {

bl-pwr-en-state


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +		pins = "gpio1";
> +		function = "normal";
> +	};
> +};
>  
>  &pmc8180c_gpios {
>  	bl_pwm_default: bl-pwm-default-state {

-- 
With best wishes
Dmitry
