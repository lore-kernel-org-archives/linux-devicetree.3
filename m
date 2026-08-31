Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156B2D781B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156039; cv=none; b=drnYewlX0PqcpmqqNnI6KGgBNiIYYK14aZjKx9UI429UYqH8l81ZAilSbRKMOeUGsb6wnB0PYAiGnXVOjSS7gsB6DYGtmx7TQhT2m8QVIfQcwQwDv2IDBLxNmAqO3+QTwSgm01yQ6tNN3THk2hv6Yl+HejhKwQ/Bjp6vud4kvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156039; c=relaxed/simple;
	bh=ajXJajPmgoM24esYnvl1jJ2aZyPSPcniyMhpLaJjXXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkKo441ZhQgc/54epni3mCcRxqmwzyNwYuO/SOziHvh9dJRnogPQiDirqo3MiIOWXRB9EjKWWwOw/DzeVujCmjKHSEB4WJX5Zqbp6dLYFYNXYyE4sprMRIWTebKDHnlNzc+fV3WuQWabpsrwJxDARrNTZXaD5q2lfyp1vcM7mIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P80YZvD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbxBvrHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P80YZvD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbxBvrHd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52KCb1933570
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=; b=P80YZvD2kLfpW/XY
	lVYX/nsTLNWjuYGaVvaCqhqpjjYr0+sxvGGQeHv/F3aymVWhlfBDfb/xnblMvPDA
	S5XnHVbONJiJSmkTH1dTTVQZeMPcvrmZPHs/F4F9xqyhpnNEDgLAcD0qjs7cK9Ee
	PurF1d6DpVjcN1Uc9kPotmjKUEUpxfvQ8rzOfhCqPzbd+aVgHdBO2O7hCA2qO7GC
	i2Fz8VVKl5xOq1FT8NVCjhTacHaM8etbIXdZZBubvFsWLQ4a683l7VJoPw+PUhDB
	5zAsUTG1Oj6oWsbWPWSANg3g00mk9xKarBwIgOvAdtyQUf++MmoE+OKRsz0tQ32w
	byTJng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq84mfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:00:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so61006945ad.3
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788156037; x=1788760837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=;
        b=IbxBvrHdBXOKOz5UsAN3xWQ7RP2wICWD6ADI1qr8Ug2FUE5UwpKaPf8wPaxqqaiEhg
         9tlBZHdaQqThDIINk/cbn/Va5UgzsQuALDWLhDC5eg+6ZxKbshjEjHIxt6G0sNLBL0ia
         rqvyNHa18JmK8BnCF81Al0t3qHYOPPxmtwi9wyedoTYALXVv42HGZwNJRK0GaXNiewrz
         UzUbu96Gpm9ONgEaJ3I1xupH31/xSpir1KVpf4KRbrCRGGBv5RgqC1S8BrtMekQITlEy
         Pf7xAl9F9ti9VXjPyOuZbz7NypwVAtZ4JGSrFAxYwEUx3aYuUJZvwiXJikRpuErj5g7j
         zHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156037; x=1788760837;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=niU6LprOtz1abqRWxAdbgVcbpUVnNtbMyz3RXpBA+6w=;
        b=X0XgjLYoBFHtOj0+0TL6SFViHH7+KR4tYB34/yYCxqTLfNzNmUnIX+Z2DWQjjWgYhT
         sB2QDgOfjOGlvy3GMHCXK+iOyEQ39UgVBfKNueXydeUm633sBoXc9e5jJM1IkmlNJIGP
         JZuRa6rj+iCNBmwkBU81IkLsCxNL13YUAu1lJ45sz/dHee7HtqipP49xFv+Pv4D6scVG
         QdnQwLhqp0JMG9oZwlKKCU8hUp41fKzjQEcIXjPTsdcyCkzOnReiTQzXvT3pLkKgvarQ
         tzk/l+0PyykCZnK+U5NTjlMAQkAPCLPrs/rtrM3WI3vY1+fGmv6dN0en1PevYoko/4k+
         y9zw==
X-Forwarded-Encrypted: i=1; AKwUvBz+mBsB+T4Y/jfFgXRg8wNCxjx+fy9SXc+d6ENql044VTpd8raq7grWcSjE2Lvy/uRm7ejzjs4EJAWv@vger.kernel.org
X-Gm-Message-State: AFuF++kfmbrfShF6p2CJCb2Rb6UpnXhZgh8gn5Sz8Yc3+5cafksljVpu
	rS01zbVpU2qLU7L7sP7z8SCqGyJ0B/fIhlLlV7S8KAU0DM/Cvhp5F3IheYOhkhrEvgaF/EDWbTl
	d7F3D40RlhsbcM1hwvHjSquU/5lGClT/NWVRX4JJoigeoNq3HuVP6UnL55Ywman6c
