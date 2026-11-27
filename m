Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779781;
	b=U8hRTuQy9afI0MMva0wRG/RqeRfh3ZY6d+KqH0/3IZxIMSCXuwaLLEoziBRTwE2ohxYZ
	 hG0XcAX691npTkFK6cUG58wIH2T1aH69yDMwxAzdtXH/fYA/KBinBMObi8OHcrs32YfBR
	 mIV0a7AzSAY61oKYvewBjT7eL29rwQmtIjf4TDo31Guzf6kJvGOF23lCCtgtX6ISy7ZG2
	 aCEtMf3C+ya92UM7AeufdHRz0MWGwZDJ4pkZkz11PuwAqy9lUeXli3Q3wHHQOWOex11/m
	 cr2Pr0ypfmOhTv4KFOuT8penmFMjLU3w6ZO5SdP0Xgz6ZIuWz7kgVasugyWx/1XXtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
	b=TZlK0d7QZKflzPWJ+G3IGY97bV8EFvawGdnrqXgpR1SAZ0TdcyiiXldTNMHgcK89QGTe
	 4Y1O0ZmvRFp8uBBDEN5u7mQKNpVTNQwAbqrdo7LxnXjnlSGtVTsFpo4eZIPMPb5crcOvy
	 m7Uxgg564VP2Rs/CU0o2wsPOMxanyyIOhANKnO9yg8hILjTyyv+mYS0rqs4u8pfpT9Vl4
	 ETgTmy59Jit0hPmP5iyIubRDpu+ZZdHMP8eXEmaJv6kCpqRhTgqCz2OSGURrZATzhFM6s
	 0GuHv/sdr9nHPcb4tV9aMbq5MuJzK6TgZ0OsHZLnKnQupVFxkcMLithZP1kmu3wS5aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k719Lho1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aG4WdzZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235AD606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 235AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k719Lho1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aG4WdzZk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsH7v3609889
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=; b=k719Lho1xNCncZTc
	viO8gVcw1QHA8LTk9BloXFRVAGho7FdpF6rWtSyTviBY7Zm634kFzI7SDkWRv+K2
	NlfVUPMqLMpFfAJJQ6XLQk3+SDdMm/Asc0M9l61aBoehfA1vruFgNFR4+zBxGgVq
	WGRkTEOB6O/dsoFC62plGT3AS/DdFa0vU42FGmw7vISqFQ/Z+8qjHHkz9OCKgUpE
	CFzST+VUhf0EtXibPu3+SgcuoJTRaNlABchUHIvtcI1azE0wnkuEZJfuUXK0uy+b
	eJ7REmEbgh7c55NCb5LAc+4Ncow+sGov+9h+TKzbC+Err1jKCtVGu/bV5ddG91jw
	gPkLWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9f5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:42:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b45655b428so7104480a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779779; x=1796384579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
        b=aG4WdzZkZ7O1RfXmTXQU2tnX0K+9Np75LNr3wyyMT5BhFG9ZXLDsTG7Y4Omy+h0bJ+
         qjZA/RWfY94uj6WrUM7Xado+xFEUFb/fhOqW7A4MFLepZTD4l05n+Af0DfW6wLoYNeS4
         knuWXXicnlYUSL+KRpj5d1XXjTnw3WZjWxMmko0dKPv8t/Q4bsgvuFXxE7AQKsrCtRm/
         w8Mqk55xIUYY8yrSbbagY6hOYLkPjfcfqLmdlWgNdWXwOyC1oxG5vDbnKRlM+Pg4ofJR
         JGgzvhrdRXyZ79+xLprutpOUWJTOhuHcXsJTUddpffZYNgdgJSlY2pCgm0sWiTftsgcl
         LY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779779; x=1796384579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYhHcALOI+73VxgbfGyxzlsxSQ/kvAaheVmCjSZBwZ8=;
        b=lrK40euVaJ0sL+Ve0UxgWYKSx43SnHZssx8U9d8m1Hm6DFf/ejDV0UsY7Fs3Nvo4/4
         z06meH3QJp2xBbiBmxFIzGPoPzygPr7FoNy/sO41LnUeydScJWahNU4YlQDLG+FDof5y
         MIkuYo97rUhojcv9yGAYrWmnO9+pyiqtJ//PydmUV/xd5GLNNYGH4A3H9i6GhjbYqbru
         Y3VVsJ6hcwwqP8zQeMHwoAHykZmRcCKRxt6adplcpMtvtou9xxfgiimGL5z7Dn18imLj
         VtmPOm5yYgZJtw6e6z6+h7QDWld2nNPdK0b047aQNY2Iw3DrX/7+zqBM4WXWDwPt8hMb
         wfJQ==
