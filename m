Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7B2EC083
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041700; cv=none; b=abYOEDs3/ZG2l76jVxiH8XWyWe/QW1RQFE7xuoHaa1zs2siM8pwZK1tZhyeUIG6Y370r14qLPfXtRTmICK5O8H7DBQsCS3yksdaDWO697P88RzuIYvcfnkwI5RwzpdfScfO5wno4d/8BymGsUVruE6qEN9s1FGGad4jJgFHpmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041700; c=relaxed/simple;
	bh=skBxgxc7ZOCskwocphWCljGZIqgSS9Q8DkJp51mrFtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWa9eK0I6CqWsx0/YGv90udtCP9teoMMiPfFUGQ9ETMH2w5dFUuHYhM03Umj7D17AxWW+H/Lj13yJj1o4s47CLfrGQ9MQ/Pmqs/2ylgHOfmHSMO3S/fwzLI3BnF+6685QbAtuXSRNp78GOmQVqMZsbFsp4lOdH5dqGKkoo8YvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CyIQ7E7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5OOX2E8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CyIQ7E7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5OOX2E8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631A5NoN3364044
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hF2S+cZKRhO63MC9LXFCN9AF
	XGXnC3jnyECgrGilXyU=; b=CyIQ7E7uDajLl5DzAwEoIrP2+4kGkJTnfJ27inUw
	cRJD+kKe7usyxetJ3hO+/GSKJjtBiK4WdGhzJIEAFWvtcYQ5AhZ5lOv/6psWkqJQ
	UQntPJWBTLlr78qdSFndPXfqqpQSZH/cPC1aqc+3nbStzA8VBuHXh7pnRBT32OFM
	NcjOUgH7gOYlPnSsbp0XJL5fku6GdPRbVer37gyBY//DNcg3O3n2Slv/9z4ShjOL
	PZ6y5wtRlpDEi36A0eTiejmaFoq2/M1UWgFb+F/G6ki1SdixJFl2eMkIpBJYGxDi
	n8STnRgP10hImay2s8nNUUxZO6mneZyCFaJlW3QXffRZgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddk1px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:08:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so162643031cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041697; x=1775646497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hF2S+cZKRhO63MC9LXFCN9AFXGXnC3jnyECgrGilXyU=;
        b=H5OOX2E8UkDGCAaqqkgGLhLFlg24J39euEA+RQJ6dGao8pthhXKq3oOVTTEoWI8HiY
         Yr7n2pDobOf8VUczlLRZrBGTus3zEp/87OEl+rlHGbLn8B5Ui6kf1BafBeDS+YWYR+M2
         C8faKUF3gNOy77FEShIweimUNxkM1pEMXIuUfrVmfuar3Tg2EWt4mat09n1U6VudHMY1
         JuuZ0eEFy4PXqUKGjEXRsGy2H5ZsOai6x4OGa8cG4YgxSfRiyvRxKix1qOhRVjN994PX
         /vXUXOO8WPfIT5QIl5mCWrd748HqIufsjA9tkf5o7sVnG1A2jmop9AQy4N6/WltUI7sC
         RisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041697; x=1775646497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF2S+cZKRhO63MC9LXFCN9AFXGXnC3jnyECgrGilXyU=;
        b=kkzEp1/6NCB/au+WR2dCaVzSQ6tW5Jo/sxxVKf8nwYxmDV9Sa+qla0OIjtF3+PytH1
         pzSfK5XKtrX5EKOoLJtzJqpYPajSX+YGEWlC6i7ujmql4aVnnMxfVGZKf67BasHg32C7
         HbObCOF0d1/sW4XK9XmMn5VLoZOfrPuKWqoLG2mm52c2+rpoVcSGQNQCEVPKLv9WJA99
         RQmpUuJihI9ibbdYpq/RGWwYWl+BPvuvNu2ZU3tcMiCGzfRc12tcehN9owS/AJzZT8l4
         LqiPAHhAMXEbvs43miwxA9zoWjJt0eXtdIi9Mg9mqNJkLlt1lxOzo4fhbNgs7wblTMO1
         jrng==
X-Forwarded-Encrypted: i=1; AJvYcCV7/Ce3n6G+zAvG9byCxhxXDdjogU7RKNME/U5V0Quxe45Xyp1JVsM0qehzm32q98nFXfN+LQe1PXim@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2imCnMtFDGDt8gkxQ3g5VQmQFfczISoG4a4gJmUZAZ2TWxcV2
	zDMRC2gHdjTNHCOr9L6OiYZYfbcJX0GOZ7ZiZdF8wi05DFNgOFJHOTVRzDQ0ppOponVcldneuY4
	ygttznP3fPUuPCw7I73V9OlRYQpI6D3ipxDqKHC3vEJTttjfHp89zbXplajVYMQVP
