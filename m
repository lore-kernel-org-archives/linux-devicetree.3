Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722041C2E4
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721951; cv=none; b=Z5zj0EfKT3KaeFOUEs28MAdzOdbbNpBpR02scgSHym4HT0mGuvGb1R4uU5Qpl2t0rcv/6AmxMphKiYL4SD++aFj9LczVem4baAazw0xZK2yvCKqrSEH0pNr8UjmxBNbMq/42pSyXkr9CTGNa/OrmVCXe6XTrTUxF1y6ZFGTSnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721951; c=relaxed/simple;
	bh=dC53LB+tIJFwEpceDreJ+RnbTcm3iaaALK9p28NVu4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMAEyQGeDSrECOQnjf+lyvAXHVvuWhRDu/cquQ4E+M8qGgPhhFDQoXlnVbw3q8ill8nvNg2vAiHmymvMltLz/FbaVrn6ID+34ZvgfIfe0Zir67hgm6JT9OLdOnr77w93gz9epLNmqt2wOyMjfUMp27QPKG3N0j3t1UyNFhMTmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpqiyVvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcmfGhEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpqiyVvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcmfGhEI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TI3W2Z1723976
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=; b=dpqiyVvt/BaQ/8U7
	1/+1TgOtWsB4hQB98r6Jum0eHhnMlJIIXTrKIUHauRl5yKyWr6nH7Fd0N1c58biR
	CNSlKzyahQOcwW00nHjT+d6GeJYdLZ8Q00cFg5NuqGcT2v8dmGMvZgp9mz1rR2OZ
	93Ynafr9GH4nexu9FatkL2UIgjRTJLyFpiI6FhinDrrv/aiMMUBUIl3Jv5SdvdaY
	xvbQ6CeKlnlOCOpy8+kWeE76Rqo9P0m7nze7G+VQGk/wZrRfOV0XJeUBCv/JKslT
	3hVKDZD7rOYS29mXIxNC1XWEHavwtYjK2wOZamKIeaO98A5z6AQ4sNZhYGRb7Rs+
	5YbYQA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97s0ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:45:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so17601411eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790721948; x=1791326748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=;
        b=fcmfGhEIHULg+2CivHo85FcRq0vhAbgYYv84p9dqpLROdrzRjp2m4B/C7MAYuizUFI
         wU2skQorn3CYs/K9rS5Ywf0T3e7D4lF87SyDutp8sDo5qkBmS+RHeNMEPHEpx8jG0xkx
         xH9x+TYmznCST6qGMuq/4J2LZdwnsX65MTUC72a98IWWpLM0PL3n5Popd4OQBzZoE15E
         yQvLrVUq9hDbphJUZglwSM+S4COStwQMnuNvoynT/VfjkeENydQhbwo1OKp0NTYowjN7
         4cyjJkxLk3ccnMo6nODAY/hNnpUaOeo3NIY6OAV8jkvGZmFZSen6AS/3nl9J2prHjvR0
         G11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790721948; x=1791326748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=;
        b=cPDhgBZCBeQZiUm+r5NvuN4CBhTvLtUSbPiffzfuUiFAdQOPNqJK4D+IbiN6pRXfwS
         pei1XtWz3cKFCSuTXp2IOqho0snpZfYY4Ar89M+5W4rDvS7ylZco099NxE3MkgBiAIzW
         BZDzhMtkhCeyli+JLP4GSIQxMZOQlygkzKTXt29hujb6ZkrNVY3DBNIpg3idSQvIIoDT
         WuFnwJdFtLNYQ1VDIDI6+MathFDM4aPBdv9NMo27UdiNmJ/XXEH/eSgscHFmEJfPJh93
         P/Z0F5Wr0MOU9EevmMoWMs4Tbc229yAb/wtA24Sqzredek2qgBokJ9knw504IvrsvAkL
         31dg==
X-Forwarded-Encrypted: i=1; AKwUvBw7gJmcRfAmRdzpKxYORMjzIodEpRAN0Wuj4SrmaMCF+OfLhlNLGG4GYY4MjHJKbvuIM+iXANwLyGDb@vger.kernel.org
X-Gm-Message-State: AFq9FYJoBoRu3SV/8cslS9ddlbQxQNtACNM9rOTTiC/14Yno0n65V+K0
	5zt8a1a/6KyEbJJ2QuVspL4lgtYoFqwP1ueEG2qf4NLWTfcFME04LgiwRy2D9g8iXOQ5KxOMtpd
	YGK8WYwhQFKNyOF9NJBJhXfiuQNJv/rykMksWLC2U+2p3+oOw1bwnh/1KJLWqYo9d
