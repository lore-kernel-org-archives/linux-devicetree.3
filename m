Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881842DB7AE
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050036; cv=none; b=cW+ZYsVqGZwUELn5K8xSe5ncZxCTM82AhCXZHgAq2J4pGxe+/sYEEz+UazW78frEsSkwh0N80B+zsx89dkgRSyMK3yCPW0w8+GbF0YRS5W2JYGSJco898mUmKwsUg7HJ7mEbwCtU6T1ySlDh0INfGt0AohvT2XKoAnnxaLTb8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050036; c=relaxed/simple;
	bh=YGCss1ExGt5tgdwH3q63DBMcADFrfxlrUUJkfoXuRf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlp0S+Jlp/l9LEdcx068E5GOFsqGyZcSb4MsNVXQ/IuIKmofnNaUcDBq2ZbvQYdITy9LvYW+ke5hmCDJeAgTE8U7SVZ6xhClnlPqul97jTV9Q5AhVCUYI1zcsOmeoRDRrdMRnANEX1vpsL3YTesGYwGHwOU7eKg1LhTSK1aIX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFxVq2rj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGagUwDh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFxVq2rj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGagUwDh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNekXg1971439
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZTaaCyVW+PIEY6rXUjwhEoqb
	vFtUUWW5PJEmQpA/Xbs=; b=GFxVq2rjk9n6qjJyBlKXerWjYCvY6ohM84mLDqBS
	BdoTyiLwZrRtN7HVqaA3OSeppymCVI1r3iUMOw9XN9iu32Xl4Zf7m9P6kwp0ysev
	mh7LlHVBRSU8pbGE10616BLlXyACUOSvFaQId6CUw9PJJfcfe8NBSDb/b5v0omi/
	uTUKyEURetSh0E87rAjP/2S2XMLmYn28Oe6AmXto2oMPFSoNuzfIRa31aQWvlUdv
	sgvFxfgJF78JuAV1h9edRb/YpEVC2Elz9QaspuvlRPEZ+gb2FmcqBeGL5kACM7Yh
	1o7oM6rEWKDwMDH8W49Pxbcli4/KaDvRMr/Yom0gzh17EQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6uhc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:33:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90da7efbd60so425286085a.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779050034; x=1779654834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTaaCyVW+PIEY6rXUjwhEoqbvFtUUWW5PJEmQpA/Xbs=;
        b=dGagUwDhzy16tTGiwvMFxS4+D2UBwhocENbjp8PHGyHWVjU1SaBj3cIMNooYnaXqhD
         TcZ38cn/5ms6XxaApKXjTgbTCFLXcG0AXOlKUqbob1kX48/xd8OtPK9dukJfQavxl/+6
         IFTvvNmoID0B792drWNQed6x12tNgtLhWn1k4Fo7oBYdi4lo1SW48dLJirpxeVCl+J/E
         6MRsqnWPdyremnaxp0Hz19ndbCrZ+25HHPtTxl9dOZ7Qv58JiKwNxnh6K/QF0LcvdJ/r
         zFeTl3cwipxYXkzhHncAAa51QhOcvnt02/AqqB3WH0E2H11E4zvE2wLYMesMvb14qi96
         8krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050034; x=1779654834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTaaCyVW+PIEY6rXUjwhEoqbvFtUUWW5PJEmQpA/Xbs=;
        b=aWQy66hpH24Ru3TT4m1kKPv5ew3+CaiLUDkxaUAtb7JXSYoOThDA0P6pCh5jAsDbew
         Yu2aTMeWSuDpB9TuhnV13e4SxwpiKuWtMERYO0jxop8dTfSh3FK0oQUkOfDScUR5vA2h
         Vw/H/v/0xDarguERbAN619/N1woK9z5ilqQavj8mzb6EOauQdccxPRNw0sGdPwgWEoo1
         hs7p4SIYt2WE6jDoiJjBHJlQeDa4pC/HoiycInm235M4QNJ4w3YoWhpR4k/mFft3xVhJ
         X6tS1ThpdpPxqN02vXznj/RmSJ/ELONKBfBOXE9/nOPfcctEJuNOvKVkuJBh2LbwVuRp
         LpbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Zeq3IhJ6jT2/3YbwW4orTKUivQn1j4dPNHKVgSXdlnUElbpTKwb2F5pMQSMSzt6Xt+eLW8bi+r31N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CDT/J3AmYFXWZFe2sPuqk8Ol8WZ/aMxLj1A4p/IdSn+XIn/Y
	AUWlZ3C/lM+cw6WoixQqeI4wbetCcN61hank1foawGmUD/+hqFuLoZ3B7ldSg+GWGqghXsfE5Rh
	qM0gsNxIjtAI7oIbn+Ndwb9EXpsv1mq7ukHQCelFKus9QeF1R9wq6v1ARPTr1/Pou
