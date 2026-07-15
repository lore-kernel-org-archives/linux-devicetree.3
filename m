Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35243FD17
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111082; cv=none; b=jZSgyQA0NWipXFziugwc9maXWtnbHGPBFVAw8L8DPORD42ifZcyfEDNyMWu/bI+nkGP1scUrrRZ510nmNIiiKq8xTSwZ/bfxDCBGRZ5MuK/DB+0YyPZeUyxIMiYS4VbgHi4lvjiYUdgaHufNebvw42TPsm5k0LKBlwW7Gig5IY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111082; c=relaxed/simple;
	bh=8Uv88TQVC/hVQ6ukLKOEoyEFgbMJcTvJDn3XGybrsLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPm9+WpLRbExYh+lZHyMLE8KSsi98JqHmujLCAqHd/c0nPfPcOjodVQRwJhr0aADa9irrjJp5dNJvVuFE6e2CVZIDXl/Ok/CqrrmBxa7TaKRBDMBHA+MxcX2UCLqRSTK9Nc+vnkN0KSt5Zfpf6XIPStSbhfIDaERaVWUh4KqiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bg4MieEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIxUylex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bg4MieEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIxUylex"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5CBF3547443
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=; b=bg4MieEJ4HMLznwR
	M7OcLr1PGdzng9O2fm23TE3o+vJImnddolRJ3/slBTG1vldKUKU414tVvtZrCcLF
	dgz2B81PGro355OCM5zNEAzXWN0MoNG+/8uEKpGUETpjASTcWi08B7CARvfi0Lo8
	ng2fhOGYoympn6P9L6uLvAFUgyiwMMQMIGCpH5kn9qKQoLju0nNbZ0bQIW0VYzF/
	Pb2Ve41tPYV++8N44syg3d2Q/udvd2olaKT91Gz9KuIWRuxxw6WJVoqWRY5WRR6M
	ohsYfj9UcROd0XzO4NfWU8BeKLBZ3lBoCK9lKqyupdshBigGMI2G6XZO9hR5YjR2
	Bfo8gg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe85582b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so12434571cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111079; x=1784715879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=;
        b=SIxUylexFRvu9ieQv9eK+x5n3jBxlWcZ7P6bFnitNr85Tw9TR+XYM1teYdOY220LVD
         xrEIZy7n6+Nj9D5Mb/jmq2juDsOzFpIOytBUDAuDQb6TMKPT46OeqxMycsD6/V0fbCUN
         5Vsmiz4UkgHGE18knJ9ajX2je7/UODwox2lke797eqqbBtfpEMHtDLOIeRRnKru0Nqqh
         Wf0rClKH27oC5/DWFZ04TIsmFi78H+aveAgS4TGkHuQ7oc7UA2x12u8SfbW3uenbBykv
         7FX13fjbY1FZKccbmMmmb3kz7uXGizQNCR31IUj2FZ3uJ2zuA40/za4rh1Q8ISH8Ni9s
         bTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111079; x=1784715879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=;
        b=AWNlnsusODiw+kT3eMmjmFN//ys/oM0uQ1fz7r3ifBFf4jdn0hhcLtMuSL4T3NI+Ty
         9WBAVrHhZTOhI++vrf0yvfbZtwyxIzg0Wj0bvwnPPY4rI9jqpMao9bkG1jalZn235qac
         /6WxxBbpk1Z4KJi9Z/T53GCR4Y8k31gxGHjusM/Vwh7uAIrpZW/DVepDZowqzxcrWgQr
         9xRLHpiYBGP3uYgHRYVRlg/MrY+jydXLapjsfk7V4+f8QkhTHOtKtT78SbjMyuP4rly9
         5rKKjW3qYMDgxXwJkf6mScKmX6WlH6bU9JFYZRGmZZ1kHrerJp3oPyt/WdduKsxYY4H8
         WrRw==