X-Gm-Gg: AYBFou2gvGMSMCz/TFj8qeDhFU/w3cygcoZlo85DkdtpXkgAJXSAC4JlT+yAylCLPaV
	XbW6eYq9t4SDZAP2Fjxjftrk/io6ln2TCS3BTJycj+biQvRBdVFTpkm0bO4TtUcJIJFNUI674s+
	MUMUpcqyFxR9JLXQMasd4JpmVyF4Yth7qTWgpJu2bLx8pLVFp0NMH+VKVHDfil3cMuOna+F5tkj
	jVW/ychDRRV2XcwdR9Zn3RQX7IPINLnVPfMI76Xslo3OnPqbM4RgBIkNouK/dXkjqnZ7T5fawjN
	kS3ZLaSFNlanwxGIux9WXnk5s3H8qVMoYI4drnFwxBgROuQFYNQDaZ4LjR1Efcyr1fCXwCxQf1m
	+ii96VFv49DImjURNOE+zm9kiEjnvJ7Gb2EEQ0lhSuzT5tjNfqiAr9mtS
X-Received: by 2002:a05:693c:8382:10b0:34b:7e89:99d with SMTP id 5a478bee46e88-34c6558b73bmr961197eec.36.1790721947835;
        Tue, 29 Sep 2026 15:45:47 -0700 (PDT)
X-Received: by 2002:a05:693c:8382:10b0:34b:7e89:99d with SMTP id 5a478bee46e88-34c6558b73bmr961173eec.36.1790721947241;
        Tue, 29 Sep 2026 15:45:47 -0700 (PDT)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350be57bsm2775146eec.1.2026.09.29.15.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 15:45:45 -0700 (PDT)
Message-ID: <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:45:45 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
 <20260929214304.E1BDF1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260929214304.E1BDF1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _WGU92XPG6CAi2cLabasml9TDFaGYoqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfXxxlQg9ylqZ9i
 y7ILZoz96yBzSJvPe+Gzs6n/vPETuxwd9waSw2mDgZjMQZOQXuIWp0so1+HABgSUPTJuPMhsxoC
 5eKBEMmVHUCejdqJFcGSRk4Ah1Vr13TSD/nGmxuX7lQ2wS75mncvTA+VjYYnKK97JMukmYQ7Z5P
 CFpEcSJ5DAt5TtIzZuW2DJEY3tlv5Lwr/0k0zAQ8fbUcl5FRUmz1tHVDNJ+LrFt3azKlvuKYzY6
 sHT/MJXYOCbCoBk9cOAjzDhrdKeIBGF4nq7es4Il2BAiCf8OUfhZMGqAMFW3zlWhsI2EQ34dTFG
 g8FaSIPGnFgShEcb2iVhQCF/hIzQ7WJXAgeIB0+ljxvk0KwVHohrjnsVFI/522k/9AYvXwe6eGQ
 BZ8+vK+QcavGqYlzY5fVC1lRo3PD5D0mmdyx5P6TKtY+O0PG947UY8qTl76tuBY/fB1NzH7nh0N
 AiNnjNIRDfgIvmnkdiw==
X-Proofpoint-ORIG-GUID: _WGU92XPG6CAi2cLabasml9TDFaGYoqu
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abc3f9c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h59PC-ZenUpd4ZM43B4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX71XOTmvZ2rUE
 euTS3nXT2EOZ5QmGfIBhSfS9sP016ObIE7YQsVAEBMZjLIIxRmzR4XdjZ8F6qZ1nEDYL8MpgDVv
 DvuonwcOn/1xxgke+h0E+3jdhnIkT4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290090



On 9/29/2026 2:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] usb: qcom_eud: uninitialized software state blocks disabling EUD on boot
> --
> 
> commit 16556b4a5664eacf6eb75fc1fe5031d31c087dc0
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: improve enable_store API
> 
> This commit adds a state check in enable_store() to skip redundant hardware
> operations when the EUD is already in the desired state. It also improves
> error handling and logging when enabling or disabling the EUD.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index 48e474bdf818c..e227d05cfecd4 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> [ ... ]
>> @@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	/* Skip operation if already in desired state */
>> +	if (chip->enabled == enable)
>> +		return count;
> 
> [Severity: Medium]
> Will this early exit prevent users from disabling the hardware if the
> bootloader left the EUD enabled?
> 

A bootloader-enabled EUD has never been supported; the driver has
always assumed EUD is disabled at probe. Supporting it would need more
than syncing chip->enabled from the register. The driver would also have
to take the PHY votes and bring the role-switch state into line for the
active path. That is a separate feature and outside the scope of this
series.

Thanks
Elson

> Since eud_probe() initializes chip->enabled to false (typically via
> devm_kzalloc), it does not verify or synchronize the software state with
> the actual hardware state by reading the hardware control registers (e.g.,
> EUD_REG_CSR_EUD_EN).
> 
> If the bootloader leaves the EUD enabled, the hardware is active but
> chip->enabled is false.
> 
> If a user then writes 0 to the sysfs attribute to explicitly disable the
> EUD, this check evaluates to true (false == false) and returns early.
> 
> This bypasses the disable_eud() hardware routine, preventing the hardware
> from being disabled and potentially impacting power consumption or role
> switching.
> 
