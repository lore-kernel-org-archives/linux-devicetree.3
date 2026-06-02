Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56EA293C4E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780377000; cv=none; b=GThfm0jGZsGKf1lXJXxP7bnDe/xWksojWhgpaHcGFFfd6/PgrmFxtJqlJ6xkN0tptFUj5NGpNqtsgEGp3BO0RCYZ1jfR4zTGJN6Or69mQOma6bYaTIW4ItRFyq6ADJRpaqKpcDQc32BAlLADQqE0Z+NqcUzeYc+nmqAGtHTFiww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780377000; c=relaxed/simple;
	bh=lUZ0yxw0K9cFDd8RwWixgRi3GecTBZHFRsBOtXVGEts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fmolv/64ULniKQlLiGERUUIOE72lDEQ0Zyz6OlQV9Mn43xhnUdj1A2077v4xcYnVrqUvaP7iNB54SQ9TQoh0MPNp2S+0vELQiC8Ec2Cze8XQRiMNhisJU9RKtK7Oagr+OKffIEEPJKxEFUd8WWc62icvdd+dTBTjNe1Nb/WZQBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xymd8kNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B47BR8b3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xymd8kNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B47BR8b3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520NUvd2740465
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 05:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=; b=Xymd8kNcXIirpa8Z
	DSr4UYLKhMAOmmDjrSfgrDWIRc+7wF1tYjbIVPA18basxQlTL3pe5g/OghBexEHD
	5dGXkkhs8j2x7SZJ15F6w4489m4Poo4uauK9PK9DOMeqpwpIqDqVUmOUlWqcpJFM
	kwmfdY2Sw7lErQagRZbekhwB3BD5weLdTdcEVD4oAIztlY6MubG7aZNBZAvg2RjE
	qRKhGHPZWJwyTX8Wiu4WTzLgmXfBRvXfs6gMgcKyLto8ar2StpiNXfFer/o+FnRR
	/77BAfYsX3RYBve39s4LWfTZq10BhvovfeR8+3P/P4bXikxpldrrLI2NErgi8CwS
	WLxOZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqmmmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 05:09:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f4b76so22080705ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 22:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780376997; x=1780981797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=;
        b=B47BR8b3bzusvyiptWUSKvBeDfUd+Y804/stK6JgZ6bg6R48L2JDI8baKOr4CTuD2x
         66EuzETcpnPvIkZrhFCx/5yV1E4fFvlIKHThnap5nOAbg77wcuxzCzawIJzTzyUPGj6w
         SEI2fBMT48/w0EJrdhlP9S33m4H7BZNNRNbHWj8dE3rIfuC9CV3R35zUUfFsDOuAq531
         lQop6m4qtUklQtftMvtickHz/K6E1J7j1B0urbrxC4qG/m8r4GvGhFEPUu2+1R3DOn3b
         dXYozR7sgergo9QjcPhGI0xF7WWhRDFpqcJu3lKUfVWdS3ip2VoTdz5Gzrbnq9z6WZVK
         3Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376997; x=1780981797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwWS+yzTNGK7wPQGaAYmhFsF2LOzNHchl/pnT8WMOUg=;
        b=j7p6QdDyLOldyLnaFA9oR9uMpC6dZUZ1/grE1ay4sXwoCyjsILAjQ+8P54mAcNk1j+
         NReX3sO7d0QxQcbtJgW932vFizbamELAOQ0lN6eHcVpSAFR3xmnpmnRcedJUp5OTgMe7
         ui4c+cgzrVDHYwNAFzFeyIfFzy9Udo3YhFhglbMsM9LQ2h13ASmwrTTmv4TNazygTkdZ
         kZK84A5RvaT30YcJgNajd5W184h/KJEp6cmJ0uY98s+t2VlbcWAhRKbjkAhhh4hOBCm8
         zrcKkqcckaqamQKJ78b1AVAilNC7zIaCLlo4SPspGkMQMnM7Kuo0KedXHmo2dsdbIklI
         q9JQ==
