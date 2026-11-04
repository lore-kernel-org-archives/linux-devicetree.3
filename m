Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799176;
	b=zUWQi3mKbQpQO388tQKJt7IzstANLgdYd4DhC2QrFIplRmAFI2W2nwMLAhQ6ILut6Dcs
	 FdI2zQR44v/eR/uRtDU8QY84VO33nMrFBPkYjm1hBtzkFXrJCs9DNEgGLR/UBLiow69bL
	 BXARQ23f34ragty+PvVKt8vHZCduwTUa7unpXeHpQs1ZOMPGXEyiZvpYawaHZMMT139Gz
	 n1j34vB+Jf+lTxWXK95H6KyzMDL0qjt9ms9BUF5ny8Hn3nt6iOESHUBQuOVe+v1TIerw7
	 9JvDjJEgDBDoVRyYTnGhK6F9oCyQ8RozYwx6USrR1kFhitFl9Z5V1bfkjR2i0bEVw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
	b=tDzl+WMLPEdNcWBZIBA+Hn15GsMImVfcVFn7OYZU1xs5xWEGy19Dx62elLLpw4abOXt7
	 lgTonroygwVwyCHwiQkGtPt55FHxTJu0ul2af4dlni5gFn3bKQpVSxroVFqDe+5sPY3s2
	 /cOCeHNJsAFb1XcPZhhyC7a2EjPiVItV5vDLqCe6E5uK4mcZsE6YiauZOhcdcalwXIq58
	 cqA3nR3ztBQe7bNpCUjD9xaQCtkAuCLHhUpPIvpiDWZB8IQMa10TPn0dBcBKCkRHqApIK
	 shp9Frt70oRvMOZBCbW8OF3aYulFlGyVKzGQ2/MnU8W01vMfU6yZrw+YD9tjRGWOYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKTIDrmZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TbTgmMMN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9E606D816
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE9E606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKTIDrmZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TbTgmMMN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1SOJ1764298
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=; b=mKTIDrmZLtH9mydX
	KLC6ewG44fufe9YFnXCDrl3yWVJjwADzEGhWI5oMhm3aQJfiLsbjXcmhwyzDJeR0
	NUKxYjjjUA1zXKvDYMnE4s7RMTz5vF0xfLmhkYQeYXx4oLv8ItjtBFPcahWixVmT
	U8STKmQh86DQz4vvwZEKKCsKGaK0247SntthylI+4oe6JNfv/maKEO30/9ExraZc
	p4iPsgx1HYJliUk+fRHoZH5jxDP+DhQhlUBuVzzUhu73W0e8cLpGCt1qibeOVcJ2
	cTEdDJu+1WJKXo2xTEW6qA+lFVul+9zpi5kGWkoiCfbGnQQLJ6zkO3yrW2QuDjdc
	/rKJdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn0b6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:32:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso301436eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793799174; x=1794403974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
        b=TbTgmMMNUdTf6qWzXGBPo3BL0dauBMrD610EeWGn8Gn8xeDdmkkhZUhubLnBpIl5vz
         IZNXmEMDhRriaJyWJeoJvOFRGc1lLkJtECDg1EZNfI+FdGPI6/e0jMYDl4c9iOdQ9b4j
         v8HuV3slRQh2okaBiquSsfx4pgg/aMfW7gRcKxBCx1qasvqzQqjX2O4A/pa2nTeFvgtX
         GtI3xVuz3nonYIypwjI4IR6tzOFRS0qQT0Nqx+bCKYqgW3CkMWER4Zy/YWDqeDzjvin8
         Fz47BcIONhM6NkLIFIIXvjEW+KRcrDNqBdGrbWYrzw8eODv0ohdiQt/dvimoVlxukyNZ
         krwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799174; x=1794403974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
        b=BKzHXFSIKR0zXMyhL1FgR3FGVzF771ABv5D//9ENXxfL+9Mrp3vKtqFIXwvU5tNjDx
         lm46IkSKbgWPnkMI7S0dIgfsgjeaQw+atCK0rEJFvp4Kjs4B+vrE7G1UHpOgtBmxeapG
         iyAROhsTURjRzx9WpiqGe4tcbKDYDpk7wn32x0hcIyItG8Y7tiLLwfOnaP0J0eqPCKeB
         hpdtDYQG2k/gQqntAlhp/YB+jtC3psFTi92hNSRX+L58MtRypkSdb6EFYeJbHKzPh1zc
         rXaxqa7TWWHsRgwStB5tC7ml9cbomNYAHnnUXlCYnBwVtRNv9lxmJSbrzExRu+f6xDCI
         YMzg==
