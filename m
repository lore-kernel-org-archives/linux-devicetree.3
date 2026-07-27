Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16B145FE0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127555; cv=none; b=QeA8XL3s0qQOwHcLtRmJBraep8dMrifmCB1oiE+3XJLDeIP6ta4rK9bkvOsRARRKJ0QsS4sOO7w8jgU24f1XQvDDddmjHRHdN7hylfSweNMbSfItkbq0Cs5Byq9Sg+rWJNEWMUhRYg98T2CdDu7BZS5hdbi6At9U8eUdYcnrzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127555; c=relaxed/simple;
	bh=47D78e4QW/R5ulGRGapsQVcMs6w5CoLA4+pkNYFpAlg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Br4wlKnHptFBvex6c4HVCr5gPcXzTD+dX+SgQf0byTuNW316AZhSuwp/d5RzFLwqnaNr9jlSE/L1qul+XeK1Ik3uweJXlbGxW+oNEBQ3GG5RCN9tDDhHjYpMin34m4co+3Tmz2OKuroc0kSs/bBxzz0eLvQiMr4XMk/e+Z0ryQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMWE2z4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQxa6FI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMWE2z4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQxa6FI3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R3HGhB3604391
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=; b=lMWE2z4qGonlhCZa
	8N9LnJNH9KpaB21UTfCkqigd9YNOyiy1D07RwBLBZLZBsiX09MQdVWxLLa2P10Xd
	2sklqRxqgjFWZhvZvCW5T6C7U/y95S3Wl8G9cxEESdSg8xxiIIP+Gzmgh295YClD
	Rzn95r3KshOqTyEy0S8KAQKycHxFoog8OUx9/e0ocWkfh775EvjnLGN1xdkj+Ffs
	joYC62dTgUFdsUVACzOwacBL1oUSZKuQ3FAdayEmHqSHt1I3dZFPmbF6w39BJvMh
	dlyF2RhXUEsxvvF2SwW7/NtKsiSA9GaVYoKYy88rDZxK3qYls2iafjfy3qrtj6Fy
	bU2RkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wg6fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1799190a91.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127552; x=1785732352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=;
        b=XQxa6FI3mr1SH+1jU1iRfg7PBfMC7TQnBE82meDBZivMX+8nqI23ux4KTw+w+jrRHS
         +mXteP2Tpq4aIhD+/26xD8DqTeuOvwnjknXPp9LbogOjcpdk17X3sVvOg7D92QZ3ZQqZ
         +alMt4HdwNcEz92l5ZvaTmyUdkQdioAqENOHrb8+ciqNRs0WXZ4vQwkdg4KNT/6d+5/s
         n/Q7tWTA8oCKt14xKWRYDT8ecSnNMWGaYW9d7ZF2i3jIss304ie3OyWS1W2/S9suQ3fB
         q+/veW5owUhcxHtW6sun0Esi5kIUZHm8XQmOEckHfSkQqQeOHU8crE4LM6FO3hx1s6G3
         KKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127552; x=1785732352;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px8uh+g8dric/vO0B2ClWq8oPx0dHzsAVJ73+3m9hns=;
        b=tDQ6n5Qjq3GIsInD6TK0AEthukHjRYU4w1t3XoOstDI/utsAZxUuKYnupDRitpsBBT
         Ps49oNCbO+xWdlCP0yuN7L9c+gMbXOf+jvz1/ptvu3WTspKCs8lvi/lvz6eKyltDnpeS
         NZ4z5FQ9nd8P7t6chHQz/YzWOIk5cAleiOob/XCb91o0L98iujVuo9DpvBlnqK1J9Wh+
         4NY+y4obRUhfu3Bdyf6JZXakJZ3RQdRxi0MDkANuNzxt6qRhizf4EV8tBj/6WU3exDZA
         96NyFcxq+a079nuLw+EMdrDp+tB/m4Tb3gfGk1VAo/QuLJaamlStXJ3HUuDH0DZGXPxw
         1V1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6kK55/kOBASPoCe2Pm5C6CAIBwbjxIl8BNef5fa8nGUZnrNlEE2+YAB8pslpMOlZCMqJy68TAfMRO@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCnAEon2Bf8BOiK11xM598tcKoanF9mPDhL5fw/GguWB2GDdv
	0TWHSurgW2YxRgyYUEprmr4YeT7WxbOYVjSWfzNoFGesy3Wyvmd7ctBpioJ34d51V5I0+JIEsNY
	4EBJqYfP+ytiydcGSvHjP1vXQ6bmywcZy67BtgULmCYoLHeK666ADxv7hWztT2uhz
X-Gm-Gg: AR+sD10/nfiJa0DXzFByy35z4ydXaM1508U2KuMS2sLHkcYDbv9gE0m9xVIfoMeGcGh
	iTHeqqF01tH2ClwZ9knWK/aVdyXd3EdGOs3FzkV9W/OC3JGIC6dcHUyCcXStfya2Q4rmxJ30GZl
	yus8OqJqeKlpckcziQgCsLATRA7LcXIBjrATVZ8Py3EpEStL/q8WUY/ffPpglS8o6CExA8HCDlC
	ui8sroRWgxnnn3IcAjCXwTrY5RlkJ7f4lJ3381QiSXxlYxITGMd3WTw9E/58vIsWh0dndP26WbF
	s1j9aUon9U8bKkq9y3/VUhbfeMg6RfUD3whVnvV6VdyGR57C4xEff3kaEwTKX9es3HJRYVrmFEz
	kR03WUqN3uaaAyf5G42k+JfpTTciuj5dt
