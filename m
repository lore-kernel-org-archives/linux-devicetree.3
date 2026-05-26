Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF6410D37
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815703; cv=none; b=EKfFBOgToZzgofoU5iuH7kom2oyXGxw5twUqZcwSRe+djjLqoPa5heONxnXpsmsO+naDLbaTxtaCpcR+FXGLkKv2Lev0oNXWX6I6/+wHmmgVHFuTrjR+YWt4XGXHqCCV9/ehDM0DnrOTD67Sve8E+pRXc9meXQ82QJIpcBhIcnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815703; c=relaxed/simple;
	bh=gozXShftRMQ9Zq4Y13ikrh9MoSOesCT7RHpSZjBg5l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dz3HWZlcQa4wVCAJqfaByO7K97esQ1VWRLgoBzpUNxlQoBNZ7wd04+a5MO++YcEBo3/Ve8pqj75dpkf6pbhb7tVHYQDfOGjUYZOclKihoL2aesOGeFKjHzTNdr6zJF6V+YfTEojeuGYyjP6H1sMuUz4qji5dP9MZZzb/biFK0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1fdhPyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHOPN2ml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1fdhPyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHOPN2ml"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH180S3086589
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=; b=g1fdhPyMfu8VtuZC
	9315iQQdpWLlZDiV3fOtuARdnSh674OvZP1DYChpzyrFjzca7lLtb2Rl+xt8IERe
	ICo4hHrNjK4Zl2KomNbK6L9beGeWQRBIlSSVQF6xUHxP41PcaYa6vwWGE5e4kYJS
	+V8+fbFvuXvHN5lRhw9XKPwbS1v5Kb0rFWoHmvQ5uHrbAFal+A+dLUJjcw2rsoRs
	0XaVHxI4vO+0CPT69TUifrLlNHW0zZy77jcoPFxr9aTiMXZQx3ScAMe9/eT9DUyx
	nanoFj9OviCqzZA6WGgjwdpn+doJpoHzk8FstgipQK/HEXRihkoLImYHx3qQ+400
	h85IPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff0en9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:15:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso121026445ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815700; x=1780420500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=kHOPN2mlRHkuz+IUe4UwwZffakxHvSw0kly+rToz/EkXhM9VC8gxy5vdD+16n7+90l
         owiGTnEYDmnG+2t6KlcbeSUvkbTy3ZkDdwqNBdABj93QIctKj2VrvyZcO1rEp0fJ5qh+
         pGdHW3fh2sMjeNdP6z3sXp8bS6vdhz/ibiy096n2BDmJmuYGNurUuvcVgCmJTHPQbKsE
         W0nDmGcxSLatkKMVRYiHphuttKs+oFEy5ydpFDPN5WbAYaArc0gctGMRmmyJbCym826n
         3ZObKNilTe9zQhpPxi5Yja7DGMPiTdWotU5i2LjxDYZOc+Mx6+L6aVa3Qxh5RJ4aF+IM
         Q/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815700; x=1780420500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VobqPO8lOIFh3fFVf2dOVAMsaLcnQXQFa1MzwwKIlqY=;
        b=Xq69VUGkKsLOOys1fNmqtMewNumAAAFt930jAjrCw+2dKFBm4t8mhxDafWUZEoRs1U
         0ZOY7rdqVqbrUN3XucEiwXy3xano7rX3Q7gI99AILwYvWqhPIj3ccslIGFpRMEIOmyx8
         r8Avb1pp0scEG4VfbcbC7mJixoD2K42Gz4C6lGkpfnjRKTCFBSAbSJ25E5RJ7BHUC5Sp
         +NuLOiZwcu1PwLIHt+TfnyaZXqQRz6+R3cFUQyTBls4tscSutg1bGif8RqaEnkYqgyvR
         VhA2IMo61j2zEq3KFDzAS93iHEeGxw10CqwV8m59hWwW8DV5WTP8ekLkeMjWup3Nl66h
         iB7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8FVggIFMB73zt5lbmGXfT4YWUxPRscJf0u5f1MPwkvDK8DlAxmH/Csf0RyNBLHuHMPPDmYmO5pIFkU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8CBSp9h1QTcLC7dRPPXXjUE58HZHYL6AoEDR9yd4Cz7e+JdF
	n1ZvAglF49zJ1BZ3Wasdda8CbJpBYrYr/I64TYqxV5KyQnQOQUdPEjiBe8iXGNgypajQlVf3LhH
	AAuTzXW1dFJUiuio/3vym0p2KQudFVBGP/W/bhXvnYJZgl3nA8vhmWN+Cw36+yUAY
