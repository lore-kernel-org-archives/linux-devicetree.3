Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643823C945F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871612; cv=none; b=KWUYuWLIOyyW6idZweHMsmMLZc8sapJcPvQCQEeH46CH+gcT8RwNXBeaHIq52M3G6Q6PI21V0h9V3S3fc1F90bPA7eYBhO+KWCtNhP97Kh/hFSu5Pj1CKOH5SOBBIcwfBc6hcRKZP1K/Z4eqrEW4vaSJwebFk9YpYPjiDj4ptIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871612; c=relaxed/simple;
	bh=zsVMO35J47yKLnPTtouSttTrHxQk+BAvB3fwxL/4eJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAJCX2CZCEEsasSehcMwNvZEnaFmUI6sSt1uHc6OynRcpDOP9OyO7zJKiDH9D9b9kOAEZ0a6/mXQQTx0zx80TouGzHkknYFwzosLCI9G4j94VyC+o9kZGODappY1vRxx2a4slPRgMOWM8TPNX8tCvsNkxJBgqshcgPURW48R7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLfWmOUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGk6ECOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLfWmOUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGk6ECOD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9RN9Y2954647
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VtOtPmVBiuNeTzXGXFpTSipX
	dzWD9aMEGabvmiVCa6E=; b=hLfWmOUffkRa3sHUFbBbS9Zo5o4e+v1KxsjjkwGt
	Fy6CgTou9tyQIfSlZ2x7Q+wrNFlOmafbW4lzlxYNRZYykNjinNLSqCXAsO7tuDcT
	E9/gqEzzOJHt63Bmlw3/4wYT4r1eIl/F1/Xo5/F1Wk2g77Yf05rPoVfaEgjyyilQ
	6qRlbXMrtI2aXmMCHaKrb8gbyH8Stp/Cw7oAR/BKEEdkXZWFCLBjqguSAcnzefzl
	6kdYz5PF5FvPywCmmmR+Pg8j5lQQEbhnF+2d9jx0Y++BKT+MCnxZtGwmvGKzxzyR
	8R4REUjg4XyDOHitQms+MJ3/Gxheqj3x2YeAc2lRd0zcJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqekvjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:53:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso84787391cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871607; x=1775476407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VtOtPmVBiuNeTzXGXFpTSipXdzWD9aMEGabvmiVCa6E=;
        b=BGk6ECODei6T+lNrMCGYMKqfjVMkIW9+Wd1ij1n/dgnoxm688pFk9fjEkGMa3EfOFf
         aMt51RWOXIzRA4zifFDq6n044N1eNcAEn3s/smq6Ja+cZ1SyJq+J29BBOoW7JjT9A1A7
         vzKvrr61WiJqCaMlUnaVBvAZkArQKiZ6K+XGOuZ/9t5nLk7tCQys5QuLIFFywD275Vdw
         M0ELnKXtwg3uH+dZT0NXB5tlK1S1+tRcIa+THorRvz/NG+io8WTk3GofHr3gH4rHLlLE
         4mROf2UbMHImDstZsbNwLZaX3xW7V/2c5kxt1FdO0Yjq8xvhssDux+aaAO/+8TTIkfvf
         C8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871607; x=1775476407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtOtPmVBiuNeTzXGXFpTSipXdzWD9aMEGabvmiVCa6E=;
        b=G4a3fqAKc8X8pxNdhdSM09XSgVOTa9/UuxUgqz/zBZlfLiWpkf2E63JOgTM6L9HqVF
         uvtbJRlwTgHTF1ZW/f7MUpTO4Cz+gBrgjH/uO+tAS9GKmJNDBodW0HA+CSIL/VkEglTg
         sJCPxbExcEn8DUCpWgY1TtBZePVPze1MLipKz4QP0sscFw1Rt52lMgvl4iKupvjmoJc1
         Yb2ckJQFA9L8J7pLQ5hbYlr8Nam1hTeqCSHnoeI4aJ5sFjRiKOzjkfCUwe2Q6Mc7pBV3
         BBLp8bfUBzpR3miFX1GiWuC1pbmMwdMumZNKQkrWqHrPeMmayaNKrmTLgPsNB4HPazaN
         UnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8tnrUfFLEkxC1aoEVphKFXDF+TUhJTUNFm7kIPTgkvFXpkDM/OzEfudEumI/pJ2yjDj9hsAaQ+oUO@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhM/wrg3WsmrRnJdBRKqbFfq4joOZnmOSkUDQ3PlsUOfV81sD
	hu11oWHWb547HiYlkaEv4rOty6cyUibdl0CrWh7oScGbRV1uv93ayxinexKg+DuArUadpCywdI9
	hz4MEqRwRkjUX2Dpi9r7tKSq79/5xALBupPie7QOKBWoIGwND1woIH8ZB61dCHXEV
