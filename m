Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC28382F2C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431959; cv=none; b=sUW7qMTuFgilUJOTGCzdxM0c1QGSjFmdl0SVGqdesM2UFx3PldwdNRdzUv+TSloM2FNKrUYMMZzhaGdhp/tkkGR51vtLMQHdJd2gzdbvdc+lcO2vJ8GkwByH3W+fJg1lRNRXnAOFUKY5n+FnYE9uBMUO0AVXMhMT0Uhu9/9OCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431959; c=relaxed/simple;
	bh=H6ISUgvvUmYatElh3G4kdB6ORgdfQA25rvLAZIRdZlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cuni3gNGRD2OOlF73BeyqxeVln8akt7VzOZX7dVLC7lvUCcc8BN3NyV9SiYMD/xj44AWAUIQdDYNGBPJu4Pdco5dz8OmfuaL5gs5hQMRyI4NZg71AmTPupNRZc1pABcp4xFoRQjlFGSRvsd7zketE33sLhG9DsVd/J0ZImHr4I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYveQ7fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgSGCA9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYveQ7fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgSGCA9t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8pNf3749119
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GNX/n6rhA9GuCnykNLXrkk2v
	INoSmJwEZ7raUHgbTH8=; b=fYveQ7fsWLL/LkUWJty2q1jGJ3ZMDK/d6YhoM23f
	qJYFI7GkSyZGQcloGr0XgimmsdsTE+FLyUl9dgxgglMnjdMNxy7yDzCC5Yu3xcmN
	jLjo+/KX+roVzZT+QRQLKQO2EW3w0UywXHIx6/9aCzt0P+HL7sablXASnUktOj6g
	h0KpfUZrHdcDVcxnbMlSCo2Q9DCSgfENfRkgTrjFDMxfYSiHmaY7vhWuUu4wmzLR
	UNfyPFNiA3hIdcytf+lfrmuYWKf/74zeBTswxBNHJIztVUWqMT8bR0zUVTpK4pV+
	I/wYlztAHLN/DVYfSAn9UH5ZobQtytq1WGfvTnR+7pe+CQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9pfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:45:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso88645805ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431956; x=1784036756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GNX/n6rhA9GuCnykNLXrkk2vINoSmJwEZ7raUHgbTH8=;
        b=fgSGCA9t+Ilu2DNAgD1TUP5Pp7+27S9kFalCGs4IMNQD65G+XYb85A0GykFwZTANk+
         QfR4CeWnXml3iSJcdCE1eW21YZDxEiYB0i0cC7ZdjVN/HnJAeZlDC561XH9/2g+5SRn3
         vgglaq4VR2ah/OSRDopBKqwPasH2iyT/A9L1qOvZiuxX6Tub2frjdTgfq5/IIGjqpnrL
         mETfGFFt+zthJ90V98YaJmjLZj2/RtRPHI3VJFAYrgtWUBgn/WXyUmnEqNZPkCiwjTW7
         ncr1kiWkVcYKHa0h9+Ldi85ullTv83C03jxpyt/FGkWYCGQvDlzcQBGtRhvHNBfhh/+4
         z4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431956; x=1784036756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNX/n6rhA9GuCnykNLXrkk2vINoSmJwEZ7raUHgbTH8=;
        b=lP1GqUceHZDEdPX9hMPZd7QpdD/dFFsYtXNkEW09/xkSKPKDUl/kIsCJJKtdAlnrFV
         zqThhzpBOljvjVcg+njQz8/tX+elWQ07dVBlwl/Dc6jgRtGABGcmTpMTqynE/hA9G3sx
         ImWyh1ZFhUTXmrh3Wy0vGqCwP4Sy9vSDEi7M8P7BDCWrHxM5GaRvw70NpEdwDBV14eK+
         O+MsQOlzKjo2ZMGajIeSi6tuRg9OKCdykm7BHpqAG5WWIHH0xhyx4ElPgBOB0z5yBYi6
         /09ANeRvcEIfAvH+hQkjYzt6dJ1YvMNLdvjzd7p1jFLDA60/OXgqYMTNuKBR9BA9n6zW
         ROrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp20cuP6EgQMC69Ff6soO9Zg4gj3jSJpHbvsUHY3IDCqxUQBadY6KKYGYk2QJBkK6OHHsFW5fxPb3My@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1eSeABRZH8rMIIoOSKEh8E0kG5EKk+dVpoxLOvuoke7HV2FU
	LtcWthoTsRtSsNuERqHAIL8myHyHhJPiKfX04liMkyOWmZyGTIAfKIaR9xaw71MUfBql7dg2V+g
	Y8iW+QDmzRkzndi6XQRJSOwvi6ggwVE7KL1e+H/mR6jHm0qNRIK0C0CFWveIjrUU3
