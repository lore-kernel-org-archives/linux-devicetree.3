Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364E033C536
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 23:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444180; cv=none; b=DbBweyMGb5M8jIypWce6tfpzYaNIME4MweN3bLPRmHNbD8WulX0gScp5zEFGycWPa3RRf6hy9rCzTqLVLUIpLiAKCDxTifQ8Dg6GxViF1acsWnKK2f8zVEZLyQ1Gf17iPfkyttMUiqP2cU7MbXxeyJpNSTnFqXxJuIUyp1iohCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444180; c=relaxed/simple;
	bh=PP4Ab7q7bBhZBforAUmhfQA46fPz+szxQvwSCoQNmMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUGoxRVnoDO20H1r+YKq5qXNeLwyT3yHXwHTu2xpG8z4FxDecO7zyqbrEOij6WWgmUhes2Vb3YyjyDjAVYQy09TQ2KTIi2ASwgLdR9rJAMqfYqGtGnaoJySzjLqLsrX9ipVp25x9JDPR486fsUch3sqEcFPXUdFngGWXggxWV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poLfBzV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kwn6S8dH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poLfBzV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kwn6S8dH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652HfacL2692117
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 23:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=; b=poLfBzV04IZsVhrS
	XamRq4LLahGtNtLNrLxWrtzRuKPZ4wfGUlX/rVsO4OS4EuJcpMl3g4D9RiVGOfiB
	AlgfRN8E1o5AbtV6DEj1Ij0CrB7y/H8qm4NY5DkbrMPv75Za3TBHai9Sk4bOY/ug
	cx7uhFOZXXEy/bVyIl1gwQCcTgCoSDsfIv4/S3jno/UEgbqxZHyfs97AkVC1+sW+
	5jg8135YlYGFvRYHsfhDBq9xdPpw1eOZffcSxEoWXJLyINmjl9Gu0UKYvJd2L6BZ
	Y7KYPpr54Np5IbVUredYU75TLr9DdWVkkbUREId8uNkc6oIGl+kB/iqAycQp+IAq
	LcFDRQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqummq8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 23:49:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304e4636205so14205996eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780444177; x=1781048977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=Kwn6S8dHe2u24yHZp5rX7gD4lHVGQdkDI3P3eDMkR/nItaBRe5yQ+M4F6BTyzUOp6r
         w75GHTUszVRuAcSydgcBAFzy8zc05L6nXB52wI7M4wtZ/eyEKj1He+Aru01YF+/virXp
         BqZpz1plzguZS+CukDqscVz/yiaOSXGZh+QzE8cGgZr+Xs5XcMtJZNtF6OdsUhNu1vDZ
         exmhWFU9a34KInccVfYyGWxtTZ3SJjqZOxF3hbeQR8rkO44YsyTPyl0UJvLnhNgHO9Xa
         wrCJv7GvCBnAZaeyojsLvJl1cX2RfRlk900AcZcVkSHvPM3ujQZLJp6kv2MuXdmKppFq
         FAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780444177; x=1781048977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=nHV1xW8Ip80wt/VOhg9S6bLt2eKc6BpLsP5OShUnfAEP+OGM+Pvm0fXTSdPhObcQwQ
         Rg3LDU1I0qvKyO20Bv9c+GG0KjmF9o636WXdNuzH5vFPby5h3ahuemUyUQPm8c0+uExO
         EyYoZdOU7WTxf2MklMYggx/imw5Q/aBSuuJ9f0VfTUWnvuoWDjYZ4m7Z7MSJD7Ujy3RY
         1nrRAnBJNZDpGq+xe6A5aKncH1PYgn1I+kDF8FxeaTv50q+ZU2qkWZckiZ4wf9yoTq7d
         tbjl9wvtw2t4kOi+3vJ7pQy8p95QIH/soaiYhwcKgU6PnoPqhDPe9J427em9S42oTIkw
         WB9A==
X-Forwarded-Encrypted: i=1; AFNElJ/TETrRbDuwftTG8VAyHovhiZgERnzjoPBQ0FYPjhEA76PmYmZfiBhmNIEMbAYDVed04gFCPWuWbyaz@vger.kernel.org
X-Gm-Message-State: AOJu0YyzEBZZ+y/c6n7voKupKJbIWtpC5Jl/R934smWIvix+TletIqQN
	OmysjMT0uqjKUpcZO8fUPmIywZLKgbvr39f3iCrgjcFze17EwvEPBLaz9RC29/wq+/kQtj5DQUa
	HC/vWIFTcJM0yBZ8kB1W0uwi9d1EpA24PVjLUKT7XwtMXQkPdcbEmDJds8KLZJKBj
