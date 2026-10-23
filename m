Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756950;
	b=CxNp3LIrTpRAOuPOqvKoGu3m4EySk9Vv346VvVQDQR6m26NXATbD7NP2lYjGWpmT5NzT
	 3DjXFKC6K0Qb7OldGY4fteYbSpJVVjcre4iDpqc3LeyUIaEMmlikNVwKVSBydq11U5bJZ
	 j5xdJxbgspJJIywN20vby98pgdvqoWMTsu6niex9rtMWmgN4gqXypZf+WutPHA+uMsDTI
	 QV1FbcLqjf8dly45fCJdYAJ6zLmEMZt2he5lUfJyvde7FvzFvji5Bah6C6UpeWiPb1Uwx
	 tHTIfUuNmYNxZNkDj8mKnTr7Bx9zjlXOrwi0KDPbEvkNIINvT2x3Wm85lRC30MBgqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
	b=HssnoGpVDsd5TS4DKi3cylmlwSVxYB4TVp1o1+oSDv0GnYcUVn68PkjLT7qS3G8778ZL
	 kQBYe2wyJAGy6Iq33yzmPrdOthGFI2cxUk7YxI7lwwm+GRUKbWFtAvfkIBCXnxuRuJLrE
	 jtFzb+AMaOzw1gfnIzr7CNyUbRefEQBw+FvogCuKoVZZE0TFmegoFqkJ7lzL8MXPVl4KJ
	 9Cq6uOgceBUc4u+Pi0/98epEh5pLq2XMCPc/hDFIsDmomDYnInRaimFkh7lY856yK8pwC
	 dHyrwlApB6IPXxk5nUGdlA1B7G77yaZCS/AjYAxrIIbcO55Jf8NCq0JWNFNmT8nXiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmuK5q5Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F78606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F78606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgouW7ox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmuK5q5Z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYwU2965944
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=; b=ZgouW7oxVzfUAKZQ
	KOU0IWzlrr6Dubt2hR51UJT2qwDOEn+P6ShzEQm7KKeqvELfky49nvxULxXPo1sO
	MRBbZixXOE47+6dGMHosulbGpEn7aFALGJfApvVx/IJF96X0byW9h8SUmaOVobIV
	c06BsVXT9FIc9iP/8y9aSmzRp32MHWOHr5gVxuEYhsXVpP8ZV53NnjCa9Amlv/7c
	sLd083BmST4gquvl5Vaj3M6QwL3S7zE5y+ebEBeFdzRqPQlg43Pm7CA6GeTAu0cg
	HQWrgG5MInG7+AkPjKOAEHCYmirtmCnuaQyUZP0MbQDZqQMVnLcymKzA8eS45pV2
	BU8Yqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0m2fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:02:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso8117815ad.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756948; x=1793361748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=WmuK5q5ZTeqylQDqGNC2DbaPcDjuxK6bbDbjr+C8+daHeSA2CXW6RMF55VZpY3vyf2
         C+EjzsmHOO3nH0jUjgCeni3PhDSbqcyano1IEIf4HxMZKfQdvxwO8vSsihyv5406GlJC
         WHvEPrMnl4mkydwgzqE8GQAin6T4hQ/2N2orkciem5jIPajg9s7yL9qa8PIGTIO45sbC
         GJWXjUyfxqz0wGiBSr+ybVSF6xxMJIvpz9vD/DDpCiAqVQE75GAmmwC8zVq/7IzKaImR
         TZC/bGvU7deh3xNY7fJw/x4oHGMaD93Tbzhcxv6fJt2BbaLmzu75LL+Yve7LwicIV7mc
         Qc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756948; x=1793361748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GGmdXvwIAnulrKf4r+LcLf1PuI6wwGvA7L6rMhArNo=;
        b=SH5l5XARedH5so6oSg3fJMAA6Zltp48NstOp7OYhSnx2FV9jMxteOW1d61F9GvID/o
         Ud5c/ZO/DU6502f6Ql9n965pL+7mppI8aF7is9Bg4w7xkDho3ZheRf67QF8rPskSq4QM
         oAkXqkv9Td7HM6DtoE7GXa4OSFeVEpA+IAzNoqSAMyJTASURutfhnXGm+41cW/N5PY3v
         LAPdatafj6gGDDcpl5Mkqn3Y0juSHoXswA0+DybKYaopVheNlngKdkUYfcQhZSBAM0wO
         JMxKzAQjbVwTCd95TS3EUq3LA5vwAA1UcSRieEFpjeDw/XfuxjVl6l7RKaZBTKOuYRou
         ws1g==
X-Forwarded-Encrypted: i=1; AKwUvBwpALG8dOLtN8bNy3EeGiDV1LY7nmFg6US43TU2YHeYdGl0XXiBccNwX7RrUIo1Mnog0lliVvl4NQrr@vger.kernel.org
X-Gm-Message-State: AFq9FYI2OQwg8COOQF3V13TckEsn8jXVfjKVrY/EKaqc8B742OZbgzu+
	KT8gnNqmrjc3VZ+s2zLwksgApX/E81MZGAsEIIepqOQfMXPa9x0NlQd2Rt8bTjVGs21iIxnjShl
	ElMpR5DEVb3UsbgnMtUylBXrExLADssA7GwzsAuco8Q1UaZqyHeFbqMMvClu32l2R
