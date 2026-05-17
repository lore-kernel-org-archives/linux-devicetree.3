Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872192EAD0D
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045382; cv=none; b=Nqd+OKMqpRRkg43DD5+cjHIFeWYiNcVPRu/KyERttqJhZHLzcsNyz/xsL/wc/M+jWWkTqh1ZbXLvmoUirLcDxq+UHHOEjjOK7cB1SYlSvJSo+8F2Joul4bcL7GXk18jUqXog2hVuAOPIyv3n4dzrca4oF2UZ56tMVsjRsfF1dIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045382; c=relaxed/simple;
	bh=ajcVKkMSh3HZ2O9xTbj8ouTeo9knFGZ437UqLJG3YRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZkxMHP6oC0jeeUGW9QrXaM+6euAiNW/bbM9pnStOKVzet3Usl0kKH5Qtx+nPa5fegUDKqDXOGwGaV0S7nTY+o4wa2mh9VSOSYerDGrOcelknugeyVoPvEoWCewx4nj0e94DPPk00iHSUHNhUjp3rab7bYbwORfxV8tnrvPnD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZIqDeHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzzEY1DR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZIqDeHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzzEY1DR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4bkbD3732307
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeNI/0Q/nyMCZAXDQZlUbcd+
	LHYzCauBoa5Eblz37AI=; b=YZIqDeHFpAJuXKL3OBh60odkfDfjg9Jyfa2MqQZr
	u1z/O0nStxEF5gSLuw9Tal5cKvt/KIhqG16k7Wkn54IENJtd1sdYigicHZ2qlStW
	qNOUXBs2BK+11hJKpFr7v9oiJZFqTjkx7WOShepvOW5K159JbqZFiW1Kk9XImvGU
	y5Zpm6KxnTBBdAsJN7YyqKyCdAYv0CDkOVRxMBf0Xnd9d3fuXgZ+EVbIyUPzy7aT
	67SZFR8QomevJ59Zgbb1Eqh2tUNJFY9zGN10HkspMB2l1qvDfSUsCq88hIInk/YD
	RyihQGuY60oosEQY1aixBTmDTKshWf0TAyc9RqviQE8SnA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcbctg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:16:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce6d50ea7so345721241.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779045379; x=1779650179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeNI/0Q/nyMCZAXDQZlUbcd+LHYzCauBoa5Eblz37AI=;
        b=ZzzEY1DRrVUr0h+Oc3zfvnHu5iSiK+ccHDU/wD4MTgmms6L92JmG8yd0GCLUkbvddw
         qWO4fpnN9/rRLKJW7aH3W+bRtcKsGMwmi4GqH7rrDxr1+hK31ONszOqCArSJ9WlAHDn1
         /LcP0JQ3TOxguDz8ZWRP1QkDKIGMt0/Z0SPuNUsOw+fXGquCMq5wkc5Qx1HaGQBm2TuZ
         ftU5LE/SuN1QnBYmtGVoBzByPdWwfbHnS9o0xWf90m+OEt7qPC3x84k+pYGcTRaXQOH5
         o8f/W4tUrI7o5qGc1FBwBMpG9u26xw00jL4Sjjg4MR9UxoJdrfz7UuPTk4efXjv9Rzcy
         5uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779045379; x=1779650179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeNI/0Q/nyMCZAXDQZlUbcd+LHYzCauBoa5Eblz37AI=;
        b=bd0cS7g10bTRKQHJQLfe7T9HJUNkFbqnBON64fjdpF4y6vUhEjhpiA/RpqGOn3ffF6
         PxDTUuPT2kIQkdJZcToJo/aMLMzBNYRWRtEzklZt+Vf3BwufDqxWEdobIl2dTKpXr2ha
         VngB6/gWj3KQoIYwF/55MX8boDMWNu1gelGR+SSzNPFIfU69+q+1Q4hOjjA4dB/hSZvH
         CgeoD/Une2FAjefcS4kRDlWGJnmmq8sax34cC0VjaQzKLkDHXKXeXdNgaV8yNX9jJ45K
         KlWbXpeGTh2SnZ91QJubXbWELN/TgrgYW8uUjtlW/MFfMz9zGd/FlZ+i8N90ozox409l
         Q4zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AeFmZ4ycAJY6wgQWLav3SHCAYY/FHVLGBuqX6+2qzUwAsy0Bho4MN1OFa2pdsT/kEHDuboFVvewyM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YIvbXnKCZ54vv8SSohsDmll2kMdMIXfhc53H/CZ2EX7+xr9d
	rIsRefwbFY4XxsPD45HCpPB3GDjjQOB/T6f/seBJgBszVgWt9jd8NSZSJRTFcIpide8yxaanTDN
	0ahPaxoEZnhWKBaC9F/OjbvnzG4tO3aqDsU44EWmKlOAqG+GRKaP6jiszEYdqm8U0