X-Forwarded-Encrypted: i=1; AFNElJ82YoTz+OKHID7/PMggdkdvnBnGrof38X5Lgia3vwNjLwx2lpvQGd9szN8cu41/63GK3XukIC8CxlVl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+UxfDapbkrA4+t1K3KJuRSTeJt3krnGuF53jIxMUUJbfMa+A
	U1kFs24WsHv79R1BaGiTdjfCINoPCEPHzCHKzvqWg56V80uyI5VKLgri6J4se3haaXMtP5FnziR
	sXMBXN7t+GkPZnWLj3vpP3dbSPoAwI0fVrE8qahiYar7auc30+LLO49/Jc+6+WOH8
X-Gm-Gg: Acq92OGltyiYSPorUM1nD2JRVb97D/E+XQKxMM+1S8Lij1owDJpoOGdXO/Oqo1IpDrZ
	dgnjVdbl0w4UIGhMoyBQ72cKUJtAkwYoZ2I2VIrddCTc2g8oYZYmJ8BQ2kt1XJ1f3exlO6fhjdV
	CJ53AGNATmHRTDPkMY+VIQJi+GhPRsHJ1E9jBiSFGiGmXz+g0TlONNv6FObpuwonNy7yEy8Npu8
	ac0Z1tyONHSs/SsHSuDQnrmozblt8mo0Sr9aQ4VghlY4er5Of1Ypfutkm1euMox1Y/QGVsuNXgN
	noFQeZGrhGd54aSVio8CH+XQDEz36TRgvj9rYtidXN+s3pyZz/YiRi3cNy43lTErBI9/Tz4Uxcy
	Fyli71la8jK9cc1WmFYoG88Kive/74/pdGtAlBmoi0VQJ5orrHUySBIZ/Z32zUghx15WHT0xuf/
	Nx
X-Received: by 2002:a17:902:e88c:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2bf3687d396mr167800435ad.35.1780376997441;
        Mon, 01 Jun 2026 22:09:57 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2bf3687d396mr167800155ad.35.1780376996973;
        Mon, 01 Jun 2026 22:09:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm149314295ad.18.2026.06.01.22.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 22:09:56 -0700 (PDT)
Message-ID: <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:39:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b-PQeSLNmr6D7aP6HcxxmmS0By-WAIFA
X-Proofpoint-GUID: b-PQeSLNmr6D7aP6HcxxmmS0By-WAIFA
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1e65a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dwDhdSHjd2LX_HmtBEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA0NCBTYWx0ZWRfXxaEwWPXdB8Dr
 X3oDQq/GjG7sDvVWkm+A6cN6+I9eoYXvVf9BNSC7aePq4TTxK6aJ/ISsgkJAg0RVkl4vZPRfKXb
 bD2eF3OD6fvyZTP92X7HgK3oRk9bagIFO12/dO+QUUve0HrffX2iBdYhJMDtfcySq5qDcNtLJzG
 qpK0QM93WPvx+HiRtED02s05I0sBogy3x39X21DbwmkDI/9PgVFxM74aKxTRqjlg1OqfcQHQPSd
 zO1vWsQsJn8OLf2b8ARGuH8WfnvNyepBYlGIp/wRG1UU16BpcOlZ3No9eF8SXy3Y5X9Y158ojWs
 LwziLbBB2n/F0WUpuDyn2Bh4RBXEDyrShP0xlM7YArNZMFM71SO5Vvs8wW/u6AHjI59PuzjgV2C
 6xTT9YI/RD0hqiI0zvCADFYGDMKiZsqcRVldlsR5grsmGSeYVocI9l2rUhgjMmWmWYXyMprErmb
 /njfSogI+CysNMOE9RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020044


On 5/13/2026 10:30 AM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
>
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
>
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file.
>
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
>
> cat
> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
>
> Upto V9, this series has changes targeted for both qcom and watchdog
> tree. So V10 was sent with only watchdog changes and it is picked into
> watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
> which needs to be picked via qcom tree.
>
> Since the watchdog changes are not yet reflected in linux-next yet, upon
> merging this before the linux-next gets refreshed, below DT binding
> warning will be seen
>
> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
> Unevaluated properties are not allowed ('sram' was unexpected)
>          from schema $id:
> http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next
>
> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>

Bjorn, Gentle ping... Can this be picked up for v7.2?

