Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000B2DB79F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052442; cv=none; b=eY1JRhLD9x4LR4wdBiBHV3b6ujcxg2mpHdLre2qxZVeLNhlG8MPWb+iHl+wH7ohO97SFfokVSfdrJLrOgvukeF9jGbcdn92Rl1+AYxVaRByWmW5wmVieMrjDuHCszx96uLRAhfl3PAjfldsovKH6IDq5qKZ5iTtmSMwAikSg7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052442; c=relaxed/simple;
	bh=DhiMO+XuPM6RBLEOGUV7db0Qop+VkIo86iVv2ArkFVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRJvFyDtDIqWDV9Xus+3AN7FyB9jpyrWNnAfI5cqyK2o3l5+94AygJ14s4m0yBsucbTMSv/dzQYwyNrHr9NDsbGdeTMw9xo1vou0Fgiiw8y1J4WXx1AqvAToX8VoXf6vq6eRR+SfHkjyOcAkVy2JlZQvPwMgssEO18Avaz3Stjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuIYaNXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5zazzxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuIYaNXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5zazzxp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631CgQdV1285913
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 14:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5VR1yslvWwKDGU+UI1kbt9n
	YPu5bCl23Xfy7sUhW6k=; b=EuIYaNXPUOtv6U6GX1ja/pM+XgDOsBi54gpRkmG1
	rwRAsQOrwSR+EPP26hFjwcUi78XtfFclvionyITjPWZLyFzIUX9IKJjXQFtUa3P/
	nj6Z2DM43m0QJaLNkB0uAvzz0MHSyDaizCBscx3azRPZQkhiwtQ416sZw3pvXneR
	sHXXq/StNx/3Ib4oV7xWhBg7fzRQPUSoR7K6Qmct+mPwUeD0PmKYKwYJ3BcSXg3g
	9xF8r03rGyB960Dai/QCO46URLM7nG87MtcZ9kOaiinkUJxlkk70YIEd13VkB9T+
	VpzO33FkZVfvR3XeoTL9QljYYfKkvBr8r3NRaGx4B53Xhg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3sn4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 14:07:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56cf4b68dcbso16499688e0c.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052439; x=1775657239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5VR1yslvWwKDGU+UI1kbt9nYPu5bCl23Xfy7sUhW6k=;
        b=Z5zazzxpQc1jLgTt4RmWfEYceUDcPn4Suzu1wZ03zmpein/889ApgPFh8fSeVkM1Ps
         /bBSQJCgEuRoGVE/hut9OhKpLP7giEpGsOX+jUSm/ZpPng+0Wp+yPoKuXB5cXaRWCV3B
         bPCjHnabZrorUR9DXtCfhzHj5YnVt+DTzug1Nu5hZjSKB1fPud4JrNOZTA0jaPWrcpcE
         HdK8Okpujqys5NI7Z9UuFZa8nb4po0FkT/89qXVhfD8lzm+o+TqywBrxnS79mjoUoavZ
         6+QQxEeTUn/gaIUL7MHZ9YY89TT6AoH0x2zYpESa3ax8LpZXG6TrAPxNqx5IaW2nBbEc
         xlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052439; x=1775657239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5VR1yslvWwKDGU+UI1kbt9nYPu5bCl23Xfy7sUhW6k=;
        b=mJXQ9vF8nrtcyNVU57aDD30P91GpOe6IjTV6uxmM86nBx1F+LzshKG8kUtG6uqsVVa
         sRJti5TWzQGVBgbS0rN6niEYPfS232XrPeJbupYt/twGxKTCqu7Fzd16r6IuccvaaYF8
         7ZiUPdefVU8P2tneZ2luc3fFtVwRM97fvSPaHMVuAmkGzhTZqC6RJS9Wy40V/fVLklb5
         4Rpn5t5/MDaCd+vsJLHQa73CBadg53OXXLi+XLBGzGYEKsjKE5VwOsEbTS0ElGO88AfC
         rrfIaNN8ZYGvblJPUyidBRmUdYdPhubLLCPXj7k9o8V1D4AeCgJ2C2igPSBdnKOce2Yw
         23Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUPbQz+PnOWiCBOCDcCYulfLPEXr7st4v/Hk0K2vM+HLcoEAg8hkGfyryn+g7U5ZTkVEI4Zk6gqHtR9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+K1bItcaRWRhP+nGdw2xYoitpP6BlGhBHgWZgpgCpRi02/2zR
	lD/mEcsrkUDv6zWfF49e9ySrqLR4ZM7BpU6Ya+THohuldfS1cQUI/TOOZE31TT5akdm8Lhv49rF
	Pt395watDAu2XNRfGLNGsTWV6C5BoZ2MiBF5rcoPLSZ93l0CB70aftft/HGHx/Zw2
X-Gm-Gg: ATEYQzzskYwxTAix0svmOoH+KSk2obhegbSEYfU8e2Ugx7MuZtot0L1R0Uy9ifiQ8R5
	jCdTn9gfbb+O+Qq6XGpNK0El7mkGc1WXwRRD/8soOLsoDxDCpS9yK6xZW0iB9KZ8XKiWDScQHiF
	UrLweyGUwXgQ2qJw5l1Y+aUwZliQhHJHqd2UrtybwSqrTtqr2TrCUkgNZhUpGzfTjFbddSKOAIg
	xh7TDnYViWjglffqiUFjDFmDtj9vT9f3wRCdDQr7Cr3L05zrYmn7ha1p+1p/meerHn+7IPjuzNh
	PagwrEocCPhzJ9fFqwqo5W0GfG66Yaljeow7P8/7m2DR2GSUYkhigu0wq4TD6qGfc1jBObvFL0R
	iZsEYhOthYjcB/gzi3c3LdfMFYkvzv2w8UtQKdi8vUI7kiOMBGmzvDR3mKI3tguZB/508Xl8D6l
	Swzu2vrcWxio+ko69WfgBANlM+C5K+Yz5W354=
