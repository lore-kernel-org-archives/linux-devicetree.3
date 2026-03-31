Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EC33B6E3
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980123; cv=none; b=kaM39nC5NORt+7eE7Ib3nf8Ns+PQVVIHDG/gl0SeZMOGKeQuCSQyrZ8n75TCyZ4E9NqVJLmNb2K+uJBjbJuVyo+5NtTWyikCT1hrQ72ecS2TH3l0JXXHIn1GaG2GhtPDq6iwn6nlIy8KRZ4xhlZkymt50pGZGzHlsFiPcW3Q5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980123; c=relaxed/simple;
	bh=XwRHmY9CtWZ4J9zShXrXIqOJ0NZfoixesZforBPJPPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elaxb6Kt+WgWGyXDuh03c6+Qu4VtC438BrhTCnKIeayC1m30qw6sEKNTwCDArX4jsFGyUZ+LD0CCTfYa5jdd3fT6G0dsLfAbH1DsjWVQdFRKURI+ci9Cu5CKzugwpoAGz3mQ/sA3gXfnhvfEgDmb6GuxlGaDfG6DBLP0+OwzVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOE+muqR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEGbFbJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOE+muqR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEGbFbJN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdECF1831813
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/7RRbF73vzftBQK4H8lFwKI
	tX5RjrAG7T4uuMS2qo8=; b=jOE+muqRUXVIISZDQSyq2VdrdlRqGxaAeaxsfpUx
	XYNyjLaZiLq13SgmA8OC/H9P65bRrQgabJ0YbPQCwIHy9dLV+NNZC1TQ16XsHOnY
	ro9FyLY7rnqSsxxmRBMTLeFLsmJph6QZ+kBC/XMJ78B68PWkxLE1cNNYOIe/2RiU
	IRGeaRHlBA6uGorMxQClN5yf3vtBDxTp0LPHQn1XCEtFbOgurMS1Di6AM/3EAG+w
	ICE7BYp1pk3Ay62KMbwlsyrTxxdyyTYWT5omL2sf+tv7MUtiGX1LgSxfvIzsawuS
	gE+YL+wQY6rzogEQlkORxSJA2RkC5R7Ox7S9FY+W7IgTzA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9m3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fae584a130so3199654137.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980120; x=1775584920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/7RRbF73vzftBQK4H8lFwKItX5RjrAG7T4uuMS2qo8=;
        b=iEGbFbJNH8M7aV5CqQ5G/G+Ot5jgRtLe0JJdl0ac4FDiWKBO8TaTyKqYO5AiTG+jYJ
         6u+wJkPL/FDU+ebTTVdaBKMFNvFfkkh/fqwMxA4avd5Qdb6ValfS5LeJgnp2z1KrEtGA
         XE9kGQeAcvp1zDP5e4KkRvEK581q7CqNUeJ/2QzdXaU1Xwi3XDiarj+s7ZlUgexxMYEg
         XNHg98bgvoDnQqD8u71pAz2T23iW00HQw5orb1rajHS0FTgkO9GcoKyjFL6MyGS529ng
         3RvM9u2rvmybjv5a1aZdVEnpF6Yh5F/ylaJxKg1P/Xd+O+2wgbLxP97iicWXju9sZNGG
         Gvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980120; x=1775584920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/7RRbF73vzftBQK4H8lFwKItX5RjrAG7T4uuMS2qo8=;
        b=pomapaRmSGe7Bg3+1moTlordpbsfcIzHqnjKaMP9cEMdKI6Yb+dgXMSfpElVjo901s
         +B4G0MdtbzidYz/mBZ/r1reRd0tMjSud9wFZz3EwVxgcKG8gACAzSutpq8qdRF3TpnDs
         6fD2yqAJQjSAZS3kY/8+qxftu8dhlJNBgZuUZ19QkWuys4PWCaH1Rr2UFEm6pSpz0h1r
         th5OcDslf/QKqrsEcQPqqdgvX6GsmUYz5eKI0MY17uEjBhUF8ntQYgkXBmntARQ4BFQi
         t22ucNfUnOl6p95nAQ/EPsMdrvh/BlLGpltkkVAEXDP/6r/XtXAjPFBqVnrWl1QVQvoy
         E5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUAehk0+hmCa4ttlxKyuRCeC5TpSONw/kEA8Tx+n1drxOGpRBg3NsAIGkpsddxwtMb4JdPP8HvB0QLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/42GUszyjqolklRrq75rdeR0S2Cj7zqSj49Y2LmrcJi0Qwf0D
	JSEaJ0LY5kCRs9C3OwSeSt+TSyx9TXzULK2IwkfSVEFo7DfQ+QmOo+G3GqI7VMofPeFlXnMRFUv
	ZuukPeKGbMuzBUMywg8pn7xFns7gOlIE20G25ELxsSXUUlCNuFml0tGKtl5QaymAi
