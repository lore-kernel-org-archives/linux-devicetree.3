Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A995233AD82
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061424; cv=none; b=c3WftvL9+eioKjCbigOTGCcEXNx+EEvHRqU8d6n7/KhJZRWjVYweqhsO0mEnLANqKplXEAyBIGtcZbBulLv+vveZJNqFpPG6GWxb71ynukJwOhr/BW+j9RBtwA/nhovlI9YpJ2KnOqStzdEJc/9MqN1dTvhnIidJVGMdh8zcnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061424; c=relaxed/simple;
	bh=MRykT7Ev3snfAOD0gmqt2lYUk2WpxUNUJ/ph6pxTUM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRqHj95G6u7GMYrgrg8/zOaiPJyf2URFfpi5iCB6R0Mtv2reiAfbs9QgxVAtXMwRcvt9wFqFGG+qec0CnhrScDflHLg5nKYagEdgQSW7Uit69WoF6xLXdf1mTPLkYuYrycf1tB73r0o2SbcJ0khx6aYvPoMd6qTMY7Y6yho92bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vukhh6zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP0Rj7Wm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vukhh6zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP0Rj7Wm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKrCg3845242
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=; b=Vukhh6zxXtDgPfLe
	lWBLq4ebh8PoZTuu+0X7Mv3gSIGoWD5n+ySalceCc8X6mBHY+5ts37JMavRK5Q5t
	suPNECaPJ0fCL8mSJoDNBcXntqXqNPH9bmwXgIZrBVk0Ekw6B3sliLp3U99WMlPJ
	nN10WVlVMe9p3fVi3xsO9lZXTPvgaRat3w401+yN+0tN2qzzwgCE1C4I7fzk3xkw
	NBI2bgwhcxBOrzPi0Gwgg86HoTGg2xUGseiELwZl1vvuYJLV/sa4jjkicUd4Po5P
	gXE591Dw7Q5gR7MChKuWDiN9yA7v2wIUHnuitRND67uJ5ozeG4c0OxsuUVW40Hu2
	IJvubw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3fk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:30:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf0453031aso26033245ad.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780061422; x=1780666222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=DP0Rj7Wm6sFoddH9Z4aSFaTYcwKZMkMXFOiwL3QK6/XiOEAfOHoSSl4MHEFPg3S1mB
         wK8uZfjHtUS0ceBCLY//U1ruT+Yc/BpDT6kG5a2sbF9ME0JTKgCOOhP6mTs/EPP60YgV
         hSO1fpdVqM4u/Jgzteq00Kit5mel5IbAhLpLfi7TJvWEdPyMMF9kQVBCR2bqlPZ06nOf
         hd9hJIRMiWZq4v6ITvFsQnwn7Wpcs0/tPHE6S9hf8W8fMyR4yPU7ycgPgEf4N2Z1ZaF7
         GB5hEESEqRofo7LFyneZX2duPzMB4UJexmTiubEKRQUR+lRlnvJWH/GXIZzywVSgIxQH
         QZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780061422; x=1780666222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=EXPT68GkeTcoDhknVi8euRwVf1YBZ1uHa+VaEfcA0hyoZv9wNJmCkx+il2cwiiF8Uh
         70JwE9LX+OgkNfAn7vh/MYlaBgjew0mIAz9HT6XOaMw8fSm4DJRwKLHQiP2L4NfnJlX5
         dgYGnda2IjvgLuucpk7hs+xmjjAIIgKpQwi1HtUPwiXJs95/n6jVFYPlEXREwyZC+wql
         0ko0AhWnVmgvgOi6XCjBJpGF+vuAUBmvSPK4CeEw3LFniGxoyh7di0uay5CZjeEOXElm
         N1CW2Kp1QKUqfm0ZrA90csrt7e1s/RBxl8eajGByTUe0NW+IbBk8T9qpXVzwfdJXO6YQ
         qvJA==
X-Forwarded-Encrypted: i=1; AFNElJ+kdZ614LeU6JuJMl6DpxumQOLRs2dRRSyr3/vXqM/ao44DybKc6MrXdF1CNGtG0u97YQMDkh+8+0+C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Qbls1aAskA0ED33g9WKMkHkg96e+LTLMH2UFy0lLjcRVF0q9
	vdZmpZ7I/s22G407yFKnu5NxRxMmsh/vwXx9uKpRxDnjyGpVmwozCv9awmtobXCInokhYma9lJJ
	6iuBFTXfgln90F94sPnnPKb9oXlvhE0o4A+htXqUioVRB70soKT/0vsLe+Y5YBpjU
X-Gm-Gg: Acq92OHrWzjtuBxLeqcYtpxHdBoxTOPgYpRVNVAHR1JtN71Yz04RSIh4uYmsd/vBd0R
	m4s47ihUSBs7vbmFWQKKZTr0XaG7KB62Jend0J7iPVuFoe18tmXAfgrhYyNmI1Ot37RHRTkk2d/
	32gf4K0S1h+Q1uKifHOjZFh/HRL7o7vla5PnfakXb86Ei12iYw4zdXeW+n0VRHXHbDO80CvsRLy
	SqFri30yFhI2Oqgq/9GKgMmkzMUaNCr+sz15OP2B08EwOHJqOUojZ9Xxka+tt5tuKtsdleIVWwT
	EXcdcOIUjmuxr45f26lvqUdLwrFJvpFj450Fb06Wn0T9MVEMCXcTh2kevbVka8RynIFpzSzBhsQ
	lgXheV2zz+CotIotFb3aNl6rog6dHlwwSULJPOBPPz+yJYcU89I0gJlHZq9lMPdHRvv0=
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38770045ad.6.1780061421553;
        Fri, 29 May 2026 06:30:21 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38768925ad.6.1780061420801;
        Fri, 29 May 2026 06:30:20 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3d6besm21715725ad.74.2026.05.29.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:30:19 -0700 (PDT)
Message-ID: <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:00:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzNCBTYWx0ZWRfX08jtaeB6rltC
 rnCuhXoXypHZEAO3u6FQOJVpUO79SYolkVD7ADRYP/2fBTs9fil4LcWpUy2K/4e05Pp4hCnw1C9
 X+iQhqpln3TcwWXX9A9vVbBM5Ma7WcMJpVHTueCSb3hF/Om8wCMweaJEhEnP0s5pwJE85d5ya5x
 XSjeXGq3AJM+9X6klnuINFydyzbMWLXCowzow7N1CJp77yqMCTFCpPfBOk+SOcatbMWVI2Kkx6W
 4EjAuW2DXooZTP3o0Nicd8uLOY0H8FqPYw47d6uy+ca/lFFW8ny6+bw0La0Eb7RMIe+rsFiGYM7
 BFdMsGhHOfeT3rclG/MYCizMezz4YjAlSLmIepUC9kzokwQiI4q6WSOzwzRepDcaRs7ky7EzJqJ
 yN7sy4MRTO8HZsF9H78bfmbkjIQiCSRjZ8eTPrx2NjzSeMFIh46T9GAixAWxQ8b5wDLppPYyJBm
 BX0PhNpybW6R9wmvaGQ==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a1994ee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=C-2j67T39HWltiyTxO0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7XWCei0wwXwWEfF4zz-k9_bF-92pkvDu
X-Proofpoint-ORIG-GUID: 7XWCei0wwXwWEfF4zz-k9_bF-92pkvDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290134



On 14-05-2026 19:55, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:

Hi Lorenzo,

Can you please review the if its aligning towards the suggestion in v20?

thanks,
Shivendra
