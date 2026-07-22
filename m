Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012DC33F59D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727933; cv=none; b=iQaatxY3sDoF5e1u2/fFkTWUqFM2JKgJnFHTTTBpZJXT0TTupnIkAkYOvGh5oRgzhEnEmWEx7TSxuun4ea978ud4v0Wh3i6TlWaJQq58/EhPAzowwvqslHSfPYc7qnYlQRpGdSaEOwCYhxEpyU3ohhwYGCeN5m74vaEhnfFjaE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727933; c=relaxed/simple;
	bh=paG+iWxysrSOpslrh4rSOqCKN6UNGGbeb3lknWMvHPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcHzB5rBMVzKMjUSn1Fh+2zJy02C3dN1f+/0VVr4LDR6gnCvz/sL9Pb0blw/D8yBn/jnSqWTmOXmLeMlv6iZjbhMzlpe6yCRpg92vnmHLwUq+EjJsu+TKrMoHWUt6qy5qkWPxNQyLez6xSqXc3BKB30KNRVOws3aBcmPaGiLD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7AUa+s1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTaUMMky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7AUa+s1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTaUMMky"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWur41034100
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dzTgcV6aGKBlGU956yU8LpsW
	tJh49NRiC/iioCtnUKs=; b=m7AUa+s1O38PGR2cVgic6D5tjjYwrJw9fHpuZ505
	tXdV3uLeVvkvMypAGTAfQXFqooPSrp23nSVXnaB0115aI2cHHR+tGp0e/uBd7Qgm
	6b/09c6MihWlyvfuVVtVZsodf/5yXSKRFRMP+3NnFH0ARjnjp8mMdfIS+FGkL8hC
	9NWny60dAFKRMJv3A5s6qXWpBXRaAfavcco5q9QMMfBio+RkgexfglO9/yPpyhzR
	pTCyZcGGGKvw7wKSa9c90W8wtgyMERqhevSRxl+OipBXVXfXmhAZ2fgooA8uE4SL
	rRVnosWUn73qIWDiqdd0ucf4ShLrq1tb20QtSGSmcHl1QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdj3t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:45:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so200666651cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727928; x=1785332728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=BTaUMMkyMInJgoC0Lo6JSLTJsw7BEsUwDVHbz+ZcV7Dv0GXHZ4XxDmdyEMW+JtNaoO
         YtY7/+hRqunrOoNE9KNjPtBTSVeMZG6stl3AQfoD+us7VDvHKY4Juaabn6iZC8CeD7o3
         DeYS29X/9k/eTWoqltPIJzYtTW9EeCAZA+ad2Reid3Cf/qJAuEGLn7RrtUVX5qypnjQW
         9UXWqy2frEdSJPzJfpU5jYNPG7tNzXt3d0m8/15k2BcdMLlvPkvPXAcxsa1DKVIbSCdm
         nzT/dr7OnaM/x42wLQTxEm62g5F+MlTlo2z3Wtm5ep4aXcjAMbDXVD/0twS+qOd/Xi/K
         X+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727928; x=1785332728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzTgcV6aGKBlGU956yU8LpsWtJh49NRiC/iioCtnUKs=;
        b=i4ZjfrLo20xklYRw/HPjGQdhOW2Tqu6eCRze0bUA4BPgDJ5B6W/Zu+Pem2R3C+MXMQ
         SRzG1IGlZSwp2TTdYLCJ7yokZkQMItGKIw1KDAGzxptYlj79iGEtGjb/psbIrqtpNR9X
         Uvo2E/SrsHOA/Qd/4cRj9J5DsFnrN+X4ul4fjIGUY8/4l3G0g3kWx0fC6WOFOGFdcpT/
         F0nv7S6Bzqd6ee1jFh1zZAJdT+dUtEeKtalV4ZET9clKV9IKZQfoXVL3wQSJd42uoyyB
         DV5ruLtoJDZXCbwQeb6NYkQQr/3yfKnfM14h8h+sS27dioKsop7XUj9WV0nfn+OwMoCc
         w3nw==
