Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37433067C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395522; cv=none; b=QhHbP+OUnjetrS5/IiWS/znUOtkt6MgYUwvTmWGxWQ4hk64BwZl+FOyxtnp8ChUCpFQBoFUOXwCzaIzH4DnKY+1IkuncRTMFiIoZHjLlQD4czz39B3Gj3nn3bNAL9uSRfx2QkzePLq+E2/jxBgsiiOfU1xi5+gPhTyfo/NToiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395522; c=relaxed/simple;
	bh=Bjxr+4mfKTQzWGBzmLxiJd+H8nda57/CH5sqXEPImo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPoeE8cWFPh+mGcJ1arNOeWzlfa1ZeR7egneNMgPwBM0IjMvRM+ZkOUSrDc0hPrZzQ1716bjkSQxd/XjKH4keHXP/8F+6DmXvO5oAF2RrOx2B6R52FmrF15kLyhP2Usiil1is0dtftKSLUz/6D0ECA8CGNSfMdchY1VZ2M4JDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSdXcfZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtazJE/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSdXcfZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtazJE/6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9judt1753949
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=; b=iSdXcfZSDFD2be2h
	iMMUbAdJmmX/s6eyJMSydPk1SPRfiKaEUnzg3NRZ1BSIuMCDEzygBekLjEsQccT5
	DXBizfBXRwqseRLWIZ4e0gP7KvlbV5w5G/lZsxflggoRbGBY9ssWeDx+J9AxU1Tw
	F0V98jT6qs6iNkNKXCnlrrv6JtJLdjRPRznhjj6A3WzuaGST2C2WGQNig86JOngu
	SZ3+dzFOQhD5j7LpNsPylnj7n5JCn9JdDZktzl7tRtK1mBdS3ra0esxJBjmxwAu9
	ZqaWSrogYwiIZhqa0awkSTPHOv24Tkx2wxLX0XKFjPSQQZAerWJ3IfTFS+YokSIQ
	ftHgVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q23b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:51:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1487448a12.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782395519; x=1783000319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=;
        b=BtazJE/6Xxrj2Kryu9vdwmv/TnIb/Stg2TbK1WbjzzUVFJWkolUyQ9UtitGa/UoJSw
         o3a/86Hzj+/Qifk4uebAINF+znMeD8OK/Zga45hQ2HQ+293JL5BFI+Jc9A0bkFN/SpML
         0Jg5HiyddainlQFA7pZSKyG+vDr7L5PV++UTomtvAPdEowJ3/HanejHPD2fbXsMnaed6
         bMZMzio+DK0WCp3tTTZStMPHvNV1BRB4RBemfBPHRcl9s2+7U0jZ8GjR/YtOHqeBMFVj
         WyBXRPIh+rJa0vJ+DaFmYI+5knqQmD9DuD4IrWWOnUM22l0rCf1y3YJSPcqkYOEtpT5O
         seMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395519; x=1783000319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=;
        b=i9qrlfuDJ2IjePMCZ6nOElPIwAugV2Oy6GcrzDrD9leNt7eNElbnWUuLiPCkS2oCym
         Pnbrdfok6lo06C1VmPQziDokg4n/npxWKJzhn23zJVdD0expEVsoCsRErG/CNNCY8FFR
         KCVWGRtd8g/w26eBAaJeZhjOpar6/i7DY6I7bbngznQNjojnYv/BRyffuyhQ5t8HFyDL
         ojvaL0Xe8hzcuhd/aigA+qCQxcQ7tqV1B9AHZElfOzRJf+5dYGY0FCEAJNko+nP4zfJX
         9uX7rCmaV60B8bwUQfJe6sO5z9mPXNVFwrmg2UgG8CVsIkrwKIramNZh4OwkUpKS3Zon
         Zpgw==
