Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C243446A7
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475139; cv=none; b=s5VJjMBY5fKZAmP65AuFejeogjBBAI2yYP+LC3Acepoiu65/JZBocIB0zsSQsh2q6iD1CjZDOeaAIsK7XPr5B7x07fS9Lhcr2hIFv02lrAcuRL0bT6u4tKP27LBbnZkOdPgkjKbgiqcPRHTLRKn6xFkc4A5eu3yHVy03ssc7Wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475139; c=relaxed/simple;
	bh=EKrC2N69slWRV+1zTBKx4qr5qT53tyj0KhdXucCIoas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4uGc1Ji5UOQwuK04z4+4UBBD5cK2TkiZkqBHjvm4uKTE+9r/Ryh1KyZs168mFGUHkANUZiCNadEePSunB6opF2iT6CUYMcd8S+CgJixJSBGcGMrQgtG3ah2WxCxe0W/Iej4tsPx+Ezl5HWve1Q8hIOhxwU6HlxWG8ANqJSFW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3xzyvNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK2OOn4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3xzyvNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JK2OOn4H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5APw03509278
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=; b=b3xzyvNpUXT3NtbL
	G6sws9oXKkGoIUc71QfaUSAG8/PFKRoU9oSRjivSEDrNXOzLiSgykwlVRplW3czu
	IzbLPvaVtfQfFp9gQYp/lhQrrMmtEclakNkBslOxKlwZNzQbqnDBlGH/sGUQk6vM
	+LeXVhRpdgVbhEep7FHuOvEnpf4DNDHNV8BnXRlkmg4zNOP5FNTa/XXp446hg8dQ
	etAG/pRX9/H7PtH0zZhGpi+pIOJokMdNokFFy/K4eDxk6YuAVrOtK6CHkdpMii/+
	+sqjXFxnpIEJdTyvVRUR3O4np2rreVYLGhTRp/8ibv7MfXUBk1hC2jPIE3X5dPBm
	9mdCHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnavr0wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:18:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso566459b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475137; x=1786079937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=;
        b=JK2OOn4HIdTvjOK3Kgmqt7r/pDdUNO9x5vc4jqdSuIC1v1KunbyOaFNjc3xCDOeFB4
         T3+dMw2F2Z3VY5HkATXfcWZmdGE7jlFQCySuYz895indFGY2TOCaPhSJhxEc+AvSaglK
         +FVXUyrKvlUcMgvXA9XUUOL4Ii9G/V2P6ZmB+11sKSJ9K6Qq9UNNJyyy6+3N6/0FkMpa
         PdF0KmUfU6OQtwXscZVNVShkU87+58mEGByJcZHjOHxFrVdud0q4U8TwywrWhViVcj48
         gy3aB67qyzdxnRWsQo16Oi+Y+G0/XeBmtW5azGBwPpF7CcftS5S5bGBvh7M6hoB4pZHk
         XxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475137; x=1786079937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=;
        b=jOwuxjFil6pqgXE2h9q8Hs0vCoe8IqEdoed1CvpepWiuGu3osyPtxhRhj2aIgoJ1uh
         urSAZFeknFM4VdP0YmpCv8mLeTLL/kyn7VyzeaKgEjWuNcPa1HFBaAunZzCDDNxpcjKg
         F2XMC4QjeGAkGvopYf+Oo4xIDwLLfBJ9YemGqbBuUkxC8kfeXCwZJd8fTYdkuBPLL2OJ
         YHfBWtB2HwSPtZWcKnG1mDeDAOvuuzh0ZHwWF5iUYL3HFfRZYHY3BO+seg8POwQ9fsvV
         U4Ub52LlOJcXB9RDvPZCcO5SMZh8q8ZyY8uNGKoZAIhzGf/IbcKu2xA9qbAMskdB7idx
         kdgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4RTHsTeLT6rNvnUZCr1wWU5Vi0GBmNeQ4hOMzJMIOWbPmBhES7JZ/q+sod6kbzjIaCwYgqllT4eTO@vger.kernel.org
X-Gm-Message-State: AOJu0YyBf6SHMTYNL8gL8C4FQ+oH72745h8JdLwkv8lylPfh6Gfm2gg6
	9kRgtK7yqBKFeL0LldDKUZI9mW7/dcg+5QjyBflDBiLg2GRw4/M8MkCWSq3NfLbFqaFjTW2aFDU
	OzlRxb4GxMz9ZVwDrxal4fbHcKWaJIikneNewXoduqrkvUEb46YJUz4XCrTLqJEUi
X-Gm-Gg: AR+sD107xdnvO5GjXf3d8VjbG6UzXrHnAUXV9rgGW/Z6hPAxT0jQhSn42MVKX/Sx8mk
	i64ZEgYgKgkWUjUGAzR3MLa+IwuatbbK0fo3BbBjqXQUh03aksTF0YmHZtzDg6zlNa2I3ZBv8na
	ZSVEL+TI96TTpTLBuUzbiOTw/n3N1F8d6OGoNfVVsIbdzZwqwL2xrNXPvyiyk9B0cYoghzdkpPP
	YL1I2UGR8JjQQmm3s2FW0rOTlylAZdi0ruUeD4LFeic7X1HTHDzTjRFhMls8iM3jnrhoCGodN5R
	uOYbFCzuLcdsWZSa4hkvbbTG4VRTj1teM3J3BuxMhrTgWeUofFq6pisxvlB+rRKrrLvH1TjdePs
	zpEdkmSZzc1l4PjzDxaPfRIhFLbRk5/Y=