X-Gm-Gg: Acq92OFDtQEK1c6cgU0brMNpX58DwSY0noBhyIOugJfiFw4jTkML7qnrxJsaLfNmvck
	KyKaCUX4NosE/1Y1yWhkyydU6KLodUpQt08gKkHJHula4dMCphhDGDI2iBApyFNa2S9cF3YmWaE
	YG3bVJBs9npvzTymxHIxiw9sItHZcenbG6c/+Nlz3IocFcpf0juqFcibBY2EjDekKa8PTuZhq6v
	7rD22YnBl9ejA8sSe9VdmOhvuhcwXVRpPm3WY71dHCvd5TD4u8UZRTSykmtgRKEzrWYjS8LLGzd
	bFnDnKy8kuv1xVATM+yTJeJ1HgRAyLoA96QRZiibQux1AW3f5X7FjyXCgtpY5AK/hq7b862te2Y
	VrH+p950SztFjdu/oNH7HmaZTECafEsgRVmrggEoWI2H6D1NiE4pPLfBhHTI0
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267465ad.40.1779815700322;
        Tue, 26 May 2026 10:15:00 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2ba:237b:7e1c with SMTP id d9443c01a7336-2beb07ed82amr219267125ad.40.1779815699872;
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c7046sm133857785ad.57.2026.05.26.10.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 10:14:59 -0700 (PDT)
Message-ID: <27b05350-fa42-4e0a-91f4-a7950c38d7a1@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:44:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15d515 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aVq2fB6C3sEP8nRkfhsQhw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5L6ES0iTLAyjbOlHcnEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hgm9VNDryfMRINCEm638dSJ9OegDXr_K
X-Proofpoint-GUID: hgm9VNDryfMRINCEm638dSJ9OegDXr_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX8JoRwnJk2RTD
 3Y7xfFG6RgKVuV+I/h89NDjVXY4krw2qycerbzyVZA1C4Xo7Xe/lr9chVueHfwIxKrxKoYK77pR
 DpjdYw4LAX/nH08JLl5i9RUfsrs55ZIXZ8sNvxI5BJYPLoJndmTVzudxDS+g9ACBBbxrywAbD/l
 bSBEv5aiVJhpBgY3kwO3wrYorDjsREvoJvfikrmXfwlfJF1Z6rZTHKcvmPb2B72dbyfr39gDYl3
 zb8QoAJ1vxhT+Ec5uGVil4xcxHN1n2yxT6aAkosJOwQNP3eW0mxPZLABrHj/tUFFaGmZjftuCPs
 dM2JvS/5+Szpp0neZh7dZf7bwdiII4VjD2tPibsvC6DhM6gKLpsDvl1cgGmFX/0o6/fChoXayP3
 Ce6RMc614fllipENdCVx2MNlNSKmO0UP8ffusCKn0oMlR0YVQQ+LOC0UxHOL5QaC18JWltXTXMP
 rj9fxHaYLgemEcFXlRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149



On 5/26/2026 6:24 PM, Imran Shaik wrote:
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
> --- a/drivers/clk/qcom/gcc-shikra.c
> +++ b/drivers/clk/qcom/gcc-shikra.c
> @@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
>  	[GCC_VCODEC0_BCR] = { 0x6d034 },
>  	[GCC_VENUS_BCR] = { 0x6d018 },
>  	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
> +	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

