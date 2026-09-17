Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009B2931C7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623271; cv=none; b=faRKAi7uiO30XL/Cce/Xp3CgEac43YdOMWVRtmQQtBwePoTM7eWNd/Xp/ba6DZALWxeBHbkXUcZkHY0da49pOUZc6n6UzRRjerF0zuJCrijaqXjZekZmY8XX9zjmWxENh01mCJuRYqW6ynPy1TjdEHYeOhwHNj+WtBWVj+RNJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623271; c=relaxed/simple;
	bh=+ZDAM99K40n4M0qBT8aj08eX2ECahD5jlho7HYz3WpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjS4soxUX0BxFMMkG59BiYIyWAmO3kcJDp+99WaeKzlM0aafS01fnfHWpeosCwoWt2UA67k/k/siPzWrHPHQSmPrsG11/3YegRDFKulaLxpOGYQfHDoiRIhDsQprHoyzpnzmcKEEUSuLi4USGYyVMQzQrjIpaGUDO1upvg4opiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9aEMuAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQb8w5XB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9aEMuAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQb8w5XB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0k7SK3402936
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzxDPFWdhR1CwYWxIrKgKNHO
	THh1qjZSdmpJhs7YnPk=; b=c9aEMuAWNvXHph3QXnGwuJsYU1VJuTf2v4wAOJiU
	f9rSVOswgyJ/Cuv0x3jAWghXTwDSzTmaLquH0zCrSAvl20M5kospEPhQxJqvCy5X
	4UW+3tUh7OYUDmqa/lhpZ0jnozjspKIVminRa3vmrk8Pa1h1gH8ZQvifOExl5Rlh
	b0eEjGQvdZJm6i1ULqFYFhhZzJm7lvn3EGnETzDZ2Nqsx0QzsTpRiJMKFBjgRlo6
	Khwf6iF74iFjwjIa3L/HqjOHB14vHFm91Wki0QOBZnJK0yOocyFVSyq+8YuLgB6O
	I4FzHClN1xREItSu6QfhAYW+RrCUAp1S56PUp13b+lEhQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d2qnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:34:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so446786a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789623268; x=1790228068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=MQb8w5XBq1k7VPQ8So/yA+JKUwLdAwnTzwRzBDLdGwYQHRB13y4MOd/hsBba2wcGHn
         fZZs5J69ZXvR410XbUtiFHfLbM3jEhoxO6DI4g24j+b7Wc7hl+2uWTjAYDuK/w2Vf7Lb
         fV0Pi0AJQ5eZI5peLil/ZcR/QuTF+mBVpNGJXnZ7FDxOZId140uem3L9VC4iBqcLD8EL
         BEguNZKCSQAnYTtQi0GyjHZ1Msp9SoJcNiIAIUE4xgcU5aqg+g0T6zd17MKj+ocaU8Eh
         7ZFG/Qzr3htIiNCahR3LTMmk9rG2vWLpEXnTqh4FJDaRsUQd3lnYOimAiBUzQBuZQv1m
         ktZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623268; x=1790228068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzxDPFWdhR1CwYWxIrKgKNHOTHh1qjZSdmpJhs7YnPk=;
        b=gVl3YuOPCrdQLTd1t9b//B74EgUX0gQoc35fCLG6iek2Im/YdeTnAjrwtrgySkv7Xp
         raDz4h63sCEEe2LZFHGEpLcQo/6B8P/4HlDehHZ67U5vhJ5oJG9EDXhOHbi8vnAVN9pk
         NUgs6gMehcpxodf3kQyIGSve8scFfKMHvD9Fyn116LSVDcsaJGz6WqoXAnZKKgh7GS7p
         jpZysbM6VXCCwMSN7gWo6EPE4zLN8m2xNOZGfLqh779IyJuwgIk0h6UHrOnSmk/ijnCh
         1Ruvjd1Wh6QWDRg6rVoFzSy2yIWhT0ZFEU5fK9X6eQaMnu0FR9+vThJ8yZXwE38OV+Zz
         4Jeg==
X-Forwarded-Encrypted: i=1; AKwUvBxqbEEC5BtyjRuTIUo9pf8PejYS4xo32hDL33EsAFP37etYBpvXxEUChjReUWsbPhx6ZRL1IFMBwgNl@vger.kernel.org
X-Gm-Message-State: AFuF++nK3AnTv6T7tI3TKEVrw9FsWt5JL4iixSXd8ZFz2CsFmFonnyS3
	ktVqYKip1apaQyyvLthiZKI450ExFKlMBHIBbE+2Bf+dO8teKw2kH6et0Qxo3eobRRTY35919/H
	wpt9Q4IgLwehcPiaUv7GP4X0w70MWfcOrZy7JdF63DX+qtmsA03L/oN2xUhF2olFI
