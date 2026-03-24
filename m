Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E53016FB
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387102; cv=none; b=kjxWxvqiDewhrqbVO1ErLIFbcXDE1mVPWdYTKtz/M0oWAkqUihk27xayy3aXT5nKdRe2E/NNQR0/s/IoXw0ol+xLgsUVQA4ksjInDkRg+jSYugwxIWORY2oA3GEB7Dvwx5D7eAbU0YZdizQ3ga4ho1if4SfItjNStgrR9cyjmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387102; c=relaxed/simple;
	bh=FbBiC5kYbtWw3HIEa9U4D9+672ahcUyieVw1uGVwS+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ1DvFqCvjEzkFf9gZKh5Car4FTdptbNaFJNh9VZBkxz4p7AHf+IzA2TAMN8I31OWQT+lkVpkx3kUUJln1pB+zzAtJLlmsUFnSuD0aNKYo16xBsutxuNLXqECFg1N/6JL77BKUAj6V0J7iyCzTtSzp0LHVig4dKN/Qp0TuxuZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGBmDx2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkOWX0ZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGBmDx2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkOWX0ZP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCso93110477
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrCV1DuC+DUKUpaudcfeawnP
	IR42YDvtoWCg9bXP6oQ=; b=dGBmDx2xb1nKpC6XWlY6gN6UaOSRCVOcD4w9Evwv
	f77sy4TLvoSfUZDiHPqvHUITxBZXOhMUrMsc69a6cZS5NRoaC9KSgv5Mmbt7nCM3
	WC3+sSv7qZN6TSHxTtXkI5WfjmXwdAje5Mpay3NSKsl1bNDhw44hVHpCDhfybvV3
	UHxf2rUXGqIzzsBT1NW1DIsCxnyuDNfenf05yWZD/X3po0gFakVp2Zr1tcKHbGNf
	j9EJ0Xn+D5lMR0G4uJ19L0+1vgQMtIdka1a3COk1ex7wYDApMG9AzNdOgxMQsy53
	TQMjc64TBvLleX/0U86Hj/yZuhh75AwMzKkKtcYjAiwoEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvsgtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:18:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093787e2fdso277702121cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387100; x=1774991900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrCV1DuC+DUKUpaudcfeawnPIR42YDvtoWCg9bXP6oQ=;
        b=NkOWX0ZPkqgsR0dyd8aDFvdwPgL9ix5h8V1XeZhd+4p9izAUX2mrmYM68fz4QxiPhD
         EsKrb4zTk5Os56yape5jvhgnth1FhqYdhu67c4Jn+fZHxLsGdGnZev97G60cFE0nzLsJ
         NcdZQ8jSgDgk8IaPs6AnN6ypKDtFV6YBhXZ+UDoeXhDuFPpZ7So/yhnvEEEPHNL/6mjC
         gVrtyW9T3x+VSItg9+OSEtDvMW2PGDe9WFq607A+OoRzSV78tQPw52WDdvJw8buKooa5
         IVbw69Rnjyw9S7OAWZtHjSM6yRwgXt+a5vxHmfDwBAZ930867yD0Ala1mtudb//cCHDk
         OnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387100; x=1774991900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrCV1DuC+DUKUpaudcfeawnPIR42YDvtoWCg9bXP6oQ=;
        b=poQYJ6lr2ariUmy8VeBF29pdXjQ/5nBacIDkUYSy/513WaKxTGuS4ftxKa8HhIkZfm
         pBMAOKGVEiygacnazQc2xoDVKs5Ii+NmlRlv0dYjuthjHNcAfqvKCI7gg7l4WuoMOX7F
         UbWdzU51hnsIJH2u2p4CzyyF5M/qa5+eAWGWXhbU5uRfo/BT1jxAQsqfUVNeo8trzbKp
         do9YKFMQ1xzqUn9a31HEBr3xWFk7sdtk5lAGtzaw0y1lozDsLvQ++/MiE/hkZsHlfFZ/
         Mr2n3gG0zrlXlZU1BsNgMD+jtQS4vn6nbZqgcPOKj9+vrnULEy+THAmFnbZotOkhvm0U
         OzIA==
X-Forwarded-Encrypted: i=1; AJvYcCXasH5yxDS/snr+Dg8MXZQxnIH0stM6ntUvnPYbjGfP3nvpcPU9h5omdFEamSaYJHgTRwqx7ywKHD3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dbtap6sd5gIz7aNiXShLsOp6Ckqll1c0+fZDwzijxF506wER
	ifk1ZsfZ0GWw6D1Te+UAUaYSD9aQb9TqnhDpqMarVa3x+zfQJiPjZcaTD3AIIgHw7IN8rwWWL5b
	OBa8xEAQEPGUZnn/HSRfDXbABDDabYXRe9McEdvz5heDjPkLckWS43N5Y9ALC6oba