X-Gm-Gg: ATEYQzwxn1T1H6NOjD6z0DXtQ26BGxcdv3+FjNPN1Bt4cPsQ9djRfCX4NfRtyosyNIG
	ygJ7xuQHgz1Kx+XdRqHybqNSqC9Lkmzz1Mh1UkIJP7w7Q67Z1P3UYCYxVXKNx87Aenze+MEGgP3
	EQFsGhMHUqG7il1TD1x5R6v10M9Id9RYqW86HBHl54ANfJ98NBELdeQK+cUALqA+V6GVaibqGvS
	qlcmJc4FTCszmBWBNOhwhI0bAS6Cv3KY4BmcxOH1fYQQdebV6kTa6yUwBbY0t0lU+eLD2CSGuKB
	LpC1ket7TiSL+xqRwC0NGXQxM+4tiKGO/sxGgbVB/KFZZHWPrlVHkHWxeSijistqqlNtXBr8U0C
	5atzfAlbfzcyB5q7HD3RZqChU0+rapOTdJHlPfraHiUXh7MqoLUSiASr9MqUOq7ygrW5TVACBVK
	TjO0ceR2waIRVyw/6TC1XLjggrEOxsnTPGtp4=
X-Received: by 2002:a05:6102:4192:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-60567dad7bcmr125079137.5.1774980120135;
        Tue, 31 Mar 2026 11:02:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4192:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-60567dad7bcmr125038137.5.1774980119664;
        Tue, 31 Mar 2026 11:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm23548101fa.22.2026.03.31.11.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:01:58 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: eliza-mtp: Enable DSI display
 panel
Message-ID: <mz7pt7jlcn6koretk7hoigdcykonzvu4av5dcjmd54fxa6nvqg@yehg57ubl5gc>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-2-856f0b66b282@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX/rlQkPWdw+Vg
 zdHwDKH1W/zyCXfx9IKH/xgTekxzHyCpNG+rz+DN2hrc0t8oQlxxT4/pL8pDIexZ2Xk2O2ESPDE
 g29CRKcFlIKx09eYNDOjkI5nzk88GlDPwL3WcZCpQYvGYZIHzffCzJ6Lc+dWivjPODIN1YMvgfv
 uGJHrrv1UnpVBHMef8p7mgVZ7hPozMdrBRShHYYDd93Gyfs3dLkcGi+RFf8dLjH9HWFig/ITVut
 gP1RzwSbGx0LhEbVTWqa6yROGgauUXl04HQ9zT/xBrSFvpLiamCbIZyy/EVtCPPQkoyhGxwNgs9
 JlTlb14Fm1E4qtiHLzgNuumlxAd8JEP7URF6SFcWerBoXC36NpC50zKUjp4PnVovZpSbnoPGseG
 ouiYveb73JLVz0f9Lq2nxuvaGJZ1bEawW7QOvy2mxlc/nkEcomilMCja9NPw22G16PyPJBWoc65
 QV5d79p2lFHoIB/sc8Q==
X-Proofpoint-GUID: WWr7L0lJ7O1yhV2DDnSKU_8UQ_qjSU_E
X-Proofpoint-ORIG-GUID: WWr7L0lJ7O1yhV2DDnSKU_8UQ_qjSU_E
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc0c19 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PGz71x9YbL1CjCHebeQA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310173

On Tue, Mar 31, 2026 at 04:02:50PM +0200, Krzysztof Kozlowski wrote:
> Enable display on Eliza MTP board with Visionox VTDR6130 panel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