X-Gm-Gg: AfdE7clkx+bUfIo76OadkgjgzgN0S+A/15Ic8UsQxnB7bKmVm3gmiUx6G3E4vJQkqOI
	eixmheEnaq61d5Ov2d0LUMZk7DKj26q5Vfp5nqStRd5D/965SDdofvrU2cNMqQfVbLa5qW28bRb
	QrrEBpWhqagVuiubIkQpyMkiHXE3OiaiZuw7bkjWF+1EXnQPK+aZMiopUNuKWNHRVFjQQX1nyFY
	V+ok9FyRqMMzy7BW+CS7CVdAA+badoi1JMVHyI58I0O7dVxA81exPndEsua4sAxVO4EdWq/u9Tg
	kgbUvQXkcAmu6QXfyJJ7vqq+yQdH/OY4hUYaNgPL6LtmtGFytugcgv5x/O6uCrrISTq/q2bAJ0D
	BAPJsm9HpsXdD0NtUVHPRNU35K3V2EftE49ri92y9eJTfjYgyu4zFQw==
X-Received: by 2002:a17:903:285:b0:2ca:c799:6ca0 with SMTP id d9443c01a7336-2ccbe614ff7mr50439005ad.15.1783431956341;
        Tue, 07 Jul 2026 06:45:56 -0700 (PDT)
X-Received: by 2002:a17:903:285:b0:2ca:c799:6ca0 with SMTP id d9443c01a7336-2ccbe614ff7mr50438895ad.15.1783431955885;
        Tue, 07 Jul 2026 06:45:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d474sm12584915ad.70.2026.07.07.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:45:55 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:45:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add initial device trees for Nord SA8797P
Message-ID: <ak0DDpsgemoQBzf9@QCOM-aGQu4IUr3Y>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d0315 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5gf-YUv2CDOQ-a_CTGIA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: J_hBmwAg_9aBd16dEaCA-VMmqJOcO5PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX5hSO/NlpK4nu
 v9aKQFmeEtqAJ7Am1FpPSlYxCU8OpNyJ3IGXi+BZrDnTxmTuA73MFYrvlzsa/d0tYWsPcbf7N/a
 COxiPSjBfv/wA8R/eJlRVp7uT1kCXDFz/DjPKGxP3wIpJe1x1XiD1KKFemX1l4ntc03HvfnqZ3/
 I321VQ8ASTYPz/1S7eovlEuKhOP7gslQ4zn2dNEuKmL095Ya3QPKadVW8pz40x/2KQkHEo1LkGp
 iJG7yP2/BuT1mjJX17yJ6e4ZHNBxAwUiHdsP0UbfAaXjDKmONDTII8CPq2udbZMyXunhpEQzzM2
 Yvgk3dvYnTPbMNY0XG7eg3d4pzPI3ErU2wD0ABp9I6zKTH9fhuQn2EhijrKZ9HEkgQmcA8MOP1t
 lOtwf0uzcPCqIH+WxftnPaETDlnNldwi1mxsYhX/xbxDkqeYoJHUzspmnFAUHH69w/fLI5vaN/u
 2bMF/R+ZTtzu4ExRm0Q==
X-Proofpoint-ORIG-GUID: J_hBmwAg_9aBd16dEaCA-VMmqJOcO5PL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfXy4RVA3waiW1K
 gK526whLvtkXDeulZJzTfZimYwBSk5zEVPjfqhZliNDsqQE4/9vd442QthJnZR4QIm7a166sSN5
 414tpKPNcQppJ12PS8LJQu2Urqk2/j4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070133

On Tue, Jul 07, 2026 at 08:38:58PM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SA8797P
> SoC and the SA8797P Ride reference board.
> 
> The Nord is a new generation of SoC series from Qualcomm built around
> 18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
> is the automotive variant in the family.  The IoT variant IQ-10 will be
> added later, by sharing the base nord.dtsi with SA8797P.
> 
> Binding Dependencies:
> - ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
> - I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v4:
> - Rebase on next-20260706
> - 1/4: Drop unuseful comments from arm,gic-v3 reg property
> - 1/4: One triple per line for qcom,pdc-ranges
> - 2/4: Improve commit log as suggested by Konrad
> - 4/4: Drop 0 polling-delay as that's the default value
> - 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
> - 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
>   at 125 C
> - 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
>   and SDRAM thermal zones

I have to resend to include a change missing from committing. Sorry
about that!

Shawn
