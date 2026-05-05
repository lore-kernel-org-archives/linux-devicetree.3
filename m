Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78A449EB6
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987676; cv=none; b=PWDVwemr8z0ub5JDH/TqxenJEY4PDy7mcQPvPv/TIp5PX1np5tReO3mvlhaNmRxLD1e6X7Nu7jVEhu/uG+yhpUWpdqX0446fTo4hg3KKfiJHOyE8uPIGX8mjZ841703yaqq9yYEubTN/3FbeqkshXhFva3UbBmyYRyQCclLfp5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987676; c=relaxed/simple;
	bh=F7TAvKyLj3bQ7LrO/xA3hmUETtZb3FdEEZ6bOnujb08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkXQdokhjtv4z5lE9/HDj6Y+ckYHSNjGgqldqy2ymKHdTzetoqeN796Bz8HSMZZ3D3EM5YKiqJaYJ8SWp/0pkSVS+lTftMARSNHLk6xYc0djpveUTsvjuN/a4RuzJRAhrx22mQpn8qzrauZ5ln46TeputrO09Y1as77pCWKArVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+MXdR7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNQ1NPat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+MXdR7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNQ1NPat"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595Y9G4028241
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 13:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=; b=m+MXdR7m3hHbjb3f
	xSRJcRBZnY6g+vhMZ3DAREZuTB+zbnIJFxAF15UfE4uvZ+kT83h6aJsX6hb2byNb
	DLiNglJb2YDYAPLL6UboyyPZ74Du4wP9gbzs7XsxW2XznFU0/GlXExBf4i47sLfj
	A4gGhf+5UCPJWPt7k4nacqBkIhwdqwMb4D9UQ447nuAYFSTGpQ80/XyW7x3s/fg/
	XHzIvMeSxIplV+DC6EDLqUCIxmbaKfy9FXvUP338WfFaTA39i09iPhJ/PcKiNlfL
	n8kiFpOAbLTKieA6rpSPMIh7b2QwocnTWPaAqBE1DEpG/YziavvtYjpjMKWWZ0Jy
	oISF8Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6s0b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:27:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so3267731eec.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777987672; x=1778592472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=;
        b=LNQ1NPatwWJU0XYlCROy11k2kXWMzIJGp5UduUBW1DTGisx3vb7ODuopkwxYrUNNrB
         OXpQQSBi++/XPCaeaiSpRWr8EoObBQUuX9LwSKCj5/tlsV9UIkLnWR/YbsVbdHZkOBW9
         aJAYpYJ+chcDL3Fff7leutkRJi5eBcRNpIG4eZ05s7rzwislY6yxTllmqkAvxI//FyDd
         A7xCNrBdATauBbk4b19XdaJFimx4gSNoA0UJMP+qnh7dYg5bILJX4c9rutnN8MdgZpEu
         9T/2qyCxY+lRQbeWxSrOmVAVeNzf8MFYkyBDLlLwornhYQ7nQyiaaTbYan7yXmkMN0A7
         jC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987672; x=1778592472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=;
        b=fBWJoBEfy5axnOTEmlvZHHPV7Vo9y3M5pld0cd60qZSuvlk26KQDK42L5m417daBkc
         RF+PgtBjp7swJRlR3faT8+Npze8s3euWpj8tgFrEWmLuYghll0brlrvcjiCGJLD4QK5h
         W7iHTdMeNcb4BD8Jn75NM2CEpBMMS/yMbvBkzYdbHS2zj7h8qFHAqeD/iwJHw6wMv9hi
         utXvLrWHNz3vX0YUMMjbsJh93lZxzMOB1o7Qdd9Du8Pfjp1F9ft79aJGIq+0+VPk5E2F
         xHCyRine2y/BJoK3RXbcABckMRnFRPv4QxLW71f/GJHcShfxZgT6AML9RgO4wo/lLWB6
         /NXw==
