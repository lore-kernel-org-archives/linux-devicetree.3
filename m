Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF32609E3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894009; cv=none; b=pQ2k/zothFaPcFFfyoDA9RbIL9oDPmu6G17A/z37bE9t1Sv6eezywG/HkFLBoKGVfr4DQ4O1Sta3oLIG1mMEKQDTEIJFA7sqMLjtIb037tW/40T/57LH28lZ/OpmD+sbR4xTNmmNuBR5nhcmup8CEPJRZcvW/abjjYw4zpdDICQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894009; c=relaxed/simple;
	bh=/LzMqcu3HHGE5GBV56yl9iCiM+D7QtWOREec3mGMfy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGMyqBonZESajdMKrYxKHmv8b9X6X5rqRkgO1hqcwvtzWqWB+qX1fOlPs9UHI0a15R3elu8/J4eZ0VrHxIGKErdlirHdtbZ0vK9/I2oIiKpVIdDM1HaizWlScvaw6rI8kdMpcBVVqWblGMb7deYdFCAzx5rLATE+ShILB6qtrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op28MRt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBGTYaeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Op28MRt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBGTYaeI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FUud1515198
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=; b=Op28MRt0CQd+bmiL
	ZNZK2H2S+JI2Uo5Zd+z0JwD+S2pGVeI2xFxYUG47QfknUReW05Eneb7dYcjp4Mqp
	E29Q/Dn7XPBcWhXnLcCP7s53joLMZ5QxkPYVzTRCZVCwCkYYxkouzVY0vgQKGn4V
	XOT73dxR8EMH6z4ONN2S7U9tJArEdx9TICXESRmfLbM4nMyt2Dbde5wd0Np7BYp2
	9bcqM1UlCIh7F4djL8YORPvbVMIt6ggpaI454jx+L1dXFDleKFhGxRvOgchhXki0
	gNcF8EPfrK3VT9PnpUTXElxL3bYlVrh/Eib71bM3wA5s3M4tUuf4aXwSsAN9ucri
	TC0KEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadwhux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:46:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so52811785ad.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780894007; x=1781498807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=HBGTYaeII3fTv0Njehh4iIJaMI9qWDgw6o1TgwE9j8pJ3hcggy0L1ArYN3l4bF68wr
         7ZoLkYZehEtddviKsNvNGTsTwugWveXPBTAqU7pTDoJobdutNF/SxbqQ9WR1fAZftmUF
         lWw1oDMu8IyBrm91z4tJB16Ssavhhd4nDyJtlNWnsCSVG1iyGYzGSxE3CZhszNgrECiy
         2WLNRo0qs1gZhFGbYYoouf0GThUxjcpM2bRW8sqC6agQKxy2qoo8M31FbE2GYSm8EZvD
         1VLLzjoK8xvCOnGQwSZ5Gn0TNHsL+/Kd79C8Lo4YRGA1NEXkn1Q0I6vAci/V4H3bvxjI
         gmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894007; x=1781498807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=q3ZjmJ1jcsUFx/J4RWs0wLXt5ARFC8dI+7ERaioe+i4hJX4PWnzWvx/gaSY8EC1xyp
         /jwCuBhP0dWVJi7MXTH2rQJQjKJCNNywlCDthDH/pvRi4n+KRzJSaQHd/cMkBW4DuUHP
         LUeJ1dSTHORldqz3HyukfhYrTt8Aw+TnNOwNLfb2YrGuluribsU46W6RgKfJ7tvY1fSl
         89Y+XS7J7g5Y1RXSdfcIaOWwV//OzBgBAyAdQbd8oiEownQfUQOhRr2snbBjeSNpF6qA
         TH15BniviXRoHA5UKInXEovNvFXo3l7wX5Fsx3P21GJSl2GNvEjmuRH6BKIUCZrIl1P9
         PhKQ==