X-Gm-Gg: Acq92OGv+Gwrf4yDcif43AyAW8bZuftveJ/U9hi/zNHJ2oq7cDZBVTaklw+8ZHpt9w7
	PsRPpSNQM5b/2ttXevqmjj9VOFBK7QBKZutTgit0HGSQCSUjXo3X2LNbIa2PFu9HYtMFW1UJCsb
	eWyXxXDTLOPXAWg2ex22zuRmgqONvyDjBrVGik8qUHgd0FHn4G/UwxNHBLaM0w8Tan1XshJ3/Ws
	E0acpkkFCmpzmDRZCsDH154blJmysEpDG5/1gjg0Tsk4Cr799+0gzNX06FFnmj1DC1dTkV9F15X
	PTcELfs95VaFNcPjdjr9oAvpyPFT7c2bF4Pd+OAei9OPuYOC60UkTVnhHWtj/+QISCpayECJjen
	VhF4Y59lLkVcpekY08Sbza8zByOrtZogk+wYOqu3yLsSHx037S8mt8w6WuLNAhJKClrmujB99id
	Dml2za3IQdot5D7lOseglA9aV1HQ63aA5nUjqV3Te6Y15m3w==
X-Received: by 2002:a05:620a:390a:b0:8da:cfe6:c67c with SMTP id af79cd13be357-911ce71ae7cmr1874480285a.28.1779050033843;
        Sun, 17 May 2026 13:33:53 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:8da:cfe6:c67c with SMTP id af79cd13be357-911ce71ae7cmr1874478785a.28.1779050033471;
        Sun, 17 May 2026 13:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11ebb0sm2911625e87.36.2026.05.17.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:33:51 -0700 (PDT)
Date: Sun, 17 May 2026 23:33:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: azkali.limited@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
Message-ID: <mt6hb3u5men4y5az7byjdxhhsuh222bialhfqjpnj54eqfqz6u@uelqemwl7dgy>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
X-Proofpoint-ORIG-GUID: rkxheT-AUSGFC94ytYYORbaf73NkL_o3
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0a2632 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=JtKtZ5FLYQbQWUX-Rs8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rkxheT-AUSGFC94ytYYORbaf73NkL_o3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyMiBTYWx0ZWRfX9yoW/56CkmEl
 3PHda0rmbCHy1Qbrpw02vZpeVe16LIICjxnsQd+U/P0kTDiuvwzLfpamX3j/FCgY+XWuPb0z1I7
 EYmHiG13cbYS0k+Nu/NwCLJDWzWCEPZZvubbRfJvtWdjFTTDHdwArpms/Ge8jkxQb/MTuK4ZWaR
 /MBtIdJSNn9dUJ0iLwbRKkg+j6KlvjlBXkWNtfw6pnLgK1hiCBzuZih4kIYppXHG5S6wNNT6Uhr
 cOniKM9NC6vLhYwBD5zQfCxMkQa5/Mo9ZkdE+Q4Nw70Qlw/M+a4XkNeDHnnoL05oJucxAVO/hgH
 0MBxVB3f4T9Hw6fp50Cs9Q5hwjc9HWwDfhqtbNFnd+mADRHKfiP3ThmpSTi/08p9pzYZPZPLl2+
 hT2UWaru8s5HOFOQnO0drVrSYLSPbH3et0wJsxnToPlP2UQaiV6o5TsTf3xPY2oBnj+7X0dc7is
 Mr0MDrrxedXnZheLXzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170222

On Sun, May 17, 2026 at 08:14:23PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add the QUPv3_2 SE3 High Speed UART (UART11) controller node and its
> default pinctrl state to sm8550.dtsi, so boards can enable it through
> &uart11 instead of open-coding the controller in their own dts.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

This should come before the previous patch, otherwise building of the
kernel will be broken between those two.

-- 
With best wishes
Dmitry
