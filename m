Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805494;
	b=filFFgrJ7xHaoNM1UkX+AR1+Fz4rnvSu7S0TebFxpcgLTLC+y9r69SfIezxnjU7lxP9a
	 Ys0I0IJJ+uTSAAGqG5WfYI58RcPdk9XM6S8Ky/TbU3moPJ3ncggA+lsuo4/x29JwgCIrJ
	 kAlNplNZvERx/C+PYfIJJMlcDuPsY9FjvWLwyz9Ql0w2WfPD3ROx2r1TS40M8AhJDfK0E
	 IdmR21AF71QT0rNg8QONrZksWXOaycwP43cCqvgQxCauQdQ4WABBGsq6yIDXPjvpk96ut
	 q+pe3HsDMaaxC0w0xQaJRBxcizlcrM+OrA17VGdWIIHF4+kx/GF82dsIEoF8TfhFDFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
	b=TeLe7O0XxAzmgKYnCjpbpKgdbu4rKj4bvxTU7brNUkUUvbiVkSkKiqJTrg35PINVAlsk
	 7v0QLfNWw3EE95m+ZgesW94tg8Kk5jmD/NiMtEX6nUtIJ7T3/1E3tL7/3dgXGx1tAzDxY
	 hRvXSa959OdtD3Uk35yc4QYtB+IY0WpI82XeoABH1GEoZq2eubqW/4NEDvvQDTJ2g30Ne
	 arEOwgwTZdXVJVscHJ/2pN//iqiDz9zG83Df6/0DBokbxBweY7h6e/T0eSmfoxnrJfSJH
	 1ULCJedxFmamDjqd4WTFtv7n8PvnnxHElhkizBPjcPXNnKgN5ws/ffCy46tl19Pq0iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mdfEK7jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P/t1rFgS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D401606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D401606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mdfEK7jt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P/t1rFgS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4R1tn095408
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=; b=mdfEK7jtVp1wweF8
	do9r/uilJDDcS2RIC4uMDN1Pv0THRYmLr08kde4N/55LEmS8Tu8X0+xMqbcf5usU
	tGYPS8IAtLR6gkP1vysiP3aCyTYVptkILrs20ZCa024aBa9z69Tc0WyVt9OPFPmL
	osu213cxB5fCh5XXi05FZxIf2FQZ3l2ORM+fwCESgCcXSoKeqX78hJse4zbZ9fn4
	A2pVNF/eG9T2X9523+0lMZUuZUcSX1wToyC14F4IFudxW46dqEqWzVBcNFLB2a3J
	Ev6Qcl3/c4tDf0JXXw81tf8wDfih3vPQH+gDQmVk0uLNsxH/bYiZMwOaKOSK9Cwr
	VXlkQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqmxrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:04:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cddf34086c8so551480a12.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794805491; x=1795410291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
        b=P/t1rFgSIjDlzEjR3rNdHGpqittVnIAaHccboy3+uKDOGIaWdUL4/UTylAq4TBVwsI
         xPgUwg0LIigr/7ftL812QAjNrOHjjkD5tNuOpWBTr/nzBWvB43gd29u67k1c61xQQyHd
         +zN/+bSUzK9G0+YHPbBA9K0QAmHyO7zFP3Nd+4IUxMKpUkEGouud9/56u2cm6M2csamR
         EdimkCMsMe4T98rN3MNgquRZxPakxA8rAEQUQFfaNzS0dfohsZDe1xYaGy5TshdFYwis
         SciC8Mjsq1PdVqqFOIt1uF9cSK/Tbywc+MB/A30nDH48zfFAle6hK3wFSx/YZZS13iJD
         lh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805491; x=1795410291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryPRF0HdNf6rgI2MrobrFyqzSxq0mqoFC9JGQuvWcFA=;
        b=QUEYTDbX+deL9ZL3adaxZJkO0x6MjinQ5ytChIFCDbVTGUPxTuIzAvVdKA1QO8iDk0
         kgmRmEON3L2xsM7AK9KZqjpMyvqOse7aULStDK1zlFNNGh5/aTCbPanCizVRhoYcS8h+
         E/saF/6JKbaoo/kyWQ+mZhplnjmklOP1ciV3Rq9CWRZFq0e/we/N6ZWZQOtMV0lP9BMI
         2c+GNfuIsqZJSNIKXfwSHRmvZDloCCBtGPv8YPYOI78iJQlM2UX7ffi9KXivx9Hn+jXq
         rz8BMPB1XNrUcdAXPZmqlmh9RAhqGrXTtbND08hbzbedbfELlrqEr9yQsR4lxKHZgQu+
         Z+5Q==
