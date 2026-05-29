Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5D3BD64C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046693; cv=none; b=vFF1w4hrTr/RXFKy8AbTZa1xsCw9ayORqoWg9K5G/bMoqIp0CBElzmZI3sCldxDqICdt2qAIXVuAGleKB6l59ciISqVE1Q/2K8rvVjdn2j9X5TR+iW6kuU491i1O+fiubcQaoczP31sHtpB2VGWlLFqhH1Agl5yvGiGV91fX2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046693; c=relaxed/simple;
	bh=o4sUJ27v7ooORme6fNzh5GE20SY6LLW/dSjlsVpGr/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVO026Qft+Mxoqzl1qF9la2kOop90HT1q9yT4psAbnSzaQvBSwNWHDmPw7Xy3ip3YYFOihY+xFR9Zo+pnFmYoJFHMAUzOBGd865JAKxO8EX45fo5I1u+CsBHdJIFmaXOEqQZx+jxLWNRxVREQC32RwU/rxXRnVjufxEuLFgm5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMlQkBu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9gw2Y04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMlQkBu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9gw2Y04"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6iPwi1386679
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=; b=MMlQkBu47y7y8i4d
	P0U0AgCGNXa5btwDSf7xcZbwiCvFVzGSiU33BXJ3sa1xYJ+nXXdR4hA2EMNaWnbO
	NZISikq+ARksdmF/YGs1FwGbRygVn8fr/mCBvrZeaXuG3GIRJmD9yMy8qbNf220q
	KIlbhm+C5eGeAiTG56Ql0kuu2/cS9yOS8B6OYS/DAYYGd8UHCk+xpWsmnbrw+rA/
	fI76xP1kMAqW2iWud1NE1JbuudQ+oWKTGQhlxiIQEOC6lFI1u5+UAayoKOdxyRZc
	45x09hgMC45GqbFcG/0Gu2cpnqANuWmDG4tFeoQuuu0pxW8F+tiDFGPbckZ+bya+
	atMFEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumtsdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:24:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so607516a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046688; x=1780651488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=Z9gw2Y04Ot+D8E46bX15NeHZK58vvR7YqUuH10Cbr+UdK791kClQE1/zHUB1CLy27T
         pGm19VWplMrlN/dCnOIdXKaQWGOZY3KOlPTCpo+MejVHmmcoW8tJ3W0v6Djg8dQr2MIL
         FAlJfqRGtGAHkcfSeJsmgmIKUcFmKMgldbTx+Di6hs73cJLB5MBbtYYGRaJu637S53TY
         rcuj3vHI/ixEW/MAzTiKZVuSu3FrJ95RVmGWYugsESiv+X7+zkzH7nNAMErGMRNaefez
         HjymWt33qSv1ddyHoO5fRhVxiwRe1GqPUyMHiL1+9V8UxeXeeyoOBsExIVYFrlVKjCDy
         hXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046688; x=1780651488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=SbLA6ml8VhwG/ZFCn9i7nyGAVrV909mk9TNaMoUj6GsZx809VlwtM6Wl+PAWBdHM/2
         PMAychJTxx1R78R+187YPRk23DI5xQb/8Knf/0B6RaGCmyk1xQDF4i1LPRT7AV/J0ZNO
         dC3sRMkzQ/xyTURKyGGoQZh7RpcyyCa06aLCd3cFUS35Kma/QM8QhJSiluvir9r9agUR
         7R4eSBGG3sl31OsfFXM1EA602/KU9u6zi0cWOR+XHLBpGN2Q5LnqCDglQjRf8wY4+EDY
         ah1ZQ727bTGjq9xDSy2w7fPP73BceoJc5OAWEuQZWD7U/phKsojvzXuAgw7tCXV916+9
         pKbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kPgD8LsRa+28w7yBVHTIBcXm1OUmoVcOHg6Dd5qa0E5yuX19qT9GvVuGgmD1Bn3xcXlzZvNZxjQFh@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrLbuFYLDWICccrFHoO6sJxWCvxolsSSnWC97KKT474OohqEf
	WDgQt2MOjaWEvTa6xVjR5LwEFAyXP1s/3Gz6LsFhFAENNLQQUXJAhA0/cNQ7PS7lvnqn/XYZt3y
	/64GdT7fGG8dfkQluzG+xpuHkRHdYLyHjc8ANVQ0QBHF2RiR4clzQsqxfz0qbmUu2
X-Gm-Gg: Acq92OGA0hey2BPHAihsK4uaM4mpCZhAWDApVurR6jfFieD6zhMOeVIOe+HlJ8ijaE1
	W+Tc2XOgSlCiVMfoLukN9qSA/MuFruLpZE/3QPZt6mSP8Td8nwRZI1U/VnTrMDL1OHOYzYJ/1Wr
	32gMP8S3I57wghJTc9mBYDpI2s4gCXeNfPCNfOKOZus9dDPaM7HsUTlWqcw/GUehiS9K9b5AA5V
	0ZIQLppXi2rWkYQ+VTLUu0Dnwilap98m1PhzeS6KqEkSSqLGKBEUS8u5kVcpA031/1QtHbOA15k
	7cmotXGPI5bpc9RGR4vo0JbNG2D6/aXRbjobd/s7OEmM2tUy+3QZvqa5fQ5qsYZR5UD/MxO2KDT
	uicZ45Vzxdh6+66+Akp3fMSCi/JgrPRuWhjrVYYSgv5wF012UGEUZi3V6UxO8vA==
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572467a91.3.1780046688469;
        Fri, 29 May 2026 02:24:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572446a91.3.1780046687963;
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0ae339csm1468021a91.12.2026.05.29.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Message-ID: <95c74b63-2155-4118-9c99-da483ade3203@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:54:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
 <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K_EfvllRbrNFqeJY0V5Vt6-ODUz7FhQD
X-Proofpoint-ORIG-GUID: K_EfvllRbrNFqeJY0V5Vt6-ODUz7FhQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfXy0U1PY1lcIxo
 UD2o7g3Yp7ZC4a0qRXQyTLiW/E41kVS/K87A2yb+YNaDBFPrWTrEKBS/tVPa4u+MfwWqGQW38j8
 5giJo8ixeC0rbPuiFrGPbFKaNE60ZvbGlANi5udPpzyu/CXoDP55LkgFZlM0i25JtviWKEMA490
 U0kfBQU73lZ2sh/BBZeAFVsMDYHHd6DzdE5JztYdX4gDrvXLJ6U9jc3sGKoHW7DEsqG9Bp1aGbC
 9WgIf18jUAMw7LS1JCXtRm6mSonM2pVPS1dH4qjP0UW9q4QwWdYU2uA2gVmw4DzNL2g4bh3XvKB
 lWJJXMiJzzFUZTC1AB2YPD9puBelpKPbx4U2AhEKj9jLvCilJDdUuUHY56ucEyBO9bnDdf3Ff6g
 3QJIYU7sLkCnSuhjj9lMiymAV9huUVm9bMXX4pAJ+QRiGyrnvOxecxI2OZSJ+kLK9Tx+UIButjn
 fu3Asej0dfIeQHwrwTg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a195b61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ub0LQIPdQfE24AbRluEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 07:16 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:06PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Drop modelling of critical
>> clocks and keep them enabled at probe time, update the QCM2290 GPUCC
>> driver to align with the latest common qcom_cc_probe() model. Update the
>> GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.
> 
> There are a lot of separate, unrelated changes. Split your patches (not
> only this one) following the 'atomic logical changes' approach.
> 

Sure, will split the patches in next series.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
>>   1 file changed, 74 insertions(+), 100 deletions(-)
>>

