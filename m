Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE71442FD1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959808; cv=none; b=fDyG/G3D7sGt2C75QLvPXLTb/5f6kUwGI0wuKG9kyL+CCA3C+PfAAkpnOWD5Z+clGqvd1Ae6PxcizCKJ9UMUJRJrd4E/CiZxxbgR0xpmjv4T/+nVQTM/J91s8vcbq85b52GJMjnC8IYLVZp6DTPZ18hz8KIFrNzj4/EVYwi+Y/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959808; c=relaxed/simple;
	bh=iXyqVSWvmcW331rAsdNhFo+83AVBlrw5mw/55ZewwM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVECCUMk9yUgpYzvMwn8h/GEVroT89fr6COr1ryvnTFX3BKkWbrEltUPsN+tJw1QAb8TQzTxfrqsXk5jUXUagZX1BHUG4SAXRTX+lIM/nH8QB8GwT7CDIONkrlDFH4X17fdDxambdBlQimSyaxyIM3EEMY+yvtX5oS1mzyuPgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsFEBh9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTLa7K25; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsFEBh9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTLa7K25"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CD9hw3054129
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=; b=JsFEBh9t1JX/nXmN
	5VuC1+yMKMrqmIlfarexpHaROym84F9Dsg7+UelBOay5JJFkHbgArMeHxhRvGiNF
	phK/vdWXHnPRHW5kZi0cAovhgqNi0zIktY160VDTLV1iz6zLI9027ewPhncNQ49i
	tVwiC+EufIqHQNx2oL+9eZdOyEpqcJtFz37kGUWpVAlpkasGWYWejMzMYIyZ4n2+
	0tPJIeCx+YRgbPYQDRr270x/qwC0VHfIIuulf3ewVKv2+UYRm2ntMxGCL+CPN5ff
	8Mf1cBTHFDTPlwiLWXYTv2vIs6Pz1CYlGYSeSOhV+G5zRxC3+4orlOMTDAOVl9c5
	FJ5Yww==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk79207dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:16:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso139520e0c.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959805; x=1789564605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=HTLa7K25vGodel9jy4rxVQekFCBfMC+cgH5HrZHx6irH78piA161tWbx0TMqZXF3Kn
         xmhPhDbCQDx+g2Hlo4oaZXp10BhQOoo3wzzODh5C182qEdlG9idBi4pET0wOjI9UXyv9
         FwEdWl69VlisqoDSDFuCm3ARk2pnmg4UEC6WkOnlHYcppIHdKnpd8OZvirdfeefhjDEG
         1ohV5zFQma1pzROAtziVPotjS8srajcFIp6465LJ2ogtWniZJaPk43ZHc+Uksl+EORPr
         /fLIT+Th5R9HTkqYqxQPI9Tm86hP375G33Mfvs1tCfBH8YsdAy9Tg9OTlJOe15I8GHTa
         EkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959805; x=1789564605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=khLzODo+zW+WluPxAINoScsw4T0sZ61NX1lF8wjDcZ3y5Nb8gNsvbzPoguYJyhR90O
         GArxNwns5OU0Wa8YXdlF7wDtIPBT2k0xVgDrc1VArGCHsoI25ddAX7BaIhoT9pZmvmq8
         2xv2dsMQKLbmdP0GtGcKl9fgwUwf1PJ+KtgHzyMZBDWKczrviEtF6KginUwsN33mOFj/
         LTsh4g6F9m8K0mMDKMJiMZ4ojkFX20fkUFg87nFiWZYqNiP7QVr2o99mOYutoFo8W/Wp
         8ZPZbr1mRjNtB6HP12I87Tm5YkkmAoxQOv19ZYqivHPLoii18Q5447l9CHhK091zl40U
         OS2A==