X-Gm-Message-State: APuU4Z8ES5ahkhzpH8WpY7/pElN26boIKo7uZBTlqjVJujUpFTv1TQRa
	ifPdSoEO8NDz+mmMvbiS9JeK/kMic/hALjeed8QuhXyXa5Ociabz0EWOYufk8naoyiedLp7Dtll
	iOUn/a5rf5nnhwLjbxQseI8gS5R5Ar1GRRPfhPrRL6CrzFN2cgkn9NcwhAYArc5By
X-Gm-Gg: AYBFou31stUdCzrmxDhfJULi94GRJ18kq2VRD9CZsAuX1a76zmYp+CeU5OECCcucz1x
	GPz5fgh/NBEXKCceZYM0Z1Ewtmbh8F7g71B0Fbsfu/UmQV7467+WfO2x62LtHJXbhmlcnURhgtG
	s6lKpoV6qFouF48YW0g4kclrEGko2KNbsDh3TU5Phyx/584d3ovLwU/QdBBjL3FSGZsnl34jeK6
	4kP4CfP49VFQIzBj2JSvrs+kxXwIMJAufIt8ApIradRRMc9BxIUk2tsb2c7bxmm9xn67+zNLKRP
	cvG8ue8pfQdEYJc0oqX5ZOjINwV0MeLJcAbec5sU+h9Jk4u0LrVsaCu10yIq17onjKCUGctDg8/
	MsGx3eN/bQfl/X3NwtUrf34dVu9dp+RhqE1NxhjFhQ1NqMsEdbrS1AZcHD04ORaFLhgVkAiMwcQ
	1cp6LuuQ==
X-Received: by 2002:a05:6a20:6a08:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-3f7a7ac81c0mr9042093637.36.1794805491082;
        Sun, 15 Nov 2026 21:04:51 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-3f7a7ac81c0mr9042071637.36.1794805490539;
        Sun, 15 Nov 2026 21:04:50 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6db53sm3176286b3a.21.2026.11.15.21.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:04:50 -0800 (PST)
Message-ID: <e60fc1f0-b920-4b40-85c0-e7af1ccba98d@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:34:46 +0530
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
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
 <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
 <sashiko-outbox-212526@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212526@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa8ef4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pMX85SVGjE-Xmla17LoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfX41Jy3fsqaMKP
 64y3zQPZYsqCWsfL84qQ2GVMC1YH8IrgaSXJt5vi7o+q8phDsc3jf6DRg7buxUApOqZGyuFuQZV
 DA9tw6sYxXEtZ+3ogqjovQf8z1CptTQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfXwEg5Ef2CGZkL
 fdv5tXJzsSUym7qzMP8aPU6JvBGifxPfRRT+q1AVKEyMIkydmAiCNXQ3ENpuzga37/UzRYDwOuc
 xA6RilqsJcs3H1PiBf96U2jTyiU7RcwRjJtjUI6vVLfLT9MbbsQKkOl8EOGGVW8IyJj8zyR1kBZ
 Aw2VDHN4g45Hy95Y0BHIjxnlTDs14RIi+Ej9kakmBCII7P5SBojltCJUGgJTOuaMf3YmMuI53s5
 +W1/NU4E8Ufx50LC9fRy9rmp8An/eNsuz00cvtOrQ4ZwD+P3T+nbKQ7ePQJpq0TmXh5wmjTXzOl
 sPfva3uGua8r2xWcqGj3KP2Fz0am4GjRNrhg+EHSvHCyJwwNDrHqxlG5VYx9eyB+zQ3RLg6CKkt
 exe+aNoKdwQjuIYQkWFjSdzEz7q3rB+tgW4RoDFxJmImw9bqcjrCKovvhtqhh0uebxAmPu19LB4
 8xJm5xvFpn7SjwV2Q3g==