X-Forwarded-Encrypted: i=1; AFNElJ+cRKuAu8AwvjeHAHyns+YqgHdTPSkHDI3QcvKb4Up1GDCtI/I/XQiz+HcWNryKwuxu7ggmunIbl5JQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoHVFSlOR3RdWLJzZS2yVCrzZw/UCxNViyC2VG2ITpF/pZ4i9
	ww99HdhQ6GoFMLif82HKffrGY6Lfc1vgBMgr78VIvgIgMZeesI+x1tI8a1yMZA17UWuidtBGQnt
	tjBULZHw7EFpZUVF8LD9HzmV1K0k+y/l6VKgMb6OBnXNADala1f21g77cBRAXMCOK
X-Gm-Gg: AfdE7cn85FWN2YuQkd/uQCKI3lpnFeyC8mhChxmcbSzDHRBZurd8quu5B3BIdgJHBPj
	CnoDym18O4TuMdFPY84BDo/J0Szle9cS8ayXTo9dVWlr5KXzjF5C982dwbijw2t/HPEfa4m4XVU
	CgUHsUdXpcepE83OwhSPgbQROXK7FIzWDLN3ThBylhrdpw3CqNk43aJ1v9IxEdYnnccwkcQqDsb
	/DxsH/RuLSDPzuNYKg9V+iHY5gDUA6PRy8trmYtQtduml8dZ5sYRz90XjpUramGXFSz2pVsHqn9
	qoBiH3fUyCjlzquopP4m6HHkq/GAT7PybXQO2MV/OP27ZyslyL+iW1cUqlkPIiSt4q164oZWzQ7
	5mpWEkCm9DkKF5RpjaqBIr3aPEBQIDlb/J+mqtXneJZPHJ5VHFdZGMCsTElLsIi9ZWqsLPYnz3U
	g=
X-Received: by 2002:a05:6a20:918c:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3bd4af58807mr3210542637.12.1782395518557;
        Thu, 25 Jun 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:918c:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3bd4af58807mr3210506637.12.1782395517927;
        Thu, 25 Jun 2026 06:51:57 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcb9c14asm1706128a12.24.2026.06.25.06.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:51:57 -0700 (PDT)
Message-ID: <36cb9fa9-2527-4e24-8c4b-dd3d57c0df27@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 21:51:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-6-8fbbf22e8381@oss.qualcomm.com>
 <20260625110924.BA8EA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625110924.BA8EA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rDYbJtLMQ_o_wWzZwzoscAWDIEFJ13X6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfX92vy01J3YSNK
 EuQNEjlRRNT09AzFjwFriK2CcnlOOcYZgLesrgQKEG+50Sh5fBJsZcUAk+TKmVSTfFh/h83HhoQ
 3rLWdjjpipan7wbqFAHT2LpnbF98u7A=
X-Proofpoint-GUID: rDYbJtLMQ_o_wWzZwzoscAWDIEFJ13X6
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d327f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mtuFwQZHmCstQ3Yjy2oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfX08AyM2WN/5vM
 n+lOtDDbGPkDalW4DbSm82eKTQpOXriIFcA1vn0xzZylBmBC/E2oJ36yW1kLXcVyx01IfsC2xXw
 +UIfRjIPyus4cA+y6QbXNZuYyE7GVup8mxMw10yboWySZB7VBAsEIGRIDmySGJMHpILUVXjQ8NV
 K7vZlY/tWlcqjy1jg7xrjtH3mt3YIeUhMLC6YC4wfYip4FmiE1d6owH/bNkC0WNe3E9nyk3VXBv
 eN4A+WUYZM6Goub0huOYiD/e0YqBciayom1+i+nOy69khdgG+X7E6f07ZwCp1nMFF/gX73TcGeq
 nr/y23z79VKlm1IXrR1O8OSd8jQnEtrRFVLvnKfOOa33NWRLF0IT4acikeqtjD71vhB6RhhM6m6
 i5UFBlvab1hAvXxuQAchLOfSCPjExvSsH3S6v8KPxobFCcVe8DUV5bA1nfEV9v7VramkP6eeW9u
 AfXmDyOcZrgJV/BRPHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250119