X-Gm-Gg: ATEYQzw7tgmg0Nl3figFeJCBuXHEeuTY2I1FAXhtsSWb3Z3JMVvZqFuh8G1fb/hCc4/
	7Y6nrgp3uMqGDw2iDr1H6EiWCycofqVpY0ef1Ihqr+JVYs70TADrMpb+zkD6+k4cuH+A1sxj0bF
	1gj5qawdI04mZg69fuaEDWwILR/tTdwm/NELzxU7BlD6vv1Wwszhk8vgZCsaDfAEwzfQU2n9KEz
	ch3x1DqamzctUgfoW+YXsphj5slQVsXi4S1wQVi0hpfUvirSMtxPwiMKM1MiZm+VuHpnG7pe1Oq
	vcxEU7oNb3DCv5UEvigvWny04eFYiJDyCBs5kE+uPAt9B/K6j2WOw5YGR3HZZDOzoo8J+S0BoLB
	ZdjaYLTPE3zCVo1BEOx5Q+JCaq+CslMDbODEMAg2XfSG6lwxhTHwHRYuXHTTEJud5PbH96FRq8R
	iRnN33fJFT1Eefrwl675ergNpUb1zwwFT9Hs8=
X-Received: by 2002:a05:622a:1c0f:b0:50b:50e4:f31e with SMTP id d75a77b69052e-50b80eaa071mr19162291cf.69.1774387099770;
        Tue, 24 Mar 2026 14:18:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:50b:50e4:f31e with SMTP id d75a77b69052e-50b80eaa071mr19161861cf.69.1774387099301;
        Tue, 24 Mar 2026 14:18:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f2afsm3387355e87.18.2026.03.24.14.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:18:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <cqdeth56egg4xbcrfjmtea2jhrvjvwsebtemsqvcr4fkokuxte@a3agz6bcxneq>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NCBTYWx0ZWRfX7543/pJUQvCB
 n8zXiIdOZjQI4oMf54K4eas44bwHnXgkvbrgwOs4diNONZB8LeKdhZfHWx2SGVYDSDym89jgEcI
 9VMrV7fF1WZJkIuglqpscJRTwUn+ayC2ysAMerx2Km7MxcwI9rRpsORZNnho53WqnToCiT1O1P6
 kWpL8VMGePISfV5eTBcJ44K0YH1DFiAFT88+d1Cr1F+doCIuesGJ2S+78lu/+F9GagJvcoHfLMW
 u15NC7kaXcAgB/DCvsXMjcz1osQM0TavxumfqYQYUnN4ATkkjo8HbB770QzWSnU8lLHwjdxR05Y
 qW2p0sj+HQ3VCRBsu4lRjD0dIIyIRtyZTUwEhup5jxKNok48cPKquZFILHvHy534xKo2eeWJzk5
 QgaY2Tis7kBY+UkEadNYcy4Lwi8ELuwHYd/2NX9fhDF8D/ct1ixMj6xzVEqRarpatT8FKZrw7rW
 NLax0wMRDGrRyMCvdCg==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c2ff9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wdSbvLVn6sL2kMGTBGMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TQoFHtPVrYUF7atX4OnkyP5cDHQ-rERq
X-Proofpoint-GUID: TQoFHtPVrYUF7atX4OnkyP5cDHQ-rERq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240164

On Mon, Mar 23, 2026 at 12:15:29AM -0700, Qiang Yu wrote:
> The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
> a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
> that must be powered on before initialization per hardware requirements.
> 
> Current PHY power management assumes a single power domain per PHY,
> preventing proper setup for this dual-PHY scenario. Add support for
> multiple power domains by using devm_pm_domain_attach_list() to attach
> power domains manually, while maintaining compatibility with single
> power domain PHYs.
> 
> Enable runtime PM to allow power domain control when the PCIe driver
> calls phy_power_on/phy_power_off:
> 
> - Single power domain: QMP PHY platform device directly attaches to
>   power domain and controls it during runtime resume/suspend
> - Multiple power domains: devm_pm_domain_attach_list() creates virtual
>   devices as power domain suppliers, linked to the QMP PHY platform
>   device as consumer
> 
> This ensures power domains are properly attached and turned on/off
> for both single and multiple power domain configurations.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