X-Gm-Message-State: APuU4Z9jzy9ULKJMNC8CMZqaGdUjHCG8x9PQTmSM0hkYuiZeafE9ui4G
	L50n13eqtPWB+B4CIciBXkqHyqz2kbOThZKMvdUZx20s+H+gMZEdAvlSLhtuJV7eLPLTrY1K2Q7
	Kexe9RgBPjcQ/VaCE3i6xAEZVEsPaMIdgGnTPjiRNuRfdYRLr4nVyUO5iUdA6ZV6j
X-Gm-Gg: AYBFou3Ar611X9LoWzdc4t8P98JFja+k9NVMTxh/Ld3K+jp6U6FtaFkeqyHvR6MUxRU
	wP7LpqzKHtxc7vPQSPbs+/nMISvwNv0U/nD9EgIH52ZKhruB0hL+R/GbJMAO84kFzVKv2/CbXv0
	aJhNbkDbV5uRYAcat+3NQ5tL5GBv38Ogoqa2VhqD3XF7aZW+8wogfcOVnx4gn6s1MmX61anphxi
	oJ+lmccq4JKYOcpb/5Op2N0Ra+FysGD8HLMm8RDQN/2eCC5hpUrWyPiZUCgG2gECqatVcjFavs3
	0rEFdESDrD43HPwQcszg8tZ2L2n03a3ZRZf80Kfra5Ltaj257dddHPr8bYqejyLuHGDBG5hWa9s
	jtKmgKW1A22wMPFUpV4wp2s5a3NOtzzxWSLSqju6pfYcV9HPffsD+pvZUHeBRYC4I5RQpFho6Ue
	M=
X-Received: by 2002:a05:7022:2606:b0:183:bebb:e93b with SMTP id a92af1059eb24-1ac563025cfmr26606515c88.6.1793799173758;
        Wed, 04 Nov 2026 05:32:53 -0800 (PST)
X-Received: by 2002:a05:7022:2606:b0:183:bebb:e93b with SMTP id a92af1059eb24-1ac563025cfmr26606466c88.6.1793799172841;
        Wed, 04 Nov 2026 05:32:52 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm9525741c88.18.2026.11.04.05.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:32:52 -0800 (PST)
Message-ID: <8a682b86-3a23-4c82-8959-7ee066f960f6@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:02:48 +0530
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
 <sashiko-outbox-193144@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-193144@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX0UhlpinJfbgv
 ONdZizxGEbIj42258goh5kL/NAuYnhTOde86239Bk1no/NugnWgZ9o8ujS7p1segnYclGbQdeZm
 NEmFn+Uxlg3EAOoxD7Hc2hIYF6pbLwI51xQqW1SFGBUuLlDCH4gu6f50VdbV2oeJpa8OMmCc/pJ
 Oai22MBFp5HCoYEb1+XnuW7YhPAYHNogXsXvvvjp6PL40Lp+Qu9Di61DJ87RRqHtdWhnn1Z9MM9
 KZJRAjkGtE4ATNI0oAmCVdgwSE73eM+7xFscnsPZV1gZ97n2jGitAIKGo+LcNAr4JKiX9uJPJia
 4xz4JwdC4M3Yiu/ZDFcjWn73rKTsZX7AfP3/GffC5wxVAw9yhIG7WQF8GYPwl1t2fDeh59AowX2
 GcnBASYlaqrH5BjX4TQheVHxjFdXHsxInOe7ag1S7TwZ2beY2djY0ZzoJZi2sPD0CQGxM5xy5Rc
 1/1q9ihdnLzOu7pbZfg==