X-Gm-Gg: ATEYQzx/1nIQzVG21klbUnM5At6MuMTxAZ9xkUp/xgLSF9EvVWMZGHmS3oyoa0JQw5D
	paC3lpL77vyjiQLmIsUAVxDllOs50xhPyCytRsQZm2qz//037TaESRazem99WnrrjTveYb0E8lN
	g38siLcDf/Au5aqBzD0V4t+mdqb7m417L1mIbfRO3AE0pwuseZ6T7vvCOUPiNc/xCTYjQ7WZUR9
	aSjdmyyU+5StSISEnsrVnXBzXZ0c/FnVw0V+oR+Gg+mB2VN60AZZoE6qMct/BRfz8LjcXDP8uK4
	aNcEI2jLX+NdURnZPdmhP69H4D3tQX34hF/jJ49ky04tdAif5QPbXh4VAsVk0bHU+huV68AwbCN
	wXPPodiYV3tZeiCPLiL2dzZowLH8fNrT0YdPVRDg4pmXxboDZuUKy/ySvQlfnwlMjFHqFxyCuun
	Miu0jldi34hkWh8FsLDF+vpP+2NwTWYQMJlFo=
X-Received: by 2002:a05:622a:1887:b0:50b:6a48:78aa with SMTP id d75a77b69052e-50ba38090edmr165519651cf.8.1774871607418;
        Mon, 30 Mar 2026 04:53:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1887:b0:50b:6a48:78aa with SMTP id d75a77b69052e-50ba38090edmr165519211cf.8.1774871606967;
        Mon, 30 Mar 2026 04:53:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4312sm1588471e87.16.2026.03.30.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:53:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:53:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca6438 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=aFXXS-vr02nWGIN-Nt8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6QvyLQqCSXv-afCqTqSfSUmvp8YQEYpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MyBTYWx0ZWRfX5LMQ2kkNSmAY
 /yKLXvxZfA+OIazeNuZwELg0KYXwkOSfROSXKglnyDydTJQlIVVLTSBpzhW1ybH/cgHs1j324/t
 ec0jIV66Q/v1yoTp8IqK6m+X3JtZNPRO3PRhPIe678VzEcUrJFilY/LkA0LbcA18D7k8g2PjMUx
 bhRTCNttnmxs96Csg5hhMehf2RgFy2y4JwnWOWrinvm5RC5Yc8tYEMMfOzrfGiSlcjtDrQYmIdE
 kCWGRzGkMQvb27ffb+LZlVwJWn0twt7LypPz3o8y9Q5Wt9PXtcOtrHP37QiX+M9s0Xysg8FN0AR
 0PrMuufB8MjDhZUZMai0lupwmKvrpm7YIbEkn1+DxRdmxFvqOFviZ7uFvNkLtgIr0osOJgFcAf7
 gUFfdNtqpqCINmOAeCZPlpEpYrJ6aQt2xn3Z1fDm+kNRQZIkO+5ejYeaOgjZ3vqprWxIxWxS2DG
 IKWz2wjBdwHXgn2qgng==
X-Proofpoint-ORIG-GUID: 6QvyLQqCSXv-afCqTqSfSUmvp8YQEYpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300093

On Thu, Mar 26, 2026 at 01:15:44PM +0800, Zijun Hu wrote:
> On 3/26/2026 12:10 PM, Dmitry Baryshkov wrote:
> >> 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
> >>>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> >>>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >>>>>>>> +
> >>>>>>>> +	wcn7850-pmu {
> >>>>>>>> +		compatible = "qcom,wcn7850-pmu";
> >>>>>>>> +
> >>>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >>>>>>>> +		pinctrl-names = "default";
> >>>>>>>> +
> >>>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >>>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> >>>>>>> swctrl-gpios?
> >>>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> >>>>>> the input pin is not used by power sequencing driver.
> >>>>>> just give it some default configurations here.
> >>>>> Please don't mix hardware description and the driver. If the pin is
> >>>>> wired, let's describe it in DT.
> >>>>>
> >>>> give comments about that pin in this dts file ?
> >>>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
> >>> It is there, as far as I remember.
> >>>
> >>> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> >>>   swctrl-gpios:
> >> swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
> >> which configures 'swctrl-gpios' within upstream DT tree.
> > It's a wrong way to check it.
> > Instead follow these steps:
> > - Is the pin defined in the datasheet?
> datasheet define this pin SW_CTRL with description 
> "Switch request to the external PMU between active and sleep mode"
> 
> > - Is the pin defined in the schema?
> 
> schema define property 'swctrl-gpios' with description
> "GPIO line indicating the state of the clock supply to the BT module"
> 
> > - Is the pin wired in the hardware?
> pin SW_CTRL is wired in hardware.

Granted your three answers, it can and should be described in the DT.

> 
> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> which WCN7850 pin is 'swctrl-gpios' mean for ?
> Why to introduce 'swctrl-gpios' ?
> what problem does it solve ?
> how to solve the problem ?

Please descibe the hardware in the DT. Problem solving belongs to the
driver.

-- 
With best wishes
Dmitry
