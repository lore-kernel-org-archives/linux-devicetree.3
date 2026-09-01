Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226A39150B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268904; cv=none; b=oHwgmWem15Rfq9x72dVYZ5A6Wry6BoqcFxVymI95QthqU3fQU2QU3mQQwOK5ewSJIH/ZpJU19SasSrlR7cqZAq5uUxii/fqs4q4p+JAvfGq0BrD1bDkcgwl7evNWfljjF71Ou8dqD3M/7heGmuqJG2FiRtufZE3vkhJkigdVhx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268904; c=relaxed/simple;
	bh=qJfVo8NaWUV3he8g/jBVBQ24fD8jjxPCQ2QJcjp93xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNaHe8Pwr3xDieXcij4DqK0rEaBHnCzi+jJwmqn0DCcnUvk7QR9dp9Xrl5w+i8n06HZLj+MA7uf9tZP25Jb5fxkhE0S22tvmQXDZA9kck2XRoXGHHZKK0D+Rv7tTdZX7RLmXT+wKshz1KmUTQTI4FYyI8XszBSlGVJnZUyMtIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC5Iec2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpHSkGbo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC5Iec2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpHSkGbo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681D5bGk3355721
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=; b=HC5Iec2w8Q0r8o2A
	gfZcfMA9VCQ25Uo/i7Hq+YU/CARRMRIHDaWAE6sGzILPk0zqOr2cDoUK9dMVF1eB
	/YbwY02vuOH3zSeyfuarRA8HACvFGdQ9ZinhFNLZ/BnPkjA0jk3IHlmdOo5DYMnL
	DrljuhRUt8Dsd+0H9kIflADs+CrOjees55BopLaJLEJyMlJT6ok//edN4L3224L5
	VFXNeaEmRI29Oh3LsyJW99LNoep1dIr6NyOVrgx7rpOBhXXd5OcukWY5soXnbyr+
	Q3NPRYh3A22ah6fqKIYFDV6sDKImu0VZiXh2uetRTv9gYY3b0qM6ryopeTCXFMc0
	DMap9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ng204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:21:42 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so121098e0c.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268902; x=1788873702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=IpHSkGbo+ZLUUe/fHIzVwRDa2S9GbkgWV49Rwgnw17wrwmWHt2Xp9+jmIHxQoyENCh
         oMwZkCmfyohS2shpLUCH/CpWsJAYpHT8ZASHOJLJUcCv2SiJ1GyFspsPPepbbglTJFDX
         K5KRLKX/W/8rWVl82xboVpKLXD8yV7stMYd3nw/XA6OMr25Jw6O33m6bpUjDbujUjcj0
         aosB+vKxHZsvHnenEuOBMYzlIcCZQJU96lakvewpryZ9qjda6lTGRyPXiwS/wCfYRKDC
         WyP0Tc8atrvE4kzjRwjhv8mKdCliwKNPQOvAghyUpDWFlN8INmTcWI4tYc1gJ34bwZ3b
         ML8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268902; x=1788873702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=NgJlsfxS0ktecBAPPlmpVrXk+m1GUvnYQAEQntyEV8ycTfjlYCYcqy4lO0Eof50b92
         nTA0G/ipDQQYPlVHRF6D8vZgndi7HO8CQiHTua4NKaUy+jx4ULbnwO85FCgLgp94pa45
         uTdDCr3UV3yhvSIFx9Vmq6j/ylPq5cUZ3vHP1jjFCuRKnB1WHhOIuPYoz55SPDeLM4YF
         g4P+hPV0gingy1n0f9X0MEjZ1zLWsDBiv/8e2+ZR2BA4+ES4Nm0FxstdlYOfYw+aLJhq
         uFIsqAfoyiyZlNBZSMSajv2xks2vpGTU3ur2HHi8HWPqO/4eSZN5P1izTsI6LI05ZLD/
         sC2w==