X-Gm-Gg: AYBFou1qyjBQB5cHk4bDR+6czcz9ZAkC7MmO0elEDnc0aOeMyUepybuxmi/d71kukYC
	hTOsVlzUoxU+OMsDdnc+NAC1HJo6M6qAkvlJLF5LtZtJJledPww3pl6936f8seGoB/OwO4t7Xm/
	r6No3GmXu9GK+M6IdQwqZTDu+pAkoHhrq7J4LfebP1ksrscxvdWCFmAnFu1lGr9YMHwDU7jtYXW
	xBuXVwtEZz6r3Wsut2/0v0K4gDhumyvqpSQjg4773jOYgvXCUfrfRGFHmtqBABBjQf2tBKtpTyb
	iEqLo5/OS7ZIHs4lU0iMJDzblGRO5yygp+oaTukJ0x3LYVUi0GCpskayh4wHgrdKPuVTEawvyB3
	lvQzX6fqTuDCWzxToAW1uHbhrO7K15LswWxWW
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13862031637.8.1789623268225;
        Wed, 16 Sep 2026 22:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0c:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3dd5f45a0fcmr13861976637.8.1789623267826;
        Wed, 16 Sep 2026 22:34:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm13636098eec.28.2026.09.16.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:34:26 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:04:19 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLGFfQ20mCGFkfl@baldur>
X-Proofpoint-ORIG-GUID: x3FSxIXBMeNrIn6lbE2ZMOLuK8VIbI0y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfX6tAKZ/0kcrAk
 rCoUmOB8Zug+bRJoYrPpj5MdsatnWjMCsYQpbhUIrURatCXAfQoF31L54XsvwgyO5Jx2BfxO3Og
 G5JhvDLnfqUwakjWSdaVTcZGbdumI64=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab7be5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=CPdafjny-J3xFrLEVKkA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: x3FSxIXBMeNrIn6lbE2ZMOLuK8VIbI0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3MSBTYWx0ZWRfXyJWOpZQg2xDN
 VZu6yS23W50TQTr/PbC4ELLDP44fIEYV9m9EQmtRc26isk/kq6eD1/lzSvoiWWG5kvrN6pShaDU
 xejvX8iXbqbsENvHwn0RdWHdsi8/BPSNswCtYHHQsH2VIuXoeRpDsH7F84Qstx4GU2BZXQKV+Ny
 G2rnrP1QC6yfrpiTZjD2BY8JwJEXBzfa+uhlpxy12Zc25/3w3HmAedRnX1pK6OIIXEpRNdeHJEe
 boB0tNYn1wUyRYyxhALx6rvCt6FOrJPwOy2CyxWUASZKqwA2cxTbk3v0b113xf/nMm4a/0YIW8H
 4gW5fNdZB52MM+jmhE5eR8i1VdcxXsonou8R0jXI7H5kAtejfUlQXxgMb+/EH6CuTKJfaU7FbUX
 NZ4H3YczeCJpz++YcIcyFkSxfrJSh5FXDrqDaZ6DyCdJLiIl4BNO48VNw1S+osIo8j8IYQcYsDb
 HblPbLIu402WS0j+0Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170071

On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > 
> > The overlays configure the panel on the primary DSI interface using
> > a 2-lane DSI connection and instantiate the panel MCU on the
> > corresponding touchscreen I2C bus for each platform. The changes
> > allow the Raspberry Pi 7-inch display to be used as an external
> > display option on both EVKs without affecting the default platform
> > configuration.
> > 
> > ---
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Shashank Maurya (2):
> >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> >  3 files changed, 169 insertions(+)
> > ---
> > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> 
> The two dts patches in this series clearly relates to those two
> regulator patches, which has received change requests.
> 
> I would have sent the 4 patches together in a series, but as you didn't
> you sent this series with unmet dependencies.
> 
> All I can do now is reject this series as well. Please send v2 once the
> driver changes has been merged and you have validated this again.
> 
> Regards,
> Bjorn
> 
> > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > 
> > Best regards,
> > --  
> > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 

Hi Bjorn,

Thanks for the review.

The regulator patches and DTS patches are targeting different maintainer trees 
and therefore were developed and submitted from separate workspaces. While the
DTS changes depend on the regulator updates, the two sets of patches cannot 
realistically be carried in a single series because they are reviewed and 
merged through different paths.

I submitted the DTS series separately to start the review process in parallel,
but I understand your concern about the unresolved dependency.

Regards,
Shashank