X-Gm-Gg: ATEYQzyEm3G9Y5GKvZzbjruI/qleE66Y7Ymrv3huEnBbxQkNkHC/NDGq89O4hHfoLJw
	hKr4c5zTgJFbFQkjEAoKyBQ3CTgQpC4mhf4YhLM7KDEaeTNR68y2wCYxLBUnUVZGvM868Vt9uy3
	FHn06mxJlWFHWBR1S8jM7eHxh3v83rnWsEa4QHkoowTbdK5VQlhBzJ6Gl7Fbwn3VdOxgE9190mA
	4m0rr0FGWojq+ojJoQEEnGBaNQ2Iq5L1tLFLrch27bt7jmnEcZkBbDq4WKf8plcy/83GN596AxX
	svDi036h1ER1Fl4ifqH1mLuY4Z0TJVECYqRGMdLdJve+pKrYYw+TQT3xt331ED/OXRMZgKwlBVz
	UoPYORWd2PjDhXuqRPjHLXe8iTa0Mur/4q9/w2Md6A1mIKBqG5k1ufwz0i/x068ELAmRzvDXBkt
	VFIxqLTlDRudZ5ZITq3FK/qvdfcaE9VEFKOK4=
X-Received: by 2002:a05:622a:5c8c:b0:509:37d5:7a41 with SMTP id d75a77b69052e-50d3bdb0bd6mr38901871cf.63.1775041697595;
        Wed, 01 Apr 2026 04:08:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8c:b0:509:37d5:7a41 with SMTP id d75a77b69052e-50d3bdb0bd6mr38901441cf.63.1775041697145;
        Wed, 01 Apr 2026 04:08:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444c93sm3334510e87.39.2026.04.01.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:08:14 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:08:12 +0300
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
Message-ID: <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
References: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69ccfca2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=o2mePYabdwgscwI317MA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZwWO3AZFxoKCVamYnR1VmY8SvCgPUTPF
X-Proofpoint-ORIG-GUID: ZwWO3AZFxoKCVamYnR1VmY8SvCgPUTPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMiBTYWx0ZWRfX+Gs61wFGwfuF
 RfaS4tGQkm2rXLukGum9QTiYde5OZtJTRJconeGPUsW1C9N42C/O4BuU+u9AbD2x99aJawtivXi
 NczRTWPw0opd3/2/wNqnQfhDz/EyBoCWuLCT8iY9kBvd5PggvA9ZKS1hscR35TvPGvWlKni4JjO
 XgZI/Iw4Ft7jyqY9izFaPoANBpO6YnY79uCxhOvVgZhHLa5dsxo788S+Mw7Tfv/++YiDUghHmtj
 QNQG3Fm5IrxpGM6b0J6HGSGvCyBzOsBrvjOJwZXf9XtQlwqgjJRoUcKzKq/UmW+lXhDLk4BzW1e
 Q00AUgGhKaacVfLYOzCbOZYSkAJZg78VOnwdVFrFoVhpBBZK7oUkkFJlIKUZpKxbmIqY5K4nh1u
 1n12HoSKNkXdsl9TyPpX4zU9omChCbZikZOPhhONTjl6YizhSUYwquUdV8YjUrnt2xQXe80NULB
 XTyLTD9F9cQUBPbowBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010102

On Wed, Apr 01, 2026 at 06:39:19PM +0800, Zijun Hu wrote:
> On 3/30/2026 7:53 PM, Dmitry Baryshkov wrote:
> >>> - Is the pin defined in the schema?
> >> schema define property 'swctrl-gpios' with description
> >> "GPIO line indicating the state of the clock supply to the BT module"
> >>
> >>> - Is the pin wired in the hardware?
> >> pin SW_CTRL is wired in hardware.
> > Granted your three answers, it can and should be described in the DT.
> > 
> >> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> >> which WCN7850 pin is 'swctrl-gpios' mean for ?
> >> Why to introduce 'swctrl-gpios' ?
> >> what problem does it solve ?
> >> how to solve the problem ?
> > Please descibe the hardware in the DT. Problem solving belongs to the
> > driver.
> 
> sorry for not agreeing with your points here.
> 
> it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
> for 'qcom,wcn7850-pmu' with below reasons:
> 
> 1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
>    both description and its expected usage are wrong.

Please correct it.

> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
>    property have no user within upstream DT tree.

There is no "driver" in the "DT bindings"

> 3) the property is not mandatory based on binding spec.

Which is expected, because on some platforms it might be not wired up
and on the other platforms the pin to which it is wired to might be
unknown (think about all the phones for which the community doesn't have
schematics).

> 4) upstream DT tree have had many such usages as mine which just set default pin
>    configuration and not specify 'swctrl-gpios' explicitly.

I don't understand this part.

> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
>    qualcomm specific feature which have not been supported by up-stream kernel.
>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
>    kernel sometimes

Again, what does that have to do with the hardware description?

-- 
With best wishes
Dmitry
