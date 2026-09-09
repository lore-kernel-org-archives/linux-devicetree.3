Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92710545D92
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953661; cv=none; b=Ltae9+yAq02IxFAIdNcAWAomnWurAFN7xx/SL0zVnJEFBuJsg2NXl+itQDB53RVk3dmQqelmD2EhhOe5xJGm647OOqxx0by3o4u/N2DKZbNRlqAU75qGdzRzosL3sOYDsasvQzUwKA3iy0r7gKwPGIRHWoDFUkuwJicMNs6MNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953661; c=relaxed/simple;
	bh=gBHBZjUolX3ivaVZcN/dbcES/2LmlGtAFF2GWiOv9zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHSWR/iNGvtsGlQ8jW62v+O9QJ9f9PsWFRRcA1tvtvW8y6wPAXiJixtRrbsVp8G8aNNGH/KNIZ0T3u1mJKKrMTqJx28qVvKDP0TRhMFtfwZIwc/5IxVEu/1wHXq2EVW3qeYEk8cJ2Bhaoi22mKMtpxnKd6RSNR/fVrZSl3UhrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHsylMHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWelVWCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHsylMHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWelVWCB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4eW2171613
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VkFNie0npr3o0gEEDYtkg+VD
	BnFIkHEk4uIug4kbZDI=; b=kHsylMHBdmve31tkrzie5pyECzo0GZjJ6Vo2xsuD
	yZlVXRUEhWj+ZcorFC9P/zz8x5kKb/AazOEZr47smD5RtlMItDp/D1mmuzuoaaBf
	kU0x0ktd/I2seoUI4HwkrgR9zVAQYa/C2wklwxmwTtbSEukzdCGE+gwn2bXvdN2D
	ck1ZGKc2IdfhPwnP1aKmyK+DDqAgJR8AQUmnLq1HdJHdff0RfH06uaU5VwdwE+1Y
	T+jZTxMBiUvsE7wy1tELhXAr+3Ksr0TjPViSxiR4iJpNxm5FnsojufBJsLYw9R7E
	XhgeQxIDnBPkfdxHoNluav0fyj+Syl+b9HRaoYg+mJzsdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgg7hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:34:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so7294715a91.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953657; x=1789558457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VkFNie0npr3o0gEEDYtkg+VDBnFIkHEk4uIug4kbZDI=;
        b=aWelVWCByOEoSBuA4ylrQ0KkikreqSfSFsNyQ4nUy6sQgqizhQwrBdW4BG+hl0hu0h
         g/Eg2xBqEGr3FeUSHHsRQCGkHjgs9+jfs7JvYchlFsZcabPL97FfLujLrHJEK8TBa+B5
         ttcdclvpsWfYsw2PgcdQ+CL1gPMtLSLhUujd0V43IwDcY9YPC4gdWXFp38NFH6Yj1RQq
         SLVFpXPhz+cWjfP2Sdcq0AS/izqPo9hHSAe9z4apqRiYi6BuU+opGge1JqevR2paTnBV
         fKYIaFRaKh2DfjnGzd33Tb3d5FziCbtSBztLVUVHHW6sjwEkwfDM/wStvziXYIemWL2m
         l4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953657; x=1789558457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkFNie0npr3o0gEEDYtkg+VDBnFIkHEk4uIug4kbZDI=;
        b=rycTy657MAO/CKYqT2+Gdli51Hq4uLKBfYIUrZaj2/pEl3leKxnrgbU/Z9EqXmpIU5
         WXDwFuO8eN1GbBIHqla47BYYYinCLDxMVtWAqR93O1DAuprAjLXDz0Cx1dC5F9GKH0rD
         Fr+GT4N82D40S60GcZI9mJyfPSXyvNA8w5+39uZpTtBG72b9R2BcUchTB898XazHeR66
         x91+mY0sUtETNC8MDtxR0zZdLiV4G1C7xoLjwE3C8CUfOUaM8WhBxvIr9xmkK1iXbT8t
         vk3dak3NtD+kw6j14zQbpO0YM8WzyNMACJvoiy5vPg3wmtXyDxUN//lQLmpeQE71k+sI
         hiCg==
X-Forwarded-Encrypted: i=1; AKwUvBz4imhMxndWaG/+pk93356ZH5qyqx+LUy0Vcs1aSuhZsgYzvHW+9eRx96Npw0zYR5k0mFVx6DqgTOoS@vger.kernel.org
X-Gm-Message-State: AFuF++n12rM5ijnldv7IEl6sOe0ZmFXJYEBabIh6S/f+jrJyzQknKdaN
	ojtlGAFRdyTdylvrS8sh09JksOuG2yd/xcSVkfxSY1a9gveE6zs88vpjFSahsSdIOm+TOAUmVbv
	1ZNOT9vDQ5vT3qDFUv22g9YURAJUl1hKnpwpDc6/T2cv82rxRCE1zx2tqNxTW7QUs