X-Forwarded-Encrypted: i=1; AFNElJ8bM1UgMRJwvOwZNSQmOLRA1oZ2Y+8e8QS+EMtHwaaL5yUdy/8luOdl4Cs7QpOl7T0FVcTslWoC7mfI@vger.kernel.org
X-Gm-Message-State: AOJu0YwNm0+UHjS+wbC21M1iI7X0sX/Kh5DFzMzNGg3TipmbmwI7y6R9
	x1tJksh0H3FDabstZss1IfWzCD6wG8tZod2XxU72UyncJxP4nJPeJ5Gm+B3iM+LrNXseERRSLNK
	a7+Dlrm94IoG9PmJ5fC/n1OHQ2hoDKtpSVRE/yofvRjekSKRw7V7ym7ec4awqDJX2
X-Gm-Gg: AeBDieuHGMTAwhHm3EQlYP17x5akBprCc8dlSwQGUYLD95aIBQX3Ku0CImrZ1T9XGJB
	Yxol1IW6b4MHsDA3zBSeDQNFcRriQV28FKO8yjLgx3qa847D3Gs0JJxXcYW0aCI4wFm1b/fzMge
	k/HFflhEinmv6qxKABrilE/RO/j0PPVo5hrMuKdtvr33h3Zc0b0jRAX1LfQxXcGjY5MFfMc0eQt
	ibGvyrZa5yOKWQYUEQR6Couo446b+Of6P6eNRd9gw1o6D9qwNrpwfB1WNZbeycTSPcZ4U9EMFp1
	ZeFAC6mdyDD3J0fkdXdiRpxORd80G7ig6A0PJDJFuNV/YV46jIVDwCW9f/T4o57FVpDoDj4FF9H
	zYfEnbnuizX8CBwqqxH58QmB1gyrUeiqAwefN2ecbXdnrs67FeO7HTBRX7navmCWq/idciGp96U
	jVBGd6HvRoJnCWkwIo9bQbqh0K
X-Received: by 2002:a05:7300:320a:b0:2ed:e16:6b38 with SMTP id 5a478bee46e88-2f3cfdcd781mr1725620eec.16.1777987672239;
        Tue, 05 May 2026 06:27:52 -0700 (PDT)
X-Received: by 2002:a05:7300:320a:b0:2ed:e16:6b38 with SMTP id 5a478bee46e88-2f3cfdcd781mr1725590eec.16.1777987671627;
        Tue, 05 May 2026 06:27:51 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.242.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5359555eec.6.2026.05.05.06.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:27:51 -0700 (PDT)
Message-ID: <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
Date: Tue, 5 May 2026 18:57:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyOCBTYWx0ZWRfX4Axd6kGkf6ow
 6QefUijqk45+ns7fjCXvms/pPIeYu9KtheWwHhKelgWLV0KzposK++BXaMTqO6KJ5duhYdpEwtl
 pO60J8iNcjr5/ipTib8tLmvyqrZShcfrug3LSN3R/GDy0qaka5d7es0SRxRKBwubhq8h2XcRt/I
 kc0DkMwm4d51e1nNjWclLNJ2ZbIPUa7BBIsroIEpn/jHdZA4APOxJk77Eul502rrgLRGKQqTWpZ
 ZzXxielY+Cg4vdIEOIDAv+b47gdSSKG33Q4t8iIrq8S6z7MnmG4MkWiGXhvwym0P+HWPtkhFwqF
 aocpkjyR5CRKcYdK8dvpY5CnyBzDekaLT0NgNeg27Lbc1O+avlpQUP1dcwtAfBh5QKPWqyjgW3Z
 vEvygGXxqGu5wzjOLAnTbnSSGUCg2tSudlRo7GFByPdhskkdrPqVNiIsW+3vrW0e+am0ulKAtpV
 aT0/XK+0NjB34Lp1Uig==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9f059 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=1ETSEvoV01wl5CnlN8iVEw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iob6wRauG21zkpGokN0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: scXKLxOEXJoylWRjJCINwawEKyPE4_nu
X-Proofpoint-ORIG-GUID: scXKLxOEXJoylWRjJCINwawEKyPE4_nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050128



On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ... and then I looked at the driver. So un-reviewed. Devices are clearly
> compatible. If not, explain what is not compatible.
> 
Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.

In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have 
GCC_USB3_PRIM_PHY_AUX_CLK.

Hence, I didn't use a fallback compatible.

Regards,
Krishna,

