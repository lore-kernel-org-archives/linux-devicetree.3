Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8EC31F99E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983081; cv=none; b=dSHkJ3W/N6kx6jy8s6bcuqJ2zLQNfORkSJm24ETcuKA5VSs8lhRlcT6BEtODcjrgk2ZR/pZSBYvsqBybR+t7IM3qO3mW3v9fTHzDAuJDafnvs7DSN5swzHyS6XONWcw8pdQ01MHKhA1rynuIrfHN7yAZEq6UymXsaVT47POKDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983081; c=relaxed/simple;
	bh=KB/F9zDbox24hmdWEaQuHt/vKthh6m4mspjIl71ZAgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmg0Dl4f7MCsuxQPoCFqOqI80wn1x+0WwUL9CKuAXfnkza4LveRfBsa2IZEtWkun4J6mn8yTJVFdwF/fQ1Mb5O22/AgIuARhfypvsb9jv2Oz3Np5PQnciIw9dfC3Yz2vkZ9r42r+qfJToiEK4MFjNM5WJy8MlIbDAfMwntYxIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5g2Zn17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N03X6fBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5g2Zn17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N03X6fBy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wZoV1025952
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 05:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=; b=R5g2Zn17BMf/dfCB
	wLNowjpepKdcHO3r78m5TqQ9iysPlXLeqG1KYzJNv/ktzpvQRcfmzZWMhpNALB2O
	/2ugLPdCyxD74AKJIO6gtYmtjQaRboJNXLqYSNRBrVXs3KBdK/3szdfS+bWdchIn
	zQkALgZHiS7a3PBPN0ofQcz7R2UunnbPpc4lsh3Dun7sP9RRjDMCAZBe+VLe6XV/
	l1z0k4KM1VBcm9Hqj3J0nZPeKrSwuzGJK+QVMGmIm7YeBEebWHjA61cT/UiC/cFm
	KcL3Ip50dkvDbaHs96JunqISC0bzbRo3fweNGB2K90Mhe1yAr0MLyEnKoOzxv/Yb
	XNItAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunacjc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:31:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso68335695ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983079; x=1781587879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=;
        b=N03X6fByVH6nuZuooYC0hIe3m1hSbAUg+RatCqZn8SIU2GeCbzdEHDHh/ESG1CKph4
         DhbhO71T0Wrf3xasUcnJYNXfHj96gyRjD/rPcF55Te9QEHWxDbWZIaWBb96k/4TJ5P50
         oAQjHGnKp3LV6BukXGKLfbDYOVWuyvcQKo5RvMJ9dUu51ZWB1BOOF9i3C7tcxY1hUisj
         QL2vhSgcmoJAnNcdgW/ydPEgGfihc2qpi8F4Sdu/5fnG5diaQ752Dq012BYOSdjgwJ3t
         qkC3dpVhVpgFMz6AA/uaYE+DZpRZ+W+m/mS2kQK8eCR32yFDEpzkzQ2uxhbg7kuvjD0w
         ebTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983079; x=1781587879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=;
        b=kfiK0h/TkAB0xIl0QX+6hprOD16maGhElCHA2FycY8pXuer00sinxCDVUqeG4LNKap
         KZy5y5iS7cpH91iwkGeuKAULbxxYEmAWOsEK9uGMavXE8ybPCpdtH5l+XSOKaTFwMh1/
         B8mtVuKPuzTg2L/LgSs+ei3fx9F5H82Gllso2uVY1NcMaAmMRO19H99vdiZi/28DD+++
         wgD88MwedRomj2jIcqtJ35xb7XqOE+k/dODJrbCPzUSnEYQI7zClek8aDyxipS4QKnyS
         02OdxZ+ZsK5guPUc50vPVoRAPovbtTmHD9xQx4nhjO1GCATKe9bzCiPIoDJModBATKa3
         rxAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8305Xabntz90Y5TJtQqvpBHV2UsR+gT1MHEva3IRKYPw/ayW1Dt88iFgk7rgD+nfk1oBkNfbFyvdNe@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgVI+gkO227JS3Ir6velvU56I3ePDtbyGo7vGeGiMpag4ZdW2
	OvmwEpkqQ4r1XbWoHmYBf7OmlikB7/ZQeNbLkmcPPVjOjBC/pnZksnApLItr2ze7zKsqMANVk5g
	j3cnpaaa+5+KFAu6aDnAljVytzV6MMrtE9711kcOL+giHq+Rspr0xUjFB7TGRKoT3
