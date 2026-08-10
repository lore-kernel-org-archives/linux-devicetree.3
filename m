Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E83B42E3
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356316; cv=none; b=TZfrZyCUWy6zNJsKCf4mjtTpss8z7pM/80u1Ygzh8L9PE4d3Q4wXUNDRP39SNxXpx5lu6OdLarvSiO9aOfAkR4WSQ/s5O4zAdqEEZOl7KExgMi/lclRH0Mo38v3M8F8v0+MXC0syFO40oana7WG4EiRr8neNN7NWCpLMJDv9Qf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356316; c=relaxed/simple;
	bh=DFi+ri03epm28418q14ZXL2wY0hty5cLrFHsP7u0bIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVwa7mPEVvOpL1nncuOejX+mp31lCXs/X9D3q7+3BPh0Nfj+9HuChuyPsrxiWLNRfCCAnVnsu14hT6Aw5gw0/TJgHtXm6ZwjFzE6EUumEjVEfp9yOwNtM73wxQDdi7UIqTBx+4sHusKraNMsfPRmN/Ir/rw15NyKnBuQmNRZjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Wr8u0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWcRWCCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Wr8u0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWcRWCCm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S3NY1232013
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=; b=a3Wr8u0Tv76080z6
	hMN780aTImC+UEPQaH5EvG3gPBindWAAzBoZ1MFYpLjkyrnStQd8sM58vVeuzbX7
	JqqDeklT0y8rOO/oNGyrmf34tox++4EfH03YA+aps9JFLfWxzGObAlXPqR1SQ52Q
	Celqo7XVKnTrT2Mwa3ML2cEtV0xQkGg3N4+VFieXrDcNQGuRmdo9hegNgvD0FHfy
	a9BbWCoOw+YVto8HcIeIlv03+6D4KPfRC8aJY7daUj1vaaf7z1LRUPotZpgjcLoN
	pAS62VggxQwC3fLOjEUd73Xxsofo4IIcNvUljf3SH6FQZ2BE1ZmmYC+WlQDC5L/5
	Wbha8Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh58av3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:05:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2265252a91.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786356312; x=1786961112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=;
        b=TWcRWCCm34n+99f6K3CSpOewfmAVj/mRUscdT9i2GFESRgR1OJEu3g6QN27KL0jq3C
         VRlCWL5uUwQIZKU/uqP/knTxRuWAbghX0zJQdAu0ybRgkfHFbt/bdvhiQC9x9AsqtHCH
         XeebM1HAPNQUj10G5vQySjuzB6ZtG8KrKYpjwW4YgnAEvyL5+Yrb2v3xGGTEpO2YxEUp
         fn1kUvCVAtHW33k/Tu/CS5wdzKYohE2XmhCmasBYYZeIhsNFcAIka0GSI5BaotUHPZRI
         fObOjw48p30cDJ4ZlkijNhDUdXbxdRNlMBxfM7tXAWBcfllNgfZqxXloGDvCBUEz0YhE
         2xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356312; x=1786961112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=;
        b=YJst+eObosxvGsf1fC49CinEyT+vfI050Qf6HJC0a0P3QlYq69OWKRKpy4acXcYP2f
         VtUwGPCmDkYSFzWTMgVlxGEA4TjyhVTj6IfKXuvKqeEe+g2fdMYXwthDu7YbTUckiv71
         hXaikPF0RfkHCxWRZOFG3JFGc8oYdnmh75iVIyCq9fb0WX0um9wsd2hiybMq8OJe3vxI
         bdfyF5t+RIzWQZWDOuKlKaYSDbGr9FgRkkA2nAVvaLrND/R6xRTMuAcRsyROeyN+tDnT
         F76e8x2QaaWXUvmEE221Rq69FZ17W+DTiJ1RwLe8LAzBGr5undBKRt2Q+AR2iKAq3Ul1
         2sMw==
X-Gm-Message-State: AOJu0YzKSVB60lRu3dXpk9hdDAd+huWM05Jx3kC5OQZiibGmi+poa1pO
	cCWvxhjG1Fe9tcyyS6NKRW8Ic/TF09oBhG1BKOFEPPABqo3+OuT2v1Xq5PCS/PoqaokcafZ/b+C
	bbWV7bo+Sol17YbvZYmzzWPlvEkRebykRvauZZYJdNe+fs4yvQABv2oDhFe2nwV32FF3QVBX/
X-Gm-Gg: AR+sD13f8QxavFpIr557/75/RK/JjKuPsRsdkIS+LyF31xBmpEyMwANfcHTw0MX521i
	e8oxPjmyqpc/qniisG0WxapP/+UdjLhQls3vrwSpPt/k5zDzGaz43OMkT8jGK57twtRyJqQWj8r
	Whk4wdEGT5XV3DFQ54/rQ9HTWikgRkEyn3i7/bmHYIiowiDXaMeTiHTk1nDUkmClLP8vk9B5IEh
	PQZ9KC0tDfik+eNunYjyVRvX9he7uChESbkKe7zU1Q1T6VzkJR5lou9oP4dA3w/nc3G5eXFPNgU
	1tnMwtEk0gRdaAXb74pbgfYHaD/MSXuMq8GGfgkTADN5cif40Z5Y9mJoDI9Ja5NSXnlK1+BQtlu
	iwt4CLAK8SyqWqvd0e3tNneQObmdCGhM=
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr108462a91.10.1786356312428;
        Mon, 10 Aug 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr108368a91.10.1786356311946;
        Mon, 10 Aug 2026 03:05:11 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff23539sm12109902a91.11.2026.08.10.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:05:11 -0700 (PDT)