On 6/25/2026 7:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [Critical] Global function pointer accessed locklessly leads to Use-After-Free on driver unload
> - [Critical] Global sysfs ops pointer triggers NULL pointer dereference on ETR without CTCU
> - [High] Driver remove/unbind blocks indefinitely waiting for userspace file closure
> - [High] ctcu_byte_cntr_stop() skips setting enable=false for SYSFS mode, causing infinite read hangs
> - [High] TOCTOU race re-enables ETR hardware after framework disables it
> - [High] Missing wake_up() in error path deadlocks driver remove()
> - [High] Unsynchronized checks of irq_enabled lead to resource leaks and driver unbind hangs
> - [High] Data race on concurrent read() calls causes NULL pointer dereference
> - [Medium] Spurious Interrupt Handling due to missing hardware status check in shared IRQ
> - [Medium] Error codes (-ERESTARTSYS) from byte_cntr_ops are swallowed and convert to EOF
> - [Medium] Masked error code breaks sysfs reading fallback on memory failure
> --
> 
> commit 128ffef0065b7b8a8c73e5e3f9b0ce8bebea0593
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: ctcu: enable byte-cntr for TMC ETR devices
> 
> This patch introduces the byte-cntr function provided by the CTCU device to
> transfer data from the ETR buffer to userspace. It sets up an interrupt
> handler to track data size thresholds and switches buffers when full or on
> timeout. It also integrates with the TMC ETR framework via sysfs ops.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 0000000000000..5ab97a71f02f6
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> [ ... ]
>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>> +{
>> +	struct ctcu_byte_cntr *byte_cntr_data = data;
>> +
>> +	atomic_inc(&byte_cntr_data->irq_cnt);
>> +	wake_up(&byte_cntr_data->wq);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> [Severity: Medium]
> Is this handler missing a hardware status check?
> 
> Since the IRQ is registered with IRQF_SHARED, another device sharing the line
> could fire an interrupt. By unconditionally returning IRQ_HANDLED without
> verifying the interrupt source, the kernel's spurious interrupt detection
> might be suppressed, and the CTCU buffer switch logic could be triggered
> prematurely.

Although the driver requests the interrupt with IRQF_SHARED, the 
underlying hardware/DT topology provides a dedicated IRQ line on 
supported platforms. So, no other interrupt sources are present, and the 
handler can safely treat all interrupts as CTCU byte-cntr events.

> 
> [ ... ]
>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
>> +						 struct coresight_device *etr)
>> +{
>> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(ctcu->dev.parent);
> 
> [Severity: Critical]
> Could this dereference a NULL pointer if an ETR without a connected CTCU
> is used?
> 
> If the system has multiple ETRs and one lacks a CTCU, the globally registered
> byte_cntr_sysfs_ops might pass a NULL ctcu pointer here. This would cause a
> panic when ctcu->dev.parent is accessed.

This scenario assumes an invalid hardware topology. Byte-cntr 
functionality is only applicable when an ETR is connected to a CTCU via 
the CoreSight graph. tmc_etr_get_ctcu_device() discovers the CTCU using 
this hardware/DT linkage. In the absence of such a connection, no 
byte-byte path exists. Supported platforms guarantee this connection for 
byte-cntr capable ETRs; therefore, the reported NULL-CTCU case is 
outside valid configurations.

> 
> [ ... ]
>> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
>> +					 struct ctcu_byte_cntr *byte_cntr_data)
>> +{
> [ ... ]
>> +	raw_spin_unlock_irqrestore(&etr_drvdata->spinlock, flags);
>> +
>> +	/* Restart the ETR once a free buffer is available */
>> +	if (found_free_buf &&
>> +	    coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
>> +		tmc_etr_enable_disable_hw(etr_drvdata, true);
>> +
>> +	return found_free_buf;
>> +}
> 
> [Severity: High]
> Does this lockless check introduce a race condition?
> 
> If a concurrent operation disables the trace session and drops the lock before
> setting the mode to CS_MODE_DISABLED, this code might incorrectly re-enable
> the hardware after the framework has explicitly disabled it.
> 

Disabling the trace session implies that the ETR is already disabled in 
the byte-cntr read flow, in which case the switch-buffer function cannot 
be entered.
The only possible scenario is that ETR becomes disabled in the middle of 
a buffer switch operation. However, the code explicitly checks the 
CoreSight mode (CS_MODE) before re-enabling ETR, ensuring that it is 
only re-enabled when appropriate.

The byte-cntr read path drains the ping-pong buffers regardless of 
whether the ETR is enabled or disabled.

> [ ... ]
>> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
>> +				      size_t len, char **bufpp)
>> +{
> [ ... ]
>> +	pos = byte_cntr_data->buf_node->pos;
>> +	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
>> +	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
>> +	if (actual <= 0) {
>> +		/* Reset buf_node upon reading is finished or failed */
>> +		byte_cntr_data->buf_node->reading = false;
>> +		byte_cntr_data->buf_node = NULL;
> 
> [Severity: High]
> Can concurrent read operations cause a NULL pointer dereference here?
> 
> If two threads read from the same ETR file descriptor, they could concurrently
> access and modify byte_cntr_data->buf_node without serialization, causing one
> thread to clear the pointer while the other is still using it.
> 

Byte-cntr supports a single active read session. This is enforced via 
byte_cntr_data->reading in tmc_read_prepare_byte_cntr(), with concurrent 
open attempts returning -EBUSY. The buf_node is exclusively owned by 
this session and cleared during unprepare. The reported race assumes 
unsupported concurrent consumption of the same session.

> [ ... ]
>> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int ret = 0;
>> +
>> +	/* byte-cntr is operating with SYSFS mode being enabled only */
>> +	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
>> +		return -EINVAL;
>> +
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
>> +		return -EINVAL;
>> +
>> +	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> 
> [Severity: High]
> Does checking irq_enabled outside the spinlock create a race?
> 
> A concurrent sysfs write could set irq_enabled to 0 immediately before the
> lock is acquired. If reading is then set to true, read_unprepare() will later
> abort early upon seeing irq_enabled is 0. This would leak the buffer list and
> leave reading permanently true, causing the driver unbind to hang forever.
> 

irq_enabled serves as a configuration gate prior to starting byte-cntr 
and is not a runtime control for active sessions. Once prepare succeeds, 
operation is governed by enable, reading, hardware registers, 
waitqueue/timeout, and buffer state. Sysfs prevents modification after 
reading is set, and toggling irq_enabled during an active session is not 
a supported use case.

> [ ... ]
>> +	byte_cntr_data->reading = true;
>> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +	/* Setup an available etr_buf_list for byte-cntr */
>> +	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
>> +	if (ret) {
>> +		byte_cntr_data->reading = false;
>> +		return ret;
>> +	}
> 
> [Severity: High]
> Is this error path missing a wake_up() call?
> 
> If this allocation fails, the reading flag is cleared, but concurrent readers
> waiting in the driver's remove function won't be notified, potentially
> deadlocking the unbind process.
> 

No wakeup is required in this case. Allocation failure occurs before 
establishing any byte-cntr read session. The prepare function returns 
failure to TMC open, meaning no reader exists. wake_up() is only 
necessary for active sessions that need to be terminated or completed, 
not for failed prepare paths.

> [ ... ]
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +		return;
> 
> [Severity: High]
> Should the enable flag be cleared for SYSFS mode here?
> 
> By returning early, enable remains true. Readers waiting in
> tmc_byte_cntr_get_data() might never receive the EOF condition when the
> trace is stopped, causing them to loop indefinitely.
> 

The early return is intentional. In SYSFS mode, ETR remains enabled and 
byte-cntr may actively serve the read path. Forcing enable=false in this 
state would prematurely terminate the read session and disrupt trace 
transfer. The enable=false transition is reserved for teardown paths 
(e.g., CTCU removal or non-SYSFS disable).

>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index e8720026c9e3f..2da1a6f3d29f4 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> [ ... ]
>> +static void ctcu_platform_remove(struct platform_device *pdev)
>> +{
>> +	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int i;
>> +
>> +	if (WARN_ON(!drvdata))
>> +		return;
>> +
>> +	/*
>> +	 * Signal all active byte-cntr readers to exit, then wait for them to
>> +	 * finish before resetting the ops pointer and freeing driver data.
>> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
>> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
>> +	 */
>> +	for (i = 0; i < ETR_MAX_NUM; i++) {
>> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
>> +		/* Set enable=false for all ports to signal teardown to racing readers */
>> +		byte_cntr_data->enable = false;
>> +		if (!byte_cntr_data->reading) {
>> +			raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +			continue;
>> +		}
>> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +		wake_up_all(&byte_cntr_data->wq);
>> +		wait_event(byte_cntr_data->wq, !byte_cntr_data->reading);
>> +	}
> 
> [Severity: High]
> Could this wait indefinitely during driver remove?
> 
> The reading flag is only cleared when the userspace file is closed. A
> userspace process leaving the file descriptor open could permanently block
> module unload or device unbind.

This behavior is expected and not a driver defect. During removal, 
ctcu_platform_remove() sets enable=false and wakes byte-cntr readers, 
releasing blocked reads from the wait queue. Any remaining wait 
corresponds to userspace retaining open TMC file descriptors. The kernel 
cannot forcibly close user file descriptors without violating lifetime 
rules; thus, waiting ensures that CTCU state is not freed while still 
potentially referenced.

> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 2b26ce6455a7b..e78f8891f11e0 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> [ ... ]
>> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>> +				loff_t pos, size_t len, char **bufpp)
>> +{
>> +	ssize_t ret;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
>> +		/* Return the filled buffer */
>> +		if (ret > 0 || ret == -ENOMEM)
>> +			return ret;
>> +	}
>> +
>> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>> +}
> 
> [Severity: Medium]
> Does this silently swallow -ERESTARTSYS?
> 
> If a signal interrupts the wait inside tmc_byte_cntr_get_data(), it returns
> -ERESTARTSYS, which falls through here to a normal sysfs buffer read. This
> might convert the signal into an EOF or return unsynced data instead of
> letting userspace handle the signal cleanly.
> 

This is intentional. Byte-cntr operates as an optimized read path 
layered over the existing TMC sysfs read. If byte-cntr does not yield 
valid data, the implementation falls back to the generic TMC path. As 
such, propagating -ERESTARTSYS to userspace is unnecessary; it simply 
results in bypassing byte-cntr for that read attempt.

> [ ... ]
>> +int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>> +{
>> +	int ret = 0;
>> +	unsigned long flags;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops;
>>   
>>   	/* config types are set a boot time and never change */
>>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>>   		return -EINVAL;
>>   
>> +	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->read_prepare(drvdata);
> 
> [Severity: Critical]
> Is it safe to access this global function pointer locklessly?
> 
> If the trace file is opened and the CTCU module is concurrently unloaded, the
> memory backing byte_cntr_ops could be freed before read_prepare() executes,
> leading to a use-after-free regression.
> 

The reported use-after-free is not substantiated. byte_cntr_sysfs_ops is 
registered during CTCU probe and reset during CTCU remove. Existing 
byte-cntr readers are first signaled with enable=false, then woken and 
fully drained before the CTCU state is freed. After unregister, new 
callers observe NULL ops and fall back to the standard TMC read path. As 
such, this concern conflates global ops registration with an actual 
post-remove data/session UAF, which does not occur.

>> +		if (!ret || ret == -EBUSY)
>> +			return ret;
>> +
>> +		ret = 0;
>> +	}
> 
> [Severity: Medium]
> Why are errors like -ENOMEM from read_prepare() masked here?
> 
> If the memory allocation fails inside tmc_read_prepare_byte_cntr(), hiding the
> error breaks the fallback sysfs reading path, leading to delays and hanging
> operations instead of propagating the failure properly.

This is an intential fallback design. Byte-cntr is an optional 
enhancement to the generic TMC ETR sysfs read path. When prepare fails 
for reasons other than an active session (-EBUSY), the driver falls back 
to the generic read-prepare path. Masking non--EBUSY errors is therefore 
intentional and not indicative of a defect.

Thanks,
Jie

> 