X-Forwarded-Encrypted: i=1; AHgh+RpjxKCjTrVAQAN7HfmogwtzrJ1/wjJrtz2ICRXwgF0AbXGp1fiOThHCaYKm62DWXVf3iJCvYrHwg+yo@vger.kernel.org
X-Gm-Message-State: AFuF++m4eFWwNGMeu0kaDqrf6COnSW5ybkWl2CKgoKDq+N4h1WGYwkYs
	bFIbeE1WCdk5vzs4SQTAA2crE9m46aMjuwRJ7AVXf8IhyjxeoP17J8Z90s1L6/rOEv0rkliTAEe
	qQXVuHRzdn5h5Evoxhd/eOoGCIMKmSVoTvdSz7F03+bLFc70IXiTOr9mAWdVyBBIj
X-Gm-Gg: AR+sD12hgQ5brSxwLn7oosH66VHa6fpWPzhfUrr0KEUiB4G30ume4WnKqwcn65YiY4V
	53rWSLkDQi5q1gUTSzXVMYDSguc4f0spqziB2U6EzJ5ilPTa0C0y0fXx1+akcqbz6H73U3ME/kR
	kgY6gZ5xDmvqPgERdPcNxlcm8Xg/a18jhfkvko7jGonhwqkdSA68pJYKQ3KmARuA0TPNWby0Hjg
	7yVMOjkMFBx/WGYaQGN5PHhilw80N7+Oq3ERw1vYNps1JgnPa4l+cbzDvXbSlQKnMPiSbddCrUH
	6wvUXihzM1wukskvaTqM2MBTSv6A94zKK12PyJ2ao/hj6GTliUGDFyCg9X5BmSZla8oj5UyzEhq
	LBzXIvs7zZ5TBzDoeB9sUiA==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2441006137.2.1788268900671;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2440992137.2.1788268900215;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b17582sm57141e87.69.2026.09.01.06.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:21:39 -0700 (PDT)
Message-ID: <773d4d11-dedb-4630-bdaf-ed9bf5dedc5d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:21:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX68cUqUAlNPBL
 36rTrCi9stpzXPGnIWU06HLUS++D7c1UN+mmPKaaRws0MpdiqsAO2MtVgxsVi80Hcd1w1QybB5W
 YyaTq5NUxccvVXJkbYvKyewcD6fZkLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX647I+yDMyKQ7
 8mknusbJBbgbAzydGUWaPJTaDi4S3Wp4MV0dOdbqvx4eZ8Exl4JMmyX1oOYkGnQluwN1sQL7XEZ
 rvYqW+gMEByu4MvXwdrC41NiXoNjNgyfBWLFDWTnM5jkGX/wmTueE/4mOU6ZMLjFFXaYNqiqXhd
 hPf95nzmoJCZv+BOPhJdRmN9tvFriFG2DksszF4p+IPeKp6B23W9ZEvYBjLbN9Z6BUMu352uIZC
 1S4nFBx37fnt/nQYQl/EzCyq2+XhyRhutCW97Ae80hJw8T2aRXVAeweWBZZQxofKderEu2x9I8C
 rWaf7KyuFVODB5nKSWrbhmP0ABhD6FLQ5xICiziZRkn8Uc8uxAdPVWbDNouMO71kmU7BJ5kOO0d
 25p9+NXejSFXb+9PICoT4CTMa8oMJ8AV47Srzwd+nWz3yUe4aVB41Oa5X8eeX4rXkjRZ8vaIpNT
 rDyKeJh2Sc48NPoeFzw==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96d166 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=xr6W56IWL_GKtPyFExwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: w3_MMTKj_oHQ3QUegMxCwowznrGqSAhr
X-Proofpoint-GUID: w3_MMTKj_oHQ3QUegMxCwowznrGqSAhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.

[...]

> +static int qcom_uniphy_usb_mux_select(struct qcom_uniphy *phy, bool enable)
> +{
> +	return regmap_update_bits(phy->tcsr, phy->mux_offset,
> +				  TCSR_USB_MUX_SEL,
> +				  enable ? TCSR_USB_MUX_SEL : 0);

regmap_assign_bits()

Konrad