X-Forwarded-Encrypted: i=1; AFNElJ++wpXiQtyoQkxgi5iIJ8A/bcrkeLm32/p7h1QjRMF3ShK0xtrHNwKHff8sVlERNxVmJrPwQgPxReeE@vger.kernel.org
X-Gm-Message-State: AOJu0YylU5kc2n/A7JprKLrFmufzPOb5osycsprzQ6GWFevGfpVnpvhv
	h9P1N33ToIhIX3ujBA911VYTeTNbDBH698Hh2xipQy57SrgkDVJEJ6DOfjC9qUPiaNs4URtm+Ce
	BGhqU9kle3ou69lYoCvyxtJuhJUX1fb8Et8rwsTpuu7zQ1ydvV1/HoUlXQSGVj4us
X-Gm-Gg: Acq92OGmtUo1gcuIfQegGLVrJaZZII+jVVxCR+LmnAyTP67CggEa5GvzgJ0EL7lR8Cr
	EzODrUWPNZjglMizcjbO3ado2xLUHR5zHRCLssvnNzYXahY80muItX0SA8Rk4SPBo+pWy1vp2p1
	13tUu7/j5jib18bSPleYGa2iSSSgBx0sVGTw7vYnzbu1RaTtCPduSvEOTAU+bxa/cOmIrfptd3h
	/V7CKG+4C337lr7baBbfsC5iYivypL+BfvOLxW9LfSnPiZy5p/Z+X47N5ItiNSJRK6FCx6RUKW+
	D6NLiLqjlS5LI+33wU3ZObv7DnLdvgEI8irSifhPNKw91D7lSBMV3LxA10JZ4T2dy4SrfU9koZZ
	WkfUWa5c3jO82mKlpogQGxjZQgUMlNsphouz8m3Ywm5vc0k3BLFdeC+N01Co=
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618435ad.20.1780894007065;
        Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618215ad.20.1780894006676;
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm173655765ad.27.2026.06.07.21.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Message-ID: <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:16:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
 <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a264937 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ayl1ZFWQluqbhyEjsXUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JrhEmEANtH5mK_EDaonnQ4Eqk-pLRT2I
X-Proofpoint-ORIG-GUID: JrhEmEANtH5mK_EDaonnQ4Eqk-pLRT2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOSBTYWx0ZWRfX2VXrfJj9V1kW
 I0PD/hTQ/L14FLl5Oxvfep0EY6tdhRY4UfOGPuG7RH9pNB9qizCDjki9WejQrRVQWvePUtdb8Qo
 6tEncz/6oUpUSFXo2Q8dbyN0uwC7fmUs5tia/Cp4fqMGruVGD+Z0PBOjIkHWZf95Jw4mJkml+0s
 TvsFFcpVbfEjyoB6nqfmRAZRN5mpYgt49LQ7m2kqeJHA7ZaMBY29PBMQG5HWnl3AbpE5DoXu0gl
 Lp0q0auEaQ20fBJQf7Y8/QOHdwsaGy2KKO469Df1iVz+2LsMoFcGjgL1EX881gsy7Ut3iNj+KLy
 /fnuvnGMMFzu1OPa1RKI0mqDspXbWiBX3q5Xhe7U//mLg06HP358CLNfH04Kmrtjf9MvZiHR/7P
 mwKf3Pk1AopZg2kdXQv6IN1acqnnhCutKEF9wn8tiA4yihNarChVpbl2Vvc0a0l8s8eVYCCcZzW
 DTX0wMuS1Rl2xTRCKBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080039



On 06-06-2026 05:12 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
>> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
>>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I know that I've r-b'd the patch. But then I also compared GCC on Shikra
> and Agatti. Is there a chance we can merge those?
> 

The Shikra GCC has new addition of EMAC, PCIe, TSC, USB20, QUP subsystem 
clocks. Along with this, several Agatti clock/reset register offsets, as 
well as votable clock register offsets and enable BITs are updated on 
Shikra, and a few GPLL changes are also present.

I agree that few clocks duplication will be there, but it will be a 
clean and better approach to keep the separate driver and bindings for 
Shikra due to these new clock additions/changes.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/Kconfig      |   10 +
>>   drivers/clk/qcom/Makefile     |    1 +
>>   drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 4442 insertions(+)
>>
> 