X-Received: by 2002:a17:90b:4d0e:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38f29527048mr6680353a91.19.1785127552001;
        Sun, 26 Jul 2026 21:45:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38f29527048mr6680322a91.19.1785127551554;
        Sun, 26 Jul 2026 21:45:51 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e261fsm29767458eec.6.2026.07.26.21.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:45:51 -0700 (PDT)
Message-ID: <b70e0e39-880e-dea0-1ca4-8d852b53f41f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:15:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 08/14] media: iris: Add power sequence for glymur
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        media-ci@linuxtv.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-8-de451559e88b@oss.qualcomm.com>
 <20260726060536.A27031F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060536.A27031F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX8ImJ5WYjZ9K8
 jP4GQoSmUsWlo6/+hHOU/qmsCnfa/s9AilARhCGi85P98i4IeXimputKDsqPPM7JvEBrA4455Uy
 R+e6RB+oIsLotzDV8iM7w644oBMJgTXvgV5fTMj4MOkHmJwVKccWVLV+bm9otob267t4wsV6X+r
 IL3pO9OMP0r/bJzQlLG1zRWZooLBuhkvQ9h17Pe6cFOY4q3R122gq1PXr0Ha5ZKCyhwOENsXHb1
 9y/EAJCNyCRUPAwUBBRgZtUTS7SCJgppiMzsS0HNPpR8R4AJwsUf/azFXv+jC5k0EUBoMCTkdj0
 Pu8tLfAzZMwGo5FBSnYu3zR3AINKK3Jv8BkImoRepogmKefyxbEdpY98yM9R0991q+ESTUGU1s6
 tPxuc16DonReRvdzCNnZkRfzzqzL8GHvqYjj7FJpOMGbQjRIQ1yA0IbvRaonP/2O1Cz8xyPjSon
 8BCbK+OgEQy9a7izmKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX+pEMNCZp7HCV
 PaDjCWwSWT1l1BkpJtJoarmk1yxpAx6CuBcINRC5jaz9HKugcQvU+59TrexWHex5Lbx+VgKXLhJ
 yMPQUkzKQKaWxaC1dXItNGN+P+Es9Ec=
X-Proofpoint-ORIG-GUID: l11OCFWTtLm_qzgno9FpJgNkUrMCfJOm
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a66e281 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pr5uau4MhCXbDCZRE1oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: l11OCFWTtLm_qzgno9FpJgNkUrMCfJOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:35 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing required NOC LPI DONE polling before hardware reset in iris_vpu36_power_off_vcodec causes a race condition.
> - [High] Iteratively dropping the shared device OPP rate to 0 before all cores are powered off will cause a synchronous external abort.
> --
>
> --- Patch [8]: [PATCH v10 08/14] media: iris: Add power sequence for glymur ---
> commit d2cd6a91322f190f5a10ce98b74613cfdf850a61
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add power sequence for glymur
>
> This commit adds power sequencing for the glymur platform's video codec. It
> introduces support for handling multiple codec cores (vcodec0 and vcodec1) that
> share a common clock source and power rails.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 7cda946015558..1b08461ee4d70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> [ ... ]
>> @@ -221,6 +221,113 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
> [ ... ]
>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>> +{
> [ ... ]
>> +	do {
>> +		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		usleep_range(15, 20);
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
>> +
>> +		handshake_done = value & lpi_status_done[core_id];
>> +		handshake_busy = value & (lpi_status_deny[core_id] | lpi_status_active[core_id]);
>> +
>> +		if (handshake_done || !handshake_busy)
>> +			break;
> [Severity: High]
> Can this loop exit prematurely if the NOC hasn't yet transitioned to busy?
>
> If `handshake_busy` is initially 0 after writing to `power_down_prep`, the loop
> will break before the NOC LPI DONE status is asserted.
>
>> +
>> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		usleep_range(15, 20);
>> +	} while (++count < 1000);
>> +
>> +	if (!handshake_done && handshake_busy)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> [Severity: High]
> Without an additional poll for the DONE status (as seen in
> `iris_vpu33_power_off_hardware`), couldn't asserting a bridge reset here while
> the NOC is still active or transitioning cause a hardware bus hang?

Ack.

>> +	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	u32 num_cores = core->iris_platform_data->num_cores;
>> +	int i;
>> +
>> +	for (i = 0; i < num_cores; i++)
>> +		iris_vpu36_power_off_vcodec(core, i);
> [Severity: High]
> Could this loop cause a synchronous external abort when shutting down multiple
> cores?
>
> When `iris_vpu36_power_off_vcodec()` powers off the first core, it reaches
> the `disable_power` label and calls `iris_disable_power_domain_and_clocks()`,
> which executes:
>
>     iris_opp_set_rate(core->dev, 0);
>
> When the loop then iterates to the next core, `iris_vpu36_power_off_vcodec()`
> will read hardware registers such as `WRAPPER_CORE_POWER_STATUS` and
> `WRAPPER_CORE_CLOCK_CONFIG`. Is it safe to read these registers when the
> shared device voltage vote (OPP rate) has already been dropped to 0?

iris_opp_set_rate(core->dev, 0) sets the rate to the minimum OPP defined
in the DT — it does not disable the voltage. The actual voltage rail stays
up until all vcodec and ctrl power domains are put_sync'd, so register
accesses in subsequent loop iterations remain safe.

>> +}