X-Gm-Gg: Acq92OGrhDmlwVGlkQxWOMOlGNRQOMMhSX0Wp3ctkieR6Pwug94a9LdWp0+me9ozBjZ
	2xbhtENXMpmeownoAAzYrWYFArEH57I8zttToM2xBlsSHpfhhCC93xJKXvXauvCLcIf0Q19ugtu
	hr0GlcM3NfaFL1UCp4IHY61UpEXAeyFs/76XR+K+jq8TO54esFokKSjH8S4zgui8uRx3zrCi/+Q
	UU5l8HQNeMSQxG/f2SzuTpet5IsPet/FX2uPhi+vlps+K8EismvDsZs9vsSIaFPON6sEeKUNj8v
	9aR/3wRe8fNLAPXZ2Pj+NTiSkbFqPuGRkGp9BB6Jogn7BJGVUh6w22H+ObjKigN0bX+EjE5R4SZ
	dJ2QehM9CbdFGclU5/RF42AqS6oJd+1oz1PDtQipmHNmO9IT4/3Ay/+hCN8qJowdOzvk4kA==
X-Received: by 2002:a05:6a20:94ce:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b4cd0cf41bmr22219144637.45.1780983078658;
        Mon, 08 Jun 2026 22:31:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:94ce:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b4cd0cf41bmr22219103637.45.1780983078205;
        Mon, 08 Jun 2026 22:31:18 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0341f6sm17449711a12.7.2026.06.08.22.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:31:17 -0700 (PDT)
Message-ID: <26deb3c3-0645-4864-bac7-f0d221eeedbd@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:01:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <aieAnN35K_WarmUD@baldur>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <aieAnN35K_WarmUD@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OCBTYWx0ZWRfX3HiHlKWdElfb
 1bRCIKEVSV9G2bfdYr/DHcUeJvVDmmug2w3zE+lW7eL4iWIpbDoGdk/+K3MrEg5zYsgvHcSNky1
 MutEpo/RAkuxCzWXJ6HPOc4UpxsIirLJUiwVIVLJ36ndN9Krx5kRgK+R9h482tV/oyX87QbRaxR
 KW//zZi4Q213ovLwHnr8T2HlXejQps8ncImzszTRkN5zur7kEPOSLrP4kpHZsTL903IUnMSJy1H
 yguUrS/8iey+eAxK6R1qCbrdn4JqMcxpzu73UhvJZSAfkp3wtIfZC3SqgwvkrhDM2AtYv51B7Wi
 fQuFoGiLttOryL2ogItrGfJqNYafAHIjGtBK0ry67CdQg1hubwCE5IW6zWTk4zrmV1GBVYoxXBt
 l2XhtviXX75Y51vqx+03aCRj4JRC01bwx6nKg7W6cTtmr5l0bjt436oc10tfCc9lfZZQSIj05eA
 ssjtbexcEZ4Fdbt0rNg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a27a527 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xB39o6WwYaDxnCAkqHAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: t0JfyVPUSsPcHqppz6uytY6lQjNIUhsI
X-Proofpoint-GUID: t0JfyVPUSsPcHqppz6uytY6lQjNIUhsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090048



On 6/9/2026 8:29 AM, Bjorn Andersson wrote:
> On Wed, May 20, 2026 at 12:56:16AM +0530, Vignesh Viswanathan wrote:
>> Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
>> bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
>> driver to support IPQ9650 CDSP remoteproc.
>>
>> This series depends on [1], [2] and [3] to functionally bring up the CDSP
>> remoteproc on IPQ9650, but does not contain any compilation dependencies.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/
> 
> I'm not able to determine why this is a dependency from cover letter,
> commit messages, or the patches. If you have a dependency on this series
> this isn't your typical PAS-based subsystem, so describing what it is in
> the cover letter would be wonderful.

Ack, will describe it better in the next version.

> 
>> [2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
>> [3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t
> 
> #3 is a fundamental part of the addition of this remoteproc driver and
> the solution would be better reviewed as a whole - so you should send
> the two parts in the same series.

Sure, as mentioned in the cdsp power thread, I'll make this a separate 
driver instead of adding it to the standard PAS driver.

> 
> PS. If you run "git log --oneline" you will see that there shouldn't be
> a "drivers:" prefix in your subject.

Ack.

Thanks,
Vignesh
> 
> Regards,
> Bjorn
> 
>>
>> ---
>> Vignesh Viswanathan (2):
>>       dt-bindings: remoteproc: Document IPQ9650 Compute DSP
>>       drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP
>>
>>  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
>>  drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
>>  2 files changed, 172 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
>> change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3
>>
>> Best regards,
>> -- 
>> Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>