X-Forwarded-Encrypted: i=1; AKwUvBwsmtcwO54aALRah1KL3uzFQwNufn98EP893MnWFnGDccu+29v/lUDpO4ORUow4kKbC0PygsuEmv4vX@vger.kernel.org
X-Gm-Message-State: AFuF++nd2kQZ3946/o+Blo1CxTf6XzF5eBXn8r3ee4IOdsupO1kV5qI2
	SZhtfxpVkPW6TVZHuaL+N1Vwr0AuizU/5TuMvc7+0697agGpkK7F4dL4T0dfzrMThMJmuiSclCa
	1lfuc16T9D6ojxfITQam3hrlV0kBvoPpcEQfIy/faEbY84JYn6Qgq5ZJZREkVHA4Z
X-Gm-Gg: AYBFou2eieOCFIIYX63dTlvyFRSrdQDHnNJPkgwIkKJU4kPIyPXMd0M7EcRmHunKFJW
	mFtB/EzJyJFxhMaaZ+nG54P9LxT0gkuIGnA1J8kS53mBbgSNjpzMAAuN820VPqQKsggoLfl4fDa
	ZDPQGLd5DxpNS6Sw2NN0Zh+iD8Vm3idCpDfYdwD8TOspSvdsR8YIeGJpQ7OUa3vAWjKc/hXlcPE
	+bofuaVK/8OASH7vcL5+LUou4miXb7npFtAiHrs+2rnTBuwzuGKwJbuQbQGegtRXSgcPZEyAIz/
	SD4xOErKlbsyKhEbynZz22L7O4Wf+ilI/edXSmhG/sW8qFKre7vPKmQ3TS3VkJnEySROLYRFEH6
	EzrRO7/lTsrsQikwTWfPo6g==
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4813030e0c.2.1788959800330;
        Wed, 09 Sep 2026 06:16:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812434e0c.2.1788959794996;
        Wed, 09 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm3280227e87.50.2026.09.09.06.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <062d0fc6-dcae-4636-ae95-c8144317f0ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:16:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
 <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa15c3e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=DKkjQw_Nfd4kA1BEE-cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX5ejj9rVDNHmM
 dlooRtW1j7MfQf9qrHYF9b7XFfwm1aPbJtB64IPSkt//niPfunPZgObvJq16TOEv57FaF0Xj+LL
 RR2FcOdfRI7gPNFl8DjZ1z/Vr68Q73YJP6hiEg6gKe97pc4Xv6Lah2MS9sEIXMjZAt94QErfYC3
 CzVyEjZJAh5Gs3b0ZO48Qktj+JCFStAMNsBVM50+X60tQb4jaX+HMI9cNu2BkP6HKVDrGxgXlRC
 qtYHl6wSdsmvKAUsUmonDJakf4c0Luoqjw2zEbIGcaeatF/mg5lQQteTjH9HQLRcKthazp4jXGh
 THVE9M+YkBfDS70+YcQ7MaaJZjQBkj8gT83KTvc4L5OhQr/I02MliifFQNr8vInCAMFdUnjgCyd
 hNPm0JMmQaxtBU5vYZpbBKZs6To1+VxTcLB/ZUeioqzs7KKZbRgDv07fFj8B1pius4R/VghX7CZ
 F/And2x0//jL5Qxsv3A==
X-Proofpoint-ORIG-GUID: 1OiyO7i3gFJ7_UHL19Lk5afeb4_rsMvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX2EnNHh10yJz4
 dKkC26aneWjTy/d2pHrut6eO2V00QLtMzOws1AZmkEUBaEaThh+932bQAc2qIGKuJF5F39bF2BI
 MedylwB3E1B+vTna94crQ71e9+DI+5Q=
X-Proofpoint-GUID: 1OiyO7i3gFJ7_UHL19Lk5afeb4_rsMvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On 9/6/26 11:32 PM, David Heidelberg wrote:
> On 06/09/2026 23:11, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---

[...]

>> +    nfc_default: nfc-default-state {
>> +        pins = "gpio12", "gpio62", "gpio63", "gpio116";
> 
> here the verbosity may not be bad (device-tree functions as documentation too)
> gpio116 is associated with eSE NFC part (just guessing, but... it worked before, so), and generally the pn547 doesn't need it at all to work.
> 
> TBH not sure if there or what consensus is here about this. The eSE needs it, but we don't have the driver thus also no integration with NFC part.

The eSE driver would still be acting on the NFC node, right?

Konrad
