Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FFE194C98
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948435; cv=none; b=taHY5BNunbCz/5On39hn7QyMgrlx0tLw/2nG7Nh+hiAp7X4xiQIHYtfIy6mB1vw+FtaT1VqQCsomtWxn7Fv5f6C/zuD6hur527epZzyaVZSAo/o0bO31IAlkt/DRvp2WqhB9HgrFsqSXm7JRApeC96cRXL0LqlmyxrkAvlnX+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948435; c=relaxed/simple;
	bh=vtbusTWBAZN0+tv+xdLiLYNSGEM44v+6/zZ942lU6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/miTxiUhVl+Ir4GM7ygKbMN93v5vtW73adjjKqddfIJ0eBKTdHvMmhDX6Z7yUhSRGOITynEP+8gh9FKI62fe5qT76qc1z+bnBH++pvjupaCyfZd0rPB5chO8OTj4nsdEgPXNsmHzkvj2TB42z/DRtwu5WsB7aKf4JxLOhIzJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0O4wId5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZvW6ZgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0O4wId5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZvW6ZgB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5aUPk1841164
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=; b=D0O4wId5ofjlFYam
	ZXsBgH6D/rBOxH1EHfFMtztnFCET+OK3XjuQqxtkPHbEH5E4FYmLclekqJemKaL8
	1qRyURoxmXSAXQ+OjS+94DEQpwW5j7gPKlvBz3V/GxhCfvjnnVDgvgwrUJUB93Qf
	VD3qOKoblAUmgq5DBHJhwn4f/tbaWjtT21PaFmZZ+aiaCLTsbBcu0+CChtCn6lnj
	f+oOLeiN6fQYSgVb+iQna7lRoE3h782ypdpFoCyv0K6/6vG1N3KfTFYSpeKH0B2E
	iHCSubDncAqrNVGCiEH0r/2H25T5N1lEhxRw/17kjEit/ZHmvUc9gSzMOpgUSEI1
	PBHAiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsja4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b250d3699aso62445395ad.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948432; x=1775553232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=VZvW6ZgBgj0UT9W3UBxQc0tR9JsrjCTkwqNWs3qJRIzDGIQhx631LwIVf+NcynqLpG
         +YPZOLvVU3TFApqMS9MfOVqQJnyp6UiHofkosjjfNwlffYvzfC8zHnzr74u3zGj1DNsw
         79FAfzhWTrjRrvGo1s3Hf/p9GsHxetcJloEb8Gza6yAD60VaCraYZMcE4iBwzXf8Lx85
         QxltqmZjGhc+W8zFU90iU9Akg9HA0YdNIZFXNXjl9wTcmzeOM+xL8GyyRxthMgph8537
         hb7hYwWzkPv0nQS9u/tlF8jKhWTs//C3OsFyINz8nXLotuz/sqdaCcCf3DR4REb7gTlJ
         mLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948432; x=1775553232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czg1fnXViivG4aLWv1gxU3aLJ7wHZddjLbsExCIXOLk=;
        b=GTBYINZufWh8qgeuvMwoR+DTIpVH401V4/AugjMk9Let77lHhLOpXZHvU2jeJpgOsq
         XNj4M9Hc2eiaFe7yQWdaTJCtdF1HiqCl1GII6FEEIyGk2P/Q04KmrCl2PwSE4qgmC8uN
         O2QGE3XF+MsHkbhBDsWFRoXiHID1uYW2vwey5Ax8Rv5vxa9XSjxITNouHXreC2pRHW+m
         Cs9gEclQcxzWY9OJCJBlGYhD3YIZ+DoMqdabAlJuimjQs3M8SfRR0GXoMEDe57lCwbBm
         ypYS+oWOumfsCrYZm0PqhWlyQ0bM1iATRnnHcMKRK1ucqR4Ab/Wx7eVcPg3lgtM8ZKIt
         eqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYz/K+zLBNxh1rUHkdmMaXJRff3Wn0IGhsn+ZvK2lHuPZ1eQs35J51JPH3Oqx3fSla7H15wmld2ge7@vger.kernel.org
X-Gm-Message-State: AOJu0YyO58AbpS1tDGX3d3AC6I7FxujHps53QJv/V3KLjKpOpTX7KZyt
	tyf5R1+kVZVt7PZr0ikGHpCHOP/hSzoSHbItrmtnJHVpEMowW9+kmwBFeSz2La28u7fLHahhMob
	GdDxXhSU/5rOnKGGjUFxCmtXyIsJP9umXpWhpeLpL/BDQoyZFqt2ARqqOCKdZnkGi
X-Gm-Gg: ATEYQzw/6CG7X0EN5hZJA6KhCKDSLPHWam7MpfymIaGfQ3A4n5kvU2cdPMh8Hm88w39
	qA+5QuZbHEfoDfPVMhY+4px9I2ExbDdZRd4vN3SyoPcDPOkqJAlmiZqZPi+kY/aDnvNb1xTdGrm
	eNW5aNPN+oFOZ3d7UpoXLgRytRuI/quCkinkcSOBkoOEJOlR9tyDSx8Jc+6LAVHwmmzbAkx3Lxk
	TI65HQEVdGpJYtTeBDn6Bo5jrCgpU9KfAY5qmZIqwHpOp3gXTWJYkUboqGoaMlWDXw7HAC/WVux
	96+na/USAnFcSg5EEKaYFciZgMVGMGVvHqNeYiKi7yNPeNXw1jvzdNdZnaOURn7w2wKB0LaVZbo
	79n+i3a3aITRmgRDna44kn+EesQbtQGofAiVEEDEsCmWWaGWwNQ==
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443925ad.45.1774948431906;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b242da32fcmr121443495ad.45.1774948431330;
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b9fsm126761135ad.43.2026.03.31.02.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:51 -0700 (PDT)
Message-ID: <81c503bc-0279-44be-9e79-a9c313aa884c@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: Add Hawi TCSR clock controller driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _kN1QIGB6ZknO7IfYgVHV25_onfImuJD
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9050 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ofuwNcfXRJEBrn_tyCkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _kN1QIGB6ZknO7IfYgVHV25_onfImuJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXyYzJ5FcwD+ZK
 AAYyfmTU4FOSA0/EIW5VExuMTXHoS8XfLNR1vfRYLzMIuYPxLIkkDle7WfzMcFOKCb768dSlCK3
 Hy278+rEkYfKdFer85M29DuMtBaQzrA8f96izEPIhOGR1A0330EF44sLe4Ils3feEgd4i3QUb1B
 vYUKKITKZ7xmD3e9WOKrnzDA7A3muWeEpjPJ5YzTm3DZqw3J8mWO/jqYYA0Ud+oLIuaAbKbSsX0
 EMD2gx3DHiRKdrbIX2Ue0xj2MDVbDMlcejS4ujjM/ImL3vZQDwREJAD3d9R7bnfzxUdqKCsi1dU
 BZTZuKFHpMJCF2/+ct4B57CSB4R9mEX4zZ7WCDs3azYbrNwfA+GhEABpqQuQlRq6n0RNE+dZeIt
 QSgOzufpVMOmDaQiXrOxYXnbMl53PLfRC7+U/egnVeOLyXNKZXSELsqs1i5MJS3MQBb9XwMrxZX
 Q7GWynqpjPSg/ZdmPJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on Hawi SoCs.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