X-Proofpoint-GUID: 2uNkQxImBQLqzgXjH79-UAjsU-V-oSGz
X-Proofpoint-ORIG-GUID: 2uNkQxImBQLqzgXjH79-UAjsU-V-oSGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160019


On 13-11-2026 02:44 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: wwan: qcom_bam_dmux: lost PC edge in bam_dmux_probe()
>    with IRQF_NO_AUTOEN
> --
>
> commit 4515119c8a0e425457d7366d017600d0d4e872df
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit assigns a restricted DMA pool to both the local and remote
> execution environments via SCM when qcom,vmid is present, reclaims the
> pool on teardown, and defers enabling pc_irq until the end of probe.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index 1479f8362e04e..04f3d46d4c3f3 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   		goto err_disable_pm;
>>   
>>   	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>> -					IRQF_ONESHOT, NULL, dmux);
>> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
>>   	if (ret)
>>   		goto err_disable_pm;
>>   
>> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   			bam_dmux_power_off(dmux);
>>   	}
>>   
>> +	enable_irq(dmux->pc_irq);
>> +
>>   	return 0;
> [Severity: Medium]
> Can requesting dmux->pc_irq with IRQF_NO_AUTOEN drop a power-control edge
> between irq_get_irqchip_state() and enable_irq(), permanently inverting
> dmux->pc_state?
>
> CPU0                              Remote modem
> bam_dmux_probe()
>    devm_request_threaded_irq(...,
>      IRQF_NO_AUTOEN, ...)
>    irq_get_irqchip_state(...,
>      &dmux->pc_state) -> false
>                                    toggles pc line (0 -> 1)
>    enable_irq(dmux->pc_irq)
>      smsm_unmask_irq() / smp2p
>        caches remote_state = 1     <-- edge lost, pc_state stays false
>
> With IRQF_NO_AUTOEN, dmux->pc_irq stays unstarted in the underlying
> Qualcomm shared-memory irqchip (qcom,smsm or qcom,smp2p) while
> bam_dmux_probe() samples the initial line level and handles initial power
> on.  Neither irqchip latches transitions that happen before enable_irq():
>
> drivers/soc/qcom/smsm.c:smsm_unmask_irq() {
> 	...
> 	/* Make sure our last cached state is up-to-date */
> 	assign_bit(irq, &entry->last_value,
> 		   readl(entry->remote_state) & BIT(irq));
>
> 	set_bit(irq, entry->irq_enabled);
> 	...
> }
>
> drivers/soc/qcom/smp2p.c:qcom_smp2p_notify_in() similarly updates
> entry->last_value for all bits while only delivering interrupts for bits
> already set in entry->irq_enabled.
>
> Because bam_dmux_pc_irq() tracks state by toggling
> new_state = !dmux->pc_state on each edge rather than reading the line
> level, missing an edge before enable_irq() leaves dmux->pc_state inverted
> for the lifetime of the driver, breaking power control and DMA pool
> reclaim on remove.

Yes, a PC transition in this window is not seen, since the SMSM irqchip
resynchronizes its cached state on enable_irq(). This was a known trade
off when moving to IRQF_NO_AUTOEN.

Making bam_dmux_pc_irq() derive the state from the line level instead of
toggling, and re-checking it after enable_irq(), would close this window.
This changes the PC handshake on all BAM-DMUX platforms and can be
addressed in a separate patch if needed.

Thanks,
Vishnu

>
