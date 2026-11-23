Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469821;
	b=2GtnLAX1MnTgd2ioCCmdlpFC8vumejnstCo3cDOIavbfqSKWpItdGnGI31LV4uvFMx/J
	 8ZZlRZJwK3gS2LJ31EszXFu7V48Kak0QrQukeb1lGRoxxhH5ctsqSZpDF49rXiV8fikqP
	 /+nt+1059p7bnwW0V9qkNwLoVhGpvN9ilDJbpMTBVxrhOQvJp/4MC97vQjPvGh7COhpR6
	 tH4TLXe6bm/1BOXG6pMkHUU5rfxAHySw6bP+7elMc11oIA0sk/oowATVsSfP6zU4eFdHG
	 0+ocNEN8NRtWq6KTjHoVutmO5jH8L4J7OEApGv9voO4bJ6f34sMLJB9HwVnRDV26LqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
	b=cKiXUagx5R3kZEw7rg10JXyPT9wMIEMUQEiTqdseTsFsnD194ZnQmyIVt+rWAJu0e5iL
	 Zd+G3WRsTSboHoY9uwMBauibdLFsLfL2pXe4vtDtC5lht4nhZv8fXExeNOBYHiXrYICs9
	 QP18T5sysxz+J/gKXLKHR01xEVzPG3ErNyYqn6GYdvRlgkq2rcJ5I70ifi17st+/QaJ9H
	 vTIoFj7c6nzoElBtow4OHOzFRXkTddry1GZl7VdB7Z5QycI/qEs8E6q8AVroa73VAVeUT
	 voyamSDY2ltlAl4+Jm0i9w4xc0NVq/7pn6kk+sUwCCWId5r3xJTbng42CzCYo2NklNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSd9vp4d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5D606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA5D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSd9vp4d
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuZZn1579802
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=; b=R0pvB+LESdxz4WbL
	dbApRq0mOJpWAyZSdyKwhZUFbXhlI3BR78EenLBPW/Iz1cFc0RKpzpBKTl/j5Qav
	lyRNVnsplbBV+3+Js+PFaWmpzbOnCWZxpTOiIQJtx58U0Khqh56tu0v6Zj9TFtw9
	L2s+VmH4pSUMIe7vxnqRNNgU2uPnOfh9MEk5DOQf2HCBL4T33SoOzTayPpLcWhTH
	9pUlxSbZgaJNU2dOobce7/334mgr5geNuWJNdSI32ERuLLH716U3dUodUIpxMqJg
	7k4z9g1lLYpi4BtXslEWTDuByDP+Ux+otZhRcbz7/3gY7MXbtdXPWvHvGlROdeyk
	PiCddA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tg6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:37:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so2909383c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469819; x=1796074619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=CSd9vp4drp7PRK39yqFz4YyZ5jHMjoV/O7spAMHj59VMZNpiDg3Jv5pBfw+O6CXjj2
         LyX/C9ETODKZ6q+kTBkf/5afBaOTBBzcXjnTffCE1iwuCqyIwR0mkdvh0tbIvw2iWRAh
         YjrZ66YD0eXNUiK1Z3Px17VFmWjyunaOE4LQorBRGxAQrO22PSeFD+cUP4Nw5o3IJSDd
         8U243/fYxAsHcwKIvvsS1V08rx4/SoHkFBStuZFCzeqhpuYtXZwVc/4VExQLn317/Xwq
         y6l4IjYtjwYtH1VHIaBR9iiudSo9eGLfl6VBX8r6BNByev1BDPFayxWztsBWpxRJ/p5c
         C0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469819; x=1796074619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=c6a9vSwXY7LDQfv8ACMBwxjisZtpT186s0SpPvi6PUGtiOl42pyzOrdfPBeFDXpVJ2
         Uel5cNxa4LvrxLZCBQ/vRgqNPATYNeHm4t+lUe6Tvhpg88uI4czdXLAFIv1nVOg3aBTk
         8p4WLnBDo7X4hdGnnz7LTJoUQiTNBzAwRiIlAYvKOmjCh4csL6phpYsRsJRZcPpWCXhl
         vQ0kqKkmb151FkZS6aLkBVuaEhQ5ui646sDWy4GaIUBIx3oeIGP1gkN4LiAkxxELxfED
         QTS/fJgxe9q8K4SkqpQxAD1dJelHQCdP0GqiLy7ARTT+MqaNFARATPX1lnxIGBe/9NQE
         MSRw==
X-Gm-Message-State: APuU4Z92uPFzyLkbpAfhDtjPjpJdVhi4dXjSoTSofKdlZBYPB3dtyRvp
	mo2N/hZg+EtWUJ5R/mRMww3ADekBkbREXVWTXDYv5TGhjgaVuZQuSk3eSfNl2SNJZ0Hhhex5KpF
	+J1bq3p2J6oqdtB6UO3FQzXpaWauEmsjwXmQwj3GVtf9iV+0rO7PW+1biJ37OlMPfMeaYWqmv