X-Gm-Message-State: APuU4Z+nH3rW4r9rG7CZaU+Z9nJADJL5xYctQm125PiBisBFtmPHT8hG
	k4eNwpL5xYKoQONyPpQGRuMP98fvfFetJpYJluFHQmgVohBZc9fdu8iettThPrnrVw18Qhmv+D2
	6/X3IoTvxfnFRsgwpVa+nsfVKc3pe9fx8UFCg7qfKYqMSxOEdoiOw1lf2Gu1dOSBS
X-Gm-Gg: AZFdTZfoixLtX4mKG9Uj3+ZMShroWXia4+MG36dXKegQ3xO8OqsXkOWCtTossGVdPZS
	pUMSyjsQ6CCPGyKQoFwqm9NMGWw01/+mmpiu6RgXvLciKL3rR69BV2658Hd83Gy619S2AOwOtbg
	HJQHRRrXkeFJ0Z4pwqkWSS7Ojmo6vOHOh+i9i3NUlbHLjMNoaybQWW09TnujWYjc+e/MOdeE1vi
	6wGeQZkfL8kAbK60nqJ39zaC/omiuHycFmlhca9hMjb32BBTq8KE/pU8ZkiqZugeZQ6ou4JvgV4
	QpgCvrmVrkZeHqnVhM54poOPd7WMLtgtWlkHCr5NqEW0eIERSAA6F9MlJfyG5wYP3Xutq2ErDFm
	zROiumW7ZeWr+8UoNvAr6Jug+40y87xi3SMEzNeBub8Jq6sxhDlPIXvEp83MRyFTvNf4cyC5pGV
	hp90o=
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr24690818a91.5.1795779778827;
        Fri, 27 Nov 2026 03:42:58 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr24690795a91.5.1795779778286;
        Fri, 27 Nov 2026 03:42:58 -0800 (PST)