X-Gm-Gg: AYBFou3cVvfyoi7w4FWqrk5oMwIDI2EDWNvJl4riwvPMVq3J7y0lLzxZnLPjANrLVbA
	7yRLWU7fhTOHL97go//NYkGzL9T6EOCAzk0RKqW6Wvg6LrP/JbBaw8OV/pxwg84ExJuCBVYczrS
	e3L28S29Sgjk9Rsy6RsbWnQy8punUvX9yCkklmSDo1d8jrkirZwW/3yBqEJnlB4TqCS+wwvclbu
	TAt5Nd19dTkTv7mak6/XyaFBpRneKd+8VTlRTuB4NaG13IdnVgt0Qgwbp/AM/UT8KWMe05StV5Z
	cuur3V7806KBMDZgkclwYt5XPAIM5oEMi4ZzgmYYaD4zG2QQv47nRFI8yGPc+XmwIwRKXVZYZl8
	QJohQjrs+wp9A0wQRblXM4GxMwKw=
X-Received: by 2002:a17:903:1b67:b0:2d8:d4d1:313e with SMTP id d9443c01a7336-2d8d4d14b8amr226895975ad.21.1788156035804;
        Sun, 30 Aug 2026 23:00:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2d8:d4d1:313e with SMTP id d9443c01a7336-2d8d4d14b8amr226894885ad.21.1788156035118;
        Sun, 30 Aug 2026 23:00:35 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986aec6sm28746735ad.48.2026.08.30.23.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 23:00:34 -0700 (PDT)
Message-ID: <311cf38a-1af5-46fe-b2a7-4ea32c17d59e@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:30:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -BdpJd91AyxXLWpt3Bmo95qPqhuyMdQK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX8BzouW5r/lKf
 uNXPS9FxTl2hhJQKF8xem69ddbwlFeW1ECVeEoYf3MxtQTcuecNVZSCSCj5e0Rv8Hy89ogRSwHP
 Y9xKs+QusAnlYPILNkxrH14QEibGL7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0OSBTYWx0ZWRfX4XB7DwdKO7yF
 xf4waY/8dqkbcqEsmpOf7WDjc4gEJhsXExUGLE8+8th8HlRuHYW+2PkqVCPii+kJkVxYnOUuAld
 HQ4LMJHWTUvD3sYMOHSIDnNvCis8oH5efo7kFR0wOptkE/SwRBkJKsBMX+2OQJCkpTtifHKIV94
 Nijc04FRomCdKbvwVY6k5dDXhjIoHW8h1Vi5WbGodYtQM+T98IiAvtSf5SCIuSfTw3qhmTrt084
 Gp6xDklm4ojPTI59ias85NR3dZyQniqDtA4z74hV64Q3epyVcTg6BH+QWVuqvIleo3W5rBFYeRm
 waiXRKRsrfytBDPjYwn5egZsHwoH0oSc3qQGlRo116iJiutzDhEiyLfsdZfFa2/BdpKF/7fBzGh
 kFKIBZY8Wywss2wv/Z9A09BNw6o0gAf/WrLX5/8ga941I48Aimb7HtL8q8HgGhNlM3s79EmLbIn
 TB+CcbN0B7rlnaejPZg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a951885 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZHziGR1QICH9RQWzh8IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -BdpJd91AyxXLWpt3Bmo95qPqhuyMdQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310049

Hi Abel

On 28-08-2026 06:17 pm, Kuldeep Singh wrote:
> 
> 
> On 28-08-2026 18:07, Abel Vesa wrote:
>> Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
>> does not currently do runtime PM, the GDSC remains enabled while the
>> device is idle, even on boards where there are no consumers.
>>
>> I'm working on getting runtime PM enabled in the ICE driver, but the
>> node should not be enabled on such boards anyways.
>>
>> So disable the Inline Crypto Engine by default in the SoC DTSI and enable
>> it only in board DTS files that use it.
>>
>> Do this accross the board, for all SoCs that have dedicated ICE DT node.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Kindly check discussion happenend before on adding such implementation.
> 
> https://lore.kernel.org/all/56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com/
> 
> The idea is to enable ice as default and independent of storage media
> and enable runtime PM enabled.
> 

I agree with the discussion and Konrad's point on the referenced thread.
It makes more sense to put efforts into runtime PM for ICE instead of disabling it
by default on all SoCs.

This series brings the obvious overhead of having to send patches for every new board
added upstream that requires ICE. Also, once we have runtime PM enabled, we would not
needed these board-specific enablement changes anyways.

Regards,
Harshal