X-Gm-Gg: AYBFou3Vh96bQiUCdmz9BaA9k2Dxgo8GaeIw51nNtd9aI/ZByf+Q8oOQlByeRboz1H/
	B9dkrI/oiBEd9SXylQXKOIVo0jOiwOENxNUFXVaS10BeUVntZBcrMmHTx5uYgA0Pulxes6s6thO
	PYjIgw7oQqVXejkbyREXJINqBF5uzRH7+jHSgHqeI3e/UfBml1Uo7+OV9rmRLBahNbJ2BKq7saM
	iAAVhcMvP+CULmrvn0IwMA0DHMCutQGwOY13zqnrhgpH3fXXycKn/xdYGkTx/OBDLd1k6E20hjM
	kVxb98i68JAwr7Mkv1aj6BEaYfzZe0gt4t1Zz/ZwICMXTkS/LNuMdPRgIwvMNlYdW9eKt9BDl/1
	IJsAttLSlXD5OqQ==
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr53996890a91.9.1788953657101;
        Wed, 09 Sep 2026 04:34:17 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr53996780a91.9.1788953656466;
        Wed, 09 Sep 2026 04:34:16 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm12225302eec.8.2026.09.09.04.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:34:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:04:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Message-ID: <aqFEMWZOjK/DyeII@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <4aee70eb-bd1d-4320-8921-e55bb8e0d176@kernel.org>
 <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX2XLnkcpYCxIA
 kTQUrEAVZoVlBQHxzBa9Q/rMMrDKd3fALv1qVnxFT6fG6yfMUICaoyv/v6NlG3sacO/5ggHeKOh
 72Oe/j3X/sajiqDp34Ebvyq1s0+E4WM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfXzjohpIc7R9ab
 qeN9zolIRYSgnwVoVKQs1p7ORb4kPBeFx6sS6R1/M14QhvWr2+Tr4nyu06ZZUDx9+l8X+hQnidi
 VuA6z+iDHLb+/sA6YYA4BMRCC6zZSyl8+A2+CnAWl9WEdRjLLPMFy+PgmZ/6KRdGNofH1BRqrX9
 ye3Rj1qHZChsi0XoaK85UWl0dJu8YWArg+3cqhzdSYB4hBcely1k3dG+tUZDOvJiC/ElWUT1qnM
 2W1wWVFS92yKjshyeywjZZP7ZDkGZdWG4OxjyJbl9vNgsMYF5QaZ0+QFm3MWe2zmKG8njTrodRd
 a/hctnd4vy18Z8JpNlSqNGBJP1FfRKc5aVbly6fyHvtiXy9UGoCDGkiv5V+2fJ8DMfz8NypsJYs
 aS4qVplQ0E6DzAWx7Xct9g43N1yw29LMKA7U9mDuE8RC7oHZHpvRXrQqGpd4IL6sme4iJCg1sW2
 CuX7+dNT0lpaczOYbAA==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa1443a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sXEucBwicj8mESCGqQQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: rZxsR8hwkLDpcMqg05oMHtWSD1eCaMPD
X-Proofpoint-ORIG-GUID: rZxsR8hwkLDpcMqg05oMHtWSD1eCaMPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090128

On Wed, Sep 09, 2026 at 01:30:04PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2026 13:24, Krzysztof Kozlowski wrote:
> > On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >> The GPIO mappings on the IQS variant differ from the CQ variants.
> >> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> >> Secure IO pin; the latter is connected to GPIO49. This incorrect
> >> reservation causes the probe of the second Ethernet port to fail:
> >>
> >>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
> >>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
> >>   (GPIO_138) from group gpio138 on device 500000.pinctrl
> >>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> 
> 
> Apply this patch and reproduce it. Is is possible? Didn't we talk about
> this already?
> 
> >>
> >> Replace gpio138 with gpio49 in the reserved list.
> >>
> >> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> >> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> > 
> > This looks duplicating:
> > https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> > 
> 
> Ah, no, mixed patches. Duplication is between other works:
> https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> https://lore.kernel.org/all/20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com/
> 
> But nevertheless I am sure we talked about this, that commit msg and is
> not accurate... Cannot find the thread, though...
> 

Yes, I'll reword the commit message so it reads as a prerequisite for
enabling Ethernet rather than implying a current break. Also, the Fixes:
needs to be dropped as mentioned by Andrew.


	Ayaan