X-Forwarded-Encrypted: i=1; AHgh+RpNkkNku368Hj8VSjgdIxNx3jyew9cHpWq7zE5zlKgSmOqfe7s8wdZGAMJXBcP4hZLbb9bCGJz8eT/j@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHbFuaX0kDTg4Y/TwiajTFnNjS6ZB/Ik3aQTVpFU+8HLGOcf0
	eDo868pOYZUC64UTq2Se3nFQAfMNYNOoJI8K4vdX36qfLnWWPIDWFyzWHIPZ3dHttTT2NSLwLnR
	rz+coU4qm0R9DOIA2jOOYMKp/j3M5sGrWbjA4rda7vYM7/bELcoPJoZCwdteRnQ1k
X-Gm-Gg: AfdE7cn7Mmht1ucoAId9nTNxxfn5ZI6z/3LDXZmUGUhCtLnA+qNvGtYQIjMN5QksoX2
	gGrUH8S/afHY93mb+hp21MR0jNJHY2hXBjtrJ2+nGlAaNFYWaG9AJsin4YWozllXzQ4q4l1uZGY
	jew495C3nMk0Cj23YFkE/OSIQuodmZJDeBik9b9OK7Lsrc+tv9YVLqEH1jRdKNqUKIIWcMhEWKI
	HHENw2gveTJ4zFc7e9h3uNAE4k9RDWZeg2L6tQ+lrx0lVm5l5lptryJIR1tLvVVXP5+Eten1Rgn
	qj4b0TPp6BeV3bmIcHk1mHS5J6+b3LNSUS9x+KfonpH9NIIQK0X6E7THod8NKIcBDaKSIy9fb4a
	zMbqJzol5UjUIa1NNXya9NazxdKNlHaozOeA=
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr134936981cf.5.1784111078927;
        Wed, 15 Jul 2026 03:24:38 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr134936791cf.5.1784111078314;
        Wed, 15 Jul 2026 03:24:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262casm293366b.6.2026.07.15.03.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:37 -0700 (PDT)
Message-ID: <fa804ebb-eb99-4135-af99-7c85e1c381cf@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zZTlGmLMYqMIkLdc4w3_TXXhtsliH6Uu
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a575fe8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfXwkztxEOsXqDg
 kBZj+V6KbPRJOt2KZUJYZSi9tJTKhVOU1KDplgbaitoHJexdSyLDMqXoMet8M8BNKmW2DKg/+5x
 A/rTxN37lIxRTD29GrcUsrMEBSB5nDKKMC13XT38kJ/EFOLVCiwhXkYErbxD789AclXWLgTnmqM
 8FNIS9rAQ1FQ5qV5Z7kyE47ASoCpgNfQWDfwrqgGKFdsOlaZEkw5DK5+ctz9lX6eGWUFa23ZW8W
 9TCtGzhgLk99B84kWL3CK8NsnOqSj4YTvJzyD6RlNXin3OUi+e2l4Bf0sYLWGAh4ud770Tjphp3
 7f8odpvrL1w+ewXzDGwp+WrUkdYyqa/eYy0OmcPA232PsgE5pIezdE+iKUUB6x18xpWAVrdZYss
 c/Ok11NHJZ5JfQQiK5Y7l1SRIQ39oR7QE674RFVMxvoMGbIsJRAW3aMItje13sgwG0AAvK6t40Q
 cZ7F5dwQnJIzYEj99yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfX7NeW4vep3yPS
 M7D+Bx3zFqgyfNT47atZY/P1xJNaV8C3k5cX8NAjPVjQqfj8OAOKo9J+uOt9wP3bvJ5EsfMhTqb
 XiHG0zKj5lYV5PnNYxpwad01Slu+vGw=
X-Proofpoint-ORIG-GUID: zZTlGmLMYqMIkLdc4w3_TXXhtsliH6Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150101

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Describe the CDSP remoteproc along with the related SMP2P.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