X-Gm-Gg: Acq92OF5UBGfrJ0R95j/u845p0kT/5dYHOuX4rzORx2jzyrS0PROc2UWmgF3SoSXRPo
	FaSJjOSV3AzqhBgP8pVsHscL1+7PklV2q4/Yv3lHR68EDP/rlHoOQD/GGD7Xbslxf+40SGEoqHC
	yvHrdE9MpoCVAuRK52jVCTG8gVfFAGPwLwoY0P2VnDSm0XAsbx2xx33rjbLSnUzJ4CGDP6/K1lX
	8b3w63suPTi4Ngj4d8RSGfPfiGOlVGj452bb3c4a1tV0SmkmDkSw8+WZ7AeUfSET0QcrH1SUdm5
	HX9DJTNQmVeYaBT2HCOxbaX1RBPa8fAjCyb/rlDH1xx5XoZkzfdYiKt7twGipM5LG9uvof4Tl0Q
	keE4xbN1SSVv8XDVO7pxZfBWsFoxwRUpgNPRO77OWitxTrPwqIqLUT+MnaKvmzwn6SMJlAEqWQr
	r/o8NI8zntsufGv3w17RB45Su7ac8N3lZjWiX3cBT08iIWKg==
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr4184979e0c.9.1779045378671;
        Sun, 17 May 2026 12:16:18 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr4184948e0c.9.1779045378156;
        Sun, 17 May 2026 12:16:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc171sm2864994e87.40.2026.05.17.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 12:16:15 -0700 (PDT)
Date: Sun, 17 May 2026 22:16:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Message-ID: <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
References: <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0a1403 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=X9ApwIYagb19aBUu7BoA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwNiBTYWx0ZWRfXwfH+Xgb2nq28
 EzyatYnOO+9PTcoEkppAuo2vUGPkD2RBCmMqBZ/W6l6BfCStN5SaG0fTip/Zr/0V7AIVPaa6uGU
 FcNZEmkZzgQ04cZWBfQ0aNbYkCXYckiaSqLqsj/DBu2vZYvwcb/UsuSCeOZQOddxgy39FnXCjqr
 o1il7fYklVB1t/wUZr5zG3yP9aBr/DTUP2ZRJLVtpwTGefGi6bClIBYxUky5FZlsOEtYCkTd/mH
 vYT3z69/cO9E68YOkRUKpGdkzFnJMHnxi3yaVwHucppnaaXlRNlz2fGbcPoxKSzqumGJotIh6RW
 WrGCLQN9J7/jBwPfUxRujK/VuJK7uXJSWauDy2LarU9xxvRiBuPdovq//5KfTydaIPGfNqcOH7k
 RBPMP0BXjuDBJxZYAnCGeWluC/lzmZxMZADVlgX7XxHtWxZiwWDaoCDt0jRx0QPDU4yiKTIp4qN
 C1loDQKH/Amuc/EPHGg==
X-Proofpoint-GUID: RH2Cgo9LuPxaOXdh417Y7EULievUuNDz
X-Proofpoint-ORIG-GUID: RH2Cgo9LuPxaOXdh417Y7EULievUuNDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170206