X-Gm-Gg: AYBFou12kUw5R8PpRSTpDLsLB81KFSjtClIsSk05NffXdehSfeknRDAdxdtOIg9JPx7
	RRh0VHy0K9UMRj1L9yYp2+PCuHStmhBDoWJX3qfixmBcS4ZykrdefuZ6wQQaY96wnNhaiB7yHao
	3CgyJ7AkFviv1A5grJajVk79y2EVHs1F6H1YwmN5AebGWZO89KvMCQYPzwMnFT3dbrmGxfy/eXc
	zOW88Dsu+fAz22aZkp5FyD4fEEAPZT8GQ1eHKd7UJNU/+w2PkKEcHh74KEvrJzBBHsIz0j2CHuL
	bnvxoRx3+I/6jLjMshxkiv8TLd9NYmztOXXhyf5GUFunPXtakf5LOBBEr6X3B1drY652omA1Psx
	wElJi6qiIyir76LBpnaMysdv5khvl
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516499a91.61.1792756947578;
        Fri, 23 Oct 2026 05:02:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1350:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3adce136cf1mr1516163a91.61.1792756942520;
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd6c20fdsm41656a91.11.2026.10.23.05.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:02:22 -0700 (PDT)
Message-ID: <a8db08bd-a92b-4c8c-a9b0-0a637b57cf0f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:32:18 +0530
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
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171157@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171157@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dgXXs63VUSAuGYamp2-57xPKZJDhkP3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX8ojqWOh+gQdA
 3rLbvlJ6XIVJgnqV4DcJp88De+ekM6HXYGgCMrQKgI8s19Odfo1YrFuVprdOuYYFW+4XUqyQLCc
 Duvg9DiNc/rsRqMoUINeEHOPpzoF8Lz8rD0MPqAQoSpC8yQ/5yEzyItAiObvy3ov9pPmKx9G+EH
 FjuxlbHJrwURjdaTQ/6A4upPLP+QrsoH3z4l3Lxrm8pkoTfvgr4blVZt2CrP3jmKkXYyEgRFE97
 hMoRz/4SAvNwGQ5BDrizAZXkuYdW4mFCPqJH2Rn2WrNmmAnZQ/KKuwvYPZJ/JUyG237fZ8mWppg
 Uo/XdSSfEw5oG9stuZSStUSUlNpOwyvxP/P0Ix+U+c4uGsXccxe5LJG9ivFfhUhl6Lkxzh1MaC4
 31QyrVnQyb31vKdjju4+FvtJujs793Fqx43r7/hU2iUm5uHaBktDrpQl3QhpMX54AsOrzJNB8rA
 LqGKe794QX5uGSNROmw==
X-Proofpoint-GUID: dgXXs63VUSAuGYamp2-57xPKZJDhkP3L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXyxHKNwitlM1V
 HLNSsI1gE26ixond8x+bMbPAvwgeYqVzHZDkvK575Ieukj4emQUzq9FW3yPXzjleFtcBYZHemF7
 uEF8wyTD4Sm/QrRE52hX4JrOcKMvm4E=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb4cd4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b4OPtKER6HTDepoTwoAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

> commit 8f95e31f13fcffe905ad6efeb0bf108998166be9
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Subject: mfd: qcom-pm8008: Drop GPIO support
> 
> This commit drops the GPIO MFD cell and its associated peripheral and IRQ
> definitions from the PM8008 driver. It removes the GPIO elements from the
> peripherals enum, which reduces PM8008_NUM_PERIPHS from 4 to 2, and truncates
> pm8008_periph_base[] to 2 elements.
> 
> [Severity: High]
> In drivers/base/regmap/regmap-irq.c:read_irq_data(), max_main_bits is derived
> from chip->num_regs, which is now 2.
> 
> Due to an off-by-one bounds check, if bit 2 (the dropped GPIO1 interrupt) is
> set by the hardware in the main status register, the check "2 > 2" is false:
> 
> 			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
> 				if (i * map->format.val_bytes * 8 + b >
> 				    max_main_bits)
> 					break;
> 				ret = read_sub_irq_data(data, b);
> 
> This allows the framework to process bit 2 and call read_sub_irq_data() with
> b = 2.
> 
> In drivers/base/regmap/regmap-irq.c:read_sub_irq_data(), this leads to a memory
> overflow when writing to the status_buf array:
> 
> 		reg = data->get_irq_reg(data, chip->status_base, b);
> 		ret = regmap_read(map, reg, &data->status_buf[b]);
> 
> Since status_buf was allocated with size chip->num_regs (2), writing to
> data->status_buf[2] corrupts adjacent kernel memory.
> 
> Additionally, data->get_irq_reg() calls pm8008_get_irq_reg() in
> drivers/mfd/qcom-pm8008.c:
> 
> static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
> 				       unsigned int base, int index)
> {
> 	/* Simple linear addressing for the main status register */
> 	if (base == I2C_INTR_STATUS_BASE)
> 		return base + index;
> 
> 	return pm8008_periph_base[index] + base;
> }
> 
> When index is 2, reading pm8008_periph_base[2] reads past the end of the array
> because it was truncated to 2 elements.
> 
> Can reducing PM8008_NUM_PERIPHS lead to out-of-bounds accesses in
> data->status_buf[] and pm8008_periph_base[] if the physical GPIO1 interrupt
> still fires?
> 

I checked the HW documentation and I see that the GPIOs of both PM8008 and
PM8010 are not capable of generating interrupts. GPIO1 is used to send out
interrupts from the PMIC to the SoC and GPIO2 is used to reset the PMIC.
Since they would not have any bits in the main interrupt status register,
this issue cannot happen.

Thanks,
Jishnu