X-Forwarded-Encrypted: i=1; AHgh+RpHcC4+dcDSuZERZW8N0xTTpI5nM7BNHZCbqJ9Le3+Mxy+3dIYPxfMt51+/YedTdrNJwLdQgGPhu3wI@vger.kernel.org
X-Gm-Message-State: AOJu0YzUjpzNM8RlGUeD4Q47RJiu/LrMRShP9BLNkg56LRpESyLERMfh
	AN18C7rFftQQrjJsLCYR/6z67/LOO1RQJWMxMTt8wYQJDfjV5VD5Qf5+BTmL2oqklNGL49AcTDW
	agie1CeY8cWp4XDjS5tpxbrTlTDvp9SH/SK8Q1RbdR4usC9WtXhTh1ZTsYjMWzsW7
X-Gm-Gg: AR+sD10Z4F4AUXqb2mBT2I2iI8x2RPZ85d1ffM5P2Ruix5gatDlgjdzKV0cnUr3Syve
	7R0E5jYnA3g7+Rfp5JAIHcoqZdsb7lfxEKCdLSTjEMMAi3MdI9GduRzO3hz0NqSF5mD9sGV/WUy
	d5F2d+WCfXrXFoqWDlPrZzS6AJI7+PYyCTJ+MYcvC8KYiKwAAUOkWguEvpSMEl3vFBEZHVlA0jT
	dxEhahZy2Zzu2vuJzeu8YHg1BdfcfvYVDeQbgMV/XxZR+vXLuDWiMH4LI5ZxDQ94z8ps4UjyU6g
	YsQ3Pv8qLNpVdITe5vi1jIeALKieJN3YvrWLxADKNXrBx4LtpvhM3l1ms2iXGzUgbHQssxOKE6S
	5oWYbhX+Nm5tJPwTVYTf+GBqDAgmpBrIdCPDCwXU13ke3XLYYjM0PymbxcPrJNm2WfH7knNFbWW
	b4M6rOmLFZE99vNQ==
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15418171cf.83.1784727928282;
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4d96:b0:528:3377:c2fd with SMTP id d75a77b69052e-5283377c640mr15417731cf.83.1784727927823;
        Wed, 22 Jul 2026 06:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm510523e87.17.2026.07.22.06.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <bmoq52hoycfks65xplep6ggavilr2xmz74njgfn4wyufl6vlhe@5l7rcyyb2qgn>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
 <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX8+X/35VsQwed
 8T8knylRIaVEQKF8G5aaK3ZxdRVpQZiOu++t1G2ZLXtfXWdYUWONiQeZYIEGH8GjwcgQW4b9YwP
 xyhu8VtFItVkyI7NglN8ANelwKX5kxpRCsgbWSdgRmQOHi/jvoqB1aX2IAvaG+dEeR/HLKVrY7p
 n6tMSppkTBxryXYxyS0UysY0Nj3CEGO5BaLj918hIpmADyMC6t3Q5hOpBVEdsADsA4fjYa2bXJn
 RCfezNUQd61y3dvo0jYhgyY7RLXN/voP8esVPnV2TGbf9ICm5g6hwns99cJl6+pwMcFUB+b0nfZ
 k2bUeGu1SN43OLAdFPs0LVpC+GXu4yoEkXyqYBvG5TRm7oqHmkU1BXd6gLgdh7RsEWa04YRpahC
 m+DVXymAapDliihWCQwd5A5YJ1YNbv50UpdUZrUDAlRs0MYu2TnkflwlZ1rXBG7ULwqXn0I+cBG
 jXtnbAUOIUZlJpuznkw==
X-Proofpoint-GUID: fmQlSWDjFo-htVxUFWwqsCgoeMM-6M2D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX+mfwJ/wfw55E
 D04mDYoPDLefHWjp5dP1fobubnGdGAaB8ZhPK4YkZLvIBgj9S/n+RtWLCh+i6ApOIo8c4H0TI4T
 goIP9b84JtpeSrD9LNyUa7KMdvu5zzI=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60c978 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fmQlSWDjFo-htVxUFWwqsCgoeMM-6M2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220134

On Sun, Jul 19, 2026 at 07:02:00PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