X-Received: by 2002:a05:6a00:2916:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84ed7c3c161mr404871b3a.26.1785475136771;
        Thu, 30 Jul 2026 22:18:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2916:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84ed7c3c161mr404848b3a.26.1785475136109;
        Thu, 30 Jul 2026 22:18:56 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5dac09fsm253593b3a.28.2026.07.30.22.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:18:55 -0700 (PDT)
Message-ID: <8aefe4d8-7d13-47ef-b18c-c3db652b06ae@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:48:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-2-973cd3a226af@oss.qualcomm.com>
 <20260727144005.F28421F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260727144005.F28421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMyBTYWx0ZWRfX1yQ5A5NCHQ6O
 Ui79LSxZlCVYBgGtbjUYvEU1cKxSGwXNmfjNxEOQQGiu2hD5AS5bxfDkR6qBT+EobOzqX+H3fL6
 TN74eRA/AhlS6owX9uX9xclZM3CpFrqvHKqoBtLJ5Dn/DV77JtJ3mBxVvSh6/1+dRAf8SfUvAXZ
 jX1X600kjXGt2pz6I1QYCbFgMrfGWzmP6nXzYlWdUO/yQVUz6/v51ijLI+8oksgLEzXXfoO1XmT
 6x8NqinaDLPKjGamTQeS5tnp+pYRtCIOQK2prfkI7g2l5IAr3F1/6AIU4GaTFsQN5iw7QpSFvLr
 A6uckhotU2/dtvyyCC0yW0QJeHw+76R85G//+vFbKnPI2cTzuDagHN/c3RHGBz/MJovYuU1EBXI
 lXYoDmtlz4wT3jI4AL1MDjUGuoDb+F07UOX5smv5gqM0j7gVo2ciXzZSwOtLw6VZ5CWCnRSspTp
 THi67W1LrvZ39hrwa8Q==
X-Proofpoint-ORIG-GUID: IM8cyW8FaYR3ecBnSi9N_unofna0xgA2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMyBTYWx0ZWRfX5hJqQN19mNTV
 Ajse3p6QvZnmgeqYUHPlgVCw3Juzs61cGuLSi9t5ojfIZuuAC5w3M0iCKy1u4AFiU+l9T+VjpHe
 Bz1FrZjp5phYDvo6yOFi4c7RRG2Ygjo=
X-Authority-Analysis: v=2.4 cv=ZYMt8MVA c=1 sm=1 tr=0 ts=6a6c3041 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=RcfcxWoR8-GxkwPa3McA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IM8cyW8FaYR3ecBnSi9N_unofna0xgA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310033



On 7/27/2026 8:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unprotected read of `tmd->cur_state` during QMI reconnect can cause the remote mitigation state to permanently desynchronize from the thermal core.
> - [Medium] Data race on `tmd->max_state` between the QMI worker and thermal core callbacks.

This looks false positive, as max state is not going to change with same 
firmware.

> --
> 
> --- Patch [2]: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 8a125ac63b99f7508e9f1e7c025b0c0da679cac6
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..555f2aff1ac0f
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
> 
> [ ... ]
> 
>> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +	int ret;
>> +
>> +	if (state > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	/* cur_state is protected by thermal core's cdev->lock */
>> +	if (tmd->cur_state == state)
>> +		return 0;
>> +
>> +	ret = qmi_tmd_send_state_request(tmd, state);
>> +	if (!ret)
>> +		tmd->cur_state = state;
> 
> [Severity: High]
> Can the remote mitigation state permanently desynchronize from the thermal
> core here?
> 
> If a remote QMI subsystem restarts, it triggers qmi_tmd_svc_arrive() and
> qmi_tmd_register(). Concurrently, the thermal core might update the cooling
> state via qmi_tmd_set_cur_state().
> 
> In qmi_tmd_set_cur_state(), the request is sent first, and tmd->cur_state is
> updated afterwards without holding qmi_tmd_cli->mutex. This creates a window
> where the state has been updated on the remote device, but tmd->cur_state
> does not yet reflect the new state.
> 
> Could the following sequence occur?
> 
> CPU A (thermal core)
> qmi_tmd_set_cur_state()
>      qmi_tmd_send_state_request()
>          // acquires and releases mutex, sends new state
>      <preempted before updating tmd->cur_state>
> 
> CPU B (reconnect work)
> qmi_tmd_register()
>      reads tmd->cur_state (which is still the old state)
>      qmi_tmd_send_state_request()
>          // acquires mutex, sends old state
> 
> CPU A (resumes)
>      tmd->cur_state = state;
> 
> If this happens, the remote device would be left running with the old state,
> while the local thermal core tracks the new state. Should tmd->cur_state be
> read and updated under the protection of a lock?
> 
>> +
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>> +			    const char *label, u8 max_state)
>> +{
>> +	struct device *dev = qmi_tmd_cli->dev;
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!strncasecmp(tmd->name, label,
>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>> +			goto found;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
> 
> [Severity: Medium]
> Could this write to tmd->max_state cause a data race?
> 
> This assignment in qmi_tmd_register() is executed from a workqueue when
> the QMI service arrives, but it does not hold a lock. Concurrently, the
> thermal core can invoke qmi_tmd_get_max_state() or qmi_tmd_set_cur_state(),
> which both read tmd->max_state without holding shared locks.
> 
> While tearing might be unlikely on most architectures, could this
> unsynchronized read and write trigger KCSAN warnings or lead to undefined
> behavior?
> 
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
> 