X-Proofpoint-GUID: B1m_IgHxt053aKeE8tLh4mFByx2pMV0w
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb3407 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PAWBQAtbQnHvqMwJI70A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX9THvqtqoCuwz
 nHUIp63qScKsYmhF19/uTWpkMdaoZTRDI6WCISDweWCV7yuAIbGZmGwNo4O4iD6IPwtDjExkikG
 nZjRFthfpf+my5pkXA8uJ5SiHzRWdVU=
X-Proofpoint-ORIG-GUID: B1m_IgHxt053aKeE8tLh4mFByx2pMV0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040053



On 02-11-2026 14:28, sashiko-bot@kernel.org wrote:
>> +static const struct camss_resources glymur_resources = {
>> +	.version = CAMSS_X1E80100,
>> +	.pd_name = "top",
>> +	.tpg_res = tpg_res_x1e80100,
>> +	.csid_res = csid_res_x1e80100,
>> +	.vfe_res = vfe_res_x1e80100,
>> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
>> +	.icc_res = icc_res_x1e80100,
>> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>> +	.csiphy_num = 5,
>> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>> +};
> [Severity: High]
> Does leaving csiphy_res as NULL while setting csiphy_num = 5 cause a NULL
> pointer dereference when probing qcom,glymur-camss?
> 
> In the standalone PHY path, camss_probe() -> camss_init_subdevices() calls
> msm_csiphy_subdev_init(camss, i) for each port, which indexes
> camss->res->csiphy_res and dereferences res->csiphy.id:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
> 	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
> 	...
> 	csiphy->camss = camss;
> 	csiphy->id = res->csiphy.id;
> 	csiphy->res = &res->csiphy;
> }
> 
> Even if msm_csiphy_subdev_init() failed early (for example with
> -EPROBE_DEFER from devm_phy_get_by_of_node()), or if no remote PHY
> endpoints are enabled and camss_detect_legacy_phy() leaves
> camss->legacy_phy as true, camss_init_subdevices() also dereferences
> res->csiphy_res[i].csiphy.id:
> 
> drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
> 		if (camss->legacy_phy)
> 			ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
> 							    &res->csiphy_res[i],
> 							    res->csiphy_res[i].csiphy.id);
> 		else
> 			ret = msm_csiphy_subdev_init(camss, i);
> 		if (ret < 0) {
> 			dev_err(camss->dev, "csiphy %d init fail\n",
> 				res->csiphy_res[i].csiphy.id);
> 			return ret;
> 		}
> }
> 
> Furthermore, the standalone PHY subdev operations in
> drivers/media/platform/qcom/camss/camss-csiphy.c (via
> msm_csiphy_register_entity() -> csiphy_init_formats() ->
> csiphy_set_format() -> csiphy_try_format(), as well as
> csiphy_enum_mbus_code() and csiphy_stream_on()) unconditionally dereference
> csiphy->res->formats:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:csiphy_stream_on() {
> 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> }
> 
> Should glymur_resources provide a csiphy_res table (or should the CSIPHY
> init and format paths handle a NULL csiphy_res) so this doesn't crash at
> probe or runtime?

This is handled by the dependency called out in the cover letter:

Depends-on: https://lore.kernel.org/all/20261026224957.1115370-1-vz@kernel.org/

With that series applied, NULL csiphy_res is intentional for Glymur.

The standalone PHY path uses the DT port number as the CSIPHY id and
falls back to generic CSIPHY formats, so the NULL dereference should
not happen.
-- 
Regards,
Nihal Kumar Gupta