Message-ID: <30afe633-5693-4b2a-98a2-8cdf9b4d4e25@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 15:35:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
 <20260809124717.E97E61F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260809124717.E97E61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79a259 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=vZhdG7kDKKyHMTukbYwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2rrIu4BkKbkFxaGpnzd_r2WOKfpVH30D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4NyBTYWx0ZWRfXyKvSjrs648C1
 74JD2WNYYYZm/eR1P4TD6HxGMjy3Sb2VyIAKDeVGJODM/fKbLPe+dYUXAOPaV/z6DQfngVMZn3V
 3jp6J7UCq94/AcQfMavlQTYtsPcecTU=
X-Proofpoint-GUID: 2rrIu4BkKbkFxaGpnzd_r2WOKfpVH30D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4NyBTYWx0ZWRfX34nZXhvbAret
 iyrpHF/WyOpX1K8DWlnphAge250mJXrH+Wqow3H61kcWKhqM8h4tPfolvW2bAy5tecu+m4ozVHm
 Lc5kBRM5r8MGjIkTELNeq+2wJRE9SNfN7iLEH9VeG5bfrNgAZMwF8Dcycc4czr55sFoXoJCyAPo
 Jt24xrOfL0dt21xIN3y0r9afRr1qgNc8nTlki67K9Prsg0Vsm1yCn6IK0iXKYklLFzI0YSmkPyC
 t2Xo7Jtl+3Z+W8TpI9ApYwJRcad+tkaT4HvEZ5SNkbQLx+RYkr+HxdZ4MZw0MUGwVVGAU+EHB8A
 +0PwurnpRHmsNdxpHqXje8CV3AeIspsmY7B6td/POgavRJpHO5cPfcjIuXY5kV69LpHJJ/MlkTy
 MLlZ38zMyCmHzhzNaPG4y53RSNRE3iZe2fH5U/bEf0HnRJpN5Iez5pF7TuAkbzYLSG3TCld3LNK
 IsQNx17K5sxhM4GiaVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100087



On 8/9/2026 6:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:

older connections issue is not flagged now. All other looks false 
positive, updated inline.

> - [Medium] Subsystem guideline violation: Mixing `goto`-based error handling with scope-based `__free()` and `scoped_guard()` declarations.

False positive. This is a Style nit, not a bug. Mixing these patterns is 
common. Scoped_guard block correctly unwinds the mutex via the 
for-loop-based macro expansion before jumping — no lock leak.

> - [Medium] Data races on `tmd->max_state` and `tmd->cur_state` violating documented thermal lock semantics during QMI server restarts.

False positive. max_state reflects a fixed firmware characteristic and 
never changes value across svc_arrive reconnects. cur_state is already 
serialized — writes go through qmi_tmd_cli->mutex and reads/writes from 
the thermal framework side go through cdev->lock — so there is no 
unprotected concurrent access.


> - [Medium] Out-of-bounds read in `qmi_tmd_register` due to unverified string null-termination from the remote QMI subsystem.

False positive. qmi_decode_string_elem() in qmi_encdec.c always writes 
buf_dst[string_len] = '\0' after decode, so string is always 
null-terminated.

> --
> 
> --- Patch [2]: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 3146a8e00a4c8c2a3c39c7e5a390154a8fbfd945
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
> [ ... ]
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
> 
> [Severity: Medium]
> If the remote processor sends a mitigation_dev_id that exactly fills the
> 33-byte array without a null terminator, will this dev_dbg() statement read
> past the end of the buffer when printing the string?
> 
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev) {
>> +		guard(mutex)(&qmi_tmd_cli->mutex);
>> +
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +	}
> 
> [Severity: Medium]
> Can this result in a data race on tmd->max_state and tmd->cur_state?
> 
> The code in qmi_tmd_get_cur_state() documents that cur_state is protected
> by the thermal core's cdev->lock. However, max_state is updated here without
> holding any lock, and the call to qmi_tmd_send_state_request() updates
> cur_state while holding only qmi_tmd_cli->mutex.
> 
> Will concurrent readers executing thermal framework callbacks see torn or
> stale values?
> 
> [ ... ]
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_dev_list_req req = { 0 };
>> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
>> +	int ret, i;
>> +	struct qmi_txn txn;
>> +
>> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
>> +	if (!resp) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		if (qmi_tmd_cli->exiting)
>> +			return;
>> +
>> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +				   tmd_get_dev_list_resp_ei, resp);
>> +		if (ret < 0)
>> +			goto out;
> 
> [Severity: Medium]
> Is it safe to mix goto error handling with __free() and scoped_guard() in
> this function?
> 
> The cleanup subsystem guidelines document that functions should either use
> goto-based cleanups or scope-based cleanups, but never mix them.
> 
> Additionally, using a goto label to escape a scoped_guard() block violates
> the expected scope lifetime, and defining variables with split
> initialization like __free(kfree) = NULL before later assignment is strongly
> discouraged.
> 