X-Gm-Gg: AZFdTZfy0bVsoz90lvaQ+pvWgcM8NOmZGpMJf4Wh+iDGUuY4L8MTaNCGv6JKrLR/eOQ
	364Ltih+d4L2kw41E2lM0i45vTo72TcwAwVgMlvjYE9YzckPB+uh+yhtTA8BTtwxfg8rBp4QtkH
	k4/x8Ho1vtVDaT+BbfTGtN2N0tcA9W3Bicm5/B0dBUD/uYYeVSXIZM8skRTIa+E78+OCdIHb6Bc
	ShPLf0lKgQ6fp80woXf5NwOucOCJ8mVYV0UxlGz+0J08uWE6bMPAnQCTaSYBpy7K5xJNp3NQ7vm
	LLe8Dkmf3VX9eY4Ov7V/TVFKxuCalcVdq+SLk1s3G6B4nbUDCEy9XX8M4P01osHgIU3Cg5OXH0l
	72F5E3VLhjW1nES3gXC8xqBGw28Tto/7/2xgmDJo0HbhnhEpDHkILiDQNERCGqDVzEqvLx6dJSL
	Pq8ZE=
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386167c88.35.1795469819305;
        Mon, 23 Nov 2026 13:36:59 -0800 (PST)
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386135c88.35.1795469818715;
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29552288c88.3.2026.11.23.13.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Message-ID: <6ef26d63-6416-4935-b379-942b9787926f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:36:57 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229887@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229887@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bAiUr7B0lg7IohbDpHOVvEOwuu6K_7kW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX7ZZMaWWITCmR
 K4D6216rGcuWmvIOImMMywK8tDNy/EX5G4F1IHc8zMej6bmOAbfTvTojtk28UjuzfeDeY6BCq6x
 KquVSdqaTAVpVPSfAtH7iPy+L/5ZPQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXy6Jr5nvpttHm
 FbtO3IXN+JTdsu0FLpHhsslSRC02MN39Q6yspd8qYpUKcab2b+JXlmyy/uCLOOmDUE198mYjv+e
 NVi4OD9XwcPf06jLsmjvRSOlzAWc1Yo+xhRhYGDydlu7yO8Vgi8HGqjyX3o04Is5at4pS64/wfS
 1LbWne8/3KToFW3T4lHNjTkGXgrsGRIMW8zLlBNnuGRXek68xUGvM0Cd2os3YDfY4YiwsL8BlZz
 bJHJD0egk49hxgHGf+5bOWS02DW0LBf2bUajaZ/6Pi21DmN6fE57CF/bSSEu8uDkVMulWHkdR+w
 BIBfWmAZ/Q4WM9Uv8oeB0yEFU86M/uVf9HR4R0lERGx0GBGd36WOk7+Q9jlKmABQZss7TjLPrk5
 w0A4nlJJlS5ab01n9+cARmtLQ0Gx56/NejdW23mbjsy6GckHLXD103gSMGOgltpyRMaMTr9DbwU
 uRnDgsX/mHRrCRkDKVA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04b1fc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZiEXcGR3oAm6HCNq-lwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: bAiUr7B0lg7IohbDpHOVvEOwuu6K_7kW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On 11/23/2026 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] usb: misc: qcom_eud: infinite probe deferral and wrong fwnode
>   in eud_init_path()
> --
> 
> commit 9854aac37e71428a22eccd3000ca7589c021cc4d
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path role switch support
> 
> This commit replaces the chip-level USB role switch with per-path role
> switches that relay role changes from each USB connector to its
> corresponding USB controller.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index a3afa3bb93481..48e474bdf818c 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> [ ... ]

[...]
>> +	role_sw_desc.fwnode = of_fwnode_handle(path->np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> 
> [Severity: High]
> As reported by Konrad Dybcio on v9 [1], will eud_init_path() defer probe
> forever when a controller omits dr_mode (or sets it to "otg") without a
> usb-role-switch property?
> 
> When a DWC3 node omits both dr_mode and usb-role-switch (such as
> usb_2_dwc3 on SM8350), dwc3_get_dr_mode() falls back to
> USB_DR_MODE_PERIPHERAL at runtime and dwc3_drd_init() never registers a
> usb_role_switch:
> 
> drivers/usb/dwc3/core.c:dwc3_get_dr_mode() {
>     ...
> 		if (mode == USB_DR_MODE_OTG && !dwc->edev &&
> 		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
> 		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
> 		    !DWC3_VER_IS_PRIOR(DWC3, 330A))
> 			mode = USB_DR_MODE_PERIPHERAL;
>     ...
> }
> 
> Because eud_init_path() only checks for explicit "host" and "peripheral"
> strings before calling usb_role_switch_find_by_fwnode(), eud_probe() will
> fail permanently with -EPROBE_DEFER on any board with such a path.
> 
This corner case was discussed during the v9 review. The consensus was
that EUD is expected to be used with dual-role capable controllers,
while support for controllers that resolve to a fixed role at runtime
can be addressed as a follow-up improvement.
Link to this discussion: https://lore.kernel.org/all/23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com/


> Also, when np is the legacy "ports" child node (handled earlier in
> eud_init_path()), setting role_sw_desc.fwnode to
> of_fwnode_handle(path->np) registers path->eud_sw on the "ports" node,
> which of_fwnode_graph_get_port_parent() skips in favor of the parent EUD
> device node during usb_role_switch_get() lookup, so the connector can
> never resolve path->eud_sw.
> 
The legacy `ports` binding does not describe EUD as a connector-facing
role switch. It does not define a `usb-role-switch` property on either
the EUD node or its `ports` container. As EUD is not marked as
role-switch capable, the connector never attempts to resolve a role switch [1].
Therefore, the described lookup scenario does not apply to the legacy binding.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/roles/class.c?h=v7.4-rc4#n131

Thanks
Elson