On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
> 
> 
> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
> > On 14/05/2026 08:22, Krishna Kurapati wrote:
> > > 
> > > 
> > > On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
> > > > On 07/05/2026 13:37, Krishna Kurapati wrote:
> > > > > 
> > > > > 
> > > > > On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> > > > > > On 05/05/2026 15:57, Krishna Kurapati wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> > > > > > > > On 05/05/2026 15:27, Krishna Kurapati wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> > > > > > > > > > On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
> > > > > > > > > > > On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
> > > > > > > > > > > > Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
> > > > > > > > > > > >       1 file changed, 2 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > > > > > > 
> > > > > > > > > > ... and then I looked at the driver. So un-reviewed. Devices are clearly
> > > > > > > > > > compatible. If not, explain what is not compatible.
> > > > > > > > > > 
> > > > > > > > > Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
> > > > > > > > > 
> > > > > > > > > In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
> > > > > > > > > GCC_USB3_PRIM_PHY_AUX_CLK.
> > > > > > > > > 
> > > > > > > > > Hence, I didn't use a fallback compatible.
> > > > > > > > 
> > > > > > > > This still explains nothing. How different clock makes interface for SW
> > > > > > > > incompatible exactly?
> > > > > > > > 
> > > > > > > So I went by the naming. AUX vs COM_AUX.
> > > > > > 
> > > > > > The naming does not matter. If the clock is called
> > > > > > "no_one_expects_spanish_inquisition", does that make software
> > > > > > incompatible? Why would the name itself matter?
> > > > > > 
> > > > > > > 
> > > > > > > Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
> > > > > > > clock-names mentioning "aux" ?
> > > > > > 
> > > > > > I don't know, I asked what is different in software interface.
> > > > > > 
> > > > > 
> > > > > Hi Krzysztof,
> > > > > 
> > > > >     I checked with the hw team here and found out two things.
> > > > > 
> > > > >     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
> > > > > regulators used) is the same as agatti.
> > > > > 
> > > > >     2. I thought we could use qcm2290 as a fallback since the phy register
> > > > > init sequence is the same for Talos/Shikra/Agatti. The difference
> > > > > between Talos and agatti when checked in the driver was the init load
> > > > > settings. I checked with the hw team and they suggested using the init
> > > > > load settings which talos was using.
> > > > > 
> > > > >     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
> > > > > fallback for Shikra.
> > > > 
> > > > Then I do not understand why you are using qcs615_usb3phy_cfg for
> > > > Shikra. You say that the initialization is different, but you use
> > > > exactly the same initialization. So in a meaning of compatibility
> > > > between hardware for Devicetree they are compatible.
> > > > 
> > > Hi Krzysztof,
> > > 
> > >    There are 3 things:
> > > 
> > > 1. Clocks used:
> > > -> Talos supports AUX Clock since it supports DP over USB.
> > > -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
> > > 
> > > 2. Phy register Init sequence - same for all 3 targets
> > > 
> > > 3. Regulator init load:
> > > -> Different for both Talos and Agatti
> > > -> Recommendation is to use Talos regulator load values.
> > > 
> > > SW interface wise, shikra is comaptible with agatti. If we use agatti as
> > > fallback, we would end up using the platform data of Agatti where the
> > > regulator init load is not suitable for Shikra. Hence not using Agatti
> > > as fallback.
> > > 
> > > Coming to driver changes, I used qcs615_cfg because it has required phy
> > > register sequence and regulator init load as needed by shikra.
> > 
> > So is it compatible with QCS615? If not, then something is incomplete or
> > confusing. The driver uses the same software interface.
> > 
> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
> the two PHYs are not compatible with each other.

According to the memory map, there is an (unused) DP registers part
right after the QMP USB3 PHY. So, sofware-wise it is compatible to
Talos. Having the different clock input means different integration of
the block rather than the differences in the hardware block.

So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy

> 
> In the Linux driver implementation the match data is currently used only to
> affect the init sequence and regulator init load and here Shikra can reuse
> the Talos match data structure.
> 
> Regards,
> Krishna,
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