X-Received: by 2002:a05:6122:80d4:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-56d8a83765amr1151558e0c.5.1775052438582;
        Wed, 01 Apr 2026 07:07:18 -0700 (PDT)
X-Received: by 2002:a05:6122:80d4:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-56d8a83765amr1151510e0c.5.1775052438049;
        Wed, 01 Apr 2026 07:07:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm511906e87.52.2026.04.01.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:07:16 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:07:15 +0300
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
Message-ID: <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
References: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
 <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
 <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd2697 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=L3hyv5IsywrdO0hFPZQA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: JLjiDHfu-7z0bCSJ8P6GCiWZwToqDj2L
X-Proofpoint-GUID: JLjiDHfu-7z0bCSJ8P6GCiWZwToqDj2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMSBTYWx0ZWRfXzCMWtp4OS3xe
 w2ddW51T5c8+kGN3nQN1nJYVC3B0R4oXJZW3mcv7Aa2PbAlUGQwIJ2IvTGIpsmvODU9pljRrGiT
 d8yPcOQgtIJ9dTj9PaqRIUbyzujCv4HKZkvGMCOLv7nYXKjrEgYlawGKk0AEKEy6GFDFRW6ewFr
 Pg0umkfwkyDcLQ2gvS3VxdLREZ4Appu0xwiVvh0AyBSB/mO+sIhEKSHN++XTbtDeV4cPjIgNwNI
 8UidcJXmycTFVDXenJnhGdWIKWXXJpefICLOsribGvZSEULSTzh1n2FsnKth810n4WDD4D/rECK
 jxb31yg9orkhL6ZJWyA1t0jIVh9cPBss91oF0EGoLaIGynNuzuXwGmi3zto3lyHhWymPyyaedE3
 ZNCOe+iElvwshIBvrLpIxBfnhi9oaPTYYPd8Wgkog34dX2AAkbkbkFuC022fBo7/MYPMkzIVj54
 Ag8KTnnjNMgSh61CT+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010131

On Wed, Apr 01, 2026 at 09:34:16PM +0800, Zijun Hu wrote:
> On 4/1/2026 7:08 PM, Dmitry Baryshkov wrote:
> >>>>> - Is the pin wired in the hardware?
> >>>> pin SW_CTRL is wired in hardware.
> >>> Granted your three answers, it can and should be described in the DT.
> >>>
> >>>> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> >>>> which WCN7850 pin is 'swctrl-gpios' mean for ?
> >>>> Why to introduce 'swctrl-gpios' ?
> >>>> what problem does it solve ?
> >>>> how to solve the problem ?
> >>> Please descibe the hardware in the DT. Problem solving belongs to the
> >>> driver.
> >> sorry for not agreeing with your points here.
> >>
> >> it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
> >> for 'qcom,wcn7850-pmu' with below reasons:
> >>
> >> 1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
> >>    both description and its expected usage are wrong.
> > Please correct it.
> > 
> >> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
> >>    property have no user within upstream DT tree.
> > There is no "driver" in the "DT bindings"
> > 
> 
> 'its driver' i mean here is the driver which drives the device which is generated
> by this DT node 'qcom,wcn7850-pmu'.
> source code of the driver is drivers/power/sequencing/pwrseq-qcom-wcn.c

DT describes the hardware. The driver behaviour is not that relevant
here.

> 
> >> 3) the property is not mandatory based on binding spec.
> > Which is expected, because on some platforms it might be not wired up
> > and on the other platforms the pin to which it is wired to might be
> > unknown (think about all the phones for which the community doesn't have
> > schematics).
> > 
> 
> got your points and will explain mine at below 2) together.
> 
> >> 4) upstream DT tree have had many such usages as mine which just set default pin
> >>    configuration and not specify 'swctrl-gpios' explicitly.
> > I don't understand this part.
> > 
> 
> For DT node 'qcom,wcn7850-pmu' of products identified by the following dts file at least:
> 
> wcn7850-pmu {
> 	compatible = "qcom,wcn7850-pmu";
> 
>         pinctrl-names = "default";   // config SW_CTRL pin default settings, but
>         pinctrl-0 = ....;            // this DT node does not specify property 'swctrl-gpios'.
> 	....		
> }
> 
> 
> grep -l -r "qcom,wcn7850-pmu" arch/arm64/boot/dts/qcom/ | xargs grep -l -r "sw[_-]ctrl"
> arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> arch/arm64/boot/dts/qcom/sm8650-hdk.dts

So, let's fix them too.

> >> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
> >>    qualcomm specific feature which have not been supported by up-stream kernel.
> >>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
> >>    kernel sometimes
> > Again, what does that have to do with the hardware description?
> 
> kaanapali-mtp hardware supports the feature pin SW_CTRL involved, but we can decide
> not to enable the feature based on requirements.
> 
> any advise about how to correct DTS to not enable the feature SW_CTRL involved ?

You can enable or disable something in the driver. It doesn't change the
way the chip is wired (that's what DT describes).


-- 
With best wishes
Dmitry