X-Gm-Gg: Acq92OH3u89qAhh7nQUdhBEhxcRj9JE0SqnFh6td2o2RF6JzujSCv8qCuy2w11MZvIu
	g202CtbsB1HmsUkyOpFn0/D1WUq5IpBsBnJqqUkT9MGhtHRa6oVfF+HSJcQEmZeFJrUDjLus8dF
	Ztws3A4FqlsjG2slQuL8bP93wB4NyqtuiXZmsIjwvwRYB4+MXksCctH19VtxOjSIR3rrcdjWgWh
	E0h0MOqdYunU8varYw0lzrn/zGySznP7sliBhJr6NbUyogQtfVfK+zAhhpcrVT8OKnRZtxf4ndU
	QVhK1vZn6TmjDy43Ti01QyiXGsQSp55U/KzubGAO4hDNcKujDhCJ12oLMCMpH5ag1VDFfN3C5DD
	wskcFiDswmROMqy4xSPu4ySEdxf4eZYszu8qD9jzTadvkhqiC3Q2s7Bw5lt6dvhkduKiug9DSIv
	wnCu2sWK1BV6k=
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580438eec.34.1780444176620;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580416eec.34.1780444176064;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm1153763eec.13.2026.06.02.16.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 16:49:35 -0700 (PDT)
Message-ID: <cabea216-23ad-48dd-aa75-47c9708afdbf@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:49:34 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] media: qcom: camss: vfe: Add support for VFE gen4
To: sashiko-reviews@lists.linux.dev,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260601-kaanapali-camss-v14-5-e76f26aa6691@oss.qualcomm.com>
 <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIzMiBTYWx0ZWRfX52OHeDzlxsdA
 r/KJ6DgY6nw+TwsEfWbCwIM68hk5bxZ2SW77a+IpvPKyuKYlWuAVZf22FzvpeMXStt7IF6n590F
 ETWuntBzyboQxDRWH/B2WpNv7EYQS52x9sACWEPaX9SWVuasFN0sHNCeQChWTgkgpz2ujXYVSmX
 7ObFxYmfiR703YSqAlYwtP7uHjgwqI2HpJIY2jDg/8ElQXvUfcqg0mJiBDtKOPlrzsaSgeAD1TE
 1JNFmashZ0EBTCBYS/11cB065q+36j760uD98UAn+8CMxxPlIikHLbBB6IB94PURa4t/tJXcxUN
 1gza+O442gYlXTKuX829vTUmnouzeSysV3MzrDEp00IqnASgszDLuNnqYWQMpkst7beC9gxVmKF
 qtSUxVGzfrAGeICwWZz1FmbdLLzX8ignS0iH2rzxlF/wrXqPDlNNjk3fb2kBG+tcX94np0vPD8G
 TBEq4CdtQlykgJvgedA==
X-Proofpoint-ORIG-GUID: WI01eOuJiKdT5nNUdwLZnI16S8VLcQBh
X-Proofpoint-GUID: WI01eOuJiKdT5nNUdwLZnI16S8VLcQBh
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1f6c11 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NFO_ntjReJqzzR5GOAAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020232



On 6/1/2026 9:44 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional issue of `CAMSS_INIT_BUF_COUNT` AUP_UPDATEs in CSID stream configuration violates the Kaanapali hardware constraint, mismatching the actual number of enqueued VFE buffers.
> 
> Pre-existing issues:
> - [High] Cross-linked VFE and CSID pipelines will write `reg_update` commands to the wrong CSID instance.
> - [High] Concurrent read-modify-write of `csid->aup_update` and `csid->rup_update` across process and interrupt contexts without synchronization.
> --
> 
> commit 961118b5c346fbca24b27d8e33cf75e4120aa72e
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: vfe: Add support for VFE gen4
> 
> Add Video Front End (VFE) version gen4 as found on the Kaanapali SoC.
> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> new file mode 100644
>> index 0000000000000..d73d70898710a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> [ ... ]
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but cross-linked VFE and CSID
> pipelines will write reg_update commands to the wrong CSID instance.
> 
> When this callback executes to commit buffer addresses during runtime, it
> passes vfe->id as the hw_id to camss_reg_update(). In camss_reg_update(), this
> hw_id is used to index into the CSID array:
> 
>      csid = &camss->csid[hw_id];
>      csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> 
> If the media graph cross-links a CSID source pad to a mismatched VFE sink pad
> (e.g., CSID 0 to VFE 1), the register update is erroneously dispatched to
> CSID 1. Could this starve the active CSID of necessary buffer updates and
> trigger an unclocked register access (and panic) if CSID 1 is powered off?
> 
> [Severity: High]
> This is a pre-existing issue, but there appears to be a data race when updating
> the CSID register bitmasks across process and interrupt contexts.
> 
> When userspace queues a buffer during an active stream, vfe_queue_buffer_v2()
> runs in process context and delegates to __csid_aup_update() via this
> reg_update callback. In __csid_aup_update(), a read-modify-write operation
> is performed:
> 
>      csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> 
> Concurrently, a hardware interrupt can fire on another CPU, executing
> csid_isr() in hardirq context. This delegates to __csid_aup_rup_clear() which
> modifies the exact same bitmask:
> 
>      csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> 
> Because neither context acquires a shared lock to protect csid->aup_update,
> can this data race silently corrupt the bitmask and cause hardware commands to
> be dropped or repeatedly dispatched?
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884..826ab85a44a14 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> [ ... ]
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
> 
> [Severity: High]
> The commit message documents a Kaanapali hardware constraint: "the number of
> AUP_UPDATEs should match the number of buffers enqueued to the write master
> while it's being enabled."
> 
> Here in vfe_enable_output_v2(), active_num is accurately populated based on
> available buffers, but since reg_update_after_csid_config is true, the register
> update is deferred to the CSID.
> 
> However, csid_configure_stream() unconditionally loops CAMSS_INIT_BUF_COUNT
> times:
> 
> for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>      __csid_aup_update(csid, i);
> 
> If userspace queues fewer than CAMSS_INIT_BUF_COUNT buffers (since
> min_queued_buffers defaults to 0), this unconditional loop will violate the
> hardware constraint. Does this mismatch instruct the hardware to ingest more
> frames than there are configured buffer addresses, potentially causing the
> hardware to process uninitialized memory or trigger IOMMU faults?
This seems to be the only issue that is specific to this series here. To 
answer this, we verified it and confirmed with the HW team as well that 
it is not possible for the hardware to use random address to write data 
to the memory just because an extra AUP is issued. It only takes effect 
after the ADDR update is issued.

Thanks,
Vijay.>

