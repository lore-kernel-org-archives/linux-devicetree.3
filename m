Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCF34A3D2
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517776; cv=none; b=Vy3FVCaVxoC4Sqs4a2b+if+IkIpfhLYk5ehHL650uwPvfNkiLJHBgNgJQJAK6NC5poCKoys9nzph0Oo1BlVesR/4NcAzIQwPz7VkJqS4R60EIdgT3q3gDgQhqGg+n2sWU4JDo/pdYSOev6n20vA5G2gYzAolLD55SXsbNT/M+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517776; c=relaxed/simple;
	bh=E1/qAidL7Jabx8QKfgkv4WL/0YNnbRnF+MDmvTejXTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lo2EQmVbuyO5xqAcoPff1yokkRFfzNkXKnY5o6xuzqMgdYW6aDB0aagA+8bOg1BclpJMy4TH7s22eLXBcLk+UT1OZyCIHpEx7iRiA9X7NA3ThQljDa5clIeYVV7qVdz32oT5PSq8oIS6kMv2AvazABRjmbWlNGq2XOvHQCvKiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNC3HONA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxgQvRiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNC3HONA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxgQvRiz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7MLhK3070099
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=; b=RNC3HONApnCc0ehu
	orOu4yN+S3QQDfnq5s/hJoIrDLQUv2UOtg5gYB+Mp2n6zSE+52v/+HCJlGSdb+tJ
	0TQx9e8nVbWX/Moj9oEYpBZ0dRPaSnEnRYoetk0GUSXlrvMXlvjGV/1IxYtZpWvJ
	RtkiaPiG5ENO4rkDsLndLzgs70elT6EhaJE2/Tn6PZfYS9+O6lDHa2q7LjKqUxi+
	BVtTION4dysy7XOYqJnVnvPsfZiwLsRcnENF98qfL6o6RWkhmYk5X4PTspSsLJ1h
	KgsjzCJOZjvHuiZ5RQMqkYTPSk0TMxMOPVfzmg/9cK7aHnWAczZ/uzFnrY+8J7hr
	ls4rLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn1xgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:36:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c4041so2307321cf.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517770; x=1775122570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=CxgQvRizaBxmlNpHqDI54oF0VKFE5eIFRa7lRNrKTRe29Jy5OR4bv10stmXt1Lagr8
         6HG0eLDt+bhdwMVUy1Ym49S9f34RTTXZXWGr525F8BJbTJfs/x4/zgeoLLaWCxrJ5/sn
         OjuKTAg82OUFX+TdUllOPN+zJ4Wbx84Frl+J6OniNkVmQYV1yQ64tqYL8AWtovgCGcCP
         DnLekXVIhPrcemxJ+srHUOZK8z27zYpgBlcJd+kMGSkMmDb3DtDafRNN4KJ9urTZSZFl
         sK2q0yZTt1suh9dS4dQyZGhO1OstSc1JwAs1jbtzvq1DJs8BS1a/TpX4chsAdGpSxLEx
         VDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517770; x=1775122570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=jovwirpJDb6PvVHoIKB6k/sjGtk/I7LLRmcg+KWkPyOBrfi2l+tlVcJGrFCgqnilq1
         MyIznYB8FsCk90KP0YonyF6ZyoYKkR/GN/kWSFwUEjrUW1uKObPl86AryCTa5XkuDXB+
         R7ZBPkoYAEnu2253+FnOeq5AaRp0t8Fh7l1Or3dMkeeFUHlNIyCORW5cWeaUeuIuE2Ry
         fVF8aiYm79Q22zwL74CP86R+2OwugikTdMYiv4QArFC/AVIFdrB/zK3tlYNvTfvEZe1N
         6QqV5kwqEUUQeN+IdOXbtSNvRyhN6bEz6/+lMzxjwi5bFFfUs29yigtBKB6r4AjDYQah
         Gx1w==
X-Forwarded-Encrypted: i=1; AJvYcCUowe6p2tRsVNQ3EX9T4vcrtYOXHzRGfx88SLddHJ+WTXayJRsCt4lCfneEC3aG0FQl4Lv+OaFxoKzl@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZfIGaagBSn3BGrQsQUJCEfLMZJlJwEzgX6BL5mIrIsPIs/G5
	sVTTx1uc3kUhMUCZkh/QCJaN0Ox4sFPvn7FU5/0hL24ab+OwwvmJrAexxIVLA3c54B7Pmk4TQb4
	4un4Z9L/8kQBSXj1QAutyRFsVjvHJxl3gD/T0/coj33z1opmqmWzTulJUPhRHH777
X-Gm-Gg: ATEYQzwGzixHI6lOHtrQteTnYRL1//bYRYtHDzn3Cc0uk1tOLfYw4Jpj+OkmD5VIbdk
	g5YAlGouA/ll65Rg5f9ySPh/YWqRQHiAK7qRUOXx2Y8KRvJSQGocjfpjCeSYlkOMy/ex/eV0Dxm
	BpDQLfT2uCb0P0axsdlvhDxaC+MnhuTOoE13FgQHTaVV+EQRaal+rOrrdxnmEFSegcr86pmPgN/
	OgxNuvSvGdPUAAAW1Mcdn9oNy1Vhux/XQZh3qimTzJwkzLVZPoRWNcb6JkOWTahB6btxN4i84Lo
	q03aJjglsV2NNx/4O2vTTBMrYYKw14dX4PfkEZJxXQDmVHMJ1qdzDhLAVr3ol6XIscGxr/KBtfG
	ZcPJhqo0uNID0gaMtu34fG558xqtgUSQuXqPHhI0otZF72ac53CJCDtX+ufLP8dpOkacYLQhjmd
	1bTh8=
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46236991cf.7.1774517770166;
        Thu, 26 Mar 2026 02:36:10 -0700 (PDT)
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46236871cf.7.1774517769650;
        Thu, 26 Mar 2026 02:36:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm95130466b.16.2026.03.26.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:36:08 -0700 (PDT)
Message-ID: <d1c4c1fb-b6cd-4d44-8c15-1251d0f65859@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:36:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: guptarud@gmail.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
 <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c4fe0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uvkyEGDT79mNzstEvEcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: i11XKh7LZCWmud-9LBwjeJqhEHESrv3j
X-Proofpoint-GUID: i11XKh7LZCWmud-9LBwjeJqhEHESrv3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX7v3/XCuc+Cam
 pyVi+MfIP95L1BMIAk6QQjz8eWUxTxRR1Rmzz5npp0wZrddacdRjvyHw40JnKgScnkax2aeoJr1
 fYcJmh4Iau3mp/jRlj4UTc3Br9gNv2SM01pF2zdjjXfMhNW+IKkMEgCddCwHMqB719zByjRWNht
 KNv2dxv6xvk4tnxpcy9tCk7RgjaCllI0YR+DDX/tUn+f5roqx/Ztpxtb1Sihb2zvTs+Y1e8UIZs
 o2SSDjx7JZ7w+0inbyhefcspXD33g5Ht3Aw0/GR0U+oxbXkTyiBStSclx/tUvx40T1CEnVzF2am
 mmV5fOI7Q1hMc/76c8+a5xOJNXz0Nk1b23eLCPwnGtoHTfIg500ggrpVb/QX1z7WY92cd4qfl9r
 YstJfrHoQCA86+JI00QUFbqzCMSkDXlbJ0vd0AQPWcX4wm814c7MnKIipMh+Y0foe1M91T+e1n6
 SZvl9RI3+yXKAqSoV4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/26/26 8:57 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

IDK what to do with the AI thing, but for the change itself:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