Received: from [192.168.31.121] ([152.57.2.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm16699515a91.1.2026.11.27.03.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:42:57 -0800 (PST)
Message-ID: <39b5e2e9-36c3-4f71-9923-7065f824dadc@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:12:49 +0530
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
Subject: Re: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
 <sashiko-outbox-234955@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-234955@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX1O1zze6yiwP5
 ZsbWpiLUAqqKV38315fykQceohEHzWk/ECWe1kp7G7ydneLQDvJ9tpMP7STlpa9kVPunDAXhMzH
 +aWJZFQ/vpSfrYBCRkV7CTsu36e2ffSdERxjjbk7yb9sMzXxgyVRgZMwsd3mKNFuFbq+gtKwfTw
 8lKf9b5z4xwjM31vLQyTl/uq1i8yjeCU614GIG70WCdOnlCiKSjN/RYkJ7f6uFZjhTeNMa6JTp6
 YkWP9Cf+gmzA0RgffL0pJRzafSTx5EVEC1/Wo0D78O3vpiFX7UN9vZLxnK155aBgZtacHGiQHCr
 uVGdqVi6wYZ8/naH/Imthl4suBjzakVOBqgLW+j2GaHS9qseNe9CbZ0x/PzfXJyVXdepGdWiobY
 dXU1sWdGHSk7CnkKtua/6O85JX6SHZEqlQB+YfbsoFIOhwJD4le7QdTsUgwshzMGzz1mCV0ZhBa
 3by9TgMC6/SffJZ+BDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX7VpRaO3hXFdY
 AAa6I/HzdQb+GbVL54i5rrca3066pIOIMNdTJ/024fw+a7Zn864f5E+BshjGH1SYRU0TFy+Vkbb
 GC5rcH8f8/W57GXIQeLS9CpGjGPoySE=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b096cc3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=TrXdLD1AxJi/q6VKlMJ58Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=39Q3AyQdQ4uSGvnyTEYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: tZEN2AsXeppf7Ij_evwmNT9lp_TWgAt4
X-Proofpoint-ORIG-GUID: tZEN2AsXeppf7Ij_evwmNT9lp_TWgAt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046



On 11/26/2026 12:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] remoteproc: qcom: pas: secondary shutdown errors lost in
>   qcom_pas_stop()
> - [Medium] remoteproc: qcom: pas: firmware leak after qcom_pas_load() on
>   start error
> - [Medium] remoteproc: qcom: pas: missing decrypt shutdown poll in
>   qcom_pas_start()
> --
> 
> commit eeb577211ecb1e7bd112a3fc4d396f7f8f51017c
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters
> 
> This commit adds PAS resource parameters and the corresponding OF match
> entry for the Glymur OOBMSS subsystem, including primary and secondary
> firmware, DTB PAS IDs, and decrypt_shutdown support.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 1e55b00357c80..a0807615b0e7f 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
>>  	.early_boot = true,
>>  };
>>  
>> +static const struct qcom_pas_data glymur_oobmss_resource = {
>> +	.crash_reason_smem = 669,
>> +	.firmware_name = "oobmss_tee.mbn",
>> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
>> +	.secondary_firmware_name = "oobmss_ns.mbn",
>> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> 
> [Severity: Medium]
> Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
> pas->dtb_firmware if startup fails after qcom_pas_load() succeeds?
> 
> qcom_pas_load() requests those firmware blobs, but
> qcom_pas_release_firmware() is only called in qcom_pas_start() under the
> disable_irqs label and on successful start.  If rproc_prepare_subdevices()
> fails in rproc_start() before rproc->ops->start() is called (where cleanup
> only runs qcom_pas_unprepare()), or if qcom_q6v5_prepare() fails at the top
> of qcom_pas_start(), the three firmware objects are never released and
> pas->firmware is left non-NULL:
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
>     ...
> 	ret = qcom_q6v5_prepare(&pas->q6v5);
> 	if (ret)
> 		return ret;
>     ...
> }
> 
>> +	.pas_id = 0x42,
>> +	.dtb_pas_id = 0x43,
>> +	.secondary_pas_id = 0x44,
>> +	.secondary_dtb_pas_id = 0x45,
> 
> [Severity: Medium]
> Does qcom_pas_stop() drop shutdown errors from pas->secondary_pas_id and
> pas->secondary_dtb_pas_id when pas->pas_id shuts down cleanly?
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
>     ...
> 	if (pas->secondary_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_pas_id);
> 		if (ret && pas->decrypt_shutdown)
> 			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> 		if (ret)
> 			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> 
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> 					pas->secondary_mem_size);
> 	}
> 
> 	if (pas->secondary_dtb_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> 		if (ret)
> 			dev_err(pas->dev,
> 				"failed to shutdown secondary dtb: %d\n", ret);
> 
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> 					pas->secondary_dtb_mem_size);
> 	}
> 
> 	ret = qcom_pas_shutdown(pas->pas_id);
>     ...
> }
> 
> Unlike the pas->dtb_pas_id shutdown below it, which preserves an earlier
> error instead of overwriting ret, both secondary shutdown results are
> overwritten by qcom_pas_shutdown(pas->pas_id).  During
> rproc_boot_recovery(), rproc_stop() returning 0 lets recovery proceed to
> qcom_pas_coredump(), which maps and reads pas->secondary_mem_region while
> the secondary carveout may still be locked by PAS.
> 
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "oobmss",
>> +	.sysmon_name = "oobmss",
>> +	.ssctl_id = 0x21,
>> +	.auto_boot = true,
>> +	.early_boot = true,
>> +	.needs_tzmem = true,
>> +	.decrypt_shutdown = true,
>> +};
> 
> [Severity: Medium]
> With decrypt_shutdown enabled, do the error paths in qcom_pas_start() leave
> pas->pas_id or pas->secondary_pas_id only partially shut down?
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
>     ...
> 	if (ret == -ETIMEDOUT) {
> 		dev_err(pas->dev, "start timed out\n");
> 		qcom_pas_shutdown(pas->pas_id);
> 		goto unmap_carveout;
> 	}
>     ...
> 	if (pas->secondary_pas_id)
> 		qcom_pas_shutdown(pas->secondary_pas_id);
> unmap_secondary_carveout:
> 	if (pas->secondary_pas_id)
> 		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> 					pas->secondary_mem_size);
>     ...
> }
> 
> On platforms with decrypt_shutdown, the first qcom_pas_shutdown() call only
> initiates decryption and returns -EINVAL until shutdown completes, which is
> why qcom_pas_stop() follows up with qcom_pas_shutdown_poll_decrypt().  If
> qcom_q6v5_wait_for_start() times out, or if starting pas->dtb_pas_ctx or
> pas->pas_ctx fails after pas->secondary_pas_ctx has been authenticated and
> reset, qcom_pas_start() unmaps the carveouts and disables clocks,
> regulators, and power domains without polling
> qcom_pas_shutdown_poll_decrypt().
>

The primary timeout gap is pre-existing, the secondary unwind path
exposes the same issue. This has to be addressed separately.


-- 
Best Regards,
Anvesh

