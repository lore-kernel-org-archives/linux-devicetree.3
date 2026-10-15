Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021E4DAFB6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055445; cv=none; b=Ywjbx6iFrOX3Zz4eI2KbUBFjdqkFjNtq0IjZbDO3WCnIjELTPmHkHZVaLBRpcZ8vjMMjFu2zaqfXwp4lF3MlpDXZMa0wAQDSQZqJ/xs7UKFNHHHup8DoY5tS5+ZPzUOBENNojPC1MMzbidC6yk+YkzgWhDQMP/i5c5sOvcGY1W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055445; c=relaxed/simple;
	bh=F9sCs/Et+Q8r2QxPlaxDRFhUFrobaL5SK4g9Bng5fxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxUN7Vf5IFvSz9weIFSS8jRVvIwqEhkSAU3paeY3NZUOJaJTEl1f9AY2c00jjgVcfN8B4iAxOU6ytQjvvjmUtOQYEJBDl+YF9HaZ2nJLtS1ZhSqv5UysgFwMmHXpYiNHeTaoJL7Ta031QLOqkBSkGbaxFEM1LpOuK4r65pai2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNXqNt3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efGQ8lNf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNXqNt3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efGQ8lNf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F78Rfq1672397
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=; b=lNXqNt3tkE/p961B
	wahr3Lmhg1umEwgGeBlbKzdQD6+6DynIJcumsyW6FdgTDooOm3yrmyvioHialzms
	4apGwbfbo6HiiyUDj1e5uBpp1Ee4wERSV7RwMiy596LX/OmTC4reOEvy51vIHXm2
	ynGUNLCBTYitPT1RcFUlTqM5l49FExlq1TFFBc04dxFmK9M3f+1IbifZII0Ndiux
	taB/MRxOO7o9Jw/b3Xc8Z9JLQLWfZlV/p4OPfYk2qSS7vS6T+Z1CmYIydDcZsuvi
	KZ+71i0ZmtUzqvedLDcuCYCk2u96iDIPO76GTZpBlu/Kjvgj3KgXi7xQ2ui3/X44
	QLkjrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbkbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:10:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so17125136d6.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055442; x=1792660242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=efGQ8lNfNn2oMJbrd9Mo/emcmGmOyRNlqaEQ/R7Rpu2GenraIp0X7rIaYILNM/mmEw
         cacFoAQWMbCA4JeBeB2O7oWpgDmO8FFC5u6RMW8NgUtqlzU/xMd+2+41TudaLOkuKAgO
         Wu+brPREoPdFrc3Zrq/cxCeAlVcO1ca8iP5ltF8NACtg5zSq2yEiQFWyMKJdfPN4WrCE
         ekfyXs6eqHOwJcPYb4JjFCUMgJho0Ki0gG223DLi5Hq03s0Z03lo0bCi9ii+y+N29Nqo
         mWm4OqwGnrlqaeMWI2kwcakTWlldac//ksAjeYO9XCpSk+4NNSkN7pmElu2KY2jOpNug
         gNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055442; x=1792660242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=gXo/TXUp94OtITb+dQ1F/ld3zpKUkcpH224BStpHeZi8tIXqBowEqBKEHLeb5FoibZ
         sfH/4ZnOyTJwEerjHOAXfLcqkMbcPkfzTVKuSjF2Iea31xkDlBk9e9tkAW0gxShxYgac
         UadZveWZ3ebJX6fLjKcxMOWuCOPHrMFEuqFvAQIVYSjXSkd4iY9xxu1cNDBJzJH8KJU7
         Bmvy476wrQAyUEWxenEtEauYYyvfd8n/kTc7LDUDsZF3gQ3uKm46GWL2fCmeNat3oEte
         70LJbSQCfGCwN53lK4rmbXeNf4SqKUSJnRPktvyvmapLdOtS4CAqPjJ+lChcZ9Nwq4pz
         iBEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR54303iQEIRyoLeicpxHlxxbNX9c+YzRVM8jTzy8bhQcCBq0AIDhdC1kWe37bS/yIgqJVmPSvHyrL@vger.kernel.org
X-Gm-Message-State: AFq9FYLdLSObcG5BmQjfTcrrihOUt3BjHfmaYOSOq5pPYdmQutsI7Dkl
	bGOKwc6h+zhUWCNtMU2JPE5kfgTw6Sqlpt2okKfinJdrSleZPm7mApcGDLWzCNK1Ow7p6zfqDQe
	VkRI/duCHbfh5N+d9KOXjPhxqefrG+6rQl6Sd+DcTmt8izRLNHgJ+UTZ76ZdlYzVF
X-Gm-Gg: AYBFou2a7rDTTm8hSFhyV3STkE+VI9xFYDRwmMYIZSkd3fB3zr406yWiZ5By0xzmNJ4
	8TBW6flloK34OjNtdzaPwi0wu3OejwKWJPZpSFJAxbOmTDeSbfb4GPR7n6T08ezdew1gsSQI+Kk
	zg+Q8WtH4OpID8loatnnO0Gvu2hO0xdhPU7N7BEz/eRAVhmC81vM0VFgFQFosi1HpxYiNa78+8h
	6xtr7VqLb2+7j2OF17SLZ+jZ12qgTQywgf7f36EP7aVyRhfq/6wwbi5O6gptz8XVWFb90c2+WWT
	jR0jfk9952WsH0g1HScX73cLQE8I4peQBIT1ATDqT80d6tPeKalqkX9ojrHZ1MfEb0nOYHleYTe
	+VeyBxKuEBdo/1Ufaq5lTog==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641736585a.3.1792055442388;
        Thu, 15 Oct 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641732685a.3.1792055441898;
        Thu, 15 Oct 2026 02:10:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2188025a12.37.2026.10.15.02.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:10:40 -0700 (PDT)
Message-ID: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:10:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bY81miQFtauGKbVW7elS-15VUjg5HJLU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6ZHxUjSnTIBJ
 aJs1RHuJNmZ3/nKajMZaWHHuN9WcLy+mtlpyTu6ZyEmJYcqG+G4vvk010/M1pAz85i8TO+dVoII
 oXHWdpzRG9L3gQJsdPd+A/OVOwnbxdY=
X-Proofpoint-GUID: bY81miQFtauGKbVW7elS-15VUjg5HJLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXw277+gynqlPI
 ugvPRxkHufLs1B3tQTW9EynT231JG4GlKaP+Blos9tGdq2xVJyzWJu9sFJ0f61hf7epZllkqbYF
 tT8xWCYtPpNEQXDzsfviK7ukEYCCrMyXOJBvULB4a5hX8+tFKGUx/BZTJKDdnkgMliiTxbt1bgQ
 2VEfes3wV/s9u1UcxSuBUyhvMHnnNNP/q8/nKlvbh1J0+HANoTcBrIsLLsoEo9KfEwcFFmwWKrp
 R7PVOd/SF6Fkx7pHxCPM2E3DItxNac/3OPG4IRmyqZlpAYficqFjOqxv2RcAPMKfnRYT9BlG6aj
 uxhh7vxOkjatr1WnpRIxXxG1xCT+tIsI4X5BCTQOTHy/lJoyIkygeuQtsQy2JI1GS/52Y9AtwNj
 K4zKoDq5p6Hk7DTKEwFzxjs57MuidRwdi2Ol4dIgUcB4vS/2i4q4Lwn6ug9bawHGW66bCyxFi0i
 /N5DHYs8qJjZIghLkrw==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad09893 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7g7iOhDP9QsUep1Qju8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
> 
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
an earlier revision of the board which routed that differently or
something.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

